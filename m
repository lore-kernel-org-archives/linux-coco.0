Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8566381E92
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223110; cv=none; b=CwaTojdF62mwDLQwSMLbtbBMWBJqwppznm9ECW4vqgjgli2dFOnUSNCYXJ+uPLnzekwcy1x638Syk96BMtijYLpDdoT687bf4YelxQVX9cfukeN50EH7Jo+YCrRJKMwkucLjF/3PDVRrF1fDb2kBVjF7x8pFHvF01xBzImsuMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223110; c=relaxed/simple;
	bh=pPKq92HbRkxKZZOuHzLkxeV2WmkDXvV4+1Sz1TqyCUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBJO7s9PESmaovYq4JzPZtsTADRuSDuwE2OfOyNW8mtiOI+042mwd+OKJMf1ugTHvQOZYd3evL6CysiSXY+Ld+kgyA2rcdU7Lz3uy78JsRTL7Lq2gZC3zhSrekSwPWxXodJF51C4kmbp7wVy5hXA8DMd44N5zZwbA8qzuXTex4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVbXLzrP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVbXLzrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223109; x=1821759109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pPKq92HbRkxKZZOuHzLkxeV2WmkDXvV4+1Sz1TqyCUM=;
  b=FVbXLzrP+VRp0iSGapZYe2m55zrbSLQL73h4nxI+lMn2N4FvwXPvoq0W
   nTj8lF77gsP0VeDgWFYJvm6WRJCnCn1vNkXcMz3fbbrK6UE16uvM40ZbK
   zx6aevgSYVbO4qucRQ3Beni1SFqgkHaLO660DOKloion6mR4I0DCFMoNU
   V9/KLdI6QVErgI6AgBcdjflMGMUWt6euJPLZfSd/2nUVqoy3cfG0KbycG
   K/vLNjjDABGgSBS8raveVbXXTe6urDl2FCQrjobFjd7reGnMjjaLWSGy+
   jPtRULCwkjKpa54O3LZWHJLcsaKeF5DOwuZQuvqLwh8xCQPFfhGad8sda
   w==;
X-CSE-ConnectionGUID: U/gtiSAVST+n83ST2uJ1Hg==
X-CSE-MsgGUID: RJT+efb7Q9Sfh5yHP0oDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002548"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002548"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:48 -0700
X-CSE-ConnectionGUID: Ueufu4a7SyW1k5Z+Xm56Kw==
X-CSE-MsgGUID: 4vh1aFv3RV6UapMnkpgs5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009413"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:37 -0700
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
Subject: [RFC PATCH 11/15] x86/tdx: Add TDG.TDI.START module call wrapper for TDX Connect
Date: Thu, 24 Sep 2026 12:10:28 +0800
Message-ID: <20260924041032.1096569-12-zhenzhong.duan@intel.com>
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

Add tdx_mcall_tdi_start() to signal that the TD is ready to start a TDI
instance. After a successful module call, the TDX module authorizes the
host to start the TDI with the TDH.TDI.START seamcall.

Translate TDX module return codes into Linux errno values.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdx_connect.c   | 27 +++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  1 +
 3 files changed, 29 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
index 09a92fe23357..3ef10b1df401 100644
--- a/arch/x86/coco/tdx/tdx_connect.c
+++ b/arch/x86/coco/tdx/tdx_connect.c
@@ -109,3 +109,30 @@ int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, p
 	return tdx_mcall_tdi_to_errno(ret);
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_mmio_accept, "tdx-guest");
+
+/**
+ * tdx_mcall_tdi_start() - Authorize TDX module to start the TDI instance
+ * @func_id: Function identifier specifying the TDI instance
+ * @exp_bind_session: Expected bind session ID
+ *
+ * Signal TDX module that TD is ready to start TDI. Upon success, TDX module
+ * allows host to initiate TDI via TDH.TDI.START seamcall.
+ *
+ * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
+ * -ENODEV for TDI not present or invalid metadata, or -EIO on other TDCALL failures.
+ */
+int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session)
+{
+	struct tdx_module_args args = {
+		.rcx = func_id,
+		.rdx = exp_bind_session,
+	};
+	u64 ret;
+
+	ret = __tdcall(TDG_TDI_START, &args);
+	if (!ret)
+		return 0;
+
+	return tdx_mcall_tdi_to_errno(ret);
+}
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_start, "tdx-guest");
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index ce80fb2116fb..72520f09ef3f 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -21,6 +21,7 @@
 #define TDG_VM_RD			7
 #define TDG_VM_WR			8
 #define TDG_TDI_READ			67
+#define TDG_TDI_START			68
 #define TDG_MMIO_ACCEPT			71
 
 /* TDX TD attributes */
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index e6493f3bc0d1..787b3039ef5a 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -156,6 +156,7 @@ struct tdcm_rsp_check_teeio_supp {
 u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
 int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
 int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa);
+int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session);
 #endif
 
 void __init tdx_dump_attributes(u64 td_attr);
-- 
2.52.0

