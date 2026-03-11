Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84569367F2A
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773189244; cv=none; b=rNJTq2lO27LUws9oMI9DcGWFk51VJqWMDZ6bx6qrPVLOEondQK7fV+EpF4F2Pxqu0vwpzXqrF46iclYmu2i6fq8Y3f8D8SduAfoxcU6MLRhGu22znzCkuJvGTyaks7Rovr/zwdYo1lkBevf55dXWwq2krfGntV3mfmnUVDj6f5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773189244; c=relaxed/simple;
	bh=gUHJnfT47WA8UME9igHBxYTLndDdZjAEZkok6tr14PQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jzZCvEYGxHcDil28aErxSH9alJUcOUkYtvUTmPIh5YnEN1e1fZ2pz51KKRpm99CE5YFeS+kpVQrlUxG+jh3bUJOEbvsXA15IPPi8fJ0HXXsjRnFeVMKZEK7wPW23lPd5Yz4OyknxkiwHeVjlq5FYkWlWF5usDpz4DVsA80Z8ZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6NVIN5k; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6NVIN5k"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3568090851aso78225127a91.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773189243; x=1773794043; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Q91qKTw/u2zRo/3uRL6c/7UREv+NiPYJeCn/l/Npduc=;
        b=H6NVIN5k98EG1mj34e4nsUdT+pBh/pLATTxIrXKjCMlxas6yYvxpxUqswK598yx028
         FGnFNZo1rtR6Vh754n5kRMtaNabVcTyYmV8oMrXCpFfd9N0yALVnrdVmXXuNJ94qN/rY
         1VaXDGqwR2BAs9AVoR0t1BhKm7ePlLCRKh0BiOroJ2BigArerVS3YTAAJC6lebQKEdqV
         w7MHGEBsM93RAhk4+TGESZQm5dcfd5uLe807YPrt1Y1y+NuQ0Xh5PrchDAJDjJYZRxpp
         m/YPOcKHpkbqkNZchYRC2tjeVJibYl4BIoEKrABjNLdsD+xoLwwcz4e1hOQxodckAP66
         IlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773189243; x=1773794043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q91qKTw/u2zRo/3uRL6c/7UREv+NiPYJeCn/l/Npduc=;
        b=BvLuLPMAV60GF0qCllpu9QpLL+tvs+2V+keNVIQGTvVs1w9l6zaHr/Rm7YCE1lIPS/
         eixBlGvkxbpegCcTLjn7jK36JH/xvOdhJo3xGXhjxL+FINTd6jN54c8Oun1CO6F3xLfG
         tbbhbTV5EYhTN7JV2Hq9zPYUV9XY4VWEYVkf1LkVN3tHGYqJYLh54O9mpDAJfjxRCsCM
         Sn0RQ1gV9dECIHxDn2nlVdG6q3uFrnO5EqcFOesaIiN1suoqDyjZF3PDNsCZ0hU9MHUk
         dVhHgdCsqI/Xpg7Vh1ek6qs0ZkmmGK3gHRZoUdr3ra3Ya9P/JelmkQq/aOBPy6waVB2/
         hZMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNDKtN1X6cD/qjLfkSTVIQcEhGxdTkcJY9O8cMkR70qA3EojaD7tNhKCy17G8IzLJy64KtbJybBHOl@lists.linux.dev
X-Gm-Message-State: AOJu0YzifEJ3v9GhxHzHJOTNUfUVgYS3ZBwiPDFUHSe6ZT4pAwSOtv7F
	9qe8aFz8sqaCwNYNTexc6Bzlm74SWWQhSpUAki/tEqpPRaxx0T11dTjOA9MSEtmnUAcNeLiwngY
	ASExiOA==
X-Received: from pjbjx10.prod.google.com ([2002:a17:90b:46ca:b0:359:8f46:13ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d09:b0:359:9158:7459
 with SMTP id 98e67ed59e1d1-35a00f1bd24mr748529a91.0.1773189242920; Tue, 10
 Mar 2026 17:34:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Mar 2026 17:33:44 -0700
In-Reply-To: <20260311003346.2626238-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311003346.2626238-6-seanjc@google.com>
Subject: [PATCH 5/7] KVM: x86: Track available/dirty register masks as
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
 arch/x86/kvm/kvm_cache_regs.h   |  4 ++--
 arch/x86/kvm/svm/svm.h          |  2 +-
 arch/x86/kvm/vmx/tdx.c          | 34 ++++++++++++++++-----------------
 arch/x86/kvm/vmx/vmx.h          | 20 +++++++++----------
 5 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 3af5e2661ade..734c2eee58e0 100644
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
index 94e31cf38cb8..5de6c7dfd63b 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -106,7 +106,7 @@ static __always_inline bool kvm_register_test_and_mark_available(struct kvm_vcpu
 }
 
 static __always_inline void kvm_reset_available_registers(struct kvm_vcpu *vcpu,
-							  u32 available_mask)
+							  unsigned long available_mask)
 {
 	/*
 	 * Note the bitwise-AND!  In practice, a straight write would also work
@@ -119,7 +119,7 @@ static __always_inline void kvm_reset_available_registers(struct kvm_vcpu *vcpu,
 }
 
 static __always_inline void kvm_reset_dirty_registers(struct kvm_vcpu *vcpu,
-						      u32 dirty_mask)
+						      unsigned long dirty_mask)
 {
 	vcpu->arch.regs_dirty = dirty_mask;
 }
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index dea46130aa24..7010db21e8cc 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -460,7 +460,7 @@ static inline bool svm_is_vmrun_failure(u64 exit_code)
  * KVM_REQ_LOAD_MMU_PGD is always requested when the cached vcpu->arch.cr3
  * is changed.  svm_load_mmu_pgd() then syncs the new CR3 value into the VMCB.
  */
-#define SVM_REGS_LAZY_LOAD_SET	(1 << VCPU_REG_PDPTR)
+#define SVM_REGS_LAZY_LOAD_SET	(BIT(VCPU_REG_PDPTR))
 
 static inline void __vmcb_set_intercept(unsigned long *intercepts, u32 bit)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d4cb6dc8098f..1e4f59cfdc0a 100644
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
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index d3255a054185..0962374c4cd3 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -623,16 +623,16 @@ BUILD_CONTROLS_SHADOW(tertiary_exec, TERTIARY_VM_EXEC_CONTROL, 64)
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
2.53.0.473.g4a7958ca14-goog

