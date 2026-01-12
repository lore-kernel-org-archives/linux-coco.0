Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1B331208
	for <linux-coco@lists.linux.dev>; Mon, 12 Jan 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249406; cv=fail; b=jVXkfkCUH+Ip6rxSXnMrXRRK44Na+CHcijWXQbA83+eMxB9G3B+t6Qk2SLuFj6K4sCSr7hUAf4TDiQ/KmP3TKVWEPH98a+dWsO2W2crpydJK6Tc6Qt8+nfN/eeJnd0xtSaMUh35KQ3vx1IQhLumeibhe4rcl+2kDIHZ0nRbl6JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249406; c=relaxed/simple;
	bh=tzPF3qlN5JHqpo7XzYQ2CYm7WBljWYw9r0J1HFzuB+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Maekxa/Q9bfkRAnq+7GsIb6+D95xx+yRhbhwgpl7GzQzpDiW8g70d/fDNIn1Zp80V7fDXfXAbW9X2wh6iys3d93mRZbZkkqKLPG47Kb7v0kXnGQRwrf/gG5HGStKqc7kUDPK2lxU51b4O5/ubnXW0uHRdJLo2+gXTX0SClBxwT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SIsLtivY; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SIsLtivY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwQ+q6fK3ZuuE0XoCYVYlGnP2nxKEKoUwfEpEhAEEemekYtAnr4PsekxLjTLppzND4CyBhDMmAP/JZY7iHwOMbqhtU+FZmPBFDI2Nzq38JM/0b3FpS+infm2aAkWrZU1QSpOJlZqs5ceAEmXrOtcrnMTtwpgmkOkG07e/74xanxOZyQ21wkP2h6HR5eU8yADelI2e5Xm4tgu1FUxv9aKHAUDXy4psNe/G90+XLls7rBeeXmChMdAVTRZRTSoYCnGP/lCuTmms4xfUkI4TSPwIoPIkglW3aRsqzXbxoT6Ed3ngVknbeUSu6VE6Dpkn53e8e5ml144QK87sEaFrUn9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVlyJfBY+TxW8330bmRrTRH8oxQkICGB4rxgQ8APyxI=;
 b=SMhRUreZp97+ygqXYl6do1JaB5UjvZqbFp63LkYCWV64yxfhHTG3RxB2kOvtJ8whqDGXjXKj2LPTLnOfWpECY9HOYNWyTyiOXiTC/wwzH0jZ/+PJnlXk8H00GAyAbb+vYN0P/U/NoJn3qkROoUo4gZ2JWji0Nhv+gi/FdJ7KF2/AT7MA/s0uDWE9IrJr8JIbO+5rhNjJ42Pfr11GwzTujS1XJui1Mw1Yz464Hannx34I/Bd/ZbV1QYKSmvQXNf/tOxsnBJ7TDt8IXf6OPasvDsDV4P72ZolrCEHMvYQGdZwKhqV80OeMJO4X0lhXGtecLUGdej/tgOmicJJ4JCPTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kvack.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVlyJfBY+TxW8330bmRrTRH8oxQkICGB4rxgQ8APyxI=;
 b=SIsLtivY6aCVcsk7YUD7rpr3/D0LEF8+6NsheNmpfmWDabHnDqHdKYl2BVfzBCOGW0hZsuDwfUpsD/oYB6WlZgdxPDxQpW1RL52doh0hDOE7+0m0djR6KQq0uXZh+KfbQ7k1mp42O0KkfTTCA+jG4/IKTr5L6bVcUUs4rLghjig=
Received: from MN2PR22CA0020.namprd22.prod.outlook.com (2603:10b6:208:238::25)
 by DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 20:23:18 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::1f) by MN2PR22CA0020.outlook.office365.com
 (2603:10b6:208:238::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 20:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 20:23:18 +0000
Received: from ellora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 14:23:17 -0600
From: "Pratik R. Sampat" <prsampat@amd.com>
To: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <kas@kernel.org>, <ardb@kernel.org>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <osalvador@suse.de>,
	<thomas.lendacky@amd.com>, <michael.roth@amd.com>, <prsampat@amd.com>
Subject: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory during hot-add
Date: Mon, 12 Jan 2026 14:22:59 -0600
Message-ID: <20260112202300.43546-2-prsampat@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112202300.43546-1-prsampat@amd.com>
References: <20260112202300.43546-1-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DS7PR12MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3ceb9d-9172-4ebd-d88d-08de52186c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?66JpWwiHsTOAXgCLyytz9jkMQG8Lwx3tltIBCghHs5/i428hdTAcbXdtZ5UV?=
 =?us-ascii?Q?nGeazdqvba/y7RcDT+mt9RiNrzN6RaKweXt+zG4UrW25B5EfuV/F2mGFH+bZ?=
 =?us-ascii?Q?wrNjk+dD4Wfl/stHYLuZrIspUy68sVR1jVsNinOPzMvUzriHEcGkjmK/+36l?=
 =?us-ascii?Q?HVSz1tLaFI76jO/G7TOLS65e9nCCTZ6gv9nySwhRWwSub2VVLsgSZcQCfnfW?=
 =?us-ascii?Q?7A/vLWBvPgEbOp+3GARfEMsdB5x889ErzO5OC+9bmZQtzi2hjc35I3p+4nSj?=
 =?us-ascii?Q?uRUeHrBT5f4sgiqURK+Jgcqgh4FcTIRXLzNqtk6SbHQ8b1x4Aw6EBiJL9wdr?=
 =?us-ascii?Q?xJpucwlxjVi4f3NE/Fya5JP+Knxi+pJR38+/IIU6ft8eNzrPc0cueA7yLKCm?=
 =?us-ascii?Q?Gc8rm/+mGackBgEOFvNtfJW1jVVl8SnISJV6PNEXI7BkjLxyrNGPA3O57mLO?=
 =?us-ascii?Q?tBwra/YLRjdJkBBaadtQikEpJ078qgXG3rqu0rjVqmv8bF90ws8A2Rt+1cKC?=
 =?us-ascii?Q?b8Z02XinOvQHm8oACCDxn9DDhlYdM/3uLtXapZ7D2z5CT82qIuySfYnAAPUF?=
 =?us-ascii?Q?nvSMzDbFWPHHlsdJJiNcKs0tG11ilLqSMVhfOG1EkgQdk+fGGFBW2oCMsUlK?=
 =?us-ascii?Q?oNLDUiRKBEric8sTr7J3OAD1RldH/Gtr4iIAxBGyEbYnrXbEEk9/zyvmRPDn?=
 =?us-ascii?Q?j+OROcbVFV+ntxIVdi7G3dbrFiqeZ8zLo+iNOo/pG3s+kCxmX+BDtyel6qrI?=
 =?us-ascii?Q?TyFaXc1T5Ldo0gdgeKC92OU4elLnac8Yu9Mhof/FSSSx56tZG3DwA+kHbk4u?=
 =?us-ascii?Q?UUHt7179rfUVzGCWy3qB9E93gJm03YS7uComP7NYaCa95t5O1Sf3EVQMJk9S?=
 =?us-ascii?Q?VbcQHsBJUqmsNX2OpNsNw96+BNXlP0dItbN96QTO0jqiCnwSdOg27EVnr+AF?=
 =?us-ascii?Q?m1Y98VtykKzJz7LKW/nb49yb76G4X7lz55caLhy2fBSTGZmelpRlUKaitYCz?=
 =?us-ascii?Q?IUaDCtAmUZBe1rbwwxGTXk73qZTibWH/2vPQlce3XR1dXODHiGNfuHXt2QRQ?=
 =?us-ascii?Q?uCY7BPQsCn2X/0rvBgDpqaGN2OX+OuIlUQCTKjSqAnxOZac0e6yUP5//r8+4?=
 =?us-ascii?Q?S9LNgywqGD8uzxKKeIOVfk/tgVo+rAM+vQ5W5EB5bgidkUchFOusIiz0tyFh?=
 =?us-ascii?Q?UIo8EPorPg/1Ju2KateFkc8roSIzU8qTXuXT45XZJN8gAARseUF+Nf5BuSe/?=
 =?us-ascii?Q?OuGUAvfKC87wb824TB+qmGKi9OgkyGmfcyPu3AYg2KfXYbZi/HUP5a+vhV+j?=
 =?us-ascii?Q?DNIBplF7DfPmoj05Czsg90UB/7LwjMjBWUq+G1no0T9GSIqcwG5BSHbzS02P?=
 =?us-ascii?Q?DuEAewHiMYbcq++lDQJ5tDrYxBOSQXSBN77LBs7/YEnHi/mNWdFIXO1wgNuI?=
 =?us-ascii?Q?Ngu315x+7Fs1Mq6qtLQwKMc5j2dKkhvPeu1Ru+ga6cj/0Uav8EtaA/WRSefH?=
 =?us-ascii?Q?WxLE44K+VCSdbal/UAfUpxjhOpKxdvDBw31Zzk+szdlkFTd6GXhbg6EL/fil?=
 =?us-ascii?Q?2QbNHyP7t0A47tjC9i0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:23:18.4137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3ceb9d-9172-4ebd-d88d-08de52186c65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230

Confidential computing guests require memory to be accepted before use.
The unaccepted memory bitmap maintained by firmware does not track
hotplugged memory ranges.

Call arch_accept_memory() during the hot-add path to explicitly validate
and transition the newly added memory to a private state, making it
usable by the guest.

Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
---
 mm/memory_hotplug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index a63ec679d861..8cfbf0541430 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -38,6 +38,7 @@
 #include <linux/node.h>
 
 #include <asm/tlbflush.h>
+#include <asm/unaccepted_memory.h>
 
 #include "internal.h"
 #include "shuffle.h"
@@ -1567,6 +1568,9 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	if (!strcmp(res->name, "System RAM"))
 		firmware_map_add_hotplug(start, start + size, "System RAM");
 
+	if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
+		arch_accept_memory(start, start + size);
+
 	/* device_online() will take the lock when calling online_pages() */
 	mem_hotplug_done();
 
-- 
2.52.0

