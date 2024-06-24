Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4513B297
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229332; cv=none; b=pYXFg93vAiOA1mCUJXdULInK8HrH19MG5WwDMgpHpGnh0cIwU7/RpXFp9ToSm5AOf+uJXUynb4DZ961rBDd/2ZT+SEAMGBiogt70vp+1x08ul9Hu9+yRD+OpJ1NMlzljwUON/HJ0WXkS8QC4zgVmHAIdipwgjI4k78W6WnUmnWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229332; c=relaxed/simple;
	bh=Evn3CciU5+MT/8KiO0RjooJvNArmoH7Yzw9c2SS6Lek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/sXCRDWW880LC+f4UhExizyyTjBCECY6K/FjGaWBWyc3Mmaud03qpd8jm3A7J1gq2k2dAyxNKn9x6cF2AduOdCNU3/oTzSPyMj/3fQUau15PFNy9HHEx5Hs04EOqNIp/LiEZhm2ZXwffbk+bLhZPmeuvEgbrvXwdvIsiwj6Pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=go9nHgtM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go9nHgtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719229332; x=1750765332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Evn3CciU5+MT/8KiO0RjooJvNArmoH7Yzw9c2SS6Lek=;
  b=go9nHgtMgmtGnpcFMFlQca7Q0xHdt2vSTHmKTr3CHEaTT0+CKnOKX1iA
   ACLr8Xa6ITi4/bhDGRaZqaGGUOcg+F7GLj9rGIp1FaTfBgArLHKroDChj
   Jezs2ucq1eVNcZhOuHDcySnFbpqDWvHfMICHGt5ymANHm7BmC3TipVstI
   VjfCSjsZyOoODzKarZKTBMSYQYQRwdxGPi9Oc6IKdj0Ngzi4oHYO2Xo8J
   rUC14pyoSMcZ+6E9uP5LOsiwtfzaEFKZgpFSiKB2xLTJHBbWI/oL/2ID/
   xYo4PRTQhDCykdvaSI++IOH/ovtF6eQ80CyED3BaJh8w/kDF5t6jXNp/u
   Q==;
X-CSE-ConnectionGUID: D9zMSskgQtixP7pPHj0S+w==
X-CSE-MsgGUID: FG5v1gFQQSqnJbaiOqUhLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="20008072"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="20008072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 04:42:10 -0700
X-CSE-ConnectionGUID: RcVLuAFdR8CNElsdiHLUjg==
X-CSE-MsgGUID: 4Miheq5kR6mdDqAMKCQ2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="74502457"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2024 04:42:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 5C84E206; Mon, 24 Jun 2024 14:42:05 +0300 (EEST)
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
Subject: [PATCHv5 2/4] x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
Date: Mon, 24 Jun 2024 14:41:47 +0300
Message-ID: <20240624114149.377492-3-kirill.shutemov@linux.intel.com>
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
index 64717a96a936..08ce488b54d0 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -193,7 +193,7 @@ static void __noreturn tdx_panic(const char *msg)
 		__tdx_hypercall(&args);
 }
 
-static void tdx_parse_tdinfo(u64 *cc_mask)
+static void tdx_setup(u64 *cc_mask)
 {
 	struct tdx_module_args args = {};
 	unsigned int gpa_width;
@@ -218,6 +218,9 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
 	gpa_width = args.rcx & GENMASK(5, 0);
 	*cc_mask = BIT_ULL(gpa_width - 1);
 
+	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
+	tdg_vm_wr(TDCS_NOTIFY_ENABLES, 0, -1ULL);
+
 	/*
 	 * The kernel can not handle #VE's when accessing normal kernel
 	 * memory.  Ensure that no #VE will be delivered for accesses to
@@ -964,11 +967,11 @@ void __init tdx_early_init(void)
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

