Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FA839C65F
	for <linux-coco@lists.linux.dev>; Mon,  6 Apr 2026 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775511715; cv=none; b=qppeOkCfCyqy0KLJBoFPkHVMqwlmRYzFZ/1ZoHX23ketkIhk877cq01YBA5yW31O9tnCNHk6arwe71h8G9AyuhMAFYNKySuz2ezNjvZSlc+q7ywm62/NOH+ks0cL6VIhvWqShv4mxBFXRaa7TX3ImwhbVmm+SBhmRe3uE9ERyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775511715; c=relaxed/simple;
	bh=LqeWjRAjleQEgVlvFe8IGD4Aykcb3VyJFHWIx7meAD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rk7HDB2ENawmqUOL9fwfhls73atKePNE7VMtpw5qnDTXSpGVrqRKYSItH5T/Wz3SbpGIdErxO+dAbRv7qnVwHVetOWI0ltcPcUB2WgmRlxHI2XiUr6sP0XEca5DGlJ6zwAsmQIX7Pnvb+gEJ+LMAVnksXmD3d7HnXbrpJ/d6cZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HcWDexsr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HcWDexsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775511712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoWSSC8sEj5p74YK+Y0Flq8SEgfEahb8YNR6rLS40LU=;
	b=HcWDexsruaCK0XTgFGzs21EbTzPCEAHRksmILyNKXKhthz11G81mPTWkCfUWyvGi5BP+J6
	6xDXHNXc2NpSOar3FUQTks36upN1JifL/47vkCPC1AGkUtSetg4Rd1jfKJPFjf8cGaIiim
	XHdwZifjKCWptHbqYHf8sr5ZDB3wwF8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-HYhn5ncgPxmqfhBBKYAbyg-1; Mon, 06 Apr 2026 17:41:51 -0400
X-MC-Unique: HYhn5ncgPxmqfhBBKYAbyg-1
X-Mimecast-MFC-AGG-ID: HYhn5ncgPxmqfhBBKYAbyg_1775511710
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4362197d1easo4006204f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Apr 2026 14:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775511710; x=1776116510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoWSSC8sEj5p74YK+Y0Flq8SEgfEahb8YNR6rLS40LU=;
        b=ahR0yLBrzUNKHT8PFEhY9nyLQjlq/YIqqEkMACMgVr1yD9kU0fIvRs8opMqDLQRv8U
         LnC5/SMNBQ1icRKvKGyCiAcczXjEj3O3RBp9BUzyvIlqs36Ojkv4ik472AHBw8jHn+zE
         xvM3JgxLgMscDum0ZJjEwr1JTQP8QIJMIdnUgGzd1Jmj5+DTSdJ4VJQb7LnGE2zqRsbI
         SBYP6VNcvYfCQiagu4zAPoVJ42bnmPJtdN4LUF4nGGB9jq6xFd7ISG3QDpivXE0nmZ+0
         GPfUtkEsSuejbf643v7G5EFXy/wmdHulWXVwGNVGkLOkQsvJBeP27pKjT8nMAm0hfhoD
         BvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7nw/64vItEmSFyAO+Nmo9TFQLkraYti9jLV07beSZ1fv083rxzwmtivgE6AFEpNRSnJ0A5vVNWH9r@lists.linux.dev
X-Gm-Message-State: AOJu0YyJaog3NT8d+N3VXZiTaXOX2uPqlIuX5JiJrd64BzTrrqr9KWQN
	DcPZdG7vd5Fzm0a4ZD+/0QdHJkhIgudYlzGKqLl1DOl8PmB4J2lYGO8xN0M+JjWK4rNH9wjVVM5
	bdlJLkzjcWgwg8R2e//iMZjFJXOsgB7VC6HISiQRvF5JgBqm1cgAYKB1dJBaaVpHIfLm/tmKmLM
	L38c49BoLCKyX1a3k8pULRaKczPbE1EW4qbKxMdA==
X-Gm-Gg: AeBDieuLqVsYuSiAi6xtBXDgeOa8D/NPweDx2qQpEFnlAi/9tBlQPF9aNmoOe61yr3l
	SgAlRlf8YH4t9c0Ayn8EVnbNHQRic1wpM+nSiBmwDGXN8YCv8kEjLIZiSRcHYHXH/dwsga2b1kb
	6E/jUNLmlEQGCgj4do2PjwRRN1AEtbbeqlssWxlpH7OAW/Hr5+MrrW348VL007I4Bg5YDhaPrAg
	daSYHA7+PJvjNkFkPY4G95CeruvvGseeAca28zujjpETAWZVr51Prx7xvbD/+BQFkzDGM9zUqgR
	2I1U
X-Received: by 2002:a05:6000:26c2:b0:43d:32a:8595 with SMTP id ffacd0b85a97d-43d29294c00mr19903991f8f.20.1775511710178;
        Mon, 06 Apr 2026 14:41:50 -0700 (PDT)
X-Received: by 2002:a05:6000:26c2:b0:43d:32a:8595 with SMTP id
 ffacd0b85a97d-43d29294c00mr19903969f8f.20.1775511709729; Mon, 06 Apr 2026
 14:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <ac75iuf9gHIhvm9u@google.com> <88e9d7f0-35b8-4559-9f4d-c7daf1af6012@redhat.com>
 <aea176c8-35de-4042-bf98-e42ce05f93fb@intel.com> <CABgObfY05NU8DS82jkwpF89_p1nR7VJ30HBq_xaMg_u+-j=0Cw@mail.gmail.com>
 <adPRA4ZhnvbaXSn0@google.com>
In-Reply-To: <adPRA4ZhnvbaXSn0@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 6 Apr 2026 23:41:37 +0200
X-Gm-Features: AQROBzARX7cm2pOzcONamsrvF9MI0sPk77RETM76_dTtAevKjRTQ49z83c779Dw
Message-ID: <CABgObfbLm3FR4f_nv5EyYJx4jwfeBaVgTLhr7P++hmhCP98e3Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
To: Sean Christopherson <seanjc@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, Kiryl Shutsemau <kas@kernel.org>, kvm <kvm@vger.kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, linux-coco@lists.linux.dev, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bPu97n_Ys2-cEv9U59lL0tnMbWUvIMYmsZbU3uT-d9Y_1775511710
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Il lun 6 apr 2026, 17:28 Sean Christopherson <seanjc@google.com> ha scritto:
> > You're right about fast paths...
>
> Ya, potential fastpath usage is why I wanted to just context switch around
> entry/exit.
>
> > so something like the attached patch.
> > It is not too bad to translate into assembly, where it could use
> > alternatives (in the same way as
> > RESTORE_GUEST_SPEC_CTRL/RESTORE_GUEST_SPEC_CTRL_BODY) in place of
> > static_cpu_has(). Maybe it's best to bite the bullet and do it
> > already...
>
> My strong vote is to context switch in assembly, but _conditionally_ context
> switch R16-R31.
>
> But that second paragraph isn't quite correct, at least not for KVM.  Specifically,
> "need a branch prior to regaining speculative safety" isn't correct, as that holds
> true if and only if "regaining speculative safety" requires executing code that
> might access R16-R31.  If we massage __vmx_vcpu_run() to restore SPEC_CTRL in
> assembly, same as __svm_vcpu_run(), then __{svm,vmx}_vcpu_run() can simply context
> switch R16-R31 if and only if APX is enabled in XCR0.

I might even have patches for that lying around (the SPEC_CTRL part).

> KVM always intercepts XCR0 writes (when XCR0 isn't context switched by "hardware",
> i.e. ignoring SEV-ES+ and TDX guests), and IIUC all access to R16-R31 is gated on
> XCR0.APX=1

Right, fortunately.

> .  So unless I'm missing something (or hardware is flawed and lets the
> guest speculative consume R16-R31, which would be sad), it's perfectly safe to
> run the guest with host state in R16-R31.
>
> That would avoid pointlessly context switching 16 registers when APX is not being
> used by the guest, and would avoid having to write XCR0 in the fastpath.

For now yes, but once/if the kernel starts using the registers there's
no way out of writing XCR0 for APX-disabled guests in the fast path.

If we ignore that, we can keep guest XCR0 all the time for now, and
that would be:
- move SPEC_CTRL to assembly
- not changing XCR0 handling at all
- use XCR0 in addition to just static_cpu_has(X86_FEATURE_APX) to make
r16-r31 swap conditional

> > -     if (vcpu->arch.xcr0 != kvm_host.xcr0)
> > +     /*
> > +      * Do not load the definitive XCR0 yet; vcpu->arch.early_xcr0 keeps
> > +      * APX enabled so that the kernel can move to and from r16...r31.
> > +      */
> > +     if (vcpu->arch.early_xcr0 != kvm_host.xcr0)
> >               xsetbv(XCR_XFEATURE_ENABLED_MASK,
> > -                    load_guest ? vcpu->arch.xcr0 : kvm_host.xcr0);
> > +                    load_guest ? vcpu->arch.early_xcr0 : kvm_host.xcr0);
>
> Even _if_ we want to play XCR0 games,

(which depends on whether we want to be ready for kernel usage of APX, right?)

> tracking early_xcr0 is unnecessary.  This can be:
>
>         /*
>          * XCR0 is context switched around VM-Enter/VM-Exit if APX is enabled
>          * in the host but not in the guest.
>          */
>         if (vcpu->arch.xcr0 != kvm_host.xcr0 &&
>             (!cpu_feature_enabled(X86_FEATURE_APX) ||
>              vcpu->arch.xcr0 & XFEATURE_MASK_APX))
>                 xsetbv(XCR_XFEATURE_ENABLED_MASK,
>                        load_guest ? vcpu->arch.xcr0 : kvm_host.xcr0);

This is a bit more complex however, because in the end early_xcr0 is
precomputing the same conditions and optimizations. For example...

> > +void __kvm_load_guest_apx(struct kvm_vcpu *vcpu)
> > +{
> > +     if (vcpu->arch.early_xcr0 != vcpu->arch.xcr0)
> > +             xsetbv(XCR_XFEATURE_ENABLED_MASK, vcpu->arch.xcr0);
>
> This is wrong.  The "real" xcr0 needs to be loaded *after* accessing R16+.

... this is actually the same optimization you mention above: the real
xcr0 only needs to be loaded if APX is off in the guest, and in that
case you don't need to load r16-r31. So you can load xcr0 first, and
then any components (for now only APX) that need to be swapped.

> > +     if (!(vcpu->arch.xcr0 & XFEATURE_MASK_APX))
> > +             return;

... Because the loads are conditional on APX being enabled in the real xcr0.

Paolo

> > +
> > +     WARN_ON_ONCE(!irqs_disabled());
> > +
> > +     asm("mov %[r16], %%r16\n"
> > +         "mov %[r17], %%r17\n" // ...
> > +         : : [r16] "m" (vcpu->arch.regs[16]),
> > +             [r17] "m" (vcpu->arch.regs[17]));
> > +}
>

