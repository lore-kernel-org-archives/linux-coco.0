Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDED34214A
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649413; cv=none; b=tKY3uaTne7dcHeY5a0dzlnMWt5Kh/atbp+QaFLbDZWreA4rZV491iSJxpLObFaUyHwtJC/4p84e/O3QaXjtiHiLuXsTl7XvbL2CedtZ0Hb739Z3GeGeXeRkgLWjiNcQz96X11PwunfgeKVkyaet/zLP+vwTiBCj+GhIq0Xwl7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649413; c=relaxed/simple;
	bh=0iJukulF0iDMEL1IfL1RkxcCyzPuMdALrMtRBvNIXvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S8mZG9a5W54TrfX/yGnhxCBRwU2Z/qXxYtTCpKxcs7fTG8Nzwuq5YWGmnTKYuyP7p6AKzwqxdrl1ZYbLa6VOvYPj6b9kNplPt7fi1YlRGlYPcwT54mwcoQep6kG6Tlc1ZfduYgoEDA6i9gzmE/+NbwyyM4tQjkHMXP659LcwNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cAPC4mK3; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cAPC4mK3"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a784b2234dso11241395ad.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649410; x=1770254210; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h+1tpJHrAZljj9M61rOSFv1VCgBL5A8paE4Q/bTQIJs=;
        b=cAPC4mK3kmrelFkYvQfwoUElnEWGDWXnvNqsHsBLLZj4A3dsRLDzvPew/8+Ez4roTD
         p4W8wttrcmWJzJRmSeHrbIOERT7+OwMCLzP/ZH4h5f44Gon/Yff9EgK40P0BcM+ev7Y8
         KNcCvoP1MQanL9Ts8Mm5mpAA2MYOxvookwZrG6xy3dRq2QHPXQyvsa6zFo+L9aBx26es
         GTuNEXsxXz/RKv412QciqKCBDhLdgtKt1CDPn7QG3sWLIVfdTHWNj+Ij6lAobhERGdfZ
         sZGctDYkoxrs4zI2iO40zg781vhBbYy3R2ywfXCHaQUpdRHCPDh3IZdYwpMfg3PBjSvc
         8iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649410; x=1770254210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+1tpJHrAZljj9M61rOSFv1VCgBL5A8paE4Q/bTQIJs=;
        b=LtVEkLx5+w1KyAcV+i/Aqa5P1RWo1+GKMtFS1l6R1bL0BCrQ8lvK8rkM+nAGJBfwNU
         Ka0TOYjbG4h9207tV3OdTcMoPS3t9+8yUZtRrO0gnpyTGC8ibLL6iVYr7F2KBIg8KVEi
         4iTYg4qLyjHH9+ODaSlSPibbdCqt5ATnspysQkGe3quecdKDNU8jqcLmhoSdE9I++gZG
         AeHbK1pkFC1gZsPISwDWcv/QF8bg9Xi0CYTiRtnPXWOhn+VBmujkNLV8nxBlTrQEwX8c
         h1oeEKhnrZooT6CvS97AwsP4BNK6gxC1z1qkZgnVlJ09EAIyQvR7mqOHGKcjF8bbMB5g
         3CDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/T/AyfsckfL6D6cHkJROALemxSdFVAHN0EZVFH4YzV/0o4dykjH+vwEz0Q9r/jIo4LMQ75nH9ocWY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvu1OZvh2Q/rMHFCSwVpKlRJvhgjK/LjB3EIPU8oqipWEY80c6
	V0R4qEMCxnhR/kPZL4JfEqrVmamBya/CWy5qzoBJjFD7nYLwQj21WhzrS1osx8Y832MuAjGcZCu
	aQWI54w==
X-Received: from pgbcu5.prod.google.com ([2002:a05:6a02:2185:b0:c0e:da74:78ee])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918f:b0:34f:1623:2354
 with SMTP id adf61e73a8af0-38ec6421854mr6633861637.42.1769649410126; Wed, 28
 Jan 2026 17:16:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:16 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-45-seanjc@google.com>
Subject: [RFC PATCH v5 44/45] KVM: x86/mmu: Add support for splitting S-EPT
 hugepages on conversion
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add support for splitting S-EPT hugepages in preparation for converting a
subset of a hugepage to be shared, as KVM must precisely zap/remove S-EPT
entries to avoid clobbering guest memory (the lifetime of guest private
memory is tied to the S-EPT).  I.e. KVM needs to first split a hugepage so
that only the to-be-converted small pages can be zapped.

To avoid unnecessary work, e.g. if only the tail/end page of massive region
isn't aligned to the conversion, explicitly detect unaligned head and tail
pages relative to the max page size support by KVM, i.e. head/tail pages
that will undergo partial conversion.

To support splitting an S-EPT hugepage without a vCPU, add a per-VM PAMT
cache, along with a mutex to guard the cache.  Using a mutex, e.g. versus
a spinlock, is important at it allows KVM to allocate memory *without*
dropping the lock, i.e. so that the PAMT cache can be topped-up as needed
without needed to juggle arch.tdp_mmu_external_cache_lock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  8 +++-
 arch/x86/kvm/mmu/mmu.c          |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 72 +++++++++++++++++++++++++++++++--
 arch/x86/kvm/vmx/tdx.c          | 34 +++++++++++++---
 arch/x86/kvm/vmx/tdx.h          |  2 +
 5 files changed, 107 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 385f1cf32d70..54dea90a53dc 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1563,6 +1563,12 @@ struct kvm_arch {
 	 * the code to do so.
 	 */
 	spinlock_t tdp_mmu_pages_lock;
+
+	/*
+	 * Protect the per-VM cache of pre-allocate pages used to populate the
+	 * Dynamic PAMT when splitting S-EPT huge pages without a vCPU.
+	 */
+	struct mutex tdp_mmu_external_cache_lock;
 #endif /* CONFIG_X86_64 */
 
 	/*
@@ -1861,7 +1867,7 @@ struct kvm_x86_ops {
 				 u64 new_spte, enum pg_level level);
 	void (*reclaim_external_sp)(struct kvm *kvm, gfn_t gfn,
 				    struct kvm_mmu_page *sp);
-	int (*topup_external_cache)(struct kvm_vcpu *vcpu, int min);
+	int (*topup_external_cache)(struct kvm *kvm, struct kvm_vcpu *vcpu, int min);
 
 
 	bool (*has_wbinvd_exit)(void);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c2765bfc8492..62bf6bec2df2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -606,7 +606,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 		if (r)
 			return r;
 
-		r = kvm_x86_call(topup_external_cache)(vcpu, PT64_ROOT_MAX_LEVEL);
+		r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu, PT64_ROOT_MAX_LEVEL);
 		if (r)
 			return r;
 	}
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c46ebdacdb50..3181406c5e0b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1447,7 +1447,8 @@ bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 	return spte_set;
 }
 
-static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
+static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct kvm *kvm,
+						       struct tdp_iter *iter)
 {
 	struct kvm_mmu_page *sp;
 
@@ -1464,7 +1465,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
 		if (!sp->external_spt)
 			goto err_external_spt;
 
-		if (kvm_x86_call(topup_external_cache)(kvm_get_running_vcpu(), 1))
+		if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu(), 1))
 			goto err_external_split;
 	}
 
@@ -1556,7 +1557,7 @@ static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
 			else
 				write_unlock(&kvm->mmu_lock);
 
-			sp = tdp_mmu_alloc_sp_for_split(&iter);
+			sp = tdp_mmu_alloc_sp_for_split(kvm, &iter);
 
 			if (shared)
 				read_lock(&kvm->mmu_lock);
@@ -1631,9 +1632,74 @@ int kvm_tdp_mmu_split_huge_pages(struct kvm_vcpu *vcpu, gfn_t start, gfn_t end,
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_split_huge_pages);
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+static int __tdp_mmu_split_mirror_huge_pages(struct kvm *kvm,
+					     struct kvm_mmu_page *root,
+					     gfn_t gfn, int target_level)
+{
+	gfn_t end = gfn + KVM_PAGES_PER_HPAGE(target_level + 1);
+
+	return tdp_mmu_split_huge_pages_root(kvm, root, gfn, end, target_level, false);
+}
+
+static int tdp_mmu_split_mirror_huge_pages(struct kvm *kvm,
+					    struct kvm_mmu_page *root,
+					    gfn_t start, gfn_t end, int level)
+{
+
+	gfn_t head = gfn_round_for_level(start, level + 1);
+	gfn_t tail = gfn_round_for_level(end, level + 1);
+	int r;
+
+	if (head != start) {
+		r = __tdp_mmu_split_mirror_huge_pages(kvm, root, head, level);
+		if (r)
+			return r;
+	}
+
+	if (tail != end && (head != tail || head == start)) {
+		r = __tdp_mmu_split_mirror_huge_pages(kvm, root, tail, level);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 int kvm_arch_gmem_convert(struct kvm *kvm, gfn_t start, gfn_t end,
 			  bool to_private)
 {
+	struct kvm_mmu_page *root;
+	int r;
+
+	/*
+	 * When converting from private=>shared, KVM must first split potential
+	 * hugepages, as KVM mustn't overzap private mappings for TDX guests,
+	 * i.e. must zap _exactly_ [start, end).  Split potential hugepages at
+	 * the head and tail of the to-be-converted (and thus zapped) range so
+	 * that KVM doesn't overzap due to dropping a hugepage that doesn't
+	 * fall wholly inside the range.
+	 */
+	if (to_private || !kvm_has_mirrored_tdp(kvm))
+		return 0;
+
+	/*
+	 * Acquire the external cache lock, a.k.a. the Dynamic PAMT lock, to
+	 * protect the per-VM cache of pre-allocate pages used to populate the
+	 * Dynamic PAMT when splitting S-EPT huge pages.
+	 */
+	guard(mutex)(&kvm->arch.tdp_mmu_external_cache_lock);
+
+	guard(write_lock)(&kvm->mmu_lock);
+
+	/*
+	 * TODO: Also split from PG_LEVEL_1G => PG_LEVEL_2M when KVM supports
+	 *       1GiB S-EPT pages.
+	 */
+	__for_each_tdp_mmu_root_yield_safe(kvm, root, 0, KVM_MIRROR_ROOTS) {
+		r = tdp_mmu_split_mirror_huge_pages(kvm, root, start, end, PG_LEVEL_4K);
+		if (r)
+			return r;
+	}
 	return 0;
 }
 #endif /* CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT */
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 098954f5e07c..774d395e5c73 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -607,6 +607,8 @@ void tdx_vm_destroy(struct kvm *kvm)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
+	tdx_free_pamt_cache(&kvm_tdx->pamt_cache);
+
 	tdx_reclaim_td_control_pages(kvm);
 
 	kvm_tdx->state = TD_STATE_UNINITIALIZED;
@@ -629,6 +631,8 @@ int tdx_vm_init(struct kvm *kvm)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
+	tdx_init_pamt_cache(&kvm_tdx->pamt_cache);
+
 	kvm->arch.has_protected_state = true;
 	/*
 	 * TDX Module doesn't allow the hypervisor to modify the EOI-bitmap,
@@ -1621,15 +1625,32 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level)
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
 }
 
-static int tdx_topup_external_pamt_cache(struct kvm_vcpu *vcpu, int min)
+static struct tdx_pamt_cache *tdx_get_pamt_cache(struct kvm *kvm,
+						 struct kvm_vcpu *vcpu)
 {
+	if (KVM_BUG_ON(vcpu && vcpu->kvm != kvm, kvm))
+		return NULL;
+
+	if (vcpu)
+		return &to_tdx(vcpu)->pamt_cache;
+
+	lockdep_assert_held(&kvm->arch.tdp_mmu_external_cache_lock);
+	return &to_kvm_tdx(kvm)->pamt_cache;
+}
+
+static int tdx_topup_external_pamt_cache(struct kvm *kvm,
+					 struct kvm_vcpu *vcpu, int min)
+{
+	struct tdx_pamt_cache *pamt_cache;
+
 	if (!tdx_supports_dynamic_pamt(tdx_sysinfo))
 		return 0;
 
-	if (WARN_ON_ONCE(!vcpu))
+	pamt_cache = tdx_get_pamt_cache(kvm, vcpu);
+	if (!pamt_cache)
 		return -EIO;
 
-	return tdx_topup_pamt_cache(&to_tdx(vcpu)->pamt_cache, min);
+	return tdx_topup_pamt_cache(pamt_cache, min);
 }
 
 static int tdx_mem_page_add(struct kvm *kvm, gfn_t gfn, enum pg_level level,
@@ -1792,8 +1813,8 @@ static struct page *tdx_spte_to_external_spt(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_split_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				       u64 new_spte, enum pg_level level)
 {
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	struct tdx_pamt_cache *pamt_cache;
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 	struct page *external_spt;
@@ -1804,7 +1825,8 @@ static int tdx_sept_split_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 	if (!external_spt)
 		return -EIO;
 
-	if (KVM_BUG_ON(!vcpu || vcpu->kvm != kvm, kvm))
+	pamt_cache = tdx_get_pamt_cache(kvm, kvm_get_running_vcpu());
+	if (!pamt_cache)
 		return -EIO;
 
 	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
@@ -1816,7 +1838,7 @@ static int tdx_sept_split_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 
 	err = tdh_do_no_vcpus(tdh_mem_page_demote, kvm, &kvm_tdx->td, gpa,
 			      level, spte_to_pfn(old_spte), external_spt,
-			      &to_tdx(vcpu)->pamt_cache, &entry, &level_state);
+			      pamt_cache, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_DEMOTE, entry, level_state, kvm))
 		return -EIO;
 
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index f444fc84d93b..57d7e70ffe7d 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -48,6 +48,8 @@ struct kvm_tdx {
 	 * Set/unset is protected with kvm->mmu_lock.
 	 */
 	bool wait_for_sept_zap;
+
+	struct tdx_pamt_cache pamt_cache;
 };
 
 /* TDX module vCPU states */
-- 
2.53.0.rc1.217.geba53bf80e-goog

