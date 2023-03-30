Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8C1FB8
	for <linux-coco@lists.linux.dev>; Thu, 30 Mar 2023 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177030; x=1711713030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j9rCoZtseVkMxXJK20bhOG6vjoCUVN6BwYUe9lsjGyo=;
  b=iJs/yYmO9lsp9N825N6p2tluy+XAEflRIkBaJrjz69Xny39bzvYQFL60
   tjnJHx6jJturX2m3tyBb7RtccJrUlEmZjGK2tp9ZLTfg9mC0Ug1pWlnwX
   PbGbK3PPkS1mJT5JXID42t9GInkWhMiBgg+fK19p2Z/7Dwmw/2BECiiLT
   WBd0bt0s9RVKve4bXhMOpj/8ezITnGEwIIQULPJKfA2AdEbKsiafeTkoQ
   8kXQY2WWAf+5gEEbIyxa22dXlrP+AWG5bSbhgXP6gAXOu6Kcsepb0yDpP
   lwv8YABgpdYQAJ6RyIwypAILhGlcOpvbACjHV3+5h5+LUBLOxHJDrbfkV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342756718"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="342756718"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634856482"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="634856482"
Received: from ngreburx-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.209.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:50:02 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 0612B10438E; Thu, 30 Mar 2023 14:50:00 +0300 (+03)
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
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	aarcange@redhat.com,
	peterx@redhat.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv9 03/14] mm/page_alloc: Fake unaccepted memory
Date: Thu, 30 Mar 2023 14:49:45 +0300
Message-Id: <20230330114956.20342-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330114956.20342-1-kirill.shutemov@linux.intel.com>
References: <20230330114956.20342-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing purposes, it is useful to fake unaccepted memory in the
system. It helps to understand unaccepted memory overhead to the page
allocator.

The patch allows to treat memory above the specified physical memory
address as unaccepted.

The change only fakes unaccepted memory for page allocator. Memblock is
not affected.

It also assumes that arch-provided accept_memory() on already accepted
memory is a nop.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 mm/page_alloc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d62fcb2f28bd..509a93b7e5af 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7213,6 +7213,8 @@ static DEFINE_STATIC_KEY_FALSE(zones_with_unaccepted_pages);
 
 static bool lazy_accept = true;
 
+static unsigned long fake_unaccepted_start = -1UL;
+
 static int __init accept_memory_parse(char *p)
 {
 	if (!strcmp(p, "lazy")) {
@@ -7227,11 +7229,30 @@ static int __init accept_memory_parse(char *p)
 }
 early_param("accept_memory", accept_memory_parse);
 
+static int __init fake_unaccepted_start_parse(char *p)
+{
+	if (!p)
+		return -EINVAL;
+
+	fake_unaccepted_start = memparse(p, &p);
+
+	if (*p != '\0') {
+		fake_unaccepted_start = -1UL;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+early_param("fake_unaccepted_start", fake_unaccepted_start_parse);
+
 static bool page_contains_unaccepted(struct page *page, unsigned int order)
 {
 	phys_addr_t start = page_to_phys(page);
 	phys_addr_t end = start + (PAGE_SIZE << order);
 
+	if (start >= fake_unaccepted_start)
+		return true;
+
 	return range_contains_unaccepted_memory(start, end);
 }
 
-- 
2.39.2

