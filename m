Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD4E335070
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649397; cv=none; b=mKRCyZv6uMfCRvua/GWPan1JkA0G5GR9SBmRCYxGsgdsLkcBAejUaYlN6Qv6wSZw0e9ftg7ekIz0hVhMd6gyUkU0Jc/I7WhkKwFyNazQxhde7lATr7LrbQuvCLzmVMfaUjCUx0JSkLZMri/IrfU2xF+IBk4RoSaWGuHechwB1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649397; c=relaxed/simple;
	bh=kJQ9hFNF5ygDouQFKIpQgR+27T82l54AJAavRy375H8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nv5e8QwJBSJ/DDshL7h2pnQAVPngQR2LPFVyM1cDcNy1gCLAGFKGbetmv3Qc16fvgrJyPMe5La1ARAO6J8DpiOZHP7I2wxoDpV2z+tTJoityME5cYFYLHFREW5ARarjMuf5aj3mh5c9GJBViX1CQyxbkGCxcbgoYgypt7qboI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g19keHmA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g19keHmA"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a863be8508so4624855ad.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649394; x=1770254194; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hk2OrgovQOMb8nY4yl86VZzMpQRRHhLb7boChViJO8g=;
        b=g19keHmAHJQTdk8477hDfQIDfIJ0RpDpHAMfplC+jN2jhcWxYFZlGV1lCRFfZQlxa+
         MOWXZ4+uKtDKn0ZGvLYIa8aVthOpAYPxsYlWObZREcO9onsrUTJFE6TfuLbOXft/P3P+
         oy8Z+7mtu5/yEe/xd4WVBRHDBQ9c1UBevACvrgXjk46Cl/3k9TteAVgxYwLY+l45WzaJ
         DGn0iDoCcZibyHdWPtBeQlbHr/+9HtiMM79nBO6TS4tZ+JTgfTY5gMIszft4d60TyfHK
         BDFwPZRfPPecPPB+VVnoJqKp5NuRBV01zH8i3y8mPYlM5lTjBZpXP5ADI0G1+GtlDJF1
         9cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649394; x=1770254194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk2OrgovQOMb8nY4yl86VZzMpQRRHhLb7boChViJO8g=;
        b=nFI1FheAN40GRmm2qzBDpJEivx2uejJ4l5b47aJlfCVCfj8gWm6xfrWlphBc1yuUf0
         LMO2RSqLkb8LrGsRYH7Mamx7+Lv/49tHuLl5TT0LGbN8lZC3L2aPBD6dzHDklzEXCqWS
         Mwv3SsRWIt346KPA0XgQvwbzuCDJITYOO3bBDP95cRvbHv8upWBn3uwymUK9rzeIm7ti
         8tfUbdpOq7yHyrNGE0IGBdhhei4LiSO6iTsedWgiAvR9QGb7GF37hl/poN+Phg4xL1cB
         TC1uz8GIfTU+WGdpbLqyzkxEbTAQnuej8aIJKBf3HAbYY56P9Mi57e/l5oKWvSl6gXVt
         8CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKzwrRAEXbXcIMKoPUUdiPLQddm6niDp/fSpQFUNKjMah0wipaN40vsFDfL69mpOpBPQACpkuyrc0v@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5UQRdgADS/ZmIot2OK1yRZs1W194oSAm1TiKNu1O0qQWmU4Vl
	VzbKKfKlu7AudQwO9JIqlJkVeXEo7HTyREOrnvGRgwpzY4Ai3CagkuC1S6HYdDCNsg42czT5Kev
	pA4JylA==
X-Received: from plqu6.prod.google.com ([2002:a17:902:a606:b0:2a7:cf29:aee1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8cd:b0:2a7:a653:5203
 with SMTP id d9443c01a7336-2a870de43ccmr68752745ad.27.1769649394405; Wed, 28
 Jan 2026 17:16:34 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:15:07 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-36-seanjc@google.com>
Subject: [RFC PATCH v5 35/45] KVM: TDX: Add helper to handle mapping leaf SPTE
 into S-EPT
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

Add a helper, tdx_sept_map_leaf_spte(), to wrap and isolate PAGE.ADD and
PAGE.AUG operations, and thus complete tdx_sept_set_private_spte()'s
transition into a "dispatch" routine for setting/writing S-EPT entries.

Opportunistically tweak the prototypes for tdx_sept_remove_private_spte()
and tdx_sept_link_private_spt() to align with tdx_sept_set_private_spte()
and tdx_sept_map_leaf_spte().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 97 ++++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 46 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 9f7789c5f0a7..e6ac4aca8114 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1670,6 +1670,50 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
+static int tdx_sept_map_leaf_spte(struct kvm *kvm, gfn_t gfn, u64 new_spte,
+				  enum pg_level level)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	kvm_pfn_t pfn = spte_to_pfn(new_spte);
+	int ret;
+
+	/* TODO: handle large pages. */
+	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
+		return -EIO;
+
+	if (KVM_BUG_ON(!vcpu, kvm))
+		return -EINVAL;
+
+	WARN_ON_ONCE((new_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
+
+	ret = tdx_pamt_get(pfn, level, &to_tdx(vcpu)->pamt_cache);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
+	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
+	 * arbitrary memory until the initial memory image is finalized.  Pairs
+	 * with the smp_wmb() in tdx_td_finalize().
+	 */
+	smp_rmb();
+
+	/*
+	 * If the TD isn't finalized/runnable, then userspace is initializing
+	 * the VM image via KVM_TDX_INIT_MEM_REGION; ADD the page to the TD.
+	 */
+	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
+		ret = tdx_mem_page_aug(kvm, gfn, level, pfn);
+	else
+		ret = tdx_mem_page_add(kvm, gfn, level, pfn);
+
+	if (ret)
+		tdx_pamt_put(pfn, level);
+
+	return ret;
+}
+
 /*
  * Ensure shared and private EPTs to be flushed on all vCPUs.
  * tdh_mem_track() is the only caller that increases TD epoch. An increase in
@@ -1729,14 +1773,14 @@ static struct page *tdx_spte_to_external_spt(struct kvm *kvm, gfn_t gfn,
 	return virt_to_page(sp->external_spt);
 }
 
-static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, u64 mirror_spte)
+static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn, u64 new_spte,
+				     enum pg_level level)
 {
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 	struct page *external_spt;
 
-	external_spt = tdx_spte_to_external_spt(kvm, gfn, mirror_spte, level);
+	external_spt = tdx_spte_to_external_spt(kvm, gfn, new_spte, level);
 	if (!external_spt)
 		return -EIO;
 
@@ -1752,7 +1796,7 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 }
 
 static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
-					enum pg_level level, u64 old_spte)
+					u64 old_spte, enum pg_level level)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	kvm_pfn_t pfn = spte_to_pfn(old_spte);
@@ -1806,55 +1850,16 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				     u64 new_spte, enum pg_level level)
 {
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	kvm_pfn_t pfn = spte_to_pfn(new_spte);
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
-	int ret;
-
 	if (is_shadow_present_pte(old_spte))
-		return tdx_sept_remove_private_spte(kvm, gfn, level, old_spte);
-
-	if (KVM_BUG_ON(!vcpu, kvm))
-		return -EINVAL;
+		return tdx_sept_remove_private_spte(kvm, gfn, old_spte, level);
 
 	if (KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
 		return -EIO;
 
 	if (!is_last_spte(new_spte, level))
-		return tdx_sept_link_private_spt(kvm, gfn, level, new_spte);
+		return tdx_sept_link_private_spt(kvm, gfn, new_spte, level);
 
-	/* TODO: handle large pages. */
-	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EIO;
-
-	WARN_ON_ONCE((new_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
-
-	ret = tdx_pamt_get(pfn, level, &tdx->pamt_cache);
-	if (ret)
-		return ret;
-
-	/*
-	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
-	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
-	 * arbitrary memory until the initial memory image is finalized.  Pairs
-	 * with the smp_wmb() in tdx_td_finalize().
-	 */
-	smp_rmb();
-
-	/*
-	 * If the TD isn't finalized/runnable, then userspace is initializing
-	 * the VM image via KVM_TDX_INIT_MEM_REGION; ADD the page to the TD.
-	 */
-	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
-		ret = tdx_mem_page_aug(kvm, gfn, level, pfn);
-	else
-		ret = tdx_mem_page_add(kvm, gfn, level, pfn);
-
-	if (ret)
-		tdx_pamt_put(pfn, level);
-
-	return ret;
+	return tdx_sept_map_leaf_spte(kvm, gfn, new_spte, level);
 }
 
 static void tdx_sept_reclaim_private_sp(struct kvm *kvm, gfn_t gfn,
-- 
2.53.0.rc1.217.geba53bf80e-goog

