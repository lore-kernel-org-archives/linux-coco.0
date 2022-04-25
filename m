Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51120ED
	for <linux-coco@lists.linux.dev>; Mon, 25 Apr 2022 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650857992; x=1682393992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hPx0r3OWxS+lz/D+l0BiGQBbeJJHb52sFjAF/68dVQ=;
  b=S0OtYdwYqLqLFt1HNOFgkaPLkOPQ4EgvNaQTGYTkLOxTbucySfU82zJF
   Zc42wbt2joDH3xrI2gaQDF8ltYOlJZvLj4RjtnAtSTYn1e1QhKicIVw80
   CFoutThKy9w2TRl1ldcJ6hxkRsDguIT6njoxLMpPfWpe0ElukIfOEabnO
   xmRXK+mCdmlhrg3tJjpvdi2qak4MOuJx9zWG7MCCp1cAgIuVO/GK+nyQx
   AnTfuI2j9Kvcsx+NrTglRq6tLuy+CovDa1dM1IqbSf+4ppJXGc4ZlhNGR
   /pDLsY+zRnHNlU3lGQlU+uN8CnIy2Wr6N1lxXdeWjRslsF64kmWfUuJBc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="325612419"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="325612419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 20:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="649514099"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2022 20:39:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 1D2DC739; Mon, 25 Apr 2022 06:39:36 +0300 (EEST)
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
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv5 11/12] mm/vmstat: Add counter for memory accepting
Date: Mon, 25 Apr 2022 06:39:33 +0300
Message-Id: <20220425033934.68551-12-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The counter increased every time kernel accepts a memory region.

The counter allows to see if memory acceptation is still ongoing and
contributes to memory allocation latency.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/mm/unaccepted_memory.c | 1 +
 include/linux/vm_event_item.h   | 3 +++
 mm/vmstat.c                     | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
index de0790af1824..65cd49b93c50 100644
--- a/arch/x86/mm/unaccepted_memory.c
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -38,6 +38,7 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
 		}
 
 		bitmap_clear(unaccepted_memory, range_start, len);
+		count_vm_events(ACCEPT_MEMORY, len * PMD_SIZE / PAGE_SIZE);
 	}
 	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
 }
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 16a0a4fd000b..6a468164a2f9 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -136,6 +136,9 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #ifdef CONFIG_X86
 		DIRECT_MAP_LEVEL2_SPLIT,
 		DIRECT_MAP_LEVEL3_SPLIT,
+#endif
+#ifdef CONFIG_UNACCEPTED_MEMORY
+		ACCEPT_MEMORY,
 #endif
 		NR_VM_EVENT_ITEMS
 };
diff --git a/mm/vmstat.c b/mm/vmstat.c
index b75b1a64b54c..4c9197f32406 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1397,6 +1397,9 @@ const char * const vmstat_text[] = {
 	"direct_map_level2_splits",
 	"direct_map_level3_splits",
 #endif
+#ifdef CONFIG_UNACCEPTED_MEMORY
+	"accept_memory",
+#endif
 #endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
 };
 #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */
-- 
2.35.1

