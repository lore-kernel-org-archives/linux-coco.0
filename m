Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F032262B
	for <linux-coco@lists.linux.dev>; Sun, 12 May 2024 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715516526; cv=none; b=ELSc5/G3QSHZTVb/81/i2cAPLZKQmJXwj4LRLoR29uAg0uBEvx/j70h2SJBi9dM3TcdqkhiB4AEgOokSC4UCI5u+mwWUzBmInifeY9kAd50zkgTejb7zgTKi5yaIu5BlF2L7kIwCPtY4J03BMFO95/LfA08IjkmlPf3lfad/76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715516526; c=relaxed/simple;
	bh=Nn9Mpy/OuO4rHK6mkJg69gx7p20tgwscyOZVuw2SQfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SL6Fzssu11wrJKMGX/odDLqqxo5JwZdaa6ri6bfe0h0TuyBNUiO0LuGhCleS4yfYGx7slEcjX2DbVDlNv5nROLn/ch12dG85b/J/TGgCqR+58DfSrnGl1ASX0CV5p6Kqbep5HXVadW/Q0M8ZgmdzsiNMtZovGgdmvet3ZrhjGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8Ud6iFy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8Ud6iFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715516524; x=1747052524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nn9Mpy/OuO4rHK6mkJg69gx7p20tgwscyOZVuw2SQfc=;
  b=R8Ud6iFy3/yeZGVz5t8x1reKaGS6ou8mfcRcmaf6qQoOpTuDomWc6Q13
   PLjqjbVQ+0I7onG1Rhiffc0R6FUaNkr9ez7RPowIfUYOF+yN1PBLKLph1
   jMEidgS6+iNGurBJMclwm4jungNDsnKgZJdh68RP3Rvq8qaGlNwM58vTt
   iWGFBlFk+a4ig3jFIfFkdzVhgrok1PV/k37RoR5Iz1+AuEF9MLP0V6PoT
   lE2UOjva0dJydVPDuuC550OVpw8JHqC39En139uF/lD35SVn/dhqsBzvr
   2gqTwQuhX11fszn+aopju7mcUL0Q7NBbSMlH0M6reGsdpHTXjFD7QYRlQ
   g==;
X-CSE-ConnectionGUID: OdoE2kGYS0GVTr+5viVDOQ==
X-CSE-MsgGUID: AbBi9IMmTSelsu67ibUGNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11397029"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11397029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 05:22:02 -0700
X-CSE-ConnectionGUID: s/CbvQF4Qu6sSHsOYxqWGQ==
X-CSE-MsgGUID: 3pzUhakeTQe3qFGM5neuFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="67579704"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 May 2024 05:21:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 24AF92E6; Sun, 12 May 2024 15:21:58 +0300 (EEST)
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
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	stable@vger.kernel.org
Subject: [PATCHv4 2/4] x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
Date: Sun, 12 May 2024 15:21:52 +0300
Message-ID: <20240512122154.2655269-3-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512122154.2655269-1-kirill.shutemov@linux.intel.com>
References: <20240512122154.2655269-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename tdx_parse_tdinfo() to tdx_setup() and move setting NOTIFY_ENABLES
there.

The function will be extended to adjust TD configuration.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Cc: stable@vger.kernel.org
---
 arch/x86/coco/tdx/tdx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 4bb786dcd6b4..1ff571cb9177 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -179,7 +179,7 @@ static void __noreturn tdx_panic(const char *msg)
 		__tdx_hypercall(&args);
 }
 
-static void tdx_parse_tdinfo(u64 *cc_mask)
+static void tdx_setup(u64 *cc_mask)
 {
 	struct tdx_module_args args = {};
 	unsigned int gpa_width;
@@ -204,6 +204,9 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
 	gpa_width = args.rcx & GENMASK(5, 0);
 	*cc_mask = BIT_ULL(gpa_width - 1);
 
+	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
+	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
+
 	/*
 	 * The kernel can not handle #VE's when accessing normal kernel
 	 * memory.  Ensure that no #VE will be delivered for accesses to
@@ -927,11 +930,11 @@ void __init tdx_early_init(void)
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
 	cc_vendor = CC_VENDOR_INTEL;
-	tdx_parse_tdinfo(&cc_mask);
-	cc_set_mask(cc_mask);
 
-	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
-	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
+	/* Configure the TD */
+	tdx_setup(&cc_mask);
+
+	cc_set_mask(cc_mask);
 
 	/*
 	 * All bits above GPA width are reserved and kernel treats shared bit
-- 
2.43.0

