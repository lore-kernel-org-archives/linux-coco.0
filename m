Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998313890F3
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223057; cv=none; b=PAKJ10DaANE4exg77I+i+Lc1xkAmV9DfXlPclDHkob+n5rFlzQjnXV8TCeuO2MgXheIN+JoIpPFch0JhSVp5Y9DXw8S3Q6cFPiMn+0+lFvN406xcSNoj6ZhgbS2155x298cwrko40sAD/ii6vbOnmUACWzzB7Lf7PZ5AvH7vNhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223057; c=relaxed/simple;
	bh=ToHFhBDHTE6AwHTKPJtG4GWq2W0Bi8+sWPzXCcjZPR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuDAenzEu4bRlYttJ1LTFuCi23buNWVIpdeziPEeLkltGsT1UOboDs3mkny1qFs9QX1YgfbUE7EU35wZb3aGjsjMUFNmkh7Xz44TjksY9UM3Oco2YkCr08y8FgVtvjI39cjSa6nH+k3kRy1jFNLFaReZOo2/pvt32KTOoQtlMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVFRdn7D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVFRdn7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223056; x=1821759056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ToHFhBDHTE6AwHTKPJtG4GWq2W0Bi8+sWPzXCcjZPR8=;
  b=PVFRdn7DQ9EkY5CbyvVX9w5hhr8r6I20nx3PpGUv/rD+1A3DNUrW+tpx
   33hyypOeo0wmEP7ozhvsLiifWGIipDUNy6dP7/NqjR4Uov6RcDhzLcLbm
   ifIgSE/43F68pERNp8sIkj3DsvVwou5MI7KnvyctpldN/tpoNSDPBAL2L
   D0s7H6Iwt+YPek/ghHmvJ5eSDHf/dnCkUTLAex5QluhL8mll7GSHh1smT
   RTVOJ04UnPc05S7R3FwPPxszsgvpHsCedD7eo6MlGiaxWP1/oBxT1mGVZ
   nk27OKj9nFh7CnaRIeKeZInyBwarEBbn9qCEHw8uTcJfdJ/UPLWYEN28n
   Q==;
X-CSE-ConnectionGUID: IUfceRAeSi2JjOXGpnUmwg==
X-CSE-MsgGUID: XmgcK9pVQnGvz9/YPmRxRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002449"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002449"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:55 -0700
X-CSE-ConnectionGUID: uTDBxn4BRyq0p+ty1gM2Iw==
X-CSE-MsgGUID: FrowoSzrQn+MYNDQsFiwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009332"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:51 -0700
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
Subject: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX Connect
Date: Thu, 24 Sep 2026 12:10:19 +0800
Message-ID: <20260924041032.1096569-3-zhenzhong.duan@intel.com>
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

TDX Connect is a TDX feature that enables secure device assignment,
allowing a TDX guest to directly interact with TEE-IO capable devices.

The TEE-IO Device Control and Management (TDCM) hypercall
(TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
primary interface through which a TDX guest issues device management
commands to the host. The host processes these commands and returns
responses via a shared memory buffer.

Abstract the underlying leaf call and pass the shared buffer physical
address as a decrypted mapping. Add a runtime page alignment check
for the buffer to enforce correct usage.

Place the implementation in a separate tdx_connect.c file to keep TDX
Connect specific code isolated from core tdx.c.

CONFIG_TDX_CONNECT_GUEST referenced in the header guard will be
introduced in a later patch in this series.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/coco/tdx/Makefile        |  2 ++
 arch/x86/coco/tdx/tdx_connect.c   | 32 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  4 ++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/x86/coco/tdx/tdx_connect.c

diff --git a/arch/x86/coco/tdx/Makefile b/arch/x86/coco/tdx/Makefile
index b3c47d3700e2..2ab2dbbdd3d2 100644
--- a/arch/x86/coco/tdx/Makefile
+++ b/arch/x86/coco/tdx/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += debug.o tdcall.o tdx.o tdx-shared.o
+
+obj-$(CONFIG_TDX_CONNECT_GUEST) += tdx_connect.o
diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
new file mode 100644
index 000000000000..0c6ca650771a
--- /dev/null
+++ b/arch/x86/coco/tdx/tdx_connect.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Intel Corporation */
+
+#undef pr_fmt
+#define pr_fmt(fmt)     "tdx_connect: " fmt
+
+#include <linux/io.h>
+#include <asm/tdx.h>
+#include <linux/mm.h>
+
+/*
+ * tdx_hcall_tdcm - Send a TDCM command to the host via TDG.VP.VMCALL<TDCM>.
+ *
+ * @devid:  Device identifier of the target TEE-IO device.
+ * @buf:    Shared, directly mapped buffer containing the TDCM command on
+ *          input and the host response on output.
+ * @size:   Size of @buf in bytes.
+ * @vector: Event notification interrupt vector, or 0 for synchronous operation.
+ *
+ * The buffer physical address is passed to the host with decrypted/shared
+ * mark.
+ *
+ * Returns 0 on success or a TDX VMCALL status code on failure. See
+ * TDG.VP.VMCALL<TDCM> in the TDX GHCI v2.0 specification for status codes.
+ */
+u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector)
+{
+	WARN_ON_ONCE(!PAGE_ALIGNED(buf) || !PAGE_ALIGNED(size));
+
+	return _tdx_hypercall(TDVMCALL_TDCM, devid, cc_mkdec(virt_to_phys(buf)), size, vector);
+}
+EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_tdcm, "tdx-guest");
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index f20e91d7ac35..f46a3171a512 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -74,6 +74,7 @@
 #define TDVMCALL_GET_QUOTE		0x10002
 #define TDVMCALL_REPORT_FATAL_ERROR	0x10003
 #define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT 0x10004ULL
+#define TDVMCALL_TDCM			0x10007
 
 /*
  * TDG.VP.VMCALL Status Codes (returned in R10)
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 884bb8067521..df4496ef8a6a 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -85,6 +85,10 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
 
 u64 tdx_hcall_get_quote(u8 *buf, size_t size);
 
+#ifdef CONFIG_TDX_CONNECT_GUEST
+u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
+#endif
+
 void __init tdx_dump_attributes(u64 td_attr);
 void __init tdx_dump_td_ctls(u64 td_ctls);
 
-- 
2.52.0

