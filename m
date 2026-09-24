Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64FF3C13EE
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223067; cv=none; b=cGVWapLUdKP6Ba0/HWGwD5c4uiRL/6DH5JLdqtkmgi7QGcj14Hq+OBDOCRhMyMrk7jkU9ro4ro9rF38/bRjaq3XYWGZh3p1bCu+kzvNljndBnH+8UNyOx16XxcnrF/0N8aaSqwoTyPPtY09Qtiy6Db9K43nkZAuvPw8Q7nzJgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223067; c=relaxed/simple;
	bh=vh60lwNUTqm2NDx/4Wmw1q4SymoPtPA4avzKSoQnPpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6yzjAlpivV1Hl3c/okD+km9G0T7dN7gbY0ZNMHCb1vmyWRWSZAFVL1CORtD1HQAVxW+jrQjQjr3uU4fm3EwUriQ2tgU2Q0GtLzRwAZRZRkYGTHJY7SvdTIAEhHjSmzKvCme8e1op4lE5YHNv2sBmq6QSUI1ZSTOhb2q2i8iFCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQpSx2Hf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQpSx2Hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223066; x=1821759066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vh60lwNUTqm2NDx/4Wmw1q4SymoPtPA4avzKSoQnPpU=;
  b=dQpSx2HfDWsBXPVVDX7sEKuZCdwZGjDw+W8NrvWjHanytqr8Wiw3Hzpv
   jnrfig1Vjoo+aoPbePHx/++cIZkm5Yd4mMQmdcknXgTQWPXy9+1vO35FC
   huiquiWNROhUcXgJZ+K39L0ilDO12B6JyP7eU+pnQjqBmfP3c/xe6UGb5
   HqXMtD0skOYmG+F+6OIAbYA5NK6wy/0cyZPe8t7WvoNu/iYD0wzXSOtC/
   /uck/NNJBJqW114ryEi1ZL8dS/f1LxQkJFVS9TQrR9AXby9x9KdjieZUs
   ntDDYTXTqNDQp+D7cYlL9YkzEmKKtU1x6rwpLKtBLptNA7YR41ATqaMhG
   A==;
X-CSE-ConnectionGUID: j8SIQ9tTT86MZ59mMog7KQ==
X-CSE-MsgGUID: Eo4derM4QO+UkMtr50N+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002472"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002472"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:06 -0700
X-CSE-ConnectionGUID: vmskSoJrQvS+ifTVrgz0Jw==
X-CSE-MsgGUID: Q4f0lYpaQlCTKIj2/Bo3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009358"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:01 -0700
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
Subject: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure devices
Date: Thu, 24 Sep 2026 12:10:21 +0800
Message-ID: <20260924041032.1096569-5-zhenzhong.duan@intel.com>
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

Register Intel TDX secure device (devsec TSM) to the TSM framework and
supply the tdx_devsec_ops callback operations. This enables control and
management of the Trust Device Interface (TDI) through those hooks in
accordance with the TDISP protocol.

Check the TDCS configuration flags during driver initialization to
ensure the hardware interface is supported before attempting device
registration.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 arch/x86/include/asm/shared/tdx.h             |  1 +
 drivers/virt/coco/tdx-guest/Kconfig           | 15 ++++
 drivers/virt/coco/tdx-guest/Makefile          |  3 +
 drivers/virt/coco/tdx-guest/connect.c         | 81 +++++++++++++++++++
 .../coco/tdx-guest/{tdx-guest.c => main.c}    |  6 ++
 drivers/virt/coco/tdx-guest/tdx-guest.h       | 20 +++++
 6 files changed, 126 insertions(+)
 create mode 100644 drivers/virt/coco/tdx-guest/connect.c
 rename drivers/virt/coco/tdx-guest/{tdx-guest.c => main.c} (98%)
 create mode 100644 drivers/virt/coco/tdx-guest/tdx-guest.h

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
index 665c12925ff6..499103f7a01b 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -56,6 +56,7 @@
 
 /* TDCS_CONFIG_FLAGS bits */
 #define TDCS_CONFIG_FLEXIBLE_PENDING_VE	BIT_ULL(1)
+#define TDCS_CONFIG_TDX_CONNECT		BIT_ULL(5)
 
 /* TDCS_TD_CTLS bits */
 #define TD_CTLS_PENDING_VE_DISABLE_BIT	0
diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
index dbbdc14383b1..2e9407f8bc70 100644
--- a/drivers/virt/coco/tdx-guest/Kconfig
+++ b/drivers/virt/coco/tdx-guest/Kconfig
@@ -10,3 +10,18 @@ config TDX_GUEST_DRIVER
 
 	  To compile this driver as module, choose M here. The module will
 	  be called tdx-guest.
+
+config TDX_CONNECT_GUEST
+	bool "Intel TDX Connect Guest Support"
+	depends on TDX_GUEST_DRIVER
+	depends on PCI_TSM
+	default y
+	help
+	  Support Trust Device Interface (TDI) feature enumeration,
+	  validation, and activation within an Intel TDX guest.
+
+	  This option enables the guest kernel to establish secure,
+	  isolated connections with trusted devices assigned to the TD,
+	  validating MMIO maps and authorizing DMA remapping tables.
+
+	  If unsure, say Y.
diff --git a/drivers/virt/coco/tdx-guest/Makefile b/drivers/virt/coco/tdx-guest/Makefile
index 775cb463f9c8..cfa991c7aeb5 100644
--- a/drivers/virt/coco/tdx-guest/Makefile
+++ b/drivers/virt/coco/tdx-guest/Makefile
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TDX_GUEST_DRIVER) += tdx-guest.o
+
+tdx-guest-y := main.o
+tdx-guest-$(CONFIG_TDX_CONNECT_GUEST) += connect.o
diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
new file mode 100644
index 000000000000..80ae7c19e179
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TDX Connect guest driver
+ *
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#define pr_fmt(fmt)		KBUILD_MODNAME ": tdx_connect: " fmt
+
+#include <linux/pci.h>
+#include <linux/pci-tsm.h>
+#include <linux/tsm.h>
+#include <asm/tdx.h>
+
+#include "tdx-guest.h"
+
+struct tdx_devsec {
+	struct pci_tsm_devsec pci;
+};
+
+static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
+{
+	return container_of(tsm, struct tdx_devsec, pci.base_tsm);
+}
+
+static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
+{
+	int ret;
+
+	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
+	if (!tdevsec)
+		return ERR_PTR(-ENOMEM);
+
+	ret = pci_tsm_devsec_constructor(pdev, &tdevsec->pci, tsm_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &no_free_ptr(tdevsec)->pci.base_tsm;
+}
+
+static void tdx_devsec_unlock(struct pci_tsm *tsm)
+{
+	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
+
+	kfree(tdevsec);
+}
+
+static int tdx_devsec_run(struct pci_dev *pdev)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct pci_tsm_ops tdx_devsec_ops = {
+	.lock = tdx_devsec_lock,
+	.unlock = tdx_devsec_unlock,
+	.run = tdx_devsec_run,
+};
+
+static void devsec_tsm_remove(void *tsm_dev)
+{
+	tsm_unregister(tsm_dev);
+}
+
+int tdx_connect_init(struct device *dev)
+{
+	struct tsm_dev *tsm_dev;
+	u64 config, ret;
+
+	ret = tdg_vm_rd(TDCS_CONFIG_FLAGS, &config);
+	if (ret)
+		return -EIO;
+
+	if (!(config & TDCS_CONFIG_TDX_CONNECT))
+		return 0;
+
+	tsm_dev = tsm_register(dev, &tdx_devsec_ops);
+	if (IS_ERR(tsm_dev))
+		return PTR_ERR(tsm_dev);
+
+	return devm_add_action_or_reset(dev, devsec_tsm_remove, tsm_dev);
+}
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/main.c
similarity index 98%
rename from drivers/virt/coco/tdx-guest/tdx-guest.c
rename to drivers/virt/coco/tdx-guest/main.c
index d0303e31e816..801a1f2b5f3d 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/main.c
@@ -25,6 +25,8 @@
 #include <asm/cpu_device_id.h>
 #include <asm/tdx.h>
 
+#include "tdx-guest.h"
+
 /* TDREPORT buffer */
 static u8 *tdx_report_buf;
 
@@ -428,6 +430,10 @@ static int __init tdx_guest_init(void)
 	if (ret)
 		goto free_quote;
 
+	ret = tdx_connect_init(tdx_misc_dev.this_device);
+	if (ret)
+		pr_warn("Failed to enable TDX Connect: %d\n", ret);
+
 	return 0;
 
 free_quote:
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.h b/drivers/virt/coco/tdx-guest/tdx-guest.h
new file mode 100644
index 000000000000..4218541c7f3b
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TDX guest driver private declarations
+ *
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#ifndef __TDX_GUEST_H
+#define __TDX_GUEST_H
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#ifdef CONFIG_TDX_CONNECT_GUEST
+extern int tdx_connect_init(struct device *dev);
+#else
+static inline int tdx_connect_init(struct device *dev) { return 0; }
+#endif /* CONFIG_TDX_CONNECT_GUEST */
+
+#endif /* __TDX_GUEST_H */
-- 
2.52.0

