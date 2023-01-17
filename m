Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF4228EC
	for <linux-coco@lists.linux.dev>; Tue, 17 Jan 2023 16:47:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D615C389CE;
	Tue, 17 Jan 2023 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673974059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEZKFef1T5RttN7XH+hJ2FyadE3NPlAgKzu69vtBVRg=;
	b=bYd4TJTGUyWuVQYkhS9vGhUut3BFdla8kumIr440UG7bipIo8e/gW2TZJx/GHVTHILE+QU
	kXakM2ZS+1XCNzapqrSfAzFw/UckVDohK2/oJ2kgfsYfvEl84Tf4BZsdzzHZjxHyPR+e0o
	onqgPzk+MX9I4KoVCFVYNPT79KmGPDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673974059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEZKFef1T5RttN7XH+hJ2FyadE3NPlAgKzu69vtBVRg=;
	b=D6KXjQQvRfwR2ohvbWua4GLohV00/FWOXU4dtyT7Est+m3dTJ36apYlad5IMPVgHbi94Ge
	YGpodapP4U2qPGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC25013357;
	Tue, 17 Jan 2023 16:47:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xnd7KCvRxmNbeAAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 17 Jan 2023 16:47:39 +0000
Date: Tue, 17 Jan 2023 17:47:38 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8bRKifybo1vJbJ5@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
 <Y8Lhd/H4yGTsOM/+@suse.de>
 <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
 <Y8WBmNVD8DuRQuC2@suse.de>
 <c9138bd720f94f74bf8af1d305d79857a70ef765.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9138bd720f94f74bf8af1d305d79857a70ef765.camel@linux.ibm.com>

On Mon, Jan 16, 2023 at 11:59:17AM -0500, James Bottomley wrote:
> Not necessarily.  We're prototyping it with an intermediate parent key
> which can be injected after measurement using the keylime facility.

Okay, that way we can defer TPM secret deployment to the time grub runs,
at least in our case where /boot is encrypted.

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

