Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D53D5674
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 21:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795659; cv=none; b=Ed39K6bo0P/vpjGwPhpG8PtHutzSsGr7Ji9fJemH1pzTXBWtDB+azYGjztnIA+uzUPTv0s1V9AxVu6DHwu+eRqW/8B2sOzFtN7EvXp715680HPTML7/Y6lyinzCUKzbkmZfQ87RahS0s32JcGzY9Wsf7p1/rhmh3m9LqcrcJnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795659; c=relaxed/simple;
	bh=FW9r5K/eMLMJVMpwkUNBgMdoN5Y09QF0Niqq560hV8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r4nuRlcGQ1BASqUB88Tnat/UyU9QNfcK9rLiyVo1Qk5I6KSv7qpPJUFzvFBYIsnqc7T5dFFoExUWdDTa1Rdb1JSDUufOfb8v/qmuusTf5FWU4OZahMBGzdeJygL4TgXrPCXa0/fArwGf2iI2tj8GhnGZFl00ugXS/rsOsw99Gp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NYd+Akd1; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYd+Akd1"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ba115ab6bbso82015465ad.3
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795654; x=1779400454; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=S9rq+9EQyy0Grumxb4oMswzj8RHSPFqJq9fyNVfdwiY=;
        b=NYd+Akd16mWwnUcshhLzDE9cxbILm5I1Y7LEDoklYNbD8eIsUEqE2CJmD+cjJLagDx
         SH2PN8Wbl4rCYV6j5gt1Gek6SXe3DW7zK6Ni550c+pyp4QdE2mhv6ow1DVjA3cCpddIy
         KBWQraaMOg/9EIfpFb9E0GKlsY8Txkjd1bfb4tNjxMOiYpPhvneSSg/rYT9RhloJ1PZJ
         4L7P58WJK8vmwbR5LybswQOCSVXDClTcdgAeeBpPP3X/bK8ago4hniPqp3a3dVL7zKfl
         ozgJL9lORCFcGTzvwARpcZOni8Onk8ni6+vXbH6szqYHfCaMAORccfvNfCptg8Vjslk8
         Di1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795654; x=1779400454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9rq+9EQyy0Grumxb4oMswzj8RHSPFqJq9fyNVfdwiY=;
        b=EtCBg4U7/dqbGdSwkbv3BenPRrhMYmi93yeHvfWJNeAmX8EnjmNHUxkw0PLCUXfbGp
         3srdDQF/bT3Z+dki4vCuxSCfADg0fel0Dr2mBAEGKOiWBF6y7QaXKy9SAIMG0m6rO64L
         AUk3ghSp2zKd8ZjqPImri+PbyjJ/dbiyq6lyJxt0yJMC1qzC7ZcLfy8CFWQqXUI9d45T
         eXObr+5m9AT6GWhYXS9NhoiDquMtPSbiWjQXmX9kFOdFbiEwg6P91rZk5xGd6eWp7n1k
         WEcLkkXssB+pxcvGCgBPytnxvqoGrZeN09PV+lHX3lq2sGRBpILMfNKPNw4lmi6cALcm
         uzZg==
X-Forwarded-Encrypted: i=1; AFNElJ/QkVvUUdUNDSEgKry7mii0WPEae7SunwiJaYlFBxyk6zBbsWKMAiS9lGN614blpdEGyr9RbhF2xYt3@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3QQGEaaZodFG3aErnAciwRYwnDYD0P+p+1epTirNExQj8tYSg
	aagYiMf1V5jlmvkX63EJWoamNj9LJWsAWWqeaj6IBI1XGCvOnTsCKSkBNAKVM0IBOsZTlovnjeM
	bf3+1Rw==
X-Received: from plbi11.prod.google.com ([2002:a17:903:20cb:b0:2b2:4611:5de2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f7d1:b0:2b2:67ca:5fff
 with SMTP id d9443c01a7336-2bd7e9adfafmr8714765ad.28.1778795653789; Thu, 14
 May 2026 14:54:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 May 2026 14:53:55 -0700
In-Reply-To: <20260514215355.1648463-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514215355.1648463-16-seanjc@google.com>
Subject: [PATCH v2 15/15] KVM: x86: Move the bulk of register specific code
 from x86.c to regs.c
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

Introduce regs.c, and move the vast majority of register specific code out
of x86.c and into regs.c.  Deliberately leave behind MSR code (except for
EFER, which can hardly be called an MSR), as KVM's MSR support is complex
enough to warrant its own compilation unit, and doesn't have much in common
with the other register code.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |   2 -
 arch/x86/kvm/Makefile           |   4 +-
 arch/x86/kvm/regs.c             | 829 ++++++++++++++++++++++++++++++++
 arch/x86/kvm/regs.h             |  16 +
 arch/x86/kvm/x86.c              | 824 +------------------------------
 arch/x86/kvm/x86.h              |   2 +
 6 files changed, 856 insertions(+), 821 deletions(-)
 create mode 100644 arch/x86/kvm/regs.c

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 271bdd109a98..5e24987b2a94 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2326,8 +2326,6 @@ static inline int __kvm_irq_line_state(unsigned long *irq_state,
 void kvm_inject_nmi(struct kvm_vcpu *vcpu);
 int kvm_get_nr_pending_nmis(struct kvm_vcpu *vcpu);
 
-void kvm_update_dr7(struct kvm_vcpu *vcpu);
-
 bool __kvm_mmu_unprotect_gfn_and_retry(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				       bool always_retry);
 
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 77337c37324b..f39c311fd756 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -5,8 +5,8 @@ ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-kvm-y			+= x86.o emulate.o irq.o lapic.o cpuid.o pmu.o mtrr.o \
-			   debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o
+kvm-y			+= x86.o emulate.o irq.o lapic.o cpuid.o pmu.o regs.o \
+			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o
 
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_IOAPIC) += i8259.o i8254.o ioapic.o
diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
new file mode 100644
index 000000000000..ee8a97c31d78
--- /dev/null
+++ b/arch/x86/kvm/regs.c
@@ -0,0 +1,829 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kvm_host.h>
+
+#include "lapic.h"
+#include "mmu.h"
+#include "regs.h"
+
+static void __get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	if (vcpu->arch.emulate_regs_need_sync_to_vcpu) {
+		/*
+		 * We are here if userspace calls get_regs() in the middle of
+		 * instruction emulation. Registers state needs to be copied
+		 * back from emulation context to vcpu. Userspace shouldn't do
+		 * that usually, but some bad designed PV devices (vmware
+		 * backdoor interface) need this to work
+		 */
+		emulator_writeback_register_cache(vcpu->arch.emulate_ctxt);
+		vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
+	}
+	regs->rax = kvm_rax_read_raw(vcpu);
+	regs->rbx = kvm_rbx_read_raw(vcpu);
+	regs->rcx = kvm_rcx_read_raw(vcpu);
+	regs->rdx = kvm_rdx_read_raw(vcpu);
+	regs->rsi = kvm_rsi_read_raw(vcpu);
+	regs->rdi = kvm_rdi_read_raw(vcpu);
+	regs->rsp = kvm_rsp_read(vcpu);
+	regs->rbp = kvm_rbp_read_raw(vcpu);
+#ifdef CONFIG_X86_64
+	regs->r8 = kvm_r8_read_raw(vcpu);
+	regs->r9 = kvm_r9_read_raw(vcpu);
+	regs->r10 = kvm_r10_read_raw(vcpu);
+	regs->r11 = kvm_r11_read_raw(vcpu);
+	regs->r12 = kvm_r12_read_raw(vcpu);
+	regs->r13 = kvm_r13_read_raw(vcpu);
+	regs->r14 = kvm_r14_read_raw(vcpu);
+	regs->r15 = kvm_r15_read_raw(vcpu);
+#endif
+
+	regs->rip = kvm_rip_read(vcpu);
+	regs->rflags = kvm_get_rflags(vcpu);
+}
+
+int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	vcpu_load(vcpu);
+	__get_regs(vcpu, regs);
+	vcpu_put(vcpu);
+	return 0;
+}
+
+static void __set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	vcpu->arch.emulate_regs_need_sync_from_vcpu = true;
+	vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
+
+	kvm_rax_write_raw(vcpu, regs->rax);
+	kvm_rbx_write_raw(vcpu, regs->rbx);
+	kvm_rcx_write_raw(vcpu, regs->rcx);
+	kvm_rdx_write_raw(vcpu, regs->rdx);
+	kvm_rsi_write_raw(vcpu, regs->rsi);
+	kvm_rdi_write_raw(vcpu, regs->rdi);
+	kvm_rsp_write(vcpu, regs->rsp);
+	kvm_rbp_write_raw(vcpu, regs->rbp);
+#ifdef CONFIG_X86_64
+	kvm_r8_write_raw(vcpu, regs->r8);
+	kvm_r9_write_raw(vcpu, regs->r9);
+	kvm_r10_write_raw(vcpu, regs->r10);
+	kvm_r11_write_raw(vcpu, regs->r11);
+	kvm_r12_write_raw(vcpu, regs->r12);
+	kvm_r13_write_raw(vcpu, regs->r13);
+	kvm_r14_write_raw(vcpu, regs->r14);
+	kvm_r15_write_raw(vcpu, regs->r15);
+#endif
+
+	kvm_rip_write(vcpu, regs->rip);
+	kvm_set_rflags(vcpu, regs->rflags | X86_EFLAGS_FIXED);
+
+	vcpu->arch.exception.pending = false;
+	vcpu->arch.exception_vmexit.pending = false;
+
+	kvm_make_request(KVM_REQ_EVENT, vcpu);
+}
+
+int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	vcpu_load(vcpu);
+	__set_regs(vcpu, regs);
+	vcpu_put(vcpu);
+	return 0;
+}
+
+static inline u64 pdptr_rsvd_bits(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.reserved_gpa_bits | rsvd_bits(5, 8) | rsvd_bits(1, 2);
+}
+
+/*
+ * Load the pae pdptrs.  Return 1 if they are all valid, 0 otherwise.
+ */
+int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3)
+{
+	struct kvm_mmu *mmu = vcpu->arch.walk_mmu;
+	gfn_t pdpt_gfn = cr3 >> PAGE_SHIFT;
+	gpa_t real_gpa;
+	int i;
+	int ret;
+	u64 pdpte[ARRAY_SIZE(mmu->pdptrs)];
+
+	/*
+	 * If the MMU is nested, CR3 holds an L2 GPA and needs to be translated
+	 * to an L1 GPA.
+	 */
+	real_gpa = kvm_translate_gpa(vcpu, mmu, gfn_to_gpa(pdpt_gfn),
+				     PFERR_USER_MASK | PFERR_WRITE_MASK |
+				     PFERR_GUEST_PAGE_MASK, NULL, 0);
+	if (real_gpa == INVALID_GPA)
+		return 0;
+
+	/* Note the offset, PDPTRs are 32 byte aligned when using PAE paging. */
+	ret = kvm_vcpu_read_guest_page(vcpu, gpa_to_gfn(real_gpa), pdpte,
+				       cr3 & GENMASK(11, 5), sizeof(pdpte));
+	if (ret < 0)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(pdpte); ++i) {
+		if ((pdpte[i] & PT_PRESENT_MASK) &&
+		    (pdpte[i] & pdptr_rsvd_bits(vcpu))) {
+			return 0;
+		}
+	}
+
+	/*
+	 * Marking VCPU_REG_PDPTR dirty doesn't work for !tdp_enabled.
+	 * Shadow page roots need to be reconstructed instead.
+	 */
+	if (!tdp_enabled && memcmp(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs)))
+		kvm_mmu_free_roots(vcpu->kvm, mmu, KVM_MMU_ROOT_CURRENT);
+
+	memcpy(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs));
+	kvm_register_mark_dirty(vcpu, VCPU_REG_PDPTR);
+	kvm_make_request(KVM_REQ_LOAD_MMU_PGD, vcpu);
+	vcpu->arch.pdptrs_from_userspace = false;
+
+	return 1;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(load_pdptrs);
+
+static bool kvm_is_valid_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
+{
+#ifdef CONFIG_X86_64
+	if (cr0 & 0xffffffff00000000UL)
+		return false;
+#endif
+
+	if ((cr0 & X86_CR0_NW) && !(cr0 & X86_CR0_CD))
+		return false;
+
+	if ((cr0 & X86_CR0_PG) && !(cr0 & X86_CR0_PE))
+		return false;
+
+	return kvm_x86_call(is_valid_cr0)(vcpu, cr0);
+}
+
+void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
+{
+	/*
+	 * CR0.WP is incorporated into the MMU role, but only for non-nested,
+	 * indirect shadow MMUs.  If paging is disabled, no updates are needed
+	 * as there are no permission bits to emulate.  If TDP is enabled, the
+	 * MMU's metadata needs to be updated, e.g. so that emulating guest
+	 * translations does the right thing, but there's no need to unload the
+	 * root as CR0.WP doesn't affect SPTEs.
+	 */
+	if ((cr0 ^ old_cr0) == X86_CR0_WP) {
+		if (!(cr0 & X86_CR0_PG))
+			return;
+
+		if (tdp_enabled) {
+			kvm_init_mmu(vcpu);
+			return;
+		}
+	}
+
+	if ((cr0 ^ old_cr0) & X86_CR0_PG) {
+		/*
+		 * Clearing CR0.PG is defined to flush the TLB from the guest's
+		 * perspective.
+		 */
+		if (!(cr0 & X86_CR0_PG))
+			kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+		/*
+		 * Check for async #PF completion events when enabling paging,
+		 * as the vCPU may have previously encountered async #PFs (it's
+		 * entirely legal for the guest to toggle paging on/off without
+		 * waiting for the async #PF queue to drain).
+		 */
+		else if (kvm_pv_async_pf_enabled(vcpu))
+			kvm_make_request(KVM_REQ_APF_READY, vcpu);
+	}
+
+	if ((cr0 ^ old_cr0) & KVM_MMU_CR0_ROLE_BITS)
+		kvm_mmu_reset_context(vcpu);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr0);
+
+int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
+{
+	unsigned long old_cr0 = kvm_read_cr0(vcpu);
+
+	if (!kvm_is_valid_cr0(vcpu, cr0))
+		return 1;
+
+	cr0 |= X86_CR0_ET;
+
+	/* Write to CR0 reserved bits are ignored, even on Intel. */
+	cr0 &= ~CR0_RESERVED_BITS;
+
+#ifdef CONFIG_X86_64
+	if ((vcpu->arch.efer & EFER_LME) && !is_paging(vcpu) &&
+	    (cr0 & X86_CR0_PG)) {
+		int cs_db, cs_l;
+
+		if (!is_pae(vcpu))
+			return 1;
+		kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
+		if (cs_l)
+			return 1;
+	}
+#endif
+	if (!(vcpu->arch.efer & EFER_LME) && (cr0 & X86_CR0_PG) &&
+	    is_pae(vcpu) && ((cr0 ^ old_cr0) & X86_CR0_PDPTR_BITS) &&
+	    !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
+		return 1;
+
+	if (!(cr0 & X86_CR0_PG) &&
+	    (is_64_bit_mode(vcpu) || kvm_is_cr4_bit_set(vcpu, X86_CR4_PCIDE)))
+		return 1;
+
+	if (!(cr0 & X86_CR0_WP) && kvm_is_cr4_bit_set(vcpu, X86_CR4_CET))
+		return 1;
+
+	kvm_x86_call(set_cr0)(vcpu, cr0);
+
+	kvm_post_set_cr0(vcpu, old_cr0, cr0);
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr0);
+
+void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
+{
+	(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lmsw);
+
+int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
+{
+	bool skip_tlb_flush = false;
+	unsigned long pcid = 0;
+#ifdef CONFIG_X86_64
+	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_PCIDE)) {
+		skip_tlb_flush = cr3 & X86_CR3_PCID_NOFLUSH;
+		cr3 &= ~X86_CR3_PCID_NOFLUSH;
+		pcid = cr3 & X86_CR3_PCID_MASK;
+	}
+#endif
+
+	/* PDPTRs are always reloaded for PAE paging. */
+	if (cr3 == kvm_read_cr3(vcpu) && !is_pae_paging(vcpu))
+		goto handle_tlb_flush;
+
+	/*
+	 * Do not condition the GPA check on long mode, this helper is used to
+	 * stuff CR3, e.g. for RSM emulation, and there is no guarantee that
+	 * the current vCPU mode is accurate.
+	 */
+	if (!kvm_vcpu_is_legal_cr3(vcpu, cr3))
+		return 1;
+
+	if (is_pae_paging(vcpu) && !load_pdptrs(vcpu, cr3))
+		return 1;
+
+	if (cr3 != kvm_read_cr3(vcpu))
+		kvm_mmu_new_pgd(vcpu, cr3);
+
+	vcpu->arch.cr3 = cr3;
+	kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
+	/* Do not call post_set_cr3, we do not get here for confidential guests.  */
+
+handle_tlb_flush:
+	/*
+	 * A load of CR3 that flushes the TLB flushes only the current PCID,
+	 * even if PCID is disabled, in which case PCID=0 is flushed.  It's a
+	 * moot point in the end because _disabling_ PCID will flush all PCIDs,
+	 * and it's impossible to use a non-zero PCID when PCID is disabled,
+	 * i.e. only PCID=0 can be relevant.
+	 */
+	if (!skip_tlb_flush)
+		kvm_invalidate_pcid(vcpu, pcid);
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr3);
+
+static bool kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
+{
+	return __kvm_is_valid_cr4(vcpu, cr4) &&
+	       kvm_x86_call(is_valid_cr4)(vcpu, cr4);
+}
+
+void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
+{
+	if ((cr4 ^ old_cr4) & KVM_MMU_CR4_ROLE_BITS)
+		kvm_mmu_reset_context(vcpu);
+
+	/*
+	 * If CR4.PCIDE is changed 0 -> 1, there is no need to flush the TLB
+	 * according to the SDM; however, stale prev_roots could be reused
+	 * incorrectly in the future after a MOV to CR3 with NOFLUSH=1, so we
+	 * free them all.  This is *not* a superset of KVM_REQ_TLB_FLUSH_GUEST
+	 * or KVM_REQ_TLB_FLUSH_CURRENT, because the hardware TLB is not flushed,
+	 * so fall through.
+	 */
+	if (!tdp_enabled &&
+	    (cr4 & X86_CR4_PCIDE) && !(old_cr4 & X86_CR4_PCIDE))
+		kvm_mmu_unload(vcpu);
+
+	/*
+	 * The TLB has to be flushed for all PCIDs if any of the following
+	 * (architecturally required) changes happen:
+	 * - CR4.PCIDE is changed from 1 to 0
+	 * - CR4.PGE is toggled
+	 *
+	 * This is a superset of KVM_REQ_TLB_FLUSH_CURRENT.
+	 */
+	if (((cr4 ^ old_cr4) & X86_CR4_PGE) ||
+	    (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
+		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+
+	/*
+	 * The TLB has to be flushed for the current PCID if any of the
+	 * following (architecturally required) changes happen:
+	 * - CR4.SMEP is changed from 0 to 1
+	 * - CR4.PAE is toggled
+	 */
+	else if (((cr4 ^ old_cr4) & X86_CR4_PAE) ||
+		 ((cr4 & X86_CR4_SMEP) && !(old_cr4 & X86_CR4_SMEP)))
+		kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
+
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr4);
+
+int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
+{
+	unsigned long old_cr4 = kvm_read_cr4(vcpu);
+
+	if (!kvm_is_valid_cr4(vcpu, cr4))
+		return 1;
+
+	if (is_long_mode(vcpu)) {
+		if (!(cr4 & X86_CR4_PAE))
+			return 1;
+		if ((cr4 ^ old_cr4) & X86_CR4_LA57)
+			return 1;
+	} else if (is_paging(vcpu) && (cr4 & X86_CR4_PAE)
+		   && ((cr4 ^ old_cr4) & X86_CR4_PDPTR_BITS)
+		   && !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
+		return 1;
+
+	if ((cr4 & X86_CR4_PCIDE) && !(old_cr4 & X86_CR4_PCIDE)) {
+		/* PCID can not be enabled when cr3[11:0]!=000H or EFER.LMA=0 */
+		if ((kvm_read_cr3(vcpu) & X86_CR3_PCID_MASK) || !is_long_mode(vcpu))
+			return 1;
+	}
+
+	if ((cr4 & X86_CR4_CET) && !kvm_is_cr0_bit_set(vcpu, X86_CR0_WP))
+		return 1;
+
+	kvm_x86_call(set_cr4)(vcpu, cr4);
+
+	kvm_post_set_cr4(vcpu, old_cr4, cr4);
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr4);
+
+int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
+{
+	if (cr8 & CR8_RESERVED_BITS)
+		return 1;
+	if (lapic_in_kernel(vcpu))
+		kvm_lapic_set_tpr(vcpu, cr8);
+	else
+		vcpu->arch.cr8 = cr8;
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr8);
+
+unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
+{
+	if (lapic_in_kernel(vcpu))
+		return kvm_lapic_get_cr8(vcpu);
+	else
+		return vcpu->arch.cr8;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_cr8);
+
+static void __get_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
+{
+	struct desc_ptr dt;
+
+	if (vcpu->arch.guest_state_protected)
+		goto skip_protected_regs;
+
+	kvm_handle_exception_payload_quirk(vcpu);
+
+	kvm_get_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
+	kvm_get_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
+	kvm_get_segment(vcpu, &sregs->es, VCPU_SREG_ES);
+	kvm_get_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
+	kvm_get_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
+	kvm_get_segment(vcpu, &sregs->ss, VCPU_SREG_SS);
+
+	kvm_get_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
+	kvm_get_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);
+
+	kvm_x86_call(get_idt)(vcpu, &dt);
+	sregs->idt.limit = dt.size;
+	sregs->idt.base = dt.address;
+	kvm_x86_call(get_gdt)(vcpu, &dt);
+	sregs->gdt.limit = dt.size;
+	sregs->gdt.base = dt.address;
+
+	sregs->cr2 = vcpu->arch.cr2;
+	sregs->cr3 = kvm_read_cr3(vcpu);
+
+skip_protected_regs:
+	sregs->cr0 = kvm_read_cr0(vcpu);
+	sregs->cr4 = kvm_read_cr4(vcpu);
+	sregs->cr8 = kvm_get_cr8(vcpu);
+	sregs->efer = vcpu->arch.efer;
+	sregs->apic_base = vcpu->arch.apic_base;
+}
+
+static void __get_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
+{
+	__get_sregs_common(vcpu, sregs);
+
+	if (vcpu->arch.guest_state_protected)
+		return;
+
+	if (vcpu->arch.interrupt.injected && !vcpu->arch.interrupt.soft)
+		set_bit(vcpu->arch.interrupt.nr,
+			(unsigned long *)sregs->interrupt_bitmap);
+}
+
+int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs *sregs)
+{
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	vcpu_load(vcpu);
+	__get_sregs(vcpu, sregs);
+	vcpu_put(vcpu);
+	return 0;
+}
+
+void kvm_x86_vcpu_ioctl_get_sregs2(struct kvm_vcpu *vcpu,
+				   struct kvm_sregs2 *sregs2)
+{
+	int i;
+
+	__get_sregs_common(vcpu, (struct kvm_sregs *)sregs2);
+
+	if (vcpu->arch.guest_state_protected)
+		return;
+
+	if (is_pae_paging(vcpu)) {
+		kvm_vcpu_srcu_read_lock(vcpu);
+		for (i = 0 ; i < 4 ; i++)
+			sregs2->pdptrs[i] = kvm_pdptr_read(vcpu, i);
+		sregs2->flags |= KVM_SREGS2_FLAGS_PDPTRS_VALID;
+		kvm_vcpu_srcu_read_unlock(vcpu);
+	}
+}
+
+static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
+{
+	if ((sregs->efer & EFER_LME) && (sregs->cr0 & X86_CR0_PG)) {
+		/*
+		 * When EFER.LME and CR0.PG are set, the processor is in
+		 * 64-bit mode (though maybe in a 32-bit code segment).
+		 * CR4.PAE and EFER.LMA must be set.
+		 */
+		if (!(sregs->cr4 & X86_CR4_PAE) || !(sregs->efer & EFER_LMA))
+			return false;
+		if (!kvm_vcpu_is_legal_cr3(vcpu, sregs->cr3))
+			return false;
+	} else {
+		/*
+		 * Not in 64-bit mode: EFER.LMA is clear and the code
+		 * segment cannot be 64-bit.
+		 */
+		if (sregs->efer & EFER_LMA || sregs->cs.l)
+			return false;
+	}
+
+	return kvm_is_valid_cr4(vcpu, sregs->cr4) &&
+	       kvm_is_valid_cr0(vcpu, sregs->cr0);
+}
+
+static int __set_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs,
+			      int *mmu_reset_needed, bool update_pdptrs)
+{
+	int idx;
+	struct desc_ptr dt;
+
+	if (!kvm_is_valid_sregs(vcpu, sregs))
+		return -EINVAL;
+
+	if (kvm_apic_set_base(vcpu, sregs->apic_base, true))
+		return -EINVAL;
+
+	if (vcpu->arch.guest_state_protected)
+		return 0;
+
+	dt.size = sregs->idt.limit;
+	dt.address = sregs->idt.base;
+	kvm_x86_call(set_idt)(vcpu, &dt);
+	dt.size = sregs->gdt.limit;
+	dt.address = sregs->gdt.base;
+	kvm_x86_call(set_gdt)(vcpu, &dt);
+
+	vcpu->arch.cr2 = sregs->cr2;
+	*mmu_reset_needed |= kvm_read_cr3(vcpu) != sregs->cr3;
+	vcpu->arch.cr3 = sregs->cr3;
+	kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
+	kvm_x86_call(post_set_cr3)(vcpu, sregs->cr3);
+
+	kvm_set_cr8(vcpu, sregs->cr8);
+
+	*mmu_reset_needed |= vcpu->arch.efer != sregs->efer;
+	kvm_x86_call(set_efer)(vcpu, sregs->efer);
+
+	*mmu_reset_needed |= kvm_read_cr0(vcpu) != sregs->cr0;
+	kvm_x86_call(set_cr0)(vcpu, sregs->cr0);
+
+	*mmu_reset_needed |= kvm_read_cr4(vcpu) != sregs->cr4;
+	kvm_x86_call(set_cr4)(vcpu, sregs->cr4);
+
+	if (update_pdptrs) {
+		idx = srcu_read_lock(&vcpu->kvm->srcu);
+		if (is_pae_paging(vcpu)) {
+			load_pdptrs(vcpu, kvm_read_cr3(vcpu));
+			*mmu_reset_needed = 1;
+		}
+		srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	}
+
+	kvm_set_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
+	kvm_set_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
+	kvm_set_segment(vcpu, &sregs->es, VCPU_SREG_ES);
+	kvm_set_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
+	kvm_set_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
+	kvm_set_segment(vcpu, &sregs->ss, VCPU_SREG_SS);
+
+	kvm_set_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
+	kvm_set_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);
+
+	kvm_lapic_update_cr8_intercept(vcpu);
+
+	/* Older userspace won't unhalt the vcpu on reset. */
+	if (kvm_vcpu_is_bsp(vcpu) && kvm_rip_read(vcpu) == 0xfff0 &&
+	    sregs->cs.selector == 0xf000 && sregs->cs.base == 0xffff0000 &&
+	    !is_protmode(vcpu))
+		kvm_set_mp_state(vcpu, KVM_MP_STATE_RUNNABLE);
+
+	return 0;
+}
+
+static int __set_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
+{
+	int pending_vec, max_bits;
+	int mmu_reset_needed = 0;
+	int ret = __set_sregs_common(vcpu, sregs, &mmu_reset_needed, true);
+
+	if (ret)
+		return ret;
+
+	if (mmu_reset_needed) {
+		kvm_mmu_reset_context(vcpu);
+		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+	}
+
+	max_bits = KVM_NR_INTERRUPTS;
+	pending_vec = find_first_bit(
+		(const unsigned long *)sregs->interrupt_bitmap, max_bits);
+
+	if (pending_vec < max_bits) {
+		kvm_queue_interrupt(vcpu, pending_vec, false);
+		pr_debug("Set back pending irq %d\n", pending_vec);
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+	}
+	return 0;
+}
+
+int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs *sregs)
+{
+	int ret;
+
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	vcpu_load(vcpu);
+	ret = __set_sregs(vcpu, sregs);
+	vcpu_put(vcpu);
+	return ret;
+}
+
+int kvm_x86_vcpu_ioctl_set_sregs2(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs2 *sregs2)
+{
+	int mmu_reset_needed = 0;
+	bool valid_pdptrs = sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID;
+	bool pae = (sregs2->cr0 & X86_CR0_PG) && (sregs2->cr4 & X86_CR4_PAE) &&
+		!(sregs2->efer & EFER_LMA);
+	int i, ret;
+
+	if (sregs2->flags & ~KVM_SREGS2_FLAGS_PDPTRS_VALID)
+		return -EINVAL;
+
+	if (valid_pdptrs && (!pae || vcpu->arch.guest_state_protected))
+		return -EINVAL;
+
+	ret = __set_sregs_common(vcpu, (struct kvm_sregs *)sregs2,
+				 &mmu_reset_needed, !valid_pdptrs);
+	if (ret)
+		return ret;
+
+	if (valid_pdptrs) {
+		for (i = 0; i < 4 ; i++)
+			kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
+
+		kvm_register_mark_dirty(vcpu, VCPU_REG_PDPTR);
+		mmu_reset_needed = 1;
+		vcpu->arch.pdptrs_from_userspace = true;
+	}
+	if (mmu_reset_needed) {
+		kvm_mmu_reset_context(vcpu);
+		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+	}
+	return 0;
+}
+
+void kvm_run_get_regs(struct kvm_vcpu *vcpu)
+{
+	BUILD_BUG_ON(sizeof(struct kvm_sync_regs) > SYNC_REGS_SIZE_BYTES);
+
+	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_REGS)
+		__get_regs(vcpu, &vcpu->run->s.regs.regs);
+
+	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_SREGS)
+		__get_sregs(vcpu, &vcpu->run->s.regs.sregs);
+}
+
+int kvm_run_set_regs(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_REGS) {
+		__set_regs(vcpu, &vcpu->run->s.regs.regs);
+		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_REGS;
+	}
+
+	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
+		struct kvm_sregs sregs = vcpu->run->s.regs.sregs;
+
+		if (__set_sregs(vcpu, &sregs))
+			return -EINVAL;
+
+		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_SREGS;
+	}
+
+	return 0;
+}
+
+void kvm_update_dr0123(struct kvm_vcpu *vcpu)
+{
+	int i;
+
+	if (!(vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP)) {
+		for (i = 0; i < KVM_NR_DB_REGS; i++)
+			vcpu->arch.eff_db[i] = vcpu->arch.db[i];
+	}
+}
+
+void kvm_update_dr7(struct kvm_vcpu *vcpu)
+{
+	unsigned long dr7;
+
+	if (vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP)
+		dr7 = vcpu->arch.guest_debug_dr7;
+	else
+		dr7 = vcpu->arch.dr7;
+	kvm_x86_call(set_dr7)(vcpu, dr7);
+	vcpu->arch.switch_db_regs &= ~KVM_DEBUGREG_BP_ENABLED;
+	if (dr7 & DR7_BP_EN_MASK)
+		vcpu->arch.switch_db_regs |= KVM_DEBUGREG_BP_ENABLED;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
+
+static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
+{
+	u64 fixed = DR6_FIXED_1;
+
+	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
+		fixed |= DR6_RTM;
+
+	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
+		fixed |= DR6_BUS_LOCK;
+	return fixed;
+}
+
+int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
+{
+	size_t size = ARRAY_SIZE(vcpu->arch.db);
+
+	switch (dr) {
+	case 0 ... 3:
+		vcpu->arch.db[array_index_nospec(dr, size)] = val;
+		if (!(vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP))
+			vcpu->arch.eff_db[dr] = val;
+		break;
+	case 4:
+	case 6:
+		if (!kvm_dr6_valid(val))
+			return 1; /* #GP */
+		vcpu->arch.dr6 = (val & DR6_VOLATILE) | kvm_dr6_fixed(vcpu);
+		break;
+	case 5:
+	default: /* 7 */
+		if (!kvm_dr7_valid(val))
+			return 1; /* #GP */
+		vcpu->arch.dr7 = (val & DR7_VOLATILE) | DR7_FIXED_1;
+		kvm_update_dr7(vcpu);
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_dr);
+
+unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
+{
+	size_t size = ARRAY_SIZE(vcpu->arch.db);
+
+	switch (dr) {
+	case 0 ... 3:
+		return vcpu->arch.db[array_index_nospec(dr, size)];
+	case 4:
+	case 6:
+		return vcpu->arch.dr6;
+	case 5:
+	default: /* 7 */
+		return vcpu->arch.dr7;
+	}
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_dr);
+
+int kvm_vcpu_ioctl_x86_get_debugregs(struct kvm_vcpu *vcpu,
+				     struct kvm_debugregs *dbgregs)
+{
+	unsigned int i;
+
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	kvm_handle_exception_payload_quirk(vcpu);
+
+	memset(dbgregs, 0, sizeof(*dbgregs));
+
+	BUILD_BUG_ON(ARRAY_SIZE(vcpu->arch.db) != ARRAY_SIZE(dbgregs->db));
+	for (i = 0; i < ARRAY_SIZE(vcpu->arch.db); i++)
+		dbgregs->db[i] = vcpu->arch.db[i];
+
+	dbgregs->dr6 = vcpu->arch.dr6;
+	dbgregs->dr7 = vcpu->arch.dr7;
+	return 0;
+}
+
+int kvm_vcpu_ioctl_x86_set_debugregs(struct kvm_vcpu *vcpu,
+				     struct kvm_debugregs *dbgregs)
+{
+	unsigned int i;
+
+	if (vcpu->kvm->arch.has_protected_state &&
+	    vcpu->arch.guest_state_protected)
+		return -EINVAL;
+
+	if (dbgregs->flags)
+		return -EINVAL;
+
+	if (!kvm_dr6_valid(dbgregs->dr6))
+		return -EINVAL;
+	if (!kvm_dr7_valid(dbgregs->dr7))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(vcpu->arch.db); i++)
+		vcpu->arch.db[i] = dbgregs->db[i];
+
+	kvm_update_dr0123(vcpu);
+	vcpu->arch.dr6 = dbgregs->dr6;
+	vcpu->arch.dr7 = dbgregs->dr7;
+	kvm_update_dr7(vcpu);
+
+	return 0;
+}
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index d4d2a47a4968..875a1b66d67a 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -401,4 +401,20 @@ static inline bool is_guest_mode(struct kvm_vcpu *vcpu)
 	return vcpu->arch.hflags & HF_GUEST_MASK;
 }
 
+void kvm_x86_vcpu_ioctl_get_sregs2(struct kvm_vcpu *vcpu,
+				   struct kvm_sregs2 *sregs2);
+int kvm_x86_vcpu_ioctl_set_sregs2(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs2 *sregs2);
+
+void kvm_run_get_regs(struct kvm_vcpu *vcpu);
+int kvm_run_set_regs(struct kvm_vcpu *vcpu);
+
+void kvm_update_dr0123(struct kvm_vcpu *vcpu);
+void kvm_update_dr7(struct kvm_vcpu *vcpu);
+int kvm_vcpu_ioctl_x86_get_debugregs(struct kvm_vcpu *vcpu,
+				     struct kvm_debugregs *dbgregs);
+int kvm_vcpu_ioctl_x86_set_debugregs(struct kvm_vcpu *vcpu,
+				     struct kvm_debugregs *dbgregs);
+
+
 #endif
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e664e874973b..4ba1e329ac68 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -134,9 +134,6 @@ static void store_regs(struct kvm_vcpu *vcpu);
 static int sync_regs(struct kvm_vcpu *vcpu);
 static int kvm_vcpu_do_singlestep(struct kvm_vcpu *vcpu);
 
-static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
-static void __get_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
-
 static DEFINE_MUTEX(vendor_module_lock);
 static void kvm_load_guest_fpu(struct kvm_vcpu *vcpu);
 static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu);
@@ -1042,170 +1039,6 @@ bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_require_dr);
 
-static inline u64 pdptr_rsvd_bits(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.reserved_gpa_bits | rsvd_bits(5, 8) | rsvd_bits(1, 2);
-}
-
-/*
- * Load the pae pdptrs.  Return 1 if they are all valid, 0 otherwise.
- */
-int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3)
-{
-	struct kvm_mmu *mmu = vcpu->arch.walk_mmu;
-	gfn_t pdpt_gfn = cr3 >> PAGE_SHIFT;
-	gpa_t real_gpa;
-	int i;
-	int ret;
-	u64 pdpte[ARRAY_SIZE(mmu->pdptrs)];
-
-	/*
-	 * If the MMU is nested, CR3 holds an L2 GPA and needs to be translated
-	 * to an L1 GPA.
-	 */
-	real_gpa = kvm_translate_gpa(vcpu, mmu, gfn_to_gpa(pdpt_gfn),
-				     PFERR_USER_MASK | PFERR_WRITE_MASK |
-				     PFERR_GUEST_PAGE_MASK, NULL, 0);
-	if (real_gpa == INVALID_GPA)
-		return 0;
-
-	/* Note the offset, PDPTRs are 32 byte aligned when using PAE paging. */
-	ret = kvm_vcpu_read_guest_page(vcpu, gpa_to_gfn(real_gpa), pdpte,
-				       cr3 & GENMASK(11, 5), sizeof(pdpte));
-	if (ret < 0)
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(pdpte); ++i) {
-		if ((pdpte[i] & PT_PRESENT_MASK) &&
-		    (pdpte[i] & pdptr_rsvd_bits(vcpu))) {
-			return 0;
-		}
-	}
-
-	/*
-	 * Marking VCPU_REG_PDPTR dirty doesn't work for !tdp_enabled.
-	 * Shadow page roots need to be reconstructed instead.
-	 */
-	if (!tdp_enabled && memcmp(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs)))
-		kvm_mmu_free_roots(vcpu->kvm, mmu, KVM_MMU_ROOT_CURRENT);
-
-	memcpy(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs));
-	kvm_register_mark_dirty(vcpu, VCPU_REG_PDPTR);
-	kvm_make_request(KVM_REQ_LOAD_MMU_PGD, vcpu);
-	vcpu->arch.pdptrs_from_userspace = false;
-
-	return 1;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(load_pdptrs);
-
-static bool kvm_is_valid_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
-{
-#ifdef CONFIG_X86_64
-	if (cr0 & 0xffffffff00000000UL)
-		return false;
-#endif
-
-	if ((cr0 & X86_CR0_NW) && !(cr0 & X86_CR0_CD))
-		return false;
-
-	if ((cr0 & X86_CR0_PG) && !(cr0 & X86_CR0_PE))
-		return false;
-
-	return kvm_x86_call(is_valid_cr0)(vcpu, cr0);
-}
-
-void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
-{
-	/*
-	 * CR0.WP is incorporated into the MMU role, but only for non-nested,
-	 * indirect shadow MMUs.  If paging is disabled, no updates are needed
-	 * as there are no permission bits to emulate.  If TDP is enabled, the
-	 * MMU's metadata needs to be updated, e.g. so that emulating guest
-	 * translations does the right thing, but there's no need to unload the
-	 * root as CR0.WP doesn't affect SPTEs.
-	 */
-	if ((cr0 ^ old_cr0) == X86_CR0_WP) {
-		if (!(cr0 & X86_CR0_PG))
-			return;
-
-		if (tdp_enabled) {
-			kvm_init_mmu(vcpu);
-			return;
-		}
-	}
-
-	if ((cr0 ^ old_cr0) & X86_CR0_PG) {
-		/*
-		 * Clearing CR0.PG is defined to flush the TLB from the guest's
-		 * perspective.
-		 */
-		if (!(cr0 & X86_CR0_PG))
-			kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
-		/*
-		 * Check for async #PF completion events when enabling paging,
-		 * as the vCPU may have previously encountered async #PFs (it's
-		 * entirely legal for the guest to toggle paging on/off without
-		 * waiting for the async #PF queue to drain).
-		 */
-		else if (kvm_pv_async_pf_enabled(vcpu))
-			kvm_make_request(KVM_REQ_APF_READY, vcpu);
-	}
-
-	if ((cr0 ^ old_cr0) & KVM_MMU_CR0_ROLE_BITS)
-		kvm_mmu_reset_context(vcpu);
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr0);
-
-int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
-{
-	unsigned long old_cr0 = kvm_read_cr0(vcpu);
-
-	if (!kvm_is_valid_cr0(vcpu, cr0))
-		return 1;
-
-	cr0 |= X86_CR0_ET;
-
-	/* Write to CR0 reserved bits are ignored, even on Intel. */
-	cr0 &= ~CR0_RESERVED_BITS;
-
-#ifdef CONFIG_X86_64
-	if ((vcpu->arch.efer & EFER_LME) && !is_paging(vcpu) &&
-	    (cr0 & X86_CR0_PG)) {
-		int cs_db, cs_l;
-
-		if (!is_pae(vcpu))
-			return 1;
-		kvm_x86_call(get_cs_db_l_bits)(vcpu, &cs_db, &cs_l);
-		if (cs_l)
-			return 1;
-	}
-#endif
-	if (!(vcpu->arch.efer & EFER_LME) && (cr0 & X86_CR0_PG) &&
-	    is_pae(vcpu) && ((cr0 ^ old_cr0) & X86_CR0_PDPTR_BITS) &&
-	    !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
-		return 1;
-
-	if (!(cr0 & X86_CR0_PG) &&
-	    (is_64_bit_mode(vcpu) || kvm_is_cr4_bit_set(vcpu, X86_CR4_PCIDE)))
-		return 1;
-
-	if (!(cr0 & X86_CR0_WP) && kvm_is_cr4_bit_set(vcpu, X86_CR4_CET))
-		return 1;
-
-	kvm_x86_call(set_cr0)(vcpu, cr0);
-
-	kvm_post_set_cr0(vcpu, old_cr0, cr0);
-
-	return 0;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr0);
-
-void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
-{
-	(void)kvm_set_cr0(vcpu, kvm_read_cr0_bits(vcpu, ~0x0eul) | (msw & 0x0f));
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_lmsw);
-
 static void kvm_load_xfeatures(struct kvm_vcpu *vcpu, bool load_guest)
 {
 	if (vcpu->arch.guest_state_protected)
@@ -1315,89 +1148,7 @@ int kvm_emulate_xsetbv(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_xsetbv);
 
-static bool kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
-{
-	return __kvm_is_valid_cr4(vcpu, cr4) &&
-	       kvm_x86_call(is_valid_cr4)(vcpu, cr4);
-}
-
-void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
-{
-	if ((cr4 ^ old_cr4) & KVM_MMU_CR4_ROLE_BITS)
-		kvm_mmu_reset_context(vcpu);
-
-	/*
-	 * If CR4.PCIDE is changed 0 -> 1, there is no need to flush the TLB
-	 * according to the SDM; however, stale prev_roots could be reused
-	 * incorrectly in the future after a MOV to CR3 with NOFLUSH=1, so we
-	 * free them all.  This is *not* a superset of KVM_REQ_TLB_FLUSH_GUEST
-	 * or KVM_REQ_TLB_FLUSH_CURRENT, because the hardware TLB is not flushed,
-	 * so fall through.
-	 */
-	if (!tdp_enabled &&
-	    (cr4 & X86_CR4_PCIDE) && !(old_cr4 & X86_CR4_PCIDE))
-		kvm_mmu_unload(vcpu);
-
-	/*
-	 * The TLB has to be flushed for all PCIDs if any of the following
-	 * (architecturally required) changes happen:
-	 * - CR4.PCIDE is changed from 1 to 0
-	 * - CR4.PGE is toggled
-	 *
-	 * This is a superset of KVM_REQ_TLB_FLUSH_CURRENT.
-	 */
-	if (((cr4 ^ old_cr4) & X86_CR4_PGE) ||
-	    (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
-		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
-
-	/*
-	 * The TLB has to be flushed for the current PCID if any of the
-	 * following (architecturally required) changes happen:
-	 * - CR4.SMEP is changed from 0 to 1
-	 * - CR4.PAE is toggled
-	 */
-	else if (((cr4 ^ old_cr4) & X86_CR4_PAE) ||
-		 ((cr4 & X86_CR4_SMEP) && !(old_cr4 & X86_CR4_SMEP)))
-		kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
-
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_post_set_cr4);
-
-int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
-{
-	unsigned long old_cr4 = kvm_read_cr4(vcpu);
-
-	if (!kvm_is_valid_cr4(vcpu, cr4))
-		return 1;
-
-	if (is_long_mode(vcpu)) {
-		if (!(cr4 & X86_CR4_PAE))
-			return 1;
-		if ((cr4 ^ old_cr4) & X86_CR4_LA57)
-			return 1;
-	} else if (is_paging(vcpu) && (cr4 & X86_CR4_PAE)
-		   && ((cr4 ^ old_cr4) & X86_CR4_PDPTR_BITS)
-		   && !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
-		return 1;
-
-	if ((cr4 & X86_CR4_PCIDE) && !(old_cr4 & X86_CR4_PCIDE)) {
-		/* PCID can not be enabled when cr3[11:0]!=000H or EFER.LMA=0 */
-		if ((kvm_read_cr3(vcpu) & X86_CR3_PCID_MASK) || !is_long_mode(vcpu))
-			return 1;
-	}
-
-	if ((cr4 & X86_CR4_CET) && !kvm_is_cr0_bit_set(vcpu, X86_CR0_WP))
-		return 1;
-
-	kvm_x86_call(set_cr4)(vcpu, cr4);
-
-	kvm_post_set_cr4(vcpu, old_cr4, cr4);
-
-	return 0;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr4);
-
-static void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid)
+void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid)
 {
 	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	unsigned long roots_to_free = 0;
@@ -1440,159 +1191,6 @@ static void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid)
 	kvm_mmu_free_roots(vcpu->kvm, mmu, roots_to_free);
 }
 
-int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
-{
-	bool skip_tlb_flush = false;
-	unsigned long pcid = 0;
-#ifdef CONFIG_X86_64
-	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_PCIDE)) {
-		skip_tlb_flush = cr3 & X86_CR3_PCID_NOFLUSH;
-		cr3 &= ~X86_CR3_PCID_NOFLUSH;
-		pcid = cr3 & X86_CR3_PCID_MASK;
-	}
-#endif
-
-	/* PDPTRs are always reloaded for PAE paging. */
-	if (cr3 == kvm_read_cr3(vcpu) && !is_pae_paging(vcpu))
-		goto handle_tlb_flush;
-
-	/*
-	 * Do not condition the GPA check on long mode, this helper is used to
-	 * stuff CR3, e.g. for RSM emulation, and there is no guarantee that
-	 * the current vCPU mode is accurate.
-	 */
-	if (!kvm_vcpu_is_legal_cr3(vcpu, cr3))
-		return 1;
-
-	if (is_pae_paging(vcpu) && !load_pdptrs(vcpu, cr3))
-		return 1;
-
-	if (cr3 != kvm_read_cr3(vcpu))
-		kvm_mmu_new_pgd(vcpu, cr3);
-
-	vcpu->arch.cr3 = cr3;
-	kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
-	/* Do not call post_set_cr3, we do not get here for confidential guests.  */
-
-handle_tlb_flush:
-	/*
-	 * A load of CR3 that flushes the TLB flushes only the current PCID,
-	 * even if PCID is disabled, in which case PCID=0 is flushed.  It's a
-	 * moot point in the end because _disabling_ PCID will flush all PCIDs,
-	 * and it's impossible to use a non-zero PCID when PCID is disabled,
-	 * i.e. only PCID=0 can be relevant.
-	 */
-	if (!skip_tlb_flush)
-		kvm_invalidate_pcid(vcpu, pcid);
-
-	return 0;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr3);
-
-int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
-{
-	if (cr8 & CR8_RESERVED_BITS)
-		return 1;
-	if (lapic_in_kernel(vcpu))
-		kvm_lapic_set_tpr(vcpu, cr8);
-	else
-		vcpu->arch.cr8 = cr8;
-	return 0;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr8);
-
-unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu)
-{
-	if (lapic_in_kernel(vcpu))
-		return kvm_lapic_get_cr8(vcpu);
-	else
-		return vcpu->arch.cr8;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_cr8);
-
-static void kvm_update_dr0123(struct kvm_vcpu *vcpu)
-{
-	int i;
-
-	if (!(vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP)) {
-		for (i = 0; i < KVM_NR_DB_REGS; i++)
-			vcpu->arch.eff_db[i] = vcpu->arch.db[i];
-	}
-}
-
-void kvm_update_dr7(struct kvm_vcpu *vcpu)
-{
-	unsigned long dr7;
-
-	if (vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP)
-		dr7 = vcpu->arch.guest_debug_dr7;
-	else
-		dr7 = vcpu->arch.dr7;
-	kvm_x86_call(set_dr7)(vcpu, dr7);
-	vcpu->arch.switch_db_regs &= ~KVM_DEBUGREG_BP_ENABLED;
-	if (dr7 & DR7_BP_EN_MASK)
-		vcpu->arch.switch_db_regs |= KVM_DEBUGREG_BP_ENABLED;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
-
-static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
-{
-	u64 fixed = DR6_FIXED_1;
-
-	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
-		fixed |= DR6_RTM;
-
-	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
-		fixed |= DR6_BUS_LOCK;
-	return fixed;
-}
-
-int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
-{
-	size_t size = ARRAY_SIZE(vcpu->arch.db);
-
-	switch (dr) {
-	case 0 ... 3:
-		vcpu->arch.db[array_index_nospec(dr, size)] = val;
-		if (!(vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP))
-			vcpu->arch.eff_db[dr] = val;
-		break;
-	case 4:
-	case 6:
-		if (!kvm_dr6_valid(val))
-			return 1; /* #GP */
-		vcpu->arch.dr6 = (val & DR6_VOLATILE) | kvm_dr6_fixed(vcpu);
-		break;
-	case 5:
-	default: /* 7 */
-		if (!kvm_dr7_valid(val))
-			return 1; /* #GP */
-		vcpu->arch.dr7 = (val & DR7_VOLATILE) | DR7_FIXED_1;
-		kvm_update_dr7(vcpu);
-		break;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_dr);
-
-unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr)
-{
-	size_t size = ARRAY_SIZE(vcpu->arch.db);
-
-	switch (dr) {
-	case 0 ... 3:
-		return vcpu->arch.db[array_index_nospec(dr, size)];
-	case 4:
-	case 6:
-		return vcpu->arch.dr6;
-	case 5:
-	default: /* 7 */
-		return vcpu->arch.dr7;
-	}
-}
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_dr);
-
 int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu)
 {
 	u32 pmc = kvm_ecx_read(vcpu);
@@ -5544,7 +5142,7 @@ static struct kvm_queued_exception *kvm_get_exception_to_save(struct kvm_vcpu *v
 	return &vcpu->arch.exception;
 }
 
-static void kvm_handle_exception_payload_quirk(struct kvm_vcpu *vcpu)
+void kvm_handle_exception_payload_quirk(struct kvm_vcpu *vcpu)
 {
 	struct kvm_queued_exception *ex = kvm_get_exception_to_save(vcpu);
 
@@ -5748,57 +5346,6 @@ static int kvm_vcpu_ioctl_x86_set_vcpu_events(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static int kvm_vcpu_ioctl_x86_get_debugregs(struct kvm_vcpu *vcpu,
-					    struct kvm_debugregs *dbgregs)
-{
-	unsigned int i;
-
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	kvm_handle_exception_payload_quirk(vcpu);
-
-	memset(dbgregs, 0, sizeof(*dbgregs));
-
-	BUILD_BUG_ON(ARRAY_SIZE(vcpu->arch.db) != ARRAY_SIZE(dbgregs->db));
-	for (i = 0; i < ARRAY_SIZE(vcpu->arch.db); i++)
-		dbgregs->db[i] = vcpu->arch.db[i];
-
-	dbgregs->dr6 = vcpu->arch.dr6;
-	dbgregs->dr7 = vcpu->arch.dr7;
-	return 0;
-}
-
-static int kvm_vcpu_ioctl_x86_set_debugregs(struct kvm_vcpu *vcpu,
-					    struct kvm_debugregs *dbgregs)
-{
-	unsigned int i;
-
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	if (dbgregs->flags)
-		return -EINVAL;
-
-	if (!kvm_dr6_valid(dbgregs->dr6))
-		return -EINVAL;
-	if (!kvm_dr7_valid(dbgregs->dr7))
-		return -EINVAL;
-
-	for (i = 0; i < ARRAY_SIZE(vcpu->arch.db); i++)
-		vcpu->arch.db[i] = dbgregs->db[i];
-
-	kvm_update_dr0123(vcpu);
-	vcpu->arch.dr6 = dbgregs->dr6;
-	vcpu->arch.dr7 = dbgregs->dr7;
-	kvm_update_dr7(vcpu);
-
-	return 0;
-}
-
-
 static int kvm_vcpu_ioctl_x86_get_xsave2(struct kvm_vcpu *vcpu,
 					 u8 *state, unsigned int size)
 {
@@ -6635,7 +6182,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 		r = -ENOMEM;
 		if (!u.sregs2)
 			goto out;
-		__get_sregs2(vcpu, u.sregs2);
+		kvm_x86_vcpu_ioctl_get_sregs2(vcpu, u.sregs2);
 		r = -EFAULT;
 		if (copy_to_user(argp, u.sregs2, sizeof(struct kvm_sregs2)))
 			goto out;
@@ -6654,7 +6201,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 			u.sregs2 = NULL;
 			goto out;
 		}
-		r = __set_sregs2(vcpu, u.sregs2);
+		r = kvm_x86_vcpu_ioctl_set_sregs2(vcpu, u.sregs2);
 		break;
 	}
 	case KVM_HAS_DEVICE_ATTR:
@@ -12081,179 +11628,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	return r;
 }
 
-static void __get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
-{
-	if (vcpu->arch.emulate_regs_need_sync_to_vcpu) {
-		/*
-		 * We are here if userspace calls get_regs() in the middle of
-		 * instruction emulation. Registers state needs to be copied
-		 * back from emulation context to vcpu. Userspace shouldn't do
-		 * that usually, but some bad designed PV devices (vmware
-		 * backdoor interface) need this to work
-		 */
-		emulator_writeback_register_cache(vcpu->arch.emulate_ctxt);
-		vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
-	}
-	regs->rax = kvm_rax_read_raw(vcpu);
-	regs->rbx = kvm_rbx_read_raw(vcpu);
-	regs->rcx = kvm_rcx_read_raw(vcpu);
-	regs->rdx = kvm_rdx_read_raw(vcpu);
-	regs->rsi = kvm_rsi_read_raw(vcpu);
-	regs->rdi = kvm_rdi_read_raw(vcpu);
-	regs->rsp = kvm_rsp_read(vcpu);
-	regs->rbp = kvm_rbp_read_raw(vcpu);
-#ifdef CONFIG_X86_64
-	regs->r8 = kvm_r8_read_raw(vcpu);
-	regs->r9 = kvm_r9_read_raw(vcpu);
-	regs->r10 = kvm_r10_read_raw(vcpu);
-	regs->r11 = kvm_r11_read_raw(vcpu);
-	regs->r12 = kvm_r12_read_raw(vcpu);
-	regs->r13 = kvm_r13_read_raw(vcpu);
-	regs->r14 = kvm_r14_read_raw(vcpu);
-	regs->r15 = kvm_r15_read_raw(vcpu);
-#endif
-
-	regs->rip = kvm_rip_read(vcpu);
-	regs->rflags = kvm_get_rflags(vcpu);
-}
-
-int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
-{
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	vcpu_load(vcpu);
-	__get_regs(vcpu, regs);
-	vcpu_put(vcpu);
-	return 0;
-}
-
-static void __set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
-{
-	vcpu->arch.emulate_regs_need_sync_from_vcpu = true;
-	vcpu->arch.emulate_regs_need_sync_to_vcpu = false;
-
-	kvm_rax_write_raw(vcpu, regs->rax);
-	kvm_rbx_write_raw(vcpu, regs->rbx);
-	kvm_rcx_write_raw(vcpu, regs->rcx);
-	kvm_rdx_write_raw(vcpu, regs->rdx);
-	kvm_rsi_write_raw(vcpu, regs->rsi);
-	kvm_rdi_write_raw(vcpu, regs->rdi);
-	kvm_rsp_write(vcpu, regs->rsp);
-	kvm_rbp_write_raw(vcpu, regs->rbp);
-#ifdef CONFIG_X86_64
-	kvm_r8_write_raw(vcpu, regs->r8);
-	kvm_r9_write_raw(vcpu, regs->r9);
-	kvm_r10_write_raw(vcpu, regs->r10);
-	kvm_r11_write_raw(vcpu, regs->r11);
-	kvm_r12_write_raw(vcpu, regs->r12);
-	kvm_r13_write_raw(vcpu, regs->r13);
-	kvm_r14_write_raw(vcpu, regs->r14);
-	kvm_r15_write_raw(vcpu, regs->r15);
-#endif
-
-	kvm_rip_write(vcpu, regs->rip);
-	kvm_set_rflags(vcpu, regs->rflags | X86_EFLAGS_FIXED);
-
-	vcpu->arch.exception.pending = false;
-	vcpu->arch.exception_vmexit.pending = false;
-
-	kvm_make_request(KVM_REQ_EVENT, vcpu);
-}
-
-int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
-{
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	vcpu_load(vcpu);
-	__set_regs(vcpu, regs);
-	vcpu_put(vcpu);
-	return 0;
-}
-
-static void __get_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
-{
-	struct desc_ptr dt;
-
-	if (vcpu->arch.guest_state_protected)
-		goto skip_protected_regs;
-
-	kvm_handle_exception_payload_quirk(vcpu);
-
-	kvm_get_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
-	kvm_get_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
-	kvm_get_segment(vcpu, &sregs->es, VCPU_SREG_ES);
-	kvm_get_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
-	kvm_get_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
-	kvm_get_segment(vcpu, &sregs->ss, VCPU_SREG_SS);
-
-	kvm_get_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
-	kvm_get_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);
-
-	kvm_x86_call(get_idt)(vcpu, &dt);
-	sregs->idt.limit = dt.size;
-	sregs->idt.base = dt.address;
-	kvm_x86_call(get_gdt)(vcpu, &dt);
-	sregs->gdt.limit = dt.size;
-	sregs->gdt.base = dt.address;
-
-	sregs->cr2 = vcpu->arch.cr2;
-	sregs->cr3 = kvm_read_cr3(vcpu);
-
-skip_protected_regs:
-	sregs->cr0 = kvm_read_cr0(vcpu);
-	sregs->cr4 = kvm_read_cr4(vcpu);
-	sregs->cr8 = kvm_get_cr8(vcpu);
-	sregs->efer = vcpu->arch.efer;
-	sregs->apic_base = vcpu->arch.apic_base;
-}
-
-static void __get_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
-{
-	__get_sregs_common(vcpu, sregs);
-
-	if (vcpu->arch.guest_state_protected)
-		return;
-
-	if (vcpu->arch.interrupt.injected && !vcpu->arch.interrupt.soft)
-		set_bit(vcpu->arch.interrupt.nr,
-			(unsigned long *)sregs->interrupt_bitmap);
-}
-
-static void __get_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2)
-{
-	int i;
-
-	__get_sregs_common(vcpu, (struct kvm_sregs *)sregs2);
-
-	if (vcpu->arch.guest_state_protected)
-		return;
-
-	if (is_pae_paging(vcpu)) {
-		kvm_vcpu_srcu_read_lock(vcpu);
-		for (i = 0 ; i < 4 ; i++)
-			sregs2->pdptrs[i] = kvm_pdptr_read(vcpu, i);
-		sregs2->flags |= KVM_SREGS2_FLAGS_PDPTRS_VALID;
-		kvm_vcpu_srcu_read_unlock(vcpu);
-	}
-}
-
-int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
-				  struct kvm_sregs *sregs)
-{
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	vcpu_load(vcpu);
-	__get_sregs(vcpu, sregs);
-	vcpu_put(vcpu);
-	return 0;
-}
-
 int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
 				    struct kvm_mp_state *mp_state)
 {
@@ -12373,175 +11747,6 @@ int kvm_task_switch(struct kvm_vcpu *vcpu, u16 tss_selector, int idt_index,
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_task_switch);
 
-static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
-{
-	if ((sregs->efer & EFER_LME) && (sregs->cr0 & X86_CR0_PG)) {
-		/*
-		 * When EFER.LME and CR0.PG are set, the processor is in
-		 * 64-bit mode (though maybe in a 32-bit code segment).
-		 * CR4.PAE and EFER.LMA must be set.
-		 */
-		if (!(sregs->cr4 & X86_CR4_PAE) || !(sregs->efer & EFER_LMA))
-			return false;
-		if (!kvm_vcpu_is_legal_cr3(vcpu, sregs->cr3))
-			return false;
-	} else {
-		/*
-		 * Not in 64-bit mode: EFER.LMA is clear and the code
-		 * segment cannot be 64-bit.
-		 */
-		if (sregs->efer & EFER_LMA || sregs->cs.l)
-			return false;
-	}
-
-	return kvm_is_valid_cr4(vcpu, sregs->cr4) &&
-	       kvm_is_valid_cr0(vcpu, sregs->cr0);
-}
-
-static int __set_sregs_common(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs,
-		int *mmu_reset_needed, bool update_pdptrs)
-{
-	int idx;
-	struct desc_ptr dt;
-
-	if (!kvm_is_valid_sregs(vcpu, sregs))
-		return -EINVAL;
-
-	if (kvm_apic_set_base(vcpu, sregs->apic_base, true))
-		return -EINVAL;
-
-	if (vcpu->arch.guest_state_protected)
-		return 0;
-
-	dt.size = sregs->idt.limit;
-	dt.address = sregs->idt.base;
-	kvm_x86_call(set_idt)(vcpu, &dt);
-	dt.size = sregs->gdt.limit;
-	dt.address = sregs->gdt.base;
-	kvm_x86_call(set_gdt)(vcpu, &dt);
-
-	vcpu->arch.cr2 = sregs->cr2;
-	*mmu_reset_needed |= kvm_read_cr3(vcpu) != sregs->cr3;
-	vcpu->arch.cr3 = sregs->cr3;
-	kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
-	kvm_x86_call(post_set_cr3)(vcpu, sregs->cr3);
-
-	kvm_set_cr8(vcpu, sregs->cr8);
-
-	*mmu_reset_needed |= vcpu->arch.efer != sregs->efer;
-	kvm_x86_call(set_efer)(vcpu, sregs->efer);
-
-	*mmu_reset_needed |= kvm_read_cr0(vcpu) != sregs->cr0;
-	kvm_x86_call(set_cr0)(vcpu, sregs->cr0);
-
-	*mmu_reset_needed |= kvm_read_cr4(vcpu) != sregs->cr4;
-	kvm_x86_call(set_cr4)(vcpu, sregs->cr4);
-
-	if (update_pdptrs) {
-		idx = srcu_read_lock(&vcpu->kvm->srcu);
-		if (is_pae_paging(vcpu)) {
-			load_pdptrs(vcpu, kvm_read_cr3(vcpu));
-			*mmu_reset_needed = 1;
-		}
-		srcu_read_unlock(&vcpu->kvm->srcu, idx);
-	}
-
-	kvm_set_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
-	kvm_set_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
-	kvm_set_segment(vcpu, &sregs->es, VCPU_SREG_ES);
-	kvm_set_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
-	kvm_set_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
-	kvm_set_segment(vcpu, &sregs->ss, VCPU_SREG_SS);
-
-	kvm_set_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
-	kvm_set_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);
-
-	kvm_lapic_update_cr8_intercept(vcpu);
-
-	/* Older userspace won't unhalt the vcpu on reset. */
-	if (kvm_vcpu_is_bsp(vcpu) && kvm_rip_read(vcpu) == 0xfff0 &&
-	    sregs->cs.selector == 0xf000 && sregs->cs.base == 0xffff0000 &&
-	    !is_protmode(vcpu))
-		kvm_set_mp_state(vcpu, KVM_MP_STATE_RUNNABLE);
-
-	return 0;
-}
-
-static int __set_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
-{
-	int pending_vec, max_bits;
-	int mmu_reset_needed = 0;
-	int ret = __set_sregs_common(vcpu, sregs, &mmu_reset_needed, true);
-
-	if (ret)
-		return ret;
-
-	if (mmu_reset_needed) {
-		kvm_mmu_reset_context(vcpu);
-		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
-	}
-
-	max_bits = KVM_NR_INTERRUPTS;
-	pending_vec = find_first_bit(
-		(const unsigned long *)sregs->interrupt_bitmap, max_bits);
-
-	if (pending_vec < max_bits) {
-		kvm_queue_interrupt(vcpu, pending_vec, false);
-		pr_debug("Set back pending irq %d\n", pending_vec);
-		kvm_make_request(KVM_REQ_EVENT, vcpu);
-	}
-	return 0;
-}
-
-static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2)
-{
-	int mmu_reset_needed = 0;
-	bool valid_pdptrs = sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID;
-	bool pae = (sregs2->cr0 & X86_CR0_PG) && (sregs2->cr4 & X86_CR4_PAE) &&
-		!(sregs2->efer & EFER_LMA);
-	int i, ret;
-
-	if (sregs2->flags & ~KVM_SREGS2_FLAGS_PDPTRS_VALID)
-		return -EINVAL;
-
-	if (valid_pdptrs && (!pae || vcpu->arch.guest_state_protected))
-		return -EINVAL;
-
-	ret = __set_sregs_common(vcpu, (struct kvm_sregs *)sregs2,
-				 &mmu_reset_needed, !valid_pdptrs);
-	if (ret)
-		return ret;
-
-	if (valid_pdptrs) {
-		for (i = 0; i < 4 ; i++)
-			kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
-
-		kvm_register_mark_dirty(vcpu, VCPU_REG_PDPTR);
-		mmu_reset_needed = 1;
-		vcpu->arch.pdptrs_from_userspace = true;
-	}
-	if (mmu_reset_needed) {
-		kvm_mmu_reset_context(vcpu);
-		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
-	}
-	return 0;
-}
-
-int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu,
-				  struct kvm_sregs *sregs)
-{
-	int ret;
-
-	if (vcpu->kvm->arch.has_protected_state &&
-	    vcpu->arch.guest_state_protected)
-		return -EINVAL;
-
-	vcpu_load(vcpu);
-	ret = __set_sregs(vcpu, sregs);
-	vcpu_put(vcpu);
-	return ret;
-}
-
 static void kvm_arch_vcpu_guestdbg_update_apicv_inhibit(struct kvm *kvm)
 {
 	bool set = false;
@@ -12699,11 +11904,7 @@ static void store_regs(struct kvm_vcpu *vcpu)
 {
 	BUILD_BUG_ON(sizeof(struct kvm_sync_regs) > SYNC_REGS_SIZE_BYTES);
 
-	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_REGS)
-		__get_regs(vcpu, &vcpu->run->s.regs.regs);
-
-	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_SREGS)
-		__get_sregs(vcpu, &vcpu->run->s.regs.sregs);
+	kvm_run_get_regs(vcpu);
 
 	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_EVENTS)
 		kvm_vcpu_ioctl_x86_get_vcpu_events(
@@ -12712,19 +11913,8 @@ static void store_regs(struct kvm_vcpu *vcpu)
 
 static int sync_regs(struct kvm_vcpu *vcpu)
 {
-	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_REGS) {
-		__set_regs(vcpu, &vcpu->run->s.regs.regs);
-		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_REGS;
-	}
-
-	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
-		struct kvm_sregs sregs = vcpu->run->s.regs.sregs;
-
-		if (__set_sregs(vcpu, &sregs))
-			return -EINVAL;
-
-		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_SREGS;
-	}
+	if (kvm_run_set_regs(vcpu))
+		return -EINVAL;
 
 	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_EVENTS) {
 		struct kvm_vcpu_events events = vcpu->run->s.regs.events;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 185062a26924..fd55cd031b1c 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -414,6 +414,7 @@ int handle_ud(struct kvm_vcpu *vcpu);
 
 void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
 				   struct kvm_queued_exception *ex);
+void kvm_handle_exception_payload_quirk(struct kvm_vcpu *vcpu);
 
 int kvm_mtrr_set_msr(struct kvm_vcpu *vcpu, u32 msr, u64 data);
 int kvm_mtrr_get_msr(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata);
@@ -604,6 +605,7 @@ static inline void kvm_machine_check(void)
 int kvm_spec_ctrl_test_value(u64 value);
 int kvm_handle_memory_failure(struct kvm_vcpu *vcpu, int r,
 			      struct x86_exception *e);
+void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid);
 int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva);
 bool kvm_msr_allowed(struct kvm_vcpu *vcpu, u32 index, u32 type);
 
-- 
2.54.0.563.g4f69b47b94-goog

