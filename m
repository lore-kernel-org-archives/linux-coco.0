Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2327613AA39
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229332; cv=none; b=YgUyqLomc7+xROfeX9aSNHXtqz/X+oKtv3pWSnMYrbVQJuX2tAfQXdAzM3lK8DNavJ/tC6cMJYjnFpygJo+QxZEEGHRW4jpL5IMbldLytyJYkV/TafXxyyS1XFXCfIhZrkbnsoGeRhcxc5v5pceYf/lx3DbNB/TQCVw+DXaKsJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229332; c=relaxed/simple;
	bh=Nbsl3p9OLbL48cTueVzxumNtwMa9kobgVhE46dIs0EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpoNQ5LoRsZxqFfJ+c2fv4H/lNMDa4gYEgYMv2Nhq0lC92Tw6v7yqq8vaPAmbx0O72oiR4usXUNTZlxsI3Cc+dZnbMYyU1UM/o9yO0RhT0WFvRJZv2coK0ZUcbAYnFl7ApMOuACZAgpI1q1ZCMm9VfJQF/TarXCHS4fZJXCRLqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFQfUTTV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFQfUTTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719229331; x=1750765331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nbsl3p9OLbL48cTueVzxumNtwMa9kobgVhE46dIs0EU=;
  b=cFQfUTTV8guzsXxW5FAZvE85Emrl8OFAPHAZYiTCFszwfb6eYPPDTHaE
   BVNtI0/y26Csp61VScUmUC1SG3N40XuC0pjeMt2Q1n81J7KjfcWhFTseM
   LdhL9NYfLuo75IW/lV+OmQc/Gs6w6Cth9aljZ9ciOVq8I23JhljPFXxOD
   2wgQSoD2q+67aVqvgZ0tMkU9oAJvMqwBgO9dzJJvhKUJtoGUsa2N8ApZB
   rJN9SujJjtWLnXvYgqH5TwyNuAHIT/Qa8uRHoZ+WZ1xBff2W6zJzrSg0m
   /xLkhFxSshT/fPHQ7sdkCPPJd//cYBmefypJt1SpM7VPfDyi0Kn1Dekto
   g==;
X-CSE-ConnectionGUID: gsT8ur/XSWG4JVZEa7LHHQ==
X-CSE-MsgGUID: viMLbCwrR9mhhjywIS3kgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="20008066"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="20008066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 04:42:10 -0700
X-CSE-ConnectionGUID: YqMPaDEYRR2oV68GG2oC4w==
X-CSE-MsgGUID: 3tULNehySuWW5nz5eB4Seg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="74502454"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2024 04:42:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 52D0D122; Mon, 24 Jun 2024 14:42:05 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kai Huang <kai.huang@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCHv5 1/4] x86/tdx: Introduce wrappers to read and write TD metadata
Date: Mon, 24 Jun 2024 14:41:46 +0300
Message-ID: <20240624114149.377492-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
References: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDG_VM_WR TDCALL is used to ask the TDX module to change some
TD-specific VM configuration. There is currently only one user in the
kernel of this TDCALL leaf.  More will be added shortly.

Refactor to make way for more users of TDG_VM_WR who will need to modify
other TD configuration values.

Add a wrapper for the TDG_VM_RD TDCALL that requests TD-specific
metadata from the TDX module. There are currently no users for
TDG_VM_RD. Mark it as __maybe_unused until the first user appears.

This is preparation for enumeration and enabling optional TD features.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 arch/x86/coco/tdx/tdx.c           | 32 ++++++++++++++++++++++++++-----
 arch/x86/include/asm/shared/tdx.h |  1 +
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 078e2bac2553..64717a96a936 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -77,6 +77,32 @@ static inline void tdcall(u64 fn, struct tdx_module_args *args)
 		panic("TDCALL %lld failed (Buggy TDX module!)\n", fn);
 }
 
+/* Read TD-scoped metadata */
+static inline u64 __maybe_unused tdg_vm_rd(u64 field, u64 *value)
+{
+	struct tdx_module_args args = {
+		.rdx = field,
+	};
+	u64 ret;
+
+	ret = __tdcall_ret(TDG_VM_RD, &args);
+	*value = args.r8;
+
+	return ret;
+}
+
+/* Write TD-scoped metadata */
+static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
+{
+	struct tdx_module_args args = {
+		.rdx = field,
+		.r8 = value,
+		.r9 = mask,
+	};
+
+	return __tdcall(TDG_VM_WR, &args);
+}
+
 /**
  * tdx_mcall_get_report0() - Wrapper to get TDREPORT0 (a.k.a. TDREPORT
  *                           subtype 0) using TDG.MR.REPORT TDCALL.
@@ -924,10 +950,6 @@ static void tdx_kexec_finish(void)
 
 void __init tdx_early_init(void)
 {
-	struct tdx_module_args args = {
-		.rdx = TDCS_NOTIFY_ENABLES,
-		.r9 = -1ULL,
-	};
 	u64 cc_mask;
 	u32 eax, sig[3];
 
@@ -946,7 +968,7 @@ void __init tdx_early_init(void)
 	cc_set_mask(cc_mask);
 
 	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
-	tdcall(TDG_VM_WR, &args);
+	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
 
 	/*
 	 * All bits above GPA width are reserved and kernel treats shared bit
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index fdfd41511b02..7e12cfa28bec 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -16,6 +16,7 @@
 #define TDG_VP_VEINFO_GET		3
 #define TDG_MR_REPORT			4
 #define TDG_MEM_PAGE_ACCEPT		6
+#define TDG_VM_RD			7
 #define TDG_VM_WR			8
 
 /* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
-- 
2.43.0

