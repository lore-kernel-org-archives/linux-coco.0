Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65513A4F4B;
	Thu, 14 May 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751656; cv=none; b=HvfyB0/XM3Tprihv+xvxfE5ICkEAy2BgSb5S7zKLHLzLdVLLYoZKKhwlHeD7rcHHM6thKYuUt8YQc/cW868rQisAbX9vykXSg8KPXVGH69SP78aC0yL7X7xUJq9ScEvjKhVv5s3ik0x3vKrbpObe9ncYihQDJOrE/WsniaODWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751656; c=relaxed/simple;
	bh=cYm8KIacQw1yy4uZwh8PXHJpvBgJW6Pi20fiqsOilQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCp4ietmWRqcYpp//MMvhRnwTvj3PNpf0E+n4BRyBFcGm86BbMFDoxTMP2L+KRJZjnubX4LUIsl7P3mTuuvlphmLIpAJdJzQrcDKeLb+ohqUkg4PfdRzx+zt1BI/OPoo1sgdiWTbb2juXc1tGapv4L01xmwLvvXx5gurN3ZvPnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdjAV5q/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdjAV5q/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E973AC2BCB3;
	Thu, 14 May 2026 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751655;
	bh=cYm8KIacQw1yy4uZwh8PXHJpvBgJW6Pi20fiqsOilQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdjAV5q/aYCjj17JWcDcqPsfHVk0bqU2ezMp5iwRULQ2FMLp5TSdRzIbwi/hM2MEv
	 5F3KpU35XiBFG9zv5rPEJzkqaIRg1k9vX6qkfxInwgC+HFIaozOzlJACW5RotFhC3r
	 2wk8XOAd8OA9kfLZQBaAGYS/F76lwU/Q4LImPg85SHHnVEA01GRubgdfYn938SXaeN
	 kT6AY0OxRUG2riu5+72nRzMuQfHD3dJcXTHLpdiN9S+FPeNc11mIkfRroPUjBFL+Ws
	 Set4FM8AQduqmBQbwdRAYeCinkZ1sk/GDlDxVuvcAgwEWZFL0ln6sCkjqvkElJ50s4
	 ibWNwFv2y1ihQ==
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
Subject: [PATCH v5 2/3] hwrng: arm_smccc_trng: Register as an auxiliary device
Date: Thu, 14 May 2026 15:10:29 +0530
Message-ID: <20260514094030.42495-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514094030.42495-1-aneesh.kumar@kernel.org>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMCCC TRNG interface is a firmware-provided function rather than a
standalone platform device. Register it as an auxiliary device under the
arm-smccc platform device and convert the hwrng driver to an auxiliary
driver.

This keeps the TRNG device tied to the SMCCC core device while preserving
module autoloading through the auxiliary device ID table.

The conversion changes the device path from the old platform device path,
but no userspace dependency on that path was found. This was confirmed with
a Debian Code Search lookup for the existing platform device name/path.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/char/hw_random/arm_smccc_trng.c | 25 ++++++++++++++-----------
 drivers/firmware/smccc/smccc.c          | 24 +++++++++++++-----------
 2 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25..5d56fcbcefa0 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,7 +16,7 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/arm-smccc.h>
 
 #ifdef CONFIG_ARM64
@@ -94,29 +94,32 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct auxiliary_device *adev,
+		const struct auxiliary_device_id *id)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	trng = devm_kzalloc(&adev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
 	trng->name = "smccc_trng";
 	trng->read = smccc_trng_read;
 
-	return devm_hwrng_register(&pdev->dev, trng);
+	return devm_hwrng_register(&adev->dev, trng);
 }
 
-static struct platform_driver smccc_trng_driver = {
-	.driver = {
-		.name		= "smccc_trng",
-	},
-	.probe		= smccc_trng_probe,
+static const struct auxiliary_device_id smccc_trng_id_table[] = {
+	{ .name =  KBUILD_MODNAME ".smccc_trng" },
+	{}
 };
-module_platform_driver(smccc_trng_driver);
+MODULE_DEVICE_TABLE(auxiliary, smccc_trng_id_table);
 
-MODULE_ALIAS("platform:smccc_trng");
+static struct auxiliary_driver smccc_trng_driver = {
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
+};
+module_auxiliary_driver(smccc_trng_driver);
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index eb077b9aa6da..49ac8172def4 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <asm/archrandom.h>
 
 #include "rmm.h"
@@ -94,20 +95,21 @@ static int __init smccc_devices_init(void)
 					PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(pdev)) {
 		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
-	} else {
-		/*
-		 * Register the RMI and RSI devices only when firmware exposes
-		 * the required SMCCC function IDs at a supported revision.
-		 */
-		register_rsi_device(pdev);
+		return 0;
 	}
+	/*
+	 * Register the RMI and RSI devices only when firmware exposes
+	 * the required SMCCC function IDs at a supported revision.
+	 */
+	register_rsi_device(pdev);
 
 	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+		struct auxiliary_device *adev;
+
+		adev = __devm_auxiliary_device_create(&pdev->dev,
+					"arm_smccc_trng", "smccc_trng", NULL, 0);
+		if (!adev)
+			pr_err("smccc_trng: could not register device\n");
 	}
 
 	return 0;
-- 
2.43.0

