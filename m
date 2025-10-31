Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D5325714
	for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946146; cv=none; b=LpcwxWCOz28KsPDfY2vCG3wGLjuQXVz2RhBlXiKLKQey7I8yVJ9dDtaxCC3KWKgIUAh5v4nbGasLRGZMvUP8S8Bmh95I1YoGnbEB/y4DfGrMfuuKU7/SZlkF9v4fmHVVbaVxJYcGLtQQvQKyAq5p6Gf3rtzGeig485UP6uQbtII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946146; c=relaxed/simple;
	bh=1MoSqvMx8H64Yz4FuXIdtzLwQ2vFAw6PyBFGUiL5j+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAK5lbVxQPEy8y/mCSZwt2Xp4NJSiCC3b8M4kn69HB5HlZaYUqt7u1NYvZqR+juofNCr2LVDmv/dsHo9z5JSIbGw++FObVgCPCWHbAGAlmIMbUq+mV5u5v+feEO4s8kdc/m63JdfGJzXB8J8rPGR4goe0M/259Z9WY/hXl/zp3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9Y0+0XV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9Y0+0XV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761946144; x=1793482144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1MoSqvMx8H64Yz4FuXIdtzLwQ2vFAw6PyBFGUiL5j+c=;
  b=M9Y0+0XVVuPDEa2fmOfxpBvVtIGvPxdfM6xuWqmSGLF82HOlQCcNa9Ui
   i5lxs1Tvn4Ll1hwFbOwzSyX8aofLT3RTjYt4HH+z+Ssh02eJI2Mfi8jrC
   CuZRrrxt4+SEEoI4zsREJYtkK8b4M9ggHV3295vYqzUuqchiIPGZTdya9
   uBZ8cO0bG2ozYK1wBxHHEmpG+6UEk61l1tcM60fkv/GO6/qRGezDzJdf6
   hZSxYpjgVv/gbAgECPOk5u3XPIXDaHrDtWkvbhtgU9Arrq3fUy8hgRYS6
   qHeWr+iHMQ5fRd3Dv06FLPW8OcX9qwwg98dnhb0jmnxXOb/PIGtFDDMeB
   A==;
X-CSE-ConnectionGUID: iDMeTRD/SuKGBgXF86oGdA==
X-CSE-MsgGUID: xh4ycagpR4CDrJlzcCWkxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64043624"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64043624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:28:58 -0700
X-CSE-ConnectionGUID: vDZ17qcORfmMuLAmYxOPMw==
X-CSE-MsgGUID: Cus9rZMRRuCStx8+jL8v6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="216986671"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 14:28:59 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-pci@vger.kernel.org
Cc: linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v8 6/9] PCI: Establish document for PCI host bridge sysfs attributes
Date: Fri, 31 Oct 2025 14:28:58 -0700
Message-ID: <20251031212902.2256310-7-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031212902.2256310-1-dan.j.williams@intel.com>
References: <20251031212902.2256310-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding more host bridge sysfs attributes, document the
existing naming format and 'firmware_node' attribute.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 .../ABI/testing/sysfs-devices-pci-host-bridge | 19 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-pci-host-bridge

diff --git a/Documentation/ABI/testing/sysfs-devices-pci-host-bridge b/Documentation/ABI/testing/sysfs-devices-pci-host-bridge
new file mode 100644
index 000000000000..8c3a652799f1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-pci-host-bridge
@@ -0,0 +1,19 @@
+What:		/sys/devices/pciDDDD:BB
+		/sys/devices/.../pciDDDD:BB
+Contact:	linux-pci@vger.kernel.org
+Description:
+		A PCI host bridge device parents a PCI bus device topology. PCI
+		controllers may also parent host bridges. The DDDD:BB format
+		conveys the PCI domain (ACPI segment) number and root bus number
+		(in hexadecimal) of the host bridge. Note that the domain number
+		may be larger than the 16-bits that the "DDDD" format implies
+		for emulated host-bridges.
+
+What:		pciDDDD:BB/firmware_node
+Contact:	linux-pci@vger.kernel.org
+Description:
+		(RO) Symlink to the platform firmware device object "companion"
+		of the host bridge. For example, an ACPI device with an _HID of
+		PNP0A08 (/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00). See
+		/sys/devices/pciDDDD:BB entry for details about the DDDD:BB
+		format.
diff --git a/MAINTAINERS b/MAINTAINERS
index ebf6988666eb..9b961fb11b09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19896,6 +19896,7 @@ Q:	https://patchwork.kernel.org/project/linux-pci/list/
 B:	https://bugzilla.kernel.org
 C:	irc://irc.oftc.net/linux-pci
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
+F:	Documentation/ABI/testing/sysfs-devices-pci-host-bridge
 F:	Documentation/PCI/
 F:	Documentation/devicetree/bindings/pci/
 F:	arch/x86/kernel/early-quirks.c
-- 
2.51.0

