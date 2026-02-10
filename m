Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536522FD1DA
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 22:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763274; cv=fail; b=p6DZnlGv6avedfPPo0WI/awyIuBR4ndLFIqW9LegDqDPrnDRKCrgF2HLR8KiH7wJimZTsji+3p3XFwetR2zmF1E/q6lmNwEqfy/xGnzEeOzVuELBLVINM3EpA51KxjS0woogox9K9LKwE09Cz+Mm3l5P4wUxeUrimqNEa8FbhTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763274; c=relaxed/simple;
	bh=awgPmPysboHb6M/ZwSSgjDG98ITf9PIaAb4j3ruoeUI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Anh2bhoG9JNtsVpczh/YD/OMbaGU+TT+PtXniMcMH4qecrYrOcKT2Fc+Rw+ROpyHw/RC4+6UA0GgAesP4Si5DNQzMgJkvcp2FmDvrjO4S7AtLNIQHBuqMuoVtfquzCm02vEw/i8y8xBFFPr8MHQOO5ykMdjOJKioSaO+xfW0jh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fZzpquG9; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fZzpquG9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvP0WFgEA/3MVPcDhw+LKIn8WLoKdWXJ9rM/Z57uQDSKt7tjmKQ3oP0bgtIubYWJPNXum0YIIvTPPavFzPyvIBIvRyy0o3M/24CByrGdRJEXMvI17sbuRWd9P7Ydy+T0NvcxmfIFCeu4nrfgbZBXbz9/B2z8/yQ6sMV2FnkJtMyL/gnnB6EArBob4AGVu4yH7xaieJWx+HCIKvulbYl5LKoZN8p2CNASC5YDMaMMpuyYi3f1Z0zDDNwdiUl3DHmQy8Yly35/DMMnFUpHD9/KL2F7JXaYnZidbh+S3OLc/ENXgfa8CrRTNsgZA9wOU0//24bueK9iadGtzetFsv6DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ7nLsJ3i3izfFMjIjfxDzFfoGYK/tjTK++4ioaU9z0=;
 b=orJftZv6Ia4Wetg/T2KpGvf7sXoETEw2tith6cZJ5aBqXdY4vgrwzqutFwNLSL1+2k7S3GElx9OHyoQfq+4oCZ9KypeQi9pAz+b2E+eub6t1vG+9bhEtYZ70f6OgQ351kiUgwsXtqLgT/G5gFWn/mcE52ZCf/HQSmu0l/2Dv2akh5ZpnkX5XEvfD+1HdltSFWYJSCxADzkpXlC0JgI92ed/zdqhyKBJY9WyyVRk4LSMNhE8C6JbWDuFa5/8keBudOduR7iNBzOQiolbfJeEqZZePInGpB30BKf6ezq9zqmgvWiGlGzWsAYyLgc7N6bRmRSib0DTO5zBQxOSnVeBGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ7nLsJ3i3izfFMjIjfxDzFfoGYK/tjTK++4ioaU9z0=;
 b=fZzpquG9cmw/8OcdeeAAZAWXvFzkKMdqpfiiERtcS1ki4bTlD9vd0gyKqK5P5C8rZgKueLU6wEgMCOSnrTHqQj7ouVZp36FzSnJ4vxYEPlvwr/AmWJYB3Nrzs5O8gKsTsMTyLXgXhV+BO+PpkXDg4IbXwiQX4g6Kbojy5ds1/U1vSJSN2mKEWKBPyJ5pCUHAD3azjmHx41V02wQFHmPTXtdD+c4ol5bsCOWBFGuGDcUWWe6t/P141YX7rMQpjqq/ocQEYMr92RtgQtpVpGD0TudsCNYselz8eDjq2qjoToqCtuSUblrY0fLT6I29Vro6ibQS/xbt5O9/F+Fs6NYaww==
Received: from SJ0PR05CA0081.namprd05.prod.outlook.com (2603:10b6:a03:332::26)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 22:41:06 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::a6) by SJ0PR05CA0081.outlook.office365.com
 (2603:10b6:a03:332::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 22:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 22:41:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 14:40:50 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 10 Feb 2026 14:40:50 -0800
Received: from build-vvidwans-noble-20260107.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 10 Feb 2026 14:40:50 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>,
	<trilokkumar.soni@oss.qualcomm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [PATCH 0/2] Arm LFA: timeout and ACPI platform driver support
Date: Tue, 10 Feb 2026 22:40:21 +0000
Message-ID: <20260210224023.2341728-1-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: c31aa214-7aa8-44d1-dae7-08de68f57a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|30052699003|1800799024|36860700013|376014|7416014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2RDVU8yd1BtVEJGbC9ZZXpQK2ZsUUFWT0RNVk5rRE5LVXJmVE5KM1l3bVNL?=
 =?utf-8?B?VFVyMytHNGNOSzhQNHcwa01DSC9Wbm8rdWlhM3RkMWtZM0dUTmwwN25WK2Iz?=
 =?utf-8?B?U3ZKWC94bkRiTStML2p5K3lWMHI2bmZhNVFPdHlUTmdkTGtVYThyNFN3UGFJ?=
 =?utf-8?B?M0RuSzIzTm9SdWpXWXFYeER3VXQ3SW5tdmJnd0VkUHppRkdKQVliNFhGSEJy?=
 =?utf-8?B?bzJ5NHhkNmpJcDFUeUZTSnBEdmo4bHgrZUEyQXZRZTBxNkowcWgxQkdyOUJk?=
 =?utf-8?B?NjgxNU5XWFZYU0o0REpRQWtGQnYvVzg3MHBLRVQxbnFKTG0yYzVHUGpCNHlr?=
 =?utf-8?B?YmYvM2Zud2lud2NxWXhiUzBTdWtBQnlLcTlNV25pei82TFV6cmdLSHhlOGMy?=
 =?utf-8?B?OWgzUU01dldoamlZNEhQbDBTV0liaTNpc2RNZis4aFVzbUw2MVloem1tZ092?=
 =?utf-8?B?aUNjVFpoQUV5QnVyT2tqM01iTlhPbHoybDA0bW03ejV2TEUwR1ZHSktPU0No?=
 =?utf-8?B?QkFyQ1V4UzhtblRDNmpsTWxrRm9hbFFwN2RzZXlXcndjbXBsOTBQeTdnL01T?=
 =?utf-8?B?c3lwd091Y0xBZC80VEpCZ01mc0dlSUduaUNmZ1hIaG8xK24va1diS1RzV0NO?=
 =?utf-8?B?U1YrQUJTdGpqbTkxTjJtSXpTaGRVVHNlWG9NYi9oOWs3dTFaRTE1MlU4K2ZG?=
 =?utf-8?B?Q3BmMmhaQmhlOVRUM1c0c2xnbkN2S0JVdE1LWWY2aFR0elpjT2FZZmVVbStl?=
 =?utf-8?B?MFB0MFdERnRkZHdlc1MzN0lBWGJYOHhqYm1DaVJFTGE1M0ZESDhUUmk4Rmdm?=
 =?utf-8?B?V1kxZDArZFcwTzV2bTZTbHZRRzhoOHpyMHdCWXR1a0JwL1I4YjJOU3ZhUW1R?=
 =?utf-8?B?WVQzN1BYTy96UUpXb3VTMlVtaGZZdHpvY3c0WGsxbU83NEZTUm9XeC84amhr?=
 =?utf-8?B?aTcwRnFiZmxYU1duTTFlL0RPQ0F1TWt4a2pTTDcyVDVpclB5T2hLQk5IK2la?=
 =?utf-8?B?R09SUjhZaUxXa1N5SmFpYWJsTXBLenZONVl3UTljekJ6VEIxbWo4RnBGbW1L?=
 =?utf-8?B?ZVpnaUFjTjJNZ21mbWVrV1BjeHpoTzc1SDZlNzNTMFRJM0xpZEJVWjRWZERL?=
 =?utf-8?B?WEg5cUdGTHdwZE5WOHpnZVhiSDlWdkRQVncyWlZTSDNxKzZTRHpPYlN1MUNj?=
 =?utf-8?B?akMxbFB2bE44d0xjQW9Yb0QvYksvVzNEWWZyUmZsMUdnSGV3Zy9vWjZncUtJ?=
 =?utf-8?B?bktSVHViQ0JaekNHZ1hCdG5taVNRNkdyU3dCbW9VN1VUS3BxSVdPNThuU3Zw?=
 =?utf-8?B?YmNVTmpURk15TFVWbUNqK1pVb29IbE91dGp5WWVHSHF4amVoNFo0TUh6ZmNx?=
 =?utf-8?B?UWRCMGN3Zm9oRDJFaTlmN2NqcE1JY2pLOUtNbUxBY1Nzek9uUjYzTEprYUFY?=
 =?utf-8?B?dnV3WlBoU2tIRGRSa012TnVTYlFVRTFSeGQzVE5TcE5MODdyQ2gyQ3lSSVdM?=
 =?utf-8?B?U1QyeWEwZTljMGVGbjljQnhaWFdBSTM4UFAvbk1MRit5L3ZLVmpreVRmSGxD?=
 =?utf-8?B?SWdLNG5rU1g5Wks5d05TZ3BWb0tqNk5QS0FvL3RoWXhDVkRQNFhJeWgwVG10?=
 =?utf-8?B?VlNQNHVDdTR0ZlVJVFVyK3d2VTl2ZW4vSHBvaU9IRjQ4aXpEOWZmdFd6RDlx?=
 =?utf-8?B?eXk5aytzWUU4QllDdDA5amNqcDQ1d1YwZDZVVGtUQXdwYUtYYys3Q2RNVHdV?=
 =?utf-8?B?eXpXUXQxQUxiZUEzSzVoY2Q1dmJzeER5bGhweHNpSzE3K1Z3ZTkvejR6cFVr?=
 =?utf-8?B?b01uelpGVUgrbkJZZUFVK01OWXAzeGo0MkcyM0Zuak03Yi9jK3c3V3lmdFJs?=
 =?utf-8?B?QzVxblp1UEEvRjNIMWtQWG1kWUZBYjVQRXVhcXp3N05SdnAvZUUzMnF0cUNC?=
 =?utf-8?B?Ujc3YkxhaXAxTHVEakMwc1JuTG1vRVdqRHV0NFhBQmd0bExkNTl0MTRLTzVR?=
 =?utf-8?B?MHFML0hEQkxuTWFIaUtFRU9MUGlzdFR1YW8wZENCZHVNZnY3S0JXWU9jOEhh?=
 =?utf-8?B?NXphVHF5S3JWamd2M2g2cURtMTFUcEZYU1N3dFdGd1hWYTlTUmlZREJDMGo2?=
 =?utf-8?B?UEtRUlR0ODZ0Z3Uya0NSWVFMNGFaYUFRWEdlaFZTVGwzWEhCZnhnU0d2ZXRF?=
 =?utf-8?B?cmxCclJsOXlDUldCTWhCRkdqRW52T2RaaUZKenlOdlhCaHk5UkhsNlFJTndj?=
 =?utf-8?B?TDg3ZFYzRHQxT01hZjhRMGk2RnFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(1800799024)(36860700013)(376014)(7416014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RKvw3jod9JWxjmnoHO9FA3BSX4Hiw8ZvHEnqhlVYsX+Qr9CLNptiAkwsJ0NO+nnW51m+kFuB6QRzwqHBOGxnvR1T1k5uih1AvqtbZekrr6d9Gmc1EZtVeeVonPg/ApQK316FV0fgEen0d6kqBAsNA0TQ8kOOQ+jGdaZ1/gvfcV5w/Aom0pOxRHhxJYePwyONFBhvXBBmAvzN5EBmzNXmCJ+lT8ArXXzVeN1WndQmzqkJca4QWVqayE1pjhZAO68TCYtLr5Z6Zt6XSty0LlWEF5KuG6la8IUgqdo+ulUIorhxqHpWMCQwCguXCvGEjfs3xkhxf6K+30rSTobA/0sfbGLn8EyLbvdNRyeVRTkYOzekpruAl3wrDUsA1M/Vz6hiUeq9wCFLmAAc9RheOxwjuEO/Uh7e3PMRADJhuQo7cgj8RO1yh/dt0TYbPIAUnXY5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:41:06.1368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c31aa214-7aa8-44d1-dae7-08de68f57a50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318

Hello,

(This is an updated version of the [RFC PATCH 0/5] Arm LFA: Improvements
and interrupt support [1], which builds on top of the latest [PATCH 0/1]
Arm Live Firmware activation (LFA) support [2].)

The latest LFA specification [3] updates the interface requirements for
ACPI-based platforms to use the ACPI Notify() signal, and
device-tree-based interface is unspecified. This series focuses on
reworking the LFA driver as an ACPI-backed platform driver, using ACPI
Notify() instead of a dedicated interrupt handler. The LFA core behavior
and sysfs layout remain as implemented by the base driver.

This series contains two incremental changes:
 1. Add a timeout and watchdog touch during LFA operations, to make the
driver more robust in cases where firmware-side prime/activation phases
take longer than expected. 
 2. Register the LFA implementation as a platform driver, layering a
platform driver interface on top of the existing LFA core logic so the
functionality can be instantiated via a platform device. 

Note:
This posting focuses on architectural and implementation improvements
for the LFA driver itself. It assumes that the bugs and issues raised
during review of the original "[PATCH 0/1] Arm Live Firmware activation
(LFA) support” [2] will be addressed directly by the author in that base
series. Once those fixes are in place, this series is intended to layer
on top cleanly.

Testing:
The final integrated driver (base LFA + these additions) has been tested
on Nvidia server platform with Linux kernel v6.16. The sysfs interface
was not exercised as part of this testing. 

Regards,
Veda

[1] https://lore.kernel.org/linux-arm-kernel/20251208221319.1524888-1-vvidwans@nvidia.com/
[2] https://lore.kernel.org/linux-arm-kernel/20260119122729.287522-2-salman.nabi@arm.com/
[3] https://developer.arm.com/documentation/den0147/latest/

Vedashree Vidwans (2):
  firmware: smccc: add timeout, touch wdt
  firmware: smccc: register as platform driver

 drivers/firmware/smccc/lfa_fw.c | 193 ++++++++++++++++++++++++++++----
 1 file changed, 174 insertions(+), 19 deletions(-)

-- 
2.43.0

