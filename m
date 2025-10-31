Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5193191B7
	for <linux-coco@lists.linux.dev>; Fri, 31 Oct 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946144; cv=none; b=fEibQOgIUPAjgD6SaslBxt7hhV0exPDAizEc21ixpJSLylg9YXj6wxeKM9fDNCwOXK9OBDiWcmCphMWOi3PRJyJUBI/QM1TP9pdnw8tmii1dZXdQvIXwyyFHcXhx3Vs9WNYoCMOGdG6QEnU6d3yWce70eji4d6j6JVO4MewxTeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946144; c=relaxed/simple;
	bh=EjsivcQ7mzvN3zvnIv2XuKqH3YqomSKkWhzsjDODlDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwFdgIa8IWn3P95NnrRVdm/oIWGupnuYfasLTgt61HSKCQEbUsES/KBdN3QasNroQfH71IJ7VhC5if0/lkzUhlNnSBbkPYdEhRdLBoDSwVPxDhX61Lm6B9/0S7VeKUUB4+UN/TArUbHshI9iGNOG1rxs9YptuNxOwvQo1hy9LG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAEjuQUF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAEjuQUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761946142; x=1793482142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EjsivcQ7mzvN3zvnIv2XuKqH3YqomSKkWhzsjDODlDo=;
  b=NAEjuQUFCepmcU1UxQFGMLd0RMuuWPBSkKijzuWijQ5nZlopAGJwmLPa
   zFmbwXFHI37mRhGaZZzTtLJKXkTkIkW9KLbgKrdg7UchxkPrrlMFx3tzo
   t6Ofcwo+xXqqzKUyjH9n5bJ6lmH5yk0cEbb8soDIBrBVFFM82To9qX/4+
   S5afyn3S6QtN2GmeDovdlm9JqpeeAFgZLvd2qr3FFfMT9hdR4CX82Ha/a
   zu9VWp8niUtbkKw5XASKYUl1AbE1QDqa6SpTazyHMajS1xi/5RCH+uiEF
   dl+gmOWZwSSYfqYRMzjni3/bCGBWHkDHNRuPI71P4GLR/XQwSFJ1srpze
   A==;
X-CSE-ConnectionGUID: S0t/19a1TDuDs+ITnyQVEw==
X-CSE-MsgGUID: 3QdzJutkRIiuJPfUv90KLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64043621"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64043621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:28:58 -0700
X-CSE-ConnectionGUID: ZKHo/JohRWWM8vT4GvbdaA==
X-CSE-MsgGUID: q2Pr+ZzwSuaZbBO/BjGA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="216986661"
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
Subject: [PATCH v8 3/9] PCI: Introduce pci_walk_bus_reverse(), for_each_pci_dev_reverse()
Date: Fri, 31 Oct 2025 14:28:55 -0700
Message-ID: <20251031212902.2256310-4-dan.j.williams@intel.com>
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

PCI/TSM, the PCI core functionality for the PCIe TEE Device Interface
Security Protocol (TDISP), has a need to walk all subordinate functions of
a Device Security Manager (DSM) to setup a device security context. A DSM
is physical function 0 of multi-function or SR-IOV device endpoint, or it
is an upstream switch port.

In error scenarios or when a TEE Security Manager (TSM) device is removed
it needs to unwind all established DSM contexts.

Introduce reverse versions of PCI device iteration helpers to mirror the
setup path and ensure that dependent children are handled before parents.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/device/bus.h |  3 ++
 include/linux/pci.h        | 11 +++++++
 drivers/base/bus.c         | 38 +++++++++++++++++++++++
 drivers/pci/bus.c          | 39 ++++++++++++++++++++++++
 drivers/pci/search.c       | 62 +++++++++++++++++++++++++++++++++-----
 5 files changed, 145 insertions(+), 8 deletions(-)

diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index f5a56efd2bd6..99b1002b3e31 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -150,6 +150,9 @@ int bus_for_each_dev(const struct bus_type *bus, struct device *start,
 		     void *data, device_iter_t fn);
 struct device *bus_find_device(const struct bus_type *bus, struct device *start,
 			       const void *data, device_match_t match);
+struct device *bus_find_device_reverse(const struct bus_type *bus,
+				       struct device *start, const void *data,
+				       device_match_t match);
 /**
  * bus_find_device_by_name - device iterator for locating a particular device
  * of a specific name.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4402ca931124..b6a12a82be12 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -582,6 +582,8 @@ struct pci_dev *pci_alloc_dev(struct pci_bus *bus);
 
 #define	to_pci_dev(n) container_of(n, struct pci_dev, dev)
 #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
+#define for_each_pci_dev_reverse(d) \
+	while ((d = pci_get_device_reverse(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
 
 static inline int pci_channel_offline(struct pci_dev *pdev)
 {
@@ -1242,6 +1244,8 @@ u64 pci_get_dsn(struct pci_dev *dev);
 
 struct pci_dev *pci_get_device(unsigned int vendor, unsigned int device,
 			       struct pci_dev *from);
+struct pci_dev *pci_get_device_reverse(unsigned int vendor, unsigned int device,
+				       struct pci_dev *from);
 struct pci_dev *pci_get_subsys(unsigned int vendor, unsigned int device,
 			       unsigned int ss_vendor, unsigned int ss_device,
 			       struct pci_dev *from);
@@ -1661,6 +1665,8 @@ int pci_scan_bridge(struct pci_bus *bus, struct pci_dev *dev, int max,
 
 void pci_walk_bus(struct pci_bus *top, int (*cb)(struct pci_dev *, void *),
 		  void *userdata);
+void pci_walk_bus_reverse(struct pci_bus *top,
+			  int (*cb)(struct pci_dev *, void *), void *userdata);
 int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
@@ -2049,6 +2055,11 @@ static inline struct pci_dev *pci_get_device(unsigned int vendor,
 					     struct pci_dev *from)
 { return NULL; }
 
+static inline struct pci_dev *pci_get_device_reverse(unsigned int vendor,
+						     unsigned int device,
+						     struct pci_dev *from)
+{ return NULL; }
+
 static inline struct pci_dev *pci_get_subsys(unsigned int vendor,
 					     unsigned int device,
 					     unsigned int ss_vendor,
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 5e75e1bce551..d19dae8f9d1b 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -334,6 +334,19 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
+static struct device *prev_device(struct klist_iter *i)
+{
+	struct klist_node *n = klist_prev(i);
+	struct device *dev = NULL;
+	struct device_private *dev_prv;
+
+	if (n) {
+		dev_prv = to_device_private_bus(n);
+		dev = dev_prv->device;
+	}
+	return dev;
+}
+
 /**
  * bus_for_each_dev - device iterator.
  * @bus: bus type.
@@ -414,6 +427,31 @@ struct device *bus_find_device(const struct bus_type *bus,
 }
 EXPORT_SYMBOL_GPL(bus_find_device);
 
+struct device *bus_find_device_reverse(const struct bus_type *bus,
+				       struct device *start, const void *data,
+				       device_match_t match)
+{
+	struct subsys_private *sp = bus_to_subsys(bus);
+	struct klist_iter i;
+	struct device *dev;
+
+	if (!sp)
+		return NULL;
+
+	klist_iter_init_node(&sp->klist_devices, &i,
+			     (start ? &start->p->knode_bus : NULL));
+	while ((dev = prev_device(&i))) {
+		if (match(dev, data)) {
+			get_device(dev);
+			break;
+		}
+	}
+	klist_iter_exit(&i);
+	subsys_put(sp);
+	return dev;
+}
+EXPORT_SYMBOL_GPL(bus_find_device_reverse);
+
 static struct device_driver *next_driver(struct klist_iter *i)
 {
 	struct klist_node *n = klist_next(i);
diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index f26aec6ff588..b8b17f825bc0 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -8,6 +8,7 @@
  */
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/cleanup.h>
 #include <linux/pci.h>
 #include <linux/errno.h>
 #include <linux/ioport.h>
@@ -432,6 +433,27 @@ static int __pci_walk_bus(struct pci_bus *top, int (*cb)(struct pci_dev *, void
 	return ret;
 }
 
+static int __pci_walk_bus_reverse(struct pci_bus *top,
+				  int (*cb)(struct pci_dev *, void *),
+				  void *userdata)
+{
+	struct pci_dev *dev;
+	int ret = 0;
+
+	list_for_each_entry_reverse(dev, &top->devices, bus_list) {
+		if (dev->subordinate) {
+			ret = __pci_walk_bus_reverse(dev->subordinate, cb,
+						     userdata);
+			if (ret)
+				break;
+		}
+		ret = cb(dev, userdata);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
 /**
  *  pci_walk_bus - walk devices on/under bus, calling callback.
  *  @top: bus whose devices should be walked
@@ -453,6 +475,23 @@ void pci_walk_bus(struct pci_bus *top, int (*cb)(struct pci_dev *, void *), void
 }
 EXPORT_SYMBOL_GPL(pci_walk_bus);
 
+/**
+ * pci_walk_bus_reverse - walk devices on/under bus, calling callback.
+ * @top: bus whose devices should be walked
+ * @cb: callback to be called for each device found
+ * @userdata: arbitrary pointer to be passed to callback
+ *
+ * Same semantics as pci_walk_bus(), but walks the bus in reverse order.
+ */
+void pci_walk_bus_reverse(struct pci_bus *top,
+			  int (*cb)(struct pci_dev *, void *), void *userdata)
+{
+	down_read(&pci_bus_sem);
+	__pci_walk_bus_reverse(top, cb, userdata);
+	up_read(&pci_bus_sem);
+}
+EXPORT_SYMBOL_GPL(pci_walk_bus_reverse);
+
 void pci_walk_bus_locked(struct pci_bus *top, int (*cb)(struct pci_dev *, void *), void *userdata)
 {
 	lockdep_assert_held(&pci_bus_sem);
diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index 53840634fbfc..e6e84dc62e82 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -282,6 +282,45 @@ static struct pci_dev *pci_get_dev_by_id(const struct pci_device_id *id,
 	return pdev;
 }
 
+static struct pci_dev *pci_get_dev_by_id_reverse(const struct pci_device_id *id,
+						 struct pci_dev *from)
+{
+	struct device *dev;
+	struct device *dev_start = NULL;
+	struct pci_dev *pdev = NULL;
+
+	if (from)
+		dev_start = &from->dev;
+	dev = bus_find_device_reverse(&pci_bus_type, dev_start, (void *)id,
+				      match_pci_dev_by_id);
+	if (dev)
+		pdev = to_pci_dev(dev);
+	pci_dev_put(from);
+	return pdev;
+}
+
+enum pci_search_direction {
+	PCI_SEARCH_FORWARD,
+	PCI_SEARCH_REVERSE,
+};
+
+static struct pci_dev *__pci_get_subsys(unsigned int vendor, unsigned int device,
+				 unsigned int ss_vendor, unsigned int ss_device,
+				 struct pci_dev *from, enum pci_search_direction dir)
+{
+	struct pci_device_id id = {
+		.vendor = vendor,
+		.device = device,
+		.subvendor = ss_vendor,
+		.subdevice = ss_device,
+	};
+
+	if (dir == PCI_SEARCH_FORWARD)
+		return pci_get_dev_by_id(&id, from);
+	else
+		return pci_get_dev_by_id_reverse(&id, from);
+}
+
 /**
  * pci_get_subsys - begin or continue searching for a PCI device by vendor/subvendor/device/subdevice id
  * @vendor: PCI vendor id to match, or %PCI_ANY_ID to match all vendor ids
@@ -302,14 +341,8 @@ struct pci_dev *pci_get_subsys(unsigned int vendor, unsigned int device,
 			       unsigned int ss_vendor, unsigned int ss_device,
 			       struct pci_dev *from)
 {
-	struct pci_device_id id = {
-		.vendor = vendor,
-		.device = device,
-		.subvendor = ss_vendor,
-		.subdevice = ss_device,
-	};
-
-	return pci_get_dev_by_id(&id, from);
+	return __pci_get_subsys(vendor, device, ss_vendor, ss_device, from,
+				PCI_SEARCH_FORWARD);
 }
 EXPORT_SYMBOL(pci_get_subsys);
 
@@ -334,6 +367,19 @@ struct pci_dev *pci_get_device(unsigned int vendor, unsigned int device,
 }
 EXPORT_SYMBOL(pci_get_device);
 
+/*
+ * Same semantics as pci_get_device(), except walks the PCI device list
+ * in reverse discovery order.
+ */
+struct pci_dev *pci_get_device_reverse(unsigned int vendor,
+				       unsigned int device,
+				       struct pci_dev *from)
+{
+	return __pci_get_subsys(vendor, device, PCI_ANY_ID, PCI_ANY_ID, from,
+				PCI_SEARCH_REVERSE);
+}
+EXPORT_SYMBOL(pci_get_device_reverse);
+
 /**
  * pci_get_class - begin or continue searching for a PCI device by class
  * @class: search for a PCI device with this class designation
-- 
2.51.0

