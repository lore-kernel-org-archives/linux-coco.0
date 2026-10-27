Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069815;
	b=VB6spbP72PLis3Mn6s4ZjypHALhiqbA8g+Uthdi2lCLhVxAHHKhhhlrzLLDwtFQe8/ZM
	 HOlwshX6RNcmuhFy4f9Y1WkiDBMKQQWcQ5Wqn76IXtiug2tuZitlGrDUjxC6y5RRwzpvV
	 L1sR3WrP/GSH1ewcOb3P6R44Dq6e/4ioSPw/VoL5NyaB5XxJYdaY6z+SXPxupXKZocJ6/
	 VzAQvntYXBcOxTyt3N8fpioBCPsfGIEnQUYvukL7tq/6U+yIZq7ZJkm8Uj89lhiXkVpdE
	 ITy9btXltI8cCONZVzSiWWsSDXODUQJdiol0EskW8SRRJhYxMOAvoPewR4lbjneZoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LCdG6rFn11zBCazpVzMCvIt14BjXcoxSwJ2DZpHTKik=;
	b=r+1avFDBAsIoV9e6COEAD1pazTuXYvGYl5qCWFaRuzrRmD/Rd7yMlvzZ6KI9+enr7/H4
	 quZeyuYLpH7n958VeZssreXg3CFaea0kGGxaRZg5O5e+T5EEXmuK5NoAdhL7ofsIujbVD
	 7++tsZjeKD0DJg2tA13NkbGqzf1iakxfjOxwZD9BdTqGeMa2XeegAgHjEqsNAyqhiV04Q
	 yaJKVuNo8EU18PQV0AnoR1u+XyXK9QRAUgwb4oQhpN5JRG7BOP9H1pkgeEVjL8RtqTlT2
	 b3BQTPg3jhVSzV5xm/PEjHbeTefSceI4+0QKBiNY1TAdR3WdG1X6hTmE6Mp+pvOc8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vtKsx6RM;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A33606A334
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A33606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vtKsx6RM
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46dade0d7cdso3522067fac.1
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069814; x=1793674614; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCdG6rFn11zBCazpVzMCvIt14BjXcoxSwJ2DZpHTKik=;
        b=vtKsx6RMnhJEYXAcL+jq1dKsksMTSnSRYIQwBw0GGZpfozsX/rPR8goIZD4ZKOfVIB
         j/+FbtVe/nfY4VWbIEOxd5b/wS+Uec2MgqOkNr4y+nfZn2GttFA+oWoke8SF6/JuxnpD
         16M2glMHmT3Hz9JzLzLUqzEXNwJ8TgHh0FyXlNv7Av+QysEc/N+EVTZQwLKHPMMq9V+7
         pdZp2P1qqKzus3b28BgqnBKbEJTAf5Cu23HsWwVBhrPXS2DcPrxwFxGr7mVu6JQ3MCee
         /Jdiz90ZAOWFmnypFQlyOfwrYh/XhwnUdhtPBPlM47Ozf0TWJDvF1sw5giwygrx+DQgA
         pVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069814; x=1793674614;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCdG6rFn11zBCazpVzMCvIt14BjXcoxSwJ2DZpHTKik=;
        b=gSdyZFMVNZR7CyT5xijoI2XMhKYdWo7mxKIIidJG9v09yNpxVGbXMo/T2T2Wx/EHU0
         d1sKFnhW1AtIC8+m0hzRhTlqRQuKKdVl+zLavTd/ckHvAnXotY4l7z74mlBZl54Hu8B/
         9H/YVT9Vm+IbWkrPG9572VvdVelP5rvR3dDU2Z3qk0cJKVUCMmR6FbJkKyNsr8WMYi2Q
         +HSwXAmib5cNTGMdfY496bsdgTOMhA3oJW4Hhx7fIgrGyK/slGxrmdTMRYfzz+H4Rs/m
         AtlFhmtqzMfdYltEw8K7dOPU7EPBrqwOvREgQbLVvCokpawxXrVRoK1XqqKb/JUv94bM
         Vniw==
X-Forwarded-Encrypted: i=1; AKwUvBzQu1532kWxO+LD2jD1cpsoRpgsiiktvI6uz+s4K8ZHt/7j5pDFor3zCSthsMfE0hANUPTIcxSJtcUm@lists.linux.dev
X-Gm-Message-State: AFq9FYJPBLQsR6Oju6+B0wcOx1mNOUWjWmyojK3rF96fuvhYRMTYXKCN
	QfBL15Ou1VBPdUiWy6mLjOZrTH4mB10sHCOgk/kG7dz3OEha6yaDyjkrJa4vpcJ+FVKJKzhPVwZ
	Xu2piDPrC2xr64nZUh8Dvu4mYkPZNZZjkZw==
X-Received: from iohd14-n1.prod.google.com ([2002:a05:6602:86ce:10b0:9c4:b80b:7605])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1b2b:b0:4f4:73a9:f853 with SMTP id 5614622812f47-55bfff91bbdmr5294339b6e.1.1793069813464;
 Mon, 26 Oct 2026 19:56:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:11 +0000
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-9-kevinloughlin@google.com>
Subject: [PATCH 08/13] mm/page_alloc: route unaccepted isolated pages
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

When free page reporting unaccepts isolated pages on confidential
computing guests, __putback_isolated_page() must not return those
unaccepted pages directly to zone->free_area; doing so would violate the
allocator invariant that all pages on zone->free_area are accepted.

Update __putback_isolated_page(), __free_pages_ok(),
__free_frozen_pages(), and free_unref_folios() to route dynamically
unaccepted pages to zone->unaccepted_pages via __free_unaccepted_locked()
(falling back to immediate acceptance for isolated or CMA pageblocks).

In addition:
- Extract free_pages_prepare_init() so post-acceptance poisoning,
  zeroing, KASAN tagging, arch_free_page(), and debug_pagealloc
  unmapping run after accept_memory() without touching unaccepted pages
  in __free_pages_prepare() or re-running metadata teardown in
  __accept_page().
- Pass FPI_SKIP_REPORT_NOTIFY when __accept_page() frees a freshly
  accepted block into the buddy allocator so it is not immediately
  re-queued for free page reporting before allocation.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 mm/page_alloc.c | 120 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 85 insertions(+), 35 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 46ae8c6f3814..c10b77304633 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1298,12 +1298,53 @@ static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
+static inline bool should_free_unaccepted(struct page *page,
+					  unsigned int order,
+					  fpi_t fpi_flags)
+{
+	return !(fpi_flags & FPI_NOLOCK) &&
+	       page_contains_unaccepted(page, order);
+}
+
+static void free_pages_prepare_init(struct page *page, unsigned int order)
+{
+	bool skip_kasan_poison = should_skip_kasan_poison(page);
+	bool init = want_init_on_free();
+
+	kernel_poison_pages(page, 1 << order);
+
+	/*
+	 * As memory initialization might be integrated into KASAN,
+	 * KASAN poisoning and memory initialization code must be
+	 * kept together to avoid discrepancies in behavior.
+	 *
+	 * With hardware tag-based KASAN, memory tags must be set before the
+	 * page becomes unavailable via debug_pagealloc or arch_free_page.
+	 */
+	if (!skip_kasan_poison) {
+		kasan_poison_pages(page, order, init);
+
+		/* Memory is already initialized if KASAN did it internally. */
+		if (kasan_has_integrated_init())
+			init = false;
+	}
+	if (init)
+		clear_highpages_kasan_tagged(page, 1 << order);
+
+	/*
+	 * arch_free_page() can make the page's contents inaccessible.  s390
+	 * does this.  So nothing which can access the page's contents should
+	 * happen after this.
+	 */
+	arch_free_page(page, order);
+
+	debug_pagealloc_unmap_pages(page, 1 << order);
+}
+
 static __always_inline bool __free_pages_prepare(struct page *page,
 		unsigned int order, fpi_t fpi_flags)
 {
 	int bad = 0;
-	bool skip_kasan_poison = should_skip_kasan_poison(page);
-	bool init = want_init_on_free();
 	bool compound = PageCompound(page);
 	struct folio *folio = page_folio(page);
 
@@ -1411,34 +1452,10 @@ static __always_inline bool __free_pages_prepare(struct page *page,
 					   PAGE_SIZE << order);
 	}
 
-	kernel_poison_pages(page, 1 << order);
-
-	/*
-	 * As memory initialization might be integrated into KASAN,
-	 * KASAN poisoning and memory initialization code must be
-	 * kept together to avoid discrepancies in behavior.
-	 *
-	 * With hardware tag-based KASAN, memory tags must be set before the
-	 * page becomes unavailable via debug_pagealloc or arch_free_page.
-	 */
-	if (!skip_kasan_poison) {
-		kasan_poison_pages(page, order, init);
-
-		/* Memory is already initialized if KASAN did it internally. */
-		if (kasan_has_integrated_init())
-			init = false;
-	}
-	if (init)
-		clear_highpages_kasan_tagged(page, 1 << order);
-
-	/*
-	 * arch_free_page() can make the page's contents inaccessible.  s390
-	 * does this.  So nothing which can access the page's contents should
-	 * happen after this.
-	 */
-	arch_free_page(page, order);
+	if (should_free_unaccepted(page, order, fpi_flags))
+		return true;
 
-	debug_pagealloc_unmap_pages(page, 1 << order);
+	free_pages_prepare_init(page, order);
 
 	return true;
 }
@@ -1572,14 +1589,31 @@ static void free_one_page(struct zone *zone, struct page *page,
 	__count_vm_events(PGFREE, 1 << order);
 }
 
+static bool handle_unaccepted_free(struct page *page, unsigned int order,
+				   fpi_t fpi_flags)
+{
+	if (!should_free_unaccepted(page, order, fpi_flags))
+		return false;
+
+	if (__free_unaccepted(page, order))
+		return true;
+
+	accept_memory(page_to_phys(page), PAGE_SIZE << order);
+	free_pages_prepare_init(page, order);
+	return false;
+}
+
 static void __free_pages_ok(struct page *page, unsigned int order,
 			    fpi_t fpi_flags)
 {
 	unsigned long pfn = page_to_pfn(page);
 	struct zone *zone = page_zone(page);
 
-	if (__free_pages_prepare(page, order, fpi_flags))
+	if (__free_pages_prepare(page, order, fpi_flags)) {
+		if (handle_unaccepted_free(page, order, fpi_flags))
+			return;
 		free_one_page(zone, page, pfn, order, fpi_flags);
+	}
 }
 
 void __meminit __free_pages_core(struct page *page, unsigned int order,
@@ -2955,7 +2989,8 @@ static void __free_frozen_pages(struct page *page, unsigned int order,
 	unsigned long pfn = page_to_pfn(page);
 	int migratetype;
 
-	if (!pcp_allowed_order(order)) {
+	if (!pcp_allowed_order(order) ||
+	    should_free_unaccepted(page, order, fpi_flags)) {
 		__free_pages_ok(page, order, fpi_flags);
 		return;
 	}
@@ -3024,9 +3059,13 @@ void free_unref_folios(struct folio_batch *folios)
 			continue;
 		/*
 		 * Free orders not handled on the PCP directly to the
-		 * allocator.
+		 * allocator, as well as any pages containing unaccepted memory.
 		 */
-		if (!pcp_allowed_order(order)) {
+		if (!pcp_allowed_order(order) ||
+		    should_free_unaccepted(&folio->page, order, FPI_NONE)) {
+			if (handle_unaccepted_free(&folio->page, order,
+						   FPI_NONE))
+				continue;
 			free_one_page(folio_zone(folio), &folio->page,
 				      pfn, order, FPI_NONE);
 			continue;
@@ -3187,6 +3226,16 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
 	/* zone lock should be held when this function is called */
 	lockdep_assert_held(&zone->lock);
 
+	if (page_contains_unaccepted(page, order)) {
+		if (__free_unaccepted_locked(page, zone, order))
+			return;
+		accept_memory(page_to_phys(page), PAGE_SIZE << order);
+		free_pages_prepare_init(page, order);
+		split_large_buddy(zone, page, page_to_pfn(page), order,
+				  FPI_SKIP_REPORT_NOTIFY | FPI_TO_TAIL);
+		return;
+	}
+
 	/* Return isolated page to tail of freelist. */
 	__free_one_page(page, page_to_pfn(page), zone, order, mt,
 			FPI_SKIP_REPORT_NOTIFY | FPI_TO_TAIL);
@@ -7933,8 +7982,9 @@ static void __accept_page(struct zone *zone, unsigned long *flags,
 	spin_unlock_irqrestore(&zone->lock, *flags);
 
 	accept_memory(page_to_phys(page), PAGE_SIZE << order);
-
-	__free_pages_ok(page, order, FPI_TO_TAIL);
+	free_pages_prepare_init(page, order);
+	free_one_page(zone, page, page_to_pfn(page), order,
+		      FPI_TO_TAIL | FPI_SKIP_REPORT_NOTIFY);
 }
 
 void accept_page(struct page *page)
-- 
2.56.0.307.g5fe7bd680c-goog

