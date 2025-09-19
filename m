Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5511313E2F
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291768; cv=none; b=YxGpUJTLV8ioyT3BfUzrj1tJkLiicBC9V+cOeMk59X2dnIrit7pD5a6ReZe4U3rfwc656OOP+0Vh93I2iHvCowZyjlQxH6dSvZTWDw+/blb00labWtldT+QTiZU6z+yYsVRKD9agCPC6s1HcgytFUZwNGGV2Ud4EoFQUlDMsNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291768; c=relaxed/simple;
	bh=3gie8v6fJdM+HUedCG4ZohIta3K4VctlafuHNXLBBJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0QaETKIbGasG5kzUhNWDXCdH6dvydTgVBx92vuuyPM+K8nfUlKd2bPXd8N4IoQu+0j++76JlFNnz1A9r+yQl1uYKmiLGjAf5kJbRPJ3awwzl19WB/vGhJETk/UMQMXwQ93P/amp+y7JLF6f0LTU++qeWTK8T7pyXRFk7yBzjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISjyHHcS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISjyHHcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291767; x=1789827767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3gie8v6fJdM+HUedCG4ZohIta3K4VctlafuHNXLBBJQ=;
  b=ISjyHHcSF628roD5vod+41oFj8fP7SE9C5hiW87UFgj7u4pRzeb5beRj
   8SMz5VD7SnnZ0BtTQ9h0AUsmmLUoMtYSu5DSOu7siHeE5hz5GMqC7MKDb
   qrYVs8aNrgZrC4QHxuLiiNV4OUvJk2I7vOk9+kSmysWTdl3GyVpHJugFr
   lwy/s2ifJGAiMCJQWV6PxtdxrLUquyCo2omkpL7BLWKvOvzUrHM2U4k43
   +eEEG78VXvVJKBwCVn5KD0XlVPKmzZrBSuVc2oKczx1sLChdco75W53gX
   y4pbMoY3r+ZmTfj2Wx7DxvxHO3LfalB1GRyHks/nLkpdSR5JJdE2kLmT4
   w==;
X-CSE-ConnectionGUID: niGHVUOlRimuVZcbH7ihwQ==
X-CSE-MsgGUID: UeAnJLfQTr21NcXgeqkkHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750560"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:40 -0700
X-CSE-ConnectionGUID: XpI7uzqwT/+M12SbWMouhw==
X-CSE-MsgGUID: bXMY7kFfRRKvjeRq9PEyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655047"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:39 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [RFC PATCH 18/27] coco/tdx-host: Setup all trusted IOMMUs on TDX Connect init
Date: Fri, 19 Sep 2025 07:22:27 -0700
Message-ID: <20250919142237.418648-19-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919142237.418648-1-dan.j.williams@intel.com>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xu Yilun <yilun.xu@linux.intel.com>

Setup all trusted IOMMUs on TDX Connect initialization and clear all on
TDX Connect removal.

Trusted IOMMU setup is the pre-condition for all following TDX Connect
operations such as SPDM/IDE setup. It is more of a platform
configuration than a standalone IOMMU configuration, so put the
implementation in tdx-host driver.

There is no dedicated way to enumerate which IOMMU devices support
trusted operations. The host has to call TDH.IOMMU.SETUP on all IOMMU
devices and tell their trusted capability by the return value.

Suggested-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/tdx-host/tdx-host.c | 90 +++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index 2411c7d34b6b..cdd2a4670c96 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Intel Corporation
  */
 
+#include <linux/dmar.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -128,6 +129,85 @@ static void unregister_link_tsm(void *data)
 	tsm_unregister(link_dev);
 }
 
+static DEFINE_XARRAY(tlink_iommu_xa);
+
+static void tdx_iommu_clear(u64 iommu_id, struct tdx_page_array *iommu_mt)
+{
+	u64 r;
+
+	r = tdh_iommu_clear(iommu_id, iommu_mt);
+	if (r) {
+		pr_err("%s fail to clear tdx iommu\n", __func__);
+		goto leak;
+	}
+
+	if (tdx_page_array_ctrl_release(iommu_mt, iommu_mt->nr_pages,
+					page_to_phys(iommu_mt->root))) {
+		pr_err("%s fail to release metadata pages\n", __func__);
+		goto leak;
+	}
+
+	return;
+
+leak:
+	tdx_page_array_ctrl_leak(iommu_mt);
+}
+
+static int tdx_iommu_enable_one(struct dmar_drhd_unit *drhd)
+{
+	unsigned int nr_pages = tdx_sysinfo->connect.iommu_mt_page_count;
+	u64 r, iommu_id;
+	int ret;
+
+	struct tdx_page_array *iommu_mt __free(tdx_page_array_free) =
+		tdx_page_array_create_iommu_mt(1, nr_pages);
+	if (!iommu_mt)
+		return -ENOMEM;
+
+	do {
+		r = tdh_iommu_setup(drhd->reg_base_addr, iommu_mt, &iommu_id);
+	} while (r == TDX_INTERRUPTED_RESUMABLE);
+
+	/* This drhd doesn't support tdx mode, skip. */
+	if ((r & TDX_SEAMCALL_STATUS_MASK)  == TDX_OPERAND_INVALID)
+		return 0;
+
+	if (r) {
+		pr_err("fail to enable tdx mode for DRHD[0x%llx]\n",
+		       drhd->reg_base_addr);
+		return -EFAULT;
+	}
+
+	ret = xa_insert(&tlink_iommu_xa, (unsigned long)iommu_id,
+			no_free_ptr(iommu_mt), GFP_KERNEL);
+	if (ret) {
+		tdx_iommu_clear(iommu_id, iommu_mt);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void tdx_iommu_disable_all(void *data)
+{
+	struct tdx_page_array *iommu_mt;
+	unsigned long iommu_id;
+
+	xa_for_each(&tlink_iommu_xa, iommu_id, iommu_mt)
+		tdx_iommu_clear(iommu_id, iommu_mt);
+}
+
+static int tdx_iommu_enable_all(void)
+{
+	int ret;
+
+	ret = do_for_each_drhd_unit(tdx_iommu_enable_one);
+	if (ret)
+		tdx_iommu_disable_all(NULL);
+
+	return ret;
+}
+
 static int tdx_connect_init(struct device *dev)
 {
 	struct tsm_dev *link;
@@ -149,6 +229,16 @@ static int tdx_connect_init(struct device *dev)
 		return ret;
 	}
 
+	ret = tdx_iommu_enable_all();
+	if (ret) {
+		dev_err(dev, "Enable tdx iommu failed\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, tdx_iommu_disable_all, NULL);
+	if (ret)
+		return ret;
+
 	link = tsm_register(dev, &tdx_link_ops);
 	if (IS_ERR(link)) {
 		dev_err(dev, "failed to register TSM: (%pe)\n", link);
-- 
2.51.0

