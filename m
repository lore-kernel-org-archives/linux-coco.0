Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF11D5ABA
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141002; cv=fail; b=hcptzEZ592q3fKZX6KTXv7zaJgZ1H2vjzLi0MIGcTal6MSt7dK4L2l+8QGXYzYhtI1NbhmgNJ8P7WEAB4vEk6A1yiNx64Me6NHPKRhOyNoCjZmfNZex0X76sitxOzELT7fx/3qL/nMXS68jJuljWkaVj1ufZWxoggjaq7ri4yqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141002; c=relaxed/simple;
	bh=dfp4HNcShDsupHWLRp1GnhYjgv4nVfatNlkItCRss3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DGjATZQ/Q3R4t2Zt1M1WLu5J4cRQyGSwr7F5X4dxaTGgcEQQWwrOcC9qP09XpZ+N9TADwRg/xsWUS8qMv94fN+aqudMt+EOyNS/8KAbQpyql/8kecwXfV068kbf25fwD8PLFrVZQJnFwl2qM13hyZynkWV2CtDO5hdrma8n2QUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZW0+WarZ; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZW0+WarZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmUQYPN3cdAVeSsKCSf9ZN+xttlbM/n0zcl3CkNPTXf5S9flNwROVYBeBTDWZXQWw33j1BsxcG+2TCdOgnpDRQSbqAQq1n0UW51tdjEFndnNMfNVMsGeIbLxON3xPG3h4S6Hljk9u8NdwUWu92MwSjVY098R+ggikDNBtghAmfnU+Ng0Z61SZGcioXi7K2inTRt155JXab2urT/4r4Qgk5Cdu2eRGWMlYaRQAn8gtGcHPxoLkF79sn770b/QThHCRnz/cNND5EDi0YzTTYYqL8P/XpoeLkSNmrLgHLbuKdw9tGAeYcF9E73MRQeYOIt24j5Gz/4Jj0vflP7mZjkhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NymC7Mj9AobvqmWhKZcegXFJMRLFRzlgPumSsWOszY=;
 b=UOYQSn3DSGm/HK37+i31fQ2nNZpu7S9jv6l6gSvD6HtjIDoCMSoHiIFxRgN961pCzPFTi/MSCcUEm1uJerwLe9scWXN6DsJWc5qq3ySAyuT3RGCCNK05bj4MrR1n+5yUvu9gwOut/l5uhQ6/7wbK0FbeaS4yZXtAqkVT9NycBst+czaS7vlXHnio8QHKvPo2VPLaSVWjHOBfGV5rBDaF/4e+69B8WjEv1fTZxlkR62dZiNEFYm4RNEhQ4tBcAV3KN65l2KwVHhjDQzVchrF5ulmmj2SgWsFpND6X1RK3d1kJjv/xZibtTrC8uQrbFCMmmYSLpO22GXy7QwZng4MZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kvack.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NymC7Mj9AobvqmWhKZcegXFJMRLFRzlgPumSsWOszY=;
 b=ZW0+WarZbHFLbbGUrL7/AmDCOref1HMYHhEyrYGxVqqXxB/BqcBm1oCD3w1nLBNUsUMwj3hnoJ+wTOlSDDPVZsnmpQiUsNP4CoOSshyY2IfAUsuk0ddkT6J7gOJHxysUbufr8tm0h+sxw2UNFvHM5WSXrwomwPBF5A4zdYfKk5Y=
Received: from BN0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:408:ec::12)
 by DS4PR12MB9610.namprd12.prod.outlook.com (2603:10b6:8:277::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:49:53 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::ed) by BN0PR04CA0097.outlook.office365.com
 (2603:10b6:408:ec::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 17:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 17:49:53 +0000
Received: from ellora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 11:49:52 -0600
From: "Pratik R. Sampat" <prsampat@amd.com>
To: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <kas@kernel.org>, <ardb@kernel.org>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <osalvador@suse.de>,
	<thomas.lendacky@amd.com>, <michael.roth@amd.com>, <prsampat@amd.com>
Subject: [PATCH v4 0/2] SEV-SNP Unaccepted Memory Hotplug
Date: Tue, 3 Feb 2026 11:49:44 -0600
Message-ID: <20260203174946.1198053-1-prsampat@amd.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DS4PR12MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e566f9-510c-4b15-0465-08de634ca302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4VsYW15ZgLeBR4aDh7Q4BdI7MQ+PhhMPfC9I0lgUH6ESkYcbCexpH4aFDIg?=
 =?us-ascii?Q?AlUH5pjRN0tCYNK6Yy/UfSvrQdgZNzZBG8U32qB6Hu/MhtJvXshtAZhsCWqY?=
 =?us-ascii?Q?MsvPfG+70RYR8IPyxN56lVI+GWfOAaiuZi1yTC2ZQBvP+rUCLQJZbApEHT4C?=
 =?us-ascii?Q?Ibg0O15YGgSQCxhQM5qDs1LI/QFkrPVbW3hLNa8rg/lyPQalLH1nFu+OZCPd?=
 =?us-ascii?Q?Azjn83ULcvh5v7K1Hi1HuxmzTKoxe6MzCDkGqhItlKtY2WjgbFw19RGezR3Z?=
 =?us-ascii?Q?hYOenb3bauLWGU6woClfaqJFZJ/Wf4atPv2lA05W3FcpBDces6tgTjpKlQqW?=
 =?us-ascii?Q?+l+MLQtRv7PenscEc0XcPUXcjy1ir1fWxG9X3UvJOND/wPi7N2hnNcegmqJI?=
 =?us-ascii?Q?l1XxVAwsc85ARqjxDARniJxxdgQCuYuk0ml4dFjDhNEC1ngB6aFjykf6ijd1?=
 =?us-ascii?Q?O8h9iC/tLvLwlQiM8K8+ZtcwxQ6A0D9ykTUWzuSuDV9L+Q6qLSFh5y2tEsRX?=
 =?us-ascii?Q?2V5N62K5NjKxDQ/chiIKjkDtXVXspnIj8pm/+fW9UWAzBe05DQUa27BqLGGo?=
 =?us-ascii?Q?+Q+PSr661UkaELm36oVMIqnYtShY4sm2E8rMctonRXG4Et1+Co1WpDBiTdgu?=
 =?us-ascii?Q?8SdVVJK1E0q3+4T5rEtOsDXURsi1hMBKpjFE9kKS8YG77GSDRBcRcROkVpS7?=
 =?us-ascii?Q?WIZdW6oYD4j7Fz5pAz7pqOGiC8D4LhnwkM+KgTPnNfc5WSKmpWtc6S9i+3dX?=
 =?us-ascii?Q?XZ2q//h2XkAEmznmpmLAJLS/ZVvpMpCI1PTDKY6CqiFC5nvxr/z2oieG/0V3?=
 =?us-ascii?Q?nqEq1gQmqsxkVYQs0Q0itq4Js5v3cD47tSAZktFx+tme3Q38Y2KUWmAO0iAD?=
 =?us-ascii?Q?iFGW1dPjmAYSJnaa4sCWQCOIyHNSsb/f6ALNxe+FyZYNoOcDM8e7H13DA8kI?=
 =?us-ascii?Q?TcpSA6jeMEHdz3dtoMDy87Uv1KDcZaZPBZpNbnAyB+4Zwa0h23fFyGQn9vJR?=
 =?us-ascii?Q?MwfP02m3Y9vW3iL+q9RcPB6g6ZMAkzP+zAoCp3OOT4BQPkEs6dLs7VSJSIen?=
 =?us-ascii?Q?fx+DBXxKfe26HsKsLJNkRNIlXiBqNWwqiBtF/vwkgz/qGMhJ3HsP6bKjO/mc?=
 =?us-ascii?Q?hdxU/nxP20Vs1pL+rbqYPGfRT+hsOuz5s1IJyEhpb6t7MrRfytrn+NEmymM4?=
 =?us-ascii?Q?gLPfQ4h5MtXA1r9OAtTsHQw1/m5tqog2mfUtaEpj4OTWJTfgFS2gt4PFkSTk?=
 =?us-ascii?Q?hTYi/9Kcgt89tHsgkWjxNas4j4/J8QfAJeZ1HUW8mPWwzXWZwAUX+6jvu1LC?=
 =?us-ascii?Q?STlyX2RqMLOnn3TageP7DJ+OXkrnDBHDouD3UYWmp1v6MKLTeGJ2UeXLmMsA?=
 =?us-ascii?Q?Td4IdM+RoetVR4Mjylowal8Y6rEimtWvlFfGppcOEQuW0bmEcI2IDXeZz1un?=
 =?us-ascii?Q?rUD4urP7xZha//O7p5EX7funJH0QZXhdIbRYA+j/+9O8/YuLLSUEEkGRjNZc?=
 =?us-ascii?Q?Cu0faZHAaPYl7ZSDHeA9qILrXKz/txDAfRFMG1c/42A+na3mfLQOConT8ip5?=
 =?us-ascii?Q?TqtO/Ib7E1XP/a7/gaNn8mo0pFMdcyIs3YFvNFZ2BGouTp8BCj789HqaFWNy?=
 =?us-ascii?Q?7yndruP+n4AZo0BUnWZ8x8HO/m341Y/4P6fggDet/8rPtF/NUZF6Ctyk5dFa?=
 =?us-ascii?Q?Ss0AvHaUlP3m3cR28nk3Hv5l1dk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q8jIHeXisRi1Y2GXUwm8exsdDNKPHdKBeBg8snfoZL03U5WPrjcVZoObzrpgYIDTOGOGFAiIyo9Q+6z/orWhVjvgQ01d2ojs5rkZF9K04/7DHDBnBrhruIjFZe1+uomtq7gb+2+VgJ6eypjr9nF+jDzvM5qOb9FhkT0WjfhSYakHZPhHL2uZMxennFIZR5l6Q3P0JpJKyQo/S9Jbma8tTR+0sFJQbUVTZgqmYMQ57T+UUEWz8GPEAhIplOuBCt+SKaZSHyvvq3KFU9L5bD75iTPB97bjJCE1R5dGswWPO17SKtx5DSv9lZmfNRG21f/u/agYDshyS/Z901bkgCwy3wKzThDlffyMC44sv0ZuQ6np+b0sBRky14ceJjOQ7N4XpN4nnULcRS2W1tJFiv2aFhgSF8U1DLjd+8lutrED8ChUUEj8AfL3Wo+tJpY4V/Ox
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:49:53.6251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e566f9-510c-4b15-0465-08de634ca302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9610

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

Step3: memory can be hot-removed via the qemu monitor using:
(qemu) device_remove dimm1
(qemu) object_remove mem1

Tip: Enable the kvm_convert_memory event in QEMU to observe memory
conversions between private and shared during hotplug/remove.

The series is based on
        git.kernel.org/pub/scm/virt/kvm/kvm.git next

Comments and feedback appreciated!

Changelog Patch v3..v4:
-----------------------
https://lore.kernel.org/all/20260128204105.508855-1-prsampat@amd.com/
1. Unconditionally accept all hotplug pages and set bitmap for the ones
   that are in the bit range (Kiryl)
2. Fix implementation similarly for unacceptance and merge
   unaccept_memory() implementation within unaccept_hotplug_memory()
3. Use max()/min() when clamping memory ranges to operate in the
   bitmap (Andrew)
4. Fall through arch_unaccept_memory() for TDX platforms (Kiryl).
   However, retain the panic() similar to arch_accept_memory() since
   it is a can't-happen scenario for other archs.

Changelog Patch v2..v3:
-----------------------
https://lore.kernel.org/all/20260112202300.43546-1-prsampat@amd.com/
1. Account for cold-plugged memory at boot and introduce proper handling
   of the unaccepted bitmap during both hotplug and remove. (Kiryl)
2. #include<asm/unaccepted_memory.h> within memory_hotplug caused build
   failures on non-x86 archs (Andrew). Instead of introducing
   #if-deffery to have arch agnostic fall throughs, create hotplug
   specific helper functions since we now also need to take care of
   managing the bitmaps due to 1. as well.

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
  x86/sev: Add support to unaccept memory after hot-remove

 arch/x86/coco/sev/core.c                 |  13 +++
 arch/x86/include/asm/sev.h               |   2 +
 arch/x86/include/asm/unaccepted_memory.h |  15 ++++
 drivers/firmware/efi/unaccepted_memory.c | 106 +++++++++++++++++++++++
 include/linux/mm.h                       |   9 ++
 mm/memory_hotplug.c                      |   4 +
 6 files changed, 149 insertions(+)

-- 
2.52.0

