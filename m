Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733D3C13EE
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223124; cv=none; b=dGXYT2xOMO5g/ogGM5QoMP4A6Bq2IrYduXuMScZ+XnmMPKgS0Er8VFn0SrzNEB6MjWWpHBYhp8odyHklsSYmS3M+6v0iQPQvFYK8/Ya7yb308Z9xrbrISGWePFLVSJ09Gjpvv+N5+u/uWp5C1tQ4xsSj87e0MTEF+ferG3r0Seo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223124; c=relaxed/simple;
	bh=ECLhm6sCglNuE+1p5FlpbPxobLSh1HSDPmI9OUlXDOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCQlGn4URLCwzbahWITxUM4W0s6c8u7RcWYs815bB6UXCQoYowxsJ71suuTpUBZgAvr2Y0oZ8rIXriZtayPDwHjFZpi7FTKZWdlFRVJWXaV+DN90FzueaLnn/O5PdQrcTF3l+5RjMm5eAjLVQg00nFkB0mdsFsuR2iUxHze7ul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyKzNg7I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyKzNg7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223123; x=1821759123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ECLhm6sCglNuE+1p5FlpbPxobLSh1HSDPmI9OUlXDOs=;
  b=SyKzNg7IEWGLemyaitfPV6bm6jnn6cyKyt8y+JRdpjozZnL5/Jr47PHo
   TEzCbNYU68ZF1ncEHNKgWOhWomOL6kBq7xsoobLKjzREV3Fye7mJNzVNO
   7A96Ai3QBubwHFcFBHjCFxBjWern3HTWHR0FpBbR5NOBjE3uIPOFYeaz6
   EBerHIlwpijcf0wSByWpa20nULrO6Wosto9zjLRJEjL3tZ1xPTGvXrBLr
   nbjddKTXFZTVi7Xwd/gaugUkZ/F1azJBH/a48Ee+l5XzYNQkLU+PNiQsR
   7XGetsKWMgAdWN7j3cUjQ0PZqryyrMWpPGkYqOlrJwtei4FuMaptVNE5p
   w==;
X-CSE-ConnectionGUID: vXtIeBC/Qmmotr3ea8ULew==
X-CSE-MsgGUID: Vqho/De4SUOT5UGXv5R+ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002592"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002592"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:12:03 -0700
X-CSE-ConnectionGUID: C7tfZNhqRr2dhGOChfEyRw==
X-CSE-MsgGUID: 2gp6Kz6/Qvq4Apghrw9sTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009503"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:58 -0700
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
Subject: [RFC PATCH 15/15] virt: tdx-guest: Accept default DMAR entry during PCI driver attach
Date: Thu, 24 Sep 2026 12:10:32 +0800
Message-ID: <20260924041032.1096569-16-zhenzhong.duan@intel.com>
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

Before a TDI can perform DMA to guest private memory, its secure DMA
mapping must be accepted. This happens during driver load stage after
MMIO acceptance and TDI activation.

The enable_dma callback issues TDG.DMAR.ACCEPT to set secure PASID
table entry to present state and target non-partitioned TD.

The secure PASID table entry is cleared in unlock stage implicitly
so disable_dma is a no-op currently.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/virt/coco/tdx-guest/connect.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
index a9d41fd38b64..b328caac0a49 100644
--- a/drivers/virt/coco/tdx-guest/connect.c
+++ b/drivers/virt/coco/tdx-guest/connect.c
@@ -427,10 +427,26 @@ static int tdx_devsec_run(struct pci_dev *pdev)
 	return 0;
 }
 
+static int tdx_devsec_enable_dma(struct pci_dev *pdev)
+{
+	int ret = tdx_mcall_dmar_accept(pci_dev_id(pdev), 0);
+
+	if (ret)
+		pci_err(pdev, "Failed to accept DMAR, ret=%d\n", ret);
+
+	return ret;
+}
+
+static void tdx_devsec_disable_dma(struct pci_dev *pdev)
+{
+}
+
 static struct pci_tsm_ops tdx_devsec_ops = {
 	.lock = tdx_devsec_lock,
 	.unlock = tdx_devsec_unlock,
 	.run = tdx_devsec_run,
+	.enable_dma = tdx_devsec_enable_dma,
+	.disable_dma = tdx_devsec_disable_dma,
 };
 
 static void devsec_tsm_remove(void *tsm_dev)
-- 
2.52.0

