Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC411847
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652801705; x=1684337705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CodHwoZ2rLYrhqQ6ze00eaB7F0xVPSzWsLToYorZfcA=;
  b=FxvpsOhg/HnC2W/ocvqbFhhpxVOFAghT0z/zZk6ehSUggr0qd2rcyZJE
   c6L322KKiRRsWZXKns7qhzndvA3CDQm3LZ0uCmtPxqJUOj2goNkd90gON
   CTp3ulac+blHUJ97vyO1km5UVODBeHsz2CIhd5jWT1U5MjRw9mHjo5Do8
   AzPw6qxEJo8pAuURWAG7xuzLE/Z5FJH8udb4dHIMERr1X6FM0dHQzoU+h
   VwN7UKBUoQ5NySGVKiy4CPwc3e4tyEKVXQnOgpqmVqM46Y5KNMCkbyM/E
   V9G7QMU0zfjPHcbn59eXyvF36YjDuAR5A5IoQK9aKYnMq7yUke36679gg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271167705"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271167705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 08:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="672905579"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2022 08:34:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 8C404862; Tue, 17 May 2022 18:34:50 +0300 (EEST)
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
Subject: [PATCHv6 06/15] x86/boot/compressed: Handle unaccepted memory
Date: Tue, 17 May 2022 18:34:35 +0300
Message-Id: <20220517153444.11195-7-kirill.shutemov@linux.intel.com>
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

The firmware will pre-accept the memory used to run the stub. But, the
stub is responsible for accepting the memory into which it decompresses
the main kernel. Accept memory just before decompression starts.

The stub is also responsible for choosing a physical address in which to
place the decompressed kernel image. The KASLR mechanism will randomize
this physical address. Since the unaccepted memory region is relatively
small, KASLR would be quite ineffective if it only used the pre-accepted
area (EFI_CONVENTIONAL_MEMORY). Ensure that KASLR randomizes among the
entire physical address space by also including EFI_UNACCEPTED_MEMORY.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/boot/compressed/Makefile        |  2 +-
 arch/x86/boot/compressed/efi.h           |  1 +
 arch/x86/boot/compressed/kaslr.c         | 35 ++++++++++++++++--------
 arch/x86/boot/compressed/mem.c           | 18 ++++++++++++
 arch/x86/boot/compressed/misc.c          |  6 ++++
 arch/x86/boot/compressed/misc.h          |  6 ++++
 arch/x86/include/asm/unaccepted_memory.h |  2 ++
 7 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 67732478323f..85a631f5cdff 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -102,7 +102,7 @@ endif
 
 vmlinux-objs-$(CONFIG_ACPI) += $(obj)/acpi.o
 vmlinux-objs-$(CONFIG_INTEL_TDX_GUEST) += $(obj)/tdx.o $(obj)/tdcall.o
-vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/bitmap.o $(obj)/mem.o
+vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/bitmap.o $(obj)/find.o $(obj)/mem.o
 
 vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_thunk_$(BITS).o
 vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
diff --git a/arch/x86/boot/compressed/efi.h b/arch/x86/boot/compressed/efi.h
index 7db2f41b54cd..cf475243b6d5 100644
--- a/arch/x86/boot/compressed/efi.h
+++ b/arch/x86/boot/compressed/efi.h
@@ -32,6 +32,7 @@ typedef	struct {
 } efi_table_hdr_t;
 
 #define EFI_CONVENTIONAL_MEMORY		 7
+#define EFI_UNACCEPTED_MEMORY		15
 
 #define EFI_MEMORY_MORE_RELIABLE \
 				((u64)0x0000000000010000ULL)	/* higher reliability */
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 4a3f223973f4..a42264b0b2f5 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -671,6 +671,28 @@ static bool process_mem_region(struct mem_vector *region,
 }
 
 #ifdef CONFIG_EFI
+
+/*
+ * Only EFI_CONVENTIONAL_MEMORY and EFI_UNACCEPTED_MEMORY (if supported) are
+ * guaranteed to be free.
+ *
+ * It is more conservative in picking free memory than the EFI spec allows:
+ *
+ * According to the spec, EFI_BOOT_SERVICES_{CODE|DATA} are also free memory
+ * and thus available to place the kernel image into, but in practice there's
+ * firmware where using that memory leads to crashes.
+ */
+static inline bool memory_type_is_free(efi_memory_desc_t *md)
+{
+	if (md->type == EFI_CONVENTIONAL_MEMORY)
+		return true;
+
+	if (md->type == EFI_UNACCEPTED_MEMORY)
+		return IS_ENABLED(CONFIG_UNACCEPTED_MEMORY);
+
+	return false;
+}
+
 /*
  * Returns true if we processed the EFI memmap, which we prefer over the E820
  * table if it is available.
@@ -715,18 +737,7 @@ process_efi_entries(unsigned long minimum, unsigned long image_size)
 	for (i = 0; i < nr_desc; i++) {
 		md = efi_early_memdesc_ptr(pmap, e->efi_memdesc_size, i);
 
-		/*
-		 * Here we are more conservative in picking free memory than
-		 * the EFI spec allows:
-		 *
-		 * According to the spec, EFI_BOOT_SERVICES_{CODE|DATA} are also
-		 * free memory and thus available to place the kernel image into,
-		 * but in practice there's firmware where using that memory leads
-		 * to crashes.
-		 *
-		 * Only EFI_CONVENTIONAL_MEMORY is guaranteed to be free.
-		 */
-		if (md->type != EFI_CONVENTIONAL_MEMORY)
+		if (!memory_type_is_free(md))
 			continue;
 
 		if (efi_soft_reserve_enabled() &&
diff --git a/arch/x86/boot/compressed/mem.c b/arch/x86/boot/compressed/mem.c
index 415df0d3bc81..b45458af00ca 100644
--- a/arch/x86/boot/compressed/mem.c
+++ b/arch/x86/boot/compressed/mem.c
@@ -3,12 +3,15 @@
 #include "../cpuflags.h"
 #include "bitmap.h"
 #include "error.h"
+#include "find.h"
 #include "math.h"
 
 #define PMD_SHIFT	21
 #define PMD_SIZE	(_AC(1, UL) << PMD_SHIFT)
 #define PMD_MASK	(~(PMD_SIZE - 1))
 
+extern struct boot_params *boot_params;
+
 static inline void __accept_memory(phys_addr_t start, phys_addr_t end)
 {
 	/* Platform-specific memory-acceptance call goes here */
@@ -66,3 +69,18 @@ void process_unaccepted_memory(struct boot_params *params, u64 start, u64 end)
 	bitmap_set((unsigned long *)params->unaccepted_memory,
 		   start / PMD_SIZE, (end - start) / PMD_SIZE);
 }
+
+void accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long range_start, range_end;
+	unsigned long *bitmap, bitmap_size;
+
+	bitmap = (unsigned long *)boot_params->unaccepted_memory;
+	range_start = start / PMD_SIZE;
+	bitmap_size = DIV_ROUND_UP(end, PMD_SIZE);
+
+	for_each_set_bitrange_from(range_start, range_end, bitmap, bitmap_size) {
+		__accept_memory(range_start * PMD_SIZE, range_end * PMD_SIZE);
+		bitmap_clear(bitmap, range_start, range_end - range_start);
+	}
+}
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index cf690d8712f4..c41a87b0ec06 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -454,6 +454,12 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
 #endif
 
 	debug_putstr("\nDecompressing Linux... ");
+
+	if (boot_params->unaccepted_memory) {
+		debug_putstr("Accepting memory... ");
+		accept_memory(__pa(output), __pa(output) + needed_size);
+	}
+
 	__decompress(input_data, input_len, NULL, NULL, output, output_len,
 			NULL, error);
 	parse_elf(output);
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 245cf8f2a0bd..da7ef45133b9 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -235,4 +235,10 @@ static inline unsigned long efi_find_vendor_table(struct boot_params *bp,
 }
 #endif /* CONFIG_EFI */
 
+#ifdef CONFIG_UNACCEPTED_MEMORY
+void accept_memory(phys_addr_t start, phys_addr_t end);
+#else
+static inline void accept_memory(phys_addr_t start, phys_addr_t end) {}
+#endif
+
 #endif /* BOOT_COMPRESSED_MISC_H */
diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index df0736d32858..41fbfc798100 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -7,4 +7,6 @@ struct boot_params;
 
 void process_unaccepted_memory(struct boot_params *params, u64 start, u64 num);
 
+void accept_memory(phys_addr_t start, phys_addr_t end);
+
 #endif
-- 
2.35.1

