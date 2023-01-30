Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD228F3
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675086879; x=1706622879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4DEGDkL+yrEmQwnOAwQuSEcBBMrH3SBUNGZ0BQPN+/Y=;
  b=e6UeKpwKg7UBVMvT8vambUPfHpCitPPqI9md2jL1iobEUH7s4IxyErIT
   m0Ex5QNIVVlfTd15cKUxX/elJJNj1fBBB54Q1+MQI9CbOnyxvGq9R1PKc
   IKgNh9A8WKpAoqzkARWksEShpRdy+1u3cA03QryPFjujPIdweaZxOGlFE
   +qhjqYyYgm1+rmNS17aGqcSnJyFRZmrrmyXu8CDipT3qF1PqFNyctSVi8
   riLyxD4QMUwDSnYeK+rFdVthm+dJRbJJ2GUzLf5Et/8ldK6BD6ZOI6bhz
   k6a0ANA01PdGNIEWSB9wjm5oOkAYh8xsyGqoLTlf0CgIX1q9L+CVxsckd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307903830"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="307903830"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:54:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="696405603"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="696405603"
Received: from dhirceax-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.33.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:54:35 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id D4F4710DF7D; Mon, 30 Jan 2023 16:54:31 +0300 (+03)
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] x86/tdx: Do not corrupt frame-pointer in __tdx_hypercall()
Date: Mon, 30 Jan 2023 16:53:54 +0300
Message-Id: <20230130135354.27674-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If compiled with CONFIG_FRAME_POINTER=y, objtool in not happy that
__tdx_hypercall() messes up RBP.

  objtool: __tdx_hypercall+0x7f: return with modified stack frame

Rework the function to store TDX_HCALL_ flags on stack instead of RBP.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Fixes: c30c4b2555ba ("x86/tdx: Refactor __tdx_hypercall() to allow pass down more arguments")
Link: https://lore.kernel.org/all/202301290255.buUBs99R-lkp@intel.com
Reported-by: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---

The patch is against tip/x86/tdx. tip/sched/core removes
TDX_HCALL_ISSUE_STI. The trird hunk of the patch is not relevant
after that.

---
 arch/x86/coco/tdx/tdcall.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
index 5da06d1a9ba3..2bd436a4790d 100644
--- a/arch/x86/coco/tdx/tdcall.S
+++ b/arch/x86/coco/tdx/tdcall.S
@@ -131,11 +131,10 @@ SYM_FUNC_START(__tdx_hypercall)
 	push %r13
 	push %r12
 	push %rbx
-	push %rbp
 
 	/* Free RDI and RSI to be used as TDVMCALL arguments */
 	movq %rdi, %rax
-	movq %rsi, %rbp
+	push %rsi
 
 	/* Copy hypercall registers from arg struct: */
 	movq TDX_HYPERCALL_r8(%rax),  %r8
@@ -168,7 +167,7 @@ SYM_FUNC_START(__tdx_hypercall)
 	 * HLT operation indefinitely. Since this is the not the desired
 	 * result, conditionally call STI before TDCALL.
 	 */
-	testq $TDX_HCALL_ISSUE_STI, %rbp
+	testq $TDX_HCALL_ISSUE_STI, 8(%rsp)
 	jz .Lskip_sti
 	sti
 .Lskip_sti:
@@ -188,7 +187,7 @@ SYM_FUNC_START(__tdx_hypercall)
 	pop %rax
 
 	/* Copy hypercall result registers to arg struct if needed */
-	testq $TDX_HCALL_HAS_OUTPUT, %rbp
+	testq $TDX_HCALL_HAS_OUTPUT, (%rsp)
 	jz .Lout
 
 	movq %r8,  TDX_HYPERCALL_r8(%rax)
@@ -218,11 +217,12 @@ SYM_FUNC_START(__tdx_hypercall)
 	xor %r10d, %r10d
 	xor %r11d, %r11d
 	xor %rdi,  %rdi
-	xor %rsi,  %rsi
 	xor %rdx,  %rdx
 
+	/* Remove TDX_HCALL_* flags from the stack */
+	pop %rsi
+
 	/* Restore callee-saved GPRs as mandated by the x86_64 ABI */
-	pop %rbp
 	pop %rbx
 	pop %r12
 	pop %r13
-- 
2.39.1

