Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A1412BEF
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223078; cv=none; b=F4ls0eiGf1LTaE2j9/ubeRWOLuyGj2AvtrokZghrKLH1zrduAGm0Xo21cizbxc7RIGnjqIGRMbj48DgKKQNzOoWrxQbN3bJDp2PSoP8fTG1K9L1+fOIHzlZ2SztmvYnOKxXpNR1zi6oqn/Kwsv1evAWZyTqaPraAvddQsMxY8Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223078; c=relaxed/simple;
	bh=9Og2FHsTmhhiwP8cJp+XngD7DpsKEKwOSBk9kuEjHoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkDETY1UIYhWU5ZMiEVsVXQabYKaHukXxHfUWXktMGMx1YesB2OpSYWaLbtznrL2MU7Izr4iozilsemCk/VNoFaKnkE3o5DfULNHXYzmmfA+2K5S3WtYekLkzYb1YLJ5o0/y5ccCSom2EI563YN+j5xRG0BekmHfBPqkt30yMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzKs5EDs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzKs5EDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223076; x=1821759076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Og2FHsTmhhiwP8cJp+XngD7DpsKEKwOSBk9kuEjHoI=;
  b=AzKs5EDshB+BCC3rE8lWj+e/hpsXoAa0urE8WcSuph56vYngq03JCEmv
   V95v2y8TlYOVr7jOkeht8vgTSeRTGX1Qhq+rvGmX+5goeiLP5fhCS0Kg4
   G1oKvPJrTY8H+U5BOtV4CzsO3pq1Rs2mP2tFjm3jyodK8olDCzX0/jqzQ
   iAAGSe8uxLS0SMRR5e/xRRMTq5hyq2FEDsAz3YNcNk4tGGDyuPCikmkxA
   g1i4QWFNjQa1FolGQtZUhW+y5IN28XP7cAjhn70TNHOk/x0Z9XNsx7kL0
   D6PlaH3Q9AgQvdsmL6TQUkKoJXTIDOTww7SJaQRHRin57YBDdxwIgJbQQ
   g==;
X-CSE-ConnectionGUID: +YCEMgZ7SgOv1eyvdd3B1g==
X-CSE-MsgGUID: dKFZVeFQReK10Tu+pEHo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002490"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002490"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:16 -0700
X-CSE-ConnectionGUID: 6ZfsxLeVRnqn1uV9b+9IuQ==
X-CSE-MsgGUID: /PA5H6B2RDmhtYDgyuSPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009370"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:11 -0700
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
Subject: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind operations
Date: Thu, 24 Sep 2026 12:10:23 +0800
Message-ID: <20260924041032.1096569-7-zhenzhong.duan@intel.com>
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

Introduce support for binding and unbinding the Trust Device Interface
(TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.

Executing TDCM_OP_BIND transitions the TDI state to a locked state
(TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
to verify this state transition succeeded before finalizing device locking.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/virt/coco/tdx-guest/connect.c | 75 +++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index 1f52a187b30f..e36515fc43ef 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -159,8 +159,67 @@ static bool tdx_is_dev_teeio_support(struct tdx_devsec *tdevsec)
 	return !!rsp->is_supported;
 }
 
+static struct tdx_devsec *tdx_tdi_bind_dev(struct tdx_devsec *tdevsec)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	int ret;
+
+	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) = tdx_tdcm_alloc(pdev, TDCM_OP_BIND, 0, 0);
+	if (IS_ERR(tdcm))
+		return ERR_CAST(tdcm);
+
+	ret = tdx_tdcm_run(tdcm);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return tdevsec;
+}
+
+static int tdx_tdi_unbind_dev(struct tdx_devsec *tdevsec)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+
+	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) = tdx_tdcm_alloc(pdev, TDCM_OP_UNBIND, 0, 0);
+	if (IS_ERR(tdcm))
+		return PTR_ERR(tdcm);
+
+	return tdx_tdcm_run(tdcm);
+}
+
+DEFINE_FREE(tdx_tdi_unbind_dev, struct tdx_devsec *,
+	if (!IS_ERR_OR_NULL(_T)) tdx_tdi_unbind_dev(_T))
+
+/*
+ * TDI State value returned by TDG.TDI.RD.
+ * Refer to section "TDG.TDI.RD leaf" in the TDX Connect ABI Specification.
+ */
+enum tdi_state {
+	TDI_STATE_CONFIG_UNLOCKED	= 0x0,
+	TDI_STATE_CONFIG_LOCKED		= 0x1,
+	TDI_STATE_RUN			= 0x2,
+	TDI_STATE_ERROR			= 0x3,
+};
+
+enum tdi_field_code {
+	TDI_GET_TDISP_STATE		= 2,
+};
+
+static int tdx_tdi_read_state(struct tdx_devsec *tdevsec, u8 *state)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	u64 value;
+	int ret;
+
+	ret = tdx_mcall_tdi_read(pci_dev_id(pdev), TDI_GET_TDISP_STATE, &value);
+	if (!ret)
+		*state = value;
+
+	return ret;
+}
+
 static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
 {
+	u8 state;
 	int ret;
 
 	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
@@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 	if (!tdx_is_dev_teeio_support(tdevsec))
 		return ERR_PTR(-EOPNOTSUPP);
 
+	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) = tdx_tdi_bind_dev(tdevsec);
+	if (IS_ERR(tdevsec_bind))
+		return ERR_CAST(tdevsec_bind);
+
+	ret = tdx_tdi_read_state(tdevsec, &state);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (state != TDI_STATE_CONFIG_LOCKED)
+		return ERR_PTR(-EIO);
+
+	retain_and_null_ptr(tdevsec_bind);
+
 	return &no_free_ptr(tdevsec)->pci.base_tsm;
 }
 
@@ -181,6 +253,9 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
 {
 	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
 
+	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
+		return;
+
 	kfree(tdevsec);
 }
 
-- 
2.52.0

