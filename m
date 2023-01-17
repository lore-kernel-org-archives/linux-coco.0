Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9D28EC
	for <linux-coco@lists.linux.dev>; Tue, 17 Jan 2023 16:53:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADE5A1FE2A;
	Tue, 17 Jan 2023 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673974414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnF3rY3hhl3VAU0u6KHRzTWuKDAX3oC2gqTvMtFc/20=;
	b=euThYpH6iAYbdBFYMLhNtRM+Yr8qc2D/O5y/G2XCJDNQe6V9IOZkmyJhElFAt2ASbhnCCW
	ebV6E1KDGrgJpQi2zLwXWniXj8+4N3LhX+LVs5XU3RMvxQYgwCLhz+nMdOM/vVCXlj8m1T
	ibOH3rbqsryIY8RrTwxqHSF4DRBXRPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673974414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnF3rY3hhl3VAU0u6KHRzTWuKDAX3oC2gqTvMtFc/20=;
	b=UEGjVl1ZBBl4xDzF7AqQ8REUx6GhNz4ZN+mTyryYf4SvFRszCJtDx+qs5TrDi+ZZRQv6Uw
	FqiYpJivLLanuTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 836401390C;
	Tue, 17 Jan 2023 16:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sPWdHo7SxmOVewAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 17 Jan 2023 16:53:34 +0000
Date: Tue, 17 Jan 2023 17:53:33 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>, linux-coco@lists.linux.dev,
	amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8bSjVLLzF87X7V3@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
 <Y8Gi0KLj5JbhCqBE@redhat.com>
 <Y8Lhd/H4yGTsOM/+@suse.de>
 <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
 <Y8WBmNVD8DuRQuC2@suse.de>
 <Y8WFnFAzPrFiDHNP@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8WFnFAzPrFiDHNP@redhat.com>

On Mon, Jan 16, 2023 at 05:13:00PM +0000, Daniel P. Berrangé wrote:
> IMHO it is undesirable to build a reliance on a specific bootloader.
> 
> My desire is that we have the stateful TPM in SVSM, such that once
> the UEFI firmware starts everything functions identically to how
> it would in bare metal or non-confidential VMs with a TPM. eg the
> ability to use all the normal Linux tools, and especially the
> standard systemd integration with LUKS and TPMs.

Yes, a secure stateful TPM is my goal as well. Btw, I thought a bit more
about your proposal, and if the injected secret at SVSM init time is the
TPM state, then the SVSM will keep the actual secret (== LUKS key) sealed
until the boot measurements (bootloader + configuration) happened.

This invalidates the attack I described earlier in this thread, as
injected software from the CSP still has no way to fake these
measurments to do the unsealing.

After the bootloader gets the LUKS key it can load kernel and initrd
from encrypted storage, so that there is no immediate need to measure
those.

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

