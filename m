Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889EF1A9FB8
	for <linux-coco@lists.linux.dev>; Sun, 28 Sep 2025 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759041617; cv=none; b=hlQjG94C3emFgDX80vM0K/ljF5i3J6ZxNlOvi86GJEnqjkjBnGNc4sn67ZnNolXeY/37b54SA/pf22WGSqKarBDFKLqothT6ptguSyc8i4PNqjAUWHH2BjYbgid3r3r6kZZep1Hm6cE6dhus1RTfXwBtm0CMhwhLQ2mgzbCruvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759041617; c=relaxed/simple;
	bh=OLMbieYzIb5XioIjGjwsnk6KFQEqAC4Vf5edZMr1iv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UWhu2j3vRhUqy6VO1fB9KGzKs4nHfr/wdpYur77jquNxJZg08kNPWX6K0CR4y4mVYpsz8VeAww/0C5PIO+BqfSdJiLXH3ajxYT+06iC9Ml+sAlNkh5CFraK8aKDSh5s6K8rGm9oWz6aI2EbboHrLB0UEBjJbz/NydpjHO7lX330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGBh1sXx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGBh1sXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759041616; x=1790577616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OLMbieYzIb5XioIjGjwsnk6KFQEqAC4Vf5edZMr1iv8=;
  b=iGBh1sXxll3ht9LjkXnbBQBtMWfX9LeC3Hlfm4tMRMiNI6utvMyw8xb/
   NKK+mn1OwNX5S8uJGHPfUAKO3MoSkTQkYJaJhG5+esy9xrVjix6bwYMly
   EicblNVQYYyNUWpy8Kizgg2OTz5Ykt0HqmdyLttv3LZIkMujSVAgou03A
   6GbyCJj+3+0JssDaG+PMHpzm09y7HbcyNhCa5Bsz72yhZTsHwaqvtvN/4
   HTu7ar3YVCiUd2R3DPI+kwESfYLbPw5MU4kJuoumK/A7lZRbFL5a4OOOY
   IMBGo71oenQYrUdsZEvljLdXXR/jo+/b/gIi5ezoqj0TFyOp0Ry8N+dej
   g==;
X-CSE-ConnectionGUID: HEFreuUeTo2BMwBXPx2bhQ==
X-CSE-MsgGUID: PpIydQkoRr+uaDUelW/Vbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61228527"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61228527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 23:40:15 -0700
X-CSE-ConnectionGUID: g0XnQIQJRo6oXMDG5lt09Q==
X-CSE-MsgGUID: KpNjlxSwS7e7wzNjMDtoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="177088835"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 23:40:12 -0700
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
Subject: [PATCH 0/3] Address Association Register setup for RP
Date: Sun, 28 Sep 2025 14:27:53 +0800
Message-Id: <20250928062756.2188329-1-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is for Address Association Register setup for RP. It is
based on devsec/tdx but the first 2 patches could be cleanly applied to
devsec/staging.

The last patch is not for apply. It takes TDX Connect as an example to
illustrate the usage of these newly introduced helpers.

ARM is expected to get benifit from this extra support in
pci_ide_stream_setup(). Intel TDX Connect should retrieve the address
range info from pci_ide.partner[PCI_IDE_RP].mem64 and use firmware call
for setup. AMD is expected to bypass the setup or does the setup but no
harm.


Xu Yilun (3):
  PCI/IDE: Add/export mini helpers for platform TSM drivers
  PCI/IDE: Add Address Association Register setup for RP
  coco/tdx-host: Illustrate IDE Address Association Register setup

 include/linux/pci-ide.h               | 17 +++++++
 drivers/pci/ide.c                     | 72 ++++++++++++++++++++++++---
 drivers/virt/coco/tdx-host/tdx-host.c | 33 ++----------
 3 files changed, 87 insertions(+), 35 deletions(-)

-- 
2.25.1

