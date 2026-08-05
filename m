Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31D2EA732;
	Wed,  5 Aug 2026 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911633; cv=none; b=XNUSGUWXxJzPazUruozhtuSPzrkPKoyHaNsqrYtbv+IddsK8z2R5lz+y/TSjNfoJh7NKXRvazywl0BsVGxuNAnfY6tiNhwM9IVg1T6H+bW2tnzTVoshoK4O4Cho1C9ck3+WuHSDMhYmd3WPb9xlVnoLt+LT5jzr5k616L/6wGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911633; c=relaxed/simple;
	bh=vTzqlnumgO9y/M/GsksLdc7xPdSuT6t8iO52edETyKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRwDQHCnTCydpwN6n75INNPrsVQmKH5lL0zKtkadMOLWhfZDOsbP/8tbRsT8C2y9nIwUwTenQApwr8Cq7vnnQiHy2uCD3DBLgIPwO9NIJ9ePO/p1/7xwClLbxBp43Cn7bZDx+HpZ/eK2yK8hBeFYPZpyno5fxBD9mXgSbXHi6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBJiWdGR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBJiWdGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6321F000E9;
	Wed,  5 Aug 2026 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911631;
	bh=0nyaeGqcwyC8vyfXer1bbczMAxTPQxLzxMh0e3GapGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bBJiWdGRY6jSpEmnxcTCLK52mOZP0wGqF5vklhMPl3gF/4iWhVUYeMZsdSUQRQPW5
	 twbzxFru5NW1xAOz2Bl8JOfbN9DxQQAXSmOWjBs7w5vQVgYiMZhKZC8ToeW2JpcBAT
	 M4HkW7j3P+K1XXXa1+xY3k3SzB0t031CMdzFxVOByvDjgYubqm4efsxFORWxOn5bl9
	 ThVZ0cukWQYeNSFi9EwCG7WYtwMdPhDPu/f18EI1dHN0fR7AFzypS+pTHcLVWD7pZS
	 kc/Iy/uf5TBEmBmNo9HngHgi3XxIpdWc2uuqrf4wQ4bu2CIwfkm+jGo6k07qBP0wwp
	 HJo1ihDWQOHiA==
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
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v9 6/7] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
Date: Wed,  5 Aug 2026 12:02:54 +0530
Message-ID: <20260805063255.1638614-7-aneesh.kumar@kernel.org>
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

The Arm CCA guest TSM provider currently binds through the arm-cca-dev
platform device. Like arm-smccc-trng, this device is not an independent
platform resource; it is a software representation of the RSI firmware
service discovered through SMCCC.

Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
it binds to that discovered RSI service and keeps module autoloading
through the SMCCC device id table.

Keep the old arm-cca-dev platform-device registration for now. Userspace
has used that device as a Realm-guest indicator, so removing it is left to
a follow-up patch that adds a replacement sysfs ABI.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c            |  2 +-
 drivers/firmware/smccc/smccc.c            |  7 +++
 drivers/virt/coco/arm-cca-guest/Kconfig   |  1 +
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 56 +++++++++++------------
 include/linux/arm-rsi-cmds.h              |  1 -
 include/linux/arm-smccc-rsi.h             |  2 +
 6 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index ada139d0e344..2dd69febedbd 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -183,7 +183,7 @@ void __init arm64_rsi_init(void)
 }
 
 static struct platform_device rsi_dev = {
-	.name = RSI_PDEV_NAME,
+	.name = "arm-cca-dev",
 	.id = PLATFORM_DEVID_NONE
 };
 
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 092bdbac26f2..537b4b22c395 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/arm-smccc-bus.h>
+#include <linux/arm-smccc-rsi.h>
 
 #include <asm/archrandom.h>
 
@@ -94,6 +95,12 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = false,
 		.device_name    = "arm-smccc-trng",
 	},
+
+	{
+		.func_id        = SMC_RSI_ABI_VERSION,
+		.requires_smc   = true,
+		.device_name    = RSI_DEV_NAME,
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index b2c225fd445c..0511dd25cb13 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,6 +1,7 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM_RMM
+	depends on HAVE_ARM_SMCCC_DISCOVERY
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 80659f0885e9..71bc1ecf0c80 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-rsi-cmds.h>
+#include <linux/arm-smccc-bus.h>
 #include <linux/arm-smccc-rsi.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
@@ -161,16 +162,12 @@ static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.report_new = arm_cca_report_new,
 };
 
-/**
- * arm_cca_guest_init - Register with the Trusted Security Module (TSM)
- * interface.
- *
- * Return:
- * * %0        - Registered successfully with the TSM interface.
- * * %-ENODEV  - The execution context is not an Arm Realm.
- * * %-EBUSY   - Already registered.
- */
-static int __init arm_cca_guest_init(void)
+static void unregister_cca_tsm_report(void *data)
+{
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
+}
+
+static int cca_tsm_probe(struct arm_smccc_device *sdev)
 {
 	int ret;
 
@@ -178,30 +175,33 @@ static int __init arm_cca_guest_init(void)
 		return -ENODEV;
 
 	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
-	if (ret < 0)
-		pr_err("Error %d registering with TSM\n", ret);
+	if (ret < 0) {
+		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
+		return ret;
+	}
 
-	return ret;
-}
-module_init(arm_cca_guest_init);
+	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
+				       NULL);
+	if (ret < 0) {
+		dev_err_probe(&sdev->dev, ret, "Error registering devm action\n");
+		return ret;
+	}
 
-/**
- * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
- */
-static void __exit arm_cca_guest_exit(void)
-{
-	tsm_report_unregister(&arm_cca_tsm_report_ops);
+	return 0;
 }
-module_exit(arm_cca_guest_exit);
 
-/* modalias, so userspace can autoload this module when RSI is available */
-static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ .name = RSI_PDEV_NAME },
-	{ }
+static const struct arm_smccc_device_id cca_tsm_id_table[] = {
+	{ .name = RSI_DEV_NAME },
+	{}
 };
+MODULE_DEVICE_TABLE(arm_smccc, cca_tsm_id_table);
 
-MODULE_DEVICE_TABLE(platform, arm_cca_match);
+static struct arm_smccc_driver cca_tsm_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = cca_tsm_probe,
+	.id_table = cca_tsm_id_table,
+};
+module_arm_smccc_driver(cca_tsm_driver);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 13478e14c429..0e89213bb140 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -11,7 +11,6 @@
 #include <linux/string.h>
 #include <asm/memory.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
 #ifdef CONFIG_ARM_RMM
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..ae663aa8fd7f 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -8,6 +8,8 @@
 
 #include <linux/arm-smccc.h>
 
+#define RSI_DEV_NAME "arm-rsi-dev"
+
 /*
  * This file describes the Realm Services Interface (RSI) Application Binary
  * Interface (ABI) for SMC calls made from within the Realm to the RMM and
-- 
2.43.0

