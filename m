Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C5F1FF1C4
	for <linux-coco@lists.linux.dev>; Mon, 14 Apr 2025 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667693; cv=none; b=AOD5sL+drJtIzW46Wc1LCfYEfn1WO5DvOUSm04jklv1lG5N4I4mMvFnWDnA2+/ayStaB7CLhMT5RnkuAdhXOa3zrZqxYD2cNUkE3eHDGwgdmeDuaRMeAa90sSz5xov5P0zs5fjo243BGM5gM+tjezXEa87h8pNeXZe02CnM8GlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667693; c=relaxed/simple;
	bh=J9lNEUBAS/HDgmd4lFHMr7W9GjeRlJkQxjD4rCxzUI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlCQhpuRv/zAH3dj3SQTSK/g+jAkd941k5QJHnvpLHu4e1zYPXdYFy+mqauZhlEHL69jxvRAa6WvmiX2V0Dp9jlowogEguITEKjv1YvOjxU8qyBiF18dgpBhIq3MznaWjIFghMIxpwCoOONt66nBD9sORHiXy4lM4c1p1ejHcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTNZ6RZv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTNZ6RZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744667691; x=1776203691;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J9lNEUBAS/HDgmd4lFHMr7W9GjeRlJkQxjD4rCxzUI0=;
  b=bTNZ6RZvzkvY/Q+1nh6O43s0nSBigEfQX98FAPbcF8Kg2wSNLiK9ZwDP
   mS8pNVIrHOGycvyJEfltyudCTw8ku7HRoitVfV4cMdoByL/OndHo+Y90i
   8FBELArCW01TcHuhnDWfNvxAXyDdIbAOeD5dRI8cV3oENL0HFAx7S5+Me
   aVpBr+iq/uHpe1mal5vo1APYikJntMC2Hflao/5HxlRRdwiBHfAGRqHAz
   zEM0Mqom6zp1DeBXfK9K/nuCC3YoghhozsvNF+4aaPyo7kemTAgf7JsNL
   jWdmltfG133+qtkLyfE6UnAwiMtEiq8ExCe6D1xMFXEcxbjuylz+vZV27
   A==;
X-CSE-ConnectionGUID: SNZuhzvUTqefoz6L8FJYig==
X-CSE-MsgGUID: PlZbBeDfTAikc+0qdXmLMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71544366"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="71544366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:51 -0700
X-CSE-ConnectionGUID: qUVgJlX5RieRh/QxXzXY1Q==
X-CSE-MsgGUID: U00d7V1KRYGU+9FVpedZgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130474164"
Received: from hasmith-mobl1.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.71])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:50 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Mon, 14 Apr 2025 16:54:21 -0500
Subject: [PATCH v4 3/5] x86/tdx: Add tdx_mcall_extend_rtmr() interface
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-tdx-rtmr-v4-3-7edfa8d98716@intel.com>
References: <20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com>
In-Reply-To: <20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 Dionna Amalie Glaze <dionnaglaze@google.com>, 
 Guorui Yu <guorui.yu@linux.alibaba.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Dan Middleton <dan.middleton@linux.intel.com>, 
 Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Cedric Xing <cedric.xing@intel.com>
X-Mailer: b4 0.13.0

The TDX guest exposes one MRTD (Build-time Measurement Register) and four
RTMR (Run-time Measurement Register) registers to record the build and boot
measurements of a virtual machine (VM). These registers are similar to PCR
(Platform Configuration Register) registers in the TPM (Trusted Platform
Module) space. This measurement data is used to implement security features
like attestation and trusted boot.

To facilitate updating the RTMR registers, the TDX module provides support
for the `TDG.MR.RTMR.EXTEND` TDCALL which can be used to securely extend
the RTMR registers.

Add helper function to update RTMR registers. It will be used by the TDX
guest driver in enabling RTMR extension support.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 arch/x86/coco/tdx/tdx.c           | 37 +++++++++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  2 ++
 3 files changed, 40 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index edab6d6049be..0b6804d2a5e1 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -36,6 +36,7 @@
 /* TDX Module call error codes */
 #define TDCALL_RETURN_CODE(a)	((a) >> 32)
 #define TDCALL_INVALID_OPERAND	0xc0000100
+#define TDCALL_OPERAND_BUSY	0x80000200
 
 #define TDREPORT_SUBTYPE_0	0
 
@@ -136,6 +137,42 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 }
 EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
 
+/**
+ * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
+ *			     TDG.MR.RTMR.EXTEND TDCALL.
+ * @index: Index of RTMR register to be extended.
+ * @data: Address of the input buffer with RTMR register extend data.
+ *
+ * Refer to section titled "TDG.MR.RTMR.EXTEND leaf" in the TDX Module v1.0
+ * specification for more information on TDG.MR.RTMR.EXTEND TDCALL.
+ *
+ * It is used in the TDX guest driver module to allow user to extend the RTMR
+ * registers.
+ *
+ * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
+ * or -EIO on other TDCALL failures.
+ */
+int tdx_mcall_extend_rtmr(u8 index, u8 *data)
+{
+	struct tdx_module_args args = {
+		.rcx = virt_to_phys(data),
+		.rdx = index,
+	};
+	u64 ret;
+
+	ret = __tdcall(TDG_MR_RTMR_EXTEND, &args);
+	if (ret) {
+		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
+			return -ENXIO;
+		if (TDCALL_RETURN_CODE(ret) == TDCALL_OPERAND_BUSY)
+			return -EBUSY;
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
+
 /**
  * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
  *                         hypercall.
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index a28ff6b14145..738f583f65cb 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -13,6 +13,7 @@
 /* TDX module Call Leaf IDs */
 #define TDG_VP_VMCALL			0
 #define TDG_VP_INFO			1
+#define TDG_MR_RTMR_EXTEND		2
 #define TDG_VP_VEINFO_GET		3
 #define TDG_MR_REPORT			4
 #define TDG_MEM_PAGE_ACCEPT		6
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4a1922ec80cf..12d17f3ca301 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -64,6 +64,8 @@ bool tdx_early_handle_ve(struct pt_regs *regs);
 
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
 
+int tdx_mcall_extend_rtmr(u8 index, u8 *data);
+
 u64 tdx_hcall_get_quote(u8 *buf, size_t size);
 
 void __init tdx_dump_attributes(u64 td_attr);

-- 
2.43.0

