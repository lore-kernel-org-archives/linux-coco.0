Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E29D143867
	for <linux-coco@lists.linux.dev>; Mon,  6 May 2024 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997761; cv=none; b=lCcbsDmu2KkNThs4m6sJc5mCUCSuwZs9BMlvLt9B7AH15dOcE2NIBg4pygt3lUZrmSioZOP1W/6ANrTBwN0r6M5AN2xVib0SUqd/db+EkWkrdVcE5kq1cpy37/E+5uyM5BM8S/KyOLmJTE5UAVCnfaKaXD+LAoG0YwUbVtwngDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997761; c=relaxed/simple;
	bh=thgtjAPUlcHd9NBfHBwdSKUpdpm4qAYPqeeCKH2/TjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJBa8xUWA5OXC+ye5ou2gOVQ8EXeP9NWkstYig89wfbNbAFmjOFc1FMiPw28NIguNuWzDtO7nNhjMWv6VjTPBQ+n6c9i4ujLJk2N9m9JOpXY0ilSdK+G48SFFsrrtk4YfOhfJlJcEj0uoPUewbiY772vtiyWAWU4ec5GTqq5iOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5lWGvX6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5lWGvX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714997760; x=1746533760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=thgtjAPUlcHd9NBfHBwdSKUpdpm4qAYPqeeCKH2/TjY=;
  b=C5lWGvX6D+Nm1KWR/VJQn4imniQbHWX+u4ipu5MFHzt7BbN2rYyn7x1c
   S0JTL2/HvP7LMomdPe/ibDrdmx4E0d55xx4ussCPZX4yB22MaBbfgEiDG
   ye4Z47/CBf9zxKV6QtK5OynZ4helWAWOBsJrh9iJuY8IUqEaUF/yEGvTj
   h5XN93dkPSOKRcZmRWJ2+Ou6yvIbw68/x/UqDnE6tjoFoPIpCizGV9usC
   0wKGXhWCz9ogEcUyRGSVnlWtHsWAmd2fkmKPImiuVbscMP51E2FiHlQ6R
   emsKQasW0XWNF61H3tLmCAMAF9bFbwzzB04XS8Zl3zB6nFMyd0f9F7WxU
   A==;
X-CSE-ConnectionGUID: CYW0BxvGQKCL+fahM9sAhQ==
X-CSE-MsgGUID: YgWCLwJeS4CTtfBP0aSEMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="11271854"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="11271854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:15:58 -0700
X-CSE-ConnectionGUID: OCeGGIsWT0aQrv1fu/2uwg==
X-CSE-MsgGUID: +V2NucTLRbG9e9qKnnRqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28140603"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 05:15:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E931F2DC; Mon, 06 May 2024 15:15:54 +0300 (EEST)
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
	Kai Huang <kai.huang@intel.com>
Subject: [PATCHv3 2/4] x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
Date: Mon,  6 May 2024 15:15:51 +0300
Message-ID: <20240506121553.3824346-3-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506121553.3824346-1-kirill.shutemov@linux.intel.com>
References: <20240506121553.3824346-1-kirill.shutemov@linux.intel.com>
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
---
 arch/x86/coco/tdx/tdx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index b926221f1264..964149d3be5e 100644
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
@@ -928,11 +931,11 @@ void __init tdx_early_init(void)
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

