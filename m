Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318B3019D6
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763289; cv=fail; b=ZAjjQum13e7L5tVppS+VOj7rjcKmeOoUY0pCygBsB25IDTs+VufCFCA0/JQ2BZQhI1bwT5KhfdbNrCiRWY+y7zQDZfEIp3rk2yZQsOVb/eBPxYcmFpmgsIixssGbkUOWrVlVSIGmZGzZm+dmcC5iA2aUNfJI1fEqRpIgpH31MHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763289; c=relaxed/simple;
	bh=SDdPosqxORcWZFmHQY6AAqC0a2dLZ37qe311OKXcYrs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4lJYV5yvqOTiquW2Z59ox0XV91UK4Q4Mg3Fy3EakvC1pzBc0EPT/1Kw8AMC/EyYAGXN71lQY2i+L2JjDDD+u/18KHuQY7kqgi2tnE+KNx8BHZhKaaCWC/a//x3Jz1+tOudqw5CTVydjZB4JGE7VMo5CJ5Iwq2mwTjVtrun6ihQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VSqmGfHB; arc=fail smtp.client-ip=52.101.56.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VSqmGfHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISUu4P/6kqv3RaRf7/AAbnU2TjfmGvGrfh7dM6mulxZNl4psJtobXXDk29zwKECf06DTMPzzi6q45lhFg/jb85aK9CymKp3d55WsSRMycEMQAFhtv14pyUhuC2hRmxHDpS5rREoSddv4203ajrg+QMIDnFoACW594xuc2LvX5NX1YP0HHGXBFCcUpuFF7tbd+RxK6N5KYkDswWdpr0niwCDyO3qYxqV5bqiXzXOKkJs68HVt90+c10QaWLSTUmmncSgJHz8rulW3sNufjXUKT7rJoI8fT6Sxt8iQAXlCdhXQk84FXRvV2Dd90105O3TSCa/KIFMGCDAYOgER3fl0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uiVQRlLKMe0cKr9/JttrZxKrjkYP81k6vYZ1ibHXjo=;
 b=b+wjyxxQxsvuuiAoEhd10hompUPMohpqHBzqkVTczTrcejIgF05hIRayFKZArGk0OxfalrQGA9frG3gfITlVOxClgbu092eyD9iRq1sCOQX0ObGFbUzfJKxzeJwV6bJE+9Dw/1QqOnw11denh+w9IjEY9TOw79YR0rzXGy5XKe0XYQgyx3rL8t0e2CZa6cceudVghqsJodH1QseolkgjYaklJfDxYAYK5qVL1FEyRF2p83fGCdMs+VQPBMVodymwGwWC747oQR8M1rZlD7g/j8lh98NG8ncKdMbzge1KrMky7zRbd03qXkQYiPdKfJQcrHod3BwJmr8Izrsrnm0REw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uiVQRlLKMe0cKr9/JttrZxKrjkYP81k6vYZ1ibHXjo=;
 b=VSqmGfHBYFUx/cEgP0WgUffMTBUuKM388wmK93o3lCuSIa/VYiZf5SmOTBuXkZ62sY62z+adw8cQiofWTc/OerAQJVn8KJjPOsJQA4gh2AgMftsxwnMakCa24b5CtkJTw8kDeqHDHrpULe1zYAuZYXUwlmqrdpEiFujTKtdJXJwVGDBDIumJzcmaHounDDcFjz92pMb4XF5Lrz2zJyRtlFaxe9+iKb93GaVM+vXJwkAPT2GA9uK+LhiTKGCimmKMDHPIZOp1oTWqFn7H+PfNg/Nwh34vZy3bwa5aZF0IEXxz1FE0KlvbjJTOYCDf9zdI+Q5kfzjSHlHRREnxHMwDnQ==
Received: from SA1P222CA0072.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::28)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Tue, 10 Feb 2026 22:41:21 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::45) by SA1P222CA0072.outlook.office365.com
 (2603:10b6:806:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 22:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 22:41:20 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 14:40:57 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 10 Feb 2026 14:40:57 -0800
Received: from build-vvidwans-noble-20260107.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 10 Feb 2026 14:40:57 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>,
	<trilokkumar.soni@oss.qualcomm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [PATCH 2/2] firmware: smccc: register as platform driver
Date: Tue, 10 Feb 2026 22:40:23 +0000
Message-ID: <20260210224023.2341728-3-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210224023.2341728-1-vvidwans@nvidia.com>
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cdb5cd-c290-42f7-6b53-08de68f5831f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Go62ldOXn/LWCiYUsG9zU80qTF3VplnvjMr8WhPNCgoJATG7jx6ezFCRSR1j?=
 =?us-ascii?Q?oj4NkGu4f9G/WpDHe3oyFkeuOh/IRPaqq00CePZWLSHEpkjts9UngyP8XXz0?=
 =?us-ascii?Q?jXyPj414t32CcOKogEEDHG8GjdByw27Z3H/01hOabN6imGzD5gMCaj6Ksbgk?=
 =?us-ascii?Q?S2CBq0rybzMGBUEZbOfVFUELBXWvb8gOBBk59xYkD+lVfWDw+dYscJhrH+wD?=
 =?us-ascii?Q?raipKbj/rKD8jW/0i2sWjwxihi/M+aKJH6lQEM2R1NE5BtDRkW2I0zrdtGF2?=
 =?us-ascii?Q?npoGUVB8r3sMzGiC6iRmz00gvPXH484yPrhZ0dp9RZuZ3sWyR01FgJPkVeWG?=
 =?us-ascii?Q?YkYRSWidbSlu3Rz7WiQkqSlagLXlwbR3T11lCKgBLRFBlP87i9tUoASTFHHu?=
 =?us-ascii?Q?Ik5dP8jbCgh1pMjsR8tGUX3W4poNtR48cEsj/L/JjY4ajm9YrXzws7Mbl5x+?=
 =?us-ascii?Q?SXINTlb86wMY2C2saEoWpIPvssRVl7kg3CnOOoMTcT/UNOXmcQR4Gp9z5rJT?=
 =?us-ascii?Q?RgOdiB7bUHxY6NG0Mqq/9zL3bdHLm6wAAsado+VrmTjNGvzKBT9Q1TWPbITS?=
 =?us-ascii?Q?IUHskCwzsJt1e5Og+8Nav3Lei/QjuPvj6V3KWnCB6ZguNb5Bw4U5HrKdEqzx?=
 =?us-ascii?Q?AE3rFNw8tx92LYyOIVzI5SKxh6JsqfqmJbzMoTA77zx3tgXVndOQyH0b7yQR?=
 =?us-ascii?Q?7ialfr/QVw12neV1mTqrbRF/ewVMVnaqbmg/tajRDqMqPXpsmgi4GNxygz0L?=
 =?us-ascii?Q?S0J8cHJIT3QfMiKD2RwwyYGj3JnuQWC3yebulHZpHqf1/k0Y+5ITsZRRYdRJ?=
 =?us-ascii?Q?1ACZ9DyhzfepWyeCKZjoc/ge9oHWI1Ok8/F/hh4R5tqoUNLFeY2uO1ToKrPX?=
 =?us-ascii?Q?5tNzaHg9/SoJH9JGCF3SPB5ZVoryKhloTdQ7A9/GCdbRFjsNXXnHec737aUy?=
 =?us-ascii?Q?yXFe6rXyaRGYQXIcV/bSPP3oG8gCJLq9gMDOZDNLuVacbKcWP6UEOPl+Bwwo?=
 =?us-ascii?Q?SvbLmAeA2QU4tz/zG0F54HxXYiGluIn4xYBW/uHi1zkKeABYll5mKNCAcDON?=
 =?us-ascii?Q?1JFlCeoktxu0hIl6l3yCe+9gNswaDW2sDcGxxranH+VEiq2wjMZWQ2Ddl16d?=
 =?us-ascii?Q?e8Mhd58PxFnbFkD38YnvCXYosFOvJSrniXonRO6+E5YKyg0Lj490eaq+O4qe?=
 =?us-ascii?Q?xjq71yAj9fo8tmUO3vj0ZHwR44gA/hU+y10WyjENrgTKnIZgbovTmWM3YmQC?=
 =?us-ascii?Q?1HY0SfbHN+ni9Rrf2z8NW+IctVKLhw35qIPXlAUqVf1zgUnV6umqQPEH+xry?=
 =?us-ascii?Q?DrISh2kUoiGV5j3Hl6csZLaykP/sQ59z+JFRdqox8R1jr06kWOIpPW3LJAh/?=
 =?us-ascii?Q?JDRnEvEMO1i09RlfdFMt/8TNrYRcn0W0Jx/W+JXoux1At3VXynIMcNA/erxT?=
 =?us-ascii?Q?q4TrTPFXxzoYCI3rzTVlcya/sY+KytQtHgzSGsfiD4tRWrX3FWlBtQTg2Ag+?=
 =?us-ascii?Q?Mg9WOPIf2IWHQ/WDbW8ckM9T/QIduYsqPOgaJyw7R0tgCLf0EGulSHeo4dC/?=
 =?us-ascii?Q?2s2dBYSAiRzyLyLlGaKDj+OeLKrVppf/fIPaVZhak0jQqqBlkOW++LtqhVLb?=
 =?us-ascii?Q?bZIdth89aJviPlYn8T0RfnHYbH0OaWyExD+7LC3MupU8PF+9WBKKRQyf6a69?=
 =?us-ascii?Q?q0v6Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4o776J7eWkz4mJU2YApzzPpXpLeHbwSSZjW9P+ynqaMSTOb99gqt6wpx4PzDNvb2nNZkPPu1sLdp3TzPC/q5bSHUllk988joRkABhexoDy11IfCvnTfsJYSn8VdvNvESB6F6eV7/5xZtLoXSnnly4HdGJdgFAR1ahE5jnT3tCQWIZz3sRkV2zRTpmiGm2IMAqcJBzA5L9VgDR0SdohXs7cIflHlKJszj8fHN/MeVprFUIb5m2ZnFc4oJPuK+7zBRyO89kQycwumWlSC+zsmX7Z2BLRzgvFIIXRkMk/zOEOTilUo7k0fRkE4U4PS/Y2hJpuuNHP6zRnI0aXBGvgRwpKj/kHXOlo9VkkIWRF3d8y+iSrUkutIxeJRrUd9vISf2O0wDU9ASVcsyroGNKjgZHFtXL+fNPfUZqNXTUz71DxIT5WKpwl4NOLjJh4Zbnk1M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:41:20.8033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cdb5cd-c290-42f7-6b53-08de68f5831f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741

- Register the LFA driver as a platform driver corresponding to
'arml0003' ACPI device. The driver will be invoked when the device is
detected on a platform. NOTE: current functionality only available for
ACPI configuration.
- Add functionality to register ACPI notify handler for LFA in the
driver probe().
- When notify handler is invoked, driver will query latest FW component
details and trigger activation of capable and pending FW component in a
loop until all FWs are activated.

ACPI node snippet from LFA spec[1]:
Device (LFA0) {
   Name (_HID, "ARML0003")
   Name (_UID, 0)
}

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 153 ++++++++++++++++++++++++++++----
 1 file changed, 134 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index b0ace6fc8dac..042de937bf83 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -20,7 +20,10 @@
 #include <linux/nmi.h>
 #include <linux/ktime.h>
 #include <linux/delay.h>
+#include <linux/acpi.h>
+#include <linux/platform_device.h>
 
+#define DRIVER_NAME	"ARM_LFA"
 #undef pr_fmt
 #define pr_fmt(fmt) "Arm LFA: " fmt
 
@@ -284,26 +287,7 @@ static int activate_fw_image(struct image_props *attrs)
 		return lfa_cancel(attrs);
 	}
 
-	/*
-	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
-	 * number of firmware images in the LFA agent may change after a
-	 * successful activation attempt. Negate all image flags as well.
-	 */
-	attrs = NULL;
-	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
-		set_image_flags(attrs, -1, 0b1000, 0, 0);
-	}
-
 	update_fw_images_tree();
-
-	/*
-	 * Removing non-valid image directories at the end of an activation.
-	 * We can't remove the sysfs attributes while in the respective
-	 * _store() handler, so have to postpone the list removal to a
-	 * workqueue.
-	 */
-	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
-	queue_work(fw_images_update_wq, &fw_images_update_work);
 	mutex_unlock(&lfa_lock);
 
 	return ret;
@@ -627,6 +611,7 @@ static int update_fw_images_tree(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
 	struct uuid_regs image_uuid;
+	struct image_props *attrs;
 	char image_id_str[40];
 	int ret, num_of_components;
 
@@ -636,6 +621,15 @@ static int update_fw_images_tree(void)
 		return -ENODEV;
 	}
 
+	/*
+	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
+	 * number of firmware images in the LFA agent may change after a
+	 * successful activation attempt. Negate all image flags as well.
+	 */
+	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
+		set_image_flags(attrs, -1, 0b1000, 0, 0);
+	}
+
 	for (int i = 0; i < num_of_components; i++) {
 		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
 		reg.a1 = i; /* fw_seq_id under consideration */
@@ -653,9 +647,121 @@ static int update_fw_images_tree(void)
 		}
 	}
 
+	/*
+	 * Removing non-valid image directories at the end of an activation.
+	 * We can't remove the sysfs attributes while in the respective
+	 * _store() handler, so have to postpone the list removal to a
+	 * workqueue.
+	 */
+	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
+	queue_work(fw_images_update_wq, &fw_images_update_work);
+
+	return 0;
+}
+
+#if defined(CONFIG_ACPI)
+static void lfa_notify_handler(acpi_handle handle, u32 event, void *data)
+{
+	struct image_props *attrs = NULL;
+	int ret;
+	bool found_activable_image = false;
+
+	/* Get latest FW inventory */
+	mutex_lock(&lfa_lock);
+	ret = update_fw_images_tree();
+	mutex_unlock(&lfa_lock);
+	if (ret != 0) {
+		pr_err("FW images tree update failed");
+		return;
+	}
+
+	/*
+	 * Go through all FW images in a loop and trigger activation
+	 * of all activable and pending images.
+	 */
+	do {
+		/* Reset activable image flag */
+		found_activable_image = false;
+		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
+			if (attrs->fw_seq_id == -1)
+				continue; /* Invalid FW component */
+
+			if ((!attrs->activation_capable) || (!attrs->activation_pending))
+				continue; /* FW component is not activable */
+
+			/*
+			 * Found an image that is activable.
+			 * As the FW images tree is revised after activation, it is
+			 * not ideal to invoke activation from inside
+			 * list_for_each_entry() loop.
+			 * So, set the flasg and exit loop.
+			 */
+			found_activable_image = true;
+			break;
+		}
+
+		if (found_activable_image) {
+			ret = prime_fw_image(attrs);
+			if (ret) {
+				pr_err("Firmware prime failed: %s\n",
+					lfa_error_strings[-ret]);
+				return;
+			}
+
+			ret = activate_fw_image(attrs);
+			if (ret) {
+				pr_err("Firmware activation failed: %s\n",
+					lfa_error_strings[-ret]);
+				return;
+			}
+
+			pr_info("Firmware %s activation succeeded", attrs->image_name);
+		}
+	} while (found_activable_image);
+}
+
+static int lfa_probe(struct platform_device *pdev)
+{
+	acpi_status status;
+	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
+
+	if (!handle)
+		return -ENODEV;
+
+	/* Register notify handler that indicates if LFA updates are available */
+	status = acpi_install_notify_handler(handle,
+		ACPI_DEVICE_NOTIFY, lfa_notify_handler, pdev);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
 	return 0;
 }
 
+static void lfa_remove(struct platform_device *pdev)
+{
+	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
+
+	if (handle)
+		acpi_remove_notify_handler(handle,
+			ACPI_DEVICE_NOTIFY, lfa_notify_handler);
+}
+
+static const struct acpi_device_id lfa_acpi_ids[] = {
+	{"ARML0003"},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, lfa_acpi_ids);
+
+static struct platform_driver lfa_driver = {
+	.probe = lfa_probe,
+	.remove = lfa_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.acpi_match_table = ACPI_PTR(lfa_acpi_ids),
+	},
+};
+#endif
+
 static int __init lfa_init(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -679,6 +785,12 @@ static int __init lfa_init(void)
 	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
 		reg.a0 >> 16, reg.a0 & 0xffff);
 
+#if defined(CONFIG_ACPI)
+	err = platform_driver_register(&lfa_driver);
+	if (err < 0)
+		pr_err("Platform driver register failed");
+#endif
+
 	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
 	if (!lfa_dir)
 		return -ENOMEM;
@@ -703,6 +815,9 @@ static void __exit lfa_exit(void)
 	mutex_unlock(&lfa_lock);
 
 	kobject_put(lfa_dir);
+#if defined(CONFIG_ACPI)
+	platform_driver_unregister(&lfa_driver);
+#endif
 }
 module_exit(lfa_exit);
 
-- 
2.43.0

