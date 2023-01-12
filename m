Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161B2107
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673518464; x=1705054464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7okiIaj1mXjjqjJ5IKQzDQSQ9jvp5ruk3bnJVX6pMgw=;
  b=kdVwsOQrHSbEesEuNV7lKkWzYQd2Id26/zFWoLpA5WUqZohQ0jzMpc6t
   CeEsSumZM/pqX+k2JZSKE+48M830BO4anWeQqMQhCl9HwUCb9qhZ/aBZ1
   Cw80/NsPhMTBlRaqAz/3ZGe/YPuqcTQnSn+YT4DoHXeKWGKBnEyC8VP31
   YHMzLFYtSueX+ukFO/MEkDMkX3yChGBssZg8wnFWBuNoTUPtt6wPwSXJy
   2y0gJEI929j0se9wFxpUzwNhF9X/NylzQYq1oN6WqyJzU39mDfwXgJ7Gt
   KmD9eZpW/0PsMW+awDqLbcSw7jlsvue6zYg5FhY4x/EWrGbyzQkhPULO3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324899416"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="324899416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="903128291"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="903128291"
Received: from glieseu-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.52.1])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:14:21 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id A551D109AF5; Thu, 12 Jan 2023 13:14:13 +0300 (+03)
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
Subject: [PATCHv2 5/7] x86/tdx: Use ReportFatalError to report missing SEPT_VE_DISABLE
Date: Thu, 12 Jan 2023 13:14:05 +0300
Message-Id: <20230112101407.24327-6-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112101407.24327-1-kirill.shutemov@linux.intel.com>
References: <20230112101407.24327-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux TDX guests require that the SEPT_VE_DISABLE "attribute" be set.
If it is not set, the kernel is theoretically required to handle
exceptions anywhere that kernel memory is accessed, including places
like NMI handlers and in the syscall entry gap.

Rather than even try to handle these exceptions, the kernel refuses to
run if SEPT_VE_DISABLE is unset.

However, the SEPT_VE_DISABLE detection and refusal code happens very
early in boot, even before earlyprintk runs.  Calling panic() will
effectively just hang the system.

Instead, call a TDX-specific panic() function.  This makes a very simple
TDVMCALL which gets a short error string out to the hypervisor without
any console infrastructure.

Use TDG.VP.VMCALL<ReportFatalError> to report the error. The hypercall
can encode message up to 64 bytes in eight registers.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 669d9e4f2901..56accf653709 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -22,6 +22,7 @@
 
 /* TDX hypercall Leaf IDs */
 #define TDVMCALL_MAP_GPA		0x10001
+#define TDVMCALL_REPORT_FATAL_ERROR	0x10003
 
 /* MMIO direction */
 #define EPT_READ	0
@@ -140,6 +141,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 }
 EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
 
+static void __noreturn tdx_panic(const char *msg)
+{
+	struct tdx_hypercall_args args = {
+		.r10 = TDX_HYPERCALL_STANDARD,
+		.r11 = TDVMCALL_REPORT_FATAL_ERROR,
+		.r12 = 0, /* Error code: 0 is Panic */
+	};
+	union {
+		/* Define register order according to the GHCI */
+		struct { u64 r14, r15, rbx, rdi, rsi, r8, r9, rdx; };
+
+		char str[64];
+	} message;
+
+	/* VMM assumes '\0' in byte 65, if the message took all 64 bytes */
+	strncpy(message.str, msg, 64);
+
+	args.r8  = message.r8;
+	args.r9  = message.r9;
+	args.r14 = message.r14;
+	args.r15 = message.r15;
+	args.rdi = message.rdi;
+	args.rsi = message.rsi;
+	args.rbx = message.rbx;
+	args.rdx = message.rdx;
+
+	/*
+	 * Keep calling the hypercall in case VMM did not terminated
+	 * the TD as it must.
+	 */
+	while (1) {
+		__tdx_hypercall(&args, 0);
+	}
+}
+
 static void tdx_parse_tdinfo(u64 *cc_mask)
 {
 	struct tdx_module_output out;
@@ -172,7 +208,7 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
 	 */
 	td_attr = out.rdx;
 	if (!(td_attr & ATTR_SEPT_VE_DISABLE))
-		panic("TD misconfiguration: SEPT_VE_DISABLE attibute must be set.\n");
+		tdx_panic("TD misconfiguration: SEPT_VE_DISABLE attribute must be set.");
 }
 
 /*
-- 
2.38.2

