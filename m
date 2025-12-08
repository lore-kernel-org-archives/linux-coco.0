Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423462E92D4
	for <linux-coco@lists.linux.dev>; Mon,  8 Dec 2025 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232063; cv=fail; b=cdQ71rKMm4Lq1yaJsbLFTXs3BznNFmBZcS3wfdgdLwKU8hrltUwjyG+oeHpNkfVHGWQcZglTNJfvQYUiHVXNS2Wts6GYvVk/nx1mqQtpFc8w2JQo9cKgf1x5hkb5Q/AFbk2EeSGdtzul3sOvyefKqBCAuNufuUjv+EUrAR4ZiuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232063; c=relaxed/simple;
	bh=kXuVW4dhMWTiie3gLxTLdiXR7/u5x9HcMQd3wLYVSSk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hgN+VitkJT40KPPClKvaAj7du8v9PZth+l1wCXf7yzY1vCze20PRCJ4MHN+zu509JUUn8GxakzwZo2lIGV+QnW/caCrqd6bnOtm9uSOWr/Z2LNj6dub0X/OnODPnHabeOjEYLI6UNhGmP4aRffmpauudvy5C9Y5NDP/4NCNIRPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xqh5r7Sx; arc=fail smtp.client-ip=52.101.48.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xqh5r7Sx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GufCh8ST0y9P2oOZIIEL9+1jOcH4YKfqxmYgCDkLBawzmVpcJs3KHuAM9E/9my7E3u4dzEim/LKE8xibznpkpqqj+o+4DmNMDmur2eWoykDTvjES1kuZvf218QTtfyBO5Cjqg2mIHBmZVPz/n3FfQNsr9KUvKRCXOWXEOfq04Hn28IJMy03TL6fAB7xNZI2oNhoKJzDORU4UZJidJFISGqVwE2pknJtDSdziasTYtx04SL3mN0oou6oULt+5ZMbCYfMjBbHDugQ1OpbeDCUgCCCI7dHNp9MI/NIvVnqOA4KkCRXnATWbbJwSB/NU56yQGiFLAodcya1WjH7XZhGnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RFnVGhCixeVlHAmz77YUmNqBa0VJymzc4bJVr1SK7E=;
 b=F9qB4fXG4NmAoRdM/QCGIS8nrDoUsqkCG4nq8zC+ewmiY8RSMXh0L3deHIFs4kY0pNQiPc/jExP+yMJwe0bmO0SlWGeIZIKWNIdmvjupY9SSYVgNn5C45srgVvjoPmw0qV6xNdfqxjMMoS0t6IX6y2tMfIqQW/C0hSvRQO9AvIRAgGY4v4zesRNwGADuIUptXbqx0Zwr/EDyjTRY+/d7W7vHvn6VOIiAuA4ZvUOyABT7N2lWWJO0jVm1WKYLHaG+F7e4zLgzRyui9Lftomi2ZWMDlNjkLS2NU5hNFkCkKiukB0X22HVWpiswX8DmtsdXpi3vUF4oA0uYdFpVDMR2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RFnVGhCixeVlHAmz77YUmNqBa0VJymzc4bJVr1SK7E=;
 b=Xqh5r7SxbU2uppfrvf8D1VUzb22t0sfka2bzW3dFAYDvtq9loVxGhdwmnXoSm0thmduQu9vSSKAeusvRrppQ2AhN/H2kyuI+OdLvSN46QMHPqbtkVqzF4z5FGb+HADQcGabeq+zbm2Q55Jc11xDmBy1/KOjJz4mUfyBPL6lqahOniQnVAmCKOiG1o+dGGefWTIIeXWo6kPTwiizpujCcX5CEwMmAPC2YRPHkSIXzL0EcYk6w6LonLJL+Y2tBqA8zk7ITliIhNRpC8Z/sbJD9c3JjYMpKB0lRg3nX3OOsAfpwhnffWHJ+Y78VTuOA1Z+aWE8fxE9KzvtsobA24p9Nnw==
Received: from SJ0PR05CA0210.namprd05.prod.outlook.com (2603:10b6:a03:330::35)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:12 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::34) by SJ0PR05CA0210.outlook.office365.com
 (2603:10b6:a03:330::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 22:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:00 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Dec 2025 14:14:00 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Dec 2025 14:13:59 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>
CC: <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <sdonthineni@nvidia.com>,
	<vsethi@nvidia.com>, <vwadekar@nvidia.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>
Subject: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Date: Mon, 8 Dec 2025 22:13:10 +0000
Message-ID: <20251208221319.1524888-1-vvidwans@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 893b4a65-7f37-4a8f-94ec-08de36a71da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDk2WG5yNTVPalRiNVBOblpiWlhMWmg0T3B3UGdDOHNOUWNsQThVekZSdlhH?=
 =?utf-8?B?YnRXMEtYN2dKM2FFR0t0SmhUakdISjV4KzFQU1lKMkM0QmNuZFBDcEpiTWpJ?=
 =?utf-8?B?bUF0WHY5QW15eGJmbEhxQ2Q1djF3eHVuSytQejA3Tnh4SFNHcjNaYkhtR1hC?=
 =?utf-8?B?YWYrTzREVU9wS0E1NHpqN25rb1UwaklCcUxPd0ZGUTQ4Y0NPTG1sdFFHcWxm?=
 =?utf-8?B?aXBHMmlrQXdrQWhJVXlzUkdTZjNVeC9zUGxwMVRhQjlzYmRJUTNoNUNUS0x0?=
 =?utf-8?B?dXNZaU1xQi9GRXBMSi92Yk5hb3h1VlNIcXREYkkvMDhvdDB5Y3RJYjZQeTFL?=
 =?utf-8?B?VEEvMXFkanJnRjBMK0I2cjI4TkpJVkhmVzJTN2J3Q1k3N0hqVjV3WXE2TUZy?=
 =?utf-8?B?VG96ZWhKV3ZqVmhLci9obGJxbU9qcDFlaE05Vng5amhEUDBsTnd3TkwxbktO?=
 =?utf-8?B?Ymc5eXhoTmZFenFud3Q1NDRZN3JuN3VqV0E4OE0xUk1wa28rS1EzMGRlbnlt?=
 =?utf-8?B?VUYxL085QzVXZXlOZlI1WXV6c3ExZFpqSHE4ZXJtOXlBVlVSeUpCaUdQSTJH?=
 =?utf-8?B?bzB3WDUyRkJhT2cxRVhmSnRHYWpCOVRqZE8wTzFReVlhVXpYeXZCKzVQeW5y?=
 =?utf-8?B?MTZQTEtCb3BnWTQwUXM2M0dmR1MrbGZMUXFSVzBsemh3a1hIVDlSNWRUSnZR?=
 =?utf-8?B?VTJ4UUxVcTJ6RE00WU1jWDdzSE9xWG5xZmRZMThlekFyRzVUbmo3Smc3ZmF4?=
 =?utf-8?B?V2pjUWpQWjhOdE9Kd3JBNUsyM0c3WGVpd1V0UUU2NXJuK0F0a1o4Y0xjd0tR?=
 =?utf-8?B?NWY1YWYySXdmZytvaTB3TmxVTE15Uy9RSm52YzRiTUFTU3krbW1Pd045UWl5?=
 =?utf-8?B?ZnVSc1R2alhjcEU5dkE2SDUxTnJybmt0WitnSzNOODgvYko4Ky9pTjltc251?=
 =?utf-8?B?Z1Jqd20weWlPbUVFKzdkd0YyTGxpRHhJUkk1dmdVQ2ZTOXczdWZKb0NlTmRs?=
 =?utf-8?B?M3BpS3hlTys4cU9wZ0xZVmVUVmpxZUNVNmNMNi9qN1lBbXQ0c21XVXRDbCt4?=
 =?utf-8?B?cDlXQythTDNCM0lDMTdPUUliUU5iQWdDd2JGTktOSGlEYXN0a1VMR1VFbHRh?=
 =?utf-8?B?Y211N0IxL0Y1bjRXdEpRc1I1Ni9sQi9rK20xektFRnA5ZEpSbVBmemdjcTMx?=
 =?utf-8?B?MnJmRHUzOE9EekkrQWRJcEE0MmtUZ2tpZmJEUHVGaVMrdG9qYzlpVUQxaGF3?=
 =?utf-8?B?VHVLS1UzMHBlVm5zaGg1SVR5V09RdmN4MzVMd3l5NnpyTVRMN0tJcXZZZjdC?=
 =?utf-8?B?bVNLV2VQeUZSSUZ0bUhSYjhqdis5dC9RRHk0ajhDd3EwaW0zWU51akNFa01t?=
 =?utf-8?B?WWdSemFzRy9vekxxYnZzQ0lneERZR2ZqK0RGRHJlSTVCekkrT3hPZEFIdzZR?=
 =?utf-8?B?TUZCV21TRGVkVndEVkRBd3g1WFcyVUpUVllvYzUwUitZNC9lbDB2RFpRRlZw?=
 =?utf-8?B?eXB6NS9QY1gwa0JFWENYM1MvcnhZbTZtclc2VlRvdFgwTWxPNWM3Z0hyRDFZ?=
 =?utf-8?B?Y1FrVjNEenY0dnFHMWt3clVZRDJjUkRzN2E2Z2h3Vm9JbWlsRzBTblJzZFZy?=
 =?utf-8?B?TmhYb3A2YTRuT1BBQTZ2N3hqSFBjUHo1V3d1RXg3L0FtWVF0d3FEbTl6MVVO?=
 =?utf-8?B?NlpzaUxGU0ppT0FWQ0ZCaU01TkhZaC9NU0swa1BBR2FhbWhIdGRwNnRlZDQ1?=
 =?utf-8?B?V3NIZzJWbmdEOTZuclhBbW1HMzNWUGc1YkZUMVFRSUFGalFaNWhkNUJFWUVZ?=
 =?utf-8?B?OW9KVDh3bksyWjJ5QXVMcm54MVVlOWxRcHdrOWMyT0M2V013bkpWR1RPSFBm?=
 =?utf-8?B?YjUwVVkydjV1QVlXQ1k4RlNJY0hXeGZPQU9YU2FtRytwb3R6TDBiV01tWFpa?=
 =?utf-8?B?OWVnVVJzVldYRDRLWGhUZnNmZEdJc2FWWXdma3huRTZVTHg4OW80S1p4NEV0?=
 =?utf-8?B?OE1EYWFNRWtGQmFZbG5iYThhTXJvR3U4VkFtVnoyRm10bXdYM3VybXZQWDl0?=
 =?utf-8?B?a0ZEdVQ4Zm45dmhXbzh3clFITWliMGFheVRmOXdNV3lnZkU0a1phL1l2bUYr?=
 =?utf-8?Q?5OrU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:11.7121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893b4a65-7f37-4a8f-94ec-08de36a71da5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

Hello,

The patches update the proposed Arm Live Firmware Activation (LFA)
kernel driver [1] to incorporate review feedback [2] and refine the
activation flow while remaining aligned with the LFA specification
DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
the existing functionality but restructures and extends it to improve
robustness, reviewability, and future extensibility.​

The SMCCC usage in the driver is updated to consistently use the
SMCCC 1.2 register-based calling convention, consolidating arguments
and results into a single struct to reduce stack usage and simplify
the SMC interface. The patches also split the original changes into
focused pieces and document the device node bindings in the commit
messages, making it easier to follow and validate the implementation
against the specification.​

The kernel driver is registered as a platform driver in accordence to
the LFA device defined by the specification [3]. The driver now extends
interface for interrupt-based enablement of LFA. During LFA, the
interrupt
thread refreshes firmware component details after each activation step
and iterates over all activable components until no further activation
is pending, matching the spec’s allowance for component detail changes
after activation. This ensures that sysfs exposure of LFA components
remains consistent with the authoritative information provided by the
secure firmware.​

The handling of CPU rendezvous is adjusted so that the kernel now
honors the rendezvous policy chosen by the firmware, instead of
unconditionally forcing a rendezvous. This reflects experience with
existing firmware deployments where mandatory rendezvous is not
required, while still allowing the firmware to request it when
needed.​

Thank you,
Veda

[1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
[2] https://lkml.org/lkml/2025/10/8/980
[3] https://developer.arm.com/documentation/den0147/latest/

Vedashree Vidwans (5):
  firmware: smccc: LFA: use smcc 1.2
  firmware: smccc: LFA: refactor
  firmware: smccc: add timeout, touch wdt
  firmware: smccc: register as platform driver
  firmware: smccc: lfa: refresh fw details

 drivers/firmware/smccc/Kconfig  |   3 +-
 drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------
 2 files changed, 380 insertions(+), 101 deletions(-)

-- 
2.43.0

