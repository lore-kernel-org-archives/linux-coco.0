Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392622330F
	for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741595346; cv=none; b=O80Wmh+UYYN5UyxvV6VqCZaWiECRlPi1Xosj+Mn91R8zqDVH6+RRmXWPCtLtUAgsY0yhHfoZa8SqYchNIaaTHMtxLzZjaHbn6g3hoY1TubRntX4AunxvHst0kj2hrclYCBKFu5zbAyiID583PVMNac+ooTroya5Cn/L80agWzLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741595346; c=relaxed/simple;
	bh=bdmthZTfeFQ5jVmiLX6ZsJvK3Q9ebBnX6m48VBCKrFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nyOdNkCw8UJcVgIJe/xRuxYskxZelFAcWL16zbcaYjmW0/irh+LNUTuxVEE5HoFyXn4cUXq8ZfNzdlYFWl2LoN7vabxkQsyxw2W/qoH9nLlLMlNYDNdksJpv8LpzI4eRX7fkbIo6NrGvvRhY2ZKvO6B9ES6LdMju/XmUBfzLTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyNlS6rC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyNlS6rC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741595345; x=1773131345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bdmthZTfeFQ5jVmiLX6ZsJvK3Q9ebBnX6m48VBCKrFE=;
  b=nyNlS6rCVzkdQHkyFk18dHrpAvNgRdhhZ6hwZ5h56IrfjL+ekgiC9usj
   pdjZjMiK5oxaPtrWr0uti2Nqu1l/ZbkvY0YXB8zlSAX0Upqyep62Qag69
   JdPCtyUXmyvdrhZdcJj0QDryc0qNA/23JVVUbc7VI4RQNfGZYVnjBXqr1
   6ag/ylxtmcM/ANFBplAUcLQ6IruM+xvrgFlS/ZFNafCPc1ny9EakDLGre
   PMaew8VCt4sExc1rc0IaHMmJhYOLTjgHCP+ZNszTjVJUOkYDhzRDSMMfi
   3EG0IGjJOXj5a24D05Uy9XXzO/D8Dvr1Qr1weLUm3YTk73ytW3IihYRED
   Q==;
X-CSE-ConnectionGUID: OCRU/ydtRM2/M0wpfmFw7w==
X-CSE-MsgGUID: 9yosu7WBRi6QRhUcFO3gRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46489282"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46489282"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:29:04 -0700
X-CSE-ConnectionGUID: SfFdmbs1Q92ASSjkAL0xCg==
X-CSE-MsgGUID: Y8iTlEFQQdORZ01VPc53Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120820004"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2025 01:29:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 04CFE23F; Mon, 10 Mar 2025 10:28:59 +0200 (EET)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Farrah Chen <farrah.chen@intel.com>
Subject: [PATCH] mm/page_alloc: Fix memory accept before watermarks gets initialized
Date: Mon, 10 Mar 2025 10:28:55 +0200
Message-ID: <20250310082855.2587122-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Watermarks are initialized during the postcore initcall. Until then, all
watermarks are set to zero. This causes cond_accept_memory() to
incorrectly skip memory acceptance because a watermark of 0 is always
met.

To ensure progress, accept one MAX_ORDER page if the watermark is zero.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-and-tested-by: Farrah Chen <farrah.chen@intel.com>
---
 mm/page_alloc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 579789600a3c..4fe93029bcb6 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7004,7 +7004,7 @@ static inline bool has_unaccepted_memory(void)
 
 static bool cond_accept_memory(struct zone *zone, unsigned int order)
 {
-	long to_accept;
+	long to_accept, wmark;
 	bool ret = false;
 
 	if (!has_unaccepted_memory())
@@ -7013,8 +7013,18 @@ static bool cond_accept_memory(struct zone *zone, unsigned int order)
 	if (list_empty(&zone->unaccepted_pages))
 		return false;
 
+	wmark = promo_wmark_pages(zone);
+
+	/*
+	 * Watermarks have not been initialized yet.
+	 *
+	 * Accepting one MAX_ORDER page to ensure progress.
+	 */
+	if (!wmark)
+		return try_to_accept_memory_one(zone);
+
 	/* How much to accept to get to promo watermark? */
-	to_accept = promo_wmark_pages(zone) -
+	to_accept = wmark -
 		    (zone_page_state(zone, NR_FREE_PAGES) -
 		    __zone_watermark_unusable_free(zone, order, 0) -
 		    zone_page_state(zone, NR_UNACCEPTED));
-- 
2.47.2

