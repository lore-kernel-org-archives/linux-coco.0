Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36753C1E
	for <linux-coco@lists.linux.dev>; Wed, 15 Feb 2023 09:49:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBBDB22602;
	Wed, 15 Feb 2023 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676454567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqWpoqNP7XGFPG5yXaC/spNlXhij6/YQ0c0FSAIRYqA=;
	b=IKWNo+K/RCN2j98jZfDsW36zzx/ldN1YFNysDF9lnjod+HEU9+zXi+lykYm0P+eJTreBOd
	BLpkGK8HdthgDHY5GFne5yVGJSeU2HJ0oNZ/ngAt7r/jglsEmLeld+eLkX2MRmNgIw77VO
	FMbnuGwpalXMIWuWt844hPkPHGmnoYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676454567;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqWpoqNP7XGFPG5yXaC/spNlXhij6/YQ0c0FSAIRYqA=;
	b=6iCNhiaoWpq26npFIJiP8sPzf5QgxuIigCDeZr+tIrvy/xvz/WsGtCxlpxW/JO4H6yrInT
	tCt54QWYMKesdVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8F5D13483;
	Wed, 15 Feb 2023 09:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wY2XL6eq7GN6AQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 15 Feb 2023 09:49:27 +0000
Date: Wed, 15 Feb 2023 10:49:26 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Message-ID: <Y+yqpq+S3N/lIKjQ@suse.de>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>

Hi Tom,

On Wed, Feb 08, 2023 at 03:55:34PM -0600, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with feedback
> incorporated from the previous review. Please take a look and reply with any
> feedback you may have.

Thanks for your work on the new specification. I was reading through and
have some thoughts on the handling of SVSM_CORE_CREATE_VCPU and
SVSM_CORE_DELETE_VCPU calls. I think a few corner cases with these
commands should be better defined.

The underlying problem is that the SVSM can only handle one VMSA per
(apic_id, vmpl) combination. So what happens if:

	1) A new VCPU is created for an (apic_id, vmpl) tuple where
	   there is already a VMSA, should the call fail or should the
	   existing VMSA be implicitly shut down and replaced by the new
	   one? The latter case can fail if the existing VMSA is
	   currently in use (depending on how it is implemented).

	2) Who can delete VCPUs? Can a (apic_id, vmpl) VMSA only be
	   deleted from a lower VMPL running on the same apic_id? Or can
	   other apic_ids delete it too?

	3) What happens if a given VMSA for a VCPU is deleted. Should
	   that be not allowed or should the SVSM gracefully handle
	   that.

I have some thoughts on how to handle these cases, but want to put that
up for discussion here. For 1) I think it is best to fail VCPU creation
if there is already one for the (apic_id, vmpl) combination, requiring
the guest to delete the VCPU first. This is related to 3) where I think
the SVSM should just go into HLT when there is no higher-level VMSA
anymore. When it wakes up from HLT it can check whether a VMSA was
created and continue executing it.

For 2) I am a bit undecided, letting VCPUs only delete itself would
simplify things on the SVSM side. Allowing other VCPUs to delete VMSAs
needs quite some synchronization or could fail entirely if the VMSA is
currently executing.

Thoughts?

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

