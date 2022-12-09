Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABBD33EC
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670592339; x=1702128339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pqHHbopmGNY5t74exyfAEgTwAvM3lKXws1pSWDVVq7U=;
  b=bP6NuBQ+ccea5ZX/3zwLlima7pHT0ptz8LqtAFLbqaHRx1OjQrWdjQfk
   iW4mPum4qku6Cb+4Fk2ei6cIJkyVVBGeLsz+0sJEh0/aHjULS6f3zNNNc
   SXpo1s5sCEyhQPJTPiNjmQE7s4IMnAV8mzaBaWiRi9IqOvp8H3hT2NNeS
   uPNJbZp3BAW8RxtrQdZu8ecx1dKF9veCdZdE+zSFCvHLgRis6SiNQrzFe
   dLZwQbuvg6MpJTOpZXjs9+LS8BWhG2nW8HVHmQlq3Hep9hWomshMo0deh
   3V+9UuyBfC5/GyMQWAeBYI6M7NTPPM5lqvIGQslBDKVBX5kNd1631nwqy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="317483307"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="317483307"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 05:25:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="892670376"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="892670376"
Received: from elinares-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.38.98])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 05:25:33 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 54B84109CE5; Fri,  9 Dec 2022 16:25:31 +0300 (+03)
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
Subject: [PATCH 3/4] x86/tdx: Relax SEPT_VE_DISABLE check for debug TD
Date: Fri,  9 Dec 2022 16:25:23 +0300
Message-Id: <20221209132524.20200-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SEPT_VE_DISABLE check is required to keep the TD protected from VMM
attacks, but it makes harder to debug guest kernel bugs. If guest
touches unaccepted memory the TD will get terminated without any
traces on what has happened.

Relax the SEPT_VE_DISABLE check to warning on debug TD and panic() in
the #VE handler on EPT-violation on private memory. It will produce
useful backtrace.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 8ad04d101270..0e47846ff8ff 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -38,6 +38,7 @@
 #define VE_GET_PORT_NUM(e)	((e) >> 16)
 #define VE_IS_IO_STRING(e)	((e) & BIT(4))
 
+#define ATTR_DEBUG		BIT(0)
 #define ATTR_SEPT_VE_DISABLE	BIT(28)
 
 /* TDX Module call error codes */
@@ -207,8 +208,15 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
 	 * TD-private memory.  Only VMM-shared memory (MMIO) will #VE.
 	 */
 	td_attr = out.rdx;
-	if (!(td_attr & ATTR_SEPT_VE_DISABLE))
-		tdx_panic("TD misconfiguration: SEPT_VE_DISABLE attribute must be set.");
+	if (!(td_attr & ATTR_SEPT_VE_DISABLE)) {
+		const char *msg = "TD misconfiguration: SEPT_VE_DISABLE attribute must be set.";
+
+		/* Relax SEPT_VE_DISABLE check for debug TD. */
+		if (td_attr & ATTR_DEBUG)
+			pr_warn("%s\n", msg);
+		else
+			tdx_panic(msg);
+	}
 }
 
 /*
@@ -682,6 +690,8 @@ static int virt_exception_kernel(struct pt_regs *regs, struct ve_info *ve)
 	case EXIT_REASON_CPUID:
 		return handle_cpuid(regs, ve);
 	case EXIT_REASON_EPT_VIOLATION:
+		if (ve->gpa != cc_mkdec(ve->gpa))
+			panic("Unexpected EPT-violation on private memory.");
 		return handle_mmio(regs, ve);
 	case EXIT_REASON_IO_INSTRUCTION:
 		return handle_io(regs, ve);
-- 
2.38.0

