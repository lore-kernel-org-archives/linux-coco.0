Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789315C83
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772206; x=1706308206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4RnpvG851CQ2J01HFmizOyd6RFXJQ68QAxBEP3YWKQ4=;
  b=CpVdfjZFK6hB1mdvPZci9uXr45Eb7Gkx+8ZSbv5sXfCsj1j9vVko8M6O
   w7rQT9q3GuCZjz4YDWUCYllWkAwTzyafSp2Sks4sLhFjd1kG+aO2VOc1+
   yrPBlSTuTNe+gJEQ/j99SPdp2kTfA36VLQTRxRgYfXJspqi45T68tKeH6
   qva76QZu0b9DBzmWLwj36bHA1+zJ4HMfqOUehcOwZ94j2QlsDxzyPwlfN
   lmqTzgtYDfysaopRqqtwZrwunXOU2F3yPtfXYAqvnSLkAa1ZiK6VhwQGz
   Sl+uMpDDrclYK2Mp03VY3cFC7O5bsXkEd3Sz0K/dCs2LwrNhqCB0tYE3t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="389342098"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="389342098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751770953"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="751770953"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:10 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 7019310DBF3; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
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
Subject: [PATCHv2, RESEND 5/7] x86/tdx: Use ReportFatalError to report missing SEPT_VE_DISABLE
Date: Fri, 27 Jan 2023 01:11:57 +0300
Message-Id: <20230126221159.8635-6-kirill.shutemov@linux.intel.com>
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
2.39.1

