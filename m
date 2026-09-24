Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03E411FAC
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223113; cv=none; b=Hheu9WL6GWDKmZj3QRFSF0KqButbPSL5q+xHyG572HNchkCmwJzIxzIUvAG0yaaa+8QkuMg9KH+UeCRHdw6zRfGkOxxyNDNAmUvVFDO1ndfIayWtFYYm4yKbPuG0h+ZhZtBK7XMGk3Ym+DkFE7INwCH2LXlR7tRKzk7Izl4aX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223113; c=relaxed/simple;
	bh=kL9skJ4gJ9Od7x1Y8ZIaXRKi3CJdApVxWMuLWYoxhaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjE6XIMZyK7NihLxExLFN0tJG64k3nApcLJfd7x8Hcbk1ezJUjjaS477GGBZXRjAvtXcSq9kTPikQ0Lhtl5eiJYnFHghFznlKylgzUCp0uQc/sNThHs+UpeRYF65jrin1p9DgxreUZ54kWyvcNIkT5M35vRSKBUid+cYFWRDzRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXSTkCEc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXSTkCEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223111; x=1821759111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kL9skJ4gJ9Od7x1Y8ZIaXRKi3CJdApVxWMuLWYoxhaU=;
  b=IXSTkCEcgUiPMFsVBPa/cCOIKawEXpWbMtBPcgdvVSs7H8gstnaHUi2u
   ZMqaoVL8ZzjSuY4BTIlo7DnAjs8j9XXSUGKor43SgjeGQqLfviqMimINZ
   rkQY06s5/aXnmjaVKyzM1GMTB0wzba8I80XiM8HQUzcngb0Dy8GrfLrgB
   VsPzxybrm5kpgXWrD+f7rpD+VwNG1lN1e8MUR81CEVmjr9DG23Q/5sB1Y
   /xvFLaJ6WjW8x2zxOILG8WyKg6LgMZAZL1Xl/CQX7LolwKh2X+egzOsAb
   UEqD8VjvT31GQTP4L8uU0x1IQHsQIZz0Q2rceEd/NM5r4UiPeFhqwVqI4
   g==;
X-CSE-ConnectionGUID: SbkNPpMKRtONVDuJs2cIQg==
X-CSE-MsgGUID: wNSPCE4DQ9iPac7k55wglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002558"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002558"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:48 -0700
X-CSE-ConnectionGUID: IGlRE99KQuGb10f10ePVaQ==
X-CSE-MsgGUID: ZM8bsu59TCeqgjHs9g3Gqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009439"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:43 -0700
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
Subject: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device Interface (TDI) activation
Date: Thu, 24 Sep 2026 12:10:29 +0800
Message-ID: <20260924041032.1096569-13-zhenzhong.duan@intel.com>
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

Store the bind session ID obtained after binding the TDI which is used
by TDG.TDI.START to verify same bind session established by host before
activation.

Add tdx_tdi_start_dev() to signal guest readiness to the TDX module and
issue the TDCM_OP_START_TDI hypercall for the host to complete activation.

The run callback accepts private MMIO ranges, starts the TDI, and verifies
that it reaches TDI_STATE_RUN, finally notifies DMA sub-system device's
ready to DMA to private memory. Note that private DMA is enabled separately
during driver attach by accepting the default DMAR entry.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/virt/coco/tdx-guest/connect.c | 45 ++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index fe8d76ba6f81..a9d41fd38b64 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -130,6 +130,8 @@ DEFINE_FREE(tdx_tdcm_free, struct tdcm_ctx *,
 
 struct tdx_devsec {
 	struct pci_tsm_devsec pci;
+
+	u64 bind_session_id;
 };
 
 static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
@@ -202,6 +204,7 @@ enum tdi_state {
 
 enum tdi_field_code {
 	TDI_GET_TDISP_STATE		= 2,
+	TDI_GET_BIND_SESSION_ID		= 5,
 };
 
 static int tdx_tdi_read_state(struct tdx_devsec *tdevsec, u8 *state)
@@ -302,10 +305,27 @@ static int tdx_tdi_mmio_accept(struct tdx_devsec *tdevsec)
 	return 0;
 }
 
+static int tdx_tdi_start_dev(struct tdx_devsec *tdevsec)
+{
+	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
+	int ret;
+
+	ret = tdx_mcall_tdi_start(pci_dev_id(pdev), tdevsec->bind_session_id);
+	if (ret)
+		return ret;
+
+	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) = tdx_tdcm_alloc(pdev, TDCM_OP_START_TDI, 0, 0);
+	if (IS_ERR(tdcm))
+		return PTR_ERR(tdcm);
+
+	return tdx_tdcm_run(tdcm);
+}
+
 static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
 {
 	struct device_evidence_object *tsm_report;
 	struct device_evidence *evidence;
+	u64 session_id;
 	u32 report_sz;
 	u8 state;
 	int ret;
@@ -325,6 +345,12 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
 	if (IS_ERR(tdevsec_bind))
 		return ERR_CAST(tdevsec_bind);
 
+	ret = tdx_mcall_tdi_read(pci_dev_id(pdev), TDI_GET_BIND_SESSION_ID, &session_id);
+	if (ret)
+		return ERR_PTR(ret);
+
+	tdevsec->bind_session_id = session_id;
+
 	u8 *report __free(kfree) = tdx_tdi_get_report(tdevsec, &report_sz);
 	if (IS_ERR(report))
 		return ERR_CAST(report);
@@ -362,6 +388,7 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
 
 	tdx_tdi_mmio_teardown(tdevsec);
 
+	dma_set_cc_private(&tsm->pdev->dev, false);
 	kfree(evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT].data);
 	kfree(evidence);
 	kfree(tdevsec);
@@ -370,6 +397,7 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
 static int tdx_devsec_run(struct pci_dev *pdev)
 {
 	struct tdx_devsec *tdevsec = to_tdx_devsec(pdev->tsm);
+	u8 state;
 	int ret;
 
 	struct tdx_devsec *tdevsec_mmio __free(tdx_tdi_mmio_teardown) =
@@ -381,7 +409,22 @@ static int tdx_devsec_run(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	return -EOPNOTSUPP;
+	ret = tdx_tdi_start_dev(tdevsec);
+	if (ret)
+		return ret;
+
+	ret = tdx_tdi_read_state(tdevsec, &state);
+	if (ret)
+		return ret;
+
+	if (state != TDI_STATE_RUN) {
+		pci_err(pdev, "TDI failed to reach RUN state, current state: 0x%x\n", state);
+		return -EIO;
+	}
+
+	dma_set_cc_private(&pdev->dev, true);
+	retain_and_null_ptr(tdevsec_mmio);
+	return 0;
 }
 
 static struct pci_tsm_ops tdx_devsec_ops = {
-- 
2.52.0

