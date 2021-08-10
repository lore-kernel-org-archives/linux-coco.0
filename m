Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3329D6
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 06:26:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x8so39340318lfe.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Aug 2021 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a680rZ8UxFSfjPWaIbbDiJ7ffs2v95N8x5hz5VhhuJc=;
        b=Kaoo/+qo6x9ifc5IkxRhr2Abo2QlEMA2dumoSO40VGVq7z/mGplRxZh1R6ECCoxoxr
         u9HREgS/W829rPS0pkS0RfL888/8shlAxvPErro/fnKu0x/ia/fFqVy7I0OR3hbKwnny
         Mgtbj4FEi5xHpzLLIWjdHYLQMakFwA3MtOz1Q/Q/0z55BstDNwNs3Sr0PxbkfQ74s26n
         EMaZwexRYdulPeGaXnTt/rzGOxYskklZsEcIWKJwg6O1zB9wdulpPqK4V0GJ5tYy5gKx
         F/+YZ0nnZED0I+ErMQPOmGNBF6FHR3quWI2MbUjl2xj8hpIu6XLoDUbn1IcH82zQ4GY6
         PvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a680rZ8UxFSfjPWaIbbDiJ7ffs2v95N8x5hz5VhhuJc=;
        b=UEMUBofsQ+FrAsSMIyb2Pf4csgaaFSXQp1AaoCB1qTmPjsvdgpBQDMB+Ws/urYH0/H
         avTJ4yGxLZz4TiD5LVK9vWWsTBoxnAdoFimUL/eDn64VfjdsVtmGB7ycwFZ6bhCPjDLB
         XQrw1U7pWz2ckYpGh8O704NatENLHhwKy2yjPfWmefYCvC1XKLPQJs5BNKrzJx6nnMh1
         LneMyZqZw3jtcF14rhA/bT5oHBdXoiRNXV4QwxTKqdWTiJ4UUmhx8Rdovu8Typ9Gy7uX
         925JDbz2iK/SrQ0/PCSx94kSG248YtVeVPNtFD3n1d+f3Mt80tlbXtpbQLWiwkOsq6NJ
         cIXw==
X-Gm-Message-State: AOAM531TGeNGoHCUZ62/BcH6VI3aU4Wb6JpeX8ILwY1pZvFlP5A6WvCe
	CxaXCjqcp7Cn5t8nEfuyU11ghA==
X-Google-Smtp-Source: ABdhPJyEYmaNwfXNRJDS0I7KH549XMeGo9eFzucZFhdxX1QsjktVT8E12hyntGfDpzdtgWo86ZP2nQ==
X-Received: by 2002:a05:6512:2626:: with SMTP id bt38mr4712647lfb.181.1628576784615;
        Mon, 09 Aug 2021 23:26:24 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n2sm42195lfl.36.2021.08.09.23.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:26:22 -0700 (PDT)
From: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
	id 9224C1028F5; Tue, 10 Aug 2021 09:26:34 +0300 (+03)
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>
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
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 1/5] mm: Add support for unaccepted memory
Date: Tue, 10 Aug 2021 09:26:22 +0300
Message-Id: <20210810062626.1012-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UEFI Specification version 2.9 introduces concept of memory acceptance:
Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
requiring memory to be accepted before it can be used by the guest.
Accepting happens via a protocol specific for the Virtrual Machine
platform.

Accepting memory is costly and it makes VMM allocate memory for the
accepted guest physical address range. It's better to postpone memory
acceptation until memory is needed. It lowers boot time and reduces
memory overhead.

Support of such memory requires few changes in core-mm code:

  - memblock has to accept memory on allocation;

  - page allocator has to accept memory on the first allocation of the
    page;

Memblock change is trivial.

Page allocator is modified to accept pages on the first allocation.
PageOffline() is used to indicate that the page requires acceptance.
The flag currently used by hotplug and balloon. Such pages are not
available to page allocator.

An architecture has to provide three helpers if it wants to support
unaccepted memory:

 - accept_memory() makes a range of physical addresses accepted.

 - maybe_set_page_offline() marks a page PageOffline() if it requires
   acceptance. Used during boot to put pages on free lists.

 - clear_page_offline() clears makes a page accepted and clears
   PageOffline().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 mm/internal.h   | 14 ++++++++++++++
 mm/memblock.c   |  1 +
 mm/page_alloc.c | 13 ++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 31ff935b2547..d2fc8a17fbe0 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -662,4 +662,18 @@ void vunmap_range_noflush(unsigned long start, unsigned long end);
 int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
+#ifndef CONFIG_UNACCEPTED_MEMORY
+static inline void maybe_set_page_offline(struct page *page, unsigned int order)
+{
+}
+
+static inline void clear_page_offline(struct page *page, unsigned int order)
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
index 28a813d9e955..8c1bf08f2b0b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1370,6 +1370,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
 		 */
 		kmemleak_alloc_phys(found, size, 0, 0);
 
+	accept_memory(found, found + size);
 	return found;
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 856b175c15a4..892347d9a507 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -899,6 +899,9 @@ static inline bool page_is_buddy(struct page *page, struct page *buddy,
 	if (buddy_order(buddy) != order)
 		return false;
 
+	if (PageOffline(buddy) || PageOffline(page))
+		return false;
+
 	/*
 	 * zone check is done late to avoid uselessly calculating
 	 * zone/node ids for pages that could never merge.
@@ -1001,6 +1004,9 @@ static inline void del_page_from_free_list(struct page *page, struct zone *zone,
 	if (page_reported(page))
 		__ClearPageReported(page);
 
+	if (PageOffline(page))
+		clear_page_offline(page, order);
+
 	list_del(&page->lru);
 	__ClearPageBuddy(page);
 	set_page_private(page, 0);
@@ -1165,7 +1171,8 @@ static inline void __free_one_page(struct page *page,
 static inline bool page_expected_state(struct page *page,
 					unsigned long check_flags)
 {
-	if (unlikely(atomic_read(&page->_mapcount) != -1))
+	if (unlikely(atomic_read(&page->_mapcount) != -1) &&
+	    !PageOffline(page))
 		return false;
 
 	if (unlikely((unsigned long)page->mapping |
@@ -1748,6 +1755,8 @@ void __init memblock_free_pages(struct page *page, unsigned long pfn,
 {
 	if (early_page_uninitialised(pfn))
 		return;
+
+	maybe_set_page_offline(page, order);
 	__free_pages_core(page, order);
 }
 
@@ -1839,10 +1848,12 @@ static void __init deferred_free_range(unsigned long pfn,
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
-- 
2.31.1

