Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36539412BE7
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 04:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223083; cv=none; b=JoyQIR6kxClNci7+cU2ntolfPrzjNdvDM4LDkiYyXUI1UBawF7OrUuFw7Bc3asjb4fvbP5xlYEHbRoItZWuNpSrwG8KwqBmbkARJo2JynyfOOnVKgw+VZam/AqBHQQnpyM+KGTCzGSkbPahmGZ3Pud5LZPR8bI4UHXSeMU119rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223083; c=relaxed/simple;
	bh=4SPSOTFTGnUrHAWx0mAUBUztII+y1AMpCB1yG6ndk40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZN3gFQ0X2/GggqPxWHDAkO/3aIaZLYvH2eLbOvemf+auxwZBXYDRD/jKmGlsSOi/dyfNRuR3aEH81k8Htt7PAKx80pjCvuAttefFvYZK+v0FU2LbyOOrVYnZW7cKCUr4Oh6ZGbjrj2vhHkVNmFNkgWlRd6HciaRH3SWOlFzlvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDYy55fQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDYy55fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223081; x=1821759081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4SPSOTFTGnUrHAWx0mAUBUztII+y1AMpCB1yG6ndk40=;
  b=bDYy55fQqWqzpAVd0+revhL3aguTeAcHQ33WIbXMHbA9KqgBbfHqibkM
   Wejf4PA3WKXF+KIQ25T4QNuPYKoCHM363mjooHJLo/ejFkP+EFc4Nzf3t
   xnCHREhqUQpcohjIAkdSw5AOitAVaQ313dY+9Ex/H+MVqcuZxToOk2dCV
   ZSwBXR/AmbGc46mgiEPJz5R0H2/6Bu/WzfdDavFyxSft1MKYVpu/eSDpi
   A6UkXUtANjN20wBFUY1yb8qtNnDJgr1L7qOEQf+1iQ1yrNieFS4oIdWXX
   K8V4slLPPIUB6iWlD2rzodgRnV4DDd9+ooJ3NyHq9qHMNBwW0C4zHgi1y
   A==;
X-CSE-ConnectionGUID: Ac7sy6f6TLCFdOU0bbB2ZA==
X-CSE-MsgGUID: JmZ+1Wy3TYWa8iceyrPf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91002502"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91002502"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:21 -0700
X-CSE-ConnectionGUID: 78qXy5V9R2GXT1IVO9sxRQ==
X-CSE-MsgGUID: MXIAFNVdSOWcwm/+8W3PYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5009383"
Received: from unknown (HELO gnr-sp-2s-612.sh.intel.com) ([10.112.229.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:11:17 -0700
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
Subject: [RFC PATCH 07/15] PCI/TSM: Track Device Interface Report MMIO range index
Date: Thu, 24 Sep 2026 12:10:24 +0800
Message-ID: <20260924041032.1096569-8-zhenzhong.duan@intel.com>
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

TDX Connect's TDG.MMIO.ACCEPT interface identifies an MMIO range
by its index in the Device Interface Report. Preserve this report
index when building pci_tsm_mmio entries.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/pci/tsm/core.c  | 1 +
 include/linux/pci-tsm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
index 19ad35f2da4a..3efb9c10d44b 100644
--- a/drivers/pci/tsm/core.c
+++ b/drivers/pci/tsm/core.c
@@ -754,6 +754,7 @@ struct pci_tsm_mmio *pci_tsm_mmio_alloc(struct pci_dev *pdev,
 		entry->res.start = range.start;
 		entry->res.end = range.end;
 		entry->tsm_offset = tsm_offset;
+		entry->index = i;
 		mmio->nr++;
 	}
 
diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index be9f78ca2c1a..e5d9d7af2701 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -165,6 +165,7 @@ struct pci_tsm_pf0 {
 struct pci_tsm_mmio_entry {
 	struct resource res;
 	u64 tsm_offset;
+	int index;
 };
 
 struct pci_tsm_mmio {
-- 
2.52.0

