Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB13B584F
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482683; cv=none; b=iW1IiuXr6GS8nE/IUICkTR8jsSLpFBUE9TKcrGVrTKndt6bPf01iKIPKFWrwg7Jmj/PhZOL+MeU96y1k8nZvaY0Hz1dblVaA9+jC+zh72qaQ4SVxlTQmtflKjJADKuFRpIc9++k4zxs857Ds1ELrFQ9r5DkK+r+Vh3dP2QfPnjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482683; c=relaxed/simple;
	bh=wgiHkbU+yT0wAsLAa4BYS1bLM7Wzx46WXTyUlhOUfAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sBnGME3fBYXJYnu6RLGJUKE6nNTCRKFlr8BtDtsWfyBkKoh22zq2/e71f98vG9Hx26RYBPknHep17rdoijLfqwSiqwBjVULWD6pVKy36tWr/98TymhzZq0bBlYyO1SSINgBJFODn4aj3NzwEd6yxPWHd+gPVzeukM7rYLGHatR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jrwU1/2g; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jrwU1/2g"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39dc5d85a9cso3641858a91.2
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789482681; x=1790087481; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxCVdsnW3ZSI7KLXQLXPZOQXUZHRc3cqhqBZH7/A718=;
        b=jrwU1/2gtbTikbTZNFy48TrSVAYi7X3s6l6DRFaHCYuRjCwngwTId0soOYAf8l/O0F
         C9UDVUjCoqXUXI1+CgJvyg55aEVYIOBz1yC4xHindZFGc5QzYI19lZJKcQlb63zXgGdI
         HuDTa3WFKeIa0pn9mYuYtGcnK/lPNb14FVWgqBioWBFultW+1MjHZGFc/llv7XKy1GPr
         iAsZvAdTW37wPGHqTLRb4NKtllHeupM+si51PQN1VNjzIv10t259pcxjPkDxoAmIB/mF
         8OZEcIPwgeJp181A4Z1ZC3KAuWUmjsH5poYLnMs6bpLMLY7x6NsKkP8BANp6IpWVyy/n
         i40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482681; x=1790087481;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxCVdsnW3ZSI7KLXQLXPZOQXUZHRc3cqhqBZH7/A718=;
        b=EcrRn3HSnn65hHkYR9nuIFDx8QUjqzoc5JHeX9OTkRkU16wJThpIq2HUbLafntB2ZO
         +yg9Fg5y4ENjlcUt//pHkis+sPULwjd4E8S2sI6BTXJT1VIixCBmIVMAr0exJx+GPdtp
         VfTTt66FlxooZyl9QIvT67k7Ej06zy1VFgCWdf/RYf8CqrUFeJUQu5glsY2tDhWtlg4u
         vZws+AshlV7t56npisEsejr1N7+lUMIQtLYwkteVtgK/meoUtTYZOmsbTyEjnMnWxSPm
         5LKnv0b8q99Yra6YFdMFfwGXY0gSvPLWQsTXMFCO4xVzekj54Va2b1Ih7/bpcua4mroc
         k0fg==
X-Forwarded-Encrypted: i=1; AKwUvBwR0WVj/rQaQTADrihVLeYtWBtJkKYjqUGUjrFL3K6DMAxC6JJ3KmAmmsC3orW7+vllWbaixYT01rb0@lists.linux.dev
X-Gm-Message-State: AFuF++nUxQy0mBNvmeZFZOvenC7OlvlRAEfo75aCRdkspykB/IPBmEJP
	Hh3K4Q8HovmSCBA7tD/kPVNIYc4QpBmklOlu6e6mxDr0MOWsUG3eXDwiLbVo0z2GSjHHNXFxZdm
	rCRZIBA==
X-Received: from pjyt2.prod.google.com ([2002:a17:90a:e502:b0:39d:94c4:375f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:1697:b0:39e:1310:cb36
 with SMTP id 98e67ed59e1d1-39e1310d234mr1156057a91.20.1789482680587; Tue, 15
 Sep 2026 07:31:20 -0700 (PDT)
Date: Tue, 15 Sep 2026 07:31:19 -0700
In-Reply-To: <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com> <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com>
Message-ID: <aqlWt4jb4CSPnecN@google.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jacky Li <jackyli@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 14, 2026, Tom Lendacky wrote:
> On 9/10/26 16:06, Jacky Li wrote:
> > Currently, snp_handle_(ext_)guest_req() returns -EIO when
> > kvm_{read/write/clear}_guest() fails while accessing guest-provided
> > buffers. Returning -EIO causes KVM_RUN to exit to userspace, likely
> > killing the VM.
> > 
> > Fix this by returning GHCB_HV_RESP_MALFORMED_INPUT with sub-error code
> > GHCB_ERR_INVALID_INPUT to the guest and resuming the vCPU.
> > 
> > Per the GHCB specification, guest-provided GPA buffers that cannot
> > be accessed by the hypervisor (e.g. private pages) should be treated
> > as guest input errors. Because kvm_{read/write/clear}_guest() only
> > returns -EFAULT on failure, treating this failure as an invalid input
> > aligns with the definition of -EFAULT ("Bad address").
> > 
> > Returning GHCB_ERR_INVALID_INPUT also matches existing SNP handling
> > in KVM, which already returns this error code for unaligned or
> > overlapping buffers. It also aligns with other hypercall implementations
> > in KVM (e.g. Hyper-V returning INVALID_HYPERCALL_INPUT on
> > kvm_read_guest() failures in kvm_hv_flush_tlb()).
> > 
> > Performing upfront validation (e.g. via kvm_mem_is_private()) is
> > avoided because it is prone to TOCTOU races with concurrent Page State
> > Changes.
> 
> I'm ok with this approach overall, but will we run into a sequence
> number problem now?
> 
> If the kvm_write_guest() in snp_handle_guest_req() fails, invalid input
> is going to be returned, but we will have successfully called
> SEV_CMD_SNP_GUEST_REQUEST. The sequence number will have advanced in the
> firmware, but I think the guest will not think that it has and not
> increment the sequence number causing subsequent requests to fail. At
> that point the guest will need to zero out the associated VMPCK used and
> move to the next one (there are a max of 4). If this continues happening
> the guest will eventually not be able to make guest requests anymore.
> But, I guess, if the kvm_write_guest() is failing, we're probably
> already in a bad situation, so maybe it is fine.

Oof, "fine" is definitely not ideal though.  

> > @@ -4244,8 +4246,10 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
> >  	if (ret && !fw_err)
> >  		return ret;
> >  
> > -	if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE))
> > -		return -EIO;
> > +	if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE)) {
> > +		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
> > +		return 1;
> > +	}

What if we keep this one as -EIO (or better, change it to -EFAULT in a separate
patch?), but add a comment explaning why KVM needs to exit to userspace in this
particular case?  That would be a good compromise; if the guest is attempting to
access non-existent memory, the initial READ will fail, i.e. we still get most
of the behavior Jacky wants.  The only fatal case would be where either userspace
really did screw up, or the guest managed to find read-only memory (though I
would probably argue that's likely also a userspace bug?).
