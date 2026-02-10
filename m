Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C863019D6
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 22:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763283; cv=fail; b=bk7gEvzaqrlWH1u08I07PcHkv2m/UBd5A97aJBZrToi33t6hxjArNEQX/tHxJ7X0nSwQNjVZTC9vPNeHNv3whTABbWjHxep8zRf4dL+yEpPSdO3X9hu2YuF7SGThwyl0fnzqFJ95pES3Ch/CYlXFiXA5qxwA7Qr1cIY2mX85hE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763283; c=relaxed/simple;
	bh=yxXLN2QIqXYoGMKQhRw1cPWTQK/mKPkKOZafW28lAfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3IwCAZbdV3/B7QObn+jIGqnJMCr+P6ke7kdVxf29DpetFHGuJOGpyLjqHpi/jkGpdU5e9UxFLY8JAsflavR/tVPBUZ90QwTtiLOmm+fi1pMTHIFMADZp3HwWT94js9YrCfAkrO4OV2HGf5KwGMUkFIl5ws+etEkG9DPtgWM9R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XYVKVsk+; arc=fail smtp.client-ip=40.93.195.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XYVKVsk+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmB8xdm7njoGsR4HFw/TSCBYPHhROEuAQKGelnvZ5wfjVJJWYMo1/U93bx0duAG8q+IcLMBLetlUtkvx3rpIul6RmuD+peqXVWYbMxWz3MpbwMKF6l5E7ALqLk1nuXOzUellDmgwbD4Bnxg5yudyorDvzfK0u4dY9KEWsQe9nW0GvscxPoMLM9P2d1B3gWxTFoKFZxowXBrEbZ1gGxMmKDgBZWd4HmBIASdyxa0uFrepE8swK1TLo3J+3BbmiJsudSrZi7jYDVAPtJzbCCPIQcmnJdB5OZBC/9Ip1FYfK4AmN4PvVTTTppfCS1ig6hiGdmqwV8szuJZjGOGktnSRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/rEwQelwnk8tcG5DiF1TnNxm8y+Bx/QonTYNtVktwg=;
 b=GM5avJ0WqN1/eEtVYsCQy/OnagdZHVK8XlGJb9IF0Srtw3Y9dPSnoyef7pgriFhznAKN1aL6m08ZE61kz+tQN2TZUT7tf7Mk7fB4BxzC912SRD9Lh8vUI//itJg9odO0w1mp4IosDsJpucyXtpD4OewUExx4s/TMdvYuapSdTzFbbTs2PBGTKBJpmAyr89ZyI41eW6JrR3l8dJ4J8KVAymcXC0QEn+VI0uVbzCxjiTx/KeFQWHxi3uKjSvTMF9sZ+lbHcIL7tz1R8plZUhkQ193OV13NZ7vN0btsK0S74By7g1PEJDWPpQQA920uDzHspme697TJBb/onCw1rJiC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/rEwQelwnk8tcG5DiF1TnNxm8y+Bx/QonTYNtVktwg=;
 b=XYVKVsk++KYrYvv9dWtI3hPgzL6v2JGKHVrAyVPVASKfsWBjUKbYYE6mID4Q+hEP9Cl1ba/gxrMzdfT3D5SJji4zf4AFhCXrTyC3tFtOxXd2Zj5+s0R7xeGTO7/EqwoMSubBJyYiw7iVT+JRuPdhQhSywXqParrTSs7m26r6xbf7B39En83q7DvPKRVgEZbtmDYyzdGlRyit5qPItjSLkTtPuUzaC7qyPUzd0v1UPXe+vZFkDXe2R0PaC1sqxdYVURat9hmcAijTcJJHGBRCC9Y4NNvLH2FbKLD3shpnt0vfh2cMQfRQyljchEuAyoUISzfp8l38Ta0Ef02sdiF+yQ==
Received: from SJ0PR03CA0079.namprd03.prod.outlook.com (2603:10b6:a03:331::24)
 by DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 22:41:10 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::5e) by SJ0PR03CA0079.outlook.office365.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 22:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 22:41:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 14:40:56 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 10 Feb 2026 14:40:55 -0800
Received: from build-vvidwans-noble-20260107.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 10 Feb 2026 14:40:55 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>,
	<trilokkumar.soni@oss.qualcomm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
Date: Tue, 10 Feb 2026 22:40:22 +0000
Message-ID: <20260210224023.2341728-2-vvidwans@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 50af889c-bcce-489d-f3f0-08de68f57c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nq6PtxLRUzajxn+jc3QG46cZ5VORxiQ8BHWfAaGomCOuX908UDLkrtn1nQko?=
 =?us-ascii?Q?pDESTS3ljGLWQ6KB84qeXnIxMh4ln2Tg7GhK5cSRRt19E62rgssCTRZ0yN6X?=
 =?us-ascii?Q?brl8uMdyBJoU5OSyXJf4pK9lPP16mpL223bDOtXrmrkCFAT8+2/rJtRVQ8iS?=
 =?us-ascii?Q?miAizAdXuXGUZJXCa4F3F3RrVmQjavuA2adPrsaKZKwKhVGD/w2AVpQhXJXX?=
 =?us-ascii?Q?4D0VhiTfVRQLHpb8MPJT/rg5gGkMb5JAiPQ3aq1ImRU6DyX1YOhzx8Ph2xfh?=
 =?us-ascii?Q?3EXgbs5zSh6M4+ondnZaCV7f/QjXRk0WRdU+Z8F3PGpb4wXcs9npvJSmahej?=
 =?us-ascii?Q?QlVnWG08/7EhyNFtOFDlxBaP+k6BtU0Xr2eoutweFrdRzKDdG43iX4Fui1o7?=
 =?us-ascii?Q?3v4cR1vMHAk2NEsb/Z3s26x7ZF0D7xbHD5xegEOpk2n4l3axZEE4msL4UP5t?=
 =?us-ascii?Q?T1pF+VqJB8qBL394HW5lVBK7TAjtd7v4BIzXgzRfvRqVfSm91Az8p/RmKGUq?=
 =?us-ascii?Q?09rTXqilVsIG5nXBjWPPd2Yb4BhIx9NXrQ8KBQBL49Cn9YCS2huIh6EK4GDk?=
 =?us-ascii?Q?R9es4+vmFge6JGlW16DBNgnNH1pbCU0iAindn47jQK2mJ6OOVTwN5JQ2jh7x?=
 =?us-ascii?Q?bw7DjwZawtzeMROE5zS9fg5aYtvM7gURcTcC1fAI3x3xl+Ad6xo4wSmH9bCT?=
 =?us-ascii?Q?eyqgk3UZW/4JYHLHhAlZY9BvU5nO71IXuLwqD/mXtk9KQPaCNQyMW3IjxUTN?=
 =?us-ascii?Q?qgiOjWQ6BowpmHE9Chph1K24ur211UrY3ryEPuQig6j9IRiaGbIshcXgMUbW?=
 =?us-ascii?Q?3Cet64dkTiMUrlODj+1aAOcQtZXcvCzpV7UuvnmiU+UnOgNfy8b16o/A6U6d?=
 =?us-ascii?Q?LsicmhDIk5ZoUrXLqyzlVjPEbHYLMWjwRrUC5WW/xybGh690tECOYNZOH/W5?=
 =?us-ascii?Q?TbixAvjlyfaT+YO/SVAJ4OrLOfw4/JVZ/xFjvlKp/9c5ahdKHb1Gw7qwZwR7?=
 =?us-ascii?Q?JLS/1ang9hx9bv+LqQdjbADWJHysmLZma96rSIRgsNqqlT/hrMz4IFTZ/AA0?=
 =?us-ascii?Q?GHcsBoa4XdEtRt8JIHgo3umavxv6Rb162lUNaTaCw9a2FzLOHbjo1JesELmF?=
 =?us-ascii?Q?WfwMMjUQez5dqTSUcUpSztdQdLHE1HDiCcePz7XEnUDtWG4N1ZufQtbIgSRx?=
 =?us-ascii?Q?MbIN6RwWOhnwFRmK5hUk4Fent6MOlIWR9kaZLJn45IM9e2vHETjHL7knEh8v?=
 =?us-ascii?Q?hjL5FXaP3yAg3ankdgNDwYXPacX48i4aFkjr81IB9Ku5Q3vF7O+6ki+0Id0v?=
 =?us-ascii?Q?IxPgnQOkQAhzE75zuIfsM1KB13KydOv/jovKIAKxNd6J8tE6WBMBg01rLhmO?=
 =?us-ascii?Q?oC6HOM64Dmo8QB9l8noqH6GQw0ZqyuENvKbmVORc0lSwpgSjtrLMqdPLiP5G?=
 =?us-ascii?Q?YuyKKsnqqn+GsubSm3b009jqEK3wx3jvLyQ3JErZyHefE6uR+ZZ0pLck4eMl?=
 =?us-ascii?Q?B8oWKJgN7PaKyiv3nWkak8qJAZkvPFvGk2OYYOTEG6uiXrSWU86PgdheQq7m?=
 =?us-ascii?Q?Uy+xuyqMs/baL4E20eol9waRlcRyNbgi+0CJGApNFK6+rBgFujIXyvCLyIvR?=
 =?us-ascii?Q?2RAiqtBly4mu+aavkVYUVnIfYCQndiAoQX2o+atUPgnYQzBcDe4e2ZqiW0b3?=
 =?us-ascii?Q?P42T5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yJlLpzulTGqYBSyxNt17QTAIGu7aJgYPhDJiJtTQ1WiXDcya6cOS+tK5sQzkBMcIX94HHmT1VZCo5DV4amXqqH994hil3DRYA9RR3MVwSRfG+AyVahaVHnQRd5I18Qa48QttyBg21ytcYhxhmkU7BRuKJDrPLLIGKPnGjnWox4wwOMEunSTQAZbce+W5Tk+h9lsHShkrmChil33K0x+s2BkJbhV+z4eIpAY9lCGtx3n3P0tiK6pwNKm98F76vqoD3kAIGaAOporOjip1qihpVwmdNBVlYiiTiAczf+l0jxiFcKdiVV7gSu/D1+qz2lCoIAQN1vPl+BAOpoEb7wCs20oLhb8STH+P1B4MDHUwaNt4ymGYLvoCjbO23UEhRo6l3O2PQX5kDaFTGZdnWJKqOylypGQnjoqzV7cPuXULR6x35Z+tAxlzVEWaGVXJTUZO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:41:09.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50af889c-bcce-489d-f3f0-08de68f57c68
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452

Enhance PRIME/ACTIVATION functions to touch watchdog and implement
timeout mechanism. This update ensures that any potential hangs are
detected promptly and that the LFA process is allocated sufficient
execution time before the watchdog timer expires. These changes improve
overall system reliability by reducing the risk of undetected process
stalls and unexpected watchdog resets.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index da6b54fe1685..b0ace6fc8dac 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -17,6 +17,9 @@
 #include <linux/array_size.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/nmi.h>
+#include <linux/ktime.h>
+#include <linux/delay.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt) "Arm LFA: " fmt
@@ -37,6 +40,14 @@
 #define LFA_PRIME_CALL_AGAIN		BIT(0)
 #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
 
+/* Prime loop limits, TODO: tune after testing */
+#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
+#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */
+
+/* Activation loop limits, TODO: tune after testing */
+#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
+#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
+
 /* LFA return values */
 #define LFA_SUCCESS			0
 #define LFA_NOT_SUPPORTED		1
@@ -219,6 +230,7 @@ static int call_lfa_activate(void *data)
 	struct image_props *attrs = data;
 	struct arm_smccc_1_2_regs args = { 0 };
 	struct arm_smccc_1_2_regs res = { 0 };
+	ktime_t end = ktime_add_us(ktime_get(), LFA_ACTIVATE_BUDGET_US);
 
 	args.a0 = LFA_1_0_FN_ACTIVATE;
 	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
@@ -232,6 +244,8 @@ static int call_lfa_activate(void *data)
 	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
 
 	for (;;) {
+		/* Touch watchdog, ACTIVATE shouldn't take longer than watchdog_thresh */
+		touch_nmi_watchdog();
 		arm_smccc_1_2_invoke(&args, &res);
 
 		if ((long)res.a0 < 0) {
@@ -241,6 +255,15 @@ static int call_lfa_activate(void *data)
 		}
 		if (!(res.a1 & LFA_ACTIVATE_CALL_AGAIN))
 			break; /* ACTIVATE successful */
+
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			udelay(LFA_ACTIVATE_POLL_DELAY_US);
+			continue;
+		}
+
+		pr_err("ACTIVATE for image %s timed out", attrs->image_name);
+		return -ETIMEDOUT;
 	}
 
 	return res.a0;
@@ -290,6 +313,7 @@ static int prime_fw_image(struct image_props *attrs)
 {
 	struct arm_smccc_1_2_regs args = { 0 };
 	struct arm_smccc_1_2_regs res = { 0 };
+	ktime_t end = ktime_add_us(ktime_get(), LFA_PRIME_BUDGET_US);
 	int ret;
 
 	mutex_lock(&lfa_lock);
@@ -317,6 +341,8 @@ static int prime_fw_image(struct image_props *attrs)
 	args.a0 = LFA_1_0_FN_PRIME;
 	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
 	for (;;) {
+		/* Touch watchdog, PRIME shouldn't take longer than watchdog_thresh */
+		touch_nmi_watchdog();
 		arm_smccc_1_2_invoke(&args, &res);
 
 		if ((long)res.a0 < 0) {
@@ -328,6 +354,20 @@ static int prime_fw_image(struct image_props *attrs)
 		}
 		if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
 			break; /* PRIME successful */
+
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			udelay(LFA_PRIME_POLL_DELAY_US);
+			continue;
+		}
+
+		pr_err("LFA_PRIME for image %s timed out", attrs->image_name);
+		mutex_unlock(&lfa_lock);
+
+		ret = lfa_cancel(attrs);
+		if (ret != 0)
+			return ret;
+		return -ETIMEDOUT;
 	}
 
 	mutex_unlock(&lfa_lock);
-- 
2.43.0

