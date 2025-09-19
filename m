Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B25313D78
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291768; cv=none; b=EABJmLbLJXCIlLISgm5ZyuibvXYZFKTxVEKIr11ERCMvWbRRvaa7endeejlASiCrAterMUnFfU/JoczBxFcr+NiGEmnIFKmugsqlbIGqEoAji53u5SNTXhDWMcEXP1KY/bn6g/57u2lT3GCST7Q31I00lM8xg8Qb7O0AVdcLUyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291768; c=relaxed/simple;
	bh=8/Eshy47gAat++ekgTj0C2+AZkKJoZa4LghDU9AnPxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6GQtfzZajl8H0CDHruRZfqxvPZ3PG4wGZm+RJD2zLFVBamz/llmkcDsm5C2hlZz1s+7P1XNEkPSWt/BTjuV2RV8+M2o/Wz5iFt7un0p55kAdRVQ8QvuYLKkOz++80qtQe00lRF4Q9kIuPa0G+YNvCaZGb3lVrUXr0SNjKTrSNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwOtKul1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwOtKul1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291767; x=1789827767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/Eshy47gAat++ekgTj0C2+AZkKJoZa4LghDU9AnPxw=;
  b=mwOtKul1GlIcv1iMFtPxs9jmZnmLr7HWdyt+gROVm25seiIZjYvmcSWa
   hMxraV2EvzMmE7+LuIvt2AX0lZ0P34dcxftkISEjpHLUJnKsxzMhS7e2k
   Mf6Ti7aeG76GRV7jUVNIfqMVJNPYXv1hyz41RtBTveZkqIS+k8Y5W+OIf
   g+UUvszge4Ca2zRUR0V9WTmXe+0nvWBpePC0j/oWBOj/IIOb8GvAk8vkk
   nC7aTOHsMgvjlacMWn42IYeaPs5/G83+86LIhWuYtizfnqugLSSyR4CrQ
   ZELOWMTuNG0LmHx174MQUpEya3xZpkLFOB1kk89fCSiNlKmEhkXfOxI2f
   Q==;
X-CSE-ConnectionGUID: wjFZdAyVSRClE6+dcU2WmQ==
X-CSE-MsgGUID: lyw8Zn6LS66rOIFv6BQ0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750563"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750563"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:40 -0700
X-CSE-ConnectionGUID: hzv9gJPBRra745DFTRAMhA==
X-CSE-MsgGUID: HWkuIb+bSSOkdpRLcrRAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655050"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:40 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 19/27] coco/tdx-host: Add a helper to exchange SPDM messages through DOE
Date: Fri, 19 Sep 2025 07:22:28 -0700
Message-ID: <20250919142237.418648-20-dan.j.williams@intel.com>
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

TDX host uses this function to exchange TDX Module encrypted data with
devices via SPDM. It is unfortunate that TDX passes raw DOE frames with
headers included and the PCI DOE core wants payloads separated from
headers.

This conversion code is about the same amount of work as teaching the PCI
DOE driver to support raw frames. Unless and until another raw frame use
case shows up, just do this conversion in the TDX TSM driver.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/tdx-host/tdx-host.c | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index cdd2a4670c96..f5a869443b15 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -5,11 +5,13 @@
  * Copyright (C) 2025 Intel Corporation
  */
 
+#include <linux/bitfield.h>
 #include <linux/dmar.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pci.h>
+#include <linux/pci-doe.h>
 #include <linux/pci-tsm.h>
 #include <linux/sysfs.h>
 #include <linux/tsm.h>
@@ -43,6 +45,65 @@ static struct tdx_link *to_tdx_link(struct pci_tsm *tsm)
 	return container_of(tsm, struct tdx_link, pci.base_tsm);
 }
 
+#define PCI_DOE_DATA_OBJECT_HEADER_1_OFFSET	0
+#define PCI_DOE_DATA_OBJECT_HEADER_2_OFFSET	4
+#define PCI_DOE_DATA_OBJECT_HEADER_SIZE		8
+#define PCI_DOE_DATA_OBJECT_PAYLOAD_OFFSET	PCI_DOE_DATA_OBJECT_HEADER_SIZE
+
+#define PCI_DOE_PROTOCOL_SECURE_SPDM		2
+
+static int __maybe_unused tdx_spdm_msg_exchange(struct tdx_link *tlink,
+						void *request, size_t request_sz,
+						void *response, size_t response_sz)
+{
+	struct pci_dev *pdev = tlink->pci.base_tsm.pdev;
+	void *req_pl_addr, *resp_pl_addr;
+	size_t req_pl_sz, resp_pl_sz;
+	u32 data, len;
+	u16 vendor;
+	u8 type;
+	int ret;
+
+	/*
+	 * pci_doe() accept DOE PAYLOAD only but request carries DOE HEADER so
+	 * shift the buffers, skip DOE HEADER in request buffer, and fill DOE
+	 * HEADER in response buffer manually.
+	 */
+
+	data = le32_to_cpu(*(__le32 *)(request + PCI_DOE_DATA_OBJECT_HEADER_1_OFFSET));
+	vendor = FIELD_GET(PCI_DOE_DATA_OBJECT_HEADER_1_VID, data);
+	type = FIELD_GET(PCI_DOE_DATA_OBJECT_HEADER_1_TYPE, data);
+
+	data = le32_to_cpu(*(__le32 *)(request + PCI_DOE_DATA_OBJECT_HEADER_2_OFFSET));
+	len = FIELD_GET(PCI_DOE_DATA_OBJECT_HEADER_2_LENGTH, data);
+
+	req_pl_sz = len * sizeof(__le32) - PCI_DOE_DATA_OBJECT_HEADER_SIZE;
+	resp_pl_sz = response_sz - PCI_DOE_DATA_OBJECT_HEADER_SIZE;
+	req_pl_addr = request + PCI_DOE_DATA_OBJECT_HEADER_SIZE;
+	resp_pl_addr = response + PCI_DOE_DATA_OBJECT_HEADER_SIZE;
+
+	ret = pci_doe(tlink->pci.doe_mb, PCI_VENDOR_ID_PCI_SIG, type,
+		      req_pl_addr, req_pl_sz, resp_pl_addr, resp_pl_sz);
+	if (ret < 0) {
+		pci_err(pdev, "spdm msg exchange fail %d\n", ret);
+		return ret;
+	}
+
+	data = FIELD_PREP(PCI_DOE_DATA_OBJECT_HEADER_1_VID, vendor) |
+	       FIELD_PREP(PCI_DOE_DATA_OBJECT_HEADER_1_TYPE, type);
+	*(__le32 *)(response + PCI_DOE_DATA_OBJECT_HEADER_1_OFFSET) = cpu_to_le32(data);
+
+	len = (ret + PCI_DOE_DATA_OBJECT_HEADER_SIZE) / sizeof(__le32);
+	data = FIELD_PREP(PCI_DOE_DATA_OBJECT_HEADER_2_LENGTH, len);
+	*(__le32 *)(response + PCI_DOE_DATA_OBJECT_HEADER_2_OFFSET) = cpu_to_le32(data);
+
+	ret += PCI_DOE_DATA_OBJECT_HEADER_SIZE;
+
+	pci_dbg(pdev, "%s complete: vendor 0x%x type 0x%x rsp_sz %d\n",
+		__func__, vendor, type, ret);
+	return ret;
+}
+
 static int tdx_link_connect(struct pci_dev *pdev)
 {
 	return -ENXIO;
-- 
2.51.0

