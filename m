Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611952E8DEB
	for <linux-coco@lists.linux.dev>; Mon,  8 Dec 2025 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232077; cv=fail; b=LktsJtZ7QKZpu8s1ER5Dvnnb42Kotqk+KNglHVnfc4OBO79hd5kxYR9OK3SFb8SHeXFR1APnUKA9KkTYDx074yQO/f/p2KLGTPpk39QEG6Ki1W2KgUWuiupT0qTYR86YPpyrKk25Q8fEKpEnvqjPAZnmVXK0jjvTbKQxpgqITn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232077; c=relaxed/simple;
	bh=+QnguX84NhdNKYuknbJSg6PAO//3InkZT0dcgHDhz/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jry+npY/zJGfnz4kOw1zsKa7nD81CaaOBDcNKuaWqB7G0GMnWac+HSbid4WCY12+OJCp+Sv6o+9e18HBLKoThM3Vw6VhqPYPRfdulLZvjKkCjtVzCMIqdm3giFmBjQPXlCUed9AK1TDlLY5QewX0uyoj3zGRt+Ulzjvj8yYA7YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PZFcZjUD; arc=fail smtp.client-ip=52.101.85.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PZFcZjUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji0eyjlw8BEy5U3NgGtLAshRJ05MQbZtU48LdCyCg6Gu4MVPN7WR7wFfqUGDJ8jEOSQ4zDCAMZzzUGs3U8ixLc4gjbHyTsurn3pFhDHCF4wvcgWF1uIY7tW0xn52CHTZuSoQDnZFPPlF+TcEOU99fOgZZT2RjvN08lkWm5z20h3sOY9y0vs+UKNQPt49h6PApPQfuShxs8uzre6eB03vKV8UUClIaeQCbHvPbvA+V7vChLVjQtA8IcyjQkmvP3HcVV7/bIv7dgCZUhjz9i9hqsnNyagCWhZLkK14Vw8zUB75+T4luVVJX91eTORITgdgQ0MeAyIq2g0jx7LKW9RFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op+0HtvBVztvsKx5CL+YZvkKE7djWqrMUILpOrH1gFQ=;
 b=JcA0RutwHd/zgqWNIz/VLklUrERiLdGCOeH2GjbcBmlS3HxEMxakYweS6GyWBlJTLHHE+EYhBpaKrJ+k0uONuNMThdcWFH8uZhS2XSJjGqINUmWW3Zxm2W6AgAUb7ySoiseLHI2ciQNjUq0sZwPfbq90tNT/tQc2VF1Y5gic/1GEyQizPuu9/LyFpog+VIbvegpkEpwSbUuxWpqmu/G5S4isZrrDYFzewtjRLmMt+Dx0wLbUwylA8lxlK566MdIa/oX9AG/c83KL/M8EEe5bWyMCd6E+r0/ObqpyWS8xNdDBHiB4R98sCJdfK1gLSB2vZDRtS8xGDD53lltOdWTrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op+0HtvBVztvsKx5CL+YZvkKE7djWqrMUILpOrH1gFQ=;
 b=PZFcZjUDCnUFrGO/wqIyGikcDQj0/fhx2LarTv9LvKeHs2TtbeYnDJY+S/hJF739zVNgBkRIV79WTJO9sgKeDy2QsqIRkbSdf2++E0IIe3rQNTOhj3Pxkd6qfj6/MqSONrWk4shxIGtjeE3Km7eXfWBHkQ4pqj4HXuoz+vb2yuQjx8RBXnQmb+V3bxG707g7hjr04GKyELn8zUhTaM1iwryCkpmLl3A1sORSktruU06Fe8JQChJtrpYEHYPoA8ZJLBR5jrBJOgXzrxRz8OSczPek03d4m+959R3HNoDrdpYDPjQ8oiRwNzJtXse7/TogBznMGIF12jwZtYQ7EueUJA==
Received: from SJ0PR13CA0104.namprd13.prod.outlook.com (2603:10b6:a03:2c5::19)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:26 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::ec) by SJ0PR13CA0104.outlook.office365.com
 (2603:10b6:a03:2c5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.5 via Frontend Transport; Mon, 8
 Dec 2025 22:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:09 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Dec 2025 14:14:08 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Dec 2025 14:14:08 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Date: Mon, 8 Dec 2025 22:13:14 +0000
Message-ID: <20251208221319.1524888-5-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9b6534-cf71-4779-9709-08de36a72659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UousEuVOSMLb/OTCUBZk/tBMYenbPghNTAuYmam9CJklmh1JX4c+DddnJOTL?=
 =?us-ascii?Q?hDptxswGW2E+6sMSVCicvh8mlppFjCVRuiEGSKIQXYrXa56zR82jXlQ+MYdZ?=
 =?us-ascii?Q?fYntPY40v7pHBakuxYnzplm4QCyWF3ajRQ4OtGsFxiCYOhgZ7VmevuTlBHwN?=
 =?us-ascii?Q?7mZEf0ifNxs+2Etz+hc/ddbOyrGDRn6/QEkMCwckZp6Qm9nYa9XDGxTUu4ow?=
 =?us-ascii?Q?9tnQW5YU7KwFXdZDZzPeF9UZgLCQuewkZLCmO65uUKAUiV6OyW69rqqCfIGL?=
 =?us-ascii?Q?U5bz6SWzuqjHfzesZ4VcCqo4IvenHTKkE3IY14GyaIvDhSZJEA2BWhDdGuiF?=
 =?us-ascii?Q?saKr+PzmCFoxIO72lBQcTXoR4IHQbfJ/nLMFNxRdPk9mS7BxAE5+VV0X+28T?=
 =?us-ascii?Q?W1V5uUCGsXfAG47F3rxq/DIqu3EqF5l3MF4lQdxsVfmrizpi16mkWUxD6fCS?=
 =?us-ascii?Q?jRl0xOj5MuC+RAMdq0wp9aLlDZz5zweS9nyQ8g9ZTJ0ojd1Z8WirXLjv/rMa?=
 =?us-ascii?Q?974eNRzmk1bPHfDWtbSFH5gYvJpt0/1tMW+5r3cis55tLnxCvtwVHm8sQe5N?=
 =?us-ascii?Q?oFTUmyunZQ+HEeKn/jtUsTmB1LVRDBxjo+TX4egwE7CYJJGgtkDJNHKPFjpk?=
 =?us-ascii?Q?rYx0GmD1aPzXpit2oyCvKeQGWKq80vHkFbU0+2rXGJCUN3Jr9+IcSFOvScug?=
 =?us-ascii?Q?j3s0ydMbVXJfQY3KhyqecyeocPVgPYWoZ0y+2M1ByBVZPfx0Hk36kUH5Ug4/?=
 =?us-ascii?Q?yEf0iA4rdnqnAjQYZVu0U3fpp8pZFbJ5jFXBc6KdwFXC8oqRRKP1sC4iQXCH?=
 =?us-ascii?Q?jJ9Itr+UX9bIm5dynLizpPaFswX7poIQvzXEM9TRojj+aQdsXd+FFnisyQw3?=
 =?us-ascii?Q?bDuQkxbJrjnTneiXlxAMuaU5vQOmsq+T3zJHYAGZ/oN7ylqovhKlN5+pqb7E?=
 =?us-ascii?Q?D3zinHfgJ4yAcPAr5NLifTS8cdAuu8Jb7fxisEgYzAakmUHpJT0tJSmuHr1R?=
 =?us-ascii?Q?+lJ+FruaGIXnsLkMy8A/5UovtHCLkon9JzGE7zWr4AhkWr0rZxcM5E8/tTCQ?=
 =?us-ascii?Q?Qg1WPJRgl2DlrVWhjs71gZ4ZTfo6mz6uv1Rk0+HUsHiAtkMuYosNofzLMEYI?=
 =?us-ascii?Q?FpqF+f+GSlP7uJRoXybxMvRCyxLdFmuMyHWO58xkIblasSm4LJQJkEoxrnOg?=
 =?us-ascii?Q?QSyevqveOyNb7cRVCYaTtKFim4z9GtxxjzFR2FlW2CU29PbVj/5n8MQTCpXS?=
 =?us-ascii?Q?9SW7tEAki+lhtOmSUq1Fv8fBu5PLTM4I3vriW7CvAsn3hRVf4CnMw4/le3yv?=
 =?us-ascii?Q?rOAyiYShgpoLWlvvAGAkHsf2EFFo5todbkb/ow/NQr9OdtOzrel+NQmogXNT?=
 =?us-ascii?Q?rbqBSQjZxRhw7GxK2KZCwjrOBHA+M0yK0VkWPLAa/lYjQvnSvd25On07r56F?=
 =?us-ascii?Q?js0VzZBkV5sAcLaecfWd1kfB6WaNHrZzY9S8pauUiMv9vyuezS6g/V0T6ANX?=
 =?us-ascii?Q?Lbvl1WgkhqxxgmLmcizI/BkbSPOsh2Ui4UFCEwnebQgQLPsylqGOZm+v8cqF?=
 =?us-ascii?Q?Ly+b5uYTPdL+0Jet4xY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:26.3111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9b6534-cf71-4779-9709-08de36a72659
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

- Update driver to be in-built kernel module. This will ensure driver is
installed in kernel and would not require any user intervention.
- Register the LFA driver as a platform driver corresponding to
'armhf000' device. The driver will be invoked when the device is
detected on a platform.
- Add functionality to register LFA interrupt in the driver probe().
This LFA IRQ number will be retrived from the LFA device node.
- On IRQ, driver will query FW component details and trigger activation
of capable and pending FW component. The driver will loop to update FW
component details after every successful FW component activation.
- Mutex synchronization is implemented to avoid concurrent LFA updates
through interrupt and sysfs interfaces.

Device node snippet from LFA spec[1]:
fwu0 {
    compatible = "arm,armhf000";
    memory-region = <&fwu_payload>;
    interrupt-parent = <&ic>;
    interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
};

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/Kconfig  |   3 +-
 drivers/firmware/smccc/lfa_fw.c | 124 +++++++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 48b98c14f770..c21be43fbfed 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -25,8 +25,9 @@ config ARM_SMCCC_SOC_ID
 	  platforms providing some sysfs information about the SoC variant.
 
 config ARM_LFA
-	tristate "Arm Live Firmware activation support"
+	bool "Arm Live Firmware activation support"
 	depends on HAVE_ARM_SMCCC_DISCOVERY
+	default y
 	help
 	  Include support for triggering Live Firmware Activation, which
 	  allows to upgrade certain firmware components without a reboot.
diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 0e420cefa260..24916fc53420 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -19,7 +19,12 @@
 #include <linux/nmi.h>
 #include <linux/ktime.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
 
+#define DRIVER_NAME	"ARM_LFA"
 #define LFA_ERROR_STRING(name) \
 	[name] = #name
 #undef pr_fmt
@@ -129,6 +134,7 @@ static const struct fw_image_uuid {
 };
 
 static struct kobject *lfa_dir;
+static DEFINE_MUTEX(lfa_lock);
 
 static int get_nr_lfa_components(void)
 {
@@ -374,17 +380,23 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
 					 image_attrs[LFA_ATTR_ACTIVATE]);
 	int ret;
 
+	if (!mutex_trylock(&lfa_lock)) {
+		pr_err("Mutex locked, try again");
+		return -EAGAIN;
+	}
+
 	ret = activate_fw_image(attrs);
 	if (ret) {
 		pr_err("Firmware activation failed: %s\n",
 			lfa_error_strings[-ret]);
-
+		mutex_unlock(&lfa_lock);
 		return -ECANCELED;
 	}
 
 	pr_info("Firmware activation succeeded\n");
 
 	/* TODO: refresh image flags here*/
+	mutex_unlock(&lfa_lock);
 	return count;
 }
 
@@ -510,6 +522,106 @@ static int create_fw_images_tree(void)
 	return 0;
 }
 
+static irqreturn_t lfa_irq_thread(int irq, void *data)
+{
+	struct image_props *attrs = NULL;
+	int ret;
+	int num_of_components, curr_component;
+
+	mutex_lock(&lfa_lock);
+
+	/*
+	 * As per LFA spec, after activation of a component, the caller
+	 * is expected to re-enumerate the component states (using
+	 * LFA_GET_INFO then LFA_GET_INVENTORY).
+	 * Hence we need an unconditional loop.
+	 */
+
+	do {
+		/* TODO: refresh image flags here */
+		/* If refresh fails goto exit_unlock */
+
+		/* Initialize counters to track list traversal  */
+		num_of_components = get_nr_lfa_components();
+		curr_component = 0;
+
+		/* Execute PRIME and ACTIVATE for activable FW component */
+		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
+			curr_component++;
+			if ((!attrs->activation_capable) || (!attrs->activation_pending)) {
+				/* LFA not applicable for this FW component */
+				continue;
+			}
+
+			ret = activate_fw_image(attrs);
+			if (ret) {
+				pr_err("Firmware %s activation failed: %s\n",
+					attrs->image_name, lfa_error_strings[-ret]);
+				goto exit_unlock;
+			}
+
+			pr_info("Firmware %s activation succeeded", attrs->image_name);
+			/* Refresh FW component details */
+			break;
+		}
+	} while (curr_component < num_of_components);
+
+	/* TODO: refresh image flags here */
+	/* If refresh fails goto exit_unlock */
+
+exit_unlock:
+	mutex_unlock(&lfa_lock);
+	return IRQ_HANDLED;
+}
+
+static int __init lfa_probe(struct platform_device *pdev)
+{
+	int err;
+	unsigned int irq;
+
+	err = platform_get_irq_byname_optional(pdev, "fw-store-updated-interrupt");
+	if (err < 0)
+		err = platform_get_irq(pdev, 0);
+	if (err < 0) {
+		pr_err("Interrupt not found, functionality will be unavailable.");
+
+		/* Bail out without failing the driver. */
+		return 0;
+	}
+	irq = err;
+
+	err = request_threaded_irq(irq, NULL, lfa_irq_thread, IRQF_ONESHOT, DRIVER_NAME, NULL);
+	if (err != 0) {
+		pr_err("Interrupt setup failed, functionality will be unavailable.");
+
+		/* Bail out without failing the driver. */
+		return 0;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id lfa_of_ids[] = {
+	{ .compatible = "arm,armhf000", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lfa_of_ids);
+
+static const struct acpi_device_id lfa_acpi_ids[] = {
+	{"ARMHF000"},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, lfa_acpi_ids);
+
+static struct platform_driver lfa_driver = {
+	.probe = lfa_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = lfa_of_ids,
+		.acpi_match_table = ACPI_PTR(lfa_acpi_ids),
+	},
+};
+
 static int __init lfa_init(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -536,22 +648,32 @@ static int __init lfa_init(void)
 	pr_info("Arm Live Firmware Activation (LFA): detected v%ld.%ld\n",
 		reg.a0 >> 16, reg.a0 & 0xffff);
 
+	err = platform_driver_register(&lfa_driver);
+	if (err < 0)
+		pr_err("Platform driver register failed");
+
 	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
 	if (!lfa_dir)
 		return -ENOMEM;
 
+	mutex_lock(&lfa_lock);
 	err = create_fw_images_tree();
 	if (err != 0)
 		kobject_put(lfa_dir);
 
+	mutex_unlock(&lfa_lock);
 	return err;
 }
 module_init(lfa_init);
 
 static void __exit lfa_exit(void)
 {
+	mutex_lock(&lfa_lock);
 	clean_fw_images_tree();
+	mutex_unlock(&lfa_lock);
+
 	kobject_put(lfa_dir);
+	platform_driver_unregister(&lfa_driver);
 }
 module_exit(lfa_exit);
 
-- 
2.43.0

