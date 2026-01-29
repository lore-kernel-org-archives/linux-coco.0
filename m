Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD23191C0
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649333; cv=none; b=iildnFslvHqKkYNFJLb9qKxSXGpcA6kdIx+Q7O6r1Se4OtsB9yIK21aIMxqAldhohKb+aMkr4yruASobl6R7Pq18qSk/NotRCsfmt9L2/u6s+r3FQ8LER25XmJwBZbVf9DeypVqFQW60RRTJFb9vWRB8evUFjnTbSX6VjMhb0g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649333; c=relaxed/simple;
	bh=6WZuX4SGOhlJ1EJPkuzateSePJBHf/L/b6Rra/zk9bI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QFoFgPBTSeN+740zEkhdPwbtWDxRaGNGIoEr6hHrRJTPDKNpSJkzAs77HeH3zXMfAYiSwm2DVDZFlMxzAz97Mp0CwsVaB71tFA6VlxRqEecZ4KD3cdi1yf52wdCMO0ZSGG+cBqSc8CMbDItb7TcK5/2E0gn5XNkgL88prfDldcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfaEQ6rm; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfaEQ6rm"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-352b6ad49ddso281471a91.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649330; x=1770254130; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=igCO2aefnhWl+0Qoc7v6+UqQKsYgMls58OQ/f2Mb56Y=;
        b=sfaEQ6rmqmvktwYN0BC6yvfBovcT0FTG1BokAr/NQrjIR5r2megxM1v0uYbDDeZUeN
         RxLOERqYUmt+sf+FZoZuw872HP8mM3vTVP56JRTCSF41QGY4bz7qDv5ARRuqdiH6P+Dr
         WL+zbG+EMKTwDTP0pAMGzbeHmThJoaXqH3PGG/ux+8GQGMJTsKju+he5P+lrYH/5ShaA
         vebPaeg2YVgBmBAdTl4F1+DilvzoXVSYlO/wG82eQJGdYUa1X26RCY6H36BOaj3ihJ/0
         PfZv9RXEMbPlgT0w2F5LyB0G+iigxUGJXPI3MFMgqUpQCpnNKVmK42WnbqVR9A31mLxY
         DAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649330; x=1770254130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igCO2aefnhWl+0Qoc7v6+UqQKsYgMls58OQ/f2Mb56Y=;
        b=AwOnS8EPVyLrq+JzZBgnEu7JOSRvfUh1tGzVWh3YBW+h53pxYiQw2LvNScjDW7EqgO
         OOaaKo2b29v3mRNA0h9fxVg4CBYDlWcUB2ZtKhwBBQeIF56NQ3lNY/teJFRkqXBTi7FJ
         UeEylKYiyveTbMDmRgwcuFZ1GTcXcQiZxJ+dkdmPdPD7sIZQl/BEeCFn8y4IvUb6BFl0
         g7oMxigIDmX97eMRoNMvuXsVyMJGjbEPvSklHTY2soxAl+GEBVTYeSoW5PWQpHEQ0xqa
         LwkPqU64iGiK0QMYH4vFH/xHdS0CWSkDnJBXXhhf5cgkh4B4r4AHo/orq1k+bQAXHjRM
         gUOA==
X-Forwarded-Encrypted: i=1; AJvYcCXLncRY62czRFafWwHdIpQFOFVFXOhvnALA9DByKN1x2DejsSEflUeYbKz5uJV/bQkYZ9IG7y8g6+75@lists.linux.dev
X-Gm-Message-State: AOJu0YyN9Ee8wxN0gKCUOQK7aSf2WwA/JIILTjfg0DYu2ho1NZQMQ4/X
	WL8ibHbs3NJzjnJaIBhRs3t7iJeeuUlT/2sYkgU6WRucwmUMOm08uQfrwqE0zzmIQUd6Da7NsaM
	X4smjhw==
X-Received: from pjbos4.prod.google.com ([2002:a17:90b:1cc4:b0:34a:c87f:a95a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ecc:b0:340:9d52:44c1
 with SMTP id 98e67ed59e1d1-353feda1774mr6383748a91.35.1769649329834; Wed, 28
 Jan 2026 17:15:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:33 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-2-seanjc@google.com>
Subject: [RFC PATCH v5 01/45] x86/tdx: Use pg_level in TDX APIs, not the
 TDX-Module's 0-based level
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

Rework the TDX APIs to take the kernel's 1-based pg_level enum, not the
TDX-Module's 0-based level.  The APIs are _kernel_ APIs, not TDX-Module
APIs, and the kernel (and KVM) uses "enum pg_level" literally everywhere.

Using "enum pg_level" eliminates ambiguity when looking at the APIs (it's
NOT clear that "int level" refers to the TDX-Module's level), and will
allow for using existing helpers like page_level_size() when support for
hugepages is added to the S-EPT APIs.

No functional change intended.

Cc: Kai Huang <kai.huang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Acked-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tdx.h  | 14 ++++----------
 arch/x86/kvm/vmx/tdx.c      | 11 ++++-------
 arch/x86/virt/vmx/tdx/tdx.c | 26 ++++++++++++++++++--------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 6b338d7f01b7..bc0d03e70fd6 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -189,19 +189,13 @@ static inline u64 mk_keyed_paddr(u16 hkid, struct page *page)
 	return ret;
 }
 
-static inline int pg_level_to_tdx_sept_level(enum pg_level level)
-{
-        WARN_ON_ONCE(level == PG_LEVEL_NONE);
-        return level - 1;
-}
-
 u64 tdh_vp_enter(struct tdx_vp *vp, struct tdx_module_args *args);
 u64 tdh_mng_addcx(struct tdx_td *td, struct page *tdcs_page);
 u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page *source, u64 *ext_err1, u64 *ext_err2);
-u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2);
+u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, enum pg_level level, struct page *page, u64 *ext_err1, u64 *ext_err2);
 u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page);
-u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2);
-u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, int level, u64 *ext_err1, u64 *ext_err2);
+u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, enum pg_level level, struct page *page, u64 *ext_err1, u64 *ext_err2);
+u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, enum pg_level level, u64 *ext_err1, u64 *ext_err2);
 u64 tdh_mng_key_config(struct tdx_td *td);
 u64 tdh_mng_create(struct tdx_td *td, u16 hkid);
 u64 tdh_vp_create(struct tdx_td *td, struct tdx_vp *vp);
@@ -217,7 +211,7 @@ u64 tdh_vp_rd(struct tdx_vp *vp, u64 field, u64 *data);
 u64 tdh_vp_wr(struct tdx_vp *vp, u64 field, u64 data, u64 mask);
 u64 tdh_phymem_page_reclaim(struct page *page, u64 *tdx_pt, u64 *tdx_owner, u64 *tdx_size);
 u64 tdh_mem_track(struct tdx_td *tdr);
-u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u64 *ext_err2);
+u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, enum pg_level level, u64 *ext_err1, u64 *ext_err2);
 u64 tdh_phymem_cache_wb(bool resume);
 u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td);
 u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page);
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 5df9d32d2058..561461c9d131 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1648,14 +1648,13 @@ static int tdx_mem_page_add(struct kvm *kvm, gfn_t gfn, enum pg_level level,
 static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 			    enum pg_level level, kvm_pfn_t pfn)
 {
-	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct page *page = pfn_to_page(pfn);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 entry, level_state;
 	u64 err;
 
-	err = tdh_mem_page_aug(&kvm_tdx->td, gpa, tdx_level, page, &entry, &level_state);
+	err = tdh_mem_page_aug(&kvm_tdx->td, gpa, level, page, &entry, &level_state);
 	if (unlikely(tdx_operand_busy(err)))
 		return -EBUSY;
 
@@ -1699,12 +1698,11 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, void *private_spt)
 {
-	int tdx_level = pg_level_to_tdx_sept_level(level);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	struct page *page = virt_to_page(private_spt);
 	u64 err, entry, level_state;
 
-	err = tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, tdx_level, page, &entry,
+	err = tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, level, page, &entry,
 			       &level_state);
 	if (unlikely(tdx_operand_busy(err)))
 		return -EBUSY;
@@ -1788,7 +1786,6 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 					 enum pg_level level, u64 mirror_spte)
 {
 	struct page *page = pfn_to_page(spte_to_pfn(mirror_spte));
-	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
@@ -1808,7 +1805,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 		return;
 
 	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
-			      tdx_level, &entry, &level_state);
+			      level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
 		return;
 
@@ -1824,7 +1821,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
 	 */
 	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
-			      tdx_level, &entry, &level_state);
+			      level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
 		return;
 
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 5ce4ebe99774..22c0f832cb37 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1516,6 +1516,12 @@ static void tdx_clflush_page(struct page *page)
 	clflush_cache_range(page_to_virt(page), PAGE_SIZE);
 }
 
+static int pg_level_to_tdx_sept_level(enum pg_level level)
+{
+	WARN_ON_ONCE(level == PG_LEVEL_NONE);
+	return level - 1;
+}
+
 noinstr u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
 {
 	args->rcx = td->tdvpr_pa;
@@ -1556,10 +1562,11 @@ u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_mem_page_add);
 
-u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2)
+u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, enum pg_level level,
+		     struct page *page, u64 *ext_err1, u64 *ext_err2)
 {
 	struct tdx_module_args args = {
-		.rcx = gpa | level,
+		.rcx = gpa | pg_level_to_tdx_sept_level(level),
 		.rdx = tdx_tdr_pa(td),
 		.r8 = page_to_phys(page),
 	};
@@ -1587,10 +1594,11 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_vp_addcx);
 
-u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2)
+u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, enum pg_level level,
+		     struct page *page, u64 *ext_err1, u64 *ext_err2)
 {
 	struct tdx_module_args args = {
-		.rcx = gpa | level,
+		.rcx = gpa | pg_level_to_tdx_sept_level(level),
 		.rdx = tdx_tdr_pa(td),
 		.r8 = page_to_phys(page),
 	};
@@ -1606,10 +1614,11 @@ u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *page, u
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_mem_page_aug);
 
-u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, int level, u64 *ext_err1, u64 *ext_err2)
+u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, enum pg_level level,
+			u64 *ext_err1, u64 *ext_err2)
 {
 	struct tdx_module_args args = {
-		.rcx = gpa | level,
+		.rcx = gpa | pg_level_to_tdx_sept_level(level),
 		.rdx = tdx_tdr_pa(td),
 	};
 	u64 ret;
@@ -1822,10 +1831,11 @@ u64 tdh_mem_track(struct tdx_td *td)
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_mem_track);
 
-u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u64 *ext_err2)
+u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, enum pg_level level,
+			u64 *ext_err1, u64 *ext_err2)
 {
 	struct tdx_module_args args = {
-		.rcx = gpa | level,
+		.rcx = gpa | pg_level_to_tdx_sept_level(level),
 		.rdx = tdx_tdr_pa(td),
 	};
 	u64 ret;
-- 
2.53.0.rc1.217.geba53bf80e-goog

