Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74962EB5CD;
	Tue,  7 Jul 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412072; cv=none; b=ALccTBQVaknrPAZZMR6OXfAnb3DgeJymP2OOkJ1Z2MY6BM14KNw0OcThzQcFKtj+ZJ55Wtobacg0rmRLqKuiGBy2R2ieJRH9xAEgD2j+qzZ6PsCb6OytdVgu/HD6tLsgwqkP0JFMN244VaWqY9ZOQV1pEJoNqG7njN5WkTymMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412072; c=relaxed/simple;
	bh=EgrEMxNbMNvdIT2kJ8CZAyDA95jVLOLRokNnVIbgZY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/j3d9NaP2MZLFGlyfWlUq4IQl6vry5LGmZJlvzoNTrkUouxvLX3EvuYELjOdKHkCQ3hzluuppA/2z21Nus46eHbTR4TP1S9OLDnkLR0dRyBYj9mBrRSp5IGv0W0hEYGIGr3pk6Mf+Fp3GKo+wFsBUnx+w4CV72EPB3vHOID7as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U93vTdiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U93vTdiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CD71F00AC4;
	Tue,  7 Jul 2026 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412070;
	bh=vaddtWQDY6zIQ+PjiWfekfIHU0HkpJQCsh2iwCLPLOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U93vTdiBEpiqNuyeOwKOSLd94ePT8Y3SKk6qxxftRfPy4qhwjnX5Jbz1HqChSim2k
	 J5lkE47BYn5M2owiS/sDPTVUH35/vr5g/+fHcVCyD6FPb+ndxNq2jJW8iw5b3fwNer
	 uNkDBve+uTRdMMp1WOEREsspDqFb9AUOec/SeYMWy+pM9e60K6VWfm466vysVt0Ibe
	 vy2uWdGrox0P4dx3Zc10ZFms2KTTB2MJNsFOLYC0BcT/Udwlh0fkJZunAHs4Kj/9SA
	 I9E4F0Tx0266f14nbTeFTIDMlLze7byvbR8fXesOYnLwuwvWyskOxrsavpcLZHbuaN
	 NCqec8eGZX2wA==
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
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v8 5/6] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
Date: Tue,  7 Jul 2026 13:43:49 +0530
Message-ID: <20260707081351.1680209-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
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

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rsi.h              |  2 -
 arch/arm64/kernel/rsi.c                   |  2 +-
 drivers/firmware/smccc/smccc.c            |  7 +++
 drivers/virt/coco/arm-cca-guest/Kconfig   |  1 +
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 56 +++++++++++------------
 include/linux/arm-smccc-rsi.h             |  2 +
 6 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 88b50d660e85..5f9c8623183d 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -10,8 +10,6 @@
 #include <linux/jump_label.h>
 #include <asm/rsi_cmds.h>
 
-#define RSI_PDEV_NAME "arm-cca-dev"
-
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
 void __init arm64_rsi_init(void);
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 92160f2e57ff..da440f71bb64 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
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
index 3f0f013f03f1..ad7538750c5a 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,6 +1,7 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM64
+	depends on HAVE_ARM_SMCCC_DISCOVERY
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 0c9fb61a28f1..399915f1fb3e 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
 #include <linux/device-id/platform.h>
@@ -189,16 +190,12 @@ static const struct tsm_report_ops arm_cca_tsm_report_ops = {
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
 
@@ -206,30 +203,33 @@ static int __init arm_cca_guest_init(void)
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
-	{ RSI_PDEV_NAME, 0},
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

