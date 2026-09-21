Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066918C933;
	Mon, 21 Sep 2026 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969146; cv=none; b=Jo9V3GKdkUKDdbTsbcCVdQ8PmrvvAX9YwG8aB1LsPMSxwutzF4ckHl8aTDVPCvBloa5WMSl6+WJpKKGMHXe9f/PfdougM0BTnWyHsiV8/VEn4WBuemzMXL2X6kDCCqah7H1knpbvkgGDrU09APNl3Ac4vjfVMsrPnSseRVHWdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969146; c=relaxed/simple;
	bh=QEUW1K9pFgfhB9YBF+lza9REhBEjCZELhcQFkCRw+0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8neItgJkZzb+/Vw5AWsVvbd4gEr7ylBHVaoCRdCgCnWT19dQ06u+RGqV+q7iFRQh++vIBXZxk3X5GJMN9u8ER0DC+4jY+iZJtKspPd6njA8/+hcAZKYSOaWnj1HeKQdo/KfcnZWSotVbMoHX/u8bX9sCj6b+BatKgwKwx1dSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrI9BEZl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrI9BEZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076E31F000FF;
	Mon, 21 Sep 2026 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969145;
	bh=5xq9uOaZUlju0eA9uFj+yG1J8aLC1dru00Sy5/YfvlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CrI9BEZlPhYUnxwLwPnKCEiXrJEuZX8vCVzRAr0eJ8nuRJ1Nnw2PbP0m6eGyscMsw
	 3zXLJd4r+YHbXkkBeL5eTGpO4+Y/f5XhEjEJQEQcbZz1a1U1b5QDeTipdu/xxJAkgt
	 BsKjkMcHEg08VN6wkbC2woxk9gpLCboQNNdLFufLnguypxW7ZSo8RW2/TKKVVEuzmF
	 2m1uHV0UjtAVQHlTj1HzC66XddDO9/ReQrEakl51KUqo0NDD0JRAyej0hiqjcDBztZ
	 l/eqm6zNLbd0cWqhf3LzAwWWf3Av7nSUDFmthZQIENuJScdQCebbUHarBRB0aoGGq5
	 5w3Sb7lW+E8yA==
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v12 7/7] coco: guest: arm64: Replace dummy CCA device with sysfs ABI
Date: Mon, 21 Sep 2026 11:08:07 +0530
Message-ID: <20260921053807.354802-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921053807.354802-1-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMCCC firmware driver now creates the arm_smccc bus and instantiates
the CCA RSI device once the RSI ABI is discovered. The arm64-specific
arm-cca-dev platform device stub is therefore no longer needed.

However, userspace has used the arm-cca-dev platform device to detect Arm
CCA Realm guests [1]. Removing it without a replacement would break that
detection and would also leave userspace depending on kernel device-model
details.

Add /sys/firmware/cca/realm_guest as a stable ABI for detecting whether
the kernel is running as an Arm CCA Realm guest. Create the file only in
Realm world, where it reads 1.

Remove the dummy arm-cca-dev registration now that userspace has a
dedicated CCA Realm guest indicator, and document the new ABI in
Documentation/ABI/testing/sysfs-firmware-cca.

Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca |  7 ++++
 drivers/firmware/arm_rmm/rsi.c               | 43 +++++++++++++++-----
 2 files changed, 39 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca

diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
new file mode 100644
index 000000000000..9cc355724f94
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-cca
@@ -0,0 +1,7 @@
+What:		/sys/firmware/cca/realm_guest
+Date:		May 2026
+Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
+Description:	Read-only. Present only when the kernel is running as an
+		Arm Confidential Compute Architecture (CCA) Realm guest, in
+		which case it reads 1. If the file does not exist, the kernel
+		is not running as a Realm guest.
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 2dd69febedbd..425b27c0cad4 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -7,14 +7,16 @@
 #include <linux/memblock.h>
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
-#include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
 #include <asm/pgtable.h>
 
 static struct realm_config config;
+static struct kobject *cca_kobj;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -182,17 +184,36 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
+static ssize_t realm_guest_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+
+static struct kobj_attribute cca_realm_guest =
+	__ATTR(realm_guest, 0444, realm_guest_show, NULL);
+
+static const struct attribute *cca_realm_attrs[] = {
+	&cca_realm_guest.attr,
+	NULL
 };
 
-static int __init arm64_create_dummy_rsi_dev(void)
+static int __init realm_sysfs_init(void)
 {
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
+	int ret;
 
-arch_initcall(arm64_create_dummy_rsi_dev)
+	if (!is_realm_world())
+		return 0;
+
+	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
+	if (!cca_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
+	if (!ret)
+		return 0;
+
+	kobject_put(cca_kobj);
+	return ret;
+}
+device_initcall(realm_sysfs_init);
-- 
2.43.0

