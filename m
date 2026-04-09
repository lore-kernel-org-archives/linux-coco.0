Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634D399368
	for <linux-coco@lists.linux.dev>; Thu,  9 Apr 2026 22:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774578; cv=none; b=ogbu5RkzxSQXhKGgIIw3iyWj80Shus4Hu26JDnqWw63YA7+j4Q5hha/+/86L3anTKGx+qPcS/2sRgWlm5HubiEs8V0wKTNixYSkrjjXum/c2LBlbzkVneoWOXW6aM9UENzBLXxXbAiU2WCsNue1GRux/dr1UDtX8u82FHZBzofY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774578; c=relaxed/simple;
	bh=60Q/zHtyyGDIBP/ak7485shWUHxtFzoB9QyfDmyCpMc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fm00oV1q+SUayGJj9ohEVLHAxNu+fFWP9kQx0DB0Ypvr4RQ+zRbmeWzex/iwH9ssvSUoDUz9b7ch7sX54XEa3+cTg8L5vTS1Iow1HGgdmWcQ7fAeFPJcRP0bJVHKz3jzL1AEVDx2Z/kh245PrUM8d7xyOyd0tDGViDEomNyLFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E7ztpDQi; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7ztpDQi"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso1680019a12.3
        for <linux-coco@lists.linux.dev>; Thu, 09 Apr 2026 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775774577; x=1776379377; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7rpQhjNm3mTGjbc05HVtkw07FHdO4o+YZx1lMSvn+bc=;
        b=E7ztpDQimIWE3IWuf+WFFIUQ6u1MsXEQf/tHidz8TZxH23sLAPgg0+O3Q0WBO3rBwT
         3AtGVciqSu64ZRJDjzrYAIuiublsuD4nfCcLsStn7N6YkdbsWF3tOZlx5NAMEaCNK3Gl
         tp0h9w+GRQIEvvRO6e4TNooFfBn8VmhcpFdxM3bsU2Is5rx4uQG2rLbVNRH1IcbFqqVN
         K1vHjs1cXwsIjOhu1+eDRdiZleRC8TvW4vUMMT2fZ5fF6pELrrhpob+8agh0yKmnLHJO
         euX+HLwmo89YYf48bbFMgbOXbZiAtm0Ru3KAPMlpwYeZS1P3S5Hqsx1T1p8DT9uIViBU
         U1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775774577; x=1776379377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rpQhjNm3mTGjbc05HVtkw07FHdO4o+YZx1lMSvn+bc=;
        b=Ffmin07jfAM1BOX2eJ4JFMmM/JuN7aU5KxYfYARzzUoKTZjWx9y15GED494f2taTkp
         1rRFEv6ggTTxJCj3F0PX8VHcUZ3sGrM7JXgeUH3OuPaY4lUjoA97U4yuw6nVXU6YPqwf
         CPnOeluCAD8R8toRHkFGduXbX2iwfGFdNwWRFz0kyxmvNV04I0nfLXdIKJwWUVCxFzT/
         rhKYeNeBw/lOYUPJ3IHYCdxpbZtK2xC4y6EpHEXLz9uy8gRUJc0cwpwTsCeQux9rnWA/
         u3CyjaaNuPjf1eskU/Flcp7fGa3LqvMv7tCyFTGoSh/Xo/HhGm3BNwmTX+9AjV1SBy9N
         NfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5bJ8n+SlfwP9DswQT2hWf19wSFp2Yofh0KcuvVqh14/egca9DfrpRXJiQ3uZMi/t0vwIyt8tt3oco@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbgr8ezbtJvoUw7cSVoe+IcN0PF6Ob0OMdbyQ+EqvncxjpI8PS
	RKdxj1cga7g0xjwLcwVQRcBpIafcXcsbZTsK1KuTO1vaw4zVVcIXIIMsBYouqqAKry85rfE4Nik
	INJdMBw==
X-Received: from pfbdh4.prod.google.com ([2002:a05:6a00:4784:b0:829:94bc:6c15])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c98:b0:82c:ec1b:9e15
 with SMTP id d2e1a72fcca58-82f0c1e99bbmr915561b3a.1.1775774576585; Thu, 09
 Apr 2026 15:42:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  9 Apr 2026 15:42:34 -0700
In-Reply-To: <20260409224236.2021562-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409224236.2021562-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: x86: Track available/dirty register masks as
 "unsigned long" values
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"

Convert regs_{avail,dirty} and all related masks to "unsigned long" values
as an intermediate step towards declaring the fields as actual bitmaps, and
as a step toward support APX, which will push the total number of registers
beyond 32 on 64-bit kernels.

Opportunistically convert TDX's ULL bitmask to a UL to match everything
else (TDX is 64-bit only, so it's a nop in the end).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 ++--
 arch/x86/kvm/kvm_cache_regs.h   |  2 +-
 arch/x86/kvm/svm/svm.h          |  2 +-
 arch/x86/kvm/vmx/tdx.c          | 36 ++++++++++++++++-----------------
 arch/x86/kvm/vmx/vmx.h          | 20 +++++++++---------
 5 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b1eae1e7b04f..c47eb294c066 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -802,8 +802,8 @@ struct kvm_vcpu_arch {
 	 */
 	unsigned long regs[NR_VCPU_GENERAL_PURPOSE_REGS];
 	unsigned long rip;
-	u32 regs_avail;
-	u32 regs_dirty;
+	unsigned long regs_avail;
+	unsigned long regs_dirty;
 
 	unsigned long cr0;
 	unsigned long cr0_guest_owned_bits;
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 7f71d468178c..171e6bc2e169 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -106,7 +106,7 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
 }
 
 static __always_inline void kvm_clear_available_registers(struct kvm_vcpu *vcpu,
-							  u32 clear_mask)
+							  unsigned long clear_mask)
 {
 	/*
 	 * Note the bitwise-AND!  In practice, a straight write would also work
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 677d268ae9c7..7b46a3f13de1 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -474,7 +474,7 @@ static inline bool svm_is_vmrun_failure(u64 exit_code)
  * KVM_REQ_LOAD_MMU_PGD is always requested when the cached vcpu->arch.cr3
  * is changed.  svm_load_mmu_pgd() then syncs the new CR3 value into the VMCB.
  */
-#define SVM_REGS_LAZY_LOAD_SET	(1 << VCPU_REG_PDPTR)
+#define SVM_REGS_LAZY_LOAD_SET	(BIT(VCPU_REG_PDPTR))
 
 static inline void __vmcb_set_intercept(unsigned long *intercepts, u32 bit)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c9ab7902151f..85f28363e4cc 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1013,23 +1013,23 @@ static fastpath_t tdx_exit_handlers_fastpath(struct kvm_vcpu *vcpu)
 	return EXIT_FASTPATH_NONE;
 }
 
-#define TDX_REGS_AVAIL_SET	(BIT_ULL(VCPU_REG_EXIT_INFO_1) | \
-				 BIT_ULL(VCPU_REG_EXIT_INFO_2) | \
-				 BIT_ULL(VCPU_REGS_RAX) | \
-				 BIT_ULL(VCPU_REGS_RBX) | \
-				 BIT_ULL(VCPU_REGS_RCX) | \
-				 BIT_ULL(VCPU_REGS_RDX) | \
-				 BIT_ULL(VCPU_REGS_RBP) | \
-				 BIT_ULL(VCPU_REGS_RSI) | \
-				 BIT_ULL(VCPU_REGS_RDI) | \
-				 BIT_ULL(VCPU_REGS_R8) | \
-				 BIT_ULL(VCPU_REGS_R9) | \
-				 BIT_ULL(VCPU_REGS_R10) | \
-				 BIT_ULL(VCPU_REGS_R11) | \
-				 BIT_ULL(VCPU_REGS_R12) | \
-				 BIT_ULL(VCPU_REGS_R13) | \
-				 BIT_ULL(VCPU_REGS_R14) | \
-				 BIT_ULL(VCPU_REGS_R15))
+#define TDX_REGS_AVAIL_SET	(BIT(VCPU_REG_EXIT_INFO_1) | \
+				 BIT(VCPU_REG_EXIT_INFO_2) | \
+				 BIT(VCPU_REGS_RAX) | \
+				 BIT(VCPU_REGS_RBX) | \
+				 BIT(VCPU_REGS_RCX) | \
+				 BIT(VCPU_REGS_RDX) | \
+				 BIT(VCPU_REGS_RBP) | \
+				 BIT(VCPU_REGS_RSI) | \
+				 BIT(VCPU_REGS_RDI) | \
+				 BIT(VCPU_REGS_R8) | \
+				 BIT(VCPU_REGS_R9) | \
+				 BIT(VCPU_REGS_R10) | \
+				 BIT(VCPU_REGS_R11) | \
+				 BIT(VCPU_REGS_R12) | \
+				 BIT(VCPU_REGS_R13) | \
+				 BIT(VCPU_REGS_R14) | \
+				 BIT(VCPU_REGS_R15))
 
 static void tdx_load_host_xsave_state(struct kvm_vcpu *vcpu)
 {
@@ -1098,7 +1098,7 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	tdx_load_host_xsave_state(vcpu);
 
-	kvm_clear_available_registers(vcpu, ~(u32)TDX_REGS_AVAIL_SET);
+	kvm_clear_available_registers(vcpu, ~TDX_REGS_AVAIL_SET);
 
 	if (unlikely(tdx->vp_enter_ret == EXIT_REASON_EPT_MISCONFIG))
 		return EXIT_FASTPATH_NONE;
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 9fb76ea48caf..48447fa983f4 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -620,16 +620,16 @@ BUILD_CONTROLS_SHADOW(tertiary_exec, TERTIARY_VM_EXEC_CONTROL, 64)
  * cache on demand.  Other registers not listed here are synced to
  * the cache immediately after VM-Exit.
  */
-#define VMX_REGS_LAZY_LOAD_SET	((1 << VCPU_REG_RIP) |         \
-				(1 << VCPU_REGS_RSP) |          \
-				(1 << VCPU_REG_RFLAGS) |      \
-				(1 << VCPU_REG_PDPTR) |       \
-				(1 << VCPU_REG_SEGMENTS) |    \
-				(1 << VCPU_REG_CR0) |         \
-				(1 << VCPU_REG_CR3) |         \
-				(1 << VCPU_REG_CR4) |         \
-				(1 << VCPU_REG_EXIT_INFO_1) | \
-				(1 << VCPU_REG_EXIT_INFO_2))
+#define VMX_REGS_LAZY_LOAD_SET	(BIT(VCPU_REGS_RSP) |		\
+				 BIT(VCPU_REG_RIP) |		\
+				 BIT(VCPU_REG_RFLAGS) |		\
+				 BIT(VCPU_REG_PDPTR) |		\
+				 BIT(VCPU_REG_SEGMENTS) |	\
+				 BIT(VCPU_REG_CR0) |		\
+				 BIT(VCPU_REG_CR3) |		\
+				 BIT(VCPU_REG_CR4) |		\
+				 BIT(VCPU_REG_EXIT_INFO_1) |	\
+				 BIT(VCPU_REG_EXIT_INFO_2))
 
 static inline unsigned long vmx_l1_guest_owned_cr0_bits(void)
 {
-- 
2.53.0.1213.gd9a14994de-goog

