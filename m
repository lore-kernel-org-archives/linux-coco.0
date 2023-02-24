Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EBE539D
	for <linux-coco@lists.linux.dev>; Fri, 24 Feb 2023 14:15:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F50338D66;
	Fri, 24 Feb 2023 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677248114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIr4OLobe1v9ePshBpCN8LwHWFlIkxYQxMPkC5Bofyw=;
	b=D2fLuqLMUcm999YHuqQ24yyHy5lPluZyGsTljmq4AUjWOaagBU4CRnM/Ns7afZ4+/F2E+n
	0AH91pkxkkpgEAi2lXsNrh5yTiFx9tI3UVuImEyKNNMhNloLCCs4mJnLBY1c4LT/SqX5Yn
	2UeAUaC1IHv+AwNgjTDYt2dQeMCYH1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677248114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIr4OLobe1v9ePshBpCN8LwHWFlIkxYQxMPkC5Bofyw=;
	b=QPyWpWAY1BcXFey8PtOcpY44Lx4VfokAKq+A35WChbdGp3f+EQhLrgdaFRuxoCWqptZiVy
	kqeaY0tYv1BIlIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FC7513246;
	Fri, 24 Feb 2023 14:15:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VTADEnLG+GO4YgAAMHmgww
	(envelope-from <jroedel@suse.de>); Fri, 24 Feb 2023 14:15:14 +0000
Date: Fri, 24 Feb 2023 15:15:12 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Message-ID: <Y/jGcMhXfEm8MCYK@suse.de>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de>
 <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <069c74a5-2735-adba-5748-090e80550c9e@amd.com>

On Tue, Feb 21, 2023 at 04:07:46PM -0600, Tom Lendacky wrote:
> VCPU create doesn't actually replace the VMSA from the hypervisor point of
> view. The guest is still required to invoke the GHCB interface to notify the
> hypervisor.
> 
> The SVSM PoC leaves any current VMSA in the list of all VMSAs, but does
> replace the current / in-use version of the VMSA for the specified VCPU.
> This is used to examine the register associated with a request, so the guest
> can shoot itself in the foot if it doesn't switch that VCPU to the new VMSA.
> 
> I'm ok with either doing that or, as you suggest below, checking if there's
> an existing VMSA for the VMPL level and failing the request until the the
> existing VMSA is deleted. That does require the deletion/creation to be
> offloaded to another VCPU, though (unless we allow the self-deletion change
> talked about below).

Yeah, so the current protocol expects a bit too much from the code
running at VMPL1 for my personal taste. I think it would be better if we
put some constraints into the handling of CREATE_VCPU and DELETE_VCPU
calls to keep the number of pages marked as VMSA as small as possible.

With the current semantics the guest is required to call DELETE_VCPU on
any VMSA it no longer uses. But it is not required to do so. Also there
is a race window between switching to the new VMSA and deleting the old
one where the HV could run the old and the new VMSA in parallel.

The SVSM will not get to see any old VMSA before it is retired (e.g. to
clear EFER.SVME and make it invalid) until the DELETE_VCPU call, but at
that time the new VMSA could already be running.

I don't think we can fully prevent such attacks, but we can make them
more complicated by having some constraints who and when VCPUs can be
created and deleted.

In particular:

	1) VCPUs can only delete themselves. Exception is VCPU 0
	   (or whichever VCPU the BSP is).

	2) VCPUs can only be created for same or higher VMPLs on any
	   VCPU in the guest, given that there is no VMSA configured for
	   this (VCPU, VMPL) combination.

These are constraints the SVSM can enforce and it should keep the number
of VMSAs in the system minimal.

It requires some changes to the current OVMF patches for SNP and SVSM,
though.

> It might be desirable to allow another APIC to delete a VMSA. Maybe kexec
> processing would be able to benefit from that.

Yeah, maybe. On the other side kexec would benefit if VCPUs delete
themselves in the old kernel. Otherwise the new kernel needs to find the
VMSA GPAs und delete them manually.

There is already a code-path for kexec/kdump where the non-boot CPUs are
parked. This could be instrumented. If a VCPU deletes itself the SVSM
will go into HLT until a new VCPU is created.

> Should the clearing of the SVME bit fail, then a FAIL_INUSE return code
> would be returned. I wouldn't think that the synchronization would be that
> difficult, but I'm not sure. If we do allow self-deletion, then, I agree,
> that would work nicely.

The question here is, can we reliably detect within the SVSM that
clearing EFER.SVME failed?

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

