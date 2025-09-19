Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D5313E2F
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291766; cv=none; b=PZ0d1MdWVfc79YCHAElPLhWLvomaIsaHBUuy0QSGhxNDXKVwlXivTt7TdlpAAckx4iy3pmVMn/6bSNj3AB9xZmxGy73PypdWHDwU/XfiktImbb5es4ELB/BzmdUhT7aaKZn3XxAhrzEHQNZlxKGyGLz40hCptGITuDXVlQep9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291766; c=relaxed/simple;
	bh=oGBBuGbInNhB5lho2xIBMMPvAzNyE4JN5rZbNu2/hnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmejOytGKWSCDwvbFHGeDRYatYbXang+iiujP2WF07fqtAoMc484rP/XYnqlsFvkUhwtfdjA7dOjtuJWvlkwEIXfceoxW5EpYWOsObjVuE9gQ5idmLB/TBQHri5nJhthEOF7tfXIUdVfBudKxAv5DS8UoieSm6TZfOpmx1E0Dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEqG+lSg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEqG+lSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291764; x=1789827764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGBBuGbInNhB5lho2xIBMMPvAzNyE4JN5rZbNu2/hnw=;
  b=lEqG+lSgGJ/D14bMrJWNz7nBloQeRI8u1hYiw3zmbDF6wk3pk/OcssHG
   /2TIlfyB5T201zfuZnLZgzpDIIsA10HWH8BsQ+gnMdOZEdOBL6YC5kcq7
   NUxiLpZCfKW9eL53yCXJy9IPjFjga755U0ru5+sC3AXF+omBXNQfHL3oR
   DMjnp+fn2/7xzNezfbPwdXNTqqvI1Zqhf4RRRlHBsps9wZteUtNDYDF6R
   haTWlkrXLGPKpFVJKznOvTbu4Se+tWW88q58mjmzyJKxmPoe/nJp5dac3
   4B2JywrTMsuyqCBmwUVokAPNdaT7NOaP7U3gDwCLLphVEglvW4V12zE6X
   Q==;
X-CSE-ConnectionGUID: BTLapT4QSOK6kRDW09KalQ==
X-CSE-MsgGUID: lcmWsAK+QEajXpMScDUmqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750545"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:39 -0700
X-CSE-ConnectionGUID: a1XxVkQsR8a+FdRD6gA7+g==
X-CSE-MsgGUID: GYLDOE+uT4ObvrX1rAlT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655030"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:38 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [RFC PATCH 13/27] iommu/vt-d: Reserve the MSB domain ID bit for the TDX module
Date: Fri, 19 Sep 2025 07:22:22 -0700
Message-ID: <20250919142237.418648-14-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919142237.418648-1-dan.j.williams@intel.com>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lu Baolu <baolu.lu@linux.intel.com>

The Intel TDX Connect Architecture Specification defines some enhancements
for the VT-d architecture to introduce IOMMU support for TEE-IO requests.
Section 2.2, 'Trusted DMA' states that:

I/O TLB and DID Isolation – When IOMMU is enabled to support TDX Connect,
the IOMMU restricts the VMM’s DID setting, reserving the MSB bit for the
TDX module. The TDX module always sets this reserved bit on the trusted
DMA table. IOMMU tags IOTLB, PASID cache, and context entries to indicate
whether they were created from TEE-IO transactions, ensuring isolation
between TEE and non-TEE requests in translation caches.

Reserve the MSB in the domain ID for the TDX module's use.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
[djbw: todo: replace SOC table with ACPI table detect]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/iommu/intel/dmar.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index a54934c0536f..3ae177463774 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -29,6 +29,8 @@
 #include <linux/numa.h>
 #include <linux/limits.h>
 #include <asm/irq_remapping.h>
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
 
 #include "iommu.h"
 #include "../irq_remapping.h"
@@ -1033,6 +1035,31 @@ static int map_iommu(struct intel_iommu *iommu, struct dmar_drhd_unit *drhd)
 	return err;
 }
 
+static bool platform_is_tdxc_enhanced(void)
+{
+	return (boot_cpu_data.x86_vfm == INTEL_GRANITERAPIDS_D ||
+		boot_cpu_data.x86_vfm == INTEL_GRANITERAPIDS_X);
+}
+
+static unsigned long iommu_calculate_max_domain_id(struct intel_iommu *iommu)
+{
+	unsigned long ndoms = cap_ndoms(iommu->cap);
+
+	/*
+	 * Intel TDX Connect Architecture Specification, Section 2.2 Trusted DMA
+	 *
+	 * When IOMMU is enabled to support TDX Connect, the IOMMU restricts
+	 * the VMM’s DID setting, reserving the MSB bit for the TDX module. The
+	 * TDX module always sets this reserved bit on the trusted DMA table.
+	 */
+	if (platform_is_tdxc_enhanced() && (iommu->ecap & BIT_ULL(50))) {
+		pr_info_once("Most Significant Bit of domain ID reserved.\n");
+		return ndoms >> 1;
+	}
+
+	return ndoms;
+}
+
 static int alloc_iommu(struct dmar_drhd_unit *drhd)
 {
 	struct intel_iommu *iommu;
@@ -1099,7 +1126,7 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
 	spin_lock_init(&iommu->lock);
 	ida_init(&iommu->domain_ida);
 	mutex_init(&iommu->did_lock);
-	iommu->max_domain_id = cap_ndoms(iommu->cap);
+	iommu->max_domain_id = iommu_calculate_max_domain_id(iommu);
 
 	ver = readl(iommu->reg + DMAR_VER_REG);
 	pr_info("%s: reg_base_addr %llx ver %d:%d cap %llx ecap %llx\n",
-- 
2.51.0

