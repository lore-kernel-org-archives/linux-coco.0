Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A42EB87F
	for <linux-coco@lists.linux.dev>; Mon,  8 Dec 2025 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232067; cv=fail; b=Wovbs9r7D8/2Zv0/eC/po86Ye+fLJh6i9l/ahdA66J1xD5rxymgrvPHo81W0ueMWQg5XQTEtWWUtZqon+K4Yo1e0nzuuU0ehWckrphb0tisLAvvz0Sf1ao70AXMz5HA5ooONW5HavzaexkozXQ4rwSyWLWuS2sjQiONPBYb1gso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232067; c=relaxed/simple;
	bh=XgncDHCPE0qUlcUYLZgaSH0Xh3vQ2qPIk+jvIsoEqkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7zGXYQMgL+WGrLofM8oiEeJ/N2cb+BFyDxzX1c3RLjeZeOWaN6rfqKctKreVKboCG5s4vC/28omeuXfVpk8pChQjvU39Qrm68R537MW2GTrdNHL3qhKe5i+4/IWPq+bM/E01ENNVX6W+HCt5WWsmo1MtiEB1lW7P66EM0azf44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BX1Mp8fl; arc=fail smtp.client-ip=40.107.200.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BX1Mp8fl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKFNYjiYJhHqIhKL6lt+HKt0RRsabTdnZlcDPMXyViliXXmqieWXBtZUWLO6PZDNTXxBU+9FNeFjJNJ5M/a9qUQk6eeo0K/oLFb065ZmYfXjRqeoMb78cqQUQvElcBzzAS/KJnLwvyrBlEPquuX+ON8s6S57Xbd2plzhM7hVZ4UYdSVwnpsAIpochkm1PgyRyyF+yfxvw0Bf9f56oD/ncBq7a2zn0H0vGVGUTZ8Un2jhNIMwQxocTUUPxzIa6ef83zkktSmKQ3ss7vqFi1wwYE0ZMH3tBw0oFvjj6fqgajUIiKp9i46LtxuYuaDy6L7qHt+AGGMYmqc6e8FvfwdIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNdCpr9KaMKmcawYn84inPu5qjCMmW6AI6/zz2hDM2M=;
 b=og97/tTFmYz383Kvgx3FmS2fBKOzcupMeNU5VrjAqLjYMG44nmj2ta8fFqT/lVB6fpMIHeUDNafpGbjNBO4DJ3ll4VeSwyY+HxEDjGBlgdFJrvnPOUbkz2K7pSdM5VZDP++yIufn9sfRjfcaKQwUDot4P8N8ElacRgFGiPhdwmhHEaAk3XPcymsOu/r8IWvqq7Fr2H9JcKSRfdlXbc9F65Rwp+1+PkEKf+BdD177IhQbD1C3I7l5V9oAxCINZynMVNyzvoe1UC+7yAP5yWBZfMZrfZItjWtKLxwxrpVze01nbbHQNfD7FdX4uwkKAo3QjcCIVd6NfIVyGgKcJG02kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNdCpr9KaMKmcawYn84inPu5qjCMmW6AI6/zz2hDM2M=;
 b=BX1Mp8fl3vJMIPz8PMxVYqiRnpnfP1tgU8fXAuQjZMiRmkQzCjArXPCb17oXX/PYiFTCli2EpZ2ltYLWKh2rUH9o8M7nOV6q7Xrnlj6Vszc26H8WCd6ODJ2zwprjtZ9/nUMIy1kN1fgf0OUsfOijQtYtj0uXXXf5Dp+4T0MZOuGeP92wCQ8COsQWszE/tEK514r1inlgLsXN0FRlxoFiBH1RBIrcG47hE5HzvmV0raSbpnMgkF6LJ+wr+GR1dzlLJy0Qq7/sETmP9JZRiBDo5RsC/8Y6nueaFmhN/pOofbc0JjnFqXu2a1dklrq1zCKNM3E/sq+QX60jfDfGgfYz2w==
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:19 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::6b) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 22:13:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:08 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Dec 2025 14:14:07 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Dec 2025 14:14:07 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [RFC PATCH 1/5] firmware: smccc: LFA: use smcc 1.2
Date: Mon, 8 Dec 2025 22:13:11 +0000
Message-ID: <20251208221319.1524888-2-vvidwans@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 793ffcff-36df-4b2f-4d28-08de36a721bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CoGe6Ro94/DaJPCHNMAsILQ2nzeER+kmW40ySCnWJNG2rkrlcDDp/lBu6kgy?=
 =?us-ascii?Q?3EO9ODr1G5SPcuWmMFPJtSAHZ7OsHCLhdRZnyosHHo91xCABssLXBt4LLTrB?=
 =?us-ascii?Q?AC8wqqwXMQjw24QLMxhvM8fBd1QFuz78LLnaTbUOsH+qJMDADsR7GxU/usKC?=
 =?us-ascii?Q?11XftCXXSUnaqlZd+ohow3l4sBsedN5c9c3DxKPja5kjpZlFd9znQmm4p4BJ?=
 =?us-ascii?Q?835goMAv2vkCjDf9tEsTM0/bjTLY/FS1YXMcbumN5DBmU47P12389Qlh7b6+?=
 =?us-ascii?Q?06E9p6aj1AC1lRtii56PnBnPr0tee+uTayq3yA9erim1c030py/KqeqN1Ujb?=
 =?us-ascii?Q?QvEi3KyEs66gnaaX+7eoVzp2kWQ4q+PD5xyccBXIFizp5m9KL/zDhajhLW5W?=
 =?us-ascii?Q?93NAI4KpBDCBiZHM7CHK7772osSdzlpMBzoms7hr5l82mQmrxZ09VSab9r2y?=
 =?us-ascii?Q?o+VcSMp4vlrqHoRsdsWiVnHETHYzHF/VnN09rQSzYzu322Zd5WxJGOkmePVH?=
 =?us-ascii?Q?gRLJnYiXizDOWO9cWx1Ps4zSlUiT04+yy6FtHDBq5G//LsqkeQDBWup4k2n1?=
 =?us-ascii?Q?3DaZiMETBLXLkK2bH2KHmBqn29rN+08/jYXgO9SJbLoN8UdHnr3Q+3pnDjXh?=
 =?us-ascii?Q?Ojo1BYZYcbbkXAVC7lnRfMAvN1Y9Jh4Ssps224kcrJim4hDoTJgv09tFjoxZ?=
 =?us-ascii?Q?CZni8jBXU/x23qAu/ssSvHWLhgXtAKxMUyV1PvBBuzCJHJqIGQs6u3PHDut2?=
 =?us-ascii?Q?8q15PS4KLqo85m9hyv4Jgq/WQRTmxEQuw7wXMmKYEuj+/Zk78CjiVFTrwuJQ?=
 =?us-ascii?Q?OGFSe3ZWIq8FoM41PfKnGxhb+NiWDzgXoa/Vhzo2CcLsW1gJfcoIh9Je1+lJ?=
 =?us-ascii?Q?794hQSaNimho1iStBu+AHXHHwZDG2WHwsJ0Qn7QBxzRZbhPl9GmIdcXHyEOC?=
 =?us-ascii?Q?7y+ZVWkxuKnaUEnNuFRxv45nbK1iCXXoR0LMgnXqfuZRR5kgpm65Pyzw3IOT?=
 =?us-ascii?Q?GSxHjKlnEZ2bJgTF56Ii4/smS/bbeDZa1Zem9/aCIpL8YOSrYxoLS1T1u5JR?=
 =?us-ascii?Q?ta/eE/qSY/iTv/KgF039dukpgqdSskyF6p7aiEvTHmnnr0QJdY9L65Wm7EAs?=
 =?us-ascii?Q?r3pwP1Cm9pPWiuCuojqtExF8XZuuKsBO2FJz2ubKvrRfIZa3Tp7dEMykIBWT?=
 =?us-ascii?Q?vXW9Msd5FP2aOYporFIW8Gd5fCaV4th0rNB7tHGcd09PS7SidDPYJ8GJxda/?=
 =?us-ascii?Q?DVMRJb+qk2Uu8YfvwtejW1OiqsP1eUCQzdaPKA4EPYmBPrgiUH0Q8KZN/YUQ?=
 =?us-ascii?Q?0KwJAByN4WuVVd0qjOdEEhibHQ13Vg5A2gVJnqowhvgPzpNr/LPD3fGRD30A?=
 =?us-ascii?Q?zq1gYKjRlY057T1lAO0ep9Vbay5EbeSOL1Mg1VU1QSHv9B2PyY4Pb+KZcnY1?=
 =?us-ascii?Q?Eew3cBYEopzqBp7GFp/QpCMHRpJJHy0pJadj1zdSBLkYcyeFR+lX6qh3LOGk?=
 =?us-ascii?Q?NwKQqxy3xfOsd7SbZB3JReCf+s4rXQ1MEH0/O5nyGr90P6EOsanz7qzLIC8T?=
 =?us-ascii?Q?/hR+Q8XsfyiYxwArh7c=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:18.5650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793ffcff-36df-4b2f-4d28-08de36a721bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047

Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 102 ++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 37 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 1f333237271d..bdde14b66606 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -117,32 +117,38 @@ static struct kobject *lfa_dir;
 
 static int get_nr_lfa_components(void)
 {
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs reg = { 0 };
 
-	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INFO, 0x0, &res);
-	if (res.a0 != LFA_SUCCESS)
-		return res.a0;
+	reg.a0 = LFA_1_0_FN_GET_INFO;
+	reg.a1 = 0; /* lfa_info_selector = 0 */
 
-	return res.a1;
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if (reg.a0 != LFA_SUCCESS)
+		return reg.a0;
+
+	return reg.a1;
 }
 
 static int call_lfa_activate(void *data)
 {
 	struct image_props *attrs = data;
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs args = { 0 };
+	struct arm_smccc_1_2_regs res = { 0 };
+
+	args.a0 = LFA_1_0_FN_ACTIVATE;
+	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
+	/*
+	 * As we do not support updates requiring a CPU reset (yet),
+	 * we pass 0 in args.a3 and args.a4, holding the entry point and context
+	 * ID respectively.
+	 * We want to force CPU rendezvous if either cpu_rendezvous or
+	 * cpu_rendezvous_forced is set. The flag value is flipped as
+	 * it is called skip_cpu_rendezvous in the spec.
+	 */
+	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
 
 	do {
-		/*
-		 * As we do not support updates requiring a CPU reset (yet),
-		 * we pass 0 in x3 and x4, holding the entry point and context
-		 * ID respectively.
-		 * We want to force CPU rendezvous if either cpu_rendezvous or
-		 * cpu_rendezvous_forced is set. The flag value is flipped as
-		 * it is called skip_cpu_rendezvous in the spec.
-		 */
-		arm_smccc_1_1_invoke(LFA_1_0_FN_ACTIVATE, attrs->fw_seq_id,
-			!(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous),
-			0, 0, &res);
+		arm_smccc_1_2_invoke(&args, &res);
 	} while (res.a0 == 0 && res.a1 == 1);
 
 	return res.a0;
@@ -150,7 +156,8 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct image_props *attrs)
 {
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs args = { 0 };
+	struct arm_smccc_1_2_regs res = { 0 };
 	int ret;
 
 	/*
@@ -159,8 +166,10 @@ static int activate_fw_image(struct image_props *attrs)
 	 * LFA_PRIME/ACTIVATE will need to be called again.
 	 * res.a1 will become 0 once the prime/activate process completes.
 	 */
+	args.a0 = LFA_1_0_FN_PRIME;
+	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
 	do {
-		arm_smccc_1_1_invoke(LFA_1_0_FN_PRIME, attrs->fw_seq_id, &res);
+		arm_smccc_1_2_invoke(&args, &res);
 		if (res.a0 != LFA_SUCCESS) {
 			pr_err("LFA_PRIME failed: %s\n",
 				lfa_error_strings[-res.a0]);
@@ -211,15 +220,17 @@ static ssize_t activation_pending_show(struct kobject *kobj,
 {
 	struct image_props *attrs = container_of(attr, struct image_props,
 					 image_attrs[LFA_ATTR_ACT_PENDING]);
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs reg = { 0 };
 
 	/*
 	 * Activation pending status can change anytime thus we need to update
 	 * and return its current value
 	 */
-	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, attrs->fw_seq_id, &res);
-	if (res.a0 == LFA_SUCCESS)
-		attrs->activation_pending = !!(res.a3 & BIT(1));
+	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
+	reg.a1 = attrs->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if (reg.a0 == LFA_SUCCESS)
+		attrs->activation_pending = !!(reg.a3 & BIT(1));
 
 	return sysfs_emit(buf, "%d\n", attrs->activation_pending);
 }
@@ -298,21 +309,23 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 {
 	struct image_props *attrs = container_of(attr, struct image_props,
 						 image_attrs[LFA_ATTR_CANCEL]);
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs reg = { 0 };
 
-	arm_smccc_1_1_invoke(LFA_1_0_FN_CANCEL, attrs->fw_seq_id, &res);
+	reg.a0 = LFA_1_0_FN_CANCEL;
+	reg.a1 = attrs->fw_seq_id;
+	arm_smccc_1_2_invoke(&reg, &reg);
 
 	/*
 	 * When firmware activation is called with "skip_cpu_rendezvous=1",
 	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
 	 * cancelled.
 	 */
-	if (res.a0 == LFA_SUCCESS) {
+	if (reg.a0 == LFA_SUCCESS) {
 		pr_info("Activation cancelled for image %s\n",
 			attrs->image_name);
 	} else {
 		pr_err("Firmware activation could not be cancelled: %s\n",
-		       lfa_error_strings[-res.a0]);
+		       lfa_error_strings[-reg.a0]);
 		return -EINVAL;
 	}
 
@@ -395,21 +408,24 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
 
 static int create_fw_images_tree(void)
 {
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs reg = { 0 };
 	struct uuid_regs image_uuid;
 	char image_id_str[40];
 	int ret, num_of_components;
 
 	num_of_components = get_nr_lfa_components();
+
 	for (int i = 0; i < num_of_components; i++) {
-		arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, i, &res);
-		if (res.a0 == LFA_SUCCESS) {
-			image_uuid.uuid_lo = res.a1;
-			image_uuid.uuid_hi = res.a2;
+		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
+		reg.a1 = i; /* fw_seq_id under consideration */
+		arm_smccc_1_2_invoke(&reg, &reg);
+		if (reg.a0 == LFA_SUCCESS) {
+			image_uuid.uuid_lo = reg.a1;
+			image_uuid.uuid_hi = reg.a2;
 
 			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
 				 &image_uuid);
-			ret = create_fw_inventory(image_id_str, i, res.a3);
+			ret = create_fw_inventory(image_id_str, i, reg.a3);
 			if (ret)
 				return ret;
 		}
@@ -420,17 +436,29 @@ static int create_fw_images_tree(void)
 
 static int __init lfa_init(void)
 {
-	struct arm_smccc_res res = { 0 };
+	struct arm_smccc_1_2_regs reg = { 0 };
 	int err;
 
-	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_VERSION, &res);
-	if (res.a0 == -LFA_NOT_SUPPORTED) {
+	/* LFA requires SMCCC version >= 1.2 */
+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2) {
+		pr_err("Not supported with SMCCC version %u", arm_smccc_get_version());
+		return -ENODEV;
+	}
+
+	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE) {
+		pr_err("Invalid SMCCC conduit");
+		return -ENODEV;
+	}
+
+	reg.a0 = LFA_1_0_FN_GET_VERSION;
+	arm_smccc_1_2_invoke(&reg, &reg);
+	if (reg.a0 == -LFA_NOT_SUPPORTED) {
 		pr_err("Arm Live Firmware activation(LFA): no firmware agent found\n");
 		return -ENODEV;
 	}
 
 	pr_info("Arm Live Firmware Activation (LFA): detected v%ld.%ld\n",
-		res.a0 >> 16, res.a0 & 0xffff);
+		reg.a0 >> 16, reg.a0 & 0xffff);
 
 	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
 	if (!lfa_dir)
-- 
2.43.0

