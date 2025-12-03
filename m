Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31812798EA
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743421; cv=none; b=FabkjdUvlq7QIyzEt7bnarXCAsWvIzR4azQY7JIidNlseBYSvA2LnmpYeztoOLsPZGaM+/pITp6i1wF5+ZqCa/J85mGxqt+EtHn+g3xwSiZx70WvStHmyu0ubJqmK6bafH6ZV4OQnQPK+t7VynXDZG0kLwwwxZ1L2aCh1cXpP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743421; c=relaxed/simple;
	bh=ZmaIspEXMwBdXfjv08IdBm71D9jsdKqj9x2IAnZtq5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KH1j5DVdlNfxjSVACO87jIVhrD3T2swnBma9zL0YPnEkyN5Fk9zRJzn746Ddvgk+NiaOYP5pkY14VchAzpQeq0QKzlgLhdQgNCg6g52gdb7ySLEHaS0d33yoWHmpcbn+05oPxBY8BQqZNuAtQm09WJFoLx2IRYO2d2QNEFqkL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AfFqbuak; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AfFqbuak"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88043139c35so58082286d6.0
        for <linux-coco@lists.linux.dev>; Tue, 02 Dec 2025 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764743417; x=1765348217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zA8y4i15lHs4OWfRLesRXJafbhw/AjPpbVqRC57AGyo=;
        b=AfFqbuakdHKyaxtUnIp4ran7Y+MdqdGENzBJJ+EI9h9mALgyiFew4EpyyqLlipWKFQ
         GdmZjtl5gkVGyr/HwRGuyAtflYeHgFPaAX/IZaa7G2dlQCyso4OMzbRIPIiLj0ltzNqn
         toNpZGfuVmZHaQor+eW+8727kluEWqnoZ+PUxsounxadL8P3O9dgwSaLjf/kDewbjxXA
         VcbI6wqR6glD884LnR+QoA1nBFotl0M8vW8OGFj+oYLAszRHlugh2dtkiKUAdsCz+uOP
         qEZW6XJHG857HB2j5z5dnols9Bi1JlfnxwRe+WvKJekW/LJUC8loI7paTyFUWZs7pDoI
         WOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764743417; x=1765348217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA8y4i15lHs4OWfRLesRXJafbhw/AjPpbVqRC57AGyo=;
        b=hb7UZP9iIxPlXv1P+zeSeu439+FhGoGcV0pGzmIaIy8OI47dOd7aiuqz8EQjP9pncZ
         Q7P3VMAYjnwTDMHpfKIZSq244Gtxcbj/ddCEYoJkvWfixunM2adh2S23QyPYe4YMamhz
         rATkVPq2TS1AyVfLOJsrPIIy3R+nPYuvM8XSXPxd/fDDUddyEPHXD0FnX+vzPBsU4Z7m
         9IOBelY1afY6+FYlyhg50qP5Vpro6L6G/AOg5ZWF1zrrUsJTbaByPJdudnQ6bhAO3qV0
         nq3bvVGTJFUDlql7nA8JB8AvmeVSzrnf3G2rZKkRS9lj3Mnevu/AmXHY7E9YnPLf20vA
         hs1w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+dtbDOnfQRr6q9uuHro9Ftu6oF1KYezx71/0npmj+vWTZ+Zm2niXZ+MFLvvEm+HIyfgzOHRhCIS0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz82G2VGPW2/W+o5/G9ptBoY/8b+LSMDZArZgqTENY6caS9xD0t
	jOSfeXxOwHrlQjz1/Dw7BU5C50uyZ2JzUgjiaDCk95nhpuh2w6jTw3pTs1tiByMf+P8=
X-Gm-Gg: ASbGncvVkWO0LGw2FAe4IFJRV0jeFIW8l38ElY+zQkyQxTpKBcrIT1b59amV6q7gJ2i
	Yhnni+7P8AbblwJm8YGxyOs8FH4v5+luitbuqi2ZzswqSg1OH8+kTK8a3ol8fKPWn6nR0vncp9a
	VJIQ1M+2G/U0MvR7bOqG0Jh5+dQlzjWVoD5SSUtWRVnd1T4dJQGiS2H3TfVdr7N8ilQwLEY4Ju0
	Ue23vl4+3SbPQ1DTYY82AlhGNQXvCexla5tszqujsX+IOeGn+QFvPQpENM1Ht0pbgzhwDkXjpun
	CV9IFYdZ5W5Fbua5HTgEGmpsbyTGNNcBW9nycMZY123EzglCo9Cn7yemJvhm6UeK3QOjrXBuyUC
	XmPqNr3OyH3IHZVPycOVTcfw9JHaHboREGTMqwi+S+Mx9sMFYqwa4uRctgrpw7Td0mvHoFTeTLZ
	GIsU83/mho/fF4q8liImH76MLqjiUwEFNq0o8CAN51TVQVxot/rJboa8K26DdTyh5OPwDtPkzqO
	yNqS29FpJ7iOw==
X-Google-Smtp-Source: AGHT+IF1GdXPSabAZHw0YMxptT9SRN1HvIpeNLe4gzMuYc6tHsW25MPHAsf8Dnnhll6yIyHsxXJH7w==
X-Received: by 2002:a05:6214:d0c:b0:880:5867:45b4 with SMTP id 6a1803df08f44-8881949a8b6mr16086076d6.13.1764743417043;
        Tue, 02 Dec 2025 22:30:17 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524e4b15sm119791806d6.15.2025.12.02.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 22:30:16 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	vbabka@suse.cz,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@redhat.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: [PATCH v4] page_alloc: allow migration of smaller hugepages during contig_alloc
Date: Wed,  3 Dec 2025 01:30:04 -0500
Message-ID: <20251203063004.185182-1-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We presently skip regions with hugepages entirely when trying to do
contiguous page allocation.  This will cause otherwise-movable
2MB HugeTLB pages to be considered unmovable, and will make 1GB
hugepages more difficult to allocate on systems utilizing both.

Instead, if hugepage migration is enabled, consider regions with
hugepages smaller than the target contiguous allocation request
as valid targets for allocation.

isolate_migrate_pages_block() has similar logic, and the hugetlb code
does a migratable check in folio_isolate_hugetlb() during isolation.
So the code servicing the subsequent allocaiton and migration already
supports this exact use case (it's just unreachable).

To test, allocate a bunch of 2MB HugeTLB pages (in this case 48GB)
and then attempt to allocate some 1G HugeTLB pages (in this case 4GB)
(Scale to your machine's memory capacity).

echo 24576 > .../hugepages-2048kB/nr_hugepages
echo 4 > .../hugepages-1048576kB/nr_hugepages

Prior to this patch, the 1GB page allocation can fail if no contiguous
1GB pages remain.  After this patch, the kernel will try to move 2MB
pages and successfully allocate the 1GB pages (assuming overall
sufficient memory is available).

folio_alloc_gigantic() is the primary user of alloc_contig_pages(),
other users are debug or init-time allocations and largely unaffected.
- ppc/memtrace is a debugfs interface
- x86/tdx memory allocation occurs once on module-init
- kfence/core happens once on module (late) init
- THP uses it in debug_vm_pgtable_alloc_huge_page at __init time

Suggested-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/linux-mm/6fe3562d-49b2-4975-aa86-e139c535ad00@redhat.com/
Signed-off-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Rientjes <rientjes@google.com>
Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 95d8b812efd0..8ca3273f734a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7069,8 +7069,27 @@ static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
 		if (PageReserved(page))
 			return false;
 
-		if (PageHuge(page))
-			return false;
+		/*
+		 * Only consider ranges containing hugepages if those pages are
+		 * smaller than the requested contiguous region.  e.g.:
+		 *     Move 2MB pages to free up a 1GB range.
+		 *     Don't move 1GB pages to free up a 2MB range.
+		 *
+		 * This makes contiguous allocation more reliable if multiple
+		 * hugepage sizes are used without causing needless movement.
+		 */
+		if (PageHuge(page)) {
+			unsigned int order;
+
+			if (!IS_ENABLED(CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION))
+				return false;
+
+			page = compound_head(page);
+			order = compound_order(page);
+			if ((order >= MAX_FOLIO_ORDER) ||
+			    (nr_pages <= (1 << order)))
+				return false;
+		}
 	}
 	return true;
 }
-- 
2.52.0

