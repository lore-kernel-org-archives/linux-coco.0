Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DF8D2E1
	for <linux-coco@lists.linux.dev>; Sat, 25 Feb 2023 06:33:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD93160E0A;
	Sat, 25 Feb 2023 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677306790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMCYJNh7n54LtkoKleUbXzYr8mJwUAgPQG6evbEwEG0=;
	b=NUKVbdv14sILHDq20hxOH4Q8G6J8utghU4SsDh6u2TWiTzInXh6+BHfFNSE/k2hRIo2X9l
	8fqTKmiz5VUhKp+CyjhJtBF5eT46LxzevKoz3mpg02IHWx4Z836Nk4MtT6u47hyNNwUTWe
	1ICePGyLvv5aEdGonhTthjXLPRYQIzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677306790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMCYJNh7n54LtkoKleUbXzYr8mJwUAgPQG6evbEwEG0=;
	b=XiMKU2mZd+9JnQONXDcApvKUR2mjTD1w8Z29S97C5Z76Rrb4ABqJJquwLd/5+qJsDNfAlh
	+4DNS6Qj0OpQnuAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A780713A42;
	Sat, 25 Feb 2023 06:33:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x+BUJ6ar+WPqGAAAMHmgww
	(envelope-from <jroedel@suse.de>); Sat, 25 Feb 2023 06:33:10 +0000
Date: Sat, 25 Feb 2023 07:33:09 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Jon Lange <jlange@microsoft.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Message-ID: <Y/mrpV/pPxUontKF@suse.de>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de>
 <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
 <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>

On Fri, Feb 24, 2023 at 07:02:21PM +0000, Jon Lange wrote:
> If the target VMSA is running, then the attempt by the SVSM to access
> it will generate #NPF since the RMP entry for the running VMSA is
> modified to a locked state while the VMSA is running.  This means that
> if the SVSM observes that the instruction that clears EFER.SVME
> retires, then it must have succeeded, and the next time the VMSA is
> selected to run, it will fail with a non-canonical VM state.

Yes, that #NPF happening is what Tom told me too. That is a bit
unfortunate, though, since that #NPF gives control to the HV and we
don't have a way to handle the situation within the SVSM. Best case is
that the HV kills the VM when this happens, worst case is that it loops
over that #NPF as long as the VMSA is running.

In any case the SVSM will not _know_ that the VMSA was busy and can not
return the FAIL_INUSE error to the higher VMPL. We can partially work
around that by manually tracking the busy state within the SVSM. But
that doesn't protect from a malicious HV which randomly executes VMSAs.

Anyway, that's the way it is, I guess. 

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

