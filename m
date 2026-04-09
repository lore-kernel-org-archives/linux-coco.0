Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD539891D
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774576; cv=none; b=AGN52oLnzsRrUToQwf7pL82vJfgMy1HghmVHdPddXyA4mlvUsHiF/q/EEqSVauI7DiEH02Q20WAuRGsETicowdFPD2WnhVDNHLIs1O5WNmR47u/ixTXfYBgyIHpH5Dy8cKmwcfS3YhUtmjlQTtkXDQeChHC1PBtXnySXxY0Llvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774576; c=relaxed/simple;
	bh=Bdr/VKS2Xm+/pYaSrVzYfwfoth1+7klUYzIyzSDdgrQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uc0zPkg4yYwvA1KJ/DVSgiWdCPEpI62hsuxOUtR0K9SNii2gZPBXWjDmU0V2gtFVEeV4VfmB1nqGmK1+0SBqZDTg56nlIRcBTVI0KqDjtIt8gI0Anx+79ZDYA5aSwo/L8oAt86ubUWYzC60gmg3CTROYnf5plX7kIY7SEGzomvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kSwZUiBQ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kSwZUiBQ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82d40278103so1116461b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 15:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775774575; x=1776379375; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=b6+4lUswVTvjDCVcs/ZLq4/1sWKR4eUi2Zroo4Ie2qI=;
        b=kSwZUiBQVFZO3TprK9UQMOEFgB966Go6zNhOktnTZW8136GyHr6y5MdfuA1oVMgeBR
         olEmkAWhL6qv+mJLcdTxT+CuXC+8dQZkaGSy7Hsj2er8slhbq2RWa3MyTfS7otnOTiLl
         aoEMGTJgvHGm/dGhYZa/IydSpQU72ITVndSmdxUK+cGMft/6ogdx9UQLn4huJeclPRKm
         WCXqZcLetRhREcwa8yIbz1xT7CMMmH6Zeus8xhgUFCfQc1NGWvsxqA54xLSGw2LRe9Z6
         Jlm/bKzT8Ijs/d2mrGdqfXdJUcXQxp51EKdRD0vNSXJ9v1lpKCzQUbIDHhbC/QnEe6rD
         vvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775774575; x=1776379375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6+4lUswVTvjDCVcs/ZLq4/1sWKR4eUi2Zroo4Ie2qI=;
        b=Ip8K+Ym23HQAsvt1/YtyVQ8zsn1qgcdlJGdkaYw/Y+dyfbVZLbMQmf/3X+zUCY2iEh
         7gkzpyYFV2BkweOP2RXxFZktwUo4Exg3AgkB2p1lV4hPqR157rIEWrIUnIzHNjZWbx7K
         IuTKDQewgd1KYqCYYrExzZKM5VDy9hfqNTKzlKFV/qpKJ71amGJrJn6WvtZFV9V/o5E/
         lo3eRUuBeUSHoWEFRAvKgkxLU9uFJj0nNUpqHTOMVoPCoO4TG0Sf7DBXpESa8T3Rb1/C
         TrMjXz9/C3HC/5z74tP4m38O4W2lzLBescqPn8kepF4uyENETbwPEUFvuSdjTWOyxX2E
         4rXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNhRcZqXwADqoCsria8Z1Dyba6TsGn3fhTdFpcmgNAZj2nUdXIbXuOtrI573avZRFE70ZdvGsXwS3@lists.linux.dev
X-Gm-Message-State: AOJu0YwR8sYxIk3KqSLOO1apMMsXPC0p8c269/fLXcfnthnW6eobHnsz
	0fgQOwI9uOfW2hCF6yl0Pjw0FZ5zIrouxZ/ypg3TUEwM7Qt5q9Oz5IY/fJ3Kl7A/7g+XB98l5AA
	zE9nvng==
X-Received: from pfwz16.prod.google.com ([2002:a05:6a00:1d90:b0:824:a65c:adf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12cc:b0:82c:eafa:8875
 with SMTP id d2e1a72fcca58-82f0c26b33bmr964653b3a.2.1775774574526; Thu, 09
 Apr 2026 15:42:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  9 Apr 2026 15:42:33 -0700
In-Reply-To: <20260409224236.2021562-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409224236.2021562-5-seanjc@google.com>
Subject: [PATCH v2 4/6] KVM: x86: Add wrapper APIs to reset dirty/available
 register masks
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add wrappers for setting regs_{avail,dirty} in anticipation of turning the
fields into proper bitmaps, at which point direct writes won't work so
well.

Deliberately leave the initialization in kvm_arch_vcpu_create() as-is,
because the regs_avail logic in particular is special in that it's the one
and only place where KVM marks eagerly synchronized registers as available.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/kvm_cache_regs.h | 18 ++++++++++++++++++
 arch/x86/kvm/svm/svm.c        |  4 ++--
 arch/x86/kvm/vmx/nested.c     |  4 ++--
 arch/x86/kvm/vmx/tdx.c        |  2 +-
 arch/x86/kvm/vmx/vmx.c        |  4 ++--
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index ac1f9867a234..7f71d468178c 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -105,6 +105,24 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
 	return arch___test_and_set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
 }
 
+static __always_inline void kvm_clear_available_registers(struct kvm_vcpu *vcpu,
+							  u32 clear_mask)
+{
+	/*
+	 * Note the bitwise-AND!  In practice, a straight write would also work
+	 * as KVM initializes the mask to all ones and never clears registers
+	 * that are eagerly synchronized.  Using a bitwise-AND adds a bit of
+	 * sanity checking as incorrectly marking an eagerly sync'd register
+	 * unavailable will generate a WARN due to an unexpected cache request.
+	 */
+	vcpu->arch.regs_avail &= ~clear_mask;
+}
+
+static __always_inline void kvm_reset_dirty_registers(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.regs_dirty = 0;
+}
+
 /*
  * The "raw" register helpers are only for cases where the full 64 bits of a
  * register are read/written irrespective of current vCPU mode.  In other words,
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ee5749d8b3e8..2b73d2650155 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4508,7 +4508,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.regs[VCPU_REGS_RSP] = svm->vmcb->save.rsp;
 		vcpu->arch.rip = svm->vmcb->save.rip;
 	}
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu);
 
 	if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
 		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
@@ -4554,7 +4554,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.apf.host_apf_flags =
 			kvm_read_and_reset_apf_flags();
 
-	vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
+	kvm_clear_available_registers(vcpu, SVM_REGS_LAZY_LOAD_SET);
 
 	if (!msr_write_intercepted(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL))
 		rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, vcpu_to_pmu(vcpu)->global_ctrl);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 63c4ca8c97d5..c4d2bc080add 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -310,13 +310,13 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vmx_sync_vmcs_host_state(vmx, prev);
 	put_cpu();
 
-	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
+	kvm_clear_available_registers(vcpu, VMX_REGS_LAZY_LOAD_SET);
 
 	/*
 	 * All lazily updated registers will be reloaded from VMCS12 on both
 	 * vmentry and vmexit.
 	 */
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu);
 }
 
 static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c23ec4ac8bc8..c9ab7902151f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1098,7 +1098,7 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	tdx_load_host_xsave_state(vcpu);
 
-	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
+	kvm_clear_available_registers(vcpu, ~(u32)TDX_REGS_AVAIL_SET);
 
 	if (unlikely(tdx->vp_enter_ret == EXIT_REASON_EPT_MISCONFIG))
 		return EXIT_FASTPATH_NONE;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa1c26018439..61eeafcd70f1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7472,7 +7472,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 				   flags);
 
 	vcpu->arch.cr2 = native_read_cr2();
-	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
+	kvm_clear_available_registers(vcpu, VMX_REGS_LAZY_LOAD_SET);
 
 	vmx->idt_vectoring_info = 0;
 
@@ -7538,7 +7538,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vmcs_writel(GUEST_RSP, vcpu->arch.regs[VCPU_REGS_RSP]);
 	if (kvm_register_is_dirty(vcpu, VCPU_REG_RIP))
 		vmcs_writel(GUEST_RIP, vcpu->arch.rip);
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu);
 
 	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
 		set_debugreg(vcpu->arch.dr6, 6);
-- 
2.53.0.1213.gd9a14994de-goog

