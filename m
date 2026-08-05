Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B932EA732;
	Wed,  5 Aug 2026 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911605; cv=none; b=RvLZ3e9rb5ChQG651Jhad103GJvLvwfGxnSdBQk0DOWo6b8cxg3QGa3+XqmJxbegsJodJGfNJU6iUwT10nOjQLdV4XAFR5CDwvwVa4PepvndRhnfVFpV1IpnYXPItqc07G73Xh1F91JywDFCJRHWVgrf8YaDv1gOe7rAo6EgGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911605; c=relaxed/simple;
	bh=JPgut0gqqM34j0FuL0r0czPrcxI0m3sIy4mRW5t/ITg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifu2433NSRg7nKU5HYdQHNnK5Ek8rjn+yzjE54Nkd/N6torVYxdvnxR5I7bQoW6qW9X0FaLl0WcJhGjeMyd3r7AgQDxRdVwoQHsc+fAVU8f7YeqVktrrmAcLcaD17zQZCo3MtTKc6rmds75quUhTXGhRz9gPNXvlmCdJDnRxyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2D1DW9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2D1DW9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98B31F00A3A;
	Wed,  5 Aug 2026 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911604;
	bh=JWRbVXSQALec+f/BABIBhOWEArXPPBxV0mZaTH3fyCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I2D1DW9fwn1g+veUz06iDIk4Y6InWEny+BtyQAXxPzkDo8Hu3m1s1fg3ccza2N6az
	 u3yJeQGD4eS3rYbcVL+lGNYKl1DKm0NT445ZSkU/eyA84oCvPypTIDvfLgEJvIxUh7
	 ccaxMmGoLw5/yDAngSeym8Ahb4UE5lBiTJbVRruLr77ahEO+2CIB7SCfTf00qIRNoX
	 RXNQYTdY/WTsUTm0IhK4O0w14T5SPD5ekjTM+HINRkTD/afqvzlsI2GGakb6z1JWLc
	 aR7JuHOzx2yjr3adpZRkdxi83lIBF9qzS/woLrBfs6JIKdO0U9lrTYtbyo2uzsq73C
	 5IToRkiyk5z4A==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
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
Subject: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Date: Wed,  5 Aug 2026 12:02:49 +0530
Message-ID: <20260805063255.1638614-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
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

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/smccc/Makefile     |   2 +-
 drivers/firmware/smccc/bus.c        | 166 ++++++++++++++++++++++++++++
 include/linux/arm-smccc-bus.h       |  49 ++++++++
 include/linux/device-id/arm_smccc.h |  16 +++
 include/linux/mod_devicetable.h     |   1 +
 scripts/mod/devicetable-offsets.c   |   3 +
 scripts/mod/file2alias.c            |   8 ++
 7 files changed, 244 insertions(+), 1 deletion(-)
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
index 000000000000..3147f5c58453
--- /dev/null
+++ b/drivers/firmware/smccc/bus.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+
+#include <linux/arm-smccc-bus.h>
+#include <linux/idr.h>
+#include <linux/slab.h>
+
+static DEFINE_IDA(arm_smccc_bus_id);
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
+	while (id_table->name[0]) {
+		if (!strcmp(smccc_dev->name, id_table->name))
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
+	return add_uevent_var(env, "MODALIAS=" ARM_SMCCC_MODULE_PREFIX "%s",
+			      smccc_dev->name);
+}
+
+static ssize_t modalias_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	return sysfs_emit(buf, ARM_SMCCC_MODULE_PREFIX "%s\n", smccc_dev->name);
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
+	ida_free(&arm_smccc_bus_id, smccc_dev->id);
+	kfree(smccc_dev);
+}
+
+struct arm_smccc_device *arm_smccc_device_register(const char *name)
+{
+	int id, ret;
+	struct arm_smccc_device *smccc_dev;
+
+	if (!name)
+		return ERR_PTR(-EINVAL);
+
+	id = ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
+	if (id < 0)
+		return ERR_PTR(id);
+
+	smccc_dev = kzalloc_obj(*smccc_dev);
+	if (!smccc_dev) {
+		ida_free(&arm_smccc_bus_id, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	smccc_dev->id = id;
+	if (strscpy(smccc_dev->name, name) < 0) {
+		kfree(smccc_dev);
+		ida_free(&arm_smccc_bus_id, id);
+		return ERR_PTR(-EINVAL);
+	}
+	smccc_dev->dev.bus = &arm_smccc_bus_type;
+	smccc_dev->dev.release = arm_smccc_release_device;
+
+	ret = dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);
+	if (ret) {
+		kfree(smccc_dev);
+		ida_free(&arm_smccc_bus_id, id);
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
index 000000000000..2a08868507d1
--- /dev/null
+++ b/include/linux/arm-smccc-bus.h
@@ -0,0 +1,49 @@
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
+	int id;
+	char name[ARM_SMCCC_NAME_SIZE];
+	struct device dev;
+};
+
+#define to_arm_smccc_device(d) container_of(d, struct arm_smccc_device, dev)
+
+struct arm_smccc_driver {
+	const char *name;
+	int (*probe)(struct arm_smccc_device *sdev);
+	void (*remove)(struct arm_smccc_device *sdev);
+	const struct arm_smccc_device_id *id_table;
+
+	struct device_driver driver;
+};
+
+#define to_arm_smccc_driver(d) \
+	container_of_const(d, struct arm_smccc_driver, driver)
+
+int arm_smccc_driver_register(struct arm_smccc_driver *driver,
+		struct module *owner, const char *mod_name);
+void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
+struct arm_smccc_device *arm_smccc_device_register(const char *name);
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
index 000000000000..c8d38a002bfd
--- /dev/null
+++ b/include/linux/device-id/arm_smccc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_DEVICE_ID_ARM_SMCCC_H
+#define __LINUX_DEVICE_ID_ARM_SMCCC_H
+
+#define ARM_SMCCC_NAME_SIZE 40
+#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
+
+/**
+ * struct arm_smccc_device_id - Arm SMCCC bus device identifier
+ * @name: SMCCC device name
+ */
+struct arm_smccc_device_id {
+	char name[ARM_SMCCC_NAME_SIZE];
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
index b4178c42d08f..a485011ff137 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -254,6 +254,9 @@ int main(void)
 	DEVID(auxiliary_device_id);
 	DEVID_FIELD(auxiliary_device_id, name);
 
+	DEVID(arm_smccc_device_id);
+	DEVID_FIELD(arm_smccc_device_id, name);
+
 	DEVID(ssam_device_id);
 	DEVID_FIELD(ssam_device_id, match_flags);
 	DEVID_FIELD(ssam_device_id, domain);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..7d62e74f475d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1349,6 +1349,13 @@ static void do_auxiliary_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, AUXILIARY_MODULE_PREFIX "%s", *name);
 }
 
+static void do_arm_smccc_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD_ADDR(symval, arm_smccc_device_id, name);
+
+	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "%s", *name);
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

