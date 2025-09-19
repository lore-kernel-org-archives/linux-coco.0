Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06966314B83
	for <linux-coco@lists.linux.dev>; Fri, 19 Sep 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291770; cv=none; b=J3ULxn/Jd5BmlBGFp2SLXnJ6y3xcCjtCVCEfYPUjjJsHUmG8oaPAvYiCFNIYBRJDGqbdThu0lpFGG5iBZwOQMeb3o46iUZwkR3LouVKnWs4Ct/fUX8oF6JnubEW2lIwTWoPtM4VpadkYHMoxxG/Cc5IkBtC97ntrKiNjqOnS4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291770; c=relaxed/simple;
	bh=t4xS4POzAfYHRG2QoOL9x3X0dblERfi5cM6g0JJy2iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCFA+EhfirVDUY66Tf8KJQ/1ShEYcGZne78uBoRzKSpIDjiks1jWpQsS2W6Z/63t/sB6otgUx1wLuL3E5KedN3QjQpihlWg/PYbXZDWhJb/kyvBHkLRiNb0m+1eD+z+Nu89R6wAy2skof4ZK5CdUAMwxDEv7KSgFXqKynNq5GPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9GAkugs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9GAkugs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291769; x=1789827769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4xS4POzAfYHRG2QoOL9x3X0dblERfi5cM6g0JJy2iU=;
  b=I9GAkugsJPp3iQ6eUtxWb6D70nysXkVEbkpzaJR4nkCHjOx8If0FE/AS
   O4sRgSIKfnF4u9LT4opDKt53UCqGjxI0rj37itxLcJMpde1uzNX+rL26x
   DGT5D6W/yGjeoKuihzrA2mgIUTbHwlXJbd0rCEIK04Hw169OODeRhTIZx
   7nt50Q7sYZICDG5ZxN3EYI0rYF73Fb5ZGDxcaIdTV56JBObnv/T1PFbSO
   zQjUFZX5ff5vsLFg46ZL82FKGUvGYobkenyZNSotUXqK9rb72QofhXrBT
   ZFl+kCFrRaqpo+PBbEw5cJYvCScsggmkduwa76olc3lrrmA1U0zsLG0x1
   Q==;
X-CSE-ConnectionGUID: Y4R0Ha09RNOUVMj0xXgZZg==
X-CSE-MsgGUID: JxLQRoBmQjq/u7lfFL17rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60750577"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60750577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:22:41 -0700
X-CSE-ConnectionGUID: McjDPyQ/Rhe+OK27oqfhwQ==
X-CSE-MsgGUID: jjisDF6TQrKFCkLHVwbNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176655062"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 07:22:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: xin@zytor.com,
	chao.gao@intel.com,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH 23/27] PCI: iov: Export pci_iov_virtfn_bus()
Date: Fri, 19 Sep 2025 07:22:32 -0700
Message-ID: <20250919142237.418648-24-dan.j.williams@intel.com>
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

Export pci_iov_virtfn_bus() for tdx-host module. Use it find all PCIe
VF devices associate to a PF0, then calculate the address ranges for IDE
Address Association Registers.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
[djbw: todo: drop this export and teach drivers/pci/ide.c to do this]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/pci/iov.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index ac4375954c94..d1bd3419e606 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -28,6 +28,7 @@ int pci_iov_virtfn_bus(struct pci_dev *dev, int vf_id)
 	return dev->bus->number + ((dev->devfn + dev->sriov->offset +
 				    dev->sriov->stride * vf_id) >> 8);
 }
+EXPORT_SYMBOL_GPL(pci_iov_virtfn_bus);
 
 int pci_iov_virtfn_devfn(struct pci_dev *dev, int vf_id)
 {
-- 
2.51.0

