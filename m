Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E317261B65
	for <linux-coco@lists.linux.dev>; Sun, 28 Sep 2025 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759041619; cv=none; b=tgw7sZaqi9COzZqipOqP+4mq1074c3SRax6NaigyrrI4ub6u2NsYb8/tZ6lo2g19tvK7LhJ9yX70uMQwrX1cRpaKhIUnOKNEtnKqihFqcv2MLI7E+29rIgWw69t0SVO7Ai5bCAXmTKlK8uKbrCZX9sIANyPxNcAUZORRH5oHZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759041619; c=relaxed/simple;
	bh=qsbwJQQL7BDBZsPlfUXxgitah970J+393ry2NZtZapg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCC8P9VvJuXI4AB3n7DJyJAxQP9gBBnpO+mWO9eqJNIQflmzaHvIVkTzwbP9XIfIOeQThQ56UK7r/8xzSaiBpRaCFFcAWPUmcIQDFRm1UbbUEII2D2I6rpK8Tip0dU6R+J7UEXQn9QvbJKzclJm22zARoHv/YEDjblqKrmtTLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYRntRB8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYRntRB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759041618; x=1790577618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qsbwJQQL7BDBZsPlfUXxgitah970J+393ry2NZtZapg=;
  b=mYRntRB8D/ZMSVuJwQ9hSoVZHQC9zAGLKmExZUj3R3R2+XEMF9LaRRu5
   ZWhcugfJ9k+WFH8D4GebYFUUm1Q/PWgpQpeXApQnbv7E+RZR63yxQGOSe
   ybey2GehmE2dMEaYQ1sShhu0K00X8ZxBWKyTxnR2sWlyouV0Y9svIC/Ha
   fs7p4mdN4mi5fpc1tDN3ZLouBGWy8wwUYGkqEvDIps+s+D0DbtwbRpqOJ
   zBc+ttyikwyLweT+reF+eAFwTI0k65XkXtm/Gp4utYftsoPN2D5XL+QHA
   5sfG3Lt0N+Zz5Pd5uM5/ihPUWbIShvZpq/fHpjQoa1NgjW2QKn/skTqO0
   w==;
X-CSE-ConnectionGUID: ONz+riNKRaewVUF7xJNVkA==
X-CSE-MsgGUID: PcLgm0kuS265KoirzZJeqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61228532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61228532"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 23:40:18 -0700
X-CSE-ConnectionGUID: JkkdvK2bRP6cnrkTikKkXg==
X-CSE-MsgGUID: 9vMjIjxQSc2Cp7nMKHeR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="177088848"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 23:40:15 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	dan.j.williams@intel.com
Cc: yilun.xu@intel.com,
	yilun.xu@linux.intel.com,
	baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com,
	aneesh.kumar@kernel.org,
	bhelgaas@google.com,
	aik@amd.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] PCI/IDE: Add/export mini helpers for platform TSM drivers
Date: Sun, 28 Sep 2025 14:27:54 +0800
Message-Id: <20250928062756.2188329-2-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250928062756.2188329-1-yilun.xu@linux.intel.com>
References: <20250928062756.2188329-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These mini helpers are mainly for platform TSM drivers to setup root
port side configuration. Root port side IDE settings may require
platform specific firmware calls (e.g. TDX Connect [1]) so could not use
pci_ide_stream_setup(), but may still share these mini helpers cause
they also refer to definitions in IDE specification.

[1]: https://lore.kernel.org/linux-coco/20250919142237.418648-28-dan.j.williams@intel.com/

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 include/linux/pci-ide.h | 6 ++++++
 drivers/pci/ide.c       | 8 +++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/pci-ide.h b/include/linux/pci-ide.h
index a30f9460b04a..5adbd8b81f65 100644
--- a/include/linux/pci-ide.h
+++ b/include/linux/pci-ide.h
@@ -6,6 +6,11 @@
 #ifndef __PCI_IDE_H__
 #define __PCI_IDE_H__
 
+#define PREP_PCI_IDE_SEL_RID_2(base, domain)               \
+	(FIELD_PREP(PCI_IDE_SEL_RID_2_VALID, 1) |          \
+	 FIELD_PREP(PCI_IDE_SEL_RID_2_BASE, (base)) | \
+	 FIELD_PREP(PCI_IDE_SEL_RID_2_SEG, (domain)))
+
 enum pci_ide_partner_select {
 	PCI_IDE_EP,
 	PCI_IDE_RP,
@@ -61,6 +66,7 @@ struct pci_ide {
 	struct tsm_dev *tsm_dev;
 };
 
+int pci_ide_domain(struct pci_dev *pdev);
 struct pci_ide_partner *pci_ide_to_settings(struct pci_dev *pdev, struct pci_ide *ide);
 struct pci_ide *pci_ide_stream_alloc(struct pci_dev *pdev);
 void pci_ide_stream_free(struct pci_ide *ide);
diff --git a/drivers/pci/ide.c b/drivers/pci/ide.c
index 10603f2d2319..7633b8e52399 100644
--- a/drivers/pci/ide.c
+++ b/drivers/pci/ide.c
@@ -345,12 +345,13 @@ void pci_ide_stream_unregister(struct pci_ide *ide)
 }
 EXPORT_SYMBOL_GPL(pci_ide_stream_unregister);
 
-static int pci_ide_domain(struct pci_dev *pdev)
+int pci_ide_domain(struct pci_dev *pdev)
 {
 	if (pdev->fm_enabled)
 		return pci_domain_nr(pdev->bus);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_ide_domain);
 
 struct pci_ide_partner *pci_ide_to_settings(struct pci_dev *pdev, struct pci_ide *ide)
 {
@@ -420,10 +421,7 @@ void pci_ide_stream_setup(struct pci_dev *pdev, struct pci_ide *ide)
 	val = FIELD_PREP(PCI_IDE_SEL_RID_1_LIMIT, settings->rid_end);
 	pci_write_config_dword(pdev, pos + PCI_IDE_SEL_RID_1, val);
 
-	val = FIELD_PREP(PCI_IDE_SEL_RID_2_VALID, 1) |
-	      FIELD_PREP(PCI_IDE_SEL_RID_2_BASE, settings->rid_start) |
-	      FIELD_PREP(PCI_IDE_SEL_RID_2_SEG, pci_ide_domain(pdev));
-
+	val = PREP_PCI_IDE_SEL_RID_2(settings->rid_start, pci_ide_domain(pdev));
 	pci_write_config_dword(pdev, pos + PCI_IDE_SEL_RID_2, val);
 
 	/*
-- 
2.25.1

