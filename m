Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214519597F
	for <linux-coco@lists.linux.dev>; Fri,  9 Aug 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208974; cv=none; b=eaGv/jezFe+ONmcJLoj74hSfkRU720rCo+IeoWrqJw1EOR/KBvHPYh8Lxfua/sAAJiznyekatPG14zlvaxwJJPxJkwxEoTAQEHE3hOyi4HyTnRrmZj8my0buASVpD+Q5ypTSx04jJQ4R96fzaVKGN8+Yfk09/KO7evkB6jr/mPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208974; c=relaxed/simple;
	bh=Evn3CciU5+MT/8KiO0RjooJvNArmoH7Yzw9c2SS6Lek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee4188rXob6xMGSK7o4lpHu7HXNY/7cR5y3wEyC6ZXtkf8UTrjGIem6xfyH+SHvpzgS9vBArQYU60kShb/V78fLTw5HknuQnfnOs1FoMgQrR6OVjqpP8CepgZ3WnB2q9dkC7iSqf3uMmxv1KHE60tuutokcNPvrJgKnTGcEPKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3rSPqzI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3rSPqzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723208973; x=1754744973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Evn3CciU5+MT/8KiO0RjooJvNArmoH7Yzw9c2SS6Lek=;
  b=d3rSPqzIRpfPW/5x/v3zrfbU09ASjqLDEQNPqp+LFYkbs/fAac1VmMlb
   fZAPwzdqclvCNaLPScp9RajbJNx+UviPPY1eukBV2+VhYPi6M4AvMCsjB
   goKs8nVYg+va5JmvKDl7aI1l+C6FStchaAztGoCJZdR7XrMJ+sCHy14vs
   cATDgYPL8uGDiXQf2Rz4uFoLd/Hc8iVrMbKYapml9j0u6/sH3eY/U9DzV
   QP6Qxn8nsEx7Ly/1HRw5gnw3MZNDLTQSlAxLhlvOwffRoYz7+LDQbQpVI
   NtBZFmrmSqqqOYMAqaYhdoA1KH77r+ctYrYvqlahqCUHpeOTJgl3Buk0Y
   Q==;
X-CSE-ConnectionGUID: XzqUc2WlRnWeDmr32okUgA==
X-CSE-MsgGUID: u7rGGwpMRVmlbyBjw3/OXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="46788182"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="46788182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:09:29 -0700
X-CSE-ConnectionGUID: D4L7+umYTTKB/hHa6k4koQ==
X-CSE-MsgGUID: QTASQNbCTRaoAEGAbUwmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57651682"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2024 06:09:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 17B169C0; Fri, 09 Aug 2024 16:09:25 +0300 (EEST)
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
Subject: [PATCHv5, REBASED 2/4] x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
Date: Fri,  9 Aug 2024 16:09:21 +0300
Message-ID: <20240809130923.3893765-3-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809130923.3893765-1-kirill.shutemov@linux.intel.com>
References: <20240809130923.3893765-1-kirill.shutemov@linux.intel.com>
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

