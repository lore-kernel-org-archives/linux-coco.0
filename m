Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82523AD
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 09:19:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EDD9A33935;
	Wed, 22 Mar 2023 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679476759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86WAXgr037FRvrv00CobmumLZdMEQGnDLNi0ZNwoT4E=;
	b=fuwE7AabSbu2e2JS2kLEdedDo78y7FCrAp141UihCtbFEu6APGDjh0MKD+PK0sM1UjFCmL
	mwr4l7dGbNDSsCBVPyPRHF75bB/AScZeVrUeA4OGJAP3FmgxMZUsdMagCvls+8QiIrFqOE
	oCyXVpa+kvocJjYvppJWSwY4+ICWwXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679476759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86WAXgr037FRvrv00CobmumLZdMEQGnDLNi0ZNwoT4E=;
	b=NWkh/EVOIAQtd4HzmdT6V2Pv0Jf4Fxd9fPKIzXBbmOCNlMtLxrnm7rDl158IffgfujHN3g
	/izUXeae4fYL5jCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C594C13416;
	Wed, 22 Mar 2023 09:19:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xAm6LhfIGmSIYAAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 22 Mar 2023 09:19:19 +0000
Date: Wed, 22 Mar 2023 10:19:18 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBrIFnlPeCsP0x2g@suse.de>
References: <ZBl4592947wC7WKI@suse.de>
 <ZBnH600JIw1saZZ7@work-vm>
 <ZBnMZsWMJMkxOelX@suse.de>
 <ZBnhtEsMhuvwfY75@work-vm>
 <ZBn/ZbFwT9emf5zw@suse.de>
 <ZBoLVktt77F9paNV@work-vm>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBoLVktt77F9paNV@work-vm>

On Tue, Mar 21, 2023 at 07:53:58PM +0000, Dr. David Alan Gilbert wrote:
> OK; the other thing that needs to get nailed down for the vTPM's is the
> relationship between the vTPM attestation and the SEV attestation.
> i.e. how to prove that the vTPM you're dealing with is from an SNP host.
> (Azure have a hack of putting an SNP attestation report into the vTPM
> NVRAM; see
> https://github.com/Azure/confidential-computing-cvm-guest-attestation/blob/main/cvm-guest-attestation.md
> )

When using the SVSM TPM protocol it should be proven already that the
vTPM is part of the SNP trusted base, no? The TPM communication is
implicitly encrypted by the VMs memory key and the SEV attestation
report proves that the correct vTPM is executing.

Regards,

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

