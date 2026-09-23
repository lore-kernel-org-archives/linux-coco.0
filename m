Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C186352941C;
	Wed, 23 Sep 2026 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172319; cv=none; b=DwNKvgwQENnOnHpY6TOUTtaNilR+bm9cx/cYwvx9IXIzVs2KtbLCH3inr1TYLGnou5zvVDnGuHLWcU+ywaf9zxOacp4m06jZKSRvh7M2wWBCkWLwLe0LmbPTTbmMErQH1vmvQXeMCewIjyc5ACvwlYd9GVYmA2IxGY9h4dSMdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172319; c=relaxed/simple;
	bh=LaT+qGwTB187gZRAbg89zSK55y9EmCfAttb03t3jDk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkNAEObkRG+nCAEcWdKcStEXBfuvnFJQyrpKum5Ix/YF4+vVnfyD7q/+lfuSeYUDFhJF0seBvd/GiWSRrDV4L1Na3yy5CQnm3bSqBb4ZVZJdbENzeS8BIG5AVLDyiWXChJNolBMlrzedXB4MRsuX/ATITh9drS0yeth+sHN5XP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVpSpHI7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVpSpHI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995281F00893;
	Wed, 23 Sep 2026 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172316;
	bh=C8yJHxHxUa5wph6czcR3hPEd8pNLNGb6D92298G2BgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FVpSpHI7A+ud3bGECPucXaZPs71MsEf2bbNu8mBmwt2OvT30/VbPze2TnOGLYEafh
	 OYE2jLQMtaK7DKIVe2tlw4AHtMBPGA7yEZvF8yF13OFmRngKetd2G/kJI0USM1WJOp
	 V/tACQyIbYkeGJmSvFW88SrXeM3q1i0f7M8ZfPKBepQrDO7Lt2e/xFMd4i4QRE20jB
	 Y1yonNOxOFMiiHWMHX1wzSzJEKnqY5zLasr3h3JB9KqMyuxEXPh5pnWDdkWAG3Rvd4
	 cNB2OnbnR+2aJQnRFsX8gfoY7gg5lHI4Sp7W+aIMAUlW7AwT4+KYMkHB2TALlfT7li
	 bb98Gr9E8Kdow==
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
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v13 6/8] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
Date: Wed, 23 Sep 2026 19:34:03 +0530
Message-ID: <20260923140405.1111554-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
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

Move RSI discovery into the SMCCC firmware driver. When the SMCCC
conduit is SMC and if RSI ABI version call is supported, create an
arm-rsi SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC
driver so it binds to that discovered RSI service and keeps module
autoloading through the SMCCC device id table.

Keep the old arm-cca-dev platform-device registration for now. Userspace
has used that device as a Realm-guest indicator, so removing it is left to
a follow-up patch that adds a replacement sysfs ABI.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c          |  2 +-
 drivers/firmware/smccc/smccc.c          |  6 ++++
 drivers/virt/coco/arm-cca-guest/Kconfig |  1 +
 drivers/virt/coco/arm-cca-guest/main.c  | 41 ++++++++++---------------
 include/linux/arm-rsi-cmds.h            |  1 -
 5 files changed, 25 insertions(+), 26 deletions(-)

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
index 67e503dac409..afc2e4d602ba 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/arm-smccc-bus.h>
+#include <linux/arm-smccc-rsi.h>
 
 #include <asm/archrandom.h>
 
@@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = false,
 		.device_name    = "arm-smccc-trng",
 	},
+	{
+		.func_id        = SMC_RSI_ABI_VERSION,
+		.requires_smc   = true,
+		.device_name    = "arm-rsi",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 2582ebb36922..0d4ce72e2d86 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,6 +1,7 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM_RMM_RSI
+	depends on HAVE_ARM_SMCCC_DISCOVERY
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
index 80659f0885e9..f97f593da6e3 100644
--- a/drivers/virt/coco/arm-cca-guest/main.c
+++ b/drivers/virt/coco/arm-cca-guest/main.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-rsi-cmds.h>
+#include <linux/arm-smccc-bus.h>
 #include <linux/arm-smccc-rsi.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
@@ -161,16 +162,7 @@ static const struct tsm_report_ops arm_cca_tsm_report_ops = {
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
+static int cca_tsm_probe(struct arm_smccc_device *sdev)
 {
 	int ret;
 
@@ -179,29 +171,30 @@ static int __init arm_cca_guest_init(void)
 
 	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
 	if (ret < 0)
-		pr_err("Error %d registering with TSM\n", ret);
+		return dev_err_probe(&sdev->dev,
+				     ret, "Error registering with TSM\n");
 
-	return ret;
+	return 0;
 }
-module_init(arm_cca_guest_init);
 
-/**
- * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
- */
-static void __exit arm_cca_guest_exit(void)
+static void cca_tsm_remove(struct arm_smccc_device *sdev)
 {
 	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
-module_exit(arm_cca_guest_exit);
 
-/* modalias, so userspace can autoload this module when RSI is available */
-static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ .name = RSI_PDEV_NAME },
-	{ }
+static const struct arm_smccc_device_id cca_tsm_id_table[] = {
+	{ .func_id = SMC_RSI_ABI_VERSION },
+	{}
 };
+MODULE_DEVICE_TABLE(arm_smccc, cca_tsm_id_table);
 
-MODULE_DEVICE_TABLE(platform, arm_cca_match);
+static struct arm_smccc_driver cca_tsm_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = cca_tsm_probe,
+	.remove = cca_tsm_remove,
+	.id_table = cca_tsm_id_table,
+};
+module_arm_smccc_driver(cca_tsm_driver);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 9e8a8c189ca1..3f7a6a833993 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -11,7 +11,6 @@
 #include <linux/string.h>
 #include <asm/memory.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
 #ifdef CONFIG_ARM_RMM_RSI
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
-- 
2.43.0

