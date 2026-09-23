Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F162535FA9;
	Wed, 23 Sep 2026 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172279; cv=none; b=nrceHwwsR3iCmz1KNQeYBnZbxOgeno7iUHhBMKv8ht1p+hxHqq/oHefbLKPCtrcy8PQJOKgT0y0yGIpRSF8SbDojP0chrS3+xeXFLphvxW5fBOHTRf3qBNu9yO4CI/BVmepBQ3orE4MW1qYIzSKpFLpdnfMT/j0Quc13OLo12hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172279; c=relaxed/simple;
	bh=waZcnzHBWy1eJexBYGA2ppM5/M50poMo6NIfOd08yc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIEfpRuFCfSfZukYFuOkA2rup5+gre1aqXS8ggqSKoFr/Xsv53IyddHFl67Z+Ap/2IrDZrpKMVp6MfDuoJUJON9qIpIEln1NUAXtS3TNOUaG3ectBOibuuuBcEiLQddY6dWGyaLaM33x2NFrxtlxUwq86lDaMPn7VYAtrjJLSJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4A172Jp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4A172Jp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503BE1F00899;
	Wed, 23 Sep 2026 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172278;
	bh=SvQn0IOM5FQQkhfUQTg7Iajo+u6ltWRC5MERK6yf5yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e4A172JpDo/ydSCCYtvLqmJUI4VxEBkGLoB73sxX/524lKPD/zxLYECCDDQgTklTm
	 F48h5i5DIkKy+Hdqb+DS0gP13llMIEsUdGXh5kWShKYcUUmTOXNS6i0bPZj6cWAWj1
	 3EvCEo6pK6wWywRlSLC0y/vhkaHWbuhd2sP7eOi5BtyjdpJsyn0pvCB0TG4tWRAYU2
	 YBGzyIaKS3lCt61nLo/fA/sWmsTXZlrEsiY+bytNE6b8T2Bn8G1g14yvxu+PX3Xp/1
	 LN6mytsN2+TNCDyLjSl3dlpDAZDMTLxr9RezgSFl6CTpyUdE/3nqJmez5oMG2cr6D+
	 ru3dkA190cuww==
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
Subject: [PATCH v13 2/8] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
Date: Wed, 23 Sep 2026 19:33:59 +0530
Message-ID: <20260923140405.1111554-3-aneesh.kumar@kernel.org>
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

The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
standalone platform device. Now that the SMCCC core has an SMCCC bus,
create an arm-smccc-trng device for the discovered TRNG service and convert
the hwrng driver to an SMCCC driver.

The SMCCC id table preserves module autoloading for systems where the TRNG
driver is built as a module.

The sysfs device path changes from the old smccc_trng platform-device path
to an arm-smccc device path. No known userspace dependency on the old path
was found; a Debian Code Search lookup for the existing platform-device
name/path did not find any users.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Olivia Mackall <olivia@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm/include/asm/archrandom.h       |  2 +-
 arch/arm64/include/asm/archrandom.h     |  2 +-
 drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
 drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
 4 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
index cc4714eb1a75..ee39a03ddf8a 100644
--- a/arch/arm/include/asm/archrandom.h
+++ b/arch/arm/include/asm/archrandom.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ARCHRANDOM_H
 #define _ASM_ARCHRANDOM_H
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	return false;
 }
diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 8babfbe31f95..7605dd81bd1e 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -12,7 +12,7 @@
 
 extern bool smccc_trng_available;
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	struct arm_smccc_res res;
 
diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..01c1a30cbab8 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,8 +16,10 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+
+#include <asm/archrandom.h>
 
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
@@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct arm_smccc_device *sdev)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	/* validate the minimum version requirement */
+	if (!smccc_probe_trng())
+		return -ENODEV;
+
+	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
 	trng->name = "smccc_trng";
 	trng->read = smccc_trng_read;
 
-	return devm_hwrng_register(&pdev->dev, trng);
+	return devm_hwrng_register(&sdev->dev, trng);
 }
 
-static struct platform_driver smccc_trng_driver = {
-	.driver = {
-		.name		= "smccc_trng",
-	},
-	.probe		= smccc_trng_probe,
+static const struct arm_smccc_device_id smccc_trng_id_table[] = {
+	{ .func_id = ARM_SMCCC_TRNG_VERSION },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
+
+static struct arm_smccc_driver smccc_trng_driver = {
+	.name	  = KBUILD_MODNAME,
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
 };
-module_platform_driver(smccc_trng_driver);
+module_arm_smccc_driver(smccc_trng_driver);
 
-MODULE_ALIAS("platform:smccc_trng");
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd..67e503dac409 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -9,7 +9,8 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/arm-smccc-bus.h>
+
 #include <asm/archrandom.h>
 
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
@@ -81,16 +82,59 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
 
+struct smccc_device_info {
+	u32 func_id;
+	bool requires_smc;
+	const char *device_name;
+};
+
+static const struct smccc_device_info smccc_devices[] __initconst = {
+	{
+		.func_id        = ARM_SMCCC_TRNG_VERSION,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-trng",
+	},
+};
+
+static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
+{
+	int ret;
+	struct arm_smccc_res res = {};
+
+	if (smccc_conduit == SMCCC_CONDUIT_NONE)
+		return false;
+
+	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
+		return false;
+
+	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
+		return false;
+
+	arm_smccc_1_1_invoke(smccc_dev->func_id,
+			     0, 0, 0, 0, 0, 0, 0, &res);
+	ret = res.a0;
+
+	if (ret == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	return true;
+}
+
 static int __init smccc_devices_init(void)
 {
-	struct platform_device *pdev;
-
-	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+	struct arm_smccc_device *sdev;
+	const struct smccc_device_info *smccc_dev;
+
+	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
+		smccc_dev = &smccc_devices[i];
+
+		if (!smccc_probe_smccc_device(smccc_dev))
+			continue;
+
+		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
+		if (IS_ERR(sdev))
+			pr_err("%s: could not register device: %pe\n",
+			       smccc_dev->device_name, sdev);
 	}
 
 	return 0;
-- 
2.43.0

