Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1A9471
	for <linux-coco@lists.linux.dev>; Sat, 13 May 2023 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684015495; x=1715551495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eu57mUO9ct2ICW4Etq/GrS2vGWKQMEDS8IVWtzUCpBo=;
  b=jF83OPTXPBY+iPNojRtqdvNSc6++Gru1HcUb8IOS8SxgsoSAvwQ/j9Tm
   zs++mxqjVLuGvnSkbVf3M4FlOZdTJvWWyavyHC3YerpxqJj/u/uKhUqsY
   kbLF46Ry5n9huWTNE2XEzQx+GH0yS14LSn3ZS4/+fuVgg6KCCKwAb8daF
   0qAF0b9O1c05sru2ykcEkRQlyhG+i9VMRyOH+4XAL3gQ2njyfINNez1dL
   Eycl9qg8yzh4QJq8kPFCsmmR1zVRMBzukipj2SRGrfyqxYJvtqANAhHyi
   DOUYNKbKXsA+XkQnm2blpoYNgbVW0bX2tOWUoEOo1bRlUCkEhM32zaPfe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="437325213"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="437325213"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="790199676"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="790199676"
Received: from sorinaau-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.62.145])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:04:45 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 256A710CF7D; Sun, 14 May 2023 01:04:34 +0300 (+03)
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
	khalid.elmously@canonical.com,
	philip.cox@canonical.com,
	aarcange@redhat.com,
	peterx@redhat.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCHv11 7/9] x86/tdx: Make _tdx_hypercall() and __tdx_module_call() available in boot stub
Date: Sun, 14 May 2023 01:04:16 +0300
Message-Id: <20230513220418.19357-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230513220418.19357-1-kirill.shutemov@linux.intel.com>
References: <20230513220418.19357-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory acceptance requires a hypercall and one or multiple module calls.

Make helpers for the calls available in boot stub. It has to accept
memory where kernel image and initrd are placed.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c           | 32 -------------------
 arch/x86/include/asm/shared/tdx.h | 51 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/tdx.h        | 19 ------------
 3 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index e146b599260f..e6f4c2758a68 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -14,20 +14,6 @@
 #include <asm/insn-eval.h>
 #include <asm/pgtable.h>
 
-/* TDX module Call Leaf IDs */
-#define TDX_GET_INFO			1
-#define TDX_GET_VEINFO			3
-#define TDX_GET_REPORT			4
-#define TDX_ACCEPT_PAGE			6
-#define TDX_WR				8
-
-/* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
-#define TDCS_NOTIFY_ENABLES		0x9100000000000010
-
-/* TDX hypercall Leaf IDs */
-#define TDVMCALL_MAP_GPA		0x10001
-#define TDVMCALL_REPORT_FATAL_ERROR	0x10003
-
 /* MMIO direction */
 #define EPT_READ	0
 #define EPT_WRITE	1
@@ -51,24 +37,6 @@
 
 #define TDREPORT_SUBTYPE_0	0
 
-/*
- * Wrapper for standard use of __tdx_hypercall with no output aside from
- * return code.
- */
-static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15)
-{
-	struct tdx_hypercall_args args = {
-		.r10 = TDX_HYPERCALL_STANDARD,
-		.r11 = fn,
-		.r12 = r12,
-		.r13 = r13,
-		.r14 = r14,
-		.r15 = r15,
-	};
-
-	return __tdx_hypercall(&args);
-}
-
 /* Called from __tdx_hypercall() for unrecoverable failure */
 noinstr void __tdx_hypercall_failed(void)
 {
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 2631e01f6e0f..1ff0ee822961 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -10,6 +10,20 @@
 #define TDX_CPUID_LEAF_ID	0x21
 #define TDX_IDENT		"IntelTDX    "
 
+/* TDX module Call Leaf IDs */
+#define TDX_GET_INFO			1
+#define TDX_GET_VEINFO			3
+#define TDX_GET_REPORT			4
+#define TDX_ACCEPT_PAGE			6
+#define TDX_WR				8
+
+/* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
+#define TDCS_NOTIFY_ENABLES		0x9100000000000010
+
+/* TDX hypercall Leaf IDs */
+#define TDVMCALL_MAP_GPA		0x10001
+#define TDVMCALL_REPORT_FATAL_ERROR	0x10003
+
 #ifndef __ASSEMBLY__
 
 /*
@@ -37,8 +51,45 @@ struct tdx_hypercall_args {
 u64 __tdx_hypercall(struct tdx_hypercall_args *args);
 u64 __tdx_hypercall_ret(struct tdx_hypercall_args *args);
 
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
+	return __tdx_hypercall(&args);
+}
+
+
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
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASM_X86_SHARED_TDX_H */
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 28d889c9aa16..234197ec17e4 100644
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
-- 
2.39.3

