Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA31851
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801706; x=1684337706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J64a/BEEWsUxrDMmj+uUH7zOqhAj4bsQNa/njKbNxuM=;
  b=TjBVrhgXjHNvqx5N0o3K3zHitJ/eVO+9h65FC0fw7CQMUSTebTJ5Ru/Y
   mPIMtdRy9QVqR5bPbCW0j9bfqDjTBCadDPYtJR6Nui4AcJqIw+zMGSktU
   6kD2wAcOWVlC3TctXq0knV/cg3g9QHYfZH69bmI2o3UqyWNzGy+sbfZjV
   om+pAd8x2LgAe5zI2uFMEHwbevPIlHUziU0GIr9yC1cZcruQjF7j/ABdb
   4jfv/t6/09sCVvPoBHRkOw1Jy4hW76nynv7HY9/g3jghZQg09p3fhmxeP
   DQKMaiFTU1A4NdVp9j2jn6y7ED7a+W7POXvPuyPgK1w9+JtS4kMG5jgRj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271167708"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271167708"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="672905582"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2022 08:34:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A2D239D4; Tue, 17 May 2022 18:34:50 +0300 (EEST)
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
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	marcelo.cerri@canonical.com,
	tim.gardner@canonical.com,
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv6 08/15] x86/mm: Provide helpers for unaccepted memory
Date: Tue, 17 May 2022 18:34:37 +0300
Message-Id: <20220517153444.11195-9-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core-mm requires few helpers to support unaccepted memory:

 - accept_memory() checks the range of addresses against the bitmap and
   accept memory if needed.

 - memory_is_unaccepted() check if anything within the range requires
   acceptance.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/include/asm/page.h              |  3 ++
 arch/x86/include/asm/unaccepted_memory.h |  4 ++
 arch/x86/mm/Makefile                     |  2 +
 arch/x86/mm/unaccepted_memory.c          | 56 ++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 arch/x86/mm/unaccepted_memory.c

diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 9cc82f305f4b..df4ec3a988dc 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -19,6 +19,9 @@
 struct page;
 
 #include <linux/range.h>
+
+#include <asm/unaccepted_memory.h>
+
 extern struct range pfn_mapped[];
 extern int nr_pfn_mapped;
 
diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index 41fbfc798100..89fc91c61560 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -7,6 +7,10 @@ struct boot_params;
 
 void process_unaccepted_memory(struct boot_params *params, u64 start, u64 num);
 
+#ifdef CONFIG_UNACCEPTED_MEMORY
+
 void accept_memory(phys_addr_t start, phys_addr_t end);
+bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end);
 
 #endif
+#endif
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index d957dc15b371..92438ad3d3b6 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -59,3 +59,5 @@ obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_amd.o
 
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_identity.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_boot.o
+
+obj-$(CONFIG_UNACCEPTED_MEMORY)	+= unaccepted_memory.o
diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
new file mode 100644
index 000000000000..0a86380b2478
--- /dev/null
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/memblock.h>
+#include <linux/mm.h>
+#include <linux/pfn.h>
+#include <linux/spinlock.h>
+
+#include <asm/io.h>
+#include <asm/setup.h>
+#include <asm/unaccepted_memory.h>
+
+/* Protects unaccepted memory bitmap */
+static DEFINE_SPINLOCK(unaccepted_memory_lock);
+
+void accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long range_start, range_end;
+	unsigned long *bitmap;
+	unsigned long flags;
+
+	if (!boot_params.unaccepted_memory)
+		return;
+
+	bitmap = __va(boot_params.unaccepted_memory);
+	range_start = start / PMD_SIZE;
+
+	spin_lock_irqsave(&unaccepted_memory_lock, flags);
+	for_each_set_bitrange_from(range_start, range_end, bitmap,
+				   DIV_ROUND_UP(end, PMD_SIZE)) {
+		unsigned long len = range_end - range_start;
+
+		/* Platform-specific memory-acceptance call goes here */
+		panic("Cannot accept memory: unknown platform\n");
+		bitmap_clear(bitmap, range_start, len);
+	}
+	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
+}
+
+bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long *bitmap = __va(boot_params.unaccepted_memory);
+	unsigned long flags;
+	bool ret = false;
+
+	spin_lock_irqsave(&unaccepted_memory_lock, flags);
+	while (start < end) {
+		if (test_bit(start / PMD_SIZE, bitmap)) {
+			ret = true;
+			break;
+		}
+
+		start += PMD_SIZE;
+	}
+	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
+
+	return ret;
+}
-- 
2.35.1

