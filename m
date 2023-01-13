Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B77EF
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 17:22:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECE366BE3D;
	Fri, 13 Jan 2023 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673630559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLD4PBF6c+KgQrBHiXG1/dot4KB4y6EdDEbjfNpOn9g=;
	b=Ld8jLHKE+BNbWEPAl3m2tdYp6RmkqMP3FRuXEOLEpaApsF7l+UwmmAAp3Hax/PACN5Gxh9
	EbAVLxrXtA9ntjX3doY6YD5esQZz9vftIGu+WqrhcIcaMWVxmczuEOOSPkOeeGkJFdoQUh
	omBXDuX+fmmi3uQ8chreVhIhEKP/voo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673630559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLD4PBF6c+KgQrBHiXG1/dot4KB4y6EdDEbjfNpOn9g=;
	b=/Zv0R2sXYgTTVsml9ghr7GWA09tbGeRhaazq+I9ecSKaKtPKbM6w3c10CZ9wTn7i8rs1va
	yB/9SuT3Izw0boCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C85AB13913;
	Fri, 13 Jan 2023 17:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id slZdL1+TwWNBcAAAMHmgww
	(envelope-from <jroedel@suse.de>); Fri, 13 Jan 2023 17:22:39 +0000
Date: Fri, 13 Jan 2023 18:22:38 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8GTXpfqlOe53cEr@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8AbnM0cnKfXXW23@redhat.com>

Hi Daniel,

On Thu, Jan 12, 2023 at 02:39:24PM +0000, Daniel P. Berrangé wrote:
>  4. SVSM requests an attestation report from SEV-SNP firmware, embedding a
>     hash of the attestation server public key and its own public key.
> 
>  5. SVSM transmits the attestation report and the two public keys on the ISA
>     serial port

This basically emulates the secret injection mechanism that was
implemented for SEV and SEV-ES by the firmware, right?

I see a problem here which allows a potential host owner to steal
the secrets from the attestation server. Maybe I am wrong, but I think
the following is possible with the above sequence:

	1. Host owner sets up a CVM like the guest owner would do, with
	   the same SVSM and Firmware binaries, same initial state and
	   so on, so that the initial measurement is the same as if the
	   VM was setup by the guest owner.

	2. Host owner attaches a different disk image with malicious
	   content, e.g. a boot loader that sends the secrets to the host
	   owner.

	3. SVSM and attestation server have no way of detecting this,
	   because the disk image is not part of the initial measurement
	   from the SNP firmware. So above sequence would complete and
	   SVSM gets the secrets from the attestation server.

	4. The malicious software loaded from the disk image gets access
	   to the secrets and sends them to the host owner.

	4. Host owner can use the guest owners secrets to steal data
	   from the encrypted disk image the guest owner provided.

To prevent this it is necessary that the measurement sent to the
attestation server includes all software and data which is
executed/loaded from unencrypted storage. For example, in a common boot
flow it needs to include the Grub binary and Grub configuration.

But these parts are not included in the initial measurement that the
SVSM gets from the SNP firmware.

Regards,

	Joerg
