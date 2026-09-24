Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C76381E92
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223098; cv=none; b=pI4/w+lDXfQHGE/+hyy1R6g0+77eURxgakQTbP1U84IWpgvIjxALtAIQFVm8SHFT6ADrnK+YjMrPdTi9qg2y9BzUQOHv5foXkcnIY5i/gN0yc+DFN4pH1w1P/KC0Ugh5Pqnxcv4xv3Fa2iujiAeeM/aAcdTtqFddFS62D2fQ5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223098; c=relaxed/simple;
	bh=QlbJZvIDoVeDS9GGzvd8732KHMCJKcpgwdQDfUwtoGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDZxTVC+WbB2VvqQXscl769ChyoOfi6EFc052g73vfzKuPofHXVpVnKf4TBtmRySPCJRmf4Z7Pxnd8bIfg+etgf5irLlhxDpYBZR1pmZ8PFqUM/qv69I6oIBCksagJOynLLhzbnvvtExqVQAztSIK9TJo2DsFlxSPmRecOdiV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dv8eXXeB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv8eXXeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223097; x=1821759097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QlbJZvIDoVeDS9GGzvd8732KHMCJKcpgwdQDfUwtoGc=;
  b=dv8eXXeBJGHCo1q9W9DC6rOtG2RbS+6MZnkDW/jKpNMm72cG2vayZSKY
   kMUsP7MJ2dipJPWdpBh6i3zWwAxz1l3yG5jO2wRYhxka+X2uhrQbz2tyR
   AxLERAKlzqByv52OuiKQBbWtqRxSswVqW+uF6eQ1okKKvEcIz/eSO3VQj
   M2AU0DkjXzpcJr6k9r1USL0Cwo/qm9e2xt7fSvYwMcKlFk0WA2XAbnlfP
   Lt4Qpjaghk9mf2B2KZwX5BMUmRrIh1BPlFum7gRQwThTAC0zW+ZmpDXce
   UkiHPQoTpAozRX5DdB3t7AKnh4bbPmZo9Vk+VZrVJ+26QCcT3K9p9ftA+
   w==;
X-CSE-ConnectionGUID: rpEYMLuKRvirT/vpqdON6w==
X-CSE-MsgGUID: Jnov1yiVQUGl4pS7Leteew==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002539"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002539"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:36 -0700
X-CSE-ConnectionGUID: HPxhouQjRSGS2w0h1q8vnw==
X-CSE-MsgGUID: WJx5yBuUTxy1Q5vhK1DDKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009401"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:32 -0700
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
Subject: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO ranges
Date: Thu, 24 Sep 2026 12:10:27 +0800
Message-ID: <20260924041032.1096569-11-zhenzhong.duan@intel.com>
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

Build private MMIO descriptors from the TDI report using the PCI TSM
MMIO helpers and accept each private range through TDG.MMIO.ACCEPT.

Keep the descriptors while the device remains locked and tear them
down on acceptance failure and during unlock.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/virt/coco/tdx-guest/connect.c | 75 +++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index d5934e8c0089..fe8d76ba6f81 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -241,6 +241,67 @@ static u8 *tdx_tdi_get_report(struct tdx_devsec *tdevsec, u32 *report_sz)
 	return report;
 }
 
+static struct tdx_devsec *tdx_tdi_mmio_setup(struct tdx_devsec *tdevsec)
+{
+	struct pci_tsm_devsec *devsec_tsm = &tdevsec->pci;
+	struct pci_dev *pdev = devsec_tsm->base_tsm.pdev;
+	int rc;
+
+	struct pci_tsm_mmio *mmio __free(kfree) = pci_tsm_mmio_alloc(pdev, TDISP_OFFSET_RELATIVE);
+	if (!mmio)
+		return ERR_PTR(-EINVAL);
+
+	rc = pci_tsm_mmio_setup(pdev, mmio);
+	if (rc)
+		return ERR_PTR(rc);
+
+	devsec_tsm->mmio = no_free_ptr(mmio);
+	return tdevsec;
+}
+
+static void tdx_tdi_mmio_teardown(struct tdx_devsec *tdevsec)
+{
+	struct pci_tsm_devsec *devsec_tsm = &tdevsec->pci;
+
+	if (!devsec_tsm->mmio)
+		return;
+
+	pci_tsm_mmio_teardown(devsec_tsm->mmio);
+	kfree(devsec_tsm->mmio);
+	devsec_tsm->mmio = NULL;
+}
+DEFINE_FREE(tdx_tdi_mmio_teardown, struct tdx_devsec *,
+	if (!IS_ERR_OR_NULL(_T)) tdx_tdi_mmio_teardown(_T))
+
+static int tdx_tdi_mmio_accept(struct tdx_devsec *tdevsec)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	const struct pci_tsm_mmio *mmio;
+	u32 i;
+
+	mmio = tdevsec->pci.mmio;
+
+	for (i = 0; i < mmio->nr; i++) {
+		const struct pci_tsm_mmio_entry *entry = &mmio->mmio[i];
+		u32 pages = resource_size(&entry->res) >> PAGE_SHIFT;
+		phys_addr_t gpa = entry->res.start;
+		int ret;
+
+		pci_dbg(pdev, "accept MMIO entry %d %pR gpa=0x%llx\n",
+			entry->index, &entry->res, gpa);
+
+		/* Accept the whole range */
+		ret = tdx_mcall_mmio_accept(pci_dev_id(pdev), entry->index, 0, pages, gpa);
+		if (ret) {
+			pci_err(pdev, "Failed to accept MMIO entry %d (gpa=0x%llx), ret=%d\n",
+				entry->index, gpa, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
 {
 	struct device_evidence_object *tsm_report;
@@ -299,6 +360,8 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
 	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
 		return;
 
+	tdx_tdi_mmio_teardown(tdevsec);
+
 	kfree(evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT].data);
 	kfree(evidence);
 	kfree(tdevsec);
@@ -306,6 +369,18 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
 
 static int tdx_devsec_run(struct pci_dev *pdev)
 {
+	struct tdx_devsec *tdevsec = to_tdx_devsec(pdev->tsm);
+	int ret;
+
+	struct tdx_devsec *tdevsec_mmio __free(tdx_tdi_mmio_teardown) =
+		tdx_tdi_mmio_setup(tdevsec);
+	if (IS_ERR(tdevsec_mmio))
+		return PTR_ERR(tdevsec_mmio);
+
+	ret = tdx_tdi_mmio_accept(tdevsec);
+	if (ret)
+		return ret;
+
 	return -EOPNOTSUPP;
 }
 
-- 
2.52.0

