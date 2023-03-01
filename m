Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36777A32
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 08:56:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FF5A1FE14;
	Wed,  1 Mar 2023 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677660980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPjvAJ27QIWAFz02jhn1lb/VWtsRhutV7st1KFkwjgg=;
	b=nX8bp6IB+yCThfgjF9R+mgzvEi+kVN1hmiT54RafAM8PB3XW0JZLDhNARZdFcqXdYxu5ju
	WyVXfNWSN19Q/ov9xdih0uCOy31JEsif8DEEuAa+YUHt0c5UGjVX+criZ1mIfqTREUIlEn
	rnO6yUH8DpbHYkHApdeupRLsnkBMELg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677660980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPjvAJ27QIWAFz02jhn1lb/VWtsRhutV7st1KFkwjgg=;
	b=xVTN4VqY32OMdt68x0tOoxiAcKPpXW+RLDOyMawlf+PnL+L8MkciOxylwWSbzGy+nMkNVT
	oG+EmRlJMs6ZqTBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B10B13A3E;
	Wed,  1 Mar 2023 08:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qX86CTQT/2MydQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 01 Mar 2023 08:56:20 +0000
Date: Wed, 1 Mar 2023 09:56:18 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Jon Lange <jlange@microsoft.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Message-ID: <Y/8TMl9M3WmDRBoG@suse.de>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de>
 <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
 <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y/mrpV/pPxUontKF@suse.de>
 <MN0PR21MB30720428EC5692B2E9BE29FACAAF9@MN0PR21MB3072.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN0PR21MB30720428EC5692B2E9BE29FACAAF9@MN0PR21MB3072.namprd21.prod.outlook.com>

Hi Jon,

On Mon, Feb 27, 2023 at 05:03:07PM +0000, Jon Lange wrote:
> It's true that the SVSM will not know if it is under attack in these
> circumstances.  However, delivery of the #NPF prevents the SVSM from
> making any forward progress, which is equivalent to a denial of
> service.

Right, I sometimes forget there there is no guarantee for forward
progress, just for confidentiality in SEV-SNP VMs (and CoCo VMs in
general).

The interesting question here is how RMPADJUST behaves when it tries to
revoke the VMSA flag of a VMSA page that is currently executing.
Documentation does not state an IN_USE error code return, so I guess it
will also cause an #NPF.

> Is there a reason a failure code is useful instead of just blocking
> (or spinning) in the SVSM until execution can complete successfully?
> This situation can only arise in the face of a malicious VMM, and such
> blocking is no different than the (malicious) VMM choosing not to
> schedule the VM at all.  Is there something uniquely useful the higher
> VMPL would achieve from observing a failure code instead of just
> waiting for completion?

It would allow the VM to make forward progress, but in a situation where
it is under attack this is probably a bad idea anyway.
After some more thinking I came to the conclusion that the VM must make
sure that to-be-retired VMSAs point to a code-path where it can not
escape anymore, like an AP-HLT loop with a zeroed IDT. This is important
to consider also for higher-level VMPLs.

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

