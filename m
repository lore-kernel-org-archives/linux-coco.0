Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A5368264
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189244; cv=none; b=XRvrnNaVeFGC6jsMn+cEu6ZNV6zjkGm8Us9UlSaq0i7f5c9JZRmJoL/YPyonCxQk/sD+BSqz8VCqWy9FOMprgcNkwt5jVZm5q9QS/PKXcx6vG3rZ+GJEwcMxW1+LKaut3Za1ZazisUsZ1TyVw5ClArZNalzn3UxSOYHIZ+59lec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189244; c=relaxed/simple;
	bh=/AZ+SwQNuV1HBEW+2zllqRNISfAa3nxcBibWN/35fOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T0uaL/lwCwN9mrleCPXcW1o6eCtDhZUgPXjqVv650pylIDMZtmGt+a2UQR1x7BzYC71kNZZGRJJN3PMMmeMRtt34olomDbKGmeFL4yJ9I/uerJSi7KBUNRk8xzjhkGMg2/2L8v0sINlJ1qxx292PzQae7AcT7t0wEfPv/TpgxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W6be6ALm; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W6be6ALm"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8298c733f52so187921b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189241; x=1773794041; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VrwT1qYZM1BVcF4TouPNh26klS1cOdhqo+z3t1px/qc=;
        b=W6be6ALmGMVUyCN+t9AuMqbpGMCHT7bLB+w/w6RxJ1fjQ05P2cuDwL9qJgsxeDM5jv
         MSuNEyvriQqXOg3SGZFFmqOlvNEFzhmKJFfHl6DF0p159ZSUKCUeYq/6d5WmcQsTRL5O
         6NCpfrVM3SRIj8HV7xcmSjS87KqjP4PCOnW2aa8IqoAPpI+MR1hjcphuSD/jsR2dJ3yI
         V0+DE588KX9r9ma569ksGWad7LGGuBv9wKQWm1QozNSE5/UPWWHFjhtHukuCL4ISgC04
         SdHmXN3FKmxNmgw170zr720vWNkhq5Zz+Nc3C7LUki4Msi9Yq7Qwt1zqbBnlTFBAABuG
         0uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189241; x=1773794041;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrwT1qYZM1BVcF4TouPNh26klS1cOdhqo+z3t1px/qc=;
        b=lmYanUFZTlI2COfj9s3RvX1z/yXCgshZdVUHNPyhFFhWmEjMsa1PTwgmvVwTDHXPNG
         L6DaKsilK/EA9o7mDLFgQ2CCvgh+pa+FCzhTSMuRSM7Ody9xVjyH0JjlbSSlshR/3MMh
         8N1hebqQdmX4oR7Iu8r9sANH0zY6UbeQj9kipvir4O+s317KUEtCFWP4i1SQLyAnkXFl
         22pLrVD/mBC0AvM2QKRgK+gdUiTA7As3bJTQgzfdfpZGolqQ6QekhfeYu5oOjSHvnLaK
         e45ffO6GDToaOkOu/ylprprU6rcxJpqpvZ1+kgiYTJDZvtXw17uaIxrKEp46FpyysqJo
         HPLg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQnruqZmxiIzY8TfiC0wFC6bPEGAvuoGBzagKFqUDFdJgBJqnDsxvROi0mIFPES2l4ntmLYIuiqJO@lists.linux.dev
X-Gm-Message-State: AOJu0YxL4Fwgp68rJX6KFQHkuL/YqNJEVKYsAen8liQHdSeKfN0MG1lq
	hglgf2ld5/HcsSgAON2uDmT5sklUXKTJ9KFMPIBVHCSXstNhOcDzdoZkKon2qqXO4JaLR/XR5tG
	kXElnrQ==
X-Received: from pfbfm23.prod.google.com ([2002:a05:6a00:2f97:b0:823:747:7567])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21d1:b0:825:2927:3aa6
 with SMTP id d2e1a72fcca58-829f79d5943mr495224b3a.14.1773189240997; Tue, 10
 Mar 2026 17:34:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:43 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: x86: Add wrapper APIs to reset dirty/available
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
 arch/x86/kvm/kvm_cache_regs.h | 19 +++++++++++++++++++
 arch/x86/kvm/svm/svm.c        |  4 ++--
 arch/x86/kvm/vmx/nested.c     |  4 ++--
 arch/x86/kvm/vmx/tdx.c        |  2 +-
 arch/x86/kvm/vmx/vmx.c        |  4 ++--
 5 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index ac1f9867a234..94e31cf38cb8 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -105,6 +105,25 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
 	return arch___test_and_set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
 }
 
+static __always_inline void kvm_reset_available_registers(struct kvm_vcpu *vcpu,
+							  u32 available_mask)
+{
+	/*
+	 * Note the bitwise-AND!  In practice, a straight write would also work
+	 * as KVM initializes the mask to all ones and never clears registers
+	 * that are eagerly synchronized.  Using a bitwise-AND adds a bit of
+	 * sanity checking as incorrectly marking an eagerly sync'd register
+	 * unavailable will generate a WARN due to an unexpected cache request.
+	 */
+	vcpu->arch.regs_avail &= available_mask;
+}
+
+static __always_inline void kvm_reset_dirty_registers(struct kvm_vcpu *vcpu,
+						      u32 dirty_mask)
+{
+	vcpu->arch.regs_dirty = dirty_mask;
+}
+
 /*
  * The "raw" register helpers are only for cases where the full 64 bits of a
  * register are read/written irrespective of current vCPU mode.  In other words,
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1712c21f4128..1a6626c32188 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4524,7 +4524,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.regs[VCPU_REGS_RSP] = svm->vmcb->save.rsp;
 		vcpu->arch.rip = svm->vmcb->save.rip;
 	}
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu, 0);
 
 	if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
 		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
@@ -4570,7 +4570,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.apf.host_apf_flags =
 			kvm_read_and_reset_apf_flags();
 
-	vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
+	kvm_reset_available_registers(vcpu, ~SVM_REGS_LAZY_LOAD_SET);
 
 	if (!msr_write_intercepted(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL))
 		rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, vcpu_to_pmu(vcpu)->global_ctrl);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index af2aaef38502..d4ba64bde709 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -310,13 +310,13 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vmx_sync_vmcs_host_state(vmx, prev);
 	put_cpu();
 
-	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
+	kvm_reset_available_registers(vcpu, ~VMX_REGS_LAZY_LOAD_SET);
 
 	/*
 	 * All lazily updated registers will be reloaded from VMCS12 on both
 	 * vmentry and vmexit.
 	 */
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu, 0);
 }
 
 static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c23ec4ac8bc8..d4cb6dc8098f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1098,7 +1098,7 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	tdx_load_host_xsave_state(vcpu);
 
-	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
+	kvm_reset_available_registers(vcpu, TDX_REGS_AVAIL_SET);
 
 	if (unlikely(tdx->vp_enter_ret == EXIT_REASON_EPT_MISCONFIG))
 		return EXIT_FASTPATH_NONE;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index ed44eb5b4349..217ea6e72c2f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7472,7 +7472,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 				   flags);
 
 	vcpu->arch.cr2 = native_read_cr2();
-	vcpu->arch.regs_avail &= ~VMX_REGS_LAZY_LOAD_SET;
+	kvm_reset_available_registers(vcpu, ~VMX_REGS_LAZY_LOAD_SET);
 
 	vmx->idt_vectoring_info = 0;
 
@@ -7538,7 +7538,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vmcs_writel(GUEST_RSP, vcpu->arch.regs[VCPU_REGS_RSP]);
 	if (kvm_register_is_dirty(vcpu, VCPU_REG_RIP))
 		vmcs_writel(GUEST_RIP, vcpu->arch.rip);
-	vcpu->arch.regs_dirty = 0;
+	kvm_reset_dirty_registers(vcpu, 0);
 
 	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
 		set_debugreg(vcpu->arch.dr6, 6);
-- 
2.53.0.473.g4a7958ca14-goog

