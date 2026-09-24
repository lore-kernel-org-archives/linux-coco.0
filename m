Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80B175A8D
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223115; cv=none; b=nRMR+oVEqiHZuBRRKZ+pi/MiZ2ClGZkveXZF1MkNvrfGoZPpnoyVnqPP5IK5O6CuAQvdydACuwtLifGWHEJFRtdc1XbCuxWZRb0B/t/48VnJEj17T3RVVXAaYQareTuYoejeZlshKgRBm4SWsRs4uNYbxW219w/o9wVMU6+8jM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223115; c=relaxed/simple;
	bh=XY+nQdyJ+KyuA8zd1GBySyql0bYa0v2fGuh6+8Hbmos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0tC04CcT7zsFMhSzxsnMl3QOVTYA7MPHn3m+e6XLrOvWlrZzofrcFJziH5kRCVGTLKEPwBDp6ULazOhW3X8Mr9wkSO3UaFFPuNMISlLOOLlLixCF6q+YUiZHp1QX77yOU3N8GNQdh6wkCcUTDfB3hDCa8mZjw2BCvJ3vBUpUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiVkh65f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiVkh65f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223113; x=1821759113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XY+nQdyJ+KyuA8zd1GBySyql0bYa0v2fGuh6+8Hbmos=;
  b=SiVkh65faMP7VHUPozNpZZ2owX+ehEFc3PPpOKVrG84E7awybnbvsO39
   6mSruXXBMg4hBZC6csrnPFHgE6Fb40Dgb6aiI4F0GQYcys5DGrLtjXgFY
   fAeL41Bz7p8EKel+/KcPvwsz017r0F0KLhdODcq2Q5r6Jhoo4r0EgEi2p
   R4AICfKnELBWK/9QTSTyTh5PZZzJ/6JpA+BkWRRZvbEQMGesVvet0Z3A+
   /0H4BDirHJDq0Db7z0jnASWPKT99EWusHqTMNBVVSG6AVVRZBSSqB9N21
   MPNQqu6jVYW6d/q34+1/5O7CDNP7BnwZ0W97ZgDF0k7LX9k44yLYsc5YQ
   A==;
X-CSE-ConnectionGUID: bE422sEpQjSUxpxRpteN4A==
X-CSE-MsgGUID: Ags9QjkSTByMXecbtw71uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002570"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002570"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:52 -0700
X-CSE-ConnectionGUID: 4JCttB7tR8+Y1s1ofoKjKA==
X-CSE-MsgGUID: Gx7bc6xfQ9CmJonBLlat0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009482"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:48 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@intel.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	jgg@nvidia.com,
	nicolinc@nvidia.com,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	vishal.l.verma@intel.com,
	xiaoyao.li@intel.com,
	kevin.tian@intel.com,
	chao.p.peng@intel.com
Subject: [RFC PATCH 13/15] x86/tdx: Add __tdcall_saved() helper
Date: Thu, 24 Sep 2026 12:10:30 +0800
Message-ID: <20260924041032.1096569-14-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX Connect ABI defines TDCALL leaves that use registers up to r15
in struct tdx_module_args as input, without returning output arguments.

Add __tdcall_saved() for these leaves.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdcall.S        | 17 +++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
index 52d9786da308..1dca01909dee 100644
--- a/arch/x86/coco/tdx/tdcall.S
+++ b/arch/x86/coco/tdx/tdcall.S
@@ -44,6 +44,23 @@ SYM_FUNC_START(__tdcall_ret)
 	TDX_MODULE_CALL host=0 ret=1
 SYM_FUNC_END(__tdcall_ret)
 
+/*
+ * __tdcall_saved() - Used by TDX guests to request services from the TDX
+ * module (does not include VMM services) using TDCALL instruction.
+ *
+ * __tdcall_saved() function ABI:
+ *
+ * @fn   (RDI)	- TDCALL Leaf ID, moved to RAX
+ * @args (RSI)	- struct tdx_module_args for input
+ *
+ * All registers in @args are used as input registers.
+ *
+ * Return status of TDCALL via RAX.
+ */
+SYM_FUNC_START(__tdcall_saved)
+	TDX_MODULE_CALL host=0 saved=1
+SYM_FUNC_END(__tdcall_saved)
+
 /*
  * __tdcall_saved_ret() - Used by TDX guests to request services from the
  * TDX module (including VMM services) using TDCALL instruction, with
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 72520f09ef3f..90f2842f4253 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -153,6 +153,7 @@ struct tdx_module_args {
 /* Used to communicate with the TDX module */
 u64 __tdcall(u64 fn, struct tdx_module_args *args);
 u64 __tdcall_ret(u64 fn, struct tdx_module_args *args);
+u64 __tdcall_saved(u64 fn, struct tdx_module_args *args);
 u64 __tdcall_saved_ret(u64 fn, struct tdx_module_args *args);
 
 /* Used to request services from the VMM */
-- 
2.52.0

