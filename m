Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE8D300
	for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 22:18:31 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63d4595d60fso2914811b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Apr 2023 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942711; x=1684534711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU8iFueolrZCmcbo4gYTi+eKDv6f+PtpXTvRFNX2NZA=;
        b=SCmbMjD55QloUYOgXX6MGUNEjAyAnMm/HfGRAGM1vS7vADDmD//a3bJ19IoxEPbsjR
         M2cj4sRqNKbEknJUmqcRzzuGvuAWBBnIZmhseVA9z0HrnfGvz/BvmurAl+ZaqdFV9z0+
         XE+By4GvDamj1V0iHkImOVtuMlZpTJ8+WBz54nyEAGyf404LButJI5R1r1M9kSp/2kE/
         u0yMzOB8MvU04pFuFPh8V3hwD0+VVdFu6iRbztwNwUe0wOuPOvAaUzMpoheX119q8fkx
         HByPgmjTnZTij1BszzopQyeoxfkgy1UkfAJB+AO4WFsTrtiA+xJhP2Ikh+DJT3BJUL+Y
         xQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942711; x=1684534711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU8iFueolrZCmcbo4gYTi+eKDv6f+PtpXTvRFNX2NZA=;
        b=aNXL1wtUt4KxZgdmR78RZOhQvY5154MiKiNe8270LijsFOoyNVjSWaOU1MXVSOGdeC
         tGEUqGqnnrARcKUgGByfl9GJAnmEVZAGhjAcRWpasoHuAVaDPC2VMDUAYAKngUluqvYS
         Sl2l9KygcJu0BT7yWUBa8+8H14fHRgTgPNhrrCwD/vk8JMHQL7oiJ5emVOSS/ILU8l51
         +ne0k6vJ2XY3LKAvJAdiEVELOOdZOUE7H5LpHFw+yigGJAK/QJeiAAcUxW7objWgUHXg
         +sy69SFE3sH7/a49of/NZCneS91lRDTFsfl38YXwOzXY9c+XNsNaEhwdyZxW7W4fzrAE
         CB1w==
X-Gm-Message-State: AAQBX9f88Ol3RksFLMBpjCOATtOwzx57b5LFwEzA5QJ4GgsvuihtMGL0
	8V22enhqCLR/7FjO+PAm8dexkc7ZEFEEX31hrwI=
X-Google-Smtp-Source: AKy350YxZk7F6dEeajji4ZjqoV6O38ZOLVkf4vnq1EOHfqdcV069hDfO+BMQgpUlX71NUn0DfXxZlw==
X-Received: by 2002:a17:90a:9e5:b0:246:aeee:e61c with SMTP id 92-20020a17090a09e500b00246aeeee61cmr4072001pjo.11.1681942711371;
        Wed, 19 Apr 2023 15:18:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 28/48] RISC-V: KVM: Add interrupt management functions for TVM
Date: Wed, 19 Apr 2023 15:16:56 -0700
Message-Id: <20230419221716.3603068-29-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The COVI SBI extension defines the functions related to interrupt
management for TVMs. These functions are the glue logic between
AIA code and the actually CoVE Interrupt SBI extension(COVI).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  34 ++++
 arch/riscv/kvm/cove.c             | 256 ++++++++++++++++++++++++++++++
 2 files changed, 290 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index b63682f..74bad2f 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -61,10 +61,19 @@ struct kvm_riscv_cove_page {
 	unsigned long gpa;
 };
 
+struct imsic_tee_state {
+	bool bind_required;
+	bool bound;
+	int vsfile_hgei;
+};
+
 struct kvm_cove_tvm_vcpu_context {
 	struct kvm_vcpu *vcpu;
 	/* Pages storing each vcpu state of the TVM in TSM */
 	struct kvm_riscv_cove_page vcpu_state;
+
+	/* Per VCPU imsic state */
+	struct imsic_tee_state imsic;
 };
 
 struct kvm_cove_tvm_context {
@@ -133,6 +142,16 @@ int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned lo
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
 /* Fence related function */
 int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu);
+
+/* AIA related CoVE functions */
+int kvm_riscv_cove_aia_init(struct kvm *kvm);
+int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid);
+int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu, int old_cpu);
+int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask);
+int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu);
+int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa);
+int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa);
+int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu);
 #else
 static inline bool kvm_riscv_cove_enabled(void) {return false; };
 static inline int kvm_riscv_cove_init(void) { return -1; }
@@ -162,6 +181,21 @@ static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
 }
 static inline int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu,
 					    gpa_t gpa, unsigned long hva) {return -1; }
+/* AIA related TEE functions */
+static inline int kvm_riscv_cove_aia_init(struct kvm *kvm) { return -1; }
+static inline int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu,
+						       unsigned long iid) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu,
+						   int old_cpu) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu,
+						 unsigned long imsic_mask) { return -1; }
+static inline int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu,
+						 phys_addr_t imsic_pa) { return -1; }
+static inline int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu,
+						 phys_addr_t imsic_pa) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu,
+						   int old_pcpu) { return -1; }
 #endif /* CONFIG_RISCV_COVE_HOST */
 
 #endif /* __KVM_RISCV_COVE_H */
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 4a8a8db..154b01a 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -8,6 +8,7 @@
  *     Atish Patra <atishp@rivosinc.com>
  */
 
+#include <linux/cpumask.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
@@ -137,6 +138,247 @@ __always_inline bool kvm_riscv_cove_enabled(void)
 	return riscv_cove_enabled;
 }
 
+static void kvm_cove_imsic_clone(void *info)
+{
+	int rc;
+	struct kvm_vcpu *vcpu = info;
+	struct kvm *kvm = vcpu->kvm;
+
+	rc = sbi_covi_rebind_vcpu_imsic_clone(kvm->arch.tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (rc)
+		kvm_err("Imsic clone failed guest %ld vcpu %d pcpu %d\n",
+			 kvm->arch.tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+}
+
+static void kvm_cove_imsic_unbind(void *info)
+{
+	struct kvm_vcpu *vcpu = info;
+	struct kvm_cove_tvm_context *tvmc = vcpu->kvm->arch.tvmc;
+
+	/*TODO: We probably want to return but the remote function call doesn't allow any return */
+	if (sbi_covi_unbind_vcpu_imsic_begin(tvmc->tvm_guest_id, vcpu->vcpu_idx))
+		return;
+
+	/* This may issue IPIs to running vcpus. */
+	if (kvm_riscv_cove_tvm_fence(vcpu))
+		return;
+
+	if (sbi_covi_unbind_vcpu_imsic_end(tvmc->tvm_guest_id, vcpu->vcpu_idx))
+		return;
+
+	kvm_info("Unbind success for guest %ld vcpu %d pcpu %d\n",
+		  tvmc->tvm_guest_id, smp_processor_id(), vcpu->vcpu_idx);
+}
+
+int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_set_vcpu_imsic_addr(tvmc->tvm_guest_id, vcpu->vcpu_idx, vaia->imsic_addr);
+	if (ret)
+		return -EPERM;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa)
+{
+	struct kvm *kvm = vcpu->kvm;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	ret = sbi_covi_convert_imsic(imsic_pa);
+	if (ret)
+		return -EPERM;
+
+	ret = kvm_riscv_cove_fence();
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa)
+{
+	int ret;
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	ret = sbi_covi_reclaim_imsic(imsic_pa);
+	if (ret)
+		return -EPERM;
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	int ret;
+	cpumask_t tmpmask;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_rebind_vcpu_imsic_begin(tvmc->tvm_guest_id, vcpu->vcpu_idx,
+					       BIT(tvcpu->imsic.vsfile_hgei));
+	if (ret) {
+		kvm_err("Imsic rebind begin failed guest %ld vcpu %d pcpu %d\n",
+			 tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+
+	ret = kvm_riscv_cove_tvm_fence(vcpu);
+	if (ret)
+		return ret;
+
+	cpumask_clear(&tmpmask);
+	cpumask_set_cpu(old_pcpu, &tmpmask);
+	on_each_cpu_mask(&tmpmask, kvm_cove_imsic_clone, vcpu, 1);
+
+	ret = sbi_covi_rebind_vcpu_imsic_end(tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (ret) {
+		kvm_err("Imsic rebind end failed guest %ld vcpu %d pcpu %d\n",
+			 tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+
+	tvcpu->imsic.bound = true;
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_bind_vcpu_imsic(tvmc->tvm_guest_id, vcpu->vcpu_idx, imsic_mask);
+	if (ret) {
+		kvm_err("Imsic bind failed for imsic %lx guest %ld vcpu %d pcpu %d\n",
+			imsic_mask, tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+	tvcpu->imsic.bound = true;
+	pr_err("%s: rebind success vcpu %d hgei %d pcpu %d\n", __func__,
+	vcpu->vcpu_idx, tvcpu->imsic.vsfile_hgei, smp_processor_id());
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu, int old_pcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	cpumask_t tmpmask;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	/* No need to unbind if it is not bound already */
+	if (!tvcpu->imsic.bound)
+		return 0;
+
+	/* Do it first even if there is failure to prevent it to try again */
+	tvcpu->imsic.bound = false;
+
+	if (smp_processor_id() == old_pcpu) {
+		kvm_cove_imsic_unbind(vcpu);
+	} else {
+		/* Unbind can be invoked from a different physical cpu */
+		cpumask_clear(&tmpmask);
+		cpumask_set_cpu(old_pcpu, &tmpmask);
+		on_each_cpu_mask(&tmpmask, kvm_cove_imsic_unbind, vcpu, 1);
+	}
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_inject_external_interrupt(tvmc->tvm_guest_id, vcpu->vcpu_idx, iid);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_init(struct kvm *kvm)
+{
+	struct kvm_aia *aia = &kvm->arch.aia;
+	struct sbi_cove_tvm_aia_params *tvm_aia;
+	struct kvm_vcpu *vcpu;
+	struct kvm_cove_tvm_context *tvmc;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	/* Sanity Check */
+	if (aia->aplic_addr != KVM_RISCV_AIA_UNDEF_ADDR)
+		return -EINVAL;
+
+	/* TVMs must have a physical guest interrut file */
+	if (aia->mode != KVM_DEV_RISCV_AIA_MODE_HWACCEL)
+		return -ENODEV;
+
+	tvm_aia = kzalloc(sizeof(*tvm_aia), GFP_KERNEL);
+	if (!tvm_aia)
+		return -ENOMEM;
+
+	/* Address of the IMSIC group ID, hart ID & guest ID of 0 */
+	vcpu = kvm_get_vcpu_by_id(kvm, 0);
+	tvm_aia->imsic_base_addr = vcpu->arch.aia_context.imsic_addr;
+
+	tvm_aia->group_index_bits = aia->nr_group_bits;
+	tvm_aia->group_index_shift = aia->nr_group_shift;
+	tvm_aia->hart_index_bits = aia->nr_hart_bits;
+	tvm_aia->guest_index_bits = aia->nr_guest_bits;
+	/* Nested TVMs are not supported yet */
+	tvm_aia->guests_per_hart = 0;
+
+
+	ret = sbi_covi_tvm_aia_init(tvmc->tvm_guest_id, tvm_aia);
+	if (ret)
+		kvm_err("TVM AIA init failed with rc %d\n", ret);
+
+	return ret;
+}
+
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_timer_restore(vcpu);
@@ -283,6 +525,7 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	void *nshmem;
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
+	struct kvm_cove_tvm_vcpu_context *tvcpuc = vcpu->arch.tc;
 
 	if (!kvm->arch.tvmc)
 		return;
@@ -301,6 +544,19 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 		tvmc->finalized_done = true;
 	}
 
+	/*
+	 * Bind the vsfile here instead during the new vsfile allocation because
+	 * COVH bind call requires the TVM to be in finalized state.
+	 */
+	if (tvcpuc->imsic.bind_required) {
+		tvcpuc->imsic.bind_required = false;
+		rc = kvm_riscv_cove_vcpu_imsic_bind(vcpu, BIT(tvcpuc->imsic.vsfile_hgei));
+		if (rc) {
+			kvm_err("bind failed with rc %d\n", rc);
+			return;
+		}
+	}
+
 	rc = sbi_covh_run_tvm_vcpu(tvmc->tvm_guest_id, vcpu->vcpu_idx);
 	if (rc) {
 		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
-- 
2.25.1

