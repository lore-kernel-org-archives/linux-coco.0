Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEBE1D5CDE
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158814; cv=none; b=PtjabWZLeswHcz05Nm3Mm8hWByFXyu9JWtkTrtrvJsCOiliHiu9i2ghSSU6BxWJefH06q2uxp7ii+eBQ/xF5BGWggCaAT7rsHrwXeNbx8opNKMtHttfFn+KNaccKwPB4PzjyKFMT2TsV3fP62g3Azk7pWnNI422I3Bf43cEW7Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158814; c=relaxed/simple;
	bh=V2R/B0gbkwCbHmdCAP2SACbfVHm0/ziCWsigAtAnjaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J7rnx5rhQ73bLab1wZEWuGeBF/paKPd3qy2wlwVFh/HPtnMnRLPF7toPlVvdPPR/Al+QSrF2OjPZ4piAjEeTUV0KWA7urjfL3U7vWLdhfo1emBPDSJbI0s1AtunKHCUDiDtuEFDW3EDh61475btjaDv1uzAsuX/a/11MoiitplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=beEfYWux; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="beEfYWux"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso1916936a91.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766158813; x=1766763613; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxrrp2oMgVkK17s+eJEUzU1udWIn66K3HBKvgT0GfUc=;
        b=beEfYWuxeBYT7WyaUzjx93NyaFYaE7p8L9fzRvS00Aa3UdHEToTiPgI1NzJm21hBTp
         BvN545h7hKxJ7erzjrFXhRSrtnxA1nNQxoKT2c5YYabtVsoIjkeXVinv4zQWbNweJqEm
         bIV3I+SwVlhOz4Q4xjtEEFJAjmOZfvmeUb/l8Y9PKgdhvbTZGK6N8M/zWFb5sKs/E6qF
         sKxRfQkuNsTyW5ZAbalsDrIobdeKrsQfOhrr/kcN6D1VJCNhSQ3P/sVAeUDyBOnB8zDk
         PJPFKgjThOZpC2U+zKk/2ljCepoqqTFLUjI970xQpu8cauzqGwO0B2i/9C8OpRPvw5UR
         0k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766158813; x=1766763613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxrrp2oMgVkK17s+eJEUzU1udWIn66K3HBKvgT0GfUc=;
        b=KqEbxudI0RYmeIQ3UbN0f39d5lYqb0m4HplsNrLGN/2c/hTe/Ex8W00lAH2O+OSGk2
         46HU0aFgWm1KgRbpXox25rby3G5FcbUfyDqcRvoy9j1Q2BcJk2XlxF7XO1oCkkAI4L7Q
         uPnWnbAn7OSCFmd57+oclQ4qLKNRL6Ia1QLKKNd6miKqy1e2cCNl/32DSpKROmMUJ/Uk
         QESZdVRkzNETiN6ttxjdqoxXQ+y+CnDmcy8upx9OM4yl2kWBaDyMGlslXTq3uP8bLVTk
         vG53CqPnpMxlVcKhmTX47xHc7eZKaz5Ur97eGWRucKU0/mPAEpA5aR1yOHMGXU6bYMHp
         UH3w==
X-Forwarded-Encrypted: i=1; AJvYcCUPlHik2fqf1MOYSBvCR0Jom1i04AXmoOoAY2zYSLlf3hPMWa6w8mLiT9lpYgpKs7mY2AxKsifUK5B9@lists.linux.dev
X-Gm-Message-State: AOJu0YypQhwv9nsaO+Qq+CuglGxV6eCwDSXCPnqwZEnMJBgnta4LBaHi
	1x1aOT8ZDhjscctMZpgyrEF8SZlG4rNnr7Hvpc+zBXxUWx0NX/JQBiVarKM5PnigzFV8JzG+xld
	ELGFJ7Q==
X-Google-Smtp-Source: AGHT+IGtRE55TsKHeelPCRMsIlRwSp4fhqX1YpQo/KjGsELaRWS0xMViHMtopyhh3Du+2psPLE3aTf/OtFw=
X-Received: from pjbhl13.prod.google.com ([2002:a17:90b:134d:b0:34c:5d1d:4e95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:34c:2f40:c662
 with SMTP id 98e67ed59e1d1-34e71e2955bmr5999291a91.14.1766158812676; Fri, 19
 Dec 2025 07:40:12 -0800 (PST)
Date: Fri, 19 Dec 2025 07:40:11 -0800
In-Reply-To: <aUS06wE6IvFti8Le@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <aTe4QyE3h8LHOAMb@intel.com> <aUJUbcyz2DXmphtU@yilunxu-OptiPlex-7050>
 <aUL-J-MvdCrCtDp4@google.com> <aUS06wE6IvFti8Le@yilunxu-OptiPlex-7050>
Message-ID: <aUVx20ZRjOzKgKqy@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 19, 2025, Xu Yilun wrote:
> On Wed, Dec 17, 2025 at 11:01:59AM -0800, Sean Christopherson wrote:
> > On Wed, Dec 17, 2025, Xu Yilun wrote:
> > > Is it better we explicitly assert the preemption for x86_virt_get_cpu()
> > > rather than embed the check in __this_cpu_inc_return()? We are not just
> > > protecting the racing for the reference counter. We should ensure the
> > > "counter increase + x86_virt_call(get_cpu)" can't be preempted.
> > 
> > I don't have a strong preference.  Using __this_cpu_inc_return() without any
> > nearby preemption_{enable,disable}() calls makes it quite clears that preemption
> > is expected to be disabled by the caller.  But I'm also ok being explicit.
> 
> Looking into __this_cpu_inc_return(), it finally calls
> check_preemption_disabled() which doesn't strictly requires preemption.
> It only ensures the context doesn't switch to another CPU. If the caller
> is in cpuhp context, preemption is possible.

Hmm, right, the cpuhp thread is is_percpu_thread(), and KVM's hooks aren't
considered atomic and so run with IRQs enabled.  In practice, it's "fine", because
TDX also exclusively does x86_virt_get_cpu() from cpuhp, i.e. the two users are
mutually exclusive, but relying on that behavior is gross.

> But in this x86_virt_get_cpu(), we need to ensure preemption disabled,
> otherwise caller A increases counter but hasn't do actual VMXON yet and
> get preempted. Caller B opts in and get the wrong info that VMX is
> already on, and fails on following vmx operations.
> 
> On a second thought, maybe we disable preemption inside
> x86_virt_get_cpu() to protect the counter-vmxon racing, this is pure
> internal thing for this kAPI.

Ya, that'd be my preference.


Kai, question for you (or anyone else that might know):

Is there any **need** for tdx_cpu_enable() and try_init_module_global() to run
with IRQs disabled?  AFAICT, the lockdep_assert_irqs_disabled() checks added by
commit 6162b310bc21 ("x86/virt/tdx: Add skeleton to enable TDX on demand") were
purely because, _when the code was written_, KVM enabled virtualization via IPI
function calls.

But by the time the KVM code landed upstream in commit fcdbdf63431c ("KVM: VMX:
Initialize TDX during KVM module load"), that was no longer true, thanks to
commit 9a798b1337af ("KVM: Register cpuhp and syscore callbacks when enabling
hardware") setting the stage for doing everything from task context.

However, rather than update the kernel side, e.g. to drop the lockdep assertions
and related comments, commit 9a798b1337af instead did this:

	local_irq_save(flags);
	r = tdx_cpu_enable();
	local_irq_restore(flags);

Somewhat frustratingly, I poked at this when the reworked code was first posted
(https://lore.kernel.org/all/ZyJOiPQnBz31qLZ7@google.com), but it just got swept
under the rug :-(

  : > > +	/* tdx_cpu_enable() must be called with IRQ disabled */
  : > 
  : > I don't find this comment helpfu.  If it explained _why_ tdx_cpu_enable() requires
  : > IRQs to be disabled, then I'd feel differently, but as is, IMO it doesn't add value.
  : 
  : I'll remove the comment.
  : 
  : > 
  : > > +	local_irq_save(flags);
  : > > +	r = tdx_cpu_enable();
  : > > +	local_irq_restore(flags);

Unless TDX _needs_ IRQs to be disabled, I would strongly prefer to drop that code
in prep patches so that it doesn't become even harder to disentagle the history
to figure out why tdx_online_cpu() disables IRQs:

  static int tdx_online_cpu(unsigned int cpu)
  {
	int ret;

	guard(irqsave)();  <=============== why is this here!?!?!

	ret = x86_virt_get_cpu(X86_FEATURE_VMX);
	if (ret)
		return ret;

	ret = tdx_cpu_enable();
	if (ret)
		x86_virt_put_cpu(X86_FEATURE_VMX);

	return ret;
  }

Side topic, KVM's change in behavior also means this comment is stale (though I
think it's worth keeping the assertion, but with a comment saying it's hardening
and paranoia, not a strick requirement).

	/*
	 * IRQs must be disabled as virtualization is enabled in hardware via
	 * function call IPIs, i.e. IRQs need to be disabled to guarantee
	 * virtualization stays disabled.
	 */
	lockdep_assert_irqs_disabled();
