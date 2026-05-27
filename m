Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2CC3C2BA8;
	Wed, 27 May 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876177; cv=none; b=Y5qcCnLmNBeJtDLu3wxhE1TLENqq7rH6qfO85JupWVwFY4d+YvQ+OTmG4U8QtM1RgPIosspp4xz6KkXu6G0cpdVgx+YKGwWXsKjkZAsudY4NuK0vOz7J8sR9tDx8LrwfcNPFACTaTkgr3tn6p9hhLxdaC4SoqvPNpAXqz7WXS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876177; c=relaxed/simple;
	bh=/bCaErwxCQO+GOal4xX2vf2CbDbfDXnWyU6pvYcUUD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5weE/aPO8MH7Ip9OEZhhCtGQ700kXyQK5Rok8sB9ttkJoBNCM/B7Y+H+06Sd18UlrCTCyn2GsqsoPE0DZ+QPJ80JBdFKZI4xy/DhD7Sv1b8hLj9nsZul4krR2JCLQyF1ZFKflrPot2R6XoYbHJzgVYX7oy2MYIuFv/kUY1rEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlxYQLHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlxYQLHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41C71F00A3A;
	Wed, 27 May 2026 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876175;
	bh=wylaKNd2CHrEQW+XLvJau+CZQ81dCr5zLWwwhdvlBFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlxYQLHqGYpPtmiHQ/qkHW3867G18XVAYMbTH/mTZbDMDATw+LzXVtEEIKLX9j1AN
	 OexQWWcNJST7gwOFxdNE52zfRdoHMXlvM1u/+35cfyVIja3qnmTxLHtez3F+94SJhQ
	 1C2KpijYL2UEaHreWTdmu/sPnLvCfXzmvQ+yQA/jRsaRI2QqYZadoCEoVeYDegObNG
	 LabBfY73DBtsKXrOW1aMWs4YKgmdVBQ6jDGnb7gHR10vMa+9SlZISWKf97TWIXkLjx
	 zfrSP7T7QDvIXX6D0kvFHDze5shCvge6K46Q/jnsprX6K86B/RvEddr7bSM+CNLdIp
	 biHgkGFnMW5WA==
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
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v6 2/4] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
Date: Wed, 27 May 2026 15:32:31 +0530
Message-ID: <20260527100233.428018-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527100233.428018-1-aneesh.kumar@kernel.org>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/char/hw_random/arm_smccc_trng.c | 26 ++++++++++++++-----------
 drivers/firmware/smccc/smccc.c          | 14 ++++++-------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..d273e6fc7129 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,8 +16,8 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
 
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
@@ -94,29 +94,33 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct arm_smccc_device *sdev)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
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
+	{ .name = "arm-smccc-trng" },
+	{}
 };
-module_platform_driver(smccc_trng_driver);
+MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
+
+static struct arm_smccc_driver smccc_trng_driver = {
+	.name	  = KBUILD_MODNAME,
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
+};
+module_arm_smccc_driver(smccc_trng_driver);
 
-MODULE_ALIAS("platform:smccc_trng");
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 695c920a8087..6d260354d0f9 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
@@ -241,14 +240,13 @@ subsys_initcall(arm_smccc_bus_init);
 
 static int __init smccc_devices_init(void)
 {
-	struct platform_device *pdev;
-
 	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+		struct arm_smccc_device *sdev;
+
+		sdev = arm_smccc_device_register("arm-smccc-trng");
+		if (IS_ERR(sdev))
+			pr_err("arm-smccc-trng: could not register device: %ld\n",
+			       PTR_ERR(sdev));
 	}
 
 	return 0;
-- 
2.43.0

