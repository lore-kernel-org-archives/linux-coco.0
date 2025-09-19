Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC7314B73
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291769; cv=none; b=F9vjLpMRpClvU2CkLXHBkj83+JrFKBpBzisGnkhfIkBfHU3VPQVXB2Xcma7t/bg3ot+AtxwZAe2RodHl2/4Ohp6RpoRE5ImWhThXLKoeb6hzIyPnuyffvVfILfuIduzODCbVWMBK+w8IDxWte+nDtnSFzJhNjlE1JULJDIgkhL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291769; c=relaxed/simple;
	bh=CCNFXsE0RIVS86QkMcedA/aTg7vD86GJNyGOz/BbTws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgOzIlTmpTCs0264LyLjDgEtu5UpiUCv+PhH3jF1T2u77wmP9i5LMIa5av3gxeSu0L0BCdIZg0YL0lbiQQ1dfv5Z7x5CyjoGFTcSUIkPwnfIue8YTSs5uLXxt/tj/T9DKb63tY5sdBrktzzoV9N5rpgIm3mtZJtobNHypDw0au4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzWwroC6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzWwroC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291768; x=1789827768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CCNFXsE0RIVS86QkMcedA/aTg7vD86GJNyGOz/BbTws=;
  b=VzWwroC6dkByQuGAV0bS8hdpTdbwUmWFC4NJcSOJiu/BeBOdwZBvhtxX
   g+zF+b3UKsRLNTq6slxQmnVi4I9aPk7t5GtYCkYeRDTwDak37qrJgcXMu
   sQs97Z7h27aA2F346uEfke4+rvNHbAFnN1Q0JbBQgXH4JqV+RaLJDLXz5
   UzoFsVE256wO1e3MmK4Vi3pUMBkXhS4zIwSpO1hYtTMeZThAnDnXf1Srm
   mHhT8wJZIIh+ZtRIncxxGunkAGPdYmeafeFkLF8Zf0tE7od3ZbWBud+EJ
   QxvVA4w5gX8kXBxL3xAXA/OoHwJboJoO6bsjpN9m33Vn1U9p3Erx5X+8f
   g==;
X-CSE-ConnectionGUID: Bk9u57tXQq+0TDCAX3OsUA==
X-CSE-MsgGUID: BAFYVspKTJWq3eOL42RAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750568"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750568"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:40 -0700
X-CSE-ConnectionGUID: tJSaQHV1TXa2zWIAwX3+4w==
X-CSE-MsgGUID: ouxQZ9iPTh+HE/G7GdIuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655053"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:40 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 20/27] coco/tdx-host: Add connect()/disconnect() handlers prototype
Date: Fri, 19 Sep 2025 07:22:29 -0700
Message-ID: <20250919142237.418648-21-dan.j.williams@intel.com>
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

Add basic skeleton for connect()/disconnect() handlers. The major steps
are SPDM setup first and then IDE selective stream setup.

No detailed TDX Connect implementation.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/virt/coco/tdx-host/tdx-host.c | 49 ++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index f5a869443b15..0d052a1acf62 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -104,13 +104,60 @@ static int __maybe_unused tdx_spdm_msg_exchange(struct tdx_link *tlink,
 	return ret;
 }
 
+static void tdx_spdm_session_teardown(struct tdx_link *tlink)
+{
+}
+
+static int tdx_spdm_session_setup(struct tdx_link *tlink)
+{
+	return -EOPNOTSUPP;
+}
+
+static void tdx_ide_stream_teardown(struct tdx_link *tlink)
+{
+}
+
+static int tdx_ide_stream_setup(struct tdx_link *tlink)
+{
+	return -EOPNOTSUPP;
+}
+
+static void __tdx_link_disconnect(struct tdx_link *tlink)
+{
+	tdx_ide_stream_teardown(tlink);
+	tdx_spdm_session_teardown(tlink);
+}
+
+DEFINE_FREE(__tdx_link_disconnect, struct tdx_link *, if (_T) __tdx_link_disconnect(_T))
+
 static int tdx_link_connect(struct pci_dev *pdev)
 {
-	return -ENXIO;
+	struct tdx_link *tlink = to_tdx_link(pdev->tsm);
+	int ret;
+
+	struct tdx_link *__tlink __free(__tdx_link_disconnect) = tlink;
+	ret = tdx_spdm_session_setup(tlink);
+	if (ret) {
+		pci_err(pdev, "fail to setup spdm session\n");
+		return ret;
+	}
+
+	ret = tdx_ide_stream_setup(tlink);
+	if (ret) {
+		pci_err(pdev, "fail to setup ide stream\n");
+		return ret;
+	}
+
+	tlink = no_free_ptr(__tlink);
+
+	return 0;
 }
 
 static void tdx_link_disconnect(struct pci_dev *pdev)
 {
+	struct tdx_link *tlink = to_tdx_link(pdev->tsm);
+
+	__tdx_link_disconnect(tlink);
 }
 
 static struct pci_tsm_ops tdx_link_ops;
-- 
2.51.0

