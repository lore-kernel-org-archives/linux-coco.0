Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D063EDAA3
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223093; cv=none; b=ZJlAG2+GpFg2JBh3kx5tlPy2jQH4iyfcyRr7S1nFIBYMuBa5Ft61WIG58DkxQF+GIYpCCCVdEcB0WNhswc4CkZy9GyIiji0sAVGx70GoQmzN5FLj/iHu98YnGzKuhJo2TbFecekH+ECVvOIJ1zZJ1aRDtxzV0OZ3YO4udlGH3qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223093; c=relaxed/simple;
	bh=PZSyZslskXLdPIcjgU7Rl+dNTg85CfPOP8ufd252HGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkqnKHLdk+QXTpBYaI449OeazlGH7ccAkWr2iU2Da7gwmBeMWm+2AMBzFYqk8eZUzsS+l9TwoHakr7gvI1kwzXzCy3oarpo7U+QRiCqSRa06dg0dSNHZ/dJYJSWmgLqHRqqqNdG/mU38rxxBRWhSs5Ik0w+bS4cVNpQaro2FtJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtbqF9xw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtbqF9xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223091; x=1821759091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PZSyZslskXLdPIcjgU7Rl+dNTg85CfPOP8ufd252HGQ=;
  b=DtbqF9xw9kzHzABGk0TmdCoAAewPmK6ManEGm460P4I4GRbNoJxn6mS6
   7uBOR2fQM7lVdKg2fsFsnX+OZiRZvQexmspQ0URMJy9aGpp7fBe1aHfTl
   Dkxx24Wp7y15U9UXrqkqLzYWoGhWyR97/RWmMTUBOx2kjG7B5TsBtdWsH
   dW4KVBOitf7bEecr5BJIIYAhOv5gLG4Pdbk/DwBJaWPH6Lq4VDD5PH9Ds
   nFQt7IcuY8inS8j+0gCBQXiBSsYNzN2DNYYnuxLI1/dptsd1b3bR1owpm
   bWgWqulhWt/3TJr+ua0cAVZmLb6z7fA8KP2fx5c0TN8MpNME544I8uuXq
   w==;
X-CSE-ConnectionGUID: NpnVs7ibRgeDO4d7vL3xDA==
X-CSE-MsgGUID: LmM618JzQu+ndlRLmv4Smw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002523"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002523"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:31 -0700
X-CSE-ConnectionGUID: 11Ah0424SMOhoDZILmQl6Q==
X-CSE-MsgGUID: R8uFckbDRuSuf4LWWrtV5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009395"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:27 -0700
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
Subject: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during device lock
Date: Thu, 24 Sep 2026 12:10:26 +0800
Message-ID: <20260924041032.1096569-10-zhenzhong.duan@intel.com>
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

Retrieve the Trusted Device Interface report through
TDCM_OP_GET_TDI_REPORT after binding the device.

Store the report in the PCI TSM device evidence object and free it
during device unlock.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/virt/coco/tdx-guest/connect.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index e36515fc43ef..d5934e8c0089 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -217,8 +217,35 @@ static int tdx_tdi_read_state(struct tdx_devsec *tdevsec, u8 *state)
 	return ret;
 }
 
+static u8 *tdx_tdi_get_report(struct tdx_devsec *tdevsec, u32 *report_sz)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	u8 *report;
+	int ret;
+
+	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) =
+		tdx_tdcm_alloc(pdev, TDCM_OP_GET_TDI_REPORT, 0, MAX_TDI_REPORT_SIZE);
+	if (IS_ERR(tdcm))
+		return ERR_CAST(tdcm);
+
+	ret = tdx_tdcm_run(tdcm);
+	if (ret)
+		return ERR_PTR(ret);
+
+	report = kmemdup(to_tdcm_rsp_data(tdcm), tdcm->rsp_data_sz, GFP_KERNEL);
+	if (!report)
+		return ERR_PTR(-ENOMEM);
+
+	*report_sz = tdcm->rsp_data_sz;
+	print_hex_dump_debug("tdi_report: ", DUMP_PREFIX_OFFSET, 16, 1, report, *report_sz, false);
+	return report;
+}
+
 static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
 {
+	struct device_evidence_object *tsm_report;
+	struct device_evidence *evidence;
+	u32 report_sz;
 	u8 state;
 	int ret;
 
@@ -237,6 +264,10 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 	if (IS_ERR(tdevsec_bind))
 		return ERR_CAST(tdevsec_bind);
 
+	u8 *report __free(kfree) = tdx_tdi_get_report(tdevsec, &report_sz);
+	if (IS_ERR(report))
+		return ERR_CAST(report);
+
 	ret = tdx_tdi_read_state(tdevsec, &state);
 	if (ret)
 		return ERR_PTR(ret);
@@ -244,6 +275,17 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 	if (state != TDI_STATE_CONFIG_LOCKED)
 		return ERR_PTR(-EIO);
 
+	evidence = device_evidence_create(0, HASH_ALGO_SHA384);
+
+	if (!evidence)
+		return ERR_PTR(-ENOMEM);
+
+	tsm_report = &evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT];
+	tsm_report->data = no_free_ptr(report);
+	tsm_report->len = report_sz;
+
+	tdevsec->pci.base_tsm.evidence = evidence;
+
 	retain_and_null_ptr(tdevsec_bind);
 
 	return &no_free_ptr(tdevsec)->pci.base_tsm;
@@ -252,10 +294,13 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 static void tdx_devsec_unlock(struct pci_tsm *tsm)
 {
 	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
+	struct device_evidence *evidence = tsm->evidence;
 
 	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
 		return;
 
+	kfree(evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT].data);
+	kfree(evidence);
 	kfree(tdevsec);
 }
 
-- 
2.52.0

