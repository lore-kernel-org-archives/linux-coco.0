Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5DB33F0
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772205; x=1706308205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GDrhDu1mCk6e1IvJoEEnUJ7ltIQXGeo/1vtq21igVLk=;
  b=DB8CYtD6aiy3rkMxa9hvle5XQU2HA0YuGf4NBFndey34Do4FA728ycaS
   sBUG17kDPM1kgIoD50bzFs2mkosnqWxoJ2atvZAXyv5oCJYt3CtCyZnlr
   AlUep28NRytJMLwfsNzzuEejQ8gtAKXL7TepmX7qn6zfHJkczOKHuDgmT
   gkaGVfkOTT8Krggs3GL/NkfvEWdOAdtzog+x645WCDAfK3yl0nIm8nF9q
   PLxIBxoiWiFv4ufDy8oGl392uu7gOz5rfVp4nofVvZFjplQsoRxmkGgzg
   FLVoueZTAfFLJf5LhNawKSNX2li6rnyHXfTT5O+AcH7b+D7VaWH4ruX/V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="389342073"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="389342073"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751770913"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="751770913"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:05 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 6675310DBE8; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2, RESEND 4/7] x86/tdx: Expand __tdx_hypercall() to handle more arguments
Date: Fri, 27 Jan 2023 01:11:56 +0300
Message-Id: <20230126221159.8635-5-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
References: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far __tdx_hypercall() only handles six arguments for VMCALL.
Expanding it to six more register would allow to cover more use-cases
like ReportFatalError() and Hyper-V hypercalls.

With all preparations in place, the expansion is pretty straight
forward.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdcall.S | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
index a9bb4cbb8197..5da06d1a9ba3 100644
--- a/arch/x86/coco/tdx/tdcall.S
+++ b/arch/x86/coco/tdx/tdcall.S
@@ -13,6 +13,12 @@
 /*
  * Bitmasks of exposed registers (with VMM).
  */
+#define TDX_RDX		BIT(2)
+#define TDX_RBX		BIT(3)
+#define TDX_RSI		BIT(6)
+#define TDX_RDI		BIT(7)
+#define TDX_R8		BIT(8)
+#define TDX_R9		BIT(9)
 #define TDX_R10		BIT(10)
 #define TDX_R11		BIT(11)
 #define TDX_R12		BIT(12)
@@ -27,9 +33,9 @@
  * details can be found in TDX GHCI specification, section
  * titled "TDCALL [TDG.VP.VMCALL] leaf".
  */
-#define TDVMCALL_EXPOSE_REGS_MASK	( TDX_R10 | TDX_R11 | \
-					  TDX_R12 | TDX_R13 | \
-					  TDX_R14 | TDX_R15 )
+#define TDVMCALL_EXPOSE_REGS_MASK	\
+	( TDX_RDX | TDX_RBX | TDX_RSI | TDX_RDI | TDX_R8  | TDX_R9  | \
+	  TDX_R10 | TDX_R11 | TDX_R12 | TDX_R13 | TDX_R14 | TDX_R15 )
 
 /*
  * __tdx_module_call()  - Used by TDX guests to request services from
@@ -124,6 +130,7 @@ SYM_FUNC_START(__tdx_hypercall)
 	push %r14
 	push %r13
 	push %r12
+	push %rbx
 	push %rbp
 
 	/* Free RDI and RSI to be used as TDVMCALL arguments */
@@ -131,12 +138,18 @@ SYM_FUNC_START(__tdx_hypercall)
 	movq %rsi, %rbp
 
 	/* Copy hypercall registers from arg struct: */
+	movq TDX_HYPERCALL_r8(%rax),  %r8
+	movq TDX_HYPERCALL_r9(%rax),  %r9
 	movq TDX_HYPERCALL_r10(%rax), %r10
 	movq TDX_HYPERCALL_r11(%rax), %r11
 	movq TDX_HYPERCALL_r12(%rax), %r12
 	movq TDX_HYPERCALL_r13(%rax), %r13
 	movq TDX_HYPERCALL_r14(%rax), %r14
 	movq TDX_HYPERCALL_r15(%rax), %r15
+	movq TDX_HYPERCALL_rdi(%rax), %rdi
+	movq TDX_HYPERCALL_rsi(%rax), %rsi
+	movq TDX_HYPERCALL_rbx(%rax), %rbx
+	movq TDX_HYPERCALL_rdx(%rax), %rdx
 
 	push %rax
 
@@ -178,12 +191,18 @@ SYM_FUNC_START(__tdx_hypercall)
 	testq $TDX_HCALL_HAS_OUTPUT, %rbp
 	jz .Lout
 
+	movq %r8,  TDX_HYPERCALL_r8(%rax)
+	movq %r9,  TDX_HYPERCALL_r9(%rax)
 	movq %r10, TDX_HYPERCALL_r10(%rax)
 	movq %r11, TDX_HYPERCALL_r11(%rax)
 	movq %r12, TDX_HYPERCALL_r12(%rax)
 	movq %r13, TDX_HYPERCALL_r13(%rax)
 	movq %r14, TDX_HYPERCALL_r14(%rax)
 	movq %r15, TDX_HYPERCALL_r15(%rax)
+	movq %rdi, TDX_HYPERCALL_rdi(%rax)
+	movq %rsi, TDX_HYPERCALL_rsi(%rax)
+	movq %rbx, TDX_HYPERCALL_rbx(%rax)
+	movq %rdx, TDX_HYPERCALL_rdx(%rax)
 .Lout:
 	/* TDVMCALL leaf return code is in R10 */
 	movq %r10, %rax
@@ -191,14 +210,20 @@ SYM_FUNC_START(__tdx_hypercall)
 	/*
 	 * Zero out registers exposed to the VMM to avoid speculative execution
 	 * with VMM-controlled values. This needs to include all registers
-	 * present in TDVMCALL_EXPOSE_REGS_MASK (except R12-R15). R12-R15
-	 * context will be restored.
+	 * present in TDVMCALL_EXPOSE_REGS_MASK, except RBX, and R12-R15 which
+	 * will be restored.
 	 */
+	xor %r8d,  %r8d
+	xor %r9d,  %r9d
 	xor %r10d, %r10d
 	xor %r11d, %r11d
+	xor %rdi,  %rdi
+	xor %rsi,  %rsi
+	xor %rdx,  %rdx
 
 	/* Restore callee-saved GPRs as mandated by the x86_64 ABI */
 	pop %rbp
+	pop %rbx
 	pop %r12
 	pop %r13
 	pop %r14
-- 
2.39.1

