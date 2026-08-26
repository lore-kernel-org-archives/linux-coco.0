Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773463D75D3
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735922; cv=none; b=kUmbl+gfjCkMilEsVO0G0Iqa8h/hueMU+i3Syp1Af6n0BIFfpg2d6WTOzQa/A6MdFhlmH6h6vvcxfwcCoNbqCFeXAjpKyJDA2fY3G4zfT/fwAigfBQSEIPj9ZfDGqiPRV4xr07wg/OpKdIxkF36UfQLKdY2YIINMw5V+jw6xVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735922; c=relaxed/simple;
	bh=e4S0ntw6a4F+aKPymVSCxm2tk+SUEZ6S7wIWlorrhEQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B6ciGrqdX72S4QvXJ582BPIWz4g9MZgMe4tMOz6U6FIa+mpGpcEBCh94hcIQkxJJ+EtyDCSrPLceAaKtt9OAy/9OS0vhYAeCvoSW/DhHhnP+DeBF1I7HG2sGckvzYtrclh9drDT5gFstVBfNoj8XhI6uFX/tITXg48Gn3KGjs6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AxON7Pui; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxON7Pui"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1323543a12.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735917; x=1788340717; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wc3a2+OEtllLGwqS/G4AFzAVkgMCaAbj12kGjFWNwhs=;
        b=AxON7PuiUuRh2QGmgCwAGlukPsdTpu73QVydK5hZenTQpiqUE4vNyZl1JjhrRk8yqQ
         WRpx0yFVaEzQjApB1WMXpHY/Go/lFsI8EdKDVvD2NmkoUxGlI8UXJwtNSwLCBauiSFXr
         HsTe4vFSQsKP5081ZPkNnnnTlEwsasyEUsvqVMsXp+XePY2HNpEO+BUTXJIDP9UkZv6B
         Md4spu4x+dzcoB1iwfqmau+Klsl5bmNbmWM5VHOp8vmegXjhwf6VuN+i4ei7d+qEre9E
         ehfWKrByoBKurjIkT7nA1+iSGhUTTDr1uLrVkJdHMyFZnnBldnya7MY/AMyevD8RBGKF
         hZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735917; x=1788340717;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wc3a2+OEtllLGwqS/G4AFzAVkgMCaAbj12kGjFWNwhs=;
        b=IHqJVFMMT/6m6GLD/f3jxgUfQGTIMdXap2hN4I7T5TcRFaQBXPhwHZgt9TN0ZZhyj6
         llZZJSrcemvD8ahPKilWIdDs/kKw7OGOtRIfNZcLp1Nl4x/yBLa4atK7xfJJhQpsjqTx
         PfdqNOE9AqYTYndo+D4InwfVooR+RdzCaqIftdNtRYCc/vySRA1x/xUy1aLCV1hXIE+O
         SEW4fiVqWkqkcrL68yhnGHm1XI51Jt3K3ei208ZuhW0dwToGN05Y8gI97IUhL6WcrdE+
         KaWa9S5HicQqHbPoeM9B9sgHeh0pGpamOhriRmIun28bYNfi714w5P1fA9ok5HHwcIeE
         yc6A==
X-Forwarded-Encrypted: i=1; AHgh+RpUi/3cxaeJqJtXa8pba527VeRECWDdvMS8Dl18rAuN/sllY6k/Pkti2xjO9MbioFJU8ZVa8PFg1JD6@lists.linux.dev
X-Gm-Message-State: AFuF++lkd7+XU6KMT9BHFulLpTcfGkBzQ69M/tAopibmAaP7QMj69X5S
	a22FN0ToRs33LeCkB//kSLewZ5Mrq7e/+GwneWTV8+s/P0uJjl2Rdcdc/qAL9d2YUb93ialDH49
	Zj2yRqtqLZfqh3VcfFuH5sHSW8A==
X-Received: from plbcp5.prod.google.com ([2002:a17:902:e785:b0:2ca:b48c:5a92])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:324f:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d707b45a87mr94906615ad.9.1787735916498;
 Wed, 26 Aug 2026 02:18:36 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:18:15 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=5838;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=GtZbHtkgKKmD1ykIZ1T+aJT4kkhlUaxT1aZ4xCvFTqw=; b=31p44BxawoGJ9r8IPJTTeLYxIv5u9shr6L2B0Osy/+Cr+0UKzzsl7/FoRJOIg3vjXE6Tkm2yX
 UgwpvmnCSctDh5OfgPRHQt5miKkx2TMsXdZLvmxNKBAoutH51xOD2oC
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-17-0a15d8a799aa@google.com>
Subject: [PATCH v11 17/46] mm/gup: factor out LRU cache draining for folio
 into lru_cache_drain_for_folio()
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: "David Hildenbrand (Arm)" <david@kernel.org>

KVM with guest_memfd wants to remove any folio references due to LRU
caches, as it really must only allow to convert folios from shared to
private when there are no unexpected folio references (e.g., from GUP
references).

So, to drive the refcount down, it needs a way to flush the LRU caches.
Let's factor out what we have in lru_cache_drain_for_folio(). Document
it, and also mention that concurrent folio (un)mapping might, in theory,
miss detecting LRU cache references. Keep obtaining the expected refcount
twice to minimize the possibility. For the current and future user that
should work, and we don't really have a better alternative: we could
detect if the mapcount changed, but it would still be racy and add more
complexity with questionable benefit.

Maybe there is a chance to avoid the draining entirely in the future,
by avoiding extra references from the LRU cache: Hugh thinks there might
be a way. But for the time being, this handling is unfortunately
required.

Make folio_may_be_lru_cached() accept a const pointer so
lru_cache_drain_for_folio() can accept a const pointer as well.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/swap.h | 11 ++++++++++-
 mm/gup.c             | 20 +++++++-------------
 mm/swap.c            | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 8f0f68e245baa..e625d64c9e13d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -317,7 +317,7 @@ void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
 void mark_page_accessed(struct page *);
 void folio_mark_accessed(struct folio *);
 
-static inline bool folio_may_be_lru_cached(struct folio *folio)
+static inline bool folio_may_be_lru_cached(const struct folio *folio)
 {
 	/*
 	 * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
@@ -344,6 +344,15 @@ extern void lru_add_drain(void);
 extern void lru_add_drain_cpu(int cpu);
 extern void lru_add_drain_cpu_zone(struct zone *zone);
 extern void lru_add_drain_all(void);
+
+enum lru_cache_drained {
+	LRU_CACHE_NOT_DRAINED,
+	LRU_CACHE_DRAINED,
+	LRU_CACHE_DRAINED_ALL,
+};
+void lru_cache_drain_for_folio(const struct folio *folio,
+		unsigned int extra_refs, enum lru_cache_drained *drained);
+
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
 extern void swap_setup(void);
diff --git a/mm/gup.c b/mm/gup.c
index 0692119b79043..fb0995dc495fc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2266,9 +2266,9 @@ static unsigned long collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
+	enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
 	unsigned long collected = 0;
 	struct folio *folio;
-	int drained = 0;
 	long i = 0;
 
 	for (folio = pofs_get_folio(pofs, i); folio;
@@ -2287,18 +2287,12 @@ static unsigned long collect_longterm_unpinnable_folios(
 			continue;
 		}
 
-		if (drained == 0 && folio_may_be_lru_cached(folio) &&
-				folio_ref_count(folio) !=
-				folio_expected_ref_count(folio) + 1) {
-			lru_add_drain();
-			drained = 1;
-		}
-		if (drained == 1 && folio_may_be_lru_cached(folio) &&
-				folio_ref_count(folio) !=
-				folio_expected_ref_count(folio) + 1) {
-			lru_add_drain_all();
-			drained = 2;
-		}
+		/*
+		 * We drain not only to make the folio_isolate_lru() succeed,
+		 * but also to remove any other folio references from LRU
+		 * caches.
+		 */
+		lru_cache_drain_for_folio(folio, 1, &drained);
 
 		if (!folio_isolate_lru(folio))
 			continue;
diff --git a/mm/swap.c b/mm/swap.c
index 588f50d8f1a8c..8e965c8ce9aa9 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -950,6 +950,52 @@ void lru_add_drain_all(void)
 }
 #endif /* CONFIG_SMP */
 
+/**
+ * lru_cache_drain_for_folio() - drain LRU caches if the caches might hold
+ *				 folio references
+ * @folio: The folio.
+ * @extra_refs: Extra folio references held by the caller.
+ * @drained: Drain status for batch folio processing.
+ *
+ * Drain LRU caches if the caches might hold folio references. Start
+ * with a local LRU cache drain, to then drain LRU caches on all CPUs if
+ * local draining was insufficient.
+ *
+ * This function detects LRU cache references by comparing the folio refcount
+ * with the sum of the expected folio refcount + extra references held by the
+ * caller. Note that we cannot rely on PG_lru to reliably detect all LRU
+ * cache references, and there are rare scenarios (concurrent folio (un)mapping)
+ * where this function might miss detecting LRU cache references.
+ *
+ * If @drained is not NULL, the function will avoid re-draining LRU caches
+ * when processing multiple folios in a row. In that case, the variable
+ * @drained points at must be initialized to LRU_CACHE_NOT_DRAINED before
+ * the first invocation by the caller.
+ */
+void lru_cache_drain_for_folio(const struct folio *folio,
+		unsigned int extra_refs, enum lru_cache_drained *drained)
+{
+	if (!folio_may_be_lru_cached(folio))
+		return;
+
+	if (!drained || *drained == LRU_CACHE_NOT_DRAINED) {
+		if (folio_ref_count(folio) ==
+		    folio_expected_ref_count(folio) + extra_refs)
+			return;
+		lru_add_drain();
+		if (drained)
+			*drained = LRU_CACHE_DRAINED;
+	}
+	if (!drained || *drained == LRU_CACHE_DRAINED) {
+		if (folio_ref_count(folio) ==
+		    folio_expected_ref_count(folio) + extra_refs)
+			return;
+		lru_add_drain_all();
+		if (drained)
+			*drained = LRU_CACHE_DRAINED_ALL;
+	}
+}
+
 atomic_t lru_disable_count = ATOMIC_INIT(0);
 
 /*

-- 
2.55.0.887.g758fc8c411-goog

