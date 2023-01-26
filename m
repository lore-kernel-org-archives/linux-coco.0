Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275428EC
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772301; x=1706308301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lh5mHGy5KSUz8htxVu1g6Z5VsceNbf4gO76efsRQF7M=;
  b=Cf3kIxtsWl7uOPkIYqMRYkkddAoNU3bxJ2di6ubRZHJ99EnJizmzoGXm
   FL+OKrBR97fu5PbtTQ9q9imxAnZwCm4i6bdyVO34Lhhd1Anu5YAxr/E41
   ze75kD8TEoaqdK6DUrHWAEKIcgAEAbX/kFqIadlUNJrt8CFlTcqlboOil
   4Cu0R3p2m/p7Xrmm7B3C0zYaWi5R0dA8npH4I+VW9sGkASGeSO4Dh/gaK
   NlvzRxXc2BeTDU2p6HxSO/GhiX06yDye51mUK4Yd+0j2TWUnyRLn7KKqI
   kHKbH2WuUFRTmMuP+/8yvuSQ00Jk9jgyWFkWsA3KDi62HJ4tBfEeYOrhg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="391516412"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="391516412"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="908411171"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="908411171"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:05 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 533E110DBDE; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
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
Subject: [PATCHv2, RESEND 2/7] x86/tdx: Add more registers to struct tdx_hypercall_args
Date: Fri, 27 Jan 2023 01:11:54 +0300
Message-Id: <20230126221159.8635-3-kirill.shutemov@linux.intel.com>
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

struct tdx_hypercall_args is used to pass down hypercall arguments to
__tdx_hypercall() assembly routine.

Currently __tdx_hypercall() handles up to 6 arguments. In preparation to
changes in __tdx_hypercall(), expand the structure to 6 more registers
and generate asm offsets for them.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/include/asm/shared/tdx.h | 6 ++++++
 arch/x86/kernel/asm-offsets.c     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index e53f26228fbb..8068faa52de1 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -22,12 +22,18 @@
  * This is a software only structure and not part of the TDX module/VMM ABI.
  */
 struct tdx_hypercall_args {
+	u64 r8;
+	u64 r9;
 	u64 r10;
 	u64 r11;
 	u64 r12;
 	u64 r13;
 	u64 r14;
 	u64 r15;
+	u64 rdi;
+	u64 rsi;
+	u64 rbx;
+	u64 rdx;
 };
 
 /* Used to request services from the VMM */
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 82c783da16a8..8650f29387e0 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -75,12 +75,18 @@ static void __used common(void)
 	OFFSET(TDX_MODULE_r11, tdx_module_output, r11);
 
 	BLANK();
+	OFFSET(TDX_HYPERCALL_r8,  tdx_hypercall_args, r8);
+	OFFSET(TDX_HYPERCALL_r9,  tdx_hypercall_args, r9);
 	OFFSET(TDX_HYPERCALL_r10, tdx_hypercall_args, r10);
 	OFFSET(TDX_HYPERCALL_r11, tdx_hypercall_args, r11);
 	OFFSET(TDX_HYPERCALL_r12, tdx_hypercall_args, r12);
 	OFFSET(TDX_HYPERCALL_r13, tdx_hypercall_args, r13);
 	OFFSET(TDX_HYPERCALL_r14, tdx_hypercall_args, r14);
 	OFFSET(TDX_HYPERCALL_r15, tdx_hypercall_args, r15);
+	OFFSET(TDX_HYPERCALL_rdi, tdx_hypercall_args, rdi);
+	OFFSET(TDX_HYPERCALL_rsi, tdx_hypercall_args, rsi);
+	OFFSET(TDX_HYPERCALL_rbx, tdx_hypercall_args, rbx);
+	OFFSET(TDX_HYPERCALL_rdx, tdx_hypercall_args, rdx);
 
 	BLANK();
 	OFFSET(BP_scratch, boot_params, scratch);
-- 
2.39.1

