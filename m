Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B030F95
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Muq8TlR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697473903; x=1729009903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KArkgIRLDhwmtFvU9fISOShueMaeloHHrxiJqwNwLLU=;
  b=Muq8TlR20U79Xln/YzeIWFM+r6Q7tdT//4qOROk98pEsCYWrq3Ixcx6v
   DoM4tnzM1pp6+nyl2PKbiJJHW7HA0kVJVep9yFHIKN+iVW/gyYNp9icnI
   41Wd5Ack9fS4Bgx87TvbErJ0PTV0h6wf13E9ixSwIWdQ3CZIsLv8dUDsq
   hGyE47P4EF+9kPyz8W7Y+9gjsByX/oWgCeFYPTc1KvhfesPIMh0vJ3U+7
   edyK06zd6CwmxwPLWx2vdVk8BRd1T3zLfrd7MOXqplp+HyQumeSW8l3Xq
   9LgUavROyIC8etdkE4lF6W6+CLtXH5sFczUj4cbxuof/NRmk+PBuLhw9O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449785306"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="449785306"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872177333"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="872177333"
Received: from ranaelna-mobl.amr.corp.intel.com (HELO box.shutemov.name) ([10.251.208.247])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:31:29 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 21C6A10A1F3; Mon, 16 Oct 2023 19:31:27 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
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
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	philip.cox@canonical.com,
	aarcange@redhat.com,
	peterx@redhat.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	stable@kernel.org,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel memory acceptance
Date: Mon, 16 Oct 2023 19:31:22 +0300
Message-ID: <20231016163122.12855-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Michael reported soft lockups on a system that has unaccepted memory.
This occurs when a user attempts to allocate and accept memory on
multiple CPUs simultaneously.

The root cause of the issue is that memory acceptance is serialized with
a spinlock, allowing only one CPU to accept memory at a time. The other
CPUs spin and wait for their turn, leading to starvation and soft lockup
reports.

To address this, the code has been modified to release the spinlock
while accepting memory. This allows for parallel memory acceptance on
multiple CPUs.

A newly introduced "accepting_list" keeps track of which memory is
currently being accepted. This is necessary to prevent parallel
acceptance of the same memory block. If a collision occurs, the lock is
released and the process is retried.

Such collisions should rarely occur. The main path for memory acceptance
is the page allocator, which accepts memory in MAX_ORDER chunks. As long
as MAX_ORDER is equal to or larger than the unit_size, collisions will
never occur because the caller fully owns the memory block being
accepted.

Aside from the page allocator, only memblock and deferered_free_range()
accept memory, but this only happens during boot.

The code has been tested with unit_size == 128MiB to trigger collisions
and validate the retry codepath.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Michael Roth <michael.roth@amd.com
Fixes: 2053bc57f367 ("efi: Add unaccepted memory support")
Cc: <stable@kernel.org>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
---

  v2:
   - Fix deadlock (Vlastimil);
   - Fix comments (Vlastimil);
   - s/cond_resched()/cpu_relax()/ -- cond_resched() cannot be called
     from atomic context;

---
 drivers/firmware/efi/unaccepted_memory.c | 71 ++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
index 853f7dc3c21d..fa3363889224 100644
--- a/drivers/firmware/efi/unaccepted_memory.c
+++ b/drivers/firmware/efi/unaccepted_memory.c
@@ -5,9 +5,17 @@
 #include <linux/spinlock.h>
 #include <asm/unaccepted_memory.h>
 
-/* Protects unaccepted memory bitmap */
+/* Protects unaccepted memory bitmap and accepting_list */
 static DEFINE_SPINLOCK(unaccepted_memory_lock);
 
+struct accept_range {
+	struct list_head list;
+	unsigned long start;
+	unsigned long end;
+};
+
+static LIST_HEAD(accepting_list);
+
 /*
  * accept_memory() -- Consult bitmap and accept the memory if needed.
  *
@@ -24,6 +32,7 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
 {
 	struct efi_unaccepted_memory *unaccepted;
 	unsigned long range_start, range_end;
+	struct accept_range range, *entry;
 	unsigned long flags;
 	u64 unit_size;
 
@@ -78,20 +87,74 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
 	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
 		end = unaccepted->size * unit_size * BITS_PER_BYTE;
 
-	range_start = start / unit_size;
-
+	range.start = start / unit_size;
+	range.end = DIV_ROUND_UP(end, unit_size);
+retry:
 	spin_lock_irqsave(&unaccepted_memory_lock, flags);
+
+	/*
+	 * Check if anybody works on accepting the same range of the memory.
+	 *
+	 * The check is done with unit_size granularity. It is crucial to catch
+	 * all accept requests to the same unit_size block, even if they don't
+	 * overlap on physical address level.
+	 */
+	list_for_each_entry(entry, &accepting_list, list) {
+		if (entry->end < range.start)
+			continue;
+		if (entry->start >= range.end)
+			continue;
+
+		/*
+		 * Somebody else accepting the range. Or at least part of it.
+		 *
+		 * Drop the lock and retry until it is complete.
+		 */
+		spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
+
+		/*
+		 * The code is reachable from atomic context.
+		 * cond_resched() cannot be used.
+		 */
+		cpu_relax();
+
+		goto retry;
+	}
+
+	/*
+	 * Register that the range is about to be accepted.
+	 * Make sure nobody else will accept it.
+	 */
+	list_add(&range.list, &accepting_list);
+
+	range_start = range.start;
 	for_each_set_bitrange_from(range_start, range_end, unaccepted->bitmap,
-				   DIV_ROUND_UP(end, unit_size)) {
+				   range.end) {
 		unsigned long phys_start, phys_end;
 		unsigned long len = range_end - range_start;
 
 		phys_start = range_start * unit_size + unaccepted->phys_base;
 		phys_end = range_end * unit_size + unaccepted->phys_base;
 
+		/*
+		 * Keep interrupts disabled until the accept operation is
+		 * complete in order to prevent deadlocks.
+		 *
+		 * Enabling interrupts before calling arch_accept_memory()
+		 * creates an opportunity for an interrupt handler to request
+		 * acceptance for the same memory. The handler will continuously
+		 * spin with interrupts disabled, preventing other task from
+		 * making progress with the acceptance process.
+		 */
+		spin_unlock(&unaccepted_memory_lock);
+
 		arch_accept_memory(phys_start, phys_end);
+
+		spin_lock(&unaccepted_memory_lock);
 		bitmap_clear(unaccepted->bitmap, range_start, len);
 	}
+
+	list_del(&range.list);
 	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
 }
 
-- 
2.41.0

