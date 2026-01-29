Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C123451AE
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649370; cv=none; b=FB1z0KNFLpooQ8omS6Dl1SiBO545IZ+r1nBLH0pacO3dmft0KDFuTHqopgr12t1vin0KBDIwUISVuSXOpWceVk8XvtAuieWiNmemegf54N1BdQuWxtV1dDuDGAyT3ObW/UVmQCaCTM0raeRsvLkysz9LzYBh6Xn6KXC/MBpkOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649370; c=relaxed/simple;
	bh=TBS3NOuTU/+p9r5oAffOOIjvCTELnp6C8dm3U+EJwg4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RHgp7+eHZtX5PkMgwKVxLfptI1G9MBLEXSDiwz/KwqgRd8gdsTja0jsCqHuYQhiLwdj25rX+1HXrAcg4jlW+P/v0yDQiYNQ/Il8FYNq8sgntcfMA2QOOPgEFq9zeV2cwNtUqRSy9FjLZxm9Q2zwrNgSDcUIOPItCbeSK0f9W02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jLhReB3H; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jLhReB3H"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c549aaa796dso732856a12.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649367; x=1770254167; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8HnFAQrxQ92neYQA/fX8/fYTn2bGdwSiVHNlc5IdWqw=;
        b=jLhReB3HrGBirdRQykHr6FsSCXr6tnIPjK2PbYln8V64+73fk8zcUpwpVWIq6EWYQ6
         wZG2J4xYlHDpTmCzVZ4BhPIuXFS+5kNl6dfSYUR/Di9S04JGykOjGNZhfLCVjx6vu7r4
         oRI6/y+2cK1pcwLoVRh93dU3ttgreRst6hoog5f9gBocMNCgMFzlEYSzrJGQfYHMAEgO
         djVIUvcKvXPlP2//WF0OZm8UYhEq1xS5ZQ8hmOl2iUZxfdxERREDKytTinnm5PuiG3u4
         od/KYooClrFmjl9BkbceG4Om9YS47gUgPuSk0VteMA+HTjI0GqestRoTr8lZXF6fPrt5
         pF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649367; x=1770254167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HnFAQrxQ92neYQA/fX8/fYTn2bGdwSiVHNlc5IdWqw=;
        b=Ac2c3Tyg+taQ4cgGdItxxOl/Llvb/YV7JSjSKqqVjxpAEKu2m/Ydq8hrixA9NBkzGx
         Y1/I5GBJklb3GAI4HD+LCUVpmfM5SzYHK7Chz+Nt1Wvsy3Ok79znDpcf2UCV7YQOPAE7
         935FCfkJzUtmRVjExwpzmEU4eD1c5VxxQUaMXTlEVT3lsp5ATPYaeMx5ByOuuxxwXs3b
         N3lTosmj+yllwkJchyWwzJ4QDMN5csA9PVug+f8oII/Emctr8ZRJL9ZH8Lj3e7ZkQXag
         k2YpuCMaqXMT2wEalpjtU4llBNVtCwSmb2GLXPlraYK6R86pSQ14RmWGx3xMR1vYiF32
         BZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWPTKvgQEe71tIxCcwkHdX+uOEIoqhMSij0EG+LRUejN3Ejy77uXU1kv257wn2qezt+ciCpE/9r3TW7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3VHK8p4PS6wZiMD/mTz1A/HslzQu1O9846BVdWDARCnCKlVXL
	Bv2g2HoJIww5RBIecJVk72YC4MShdZxIRocohJR7gsDdIId7rWm/j7SEGppKOBNGNnpwh6zzuYB
	wZ0rZrw==
X-Received: from pgo32.prod.google.com ([2002:a63:e60:0:b0:c65:be00:c5c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6f09:b0:38e:9acd:97d0
 with SMTP id adf61e73a8af0-38ec632f1cbmr6748652637.34.1769649366694; Wed, 28
 Jan 2026 17:16:06 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:52 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-21-seanjc@google.com>
Subject: [RFC PATCH v5 20/45] KVM: x86/mmu: Allocate/free S-EPT pages using tdx_{alloc,free}_control_page()
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

Now that kvm_mmu_memory_cache supports custom page allocators, wire up the
S-EPT cache to use tdx_{alloc,free}_control_page() (arguably S-EPT pages
aren't "control" pages, but they're not guest pages either).  Using the
TDX APIs will make S-EPT pages naturally play nice with Dynamic PAMT, by
virtue of adding/removing PAMT entries when S-EPT pages are allocated and
freed, as opposed to when they are added/removed from the S-EPT tree.

Inserting into the PAMT entries on allocation does mean KVM will create
unnecessary PAMT entries, e.g. once a vCPU stops faulting in memory, the
remaining pages in the MMU cache will go unused.  But in practice, odds
are very good the containing 2MiB page will have other in-use S-EPT pages,
i.e. will create PAMT entries anyways.  And _if_ creating PAMT entries on
allocation is problematic for memory consumption, that can be resolved by
tweaking KVM's cache size.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  2 ++
 arch/x86/include/asm/kvm_host.h    | 18 +++++++++---------
 arch/x86/kvm/mmu/mmu.c             |  6 ++++--
 arch/x86/kvm/mmu/mmu_internal.h    | 11 -----------
 arch/x86/kvm/mmu/tdp_mmu.c         |  5 +++--
 arch/x86/kvm/vmx/tdx.c             | 13 ++++++++++++-
 6 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index c17cedc485c9..17dddada69fc 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -94,6 +94,8 @@ KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
 KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
 KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
 KVM_X86_OP(load_mmu_pgd)
+KVM_X86_OP_OPTIONAL(alloc_external_sp)
+KVM_X86_OP_OPTIONAL(free_external_sp)
 KVM_X86_OP_OPTIONAL_RET0(set_external_spte)
 KVM_X86_OP_OPTIONAL(remove_external_spte)
 KVM_X86_OP_OPTIONAL(reclaim_external_sp)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b35a07ed11fb..6e84dbc89e79 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -867,10 +867,7 @@ struct kvm_vcpu_arch {
 	struct kvm_mmu_memory_cache mmu_shadow_page_cache;
 	struct kvm_mmu_memory_cache mmu_shadowed_info_cache;
 	struct kvm_mmu_memory_cache mmu_page_header_cache;
-	/*
-	 * This cache is to allocate external page table. E.g. private EPT used
-	 * by the TDX module.
-	 */
+	/* Used to allocate S-EPT pages (gifted to the TDX-Module). */
 	struct kvm_mmu_memory_cache mmu_external_spt_cache;
 
 	/*
@@ -1853,18 +1850,21 @@ struct kvm_x86_ops {
 	void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
 			     int root_level);
 
-	/* Update the external page table from spte getting set. */
+	/*
+	 * Callbacks to allocate and free external page tables, a.k.a. S-EPT,
+	 * and to propagate changes in mirror page tables to the external page
+	 * tables.
+	 */
+	unsigned long (*alloc_external_sp)(gfp_t gfp);
+	void (*free_external_sp)(unsigned long addr);
 	int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
 				 u64 mirror_spte);
-
-	/* Update external page tables for page table about to be freed. */
 	void (*reclaim_external_sp)(struct kvm *kvm, gfn_t gfn,
 				    struct kvm_mmu_page *sp);
-
-	/* Update external page table from spte getting removed, and flush TLB. */
 	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
 				     u64 mirror_spte);
 
+
 	bool (*has_wbinvd_exit)(void);
 
 	u64 (*get_l2_tsc_offset)(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3911ac9bddfd..9b5a6861e2a4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6690,11 +6690,13 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
 	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
 
-	vcpu->arch.mmu_shadow_page_cache.init_value =
-		SHADOW_NONPRESENT_VALUE;
+	vcpu->arch.mmu_shadow_page_cache.init_value = SHADOW_NONPRESENT_VALUE;
 	if (!vcpu->arch.mmu_shadow_page_cache.init_value)
 		vcpu->arch.mmu_shadow_page_cache.gfp_zero = __GFP_ZERO;
 
+	vcpu->arch.mmu_external_spt_cache.page_get = kvm_x86_ops.alloc_external_sp;
+	vcpu->arch.mmu_external_spt_cache.page_free = kvm_x86_ops.free_external_sp;
+
 	vcpu->arch.mmu = &vcpu->arch.root_mmu;
 	vcpu->arch.walk_mmu = &vcpu->arch.root_mmu;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 73cdcbccc89e..6bb97f660793 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -157,17 +157,6 @@ static inline bool is_mirror_sp(const struct kvm_mmu_page *sp)
 	return sp->role.is_mirror;
 }
 
-static inline void kvm_mmu_alloc_external_spt(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
-{
-	/*
-	 * external_spt is allocated for TDX module to hold private EPT mappings,
-	 * TDX module will initialize the page by itself.
-	 * Therefore, KVM does not need to initialize or access external_spt.
-	 * KVM only interacts with sp->spt for private EPT operations.
-	 */
-	sp->external_spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_external_spt_cache);
-}
-
 static inline gfn_t kvm_gfn_root_bits(const struct kvm *kvm, const struct kvm_mmu_page *root)
 {
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 18764dbc97ea..01e3e4f4baa5 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -55,7 +55,8 @@ void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
 
 static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
 {
-	free_page((unsigned long)sp->external_spt);
+	if (sp->external_spt)
+		kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
 	free_page((unsigned long)sp->spt);
 	kmem_cache_free(mmu_page_header_cache, sp);
 }
@@ -1246,7 +1247,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		sp = tdp_mmu_alloc_sp(vcpu);
 		tdp_mmu_init_child_sp(sp, &iter);
 		if (is_mirror_sp(sp))
-			kvm_mmu_alloc_external_spt(vcpu, sp);
+			sp->external_spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_external_spt_cache);
 
 		sp->nx_huge_page_disallowed = fault->huge_page_disallowed;
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 323aae4300a1..0946eba2de23 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1790,7 +1790,9 @@ static void tdx_sept_reclaim_private_sp(struct kvm *kvm, gfn_t gfn,
 	 * TD's hkid is freed, when the TD is being torn down.
 	 *
 	 * If the S-EPT PTE can't be removed for any reason, intentionally leak
-	 * the page to prevent the kernel from accessing the encrypted page.
+	 * the page to prevent the kernel from accessing the encrypted page,
+	 * and if Dynamic PAMT is enabled, to avoid inducing a failure on
+	 * removal of the still-used PAMT entry.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(to_kvm_tdx(kvm)), kvm) ||
 	    tdx_reclaim_page(virt_to_page(sp->external_spt)))
@@ -3600,6 +3602,15 @@ void __init tdx_hardware_setup(void)
 	 */
 	vt_x86_ops.vm_size = max_t(unsigned int, vt_x86_ops.vm_size, sizeof(struct kvm_tdx));
 
+	/*
+	 * TDX uses the external_spt cache to allocate S-EPT page table pages,
+	 * which (a) don't need to be initialized by KVM as the TDX-Module will
+	 * initialize the page (using the guest's encryption key), and (b) need
+	 * to use a custom allocator to be compatible with Dynamic PAMT.
+	 */
+	vt_x86_ops.alloc_external_sp = tdx_alloc_control_page;
+	vt_x86_ops.free_external_sp = tdx_free_control_page;
+
 	vt_x86_ops.set_external_spte = tdx_sept_set_private_spte;
 	vt_x86_ops.reclaim_external_sp = tdx_sept_reclaim_private_sp;
 	vt_x86_ops.remove_external_spte = tdx_sept_remove_private_spte;
-- 
2.53.0.rc1.217.geba53bf80e-goog

