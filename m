Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0175314D0F
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291771; cv=none; b=Pql7UBnHBsSwPlgxHhIdiAYs94v62G54n/pLHBWQcbTE1iatziTxioe5Cm7R9jlKuMuZttN9RgArArKApNQ5HZplhDQeUbCCm+G+p9sSCDYYSkhbDvfca6ygk3oOJjtgpFqN4ZoabyN49ccawtmgXmRyPqfeFErpRXMyy/oCq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291771; c=relaxed/simple;
	bh=rrWCXs5psVIzpV2+9ATJlTULVdKRrUwv+Ygb2Vor4uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnrgVAQlWC72tNIOFToeMot/FWa3jv52kfn0emamBV8W7tItk7+mBp67Sp++5xsbhu5abWbLmC0hb4u61FGtmr15Pjf7AZ6SAc33Eymok6nhjnlcwg1fVwyvTcODF0alRcDNhyoTYyk4b0P57zPXRXhnR3xdq4U1GxGRgLCqI5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdCYpRAj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdCYpRAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291770; x=1789827770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rrWCXs5psVIzpV2+9ATJlTULVdKRrUwv+Ygb2Vor4uA=;
  b=kdCYpRAjvYrnQoVQMGCflXnpct0NwbhUZ4mWv9Q7BWs68yQs5lazdGa+
   3yHT2wp5S8aaS3vWIPGglHuwRk5gietdJPdMtQkj7OvS3dGg/CD+5kJ5r
   DiDmob1F2JShpxhuGBOKXlUPTMBlOByvPm315eF9OTq/EWNkJdWgl0p7n
   u/B+i3QjI8QdUiznjR/35m5pzTgMYLxhyJcZHXlDCr+PP79zhgxhh5VEJ
   KJpFCJs1txfeLCtRwUaGwboO80Vdsdk/+oR+h7wEqsJneryY0CltMkFdu
   IXKQsF4Ah0j6750OnayXCenw9Pcp+DVLumUBOyREg3ljN5k/SZ06yixOX
   w==;
X-CSE-ConnectionGUID: O+70+V2ORhKGI1FBeLsghg==
X-CSE-MsgGUID: PxCh5lYtQdCNIA1IRO5qSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750580"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:41 -0700
X-CSE-ConnectionGUID: wIKzyQWsT7WWKTXDQgN1Eg==
X-CSE-MsgGUID: 1OVAoZIAScG5uHc5bQbKSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655065"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 24/27] PCI/IDE: Add helpers for RID/Addr Association Registers setup
Date: Fri, 19 Sep 2025 07:22:33 -0700
Message-ID: <20250919142237.418648-25-dan.j.williams@intel.com>
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

These Macros are mini helpers mainly for TSM drivers to setup root port
side IDE. TDX Connect will use the Macros in later patches.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
[djbw: todo: move and merge with Aneesh's address association in PCI/IDE core]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/pci-ide.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/pci-ide.h b/include/linux/pci-ide.h
index a30f9460b04a..03e7561d4ad9 100644
--- a/include/linux/pci-ide.h
+++ b/include/linux/pci-ide.h
@@ -6,6 +6,20 @@
 #ifndef __PCI_IDE_H__
 #define __PCI_IDE_H__
 
+#define SEL_ADDR1_LOWER GENMASK(31, 20)
+#define SEL_ADDR_UPPER GENMASK_ULL(63, 32)
+#define PREP_PCI_IDE_SEL_ADDR1(base, limit)                    \
+	(FIELD_PREP(PCI_IDE_SEL_ADDR_1_VALID, 1) |             \
+	 FIELD_PREP(PCI_IDE_SEL_ADDR_1_BASE_LOW,          \
+		    FIELD_GET(SEL_ADDR1_LOWER, (base))) | \
+	 FIELD_PREP(PCI_IDE_SEL_ADDR_1_LIMIT_LOW,         \
+		    FIELD_GET(SEL_ADDR1_LOWER, (limit))))
+
+#define PREP_PCI_IDE_SEL_RID_2(base, domain)               \
+	(FIELD_PREP(PCI_IDE_SEL_RID_2_VALID, 1) |          \
+	 FIELD_PREP(PCI_IDE_SEL_RID_2_BASE, (base)) | \
+	 FIELD_PREP(PCI_IDE_SEL_RID_2_SEG, (domain)))
+
 enum pci_ide_partner_select {
 	PCI_IDE_EP,
 	PCI_IDE_RP,
-- 
2.51.0

