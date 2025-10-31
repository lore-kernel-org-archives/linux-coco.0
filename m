Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB132863E
	for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946148; cv=none; b=SFmIOVeZ8NBRCQGV/vJOt8E+9Kt09HnhlqtRlHguQwu2U8ETMn5tIGuK0eI1+yen6Kh6ErulXo+7Mnx6jNVZxroNpXGiRfQen3tYrDOt0fcexrPd+sPctANt33AUBIuEDehQ7fLPa/1IP5+0L5+P7OTMtYJ/BRh4lxcfRHb1zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946148; c=relaxed/simple;
	bh=6TDUN02pliVLJKXLTAEIWvwxi4bV004VGXBfK4GQerM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xcwaaiu6I7vV+Ss249GmAevs0HXK/jMEhglpAcnVpU6madTQHBoec2WEQQeRgoNey1CPOAkAivXHZR80km79SJrc1qPoRLVsdT9O6og3BH1NACyTZ5IGDr7XMh16ubfEGlxsQU3cMIo6+FWH1wUM156F2uVzaGE0z2a9yXwNYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO/4Ieg5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO/4Ieg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761946145; x=1793482145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6TDUN02pliVLJKXLTAEIWvwxi4bV004VGXBfK4GQerM=;
  b=GO/4Ieg57YmzYqpKUJniREiX1XUgrtEreGC+ZGfiH9ZpimagSN5Sqsrs
   d163zgqmtv0nVl7+qGo/cbjU8i23U8ZhhwpNcQk3pkuPW0bvzLLqcK7VT
   7WHCBb+xhgPFjYL9z3QE6UuybAtrYxn5Yr8rWj7ZOhVNcrTT4fEgzBPQx
   QsMaVu0JWAZzLiHVQDwA1pCp1dI3VjbOhKN6DQ7onW0ypYmnRKQbVIJX6
   gDtklqZs4LTfxedFQxjPaPPXam/uKeaLKtn7VZ+68fpsPDgobLFR+3fzV
   Hc0ZdXsaZkpIGaZHzCCc2nWbxZ9NEP/N2WNnc/lvNPrqJoiE3mtm+Q6wF
   A==;
X-CSE-ConnectionGUID: erdXfb9zSqWsRyqCj/NZ1Q==
X-CSE-MsgGUID: Hx8fcK+DQJS7dsxkArjIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64043626"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64043626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:28:58 -0700
X-CSE-ConnectionGUID: GEtiZICWQKalrvqvAkQQ2g==
X-CSE-MsgGUID: 6/XX/7drQ86uMcflJawhwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="216986677"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 14:29:00 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-pci@vger.kernel.org
Cc: linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org,
	aik@amd.com,
	aneesh.kumar@kernel.org,
	yilun.xu@linux.intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v8 8/9] PCI/IDE: Report available IDE streams
Date: Fri, 31 Oct 2025 14:29:00 -0700
Message-ID: <20251031212902.2256310-9-dan.j.williams@intel.com>
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

The limited number of link-encryption (IDE) streams that a given set of
host bridges supports is a platform specific detail. Provide
pci_ide_init_nr_streams() as a generic facility for either platform TSM
drivers, or PCI core native IDE, to report the number available streams.
After invoking pci_ide_init_nr_streams() an "available_secure_streams"
attribute appears in PCI host bridge sysfs to convey that count.

Introduce a device-type, @pci_host_bridge_type, now that both a release
method and sysfs attribute groups are being specified for all 'struct
pci_host_bridge' instances.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 .../ABI/testing/sysfs-devices-pci-host-bridge | 12 ++++
 drivers/pci/pci.h                             |  1 +
 include/linux/pci-ide.h                       |  1 +
 drivers/pci/ide.c                             | 67 +++++++++++++++++++
 drivers/pci/probe.c                           | 14 +++-
 5 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-pci-host-bridge b/Documentation/ABI/testing/sysfs-devices-pci-host-bridge
index 2c66e5bb2bf8..b91ec3450811 100644
--- a/Documentation/ABI/testing/sysfs-devices-pci-host-bridge
+++ b/Documentation/ABI/testing/sysfs-devices-pci-host-bridge
@@ -31,3 +31,15 @@ Description:
 		platform specific pool of stream resources shared by the Root
 		Ports in a host bridge. See /sys/devices/pciDDDD:BB entry for
 		details about the DDDD:BB format.
+
+What:		pciDDDD:BB/available_secure_streams
+Contact:	linux-pci@vger.kernel.org
+Description:
+		(RO) When a host bridge has Root Ports that support PCIe IDE
+		(link encryption and integrity protection) there may be a
+		limited number of Selective IDE Streams that can be used for
+		establishing new end-to-end secure links. This attribute
+		decrements upon secure link setup, and increments upon secure
+		link teardown. The in-use stream count is determined by counting
+		stream symlinks. See /sys/devices/pciDDDD:BB entry for details
+		about the DDDD:BB format.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index d3f16be40102..f6ffe5ee4717 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -616,6 +616,7 @@ static inline void pci_doe_sysfs_teardown(struct pci_dev *pdev) { }
 #ifdef CONFIG_PCI_IDE
 void pci_ide_init(struct pci_dev *dev);
 void pci_ide_init_host_bridge(struct pci_host_bridge *hb);
+extern const struct attribute_group pci_ide_attr_group;
 #else
 static inline void pci_ide_init(struct pci_dev *dev) { }
 static inline void pci_ide_init_host_bridge(struct pci_host_bridge *hb) { }
diff --git a/include/linux/pci-ide.h b/include/linux/pci-ide.h
index e638f9429bf9..85645b0a8620 100644
--- a/include/linux/pci-ide.h
+++ b/include/linux/pci-ide.h
@@ -63,6 +63,7 @@ struct pci_ide {
 	const char *name;
 };
 
+void pci_ide_set_nr_streams(struct pci_host_bridge *hb, u16 nr);
 struct pci_ide_partner *pci_ide_to_settings(struct pci_dev *pdev,
 					    struct pci_ide *ide);
 struct pci_ide *pci_ide_stream_alloc(struct pci_dev *pdev);
diff --git a/drivers/pci/ide.c b/drivers/pci/ide.c
index 7643840738fe..4ae3872589fc 100644
--- a/drivers/pci/ide.c
+++ b/drivers/pci/ide.c
@@ -514,3 +514,70 @@ void pci_ide_init_host_bridge(struct pci_host_bridge *hb)
 	hb->nr_ide_streams = 256;
 	ida_init(&hb->ide_stream_ida);
 }
+
+static ssize_t available_secure_streams_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct pci_host_bridge *hb = to_pci_host_bridge(dev);
+	int nr = READ_ONCE(hb->nr_ide_streams);
+	int avail = nr;
+
+	if (!nr)
+		return -ENXIO;
+
+	/*
+	 * Yes, this is inefficient and racy, but it is only for occasional
+	 * platform resource surveys. Worst case is bounded to 256 streams.
+	 */
+	for (int i = 0; i < nr; i++)
+		if (ida_exists(&hb->ide_stream_ida, i))
+			avail--;
+	return sysfs_emit(buf, "%d\n", avail);
+}
+static DEVICE_ATTR_RO(available_secure_streams);
+
+static struct attribute *pci_ide_attrs[] = {
+	&dev_attr_available_secure_streams.attr,
+	NULL
+};
+
+static umode_t pci_ide_attr_visible(struct kobject *kobj, struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pci_host_bridge *hb = to_pci_host_bridge(dev);
+
+	if (a == &dev_attr_available_secure_streams.attr)
+		if (!hb->nr_ide_streams)
+			return 0;
+
+	return a->mode;
+}
+
+const struct attribute_group pci_ide_attr_group = {
+	.attrs = pci_ide_attrs,
+	.is_visible = pci_ide_attr_visible,
+};
+
+/**
+ * pci_ide_set_nr_streams() - sets size of the pool of IDE Stream resources
+ * @hb: host bridge boundary for the stream pool
+ * @nr: number of streams
+ *
+ * Platform PCI init and/or expert test module use only. Limit IDE
+ * Stream establishment by setting the number of stream resources
+ * available at the host bridge. Platform init code must set this before
+ * the first pci_ide_stream_alloc() call if the platform has less than the
+ * default of 256 streams per host-bridge.
+ *
+ * The "PCI_IDE" symbol namespace is required because this is typically
+ * a detail that is settled in early PCI init. I.e. this export is not
+ * for endpoint drivers.
+ */
+void pci_ide_set_nr_streams(struct pci_host_bridge *hb, u16 nr)
+{
+	hb->nr_ide_streams = min(nr, 256);
+	WARN_ON_ONCE(!ida_is_empty(&hb->ide_stream_ida));
+	sysfs_update_group(&hb->dev.kobj, &pci_ide_attr_group);
+}
+EXPORT_SYMBOL_NS_GPL(pci_ide_set_nr_streams, "PCI_IDE");
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 93fa7ba8dfa6..cfacf5bcd073 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -653,6 +653,18 @@ static void pci_release_host_bridge_dev(struct device *dev)
 	kfree(bridge);
 }
 
+static const struct attribute_group *pci_host_bridge_groups[] = {
+#ifdef CONFIG_PCI_IDE
+	&pci_ide_attr_group,
+#endif
+	NULL
+};
+
+static const struct device_type pci_host_bridge_type = {
+	.groups = pci_host_bridge_groups,
+	.release = pci_release_host_bridge_dev,
+};
+
 static void pci_init_host_bridge(struct pci_host_bridge *bridge)
 {
 	INIT_LIST_HEAD(&bridge->windows);
@@ -672,6 +684,7 @@ static void pci_init_host_bridge(struct pci_host_bridge *bridge)
 	bridge->native_dpc = 1;
 	bridge->domain_nr = PCI_DOMAIN_NR_NOT_SET;
 	bridge->native_cxl_error = 1;
+	bridge->dev.type = &pci_host_bridge_type;
 	pci_ide_init_host_bridge(bridge);
 
 	device_initialize(&bridge->dev);
@@ -686,7 +699,6 @@ struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
 		return NULL;
 
 	pci_init_host_bridge(bridge);
-	bridge->dev.release = pci_release_host_bridge_dev;
 
 	return bridge;
 }
-- 
2.51.0

