Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44831326C
	for <linux-coco@lists.linux.dev>; Mon, 12 Jan 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249399; cv=fail; b=swwf17+nfSJtNwZuKZQbhhCXNbVSrJJoG0RJNRVV4XXMF+Z9UBze2LbQdqomStsaex5i+BaJRyag2/drwKagQOfFzBZ2SzcJhPkTGvTg1r7r9YCwcAirTwwTuk+oZNxFo6Rd6PtfdqPWkWYyOzQVv6lsbdA7IRzlS2V/VEu2Efs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249399; c=relaxed/simple;
	bh=UAqKajQwBQvDVEVw0ObG6sh3ee1fiaVk0Pcwvi93q80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SlpdsvwNs461MZHWDFPb6au/bg1vnyMrj7Db1TUVFZF5rs7rO9rE6QGLamOTppl80BumrRsMc+xjv210rsXH7iA48jxCSDDMwkaL8JzmHbZ7VQ1aPrp94NhSfDXEh3dFfp8fKph08CX+oEhQnon9Vm+0TS5XMOkUkdunTOkcaVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5g7ekIOV; arc=fail smtp.client-ip=52.101.52.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5g7ekIOV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv1mlr1Ee3ZC/bwfzO+yr668xECk2Qkr3aUf7crsjabQHPBW0bogVgopsXuyF6jta6loPNOAAlIhlBwAcG00JvE8iese6pcPnr/uumfl+LeePCds5eDECYHwsCJMdQtm1eb5BOU47kvYX6qIViqPultPr1fjVIxAbXMyrAWjMM/drF3qiLEcFgyBszXcyp/Kx6DZDSA0zEmChf74nWybWNWuZV2nueocbB0IO9qqkUVIvL05h96kmBGhmvhlQeLHy5o3xNYtAkZZw+LOA4blG2ipYSBfOOu+Ficft2PWh+63MSYq05Lo+G2D3n5YwTLLsJrkyepzOE6RLhuvHSikxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYfy5ZmJ4WlnpF2x1FQZQAqPjUQ5GDf1S4UlccU6HLQ=;
 b=CXDnC0QevZTFVp6JOv3tEU7KlbhFP4CGZTC8zuJ3vJPQxtP9Gy5w82HMGrBV3fBh/bHspPxEodle+0DwIOKVOy1zsTonWF2lcV6qs7S6pm7uD/UmLyWxwGalMGGgs/09eaRMm7oY2fIn5/QV6Lgs0q4YSaZXGa0bFqF+QYEscyX+7g89JRGrSig9kmynK0+097a9qrf6VBIws8x8ndwmI/tT/BRax0fGp94FKYpOo4Z7Gvdd96ZALWlKtrZTsHgYr0Gic6xanSP2aCV4J5GYl5LIsCcAUbBDecEGc5yQmCoBrEznwtDVx08u15772qKgxsQgTdVCuyuFUZf/KxHrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kvack.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYfy5ZmJ4WlnpF2x1FQZQAqPjUQ5GDf1S4UlccU6HLQ=;
 b=5g7ekIOVk+9OMXM8xnI7lDSR6DtRbq4yopNJCqeWr/Fse5kgJySYtOtn+GeWclI8BP8WbnZRnZRRaSG3iK+EAmH51pmS5YaqbIu2P8baVP/de19q/1yIQTXuLBGYdCi615zTUifiv2xb1GvecPCcUxNBfW4PqBOJk43hws3Yabc=
Received: from MN2PR06CA0017.namprd06.prod.outlook.com (2603:10b6:208:23d::22)
 by CY8PR12MB7267.namprd12.prod.outlook.com (2603:10b6:930:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:23:08 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::80) by MN2PR06CA0017.outlook.office365.com
 (2603:10b6:208:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 20:22:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 20:23:07 +0000
Received: from ellora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 14:23:06 -0600
From: "Pratik R. Sampat" <prsampat@amd.com>
To: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <kas@kernel.org>, <ardb@kernel.org>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <osalvador@suse.de>,
	<thomas.lendacky@amd.com>, <michael.roth@amd.com>, <prsampat@amd.com>
Subject: [PATCH v2 0/2] SEV-SNP Unaccepted Memory Hotplug
Date: Mon, 12 Jan 2026 14:22:58 -0600
Message-ID: <20260112202300.43546-1-prsampat@amd.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CY8PR12MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 35566be6-fefb-46a5-10b5-08de521865c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f/cZt0Rvv8Ugn3Pw8U1HiVa+nrFquq5SoswH9XZG0/Aj3iZ27T+uGA83sAyZ?=
 =?us-ascii?Q?u5HkPg02IHDEyeBgDRAD+0An20ZKUL4om1EqnX4JNUaGfDmdv4Dnc34TQz68?=
 =?us-ascii?Q?GyVw5bk+seVH7PAkQNNUT53iel4n68txc4ROJmag7DH+0wfUdaJcSrKcJLuI?=
 =?us-ascii?Q?bDLVWmLU+wpfuVefYDlf4p0yO1WmzLVkjYREVQHl/SwzhKnEidVNciSM9leX?=
 =?us-ascii?Q?QJgcBol78/k2FAsMXDFaalVMCIrp+Ln0RH6nr09f7a0NKwBiBEzJQHcbk8hg?=
 =?us-ascii?Q?nwtND7PibJgbYLf79KbNphogr9ic4OwiMfJDccC8zG2qyzTPPfh4JW1rnzyJ?=
 =?us-ascii?Q?FYAz5fL8G+id85RDuO9fydljPxFuBPy8zsXM/knhBUpILzLp0iHW449Dh2ur?=
 =?us-ascii?Q?tkCMpfGMWqCXBqlxgggiyVKOi4cxwZTw5AxjpEt+mHG5hC2EHGebHs8gWIKE?=
 =?us-ascii?Q?UoWmmOVZqYWfyor9Ju4yXhh2pyMcPbipbMFAlyXxAl5zu10MreggR0UpVbXE?=
 =?us-ascii?Q?Rlr9VnER6pQ89O08iInIzwOYbkkccdxgGh1iPRoTj5Ex8+VlSr3eJslI7c97?=
 =?us-ascii?Q?ZYewRvzcELw61NpW3i/68oNn93QhavrA17zEPey+pA6WpGPQHR2lV4T3eCRE?=
 =?us-ascii?Q?NhV0mWtHzC3RlJz1JuEDIpaNbgBsiwmj0rUWHTgMR3zNs7/wjsxVycYWLZcL?=
 =?us-ascii?Q?fbbNKNtZO8ty9an1vJ6fksH2pRBDF5UUqJlhiRdY7qx27PwH1asB7lmu0kpG?=
 =?us-ascii?Q?9BK5JvCnSo2Jj3g4K6trpP69N1jiTh6q3AuQBxUwzGZtPsbiRKNGSPwVoxeE?=
 =?us-ascii?Q?9cS0cz0gYJUj8LlEl3ezGSVrcekp0nnl03vf25UTC9m8ImWCQj4oNNlh11qW?=
 =?us-ascii?Q?6kQE1IF9hhhs+kllMOvbNz/mlZGYYphSv5sREfmMTWWoddLSE3LipI0ojJUi?=
 =?us-ascii?Q?I6AXYnUVcZVgvlAUzwe6nZka4DW3z4zqdySij2sXASul8m4IXFXP/PJBtTQy?=
 =?us-ascii?Q?Nup3tdrrxZ6MpRfY6Le9YrEOZ1TcxNYlBW44AbZyjAwdwE4J800SlQHhPq5K?=
 =?us-ascii?Q?DPC531xBrcE0fthcMnc2vZBpN8Ow0LyMVbsWq0HfTiYF1jEZ9TQs/aQGFh7J?=
 =?us-ascii?Q?ZVBSS2Y5lHj7vrFYgBcynxH+olwNpZ+RTfHLh7YrLcAlRxZaNQ9s1U9Jj9jt?=
 =?us-ascii?Q?a7E4syxj3csJ5AUfFyeQWl0bjJ+I8yz+cvM4IHqnkusHcFkCxOsRvQ2IJQK0?=
 =?us-ascii?Q?16xpA3bof9q4of6pkCVvE4R22NDq1P7dsn0ogbDCKtmVlHkFVckvc79kzypf?=
 =?us-ascii?Q?Qz15okyNC3dOd6Us7XhyzmPEkesiyQrgt/AXznKR6FLrzdbEJX+lHrmBKTRd?=
 =?us-ascii?Q?ZwnMEhbYSPM6T0esZyrQqPRES9Vinx/ndjuqVGwGzu30R6P/t1yzRTVPEple?=
 =?us-ascii?Q?8dyDgmYR6l/O+01w2t5+Kk/2XVRPHxF/x3NbQkrpS0MT20PUPzCTJgRrrd6I?=
 =?us-ascii?Q?zcVQhBs+kXXjvgSNArcronH3YJwSXZueRhnT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:23:07.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35566be6-fefb-46a5-10b5-08de521865c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7267

Guest memory hot-plug/remove via the QEMU monitor is used by virtual
machines to dynamically scale the memory capacity of a system with
virtually zero downtime to the guest. For confidential VMs, memory has
to be first accepted before it can be used. Add support to accept
memory that has been hot-added and revert back it's state for
hypervisors to be able to use the pages during hot-remove.

Usage (for SNP guests)
----------------------
Step1: Spawn a QEMU SNP guest with the additional parameter of slots and
maximum possible memory, along with the initial memory as below:
"-m X,slots=Y,maxmem=Z".

Step2: Once the guest is booted, launch the qemu monitor and hotplug
the memory as follows:
(qemu) object_add memory-backend-memfd,id=mem1,size=1G
(qemu) device_add pc-dimm,id=dimm1,memdev=mem1

Memory is accepted up-front when added to the guest.

If using auto-onlining by either:
    a) echo online > /sys/devices/system/memory/auto_online_blocks, OR
    b) enable CONFIG_MHP_DEFAULT_ONLINE_TYPE_* while compiling kernel
Memory should show up automatically.

Otherwise, memory can also be onlined by echoing 1 to the newly added
blocks in: /sys/devices/system/memory/memoryXX/online

Step3: memory can be hot-removed using the qemu monitor using:
(qemu) device_remove dimm1
(qemu) object_remove mem1

Tip: Enable the kvm_convert_memory event in QEMU to observe memory
conversions between private and shared during hotplug/remove.

The series is based on
        git.kernel.org/pub/scm/virt/kvm/kvm.git next

Comments and feedback appreciated!

Changelog RFC..Patch v2:
------------------------
https://lore.kernel.org/all/20251125175753.1428857-1-prsampat@amd.com/
Based on feedback from the RFC, reworked the series to accept memory
upfront on hotplug. This is done for two reasons:
1. Avoids modifying the unaccepted bitmap. Extending the bitmap would
   require either:
   * Dynamically allocating the bitmap, which would need changes to EFI
     struct definitions, or
   * Pre-allocating a larger bitmap to accommodate hotpluggable memory.
     This poses challenges since e820 is parsed before SRAT, which
     contains the actual memory ranges information.
2. There are currently no known use-cases that would benefit from lazy
   acceptance of hotplugged ranges which warrants this additional
   complexity.

Pratik R. Sampat (2):
  mm/memory_hotplug: Add support to accept memory during hot-add
  mm/memory_hotplug: Add support to unaccept memory after hot-remove

 arch/x86/coco/sev/core.c                 | 13 +++++++++++++
 arch/x86/include/asm/sev.h               |  2 ++
 arch/x86/include/asm/unaccepted_memory.h |  9 +++++++++
 mm/memory_hotplug.c                      |  7 +++++++
 4 files changed, 31 insertions(+)

-- 
2.52.0

