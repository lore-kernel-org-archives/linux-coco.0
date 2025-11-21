Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149AB2C21FE
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 00:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686315; cv=none; b=mNDeqMDmCbHUF+39qw3AyWTZhys9tX9AEmA3pcFVp3qdt/0w3BZQXt1kb/ITqwrWN8xSqHDUyuXKvl3bhAeIIEXjp1ZT6HIWIsRQz7KnI1hp8+XyhRmUvQJvCbeLiaRQgeVoi2RMR5YmDHCRBou/Zw5ayf5HUiWA6rgoJEcii8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686315; c=relaxed/simple;
	bh=pioh7oItQU+pjwmsuy2xyp62gOAlhgcs49oI3IaESJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaae/1b3uPabOnc1x77xE6ZgRVPmSmrJluSsQmZcx1FHpYr2AsW55Vouwkqr5OYNnMra9sd4KYyhLUeiZBAMBIKbnXFf3ZZybWVkMzyVPoRB+4qGtM4qADpfQU0FlrlJdthsapPkZeKqIClpDh0FkSdqODzaaqUjVgcTGYXKTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kp3AQUwv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kp3AQUwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763686313; x=1795222313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pioh7oItQU+pjwmsuy2xyp62gOAlhgcs49oI3IaESJI=;
  b=kp3AQUwvbmHfah9mwVFqT5kCJqiHxTIhvakFEBq4Km12Y76E+M+spQm2
   ykhFvSDaQgcPXIn8b0ChVOwe9ZwlR7Aj9Hnr0njkUrfWYfxX61TM5sjYV
   b4IKmHuJVtZxDTWy6nNaK3tQ68c/ng1ZQUV/mDyFqf8EKrCyDfgJvK9+v
   0Lh5QJapRjB1kwVHgHk42jKC9jCMf0nW7osUVXjeDYCdAilYnWCaJmq3M
   C14WOHdT99PGGv8vQVcz+D+uVAirNBvWIh9pRhYNysy9ktfJ5kWEcfjxe
   Z4t5LJnLW8qA05uMWL4jbKdMzorLg8Eq/h3jJuPWMw1xClmRehcD2bXhp
   g==;
X-CSE-ConnectionGUID: wsd0EDfuTt+lH6sjGxtIow==
X-CSE-MsgGUID: +3f0RWF0TSiTDtp8cBq16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64780819"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64780819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:47 -0800
X-CSE-ConnectionGUID: OUrv/n8TQauFiyl+Yyjz9A==
X-CSE-MsgGUID: 6mW1DfIPSVGrU8V5zT9Jdw==
X-ExtLoop1: 1
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:46 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	chao.gao@intel.com,
	dave.hansen@intel.com,
	isaku.yamahata@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	tglx@linutronix.de,
	vannapurve@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	xiaoyao.li@intel.com,
	binbin.wu@intel.com
Cc: rick.p.edgecombe@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v4 14/16] KVM: TDX: Reclaim PAMT memory
Date: Thu, 20 Nov 2025 16:51:23 -0800
Message-ID: <20251121005125.417831-15-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Call tdx_free_page() and tdx_pamt_put() on the paths that free TDX
pages.

The PAMT memory holds metadata for TDX-protected memory. With Dynamic
PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
with a few pages that cover 2M of host physical memory.

PAMT memory can be reclaimed when the last user is gone. It can happen
in a few code paths:

- On TDH.PHYMEM.PAGE.RECLAIM in tdx_reclaim_td_control_pages() and
  tdx_reclaim_page().

- On TDH.MEM.PAGE.REMOVE in tdx_sept_drop_private_spte().

- In tdx_sept_zap_private_spte() for pages that were in the queue to be
  added with TDH.MEM.PAGE.ADD, but it never happened due to an error.

- In tdx_sept_free_private_spt() for SEPT pages;

Add tdx_pamt_put() for memory that comes from guest_memfd and use
tdx_free_page() for the rest.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Minor log tweak]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v4:
 - Rebasing on post-populate series required some changes on how PAMT
   refcounting was handled in the KVM_TDX_INIT_MEM_REGION path. Now
   instead of incrementing DPAMT refcount on the fake add in the fault
   path, it only increments it when tdh_mem_page_add() actually succeeds,
   like in tdx_mem_page_aug(). Because of this, the special handling for
   the case tdx_is_sept_zap_err_due_to_premap() cared about is unneeded.

v3:
 - Minor log tweak to conform kvm/x86 style.
---
 arch/x86/kvm/vmx/tdx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 24322263ac27..f8de50e7dc7f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -360,7 +360,7 @@ static void tdx_reclaim_control_page(struct page *ctrl_page)
 	if (tdx_reclaim_page(ctrl_page))
 		return;
 
-	__free_page(ctrl_page);
+	tdx_free_page(ctrl_page);
 }
 
 struct tdx_flush_vp_arg {
@@ -597,7 +597,7 @@ static void tdx_reclaim_td_control_pages(struct kvm *kvm)
 
 	tdx_quirk_reset_page(kvm_tdx->td.tdr_page);
 
-	__free_page(kvm_tdx->td.tdr_page);
+	tdx_free_page(kvm_tdx->td.tdr_page);
 	kvm_tdx->td.tdr_page = NULL;
 }
 
@@ -1827,6 +1827,8 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, void *private_spt)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	struct page *page = virt_to_page(private_spt);
+	int ret;
 
 	/*
 	 * free_external_spt() is only called after hkid is freed when TD is
@@ -1843,7 +1845,12 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * The HKID assigned to this TD was already freed and cache was
 	 * already flushed. We don't have to flush again.
 	 */
-	return tdx_reclaim_page(virt_to_page(private_spt));
+	ret = tdx_reclaim_page(virt_to_page(private_spt));
+	if (ret)
+		return ret;
+
+	tdx_pamt_put(page);
+	return 0;
 }
 
 static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
@@ -1895,6 +1902,7 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 		return;
 
 	tdx_quirk_reset_page(page);
+	tdx_pamt_put(page);
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-- 
2.51.2

