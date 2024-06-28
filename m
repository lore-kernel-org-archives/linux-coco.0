Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1227347F
	for <linux-coco@lists.linux.dev>; Fri, 28 Jun 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719605303; cv=none; b=q7tiBUvS+nK8FgR3F9jBFH6xy/nPXU9qGsWqAzU2Ef03nhMX0q/IKsNaPPppBrI96m4+iM9BDhHp7JD72kUzVDY/eFyTLczXpDPYe8vdsfiFyJ9haopKMWKfOjgrG2TPJ+nRIiIc6QDLutl0eoBEVXIoWUGIJfbSIUaZAKw8x2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719605303; c=relaxed/simple;
	bh=bp3Tpd7CkxVw3GdXXDqKpBLDN+zkL84JaAt/Dr3NwBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=maIbMGYjGkvvSrvyYc49oVXSL1usSzQXGsM2CRDbARWfwnuQhLzwE0fL63XJPAccTZVlPq0vMkzAUrnGQqe8jDRMq7U050k/AZ5W7BD3/wRSL6sibOKP5beYbU1pPeo9vU7Hn2pQD35B4Ho7b0GPAeeJv4uTUPY8ocGPaH6CCIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ao4vCFrV; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ao4vCFrV"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-64adaf9ec5dso15358367b3.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Jun 2024 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719605301; x=1720210101; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQX0uJDL6OERqIaVnBhlK8PPxQnxFhP8/rNa+EnyS5I=;
        b=Ao4vCFrVQPSzE2iJ/RZiFdU5uiz8ZKcJxDXKaszY5RSUThiXOBYRsTarVqgIoyS73H
         G9LCww7j7g51/AB2+s26BEW/MOohQfFYjmlbGbtXXm5vnTU4CM8/+QaBxLG3OYnM6AaS
         0gnQj68eb4vdqiSKwUb55DGRM6YtwECULV3st1PX7ntOJE9hIY6H6Ix/hmVLkZ2nnsL8
         Inw/+TxAHZzquGvfSVU3reyNLDdKeMTvF2oVRHbvikujpqJ0/AbvI+DYqbNCGUSWev3P
         VTyFfYgXZRp8xoOFSgFvlsBVaAcaQv/QMT3s9FVYXym1hIccx+ljgXZTF63MWyDnYQD6
         9C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719605301; x=1720210101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQX0uJDL6OERqIaVnBhlK8PPxQnxFhP8/rNa+EnyS5I=;
        b=QwzYn/S7mX4DqiFIssaYHrNblavYWlOcRfHrW92FeMqOjaeCHoudwal2PXk9+pTKoF
         21Xi8BB/xZY+QSJHXp/11Sj6gXVi59sxsrmwvIYeGeanWzV7GkHcrsqRK9NaWymsb7h1
         qJsah5ZJ+Ud/fwtg6G/5Bsk3chK1qVEKRs7OsVJWw6QzJygx45PzlZcbp45IRQIKNjnX
         ABZWgpTXhniolbyhzDcBAMos+MhhSB34lHkbvcyq3iqw99P3wM7WvmND7nhamsfD064j
         BUQDHs+l8raBEVi2Xcgs1jBSfjrhUwEmYCBBemRdlOi6iElfZ7WIJYWAXWz/1vAuntYh
         6/5A==
X-Forwarded-Encrypted: i=1; AJvYcCW7l8MXTkjL3opN01fPy2yhZE+LagybPuqCkbbRJDyUAxptb8UHU3dettjBYzht+BgY04PnByx++KQqdPzHPSHEo1LUAp+Vche8hA==
X-Gm-Message-State: AOJu0YzjU3ZwJQ2FO2m38ddq4KtnMhi3V6xH9+2l2u5rfKMeYGSuh1At
	82MIfz47np/jMMhE0aIzwGoZCmUlELJC3ZoeuMwpjnnsBlhKvXnQWeTvyuEg3oGFaoHYH2bEZAo
	zJQ==
X-Google-Smtp-Source: AGHT+IHat6kJiV+VeBEQZBcfcMjT4ZxQxHAkzKR61aoHNJ/m46A249CALJD7Dc/5T/ECQk2P9GTkCWaJDJo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:83d2:0:b0:64b:40a3:1183 with SMTP id
 00721157ae682-64b40a31317mr45377b3.2.1719605301103; Fri, 28 Jun 2024 13:08:21
 -0700 (PDT)
Date: Fri, 28 Jun 2024 13:08:19 -0700
In-Reply-To: <r3tffokfww4yaytdfunj5kfy2aqqcsxp7sm3ga7wdytgyb3vnz@pfmstnvtuyg2>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-5-michael.roth@amd.com> <ZnwkMyy1kgu0dFdv@google.com> <r3tffokfww4yaytdfunj5kfy2aqqcsxp7sm3ga7wdytgyb3vnz@pfmstnvtuyg2>
Message-ID: <Zn8YM-s0TRUk-6T-@google.com>
Subject: Re: [PATCH v1 4/5] KVM: Introduce KVM_EXIT_COCO exit type
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, pgonda@google.com, 
	ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 26, 2024, Michael Roth wrote:
> On Wed, Jun 26, 2024 at 07:22:43AM -0700, Sean Christopherson wrote:
> > On Fri, Jun 21, 2024, Michael Roth wrote:
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index ecfa25b505e7..2eea9828d9aa 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -7122,6 +7122,97 @@ Please note that the kernel is allowed to use the kvm_run structure as the
> > >  primary storage for certain register types. Therefore, the kernel may use the
> > >  values in kvm_run even if the corresponding bit in kvm_dirty_regs is not set.
> > >  
> > > +::
> > > +
> > > +		/* KVM_EXIT_COCO */
> > > +		struct kvm_exit_coco {
> > > +		#define KVM_EXIT_COCO_REQ_CERTS			0
> > > +		#define KVM_EXIT_COCO_MAX			1
> > > +			__u8 nr;
> > > +			__u8 pad0[7];
> > > +			union {
> > > +				struct {
> > > +					__u64 gfn;
> > > +					__u32 npages;
> > > +		#define KVM_EXIT_COCO_REQ_CERTS_ERR_INVALID_LEN		1
> > > +		#define KVM_EXIT_COCO_REQ_CERTS_ERR_GENERIC		(1 << 31)
> > 
> > Unless I'm mistaken, these error codes are defined by the GHCB, which means the
> > values matter, i.e. aren't arbitrary KVM-defined values.
> 
> They do happen to coincide with the GHCB-defined values:
> 
>   /*
>    * The GHCB spec only formally defines INVALID_LEN/BUSY VMM errors, but define
>    * a GENERIC error code such that it won't ever conflict with GHCB-defined
>    * errors if any get added in the future.
>    */
>   #define SNP_GUEST_VMM_ERR_INVALID_LEN   1
>   #define SNP_GUEST_VMM_ERR_BUSY          2
>   #define SNP_GUEST_VMM_ERR_GENERIC       BIT(31)
> 
> and not totally by accident. But the KVM_EXIT_COCO_REQ_CERTS_ERR_* are
> defined/documented without any reliance on the GHCB spec and are purely
> KVM-defined. I just didn't really see any reason to pick different
> numerical values since it seems like purposely obfuscating things for

For SNP.  For other vendors, the numbers look bizarre, e.g. why bit 31?  And the
fact that it appears to be a mask is even more odd.

> no real reason. But the code itself doesn't rely on them being the same
> as the spec defines, so we are free to define these however we'd like as
> far as the KVM API goes.

> > I forget exactly what we discussed in PUCK, but for the error codes, I think KVM
> > should either define it's own values that are completely disconnected from any
> > "harware" spec, or KVM should very explicitly #define all hardware values and have
> 
> I'd gotten the impression that option 1) is what we were sort of leaning
> toward, and that's the approach taken here.

> And if we expose things selectively to keep the ABI small, it's a bit
> awkward too. For instance, KVM_EXIT_COCO_REQ_CERTS_ERR_* basically needs
> a way to indicate success/fail/ENOMEM. Which we have with
> (assuming 0==success):
> 
>   #define KVM_EXIT_COCO_REQ_CERTS_ERR_INVALID_LEN         1
>   #define KVM_EXIT_COCO_REQ_CERTS_ERR_GENERIC             (1 << 31)
> 
> But the GHCB also defines other values like:
> 
>   #define SNP_GUEST_VMM_ERR_BUSY          2  
> 
> which don't make much sense to handle on the userspace side and doesn't

Why not?  If userspace is waiting on a cert update for whatever reason, why can't
it signal "busy" to the guest?

> really have anything to do with the KVM_EXIT_COCO_REQ_CERTS KVM event,
> which is a separate/self-contained thing from the general guest request
> protocol. So would we expose that as ABI or not? If not then we end up
> with this weird splitting of code. And if yes, then we have to sort of
> give userspace a way to discover whenever new error codes are added to
> the GHCB spec, because KVM needs to understand these value too and

Not necessarily.  So long as KVM doesn't need to manipulate guest state, e.g. to
set RBX (or whatever reg it is) for ERR_INVALID_LEN, then KVM doesn't need to
care/know about the error codes.  E.g. userspace could signal VMM_BUSY and KVM
would happily pass that to the guest.

> users might be running on older kernel where only the currently-defined
> error codes are present understood.
> 
> E.g. if we started off implementing KVM_EXIT_COCO_REQ_CERTS without a
> way to request a larger buffer from the guest, and it wasn't later
> on that SNP_GUEST_VMM_ERR_INVALID_LEN was added, we'd probably need a
> capability bit or something to see if KVM supports requesting larger

We'd need that regardless, no?  Even if some other architecture added a error
code for invalid length, KVM would need to reject that for SNP because KVM couldn't
translate ERR_INVALID_LEN into an SNP error code.  And when a KVM comes along
that does support that error code, KVM would need a way to advertise support.

But if KVM simply forwards error codes, then KVM only needs to advertise support
if KVM reacts to the error code.

As mentioned in the previous version, ideally userspace would need to set guest
regs for INVALID_LEN case, but I don't see a sane/reasonable way to do that.

> page sizes from the guest. Otherwise userspace might just set it because
> the spec says it's valid, but it won't work as expected because KVM
> hasn't implemented that.
> 
> I guess technically we could reason about this particular one based on
> which GHCB protocol version was set via KVM_SEV_INIT2, but what if
> KVM itself was adding that functionality separately from the spec, and
> now we got this intermingling of specs.

How would KVM do that?  

> > E.g. I think we can end up with something like:
> > 
> >   static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
> >   {
> > 	struct vcpu_svm *svm = to_svm(vcpu);
> > 	struct vmcb_control_area *control = &svm->vmcb->control;
> > 
> > 	if (vcpu->run->coco.req_certs.ret)
> > 		if (vcpu->run->coco.req_certs.ret == SNP_GUEST_VMM_ERR_INVALID_LEN)
> 
> I'm not opposed to this approach, but just deciding which of:
> 
>   #define SNP_GUEST_VMM_ERR_INVALID_LEN   1
>   #define SNP_GUEST_VMM_ERR_BUSY          2
>   #define SNP_GUEST_VMM_ERR_GENERIC       BIT(31)
> 
> should be exposed to userspace based on how we've defined the
> KVM_EXIT_COCO_REQ_CERTS already seems like an unecessary dilemma
> versus just defining exactly what's needed and documenting that
> in the KVM API.

But that's not what your code does.  It exposes gunk that isn't necessary
(ERR_GENERIC), and then doesn't enforce anything on the backend because
snp_complete_req_certs() interprets any non-zero "return" value as a "generic"
error.  If we actually want to maintain extensibility, then KVM needs to enforce
inputs.

And if we do that, then it doesn't really matter whether KVM defines arbitrary
error codes or reuses the GHCB codes, e.g. it'll either be:

        if (vcpu->run->coco.req_certs.ret)
                if (vcpu->run->coco.req_certs.ret != KVM_EXIT_COCO_REQ_CERTS_ERR_INVALID_LEN)
			return -EINVAL;

                vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->coco.req_certs.npages;
                ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
                                        SNP_GUEST_ERR(vcpu->run->coco.req_certs.ret, 0));
                return 1;
        }

versus:

        if (vcpu->run->coco.req_certs.ret)
                if (vcpu->run->coco.req_certs.ret != SNP_GUEST_VMM_ERR_INVALID_LEN)
			return -EINVAL;

                vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->coco.req_certs.npages;
                ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
                                        SNP_GUEST_ERR(vcpu->run->coco.req_certs.ret, 0));
                return 1;
        }

(with variations depending on whether or not KVM allows SNP_GUEST_VMM_ERR_BUSY).
 
> If we anticipate needing to expose big chunks of GHCB/GHCI to
> userspace for other reasons or future extensions of KVM_EXIT_COCO_*
> then I definitely see the rationale to avoid duplication. But with
> KVM_HC_MAP_GPA_RANGE case covered, I don't see any major reason to
> think this will ever end up being the case.
> 
> It seems more likely this will just be KVM's handy place to handle "Hey
> userspace, I need you to handle some CoCo-related stuff for me" and
> it's really KVM that's driving those requirements vs. any particular
> spec.
> 
> For instance, the certificate-fetching in the first place is only
> handled by userspace because that's how KVM communinity decided to
> handle it, not some general spec-driven requirement to handle these
> sorts of things in userspace. Similarly for the KVM_HC_MAP_GPA_RANGE
> that we originally considered this interface to handle: the fact that
> userspace handles those requests is mainly a KVM/gmem design decision.
> 
> And like the KVM_HC_MAP_GPA_RANGE case, maybe we find there are cases
> where a common KVM-defined event type can handle the requirements of
> multiple specs with a common interface API, without exposing any
> particular vendor definitions.
> 
> So based on that I sort of think giving KVM more flexibility on how it
> wants to implement/document specific KVM_EXIT_COCO event types will
> ultimately result in cleaner and more manageable ABI.

I don't disagree, I'm just not seeing how regurgitating the GHCB error codes
provides flexibility.  As above, unless KVM is super restrictive about which
error codes can be returned, KVM has zero flexibility.

Reusing exit reasons and whatnot, e.g. for KVM_HC_MAP_GPA_RANGE, is all about
reducing copy+paste and not having to deal with 14^W15 different standards.  Any
ABI flexibility gained is a nice bonus.  If we think there's actually a chance
that a different vendor can use KVM_EXIT_COCO_REQ_CERTS and userspace won't end
end up with wildly different implementations, then yeah, let's define generic
return codes.

But if we're just going to end up with a bunch of vendor error codes redefined
by KVM, I don't see the point.

Another way to approach this would be to use existing the errno values, i.e.
EINVAL and EBUSY in this case.  The upside is we don't have to define custom
return codes.  The downside is that KVM needs to translate (though if we actually
expect vendors to reuse KVM_EXIT_COCO_REQ_CERTS, odds are good at least one vendor
will need to translate, i.e. won't be able to use KVM_EXIT_COCO_REQ_CERTS_ERR_INVALID_LEN
verbatim like SNP).
