Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8BA39659A
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774571; cv=none; b=hwbjgaPVCmPjKCLYjCMdOzZ3aj0XHWkQz3xcYzSr3IYika8K9OCaRGbOqt5jMW5xdIPyjMWmr0tIEMM1eL6XNAvsRBHrUzMMJ7Jfty8bmk2sEE+dnxjvww6OGvNIabHEUxQo1gkrqXVfLzLGwEZ4WY7GEJvO3xuQh5eoEeiDzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774571; c=relaxed/simple;
	bh=9PY6IN9ye/ndMvnLulYGBqgEuAbDBhoAft7hTQkaxoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c4nwKBitqI8vqhGyKb81Lc/kNY++gHNp1oZZ6Z1ii2yPDTGr9JOMk3uYctPXbsq6UFv1R/5wuYibWnZc5pSr1whmWWk+xClTs/rBKjYof7JWdJYUFmAiw4SJeR7hBTXc4FuD5LKvbRnYwFu+r8sol7dyAHkCnH3u0Wl80ZbfvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NUZEd/0t; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NUZEd/0t"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so920087b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775774569; x=1776379369; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BA9IxKBBNNHN4chge8KN4r7euKndhCGWijVvRNxopgU=;
        b=NUZEd/0trBQGH/T7uMrf1oKLQwR8dkYKNlOyH/bQurS0ePbcuhQXOpICEZ9Wp28e//
         KChhWVFqRvKG1c0KdlAmtayNvTQZ/I51wUDVwyBjYW1chfIIJDK5zDZ18gqEZzFs7507
         fxmHI/abGFEFcQ5IASJVjwY8V+ElpXUOfxNKMEZRsJvNhke/rYJ8638jVmzOg+8Em9mc
         AY7K6jMtdB9M9aycsGES8F0Jegx/lRvYo1F7aFWQTlxwDS7VCwzrSuF8NZL7szb0taQO
         Ikrk3PVsfPJH8sMto17UX36jtYJ4DjMakO+HYEMcrUg2qCr7MrtXfhGGv+SznOeXjAGP
         KoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775774569; x=1776379369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA9IxKBBNNHN4chge8KN4r7euKndhCGWijVvRNxopgU=;
        b=ld+vglEqW0sNGguiReIHChUPmQioS8weW4zMU+UneH2K7wH5ta3HTpKikjYVwQcytZ
         8BJJBkL1dCNWa+fAVmauQZVwMJ3CXS7tNXX3JrSWjq9xt2WofRlgFFsoFTBahlIHVezJ
         AvaVknR+SKMETwrIw5lCccW4qchgHeil+eUyp2qcoOUFhPOpxmCAlNa18THUpbPTmfJ4
         ZY+4aB0I+XnvhzRjGBddeUaejhGBOFol6vVhi+3DJ6Zw36FUKB0zXyzTxHTv6rT223Z6
         H+SeK435b+fvcwFXAo/h5Rf8h0LAuVVFbzTKCf8Qelj2KRCBO18fPXVSxA82nxKMNR+f
         IKeA==
X-Forwarded-Encrypted: i=1; AJvYcCX6DRDzmNWdvLMNqbbhfxBv60FrNODhfvG0Vg3QklcDXVuv0RV57i0FQNkfuKfPA+HdfExHZrZXiYTh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5akWzX9mU2mkSpAO9M0zxk+Dzz6QJuvUXeKgxS59Qhur2929T
	BxpllMxBsu0KiomPLCsED3iHkQ0c7b4Ub9sdhFBivNM5YTJepGOqqhmD3y9B5Hlnys4nZp1cfgn
	kf1COLA==
X-Received: from pfblp15.prod.google.com ([2002:a05:6a00:3d4f:b0:829:8aa0:dc3c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2190:b0:82a:1529:2b4f
 with SMTP id d2e1a72fcca58-82f0c3256e2mr804385b3a.44.1775774569094; Thu, 09
 Apr 2026 15:42:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  9 Apr 2026 15:42:30 -0700
In-Reply-To: <20260409224236.2021562-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409224236.2021562-2-seanjc@google.com>
Subject: [PATCH v2 1/6] KVM: x86: Add dedicated storage for guest RIP
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add kvm_vcpu_arch.rip to track guest RIP instead of including it in the
generic regs[] array.  Decoupling RIP from regs[] will allow using a
*completely* arbitrary index for RIP, as opposed to the mostly-arbitrary
index that is currently used.  That in turn will allow using indices
16-31 to track R16-R31 that are coming with APX.

Note, although RIP can used for addressing, it does NOT have an
architecturally defined index, and so can't be reached via flows like
get_vmx_mem_address() where KVM "blindly" reads a general purpose register
given the SIB information reported by hardware.  For RIP-relative
addressing, hardware reports the full "offset" in vmcs.EXIT_QUALIFICATION.

Note #2, keep the available/dirty tracking as RSP is context switched
through the VMCS, i.e. needs to be cached for VMX.

Opportunistically rename NR_VCPU_REGS to NR_VCPU_GENERAL_PURPOSE_REGS to
better capture what it tracks, and so that KVM can slot in R16-R13 without
running into weirdness where KVM's definition of "EXREG" doesn't line up
with APX's definition of "extended reg".

No functional change intended.

Cc: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 10 ++++++----
 arch/x86/kvm/kvm_cache_regs.h   | 12 ++++++++----
 arch/x86/kvm/svm/sev.c          |  2 +-
 arch/x86/kvm/svm/svm.c          |  6 +++---
 arch/x86/kvm/vmx/vmx.c          |  8 ++++----
 arch/x86/kvm/vmx/vmx.h          |  2 +-
 6 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c470e40a00aa..68a11325e8bc 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -191,10 +191,11 @@ enum kvm_reg {
 	VCPU_REGS_R14 = __VCPU_REGS_R14,
 	VCPU_REGS_R15 = __VCPU_REGS_R15,
 #endif
-	VCPU_REGS_RIP,
-	NR_VCPU_REGS,
+	NR_VCPU_GENERAL_PURPOSE_REGS,
 
-	VCPU_EXREG_PDPTR = NR_VCPU_REGS,
+	VCPU_REG_RIP = NR_VCPU_GENERAL_PURPOSE_REGS,
+
+	VCPU_EXREG_PDPTR,
 	VCPU_EXREG_CR0,
 	/*
 	 * Alias AMD's ERAPS (not a real register) to CR3 so that common code
@@ -799,7 +800,8 @@ struct kvm_vcpu_arch {
 	 * rip and regs accesses must go through
 	 * kvm_{register,rip}_{read,write} functions.
 	 */
-	unsigned long regs[NR_VCPU_REGS];
+	unsigned long regs[NR_VCPU_GENERAL_PURPOSE_REGS];
+	unsigned long rip;
 	u32 regs_avail;
 	u32 regs_dirty;
 
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 8ddb01191d6f..9b7df9de0e87 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -112,7 +112,7 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
  */
 static inline unsigned long kvm_register_read_raw(struct kvm_vcpu *vcpu, int reg)
 {
-	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_REGS))
+	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_GENERAL_PURPOSE_REGS))
 		return 0;
 
 	if (!kvm_register_is_available(vcpu, reg))
@@ -124,7 +124,7 @@ static inline unsigned long kvm_register_read_raw(struct kvm_vcpu *vcpu, int reg
 static inline void kvm_register_write_raw(struct kvm_vcpu *vcpu, int reg,
 					  unsigned long val)
 {
-	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_REGS))
+	if (WARN_ON_ONCE((unsigned int)reg >= NR_VCPU_GENERAL_PURPOSE_REGS))
 		return;
 
 	vcpu->arch.regs[reg] = val;
@@ -133,12 +133,16 @@ static inline void kvm_register_write_raw(struct kvm_vcpu *vcpu, int reg,
 
 static inline unsigned long kvm_rip_read(struct kvm_vcpu *vcpu)
 {
-	return kvm_register_read_raw(vcpu, VCPU_REGS_RIP);
+	if (!kvm_register_is_available(vcpu, VCPU_REG_RIP))
+		kvm_x86_call(cache_reg)(vcpu, VCPU_REG_RIP);
+
+	return vcpu->arch.rip;
 }
 
 static inline void kvm_rip_write(struct kvm_vcpu *vcpu, unsigned long val)
 {
-	kvm_register_write_raw(vcpu, VCPU_REGS_RIP, val);
+	vcpu->arch.rip = val;
+	kvm_register_mark_dirty(vcpu, VCPU_REG_RIP);
 }
 
 static inline unsigned long kvm_rsp_read(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 75d0c03d69bc..2010b157e288 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -967,7 +967,7 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->r14 = svm->vcpu.arch.regs[VCPU_REGS_R14];
 	save->r15 = svm->vcpu.arch.regs[VCPU_REGS_R15];
 #endif
-	save->rip = svm->vcpu.arch.regs[VCPU_REGS_RIP];
+	save->rip = svm->vcpu.arch.rip;
 
 	/* Sync some non-GPR registers before encrypting */
 	save->xcr0 = svm->vcpu.arch.xcr0;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e7fdd7a9c280..85edaee27b03 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4420,7 +4420,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	svm->vmcb->save.rax = vcpu->arch.regs[VCPU_REGS_RAX];
 	svm->vmcb->save.rsp = vcpu->arch.regs[VCPU_REGS_RSP];
-	svm->vmcb->save.rip = vcpu->arch.regs[VCPU_REGS_RIP];
+	svm->vmcb->save.rip = vcpu->arch.rip;
 
 	/*
 	 * Disable singlestep if we're injecting an interrupt/exception.
@@ -4506,7 +4506,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 		vcpu->arch.cr2 = svm->vmcb->save.cr2;
 		vcpu->arch.regs[VCPU_REGS_RAX] = svm->vmcb->save.rax;
 		vcpu->arch.regs[VCPU_REGS_RSP] = svm->vmcb->save.rsp;
-		vcpu->arch.regs[VCPU_REGS_RIP] = svm->vmcb->save.rip;
+		vcpu->arch.rip = svm->vmcb->save.rip;
 	}
 	vcpu->arch.regs_dirty = 0;
 
@@ -4946,7 +4946,7 @@ static int svm_enter_smm(struct kvm_vcpu *vcpu, union kvm_smram *smram)
 
 	svm->vmcb->save.rax = vcpu->arch.regs[VCPU_REGS_RAX];
 	svm->vmcb->save.rsp = vcpu->arch.regs[VCPU_REGS_RSP];
-	svm->vmcb->save.rip = vcpu->arch.regs[VCPU_REGS_RIP];
+	svm->vmcb->save.rip = vcpu->arch.rip;
 
 	nested_svm_simple_vmexit(svm, SVM_EXIT_SW);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a29896a9ef14..577b0c6286ad 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2604,8 +2604,8 @@ void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	case VCPU_REGS_RSP:
 		vcpu->arch.regs[VCPU_REGS_RSP] = vmcs_readl(GUEST_RSP);
 		break;
-	case VCPU_REGS_RIP:
-		vcpu->arch.regs[VCPU_REGS_RIP] = vmcs_readl(GUEST_RIP);
+	case VCPU_REG_RIP:
+		vcpu->arch.rip = vmcs_readl(GUEST_RIP);
 		break;
 	case VCPU_EXREG_PDPTR:
 		if (enable_ept)
@@ -7536,8 +7536,8 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	if (kvm_register_is_dirty(vcpu, VCPU_REGS_RSP))
 		vmcs_writel(GUEST_RSP, vcpu->arch.regs[VCPU_REGS_RSP]);
-	if (kvm_register_is_dirty(vcpu, VCPU_REGS_RIP))
-		vmcs_writel(GUEST_RIP, vcpu->arch.regs[VCPU_REGS_RIP]);
+	if (kvm_register_is_dirty(vcpu, VCPU_REG_RIP))
+		vmcs_writel(GUEST_RIP, vcpu->arch.rip);
 	vcpu->arch.regs_dirty = 0;
 
 	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index db84e8001da5..d0cc5f6c6879 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -620,7 +620,7 @@ BUILD_CONTROLS_SHADOW(tertiary_exec, TERTIARY_VM_EXEC_CONTROL, 64)
  * cache on demand.  Other registers not listed here are synced to
  * the cache immediately after VM-Exit.
  */
-#define VMX_REGS_LAZY_LOAD_SET	((1 << VCPU_REGS_RIP) |         \
+#define VMX_REGS_LAZY_LOAD_SET	((1 << VCPU_REG_RIP) |         \
 				(1 << VCPU_REGS_RSP) |          \
 				(1 << VCPU_EXREG_RFLAGS) |      \
 				(1 << VCPU_EXREG_PDPTR) |       \
-- 
2.53.0.1213.gd9a14994de-goog

