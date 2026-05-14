Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C03D2FE0
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795649; cv=none; b=HkvH9EbwSO5E2Q8C+uz7UWknOADRQNT2jKeB9vfv7Xf7OZFYxXm18Vh2tfErnXDcf1E77Y8rE/laz3acC491FfmqI39t8g1Mjd6ef/HiAITOjpQNPZlOiFgMcbH4JrpbDPLQhgaVIzgKOr1ixJjnuccNaBIG3ADuqqo6RKjRAs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795649; c=relaxed/simple;
	bh=u7t/6O99gKqVMGcNhRnugOCAcBoXyxs2DtCzobtXGNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bm+/47HZ6efecuqk5HXA7Gj5eXzK237zwdNmOLhyExkurQ9NeNq9XyuGZks4gOSJiEItRa4aThCnuSQ1HmGJcr48i8lcmXpkbXp3zztQczmoUwLViQOeprNOeZaR1N4LO0EWHy381RmnvXwQeZXHdQoKCupF8BI+BDVc8nT4kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LtBJoxoz; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LtBJoxoz"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso673227a12.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795645; x=1779400445; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kj3u+QM9+85lpIpuH+gR93oa8wLXvI0R29z+6Y1bnto=;
        b=LtBJoxozIo2KC7f8GfFHHWmhztOHep1Lsgl2VNgmGLbuvfWqjgvd4HbYz26bDXPAIT
         aH6mT35plt+n7vnCUIiXkfL0Gdpep8D+HBX63K7qJGm3loWJ32kH8qqJLwZjT1pjqZEP
         xF3P+QYZVKJl9/4A3Ya3gA5gAWxugCSrnvakma5/ITEqXWISk/Kzz9U1ERqYeT2YP9U/
         LfmpOgUqhpAhlCSbN7uCETwKfJ3D1EZf56t7tx1wWP7UGcDQsbYrngAMnFoh5c61ZRvh
         NX3K9qyFVwDHa0V6/plImLlrY0Vq2iAKMg4Wf5sblBVEpyrcgp3SeAKt+P1VII+aOF5v
         7F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795645; x=1779400445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj3u+QM9+85lpIpuH+gR93oa8wLXvI0R29z+6Y1bnto=;
        b=pLMDgd5dQWsDZyESxOIGvWGDrfyEHt3056w+gB/dC4Zs27fisKXCoIDEDcPf//qXpc
         Lm9pIw7EZ7RR35UAoGGxpPLMtoBMDHwrQgnnzybJAriFRjIC6DrL9DbIT3miQJE0/Asl
         NNjIY0k2gnQS3FTV45dsga2yUjjQ9SwJ0JFynTIAsUuOSUQ3m60/WxMxolD2ZCpDYry8
         0YPar4R/eDcTw7ydeQICgmrg9OLKGmOLCDu/b5Zy5hMCoeh49pAlvHA7cz3K+8KSIEVt
         qIs4LzXYuG7pmI8MsNiS24NbpaW+D+ZKI50zeeaoLft0Jy7Ys3DBEQxT3jm6VEvGiXc6
         LLDg==
X-Forwarded-Encrypted: i=1; AFNElJ/2IiPI/4Heus3qtp9BIFHNRxCILKtRJkeD7fDHMQ68zKFaVXk5Qn+NY3tMw7ElQYQ9V3lzt7NlnJfW@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqvh2bONjjnsbZjn4pjzRieQqJ2T7wTfGlv+wL500XVnzyeUO/
	GcenHIf4aOh4m4bzsfy5hIdDIBsC9bVbAgRWNlcSmt8iy4agdRSSb547CtV5O8Zl8385w/uuyqn
	g1ejLBA==
X-Received: from pgbbc18.prod.google.com ([2002:a65:6d92:0:b0:c73:7b68:90d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:394b:b0:3ab:1692:fe91
 with SMTP id adf61e73a8af0-3b22ec63d85mr1000346637.41.1778795644789; Thu, 14
 May 2026 14:54:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:47 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-8-seanjc@google.com>
Subject: [PATCH v2 07/15] KVM: x86: Move inlined CR and DR helpers from x86.h
 to regs.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Move inlined Control Register and Debug Register helpers from x86.h to the
aptly named regs.h, to help trim down x86.h (and x86.c in the future).

Move select EFER functionality, but leave behind all other MSR handling,
There is more than enough MSR code to carve out msr.{c,h} in the future.
Give EFER special treatment as it's an "MSR" in name only, e.g. it's has
far more in common with CR4 than it does with any MSR.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.h | 108 ++++++++++++++++++++++++++++++++++++++++++--
 arch/x86/kvm/x86.h  | 102 -----------------------------------------
 2 files changed, 105 insertions(+), 105 deletions(-)

diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 4440f3992fce..ecc66b577e82 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -16,6 +16,37 @@
 
 static_assert(!(KVM_POSSIBLE_CR0_GUEST_BITS & X86_CR0_PDPTR_BITS));
 
+static inline bool is_long_mode(struct kvm_vcpu *vcpu)
+{
+#ifdef CONFIG_X86_64
+	return !!(vcpu->arch.efer & EFER_LMA);
+#else
+	return false;
+#endif
+}
+
+static inline bool is_64_bit_mode(struct kvm_vcpu *vcpu)
+{
+	int cs_db, cs_l;
+
+	WARN_ON_ONCE(vcpu->arch.guest_state_protected);
+
+	if (!is_long_mode(vcpu))
+		return false;
+	kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
+	return cs_l;
+}
+
+static inline bool is_64_bit_hypercall(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * If running with protected guest state, the CS register is not
+	 * accessible. The hypercall register values will have had to been
+	 * provided in 64-bit mode, so assume the guest is in 64-bit.
+	 */
+	return vcpu->arch.guest_state_protected || is_64_bit_mode(vcpu);
+}
+
 #define BUILD_KVM_GPR_ACCESSORS(lname, uname)				      \
 static __always_inline unsigned long kvm_##lname##_read(struct kvm_vcpu *vcpu)\
 {									      \
@@ -177,6 +208,12 @@ static inline void kvm_rsp_write(struct kvm_vcpu *vcpu, unsigned long val)
 	kvm_register_write_raw(vcpu, VCPU_REGS_RSP, val);
 }
 
+static inline u64 kvm_read_edx_eax(struct kvm_vcpu *vcpu)
+{
+	return (kvm_rax_read(vcpu) & -1u)
+		| ((u64)(kvm_rdx_read(vcpu) & -1u) << 32);
+}
+
 static inline u64 kvm_pdptr_read(struct kvm_vcpu *vcpu, int index)
 {
 	might_sleep();  /* on svm */
@@ -243,10 +280,75 @@ static inline ulong kvm_read_cr4(struct kvm_vcpu *vcpu)
 	return kvm_read_cr4_bits(vcpu, ~0UL);
 }
 
-static inline u64 kvm_read_edx_eax(struct kvm_vcpu *vcpu)
+static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 {
-	return (kvm_rax_read(vcpu) & -1u)
-		| ((u64)(kvm_rdx_read(vcpu) & -1u) << 32);
+	return !(cr4 & vcpu->arch.cr4_guest_rsvd_bits);
+}
+
+#define __cr4_reserved_bits(__cpu_has, __c)             \
+({                                                      \
+	u64 __reserved_bits = CR4_RESERVED_BITS;        \
+                                                        \
+	if (!__cpu_has(__c, X86_FEATURE_XSAVE))         \
+		__reserved_bits |= X86_CR4_OSXSAVE;     \
+	if (!__cpu_has(__c, X86_FEATURE_SMEP))          \
+		__reserved_bits |= X86_CR4_SMEP;        \
+	if (!__cpu_has(__c, X86_FEATURE_SMAP))          \
+		__reserved_bits |= X86_CR4_SMAP;        \
+	if (!__cpu_has(__c, X86_FEATURE_FSGSBASE))      \
+		__reserved_bits |= X86_CR4_FSGSBASE;    \
+	if (!__cpu_has(__c, X86_FEATURE_PKU))           \
+		__reserved_bits |= X86_CR4_PKE;         \
+	if (!__cpu_has(__c, X86_FEATURE_LA57))          \
+		__reserved_bits |= X86_CR4_LA57;        \
+	if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
+		__reserved_bits |= X86_CR4_UMIP;        \
+	if (!__cpu_has(__c, X86_FEATURE_VMX))           \
+		__reserved_bits |= X86_CR4_VMXE;        \
+	if (!__cpu_has(__c, X86_FEATURE_PCID))          \
+		__reserved_bits |= X86_CR4_PCIDE;       \
+	if (!__cpu_has(__c, X86_FEATURE_LAM))           \
+		__reserved_bits |= X86_CR4_LAM_SUP;     \
+	if (!__cpu_has(__c, X86_FEATURE_SHSTK) &&       \
+	    !__cpu_has(__c, X86_FEATURE_IBT))           \
+		__reserved_bits |= X86_CR4_CET;         \
+	__reserved_bits;                                \
+})
+
+static inline bool is_protmode(struct kvm_vcpu *vcpu)
+{
+	return kvm_is_cr0_bit_set(vcpu, X86_CR0_PE);
+}
+
+static inline bool is_pae(struct kvm_vcpu *vcpu)
+{
+	return kvm_is_cr4_bit_set(vcpu, X86_CR4_PAE);
+}
+
+static inline bool is_pse(struct kvm_vcpu *vcpu)
+{
+	return kvm_is_cr4_bit_set(vcpu, X86_CR4_PSE);
+}
+
+static inline bool is_paging(struct kvm_vcpu *vcpu)
+{
+	return likely(kvm_is_cr0_bit_set(vcpu, X86_CR0_PG));
+}
+
+static inline bool is_pae_paging(struct kvm_vcpu *vcpu)
+{
+	return !is_long_mode(vcpu) && is_pae(vcpu) && is_paging(vcpu);
+}
+
+static inline bool kvm_dr7_valid(u64 data)
+{
+	/* Bits [63:32] are reserved */
+	return !(data >> 32);
+}
+static inline bool kvm_dr6_valid(u64 data)
+{
+	/* Bits [63:32] are reserved */
+	return !(data >> 32);
 }
 
 static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 2bbecc83ecc2..16d1c3c1a2d9 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -243,42 +243,6 @@ static inline bool kvm_exception_is_soft(unsigned int nr)
 	return (nr == BP_VECTOR) || (nr == OF_VECTOR);
 }
 
-static inline bool is_protmode(struct kvm_vcpu *vcpu)
-{
-	return kvm_is_cr0_bit_set(vcpu, X86_CR0_PE);
-}
-
-static inline bool is_long_mode(struct kvm_vcpu *vcpu)
-{
-#ifdef CONFIG_X86_64
-	return !!(vcpu->arch.efer & EFER_LMA);
-#else
-	return false;
-#endif
-}
-
-static inline bool is_64_bit_mode(struct kvm_vcpu *vcpu)
-{
-	int cs_db, cs_l;
-
-	WARN_ON_ONCE(vcpu->arch.guest_state_protected);
-
-	if (!is_long_mode(vcpu))
-		return false;
-	kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
-	return cs_l;
-}
-
-static inline bool is_64_bit_hypercall(struct kvm_vcpu *vcpu)
-{
-	/*
-	 * If running with protected guest state, the CS register is not
-	 * accessible. The hypercall register values will have had to been
-	 * provided in 64-bit mode, so assume the guest is in 64-bit.
-	 */
-	return vcpu->arch.guest_state_protected || is_64_bit_mode(vcpu);
-}
-
 static inline bool x86_exception_has_error_code(unsigned int vector)
 {
 	static u32 exception_has_error_code = BIT(DF_VECTOR) | BIT(TS_VECTOR) |
@@ -293,26 +257,6 @@ static inline bool mmu_is_nested(struct kvm_vcpu *vcpu)
 	return vcpu->arch.walk_mmu == &vcpu->arch.nested_mmu;
 }
 
-static inline bool is_pae(struct kvm_vcpu *vcpu)
-{
-	return kvm_is_cr4_bit_set(vcpu, X86_CR4_PAE);
-}
-
-static inline bool is_pse(struct kvm_vcpu *vcpu)
-{
-	return kvm_is_cr4_bit_set(vcpu, X86_CR4_PSE);
-}
-
-static inline bool is_paging(struct kvm_vcpu *vcpu)
-{
-	return likely(kvm_is_cr0_bit_set(vcpu, X86_CR0_PG));
-}
-
-static inline bool is_pae_paging(struct kvm_vcpu *vcpu)
-{
-	return !is_long_mode(vcpu) && is_pae(vcpu) && is_paging(vcpu);
-}
-
 static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu *vcpu)
 {
 	return kvm_is_cr4_bit_set(vcpu, X86_CR4_LA57) ? 57 : 48;
@@ -630,17 +574,6 @@ static inline bool kvm_pat_valid(u64 data)
 	return (data | ((data & 0x0202020202020202ull) << 1)) == data;
 }
 
-static inline bool kvm_dr7_valid(u64 data)
-{
-	/* Bits [63:32] are reserved */
-	return !(data >> 32);
-}
-static inline bool kvm_dr6_valid(u64 data)
-{
-	/* Bits [63:32] are reserved */
-	return !(data >> 32);
-}
-
 /*
  * Trigger machine check on the host. We assume all the MSRs are already set up
  * by the CPU and that we still run on the same CPU as the MCE occurred on.
@@ -687,41 +620,6 @@ enum kvm_msr_access {
 #define  KVM_MSR_RET_UNSUPPORTED	2
 #define  KVM_MSR_RET_FILTERED		3
 
-static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
-{
-	return !(cr4 & vcpu->arch.cr4_guest_rsvd_bits);
-}
-
-#define __cr4_reserved_bits(__cpu_has, __c)             \
-({                                                      \
-	u64 __reserved_bits = CR4_RESERVED_BITS;        \
-                                                        \
-	if (!__cpu_has(__c, X86_FEATURE_XSAVE))         \
-		__reserved_bits |= X86_CR4_OSXSAVE;     \
-	if (!__cpu_has(__c, X86_FEATURE_SMEP))          \
-		__reserved_bits |= X86_CR4_SMEP;        \
-	if (!__cpu_has(__c, X86_FEATURE_SMAP))          \
-		__reserved_bits |= X86_CR4_SMAP;        \
-	if (!__cpu_has(__c, X86_FEATURE_FSGSBASE))      \
-		__reserved_bits |= X86_CR4_FSGSBASE;    \
-	if (!__cpu_has(__c, X86_FEATURE_PKU))           \
-		__reserved_bits |= X86_CR4_PKE;         \
-	if (!__cpu_has(__c, X86_FEATURE_LA57))          \
-		__reserved_bits |= X86_CR4_LA57;        \
-	if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
-		__reserved_bits |= X86_CR4_UMIP;        \
-	if (!__cpu_has(__c, X86_FEATURE_VMX))           \
-		__reserved_bits |= X86_CR4_VMXE;        \
-	if (!__cpu_has(__c, X86_FEATURE_PCID))          \
-		__reserved_bits |= X86_CR4_PCIDE;       \
-	if (!__cpu_has(__c, X86_FEATURE_LAM))           \
-		__reserved_bits |= X86_CR4_LAM_SUP;     \
-	if (!__cpu_has(__c, X86_FEATURE_SHSTK) &&       \
-	    !__cpu_has(__c, X86_FEATURE_IBT))           \
-		__reserved_bits |= X86_CR4_CET;         \
-	__reserved_bits;                                \
-})
-
 int kvm_sev_es_mmio(struct kvm_vcpu *vcpu, bool is_write, gpa_t gpa,
 		    unsigned int bytes, void *data);
 int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
-- 
2.54.0.563.g4f69b47b94-goog

