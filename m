Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2033E5EDB
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223087; cv=none; b=tF4sW8DYWWsNtyfTPdMohbIkSkNgzJ60eB22mANRlZzv+injlbogFPmTkwMb4YXrlF2CzLLUHctMBNd7EE7xJZytcvl663KiSFBVLUPxW7FjhIP3/Ph/36j27HkkOzYtpFITp2YjHKP9uEjsUpZWmdw801UbxyAbzPIhwOfgnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223087; c=relaxed/simple;
	bh=aOLJYCqiStgOVgGJWcOTh3xf1AAjNf63OcXCuuBYa/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRT0AMIn+Z3pepOXlRbqaFtfXTnuBAM26/5NyfGG0vPF/IQ3vxiI1bX8iFl+UsESLcY9NZ9w5dbOQNcMzluA8GL6uSWou/r3yZWQ0bizgnxGU+GjDccXFxxBRyuBV67H3RsX2IBZc+GMGnMbVu6Xnte0KizCrMU8PzIP/P07fzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnBKjVx1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnBKjVx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223086; x=1821759086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aOLJYCqiStgOVgGJWcOTh3xf1AAjNf63OcXCuuBYa/U=;
  b=cnBKjVx1U8gQcAuawqdfjBRW7mSgLx+Ihx1TtmRjl3iEY+uXek0aqHMm
   LfUYGI27lh62Yc2vq8suEhci9ltf3PR2szLnId2iri25QY2fHlW4VjO1J
   gWhLlp/uEulmxSYrdfiS7bWpL4DqjOXYI7N3pKn+6qoOtUvCs4WVsTLzc
   ka/Wce4ItgLJS/F2QbYdqQ5hCpj2/zwjB01VGdm10NAj8oGLHC+AqKjgs
   Kg8p2stiHfATJxv7/4iz75fbQCMsh9xzWdW1jjDTSTshq3VDLbbxAwP6/
   uBOiQAjBABL3AavJVMX2AvCgyKakUd+MGJRihay/R+gMSNpyQILN4Ai2q
   A==;
X-CSE-ConnectionGUID: 73co0DqpT4qCf0c/y5fCcQ==
X-CSE-MsgGUID: +JMz5sfFR/uGBi2GZgRNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002513"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002513"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:26 -0700
X-CSE-ConnectionGUID: TOqSnP9PQUa4j/83KVbUUg==
X-CSE-MsgGUID: 6Z6uerqqS4S9+jROsn4AjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009391"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:22 -0700
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
Subject: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call wrapper for TDX Connect
Date: Thu, 24 Sep 2026 12:10:25 +0800
Message-ID: <20260924041032.1096569-9-zhenzhong.duan@intel.com>
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

TDG.MMIO.ACCEPT verifies and accepts a pending private MMIO range for
a trusted device.

The MMIO range to be accepted can be a sub-range of the MMIO ranges
originally defined in the Device Interface Report. Because the TDX
module caches these ranges from the Device Interface Report, the guest
does not need to pass the explicit physical start and end addresses of
the MMIO range. Instead, it only needs to provide the target MMIO
range index, the offset within that range, and the size to be accepted.

Translate TDX module return codes into Linux errno values.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdx_connect.c   | 38 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  1 +
 3 files changed, 40 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
index 1409b1a30cc6..09a92fe23357 100644
--- a/arch/x86/coco/tdx/tdx_connect.c
+++ b/arch/x86/coco/tdx/tdx_connect.c
@@ -71,3 +71,41 @@ int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value)
 	return tdx_mcall_tdi_to_errno(ret);
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_read, "tdx-guest");
+
+/**
+ * tdx_mcall_mmio_accept() - Accept a pending private MMIO mapping of a
+ *                           Trust Device Interface (TDI) instance
+ * @func_id: Function identifier specifying the TDI instance
+ * @index: MMIO range index from the Device Interface Report
+ * @pg_offset: Range offset to start accepting the subrange from, in pages
+ * @page_cnt: Count of pages to accept
+ * @gpa: GPA base address the subrange mapped to
+ *
+ * Verify and accept a pending private MMIO mapping. Upon success, the MMIO
+ * pages are set as mapped in the TDX module.
+ *
+ * Return 0 on success, -EINVAL for unaligned GPA, -ENXIO for invalid operands,
+ * -EBUSY for busy operation, -ENODEV for TDI not present or invalid metadata,
+ * or -EIO on other TDCALL failures.
+ *
+ */
+int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa)
+{
+	struct tdx_module_args args = {
+		.rcx = gpa | TDX_PS_4K,
+		.rdx = index,
+		.r8 = func_id,
+		.r9 = (u64)pg_offset << 32 | page_cnt,
+	};
+	u64 ret;
+
+	if (!IS_ALIGNED(gpa, PAGE_SIZE))
+		return -EINVAL;
+
+	ret = __tdcall_ret(TDG_MMIO_ACCEPT, &args);
+	if (!ret)
+		return 0;
+
+	return tdx_mcall_tdi_to_errno(ret);
+}
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_mmio_accept, "tdx-guest");
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 499103f7a01b..ce80fb2116fb 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -21,6 +21,7 @@
 #define TDG_VM_RD			7
 #define TDG_VM_WR			8
 #define TDG_TDI_READ			67
+#define TDG_MMIO_ACCEPT			71
 
 /* TDX TD attributes */
 #define TDX_TD_ATTR_DEBUG_BIT		0
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 71cd701d346f..e6493f3bc0d1 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -155,6 +155,7 @@ struct tdcm_rsp_check_teeio_supp {
 
 u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
 int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
+int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa);
 #endif
 
 void __init tdx_dump_attributes(u64 td_attr);
-- 
2.52.0

