Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13E732A3D7
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223062; cv=none; b=ZkVGZQ7qD/IK9TPT8VCS5PEcPMD53GZLWvC2r8KJsm8XCS5wZkukpP5kn4NnU/pxbduADZU9nCsy4OdViFqv0a2fx57uyegCqoJarLNrYnybubxUYxhru/3hicgtTXtP0FReIEnl+4VrgDE6P0YmGixSmNcHE/qqB0f/Ue0+t98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223062; c=relaxed/simple;
	bh=4sx7o0haKcc2O3BFsbD7nGJ25YTyf25BqpiUaHrC46I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGjOio3Nwsr289HIBSSEvJJYOLr42VK+i60F9ZDXFNyHqQuTgXze0ehGM5sqHgWij1K5SjcZ8+l/64SfyTMgOB6sO1iL9E0z+kEHv6kMEWvDtUmYnK5TYTD18JYrInAiDkxtQ2mDW6dKVzm9pRm+0m1iqwXf9f7FlgOM284bi7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVEkPKd5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVEkPKd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223061; x=1821759061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4sx7o0haKcc2O3BFsbD7nGJ25YTyf25BqpiUaHrC46I=;
  b=WVEkPKd5c+m5A24mM412mluuwtV2BbzqNiXw/tsiuUQJPoulYXnLQOea
   jqUq/RPkciRuDrSENUj7FkonBwUcysNFb/HvK+SQ2A3yqLwWBHaFErrsy
   UXPVHLkomz34b/3ik5NOC56gMdGEHO74I03+6+sEMQUor1ab+wxdWrlw4
   6lCkIppoFL/qLZRtpsJHuWwsaDuuhAAylNNbcxpmvtJSm+RLJPOQzo9SY
   Vl8QJLKgJnIk5IWbsznf8UKkcEFVQ8roUbUDFVu6bGGLDauxMBEdXt1u/
   ikcYFzpnM5iRNQ1kZrnE63br4hS/9EbxsnbZV9Pts8FbEEwkLP2cFEL/W
   A==;
X-CSE-ConnectionGUID: 17PSUZLzTyu8PpRyJX5fxA==
X-CSE-MsgGUID: M5iCUbzmTCeuyBttQJDL7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002461"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002461"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:00 -0700
X-CSE-ConnectionGUID: vwAHavzmSvOmiyzEXul6qg==
X-CSE-MsgGUID: rc9UK2VmRjuGvfZliS6z5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009348"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:56 -0700
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
Subject: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for TDX Connect
Date: Thu, 24 Sep 2026 12:10:20 +0800
Message-ID: <20260924041032.1096569-4-zhenzhong.duan@intel.com>
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

Introduce wrapper tdx_mcall_tdi_read() to provide tdx-guest driver with a
standard interface for querying specific metadata fields from a target
Trust Device Interface Control Structure (TDI_CS).

Explicitly mapping architectural TDX error codes into Linux POSIX errno
with two helpers, introducing tdx_mcall_to_errno() to handle general
module calls, while introducing tdx_mcall_tdi_to_errno() specifically for
TDI related module calls.

Unlike TDG.VP.VMCALL based hypercalls which communicate with the host,
TDG.TDI.RD is a module call (mcall) that communicates directly with the
TDX module. This distinction is reflected in the tdx_mcall_ naming
prefix, as opposed to tdx_hcall_ used for host-directed hypercalls.

Note that while host-bound hypercalls (such as tdx_hcall_tdcm()) pass a
platform-specific Device Identifier (devid), the func_id parameter used
here is defined by the TDISP standard (refer to Section 11.2 "TDISP
rules"). Although these values result in the same underlying bit format
when the PCI segment is zero, they represent separate structural
abstractions in their respective specifications.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/tdx.c           |  5 ----
 arch/x86/coco/tdx/tdx_connect.c   | 41 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        | 20 +++++++++++++++
 4 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 22cc177a6db4..c3db2451c078 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -34,11 +34,6 @@
 #define VE_GET_PORT_NUM(e)	((e) >> 16)
 #define VE_IS_IO_STRING(e)	((e) & BIT(4))
 
-/* TDX Module call error codes */
-#define TDCALL_RETURN_CODE(a)	((a) >> 32)
-#define TDCALL_INVALID_OPERAND	0xc0000100
-#define TDCALL_OPERAND_BUSY	0x80000200
-
 #define TDREPORT_SUBTYPE_0	0
 
 static atomic_long_t nr_shared;
diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
index 0c6ca650771a..1409b1a30cc6 100644
--- a/arch/x86/coco/tdx/tdx_connect.c
+++ b/arch/x86/coco/tdx/tdx_connect.c
@@ -8,6 +8,17 @@
 #include <asm/tdx.h>
 #include <linux/mm.h>
 
+static inline int tdx_mcall_tdi_to_errno(u64 ret)
+{
+	switch (TDCALL_RETURN_CODE(ret)) {
+	case TDCALL_TDI_NOT_PRESENT:
+	case TDCALL_TDI_INVALID_METADATA:
+		return -ENODEV;
+	default:
+		return tdx_mcall_to_errno(ret);
+	}
+}
+
 /*
  * tdx_hcall_tdcm - Send a TDCM command to the host via TDG.VP.VMCALL<TDCM>.
  *
@@ -30,3 +41,33 @@ u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector)
 	return _tdx_hypercall(TDVMCALL_TDCM, devid, cc_mkdec(virt_to_phys(buf)), size, vector);
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_tdcm, "tdx-guest");
+
+/**
+ * tdx_mcall_tdi_read() - Read field from a Trust Device Interface Control Structure (TDI_CS)
+ * @func_id: Function identifier specifying the TDI_CS
+ * @field: Field identifier within the specified TDI_CS
+ * @value: Storage for the successfully retrieved field value
+ *
+ * Invokes the TDG.TDI.RD TDCALL to read the value of @field within the TDI_CS specified
+ * by @func_id.
+ *
+ * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
+ * -ENODEV for TDI not present or invalid metadata, or -EIO on other TDCALL failures.
+ */
+int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value)
+{
+	struct tdx_module_args args = {
+		.rcx = func_id,
+		.rdx = field,
+	};
+	u64 ret;
+
+	ret = __tdcall_ret(TDG_TDI_READ, &args);
+	if (!ret) {
+		*value = args.rcx;
+		return 0;
+	}
+
+	return tdx_mcall_tdi_to_errno(ret);
+}
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_read, "tdx-guest");
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f46a3171a512..665c12925ff6 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -20,6 +20,7 @@
 #define TDG_MEM_PAGE_ACCEPT		6
 #define TDG_VM_RD			7
 #define TDG_VM_WR			8
+#define TDG_TDI_READ			67
 
 /* TDX TD attributes */
 #define TDX_TD_ATTR_DEBUG_BIT		0
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index df4496ef8a6a..4937e23d5483 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -77,6 +77,25 @@ void tdx_halt(void);
 
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
+/* TDX Module call error codes */
+#define TDCALL_RETURN_CODE(a)		((a) >> 32)
+#define TDCALL_INVALID_OPERAND		0xc0000100
+#define TDCALL_OPERAND_BUSY		0x80000200
+#define TDCALL_TDI_NOT_PRESENT		0xc0000f40
+#define TDCALL_TDI_INVALID_METADATA	0xc0000f41
+
+static inline int tdx_mcall_to_errno(u64 ret)
+{
+	switch (TDCALL_RETURN_CODE(ret)) {
+	case TDCALL_INVALID_OPERAND:
+		return -ENXIO;
+	case TDCALL_OPERAND_BUSY:
+		return -EBUSY;
+	default:
+		return -EIO;
+	}
+}
+
 u64 tdg_vm_rd(u64 field, u64 *value);
 
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
@@ -87,6 +106,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size);
 
 #ifdef CONFIG_TDX_CONNECT_GUEST
 u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
+int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
 #endif
 
 void __init tdx_dump_attributes(u64 td_attr);
-- 
2.52.0

