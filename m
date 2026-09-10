Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3704A3DD86F
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058802; cv=none; b=Ujvd26rsGIpxGrSOkL3aKCsQaU1OSAaVEsGGlj6clL1YRXndSkN1lqP2mHvzoGIDxbvliI3HoOCjuF7/INlN2qsLh91lUEiQ9UI0XH3uAoeC1RBFeEiHOnkCeamMDvM8NRLJcmzAYBaNQPfAE63kRI9jo70Tw8P45JJ7SgBkBHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058802; c=relaxed/simple;
	bh=MtoWeA55Bs2YjWy/YgwYvBdXP31YZOiX0PTrX4B18d8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gdgnM2WA6CzaKcUBgf/VSS2A5uMem7N8Zei3GMijDZEOncJVTjxeBIJNcsMQwpuLFPsDijbzNtkHAxbYtrO8PxsH60R9ua49IO/Hx5tDG5xjbRmfLbF52bIwfhLC4i1Jf0K6+6swJjubyccgBAKvUDmtHEcFGeuykb12/jHcWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G7tIJB52; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G7tIJB52"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so33097a12.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789058793; x=1789663593; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsW6Qm+aSslCH5e3RaevgVxgzzrweE8oFKyJCoFEERE=;
        b=G7tIJB52YllwW/Pc6P3pEsnkkcMeW2CBYGE2YoaSBtBSoWww48W8tKIJvZ0hnCMlt4
         VpJ2SDPGrKxlElYezLzcnebGWMBjyL1xhrQ/4Q8CgLDjWpJccuO8aY8rMJOGTKVOPQ3S
         +BltiOzhUnXfqHIanGQ/e+8yhX/xDfi95tLcF+Yx58T+Pw6GfAU16TFU7P7tdLB+j5jf
         SMie8mgiAODES1NGJ6NfZZpQymh3M3h811A7qNW9slyQyz+3NSyTrBqBbr3WYjALMX6I
         hQbCqSCHECXnOUzJ3rbkBD1iAVBsCcHdUVVUk8QiACHV/NpeAtO4OCG2NWLD2Jjkjlei
         77NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058793; x=1789663593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsW6Qm+aSslCH5e3RaevgVxgzzrweE8oFKyJCoFEERE=;
        b=jIj01kaSfHFk51RDRk/7KxErzDWHE42VCPbKShjr2lsB0ZUZIvz4RvTUmvwJaboEGp
         HTDyDU1IJzAU0up4J0EfWWyFxGUjFAOZzZjx9A7ffnY+wZpUzuXHXlJvee0oB/Rhi0+z
         pI87+jnDH0lMWHZG2Cq6EM6pUxtSkjr5yQJi8uKDouYsHfMaK0xnQHeokhoMGOP0GYst
         T4BFisyO0UKz6Xacce8QfkWPPaR7/bnG9v2b79e/VT4uWTHw1tCi/l/6ZEUwQjNyVGG8
         sDJgXOVHQlBhdTWqd6skGClzG54sxTcDfE7T3FoDKH+s5MA8rOc8Eig+hQr5k1A7eNqx
         USTg==
X-Forwarded-Encrypted: i=1; AKwUvBy/PJU6urcYeAA51afGlbO3FpXvkElJzl5CEa4pRmYJoXOBHr0FL5cwLcimzaw/pX9q1sY4dR2T6JcT@lists.linux.dev
X-Gm-Message-State: AFuF++mjSlw3eh2JvQ7EkDUyXP4FkRB0/KDljwOY+BHVSoMjcn4LfuFV
	oZqgk51Yfxpg6t3bV6jCYfPzCrH8OmYmJZmBJSokXfvNtBS6XtzsS3Uukq5oWL6rR3XrU9J8Nhb
	1Dl/0Ng==
X-Received: from pgte26.prod.google.com ([2002:a65:689a:0:b0:cc4:bede:3dc7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b40a:b0:3d3:ae1f:d7f3
 with SMTP id adf61e73a8af0-3da3a0763d2mr68289720637.19.1789058792902; Thu, 10
 Sep 2026 09:46:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:46:32 -0700
In-Reply-To: <20260910162343.4092060-2-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-2-elver@google.com>
Message-ID: <aqLe6FcPZIgj2RA6@google.com>
Subject: Re: [PATCH RFC 01/10] KVM: x86/pmu: Acquire SRCU in
 pmc_is_event_allowed() to protect filter lookup
From: Sean Christopherson <seanjc@google.com>
To: Marco Elver <elver@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Marco Elver wrote:
> Dereferencing kvm->arch.pmu_event_filter via srcu_dereference() requires
> holding kvm->srcu to guard against concurrent filter replacement and
> freeing by kvm_vm_ioctl_set_pmu_event_filter().
> 
> Counter reprogramming can reach pmc_is_event_allowed() without holding
> kvm->srcu. Specifically, on AMD SVM, toggling EFER.SVME via KVM_SET_SREGS
> or KVM_SET_SREGS2 triggers synchronous counter reprogramming outside of
> any SRCU read-side critical section:
> 
>   kvm_vcpu_ioctl(KVM_SET_SREGS{,2})
>     kvm_vcpu_ioctl_x86_set_sregs{,2}()
>       __set_sregs_common()
>         kvm_x86_call(set_efer)()
>           svm_set_efer()
>             svm_pmu_handle_nested_transition()
>               __svm_pmu_handle_nested_transition(..., defer=false)
>                 __kvm_pmu_reprogram_counters()
>                   kvm_pmu_handle_event()
>                     reprogram_counter()
>                       pmc_is_event_allowed()
>                         srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu)
> 
> If userspace concurrently updates the filter (KVM_SET_PMU_EVENT_FILTER),
> a concurrent free and subsequent use-after-free is possible.
> 
> Protect filter lookups directly in pmc_is_event_allowed():
> 1. check rcu_access_pointer() first for the common fast path;
> 2. acquire guard(srcu)(&kvm->srcu) only when a filter is present;
> 3. drop redundant outer srcu_read_lock() in kvm_pmu_trigger_event().
> 
> Found with Clang context analysis.
> 
> Fixes: a02a25a65246 ("KVM: x86/pmu: Reprogram Host/Guest-Only counters on nested transitions")
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/x86/kvm/pmu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index a7d60c8785cd..3ad1e696edca 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -536,6 +536,11 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
>  	struct kvm_x86_pmu_event_filter *filter;
>  	struct kvm *kvm = pmc->vcpu->kvm;
>  
> +	if (!rcu_access_pointer(kvm->arch.pmu_event_filter))
> +		return true;
> +
> +	guard(srcu)(&kvm->srcu);
> +
>  	filter = srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu);
>  	if (!filter)
>  		return true;
> @@ -1132,7 +1137,7 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
>  	DECLARE_BITMAP(bitmap, X86_PMC_IDX_MAX);
>  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>  	struct kvm_pmc *pmc;
> -	int i, idx;
> +	int i;
>  
>  	BUILD_BUG_ON(sizeof(pmu->global_ctrl) * BITS_PER_BYTE != X86_PMC_IDX_MAX);
>  
> @@ -1145,14 +1150,12 @@ static void kvm_pmu_trigger_event(struct kvm_vcpu *vcpu,
>  			     (unsigned long *)&pmu->global_ctrl, X86_PMC_IDX_MAX))
>  		return;
>  
> -	idx = srcu_read_lock(&vcpu->kvm->srcu);
>  	kvm_for_each_pmc(pmu, pmc, i, bitmap) {
>  		if (!pmc_is_event_allowed(pmc) || !cpl_is_matched(pmc))
>  			continue;
>  
>  		kvm_pmu_incr_counter(pmc);
>  	}
> -	srcu_read_unlock(&vcpu->kvm->srcu, idx);
>  }

I would very strongly prefer to fix this in __set_sregs_common():

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 8f66438989e4..2ce16e96d796 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -571,9 +571,10 @@ static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 static int __set_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs,
 			      int *mmu_reset_needed, bool update_pdptrs)
 {
-	int idx;
 	struct desc_ptr dt;
 
+	guard(srcu)(&vcpu->kvm->srcu);
+
 	if (!kvm_is_valid_sregs(vcpu, sregs))
 		return -EINVAL;
 
@@ -605,13 +606,9 @@ static int __set_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs,
 	*mmu_reset_needed |= kvm_read_cr4(vcpu) != sregs->cr4;
 	kvm_x86_call(set_cr4)(vcpu, sregs->cr4);
 
-	if (update_pdptrs) {
-		idx = srcu_read_lock(&vcpu->kvm->srcu);
-		if (is_pae_paging(vcpu)) {
-			load_pdptrs(vcpu, kvm_read_cr3(vcpu));
-			*mmu_reset_needed = 1;
-		}
-		srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	if (update_pdptrs && is_pae_paging(vcpu)) {
+		load_pdptrs(vcpu, kvm_read_cr3(vcpu));
+		*mmu_reset_needed = 1;
 	}
 
 	kvm_set_segment(vcpu, &sregs->cs, VCPU_SREG_CS);

>  
>  void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu)
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
