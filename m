Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2F287256
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 00:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686309; cv=none; b=skPF813mqW4Ye65AjJCneKPMaJBGjCj0Ck5d25jkgUDiQYbDNRoIbQCY1+I7XSnkK0Y1nLRlaibMKoPKr9UtrztWs8IFL8IvIXC5DLM68eFJeGY0soPxHjfxEfw3bE/Hg4qCJJY4LSosKxuRQRgMzWP08wCdlKiGLSpeJ7e0Tj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686309; c=relaxed/simple;
	bh=6ditKQEwLGNNw4WszuVeRpNXeaOTTzhGUAT8kkxlvYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1IKvysQYCBMEW4pKbHipIJVmEvc4pq8A+NCo3dpzvYLujCYIosjedoR/wIf4kJ5UE5DqB8X1O/UnR8zx96bCvbejuL9oV8kL+82/P0wsYLrWfG1kXWA1RsrNIcbYn5i0PCalNQMzfz1rbrpvGANJO3DMCC6nUUQxSYf1j+bOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1tYmXhA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1tYmXhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763686307; x=1795222307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ditKQEwLGNNw4WszuVeRpNXeaOTTzhGUAT8kkxlvYM=;
  b=C1tYmXhAKS/ww1efJzF8ECaNJx/C2nvO5cjJC3i6OT4KvGUjUE0gmLHW
   bpa9ayW5W5pVKh21epn4Q0/ADhdtV/bIWcLK4RPIfxMBEGPhzRc9UyK2h
   gYGV2bA0ndQvr8uY4mmiDT7sYq6YXkDnlvFJqCPckOnSbbLyMcv/mxarB
   obi7iEvyV9OLPBU7PPBSHKlgIcFqgxuYpF0GldIt9Yrmjeyjx+IrxEkwB
   50cmeMf2YOOE0P/mypeNXhJOP9CUUGp6pk8Vw/AbDUy8ZNELa6oX7eTaG
   s3ahNe0zFYt0VZ3dkhU+BPy/4cfdC5JbpxANEwFU2OUSEiCzeno9/w+iC
   A==;
X-CSE-ConnectionGUID: LxpqOmYaR6q5HIyNJkRL7A==
X-CSE-MsgGUID: ZFnytUS4TPGVnwQaJsCK1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64780760"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64780760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:43 -0800
X-CSE-ConnectionGUID: iCe9v2eeToeFnf8xXAEuIA==
X-CSE-MsgGUID: srluBitBTXi+ORvBwUI2BA==
X-ExtLoop1: 1
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:51:43 -0800
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
Subject: [PATCH v4 06/16] x86/virt/tdx: Improve PAMT refcounts allocation for sparse memory
Date: Thu, 20 Nov 2025 16:51:15 -0800
Message-ID: <20251121005125.417831-7-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

init_pamt_metadata() allocates PAMT refcounts for all physical memory up
to max_pfn. It might be suboptimal if the physical memory layout is
discontinuous and has large holes.

The refcount allocation vmalloc allocation. This is necessary to support a
large allocation size. The virtually contiguous property also makes it
easy to find a specific 2MB range’s refcount since it can simply be
indexed.

Since vmalloc mappings support remapping during normal kernel runtime,
switch to an approach that only populates refcount pages for the vmalloc
mapping when there is actually memory for that range. This means any holes
in the physical address space won’t use actual physical memory.

The validity of this memory optimization is based on a couple assumptions:
1. Physical holes in the ram layout are commonly large enough for it to be
   worth it.
2. An alternative approach that looks the refcounts via some more layered
   data structure wouldn’t overly complicate the lookups. Or at least
   more than the complexity of managing the vmalloc mapping.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Add feedback, update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v4:
 - Fix refcount allocation size calculation. (Kai, Binbin)
 - Fix/improve comments. (Kai, Binbin)
 - Simplify tdx_find_pamt_refcount() implemenation and callers by making
   it take a PFN and calculating it directly rather than going through a
   PA intermediate.
 - Check tdx_supports_dynamic_pamt() in alloc_pamt_refcount() to prevent
   crash when TDX module does not support DPAMT. (Kai)
 - Log change refcounters->refcount to be consistent

v3:
 - Split from "x86/virt/tdx: Allocate reference counters for
   PAMT memory" (Dave)
 - Rename tdx_get_pamt_refcount()->tdx_find_pamt_refcount() (Dave)
 - Drop duplicate pte_none() check (Dave)
 - Align assignments in alloc_pamt_refcount() (Kai)
 - Add comment in pamt_refcount_depopulate() to clarify teardown
   logic (Dave)
 - Drop __va(PFN_PHYS(pte_pfn(ptep_get()))) pile on for simpler method.
   (Dave)
 - Improve log
---
 arch/x86/virt/vmx/tdx/tdx.c | 136 +++++++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 11 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index c28d4d11736c..edf9182ed86d 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -194,30 +194,135 @@ int tdx_cpu_enable(void)
 }
 EXPORT_SYMBOL_GPL(tdx_cpu_enable);
 
-/*
- * Allocate PAMT reference counters for all physical memory.
- *
- * It consumes 2MiB for every 1TiB of physical memory.
- */
-static int init_pamt_metadata(void)
+/* Find PAMT refcount for a given physical address */
+static atomic_t *tdx_find_pamt_refcount(unsigned long pfn)
 {
-	size_t size = DIV_ROUND_UP(max_pfn, PTRS_PER_PTE) * sizeof(*pamt_refcounts);
+	/* Find which PMD a PFN is in. */
+	unsigned long index = pfn >> (PMD_SHIFT - PAGE_SHIFT);
 
-	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
-		return 0;
+	return &pamt_refcounts[index];
+}
 
-	pamt_refcounts = __vmalloc(size, GFP_KERNEL | __GFP_ZERO);
-	if (!pamt_refcounts)
+/* Map a page into the PAMT refcount vmalloc region */
+static int pamt_refcount_populate(pte_t *pte, unsigned long addr, void *data)
+{
+	struct page *page;
+	pte_t entry;
+
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
 		return -ENOMEM;
 
+	entry = mk_pte(page, PAGE_KERNEL);
+
+	spin_lock(&init_mm.page_table_lock);
+	/*
+	 * PAMT refcount populations can overlap due to rounding of the
+	 * start/end pfn. Make sure the PAMT range is only populated once.
+	 */
+	if (pte_none(ptep_get(pte)))
+		set_pte_at(&init_mm, addr, pte, entry);
+	else
+		__free_page(page);
+	spin_unlock(&init_mm.page_table_lock);
+
 	return 0;
 }
 
+/*
+ * Allocate PAMT reference counters for the given PFN range.
+ *
+ * It consumes 2MiB for every 1TiB of physical memory.
+ */
+static int alloc_pamt_refcount(unsigned long start_pfn, unsigned long end_pfn)
+{
+	unsigned long refcount_first, refcount_last;
+	unsigned long mapping_start, mapping_end;
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return 0;
+
+	/*
+	 * 'start_pfn' is inclusive and 'end_pfn' is exclusive. Find the
+	 * range of refcounts the pfn range will need.
+	 */
+	refcount_first = (unsigned long)tdx_find_pamt_refcount(start_pfn);
+	refcount_last   = (unsigned long)tdx_find_pamt_refcount(end_pfn - 1);
+
+	/*
+	 * Calculate the page aligned range that includes the refcounts. The
+	 * teardown logic needs to handle potentially overlapping refcount
+	 * mappings resulting from the alignments.
+	 */
+	mapping_start = round_down(refcount_first, PAGE_SIZE);
+	mapping_end   = round_up(refcount_last + sizeof(*pamt_refcounts), PAGE_SIZE);
+
+
+	return apply_to_page_range(&init_mm, mapping_start, mapping_end - mapping_start,
+				   pamt_refcount_populate, NULL);
+}
+
+/*
+ * Reserve vmalloc range for PAMT reference counters. It covers all physical
+ * address space up to max_pfn. It is going to be populated from
+ * build_tdx_memlist() only for present memory that available for TDX use.
+ *
+ * It reserves 2MiB of virtual address space for every 1TiB of physical memory.
+ */
+static int init_pamt_metadata(void)
+{
+	struct vm_struct *area;
+	size_t size;
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return 0;
+
+	size = DIV_ROUND_UP(max_pfn, PTRS_PER_PTE) * sizeof(*pamt_refcounts);
+
+	area = get_vm_area(size, VM_SPARSE);
+	if (!area)
+		return -ENOMEM;
+
+	pamt_refcounts = area->addr;
+	return 0;
+}
+
+/* Unmap a page from the PAMT refcount vmalloc region */
+static int pamt_refcount_depopulate(pte_t *pte, unsigned long addr, void *data)
+{
+	struct page *page;
+	pte_t entry;
+
+	spin_lock(&init_mm.page_table_lock);
+
+	entry = ptep_get(pte);
+	/* refcount allocation is sparse, may not be populated */
+	if (!pte_none(entry)) {
+		pte_clear(&init_mm, addr, pte);
+		page = pte_page(entry);
+		__free_page(page);
+	}
+
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+/* Unmap all PAMT refcount pages and free vmalloc range */
 static void free_pamt_metadata(void)
 {
+	size_t size;
+
 	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
 		return;
 
+	size = max_pfn / PTRS_PER_PTE * sizeof(*pamt_refcounts);
+	size = round_up(size, PAGE_SIZE);
+
+	apply_to_existing_page_range(&init_mm,
+				     (unsigned long)pamt_refcounts,
+				     size, pamt_refcount_depopulate,
+				     NULL);
 	vfree(pamt_refcounts);
 	pamt_refcounts = NULL;
 }
@@ -288,10 +393,19 @@ static int build_tdx_memlist(struct list_head *tmb_list)
 		ret = add_tdx_memblock(tmb_list, start_pfn, end_pfn, nid);
 		if (ret)
 			goto err;
+
+		/* Allocated PAMT refcountes for the memblock */
+		ret = alloc_pamt_refcount(start_pfn, end_pfn);
+		if (ret)
+			goto err;
 	}
 
 	return 0;
 err:
+	/*
+	 * Only free TDX memory blocks here, PAMT refcount pages
+	 * will be freed in the init_tdx_module() error path.
+	 */
 	free_tdx_memlist(tmb_list);
 	return ret;
 }
-- 
2.51.2

