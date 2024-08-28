Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37571158DDC
	for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837717; cv=none; b=gtdNmAoDA8EGYoI0EUxnJU2FTIJPv44lJc/Hrsja+kNOzSud7WAGdCRaTtATixULGko85VfjzqjXJhpeUb7ZvjoGcNJ88d8+HOb/KHynVHrKnBl0b0zxoW5txkfHmxg9zTL2q+NK2b/bbnLhy+w40sglkxrBl9Af3s14ZgPb5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837717; c=relaxed/simple;
	bh=jXkbf1bN1JjFULaCZowJliy7FvNZ7PnLXWSqm/seso8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuCdyewzsv3GciVljF50Pu9jq6339J5V4Z2YKVgDgjHtJUF4YgMg/ZqyQgRlECHlpqpkpAWa1gt46tgYOjyQNF6qhQGR0U2zcT/KeMtVkk/QLo7hL4DoS6qQPLgjCPfclbnzosaW6EJzlSDIsV/QlAQZun2pSPBl5qXEHlfTEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9fNKTJr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9fNKTJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724837716; x=1756373716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jXkbf1bN1JjFULaCZowJliy7FvNZ7PnLXWSqm/seso8=;
  b=C9fNKTJruu8LkHqXdUunXIZsn/lWeAaJhUSLXMtobudhU7rb3qPtitpH
   ANtCXYNLPy+K/6TY9x+7IZSc8qKu59tjnLrmgHwsa+IZE3nIVMkBIJJAa
   2mPrew5kHNCjkyeFcuQOk2tMI85XUOaSdTy7DAmEClYBOt2pI33uvjmDr
   xk2nbDUAnGVdq0A33EdUsMljX9OuWHZgOIiQsDs/zZXlmy5gL0HBEX6i2
   +Jqd+6nEtE1b5wcAc7KoW2PRNGCqblmY5+R+YlWePELgTboD9ah7ZuWjY
   G3/0XY/oCevhrLnA7zBJVFHiNh6TAMrSPbEH7koLa8BryYrgFIacWCHDu
   Q==;
X-CSE-ConnectionGUID: aIhxI3/zR6WPlOBUC8C+rA==
X-CSE-MsgGUID: mTqYSSJYQLCRyUYDgDLP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27123864"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="27123864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:35:15 -0700
X-CSE-ConnectionGUID: NLkYbWrKSumnDYbdXdcHLQ==
X-CSE-MsgGUID: zL+fveQ7TaeFooruZG2Qjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="93879099"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2024 02:35:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 7067B118; Wed, 28 Aug 2024 12:35:10 +0300 (EEST)
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
Subject: [PATCHv6 1/4] x86/tdx: Introduce wrappers to read and write TD metadata
Date: Wed, 28 Aug 2024 12:35:02 +0300
Message-ID: <20240828093505.2359947-2-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828093505.2359947-1-kirill.shutemov@linux.intel.com>
References: <20240828093505.2359947-1-kirill.shutemov@linux.intel.com>
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
2.45.2

