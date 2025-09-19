Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36309314D25
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291771; cv=none; b=co1F2qPigSZj2NF0Y4XTz4Xraq7bI4PCi/Y639j0SRymxdXh4SAitlVLnReszbkZ6DLTP2vL//ZzUqIPtQiS8aUXr91A79QP9uI4eJYlvHayY21fh5MdyHOBLH4MO4S/LgQjfSnRcCS/xz2ebDlBW7V+5JHHCeA8b42OcUqNHTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291771; c=relaxed/simple;
	bh=B/xWxhQzPYzp5YNqQTe9e/ym4DltUHgdmnHVqqykTQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaAEmMaA0kYNhSmZHNj105svkOcWYlNgYy1q/0qCIv1J56CdSCvF0wD/79kLSMV70ZXEVcq+/5tBBsfs84H+65FC5GZzREeZxxFHYrUn+5Vv2NnyXf+dYX4UGhUP3TeVZRx0RxPRDHAdsEfylh6FAopjTSejWsUf13aWI3s97Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOVEYz+Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOVEYz+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291770; x=1789827770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B/xWxhQzPYzp5YNqQTe9e/ym4DltUHgdmnHVqqykTQw=;
  b=SOVEYz+Y4mBWPqEzhCmlh7bSm6V4km76VjPY4Xmt4qvAuc1y5uA/ibv2
   /JN2lZIwCR2NneJuhzaYaS9YvzGiCGv/QctGTbflbGcilD/RS+hBUsNc1
   Ljp2cx25Epm2m8ndfkdfVG2MpSLc4qphlf3BJT+2rKJVT4zTugBupr/s3
   b+XamKWeZnez47L21jPiLwMVg7iuZLb8U2Uc51q/872qvadX42xfpUxI+
   dDIHeQTAoam59OwKGgVMh5ieBh2tzu6bYIbdKj+HtPi8H2428ewFsCVb+
   FsBjgcdqPXqM7ybii5kwCg+VqNmbVvWw0FZvGcnyK2/ANbtjZWc1DF31C
   Q==;
X-CSE-ConnectionGUID: E8htmTVITqWGkWiKnC2kTA==
X-CSE-MsgGUID: sqdgU4fZTd6vNBpVu3rH2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750583"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750583"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:41 -0700
X-CSE-ConnectionGUID: gBMVkTIpRZe/cRKyAHHhhQ==
X-CSE-MsgGUID: J8Z1lHehQRGwvCkcwc0Tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655068"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 25/27] PCI/IDE: Export pci_ide_domain()
Date: Fri, 19 Sep 2025 07:22:34 -0700
Message-ID: <20250919142237.418648-26-dan.j.williams@intel.com>
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

Export another mini helper for TSM drivers to setup root port side IDE.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
[djbw: todo: move this to drivers/pci/ide.c, skip export]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/pci/ide.c       | 3 ++-
 include/linux/pci-ide.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/ide.c b/drivers/pci/ide.c
index 851633b240e3..b56f1a3033a2 100644
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
diff --git a/include/linux/pci-ide.h b/include/linux/pci-ide.h
index 03e7561d4ad9..6a234ece405a 100644
--- a/include/linux/pci-ide.h
+++ b/include/linux/pci-ide.h
@@ -75,6 +75,7 @@ struct pci_ide {
 	struct tsm_dev *tsm_dev;
 };
 
+int pci_ide_domain(struct pci_dev *pdev);
 struct pci_ide_partner *pci_ide_to_settings(struct pci_dev *pdev, struct pci_ide *ide);
 struct pci_ide *pci_ide_stream_alloc(struct pci_dev *pdev);
 void pci_ide_stream_free(struct pci_ide *ide);
-- 
2.51.0

