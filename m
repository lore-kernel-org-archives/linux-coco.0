Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E43AA19B;
	Mon, 14 Sep 2026 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365932; cv=none; b=BOveDZ+qJbxqIwbo1EWpYk9osD9XID/AZXy8sPlopjOM6u8xMekhyvFfyejO5zppmu6i/0qvFlvFy/Jt95Z/BF649A2tBKrxwTrGrsOnNtplxABw+YLBummRoIgU9YQ3/bvcS1njJRsuyElDi5Pr3EHbzd9rnAv/WvOFXt6jH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365932; c=relaxed/simple;
	bh=NgR71CS7TMBTwhhn9vN4yOcTVsuPu2+/fmjXg0l30/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3nPnrs9isUQ9DxpwivCdQ8LuvOuMYKCN/Y60uua5RSDUhjdd5DD2tTQaNI1R9nqfuluVym9zfmvRv3BuKDTX4tXN7bwXoKNdxwOHcEMTEwQo/o4zj7BQ5ht6YHzywQAvSK44P74u+5HeecP+YFqUq21JRqx4IPAfuSJxsyzBpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZOBHATM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZOBHATM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33321F00893;
	Mon, 14 Sep 2026 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789365928;
	bh=ZcIQ/j6jngQU4pqR+oILh/o4b2CteWgR3HPJyPNCyfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oZOBHATM+mcPoxMX8iMxvr0SRTskmiMeOaXwIsh4sAbIDf3AK+r2v7f6qQpV7SAKR
	 LHtCAzmI8L7ui9SS3iHYASV1js4RKjy5cHQ/5crhXtyd956+peGuurWooaOxSFnXf0
	 5XssmRQwrf03Y+WdvdAqX1utBBYy7Bf1tSrpxX/mZJ6Nr1gNhGXBZM8iHkSjIx6aRu
	 bJsT7l4zkQBQPFaJlqrgAv5gO1jMMgw5RyGRVsGSZWmo8tapFlV2k2oUFDnMfdKjb4
	 c8swGYcZ6da6kxioW++4GKx40GN7OZCqYqXYaQflfCDBM0N5gJRioRawDTSV3AtPWT
	 vVLxujuLghymw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Date: Mon, 14 Sep 2026 11:35:05 +0530
Message-ID: <20260914060511.277948-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914060511.277948-1-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMCCC-discovered firmware services are currently represented by separate
platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
represent independent DT/ACPI-described platform resources; they are
features of the SMCCC firmware interface.

Add an Arm SMCCC bus for services discovered through the SMCCC firmware
interface. The bus provides SMCCC device and driver registration helpers,
name-based matching, modalias generation, and a sysfs modalias attribute so
SMCCC service drivers can bind to discovered firmware services and autoload
as modules.

Follow-up changes can then register SMCCC firmware services as arm-smccc
devices instead of creating independent per-feature platform devices.

Based on arm_ffa code

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/smccc/Makefile     |   2 +-
 drivers/firmware/smccc/bus.c        | 151 ++++++++++++++++++++++++++++
 include/linux/arm-smccc-bus.h       |  48 +++++++++
 include/linux/device-id/arm_smccc.h |  19 ++++
 include/linux/mod_devicetable.h     |   1 +
 scripts/mod/devicetable-offsets.c   |   3 +
 scripts/mod/file2alias.c            |   8 ++
 7 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/smccc/bus.c
 create mode 100644 include/linux/arm-smccc-bus.h
 create mode 100644 include/linux/device-id/arm_smccc.h

diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
index 40d19144a860..68bbff1407b8 100644
--- a/drivers/firmware/smccc/Makefile
+++ b/drivers/firmware/smccc/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
+obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
 obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
new file mode 100644
index 000000000000..caba1a03c997
--- /dev/null
+++ b/drivers/firmware/smccc/bus.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+
+#include <linux/arm-smccc-bus.h>
+#include <linux/slab.h>
+
+static int arm_smccc_bus_match(struct device *dev,
+		const struct device_driver *drv)
+{
+	const struct arm_smccc_device_id *id_table;
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	id_table = to_arm_smccc_driver(drv)->id_table;
+	if (!id_table)
+		return 0;
+
+	while (id_table->func_id) {
+		if (smccc_dev->func_id == id_table->func_id)
+			return 1;
+		id_table++;
+	}
+
+	return 0;
+}
+
+static int arm_smccc_bus_probe(struct device *dev)
+{
+	struct arm_smccc_driver *smccc_drv = to_arm_smccc_driver(dev->driver);
+
+	return smccc_drv->probe(to_arm_smccc_device(dev));
+}
+
+static void arm_smccc_bus_remove(struct device *dev)
+{
+	struct arm_smccc_driver *smcc_drv = to_arm_smccc_driver(dev->driver);
+
+	if (smcc_drv->remove)
+		smcc_drv->remove(to_arm_smccc_device(dev));
+}
+
+static int arm_smccc_bus_uevent(const struct device *dev,
+		struct kobj_uevent_env *env)
+{
+	const struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=" ARM_SMCCC_MODULE_PREFIX "f%08X",
+			      smccc_dev->func_id);
+}
+
+static ssize_t modalias_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	return sysfs_emit(buf, ARM_SMCCC_MODULE_PREFIX "f%08X\n",
+			  smccc_dev->func_id);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *arm_smccc_device_attrs[] = {
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(arm_smccc_device);
+
+const struct bus_type arm_smccc_bus_type = {
+	.name = "arm_smccc",
+	.match = arm_smccc_bus_match,
+	.probe = arm_smccc_bus_probe,
+	.remove = arm_smccc_bus_remove,
+	.uevent = arm_smccc_bus_uevent,
+	.dev_groups = arm_smccc_device_groups,
+};
+EXPORT_SYMBOL_GPL(arm_smccc_bus_type);
+
+int arm_smccc_driver_register(struct arm_smccc_driver *driver,
+		struct module *owner, const char *mod_name)
+{
+	if (!driver->probe || !driver->id_table)
+		return -EINVAL;
+
+	driver->driver.bus = &arm_smccc_bus_type;
+	driver->driver.name = driver->name;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+
+	return driver_register(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_driver_register);
+
+void arm_smccc_driver_unregister(struct arm_smccc_driver *driver)
+{
+	driver_unregister(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_driver_unregister);
+
+static void arm_smccc_release_device(struct device *dev)
+{
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	kfree(smccc_dev);
+}
+
+struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
+{
+	int ret;
+	struct arm_smccc_device *smccc_dev;
+
+	if (!name)
+		return ERR_PTR(-EINVAL);
+
+	smccc_dev = kzalloc_obj(*smccc_dev);
+	if (!smccc_dev)
+		return ERR_PTR(-ENOMEM);
+
+	smccc_dev->func_id = func_id;
+	smccc_dev->dev.bus = &arm_smccc_bus_type;
+	smccc_dev->dev.release = arm_smccc_release_device;
+
+	ret = dev_set_name(&smccc_dev->dev, "%s", name);
+	if (ret) {
+		kfree(smccc_dev);
+		return ERR_PTR(ret);
+	}
+
+	ret = device_register(&smccc_dev->dev);
+	if (ret) {
+		put_device(&smccc_dev->dev);
+		return ERR_PTR(ret);
+	}
+
+	return smccc_dev;
+}
+EXPORT_SYMBOL_GPL(arm_smccc_device_register);
+
+void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
+{
+	if (!smccc_dev)
+		return;
+
+	device_unregister(&smccc_dev->dev);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
+
+static int __init arm_smccc_bus_init(void)
+{
+	return bus_register(&arm_smccc_bus_type);
+}
+subsys_initcall(arm_smccc_bus_init);
diff --git a/include/linux/arm-smccc-bus.h b/include/linux/arm-smccc-bus.h
new file mode 100644
index 000000000000..cde268fc2930
--- /dev/null
+++ b/include/linux/arm-smccc-bus.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+#ifndef __LINUX_ARM_SMCCC_BUS_H
+#define __LINUX_ARM_SMCCC_BUS_H
+
+#include <linux/device.h>
+#include <linux/device-id/arm_smccc.h>
+#include <linux/module.h>
+
+struct arm_smccc_device {
+	struct device dev;
+	u32 func_id;
+};
+
+#define to_arm_smccc_device(d) container_of(d, struct arm_smccc_device, dev)
+
+struct arm_smccc_driver {
+	struct device_driver driver;
+
+	const char *name;
+	int (*probe)(struct arm_smccc_device *sdev);
+	void (*remove)(struct arm_smccc_device *sdev);
+	const struct arm_smccc_device_id *id_table;
+};
+
+#define to_arm_smccc_driver(d) \
+	container_of_const(d, struct arm_smccc_driver, driver)
+
+int arm_smccc_driver_register(struct arm_smccc_driver *driver,
+		struct module *owner, const char *mod_name);
+void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
+struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id);
+void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
+
+#define arm_smccc_register(driver) \
+	arm_smccc_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
+#define arm_smccc_unregister(driver) \
+	arm_smccc_driver_unregister(driver)
+
+#define module_arm_smccc_driver(__arm_smccc_driver) \
+	module_driver(__arm_smccc_driver, arm_smccc_register, \
+		      arm_smccc_unregister)
+
+extern const struct bus_type arm_smccc_bus_type;
+
+#endif /* __LINUX_ARM_SMCCC_BUS_H */
diff --git a/include/linux/device-id/arm_smccc.h b/include/linux/device-id/arm_smccc.h
new file mode 100644
index 000000000000..a8579832fc1c
--- /dev/null
+++ b/include/linux/device-id/arm_smccc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_DEVICE_ID_ARM_SMCCC_H
+#define __LINUX_DEVICE_ID_ARM_SMCCC_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
+
+/**
+ * struct arm_smccc_device_id - Arm SMCCC bus device identifier
+ * @func_id: SMCCC function identifier
+ */
+struct arm_smccc_device_id {
+	__u32 func_id;
+};
+
+#endif /* __LINUX_DEVICE_ID_ARM_SMCCC_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..318c4b5c3451 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -16,6 +16,7 @@
 #include "device-id/amba.h"
 #include "device-id/ap.h"
 #include "device-id/apr.h"
+#include "device-id/arm_smccc.h"
 #include "device-id/auxiliary.h"
 #include "device-id/bcma.h"
 #include "device-id/ccw.h"
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..1492e9fdc7cb 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -254,6 +254,9 @@ int main(void)
 	DEVID(auxiliary_device_id);
 	DEVID_FIELD(auxiliary_device_id, name);
 
+	DEVID(arm_smccc_device_id);
+	DEVID_FIELD(arm_smccc_device_id, func_id);
+
 	DEVID(ssam_device_id);
 	DEVID_FIELD(ssam_device_id, match_flags);
 	DEVID_FIELD(ssam_device_id, domain);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..980d7da456bb 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1349,6 +1349,13 @@ static void do_auxiliary_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, AUXILIARY_MODULE_PREFIX "%s", *name);
 }
 
+static void do_arm_smccc_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, arm_smccc_device_id, func_id);
+
+	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "f%08X", func_id);
+}
+
 /*
  * Looks like: ssam:dNcNtNiNfN
  *
@@ -1519,6 +1526,7 @@ static const struct devtable devtable[] = {
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
 	{"mhi_ep", SIZE_mhi_device_id, do_mhi_ep_entry},
 	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
+	{"arm_smccc", SIZE_arm_smccc_device_id, do_arm_smccc_entry},
 	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
 	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
-- 
2.43.0

