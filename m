Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59E2CA7
	for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641900796; x=1673436796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eAlNpFgI2dj8DL18robIsH5Fta03JBWQ7Hr8f4oKmC0=;
  b=Nb23mvBzIv0Q3NKxN0kbFW+igKoLz4YJ2pid7JzD6/urmhfTFmwZObVv
   S99BBA+M+0FJbpK+Qo5QfpQeqO/bIu2DDFrZe+J6sYbsevORXEqUSSLmd
   7xuJ7YfP8lYXHnFtDvQRSLxy5581RCpr2ubYBy7uPw4oggTCPV9hjoyUj
   Bi6ZExjAcr2+4n1MiJZ93MrHT73AB4cfDMz1N8a1NLnhPtm/MayreCADC
   pZ35YFcxjzb3a5jf/DoLxgyNizDKMQv1Wb4Eg0ZEY5Nhh1MSut6LbZStK
   EsUpptprHr4IOQSHIILAvE7lG3O38ocDagwiyx9JnUngW9M7XWu/MaSsP
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243261608"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243261608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="515063272"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jan 2022 03:33:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 20859125; Tue, 11 Jan 2022 13:33:19 +0200 (EET)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 1/7] mm: Add support for unaccepted memory
Date: Tue, 11 Jan 2022 14:33:08 +0300
Message-Id: <20220111113314.27173-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UEFI Specification version 2.9 introduces the concept of memory
acceptance. Some Virtual Machine platforms, such as Intel TDX or AMD
SEV-SNP, requiring memory to be accepted before it can be used by the
guest. Accepting happens via a protocol specific for the Virtual Machine
platform.

Accepting memory is costly and it makes VMM allocate memory for the
accepted guest physical address range. It's better to postpone memory
acceptance until memory is needed. It lowers boot time and reduces
memory overhead.

Support of such memory requires a few changes in core-mm code:

  - memblock has to accept memory on allocation;

  - page allocator has to accept memory on the first allocation of the
    page;

Memblock change is trivial.

The page allocator is modified to accept pages on the first allocation.
PageOffline() is used to indicate that the page requires acceptance.
The flag is currently used by hotplug and ballooning. Such pages are not
available to the page allocator.

Architecture has to provide three helpers if it wants to support
unaccepted memory:

 - accept_memory() makes a range of physical addresses accepted.

 - maybe_set_page_offline() marks a page PageOffline() if it requires
   acceptance. Used during boot to put pages on free lists.

 - accept_and_clear_page_offline() makes a page accepted and clears
   PageOffline().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 include/linux/page-flags.h |  4 ++++
 mm/internal.h              | 15 +++++++++++++++
 mm/memblock.c              |  1 +
 mm/page_alloc.c            | 21 ++++++++++++++++++++-
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 52ec4b5e5615..281f70da329c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -887,6 +887,10 @@ PAGE_TYPE_OPS(Buddy, buddy)
  * any further access to page content. PFN walkers that read content of random
  * pages should check PageOffline() and synchronize with such drivers using
  * page_offline_freeze()/page_offline_thaw().
+ *
+ * If a PageOffline() page encountered on a buddy allocator's free list it has
+ * to be "accepted" before it can be used.
+ * See accept_and_clear_page_offline() and CONFIG_UNACCEPTED_MEMORY.
  */
 PAGE_TYPE_OPS(Offline, offline)
 
diff --git a/mm/internal.h b/mm/internal.h
index 3b79a5c9427a..1738a4e2a27e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -713,4 +713,19 @@ void vunmap_range_noflush(unsigned long start, unsigned long end);
 int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
+#ifndef CONFIG_UNACCEPTED_MEMORY
+static inline void maybe_set_page_offline(struct page *page, unsigned int order)
+{
+}
+
+static inline void accept_and_clear_page_offline(struct page *page,
+						 unsigned int order)
+{
+}
+
+static inline void accept_memory(phys_addr_t start, phys_addr_t end)
+{
+}
+#endif
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memblock.c b/mm/memblock.c
index 1018e50566f3..6dfa594192de 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1400,6 +1400,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
 		 */
 		kmemleak_alloc_phys(found, size, 0, 0);
 
+	accept_memory(found, found + size);
 	return found;
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c5952749ad40..5707b4b5f774 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1064,6 +1064,7 @@ static inline void __free_one_page(struct page *page,
 	unsigned int max_order;
 	struct page *buddy;
 	bool to_tail;
+	bool offline = PageOffline(page);
 
 	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
 
@@ -1097,6 +1098,10 @@ static inline void __free_one_page(struct page *page,
 			clear_page_guard(zone, buddy, order, migratetype);
 		else
 			del_page_from_free_list(buddy, zone, order);
+
+		if (PageOffline(buddy))
+			offline = true;
+
 		combined_pfn = buddy_pfn & pfn;
 		page = page + (combined_pfn - pfn);
 		pfn = combined_pfn;
@@ -1130,6 +1135,9 @@ static inline void __free_one_page(struct page *page,
 done_merging:
 	set_buddy_order(page, order);
 
+	if (offline)
+		__SetPageOffline(page);
+
 	if (fpi_flags & FPI_TO_TAIL)
 		to_tail = true;
 	else if (is_shuffle_order(order))
@@ -1155,7 +1163,8 @@ static inline void __free_one_page(struct page *page,
 static inline bool page_expected_state(struct page *page,
 					unsigned long check_flags)
 {
-	if (unlikely(atomic_read(&page->_mapcount) != -1))
+	if (unlikely(atomic_read(&page->_mapcount) != -1) &&
+	    !PageOffline(page))
 		return false;
 
 	if (unlikely((unsigned long)page->mapping |
@@ -1734,6 +1743,8 @@ void __init memblock_free_pages(struct page *page, unsigned long pfn,
 {
 	if (early_page_uninitialised(pfn))
 		return;
+
+	maybe_set_page_offline(page, order);
 	__free_pages_core(page, order);
 }
 
@@ -1823,10 +1834,12 @@ static void __init deferred_free_range(unsigned long pfn,
 	if (nr_pages == pageblock_nr_pages &&
 	    (pfn & (pageblock_nr_pages - 1)) == 0) {
 		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+		maybe_set_page_offline(page, pageblock_order);
 		__free_pages_core(page, pageblock_order);
 		return;
 	}
 
+	accept_memory(pfn << PAGE_SHIFT, (pfn + nr_pages) << PAGE_SHIFT);
 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
 		if ((pfn & (pageblock_nr_pages - 1)) == 0)
 			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
@@ -2297,6 +2310,9 @@ static inline void expand(struct zone *zone, struct page *page,
 		if (set_page_guard(zone, &page[size], high, migratetype))
 			continue;
 
+		if (PageOffline(page))
+			__SetPageOffline(&page[size]);
+
 		add_to_free_list(&page[size], zone, high, migratetype);
 		set_buddy_order(&page[size], high);
 	}
@@ -2393,6 +2409,9 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 	 */
 	kernel_unpoison_pages(page, 1 << order);
 
+	if (PageOffline(page))
+		accept_and_clear_page_offline(page, order);
+
 	/*
 	 * As memory initialization might be integrated into KASAN,
 	 * kasan_alloc_pages and kernel_init_free_pages must be
-- 
2.34.1

