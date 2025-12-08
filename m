Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92F2EC55C
	for <linux-coco@lists.linux.dev>; Mon,  8 Dec 2025 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232070; cv=fail; b=Z7ivcbnQwg8cru6JTHfm87k6JYexiEfW5lDMRhtlKCF/+a66JB0ElPJ7PBqMVt68Zx9RZw/6oqAXvUQmZ03Dq/7TJeYFraZStjP/u1v8MdP+WDej/uHGu8TrBnspb9+JWKibtyVP8GGwQw28xm32QRUg5Jk0253uos4nprDfYfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232070; c=relaxed/simple;
	bh=nu1qwZLl+bw/0kkC8fMwcBMrxWgavaRa4g60Y7S1ZlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5hhKQGuD3GGTvky7Iuy+KSAoWcSSW6yI6usFHJP7pt5VlY+xKNzUqI3ZxFIumz9rysswA8/mOVkk9jtMmMn0WCx3hhFKSJJ6p89nczDEgm29N0BojiXIbIMMhD+F+xJjvq+cprGO//Kkn6kZ51VXn2D/bOPdAIJYSXmufUwR/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NTKSQM7H; arc=fail smtp.client-ip=40.107.208.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NTKSQM7H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpiCdk/u0E5TnEmrE+tePmtm39MRNwhWnjXNFJfbqXyhXxYOtowpIrOYPk1but3Ps/9I6OdgChVSkv2mA9lVGDN0oLu0ErSrLfH8eGqgki69+3zWb4rdpTVDuATnSlFUHDUXVN3zyS0uZN1OQ/yOIXyh8J93qBxqMmgFlbcjgv4X9CPzadJHn3SyU8F2z5CzSOEl7k/yrQUDKQS6CJMsn7QcBNdVClIA1o3phl8cZ7ggIrSKBht1W/QpKDboRIT4ffphMjrVr1jLFM2pbdxtr/KsSISMwxCMOrSXfxwqUthy9eBy+Wb1VsTRMtL86qaKDXEQESqpqN1ju6u3K/HUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It+M1e+ZKZqRz3i0LYB9UkqDMz0DAatokyU2zdXSiJM=;
 b=ws4zXTcEMuPeb452DOmD1mcb3q1hqckbwBdnNqpEjskMxj4lhdJTNGTRXmxQz6aIIAY2qtmAAShseNOGhLYmbz73Q/WaEwRxs2qfGGxc483eD7f9iWfYZhtCXD9aRRUnln6Ey9oEDrmuf04p/Xqa5UT9ThsWsmIxgAubF0fLBPXFBWdido+4h7OPfFMsUs9pJoTx/VDpSbDya2oalHBomTyTb6voDrOZfJHneOgaiUPVIZeMmSTvYYMtvFzWAPuSHViUeUlmp4Hh+9XnURW8+DoBEUa4jHxe4C5KrKvOBgxREwHGwP7Avc+A643YmMlifK9Ar50rpxxrvxzpc8r+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It+M1e+ZKZqRz3i0LYB9UkqDMz0DAatokyU2zdXSiJM=;
 b=NTKSQM7HrObMhYNUYrVF46C1imVHnckQIiB1t89UYZYEaKihNPymHxfhPz6eI8KVpU+HYbFnwnDKmj/naDSUWNaL9GYdXbnbsFyFYIjeOS1MVRA53gmL44hRX3oVQsftBYFVLpSayVaoHLkaTB/xgr0j+vdsBZlaQijVS1Y61NOyWbTogtHIxIQ/265kmlQY/d6byxMF7mXK8LlTMNtdfmglvBLrWVWcvBL2/znldjikcQHo7mSYaP7jrG8rf5SRCGn8pq53RqhkDQOHVbElU0gZBoixcaBHFczQCJqgNAfTM9TDYfCfhQcl37KrhX1lbKlGzyV/I1ZbOfroQQcmwA==
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by DS4PR12MB9746.namprd12.prod.outlook.com (2603:10b6:8:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:24 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::6f) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 22:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:08 -0800
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
Subject: [RFC PATCH 2/5] firmware: smccc: LFA: refactor
Date: Mon, 8 Dec 2025 22:13:12 +0000
Message-ID: <20251208221319.1524888-3-vvidwans@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS4PR12MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7785c0-8256-4e77-0f16-08de36a724c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HV0uDhuVSK0gPGbB4eQ53ZVTfAOmnKrfjvoFlOtgX+1XZdKHdtB6Rgjrx0OP?=
 =?us-ascii?Q?NsZaZoPmPC2VHKTfgl7NhX6ONrLMXWqaDIeRa+wyq9g/JAMonWmDC0oRWwNN?=
 =?us-ascii?Q?yClUYvRYpDSJ4wvl629wN1TgOxXhVSqa1/CdzCAVG7PRvFoiA962JcYmlu0k?=
 =?us-ascii?Q?+gwNIuKvJntuTzuwYjz8OBN2BnpTREUUj5vIvbsB6BA1S1KMxxXf8S0F4IFB?=
 =?us-ascii?Q?hE93z1FKtzbS6EKublCvUSFQFjLAdrBR8t2AFmbaotP8ZnP8pLbDl0p/F+XB?=
 =?us-ascii?Q?rVRUdF0GnV0xB3LuCkONGANGfKsqycK+hWB28RWfhqZlQAejdCcVg7SsmqZ4?=
 =?us-ascii?Q?a+1tbvUO8zNBj4SoHX/bMlNqYHDPVf0IVZosDVdqlDRUBkr3KewhEpZUcgNu?=
 =?us-ascii?Q?tcZpQTbqTArFzEoMyW3AB4w6/aiOf+glJLI/3sYh1YnoHVVTktDW+8sEiW0o?=
 =?us-ascii?Q?6g/WhwiQXRBzlZ+uLQZSljQVHIdANnL6MoW2zvOKaoKk9h5BaX4XqeINtWAx?=
 =?us-ascii?Q?GhE/46jSiBnp34tIBGXXPzd3asqmXPKfMGGBhejWuz/GWaApB0pZASIi8JJa?=
 =?us-ascii?Q?eEoBcYmsQIIwjnz6YVjlINiU8d6qKjN8IQ5RBz5zrqXyBs7fCej8JGH+x+4K?=
 =?us-ascii?Q?Am7eNOay3p5UZ8S07pQoFU62MjyuLNKa9OVyAsCsv3GC0dpWq8aRKeF65Qbx?=
 =?us-ascii?Q?KfbAV4YXr9I93ofw0lPI2XNUV02H9qHivPpzThHNr7SpOgbUyDaUv70wILy9?=
 =?us-ascii?Q?D4ojjV1B+qAmLUPqQHQ+I42TvAEZBcLgGrL5uhPU+NgfLzKiXmV0rWLGUufJ?=
 =?us-ascii?Q?D8KevWJmj0sgI20CAaB36f2KSuFb/jhTMhOPEmEfqYfi93MmsXXHPiXp/W5W?=
 =?us-ascii?Q?cd8t9jJOvnHzB2MYyuoHzGRY8p2ZO+WtvbbFUiBRXOrpreq2b0TITe0ZHLFZ?=
 =?us-ascii?Q?IeZkgWKCp4kX1F7r+Sc6chD8/WX0w1aG4av6VlunIexHRH7xvCU+ertDXACX?=
 =?us-ascii?Q?C/7C2xPSalCmG1LStC0xs3uK7506poqRwD3YcDLUpLEeEuFyl9EgZuNejk/h?=
 =?us-ascii?Q?xEti/0nPzkN2uziM2BpBnf/75e0QBPv6BtYka14EQhF5hgK48NL3uuyLlCzs?=
 =?us-ascii?Q?7t4pHJjgzz6+HGLFIuSzUEWWxXioqXcsEzorsNptojtwXGJnQufPYJOJiEcf?=
 =?us-ascii?Q?/j8aw4dRTPFqaUUOSmjsp/4q3ICUhb6mwYE7U57C287pF5ofHkD094yHXrk5?=
 =?us-ascii?Q?+Wda/U7aQ8l911BfCbh80k0ZKuRyUNlyPya/fOqDokEfbp9m8gD2qtSmWjyV?=
 =?us-ascii?Q?F+yhTqdHj7WmjJOV8KpMwO3J1FfyuFs998hzun0X+c7CpdM8oGu9StJzNiTa?=
 =?us-ascii?Q?iGz/nQdHZVFOWx1nC/93zBjLkwWCKz0UpGW/yExmGdBAoPiuBy6wkGTmv3GU?=
 =?us-ascii?Q?ywbysMuef6tVtlcIAzTPUQTwag9axKj17liKddMk0ELzkePJoEX465xXOGPI?=
 =?us-ascii?Q?JmCxo5kxKmsjE+QuS4LWpeCLp+gOGAd9KRZAWxdedusCn1ex+0AulNrKfrKd?=
 =?us-ascii?Q?TnXPSoGs58aAW6yGSsw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:23.6127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7785c0-8256-4e77-0f16-08de36a724c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9746

- Refactor LFA CANCEL logic into independent lfa_cancel() function.
- Use FW UUID as image_name for images not known by the driver.
- Move may_reset_cpu check to activate_fw_image(). This keeps all the
functionality within a function.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 64 ++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index bdde14b66606..df8b65324413 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -129,6 +129,31 @@ static int get_nr_lfa_components(void)
 	return reg.a1;
 }
 
+static int lfa_cancel(struct image_props *attrs)
+{
+	struct arm_smccc_1_2_regs reg = { 0 };
+
+	reg.a0 = LFA_1_0_FN_CANCEL;
+	reg.a1 = attrs->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
+
+	/*
+	 * When firmware activation is called with "skip_cpu_rendezvous=1",
+	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
+	 * cancelled.
+	 */
+	if (reg.a0 == LFA_SUCCESS) {
+		pr_info("Activation cancelled for image %s\n",
+			attrs->image_name);
+	} else {
+		pr_err("Firmware activation could not be cancelled: %s\n",
+		       lfa_error_strings[-reg.a0]);
+		return -EINVAL;
+	}
+
+	return reg.a0;
+}
+
 static int call_lfa_activate(void *data)
 {
 	struct image_props *attrs = data;
@@ -160,6 +185,11 @@ static int activate_fw_image(struct image_props *attrs)
 	struct arm_smccc_1_2_regs res = { 0 };
 	int ret;
 
+	if (attrs->may_reset_cpu) {
+		pr_err("CPU reset not supported by kernel driver\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * LFA_PRIME/ACTIVATE will return 1 in res.a1 if the firmware
 	 * priming/activation is still in progress. In that case
@@ -284,12 +314,6 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
 					 image_attrs[LFA_ATTR_ACTIVATE]);
 	int ret;
 
-	if (attrs->may_reset_cpu) {
-		pr_err("Firmware component requires unsupported CPU reset\n");
-
-		return -EINVAL;
-	}
-
 	ret = activate_fw_image(attrs);
 	if (ret) {
 		pr_err("Firmware activation failed: %s\n",
@@ -309,25 +333,11 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 {
 	struct image_props *attrs = container_of(attr, struct image_props,
 						 image_attrs[LFA_ATTR_CANCEL]);
-	struct arm_smccc_1_2_regs reg = { 0 };
-
-	reg.a0 = LFA_1_0_FN_CANCEL;
-	reg.a1 = attrs->fw_seq_id;
-	arm_smccc_1_2_invoke(&reg, &reg);
+	int ret;
 
-	/*
-	 * When firmware activation is called with "skip_cpu_rendezvous=1",
-	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
-	 * cancelled.
-	 */
-	if (reg.a0 == LFA_SUCCESS) {
-		pr_info("Activation cancelled for image %s\n",
-			attrs->image_name);
-	} else {
-		pr_err("Firmware activation could not be cancelled: %s\n",
-		       lfa_error_strings[-reg.a0]);
-		return -EINVAL;
-	}
+	ret = lfa_cancel(attrs);
+	if (ret != 0)
+		return ret;
 
 	return count;
 }
@@ -367,6 +377,8 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
 	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
 		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
 			image_name = fw_images_uuids[i].name;
+		else
+			image_name = fw_uuid;
 	}
 
 	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
@@ -414,6 +426,10 @@ static int create_fw_images_tree(void)
 	int ret, num_of_components;
 
 	num_of_components = get_nr_lfa_components();
+	if (num_of_components <= 0) {
+		pr_err("Error getting number of LFA components");
+		return -ENODEV;
+	}
 
 	for (int i = 0; i < num_of_components; i++) {
 		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
-- 
2.43.0

