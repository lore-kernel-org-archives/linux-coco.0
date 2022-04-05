Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97A33C5
	for <linux-coco@lists.linux.dev>; Tue,  5 Apr 2022 23:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649202530; x=1680738530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VLMK2XfZRxwY2DfHGkqNEfElATjStd6aGMpGXYl7+N4=;
  b=OWXoBsKF/+MYH2fO3DDWRqa7FipeGd1jcXwu1DVpNP+MSLww3Eqlg7a9
   POjrki/Hj0KpEjWonDz7Tp2cts89vtVg+qFCx6w1EkH+zU1dp8g9KtvHF
   Tw56cnkFgaqedYLHwiyTTSdkyiWIaHMPvUleIwSW+DzvNt7TChwkRd3Af
   Z8JJN0lwsUr2oUuDzuTBsFYZeM5fEoR2DdkhwdnS3FKEflXn6bDrXLY/A
   mvfktab0Xezg3tG0sn+Q9rmV2ykSrd2dzyOLerO1aKSGqC2G0hOwTAKy7
   zBxgPzEe5aaCysR44ZZyys/S2cBQVke0AL3OivE1riFeTXAGVYJXxgh0t
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="241477894"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="241477894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 16:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="549279513"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2022 16:48:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id DC54261B; Wed,  6 Apr 2022 02:43:47 +0300 (EEST)
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
Subject: [PATCHv4 7/8] x86/tdx: Unaccepted memory support
Date: Wed,  6 Apr 2022 02:43:42 +0300
Message-Id: <20220405234343.74045-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All preparations are complete. Hookup TDX-specific code to accept memory.

There are two tdx_accept_memory() implementations: one in main kernel
and one in the decompresser.

The implementation in core kernel uses tdx_enc_status_changed().
The helper is not available in the decompresser, self-contained
implementation added there instead.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/Kconfig                             |  1 +
 arch/x86/boot/compressed/tdx.c               | 41 ++++++++++++++++++++
 arch/x86/boot/compressed/unaccepted_memory.c | 23 ++++++++++-
 arch/x86/coco/tdx/tdx.c                      | 29 +++++++++-----
 arch/x86/include/asm/shared/tdx.h            | 20 ++++++++++
 arch/x86/include/asm/tdx.h                   | 19 ---------
 arch/x86/mm/unaccepted_memory.c              |  6 ++-
 7 files changed, 109 insertions(+), 30 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7021ec725dd3..e4c31dbea6d7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -885,6 +885,7 @@ config INTEL_TDX_GUEST
 	select ARCH_HAS_CC_PLATFORM
 	select X86_MEM_ENCRYPT
 	select X86_MCE
+	select UNACCEPTED_MEMORY
 	help
 	  Support running as a guest under Intel TDX.  Without this support,
 	  the guest kernel can not boot or run under TDX.
diff --git a/arch/x86/boot/compressed/tdx.c b/arch/x86/boot/compressed/tdx.c
index 918a7606f53c..a0bd1426d235 100644
--- a/arch/x86/boot/compressed/tdx.c
+++ b/arch/x86/boot/compressed/tdx.c
@@ -9,6 +9,7 @@
 #include <uapi/asm/vmx.h>
 
 #include <asm/shared/tdx.h>
+#include <asm/page_types.h>
 
 /* Called from __tdx_hypercall() for unrecoverable failure */
 void __tdx_hypercall_failed(void)
@@ -75,3 +76,43 @@ void early_tdx_detect(void)
 	pio_ops.f_outb = tdx_outb;
 	pio_ops.f_outw = tdx_outw;
 }
+
+#define TDACCEPTPAGE		6
+#define TDVMCALL_MAP_GPA	0x10001
+
+/*
+ * Wrapper for standard use of __tdx_hypercall with no output aside from
+ * return code.
+ */
+static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15)
+{
+	struct tdx_hypercall_args args = {
+		.r10 = TDX_HYPERCALL_STANDARD,
+		.r11 = fn,
+		.r12 = r12,
+		.r13 = r13,
+		.r14 = r14,
+		.r15 = r15,
+	};
+
+	return __tdx_hypercall(&args, 0);
+}
+
+void tdx_accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	int i;
+
+	if (_tdx_hypercall(TDVMCALL_MAP_GPA, start, end - start, 0, 0))
+		error("Cannot accept memory: MapGPA failed\n");
+
+	/*
+	 * For shared->private conversion, accept the page using TDACCEPTPAGE
+	 * TDX module call.
+	 */
+	for (i = 0; i < (end - start) / PAGE_SIZE; i++) {
+		if (__tdx_module_call(TDACCEPTPAGE, start + i * PAGE_SIZE,
+				      0, 0, 0, NULL)) {
+			error("Cannot accept memory: page accept failed\n");
+		}
+	}
+}
diff --git a/arch/x86/boot/compressed/unaccepted_memory.c b/arch/x86/boot/compressed/unaccepted_memory.c
index 3ebab63789bb..662ec32e3c42 100644
--- a/arch/x86/boot/compressed/unaccepted_memory.c
+++ b/arch/x86/boot/compressed/unaccepted_memory.c
@@ -1,12 +1,33 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/shared/tdx.h>
 #include "error.h"
 #include "misc.h"
+#include "tdx.h"
+
+static bool is_tdx_guest(void)
+{
+	static bool once;
+	static bool is_tdx;
+
+	if (!once) {
+		u32 eax, sig[3];
+
+		cpuid_count(TDX_CPUID_LEAF_ID, 0, &eax,
+			    &sig[0], &sig[2],  &sig[1]);
+		is_tdx = !memcmp(TDX_IDENT, sig, sizeof(sig));
+	}
+
+	return is_tdx;
+}
 
 static inline void __accept_memory(phys_addr_t start, phys_addr_t end)
 {
 	/* Platform-specific memory-acceptance call goes here */
-	error("Cannot accept memory");
+	if (is_tdx_guest())
+		tdx_accept_memory(start, end);
+	else
+		error("Cannot accept memory");
 }
 
 void mark_unaccepted(struct boot_params *params, u64 start, u64 end)
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 03deb4d6920d..0fcb54e07797 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -606,16 +606,8 @@ static bool try_accept_one(phys_addr_t *start, unsigned long len,
 	return true;
 }
 
-/*
- * Inform the VMM of the guest's intent for this physical page: shared with
- * the VMM or private to the guest.  The VMM is expected to change its mapping
- * of the page in response.
- */
-static bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
+static bool __tdx_enc_status_changed(phys_addr_t start, phys_addr_t end, bool enc)
 {
-	phys_addr_t start = __pa(vaddr);
-	phys_addr_t end   = __pa(vaddr + numpages * PAGE_SIZE);
-
 	if (!enc) {
 		/* Set the shared (decrypted) bits: */
 		start |= cc_mkdec(0);
@@ -660,6 +652,25 @@ static bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
 	return true;
 }
 
+void tdx_accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (!__tdx_enc_status_changed(start, end, true))
+		panic("Accepting memory failed\n");
+}
+
+/*
+ * Inform the VMM of the guest's intent for this physical page: shared with
+ * the VMM or private to the guest.  The VMM is expected to change its mapping
+ * of the page in response.
+ */
+static bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
+{
+	phys_addr_t start = __pa(vaddr);
+	phys_addr_t end = __pa(vaddr + numpages * PAGE_SIZE);
+
+	return __tdx_enc_status_changed(start, end, enc);
+}
+
 void __init tdx_early_init(void)
 {
 	u64 cc_mask;
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index e53f26228fbb..4eca6492b108 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -36,5 +36,25 @@ u64 __tdx_hypercall(struct tdx_hypercall_args *args, unsigned long flags);
 /* Called from __tdx_hypercall() for unrecoverable failure */
 void __tdx_hypercall_failed(void);
 
+/*
+ * Used in __tdx_module_call() to gather the output registers' values of the
+ * TDCALL instruction when requesting services from the TDX module. This is a
+ * software only structure and not part of the TDX module/VMM ABI
+ */
+struct tdx_module_output {
+	u64 rcx;
+	u64 rdx;
+	u64 r8;
+	u64 r9;
+	u64 r10;
+	u64 r11;
+};
+
+/* Used to communicate with the TDX module */
+u64 __tdx_module_call(u64 fn, u64 rcx, u64 rdx, u64 r8, u64 r9,
+		      struct tdx_module_output *out);
+
+void tdx_accept_memory(phys_addr_t start, phys_addr_t end);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASM_X86_SHARED_TDX_H */
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 020c81a7c729..d9106d3e89f8 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -20,21 +20,6 @@
 
 #ifndef __ASSEMBLY__
 
-/*
- * Used to gather the output registers values of the TDCALL and SEAMCALL
- * instructions when requesting services from the TDX module.
- *
- * This is a software only structure and not part of the TDX module/VMM ABI.
- */
-struct tdx_module_output {
-	u64 rcx;
-	u64 rdx;
-	u64 r8;
-	u64 r9;
-	u64 r10;
-	u64 r11;
-};
-
 /*
  * Used by the #VE exception handler to gather the #VE exception
  * info from the TDX module. This is a software only structure
@@ -55,10 +40,6 @@ struct ve_info {
 
 void __init tdx_early_init(void);
 
-/* Used to communicate with the TDX module */
-u64 __tdx_module_call(u64 fn, u64 rcx, u64 rdx, u64 r8, u64 r9,
-		      struct tdx_module_output *out);
-
 void tdx_get_ve_info(struct ve_info *ve);
 
 bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
diff --git a/arch/x86/mm/unaccepted_memory.c b/arch/x86/mm/unaccepted_memory.c
index 3588a7cb954c..2f1c3c0375cd 100644
--- a/arch/x86/mm/unaccepted_memory.c
+++ b/arch/x86/mm/unaccepted_memory.c
@@ -6,6 +6,7 @@
 
 #include <asm/io.h>
 #include <asm/setup.h>
+#include <asm/shared/tdx.h>
 #include <asm/unaccepted_memory.h>
 
 static DEFINE_SPINLOCK(unaccepted_memory_lock);
@@ -26,7 +27,10 @@ void accept_memory(phys_addr_t start, phys_addr_t end)
 	for_each_set_bitrange_from(rs, re, unaccepted_memory,
 				   DIV_ROUND_UP(end, PMD_SIZE)) {
 		/* Platform-specific memory-acceptance call goes here */
-		panic("Cannot accept memory");
+		if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+			tdx_accept_memory(rs * PMD_SIZE, re * PMD_SIZE);
+		else
+			panic("Cannot accept memory");
 		bitmap_clear(unaccepted_memory, rs, re - rs);
 	}
 	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
-- 
2.35.1

