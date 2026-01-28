Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAC37417D
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632902; cv=fail; b=Q0Naypbe4typ6Cxwsf6OWQ1xpi6sNUvyQs7RtCNw0PcAP7adyUlIxgdiBjG68TKD3Xugr/bihk6jdPAoLezRPquc2c+ZZRps1NDG59XS6pLeTaACpJHZwB1b6mfMQ9QmVBP/t4aWwA3lhp07aHHJcyNBDpVcSAEYQraCLOhVjYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632902; c=relaxed/simple;
	bh=Xrr5ZSaIwP+oTx18BvQ8hR4YjW89sINqFsDOAarXqfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHcS1CPVwOB+votHt/6dlYhax1SgRHn3Xqwvp3urH8pRFR2ct9A3sbW3lbJu+Z/15OVYXxHLRLCxoKj0jG9TkTNUAo0UzkTegXCe0F6UzUN34jY1fwB5gmpA+jBeLyWr16K0xsZI2bEHwZAm5YjbejgSrqzjp94JkbDHD5NdkNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U801gyH+; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U801gyH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCJTsjs0r5E0CSA3pyAbVPHkejB85YBf+Yv4n//mW6dsFsW951jquPy41mlignmuHgPiyjukAZuJ9SWjUoTcU7S30s4+veJBgORkILMWuOMSrMALxWSNQbSnWyEJl4Mc10m91iekbdtzOxDOq95varJyere68a6ZsQjYH4glbeEYjeT94pt+A3mSklchTpmgx7zACOaQPu+wh/WcPzvNzHe4p9MdaKhL7eGVuc1xWsl4AJfhwQEzTuoMpW6dce9+SauMLXTHx1E37CnvjiOsLXGe1StkpgWmhhDKsSq/6BzNPPVfK15/BviTVeL8XZDa8nRI07t6EfiQ0dIxrcblzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2L7y0ocWsWzFc2zUS5fdlvHaX3yVCgAkV6Agr5mw0E=;
 b=qVhR1GYbYPvUK9Lil6hOPS18+duc/HA/cMbmtggTjS76+77uE5Hy6Vl/YwV42zvyKqjjNdvGWSFSAZhdMTur0x8gcqpxSyUwpUP5Gw/ZgoFrIZGXQtt97v7sObxbNvGqlHFiy7lh/fG4ubzdrXIvwDlQljVtx2lBZmvLPJfXqvO8H1LlcqaQ/lHRSxaMtjxHlkdBw120kBVpkqJyfsNCXWQx6UorxQ/ssvXPeNNIe0z3yWkZPX1JXfD+Z2SQnlo5OsCTNKyYyG5YuDzBCD3nsRgLEgw64hMrXBuexTpgvqoD5rDnROspypDjWgbFbzH5/NT+E/ilZ38Mskdzjetkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kvack.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2L7y0ocWsWzFc2zUS5fdlvHaX3yVCgAkV6Agr5mw0E=;
 b=U801gyH+i7DMnCvBW+sLyohtPR7xiytdCZxcDvEfkY0fUQmD0GXKncvM2FD2J6fNwuvPnHifo9nKKa5v1+SoVhJakyC90tIIwZ8i887qLMq9x4DXWG+cZKZyW7SATwmVzUyv4eQCEHens2oYsBqyXnJKowLZKc5U2nd7MbOzVaM=
Received: from BN9PR03CA0061.namprd03.prod.outlook.com (2603:10b6:408:fc::6)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 20:41:35 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::14) by BN9PR03CA0061.outlook.office365.com
 (2603:10b6:408:fc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 20:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 20:41:34 +0000
Received: from ellora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 14:41:33 -0600
From: "Pratik R. Sampat" <prsampat@amd.com>
To: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <kas@kernel.org>, <ardb@kernel.org>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <osalvador@suse.de>,
	<thomas.lendacky@amd.com>, <michael.roth@amd.com>, <prsampat@amd.com>
Subject: [PATCH v3 2/2] x86/sev: Add support to unaccept memory after hot-remove
Date: Wed, 28 Jan 2026 14:41:05 -0600
Message-ID: <20260128204105.508855-3-prsampat@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128204105.508855-1-prsampat@amd.com>
References: <20260128204105.508855-1-prsampat@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f16615-5db3-42be-c877-08de5eada05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4UFuz18LsR1T2AIxdujNqvIYqm7GYdk/DydZL4C4pP/fOT7btIOUXOhVl3Wu?=
 =?us-ascii?Q?jiqdgpSoD0YJhNL11kt8WGCWazGOqIOBmYlYt05dA57/AVj/OZnpVBLmdpnL?=
 =?us-ascii?Q?QXn6udR/wCkbjt230t6ArrOk/2XHVN+kvs7kE8sZcwccRexyRTew75Mj1e39?=
 =?us-ascii?Q?j9iBbBj8daxi6f/xK7aEu1pUIlHy0SjkkwWEEu8fmlxsSaPqGa/iotP5LuOZ?=
 =?us-ascii?Q?H5lavN1R+XybtzLuQuI9doRdJgNgDYd54DyJaatabg9CBvxvaFE/2cvAMEVI?=
 =?us-ascii?Q?JvAOsOpZug3eKzfjZUpAFvwI6NUf7hLrzV7y7OIFux6NvF6MrfsiCks5RGDR?=
 =?us-ascii?Q?6qtRjTbCMSkoLd2o/BudcOLDR+G5l2FrAhhQEJuIxwqHDtEWQQ/McZfVJwdj?=
 =?us-ascii?Q?aiDNnPI6vIqI6wlSyy1PPaQQoUoNn/EqVAEBlwWchbOcnrVhySPziGjWcpX6?=
 =?us-ascii?Q?AOvDVwZFjAZYs0tqsUp+6LumatAh67tdgOANAa36fMAS84a5T6NLuWdPd70t?=
 =?us-ascii?Q?Vwpwwc2MMj1TG5MlM3C2jxAc12a6Kxcy7KPdgI9dxNY4FlTC1dHUhleWXLNW?=
 =?us-ascii?Q?QDHKW+rw/6y6pAc+bErdT1+MErCrz3cQrEqLnDVpRqOWF7M1ycdJZLwd4+ss?=
 =?us-ascii?Q?oZlRmuehSCH8XWEwqI3eduYLedYXRZOoejOozFxIpLqnhwjPAyU6/zzeLwzu?=
 =?us-ascii?Q?XZTCv+FCuhU4S4p4BnN7nFkqirzEgcn7npUPQ+xiVEl7YdcvelUYrKoAl+jE?=
 =?us-ascii?Q?DAwRu2HMsUjZhNQdLXtMC0kJ/62Yt4ahayk/m4ZMoGNBauysPbz0VMd+dqcg?=
 =?us-ascii?Q?gAHBO045Nrxrj1iewVYwzvBhh1n3NVQe0FciVARoY2wc0OOpGzuHWriRPQru?=
 =?us-ascii?Q?RSdv8ysdK+rTGLaZgsRSHZNHRAuLD0CdI8U0QrvZiK1ONuO2sy1XAapEb2xp?=
 =?us-ascii?Q?vRBxeHmjvmReB3txhLCMlgMVqeUwxlnmob942Rk1Tqug/YigN6EuD/is7dht?=
 =?us-ascii?Q?7FwhmZ7hSzmFByj5MLuOou9Vus5Pvhd0R6sg7zQLCfd7KGAbDPDNKV0Mzhvo?=
 =?us-ascii?Q?qf2TP/glr33kWyHNsqnLJ8yn7oR8aOtfi8MY5dQS+NEAKr1xFEtEQ9EjfAv4?=
 =?us-ascii?Q?/hSRK/BQJUo6ylfLm/s+8Vz8DZdQfhAs4js/zfYkaVh5eRi+pOn2pBavTrU1?=
 =?us-ascii?Q?T+KBgwy3yMh4ozHO4pOE4whmP0E4ydUWf+2zKMtrf5NJK5LNDztzRBGNOP74?=
 =?us-ascii?Q?kapKgPZj3BTwFJVSaAjZa6EG6Q2QLKS0h0GJeVRQlI17LC9IgLVoPfxBu0Sr?=
 =?us-ascii?Q?cdBP+I2eWL9AFBL5GrVLvVjAJQvkkEpW0KUrHbKjEyUR2d/rmZtuqIcVuIPt?=
 =?us-ascii?Q?jxJn5C1Cf9KkcCvqimnXYXmEuKAj606mDS7tj02RoMRS9ZofHOO8qDFRlVMJ?=
 =?us-ascii?Q?g9D2t57zLJ93HJJfRT7mfJNOlRCGqc6It0El0cmGWn/vZCnVkuUTFrvG3kBW?=
 =?us-ascii?Q?cg3yPBCyUIRoDsdtkBNLrTN9JCzxWTi3ri7tYQCv0xO9RdVzzVeW61magBi6?=
 =?us-ascii?Q?5G0vIIpPGQF/uR8WP31Q7q01Ci5tRpbIVmaS8sZiJ1jgl17gAJXQEtR4OLa2?=
 =?us-ascii?Q?tCUWxGFLakKPyZ2dxVRn2nbl+qYmKdNK5UHJWQTc48yGuv8UmWr5yDLCEbWq?=
 =?us-ascii?Q?Ws2LXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 20:41:34.5460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f16615-5db3-42be-c877-08de5eada05a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073

Transition memory to the shared state during a hot-remove operation so
that it can be re-used by the hypervisor. This also applies when memory
is intended to be hotplugged back in later, as those pages will need to
be re-accepted after crossing the trust boundary.

Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
---
 arch/x86/coco/sev/core.c                 | 13 ++++++
 arch/x86/include/asm/sev.h               |  2 +
 arch/x86/include/asm/unaccepted_memory.h |  9 ++++
 drivers/firmware/efi/unaccepted_memory.c | 56 ++++++++++++++++++++++++
 include/linux/mm.h                       |  9 ++++
 mm/memory_hotplug.c                      |  2 +
 6 files changed, 91 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 9ae3b11754e6..63d8f44b76eb 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -703,6 +703,19 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end)
 	set_pages_state(vaddr, npages, SNP_PAGE_STATE_PRIVATE);
 }
 
+void snp_unaccept_memory(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long vaddr, npages;
+
+	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return;
+
+	vaddr = (unsigned long)__va(start);
+	npages = (end - start) >> PAGE_SHIFT;
+
+	set_pages_state(vaddr, npages, SNP_PAGE_STATE_SHARED);
+}
+
 static int vmgexit_ap_control(u64 event, struct sev_es_save_area *vmsa, u32 apic_id)
 {
 	bool create = event != SVM_VMGEXIT_AP_DESTROY;
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 0e6c0940100f..3327de663793 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -514,6 +514,7 @@ bool snp_init(struct boot_params *bp);
 void snp_dmi_setup(void);
 int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
+void snp_unaccept_memory(phys_addr_t start, phys_addr_t end);
 u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_show_status(void);
@@ -623,6 +624,7 @@ static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
 	return -ENOTTY;
 }
 static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
+static inline void snp_unaccept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_show_status(void) { }
diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
index f5937e9866ac..8715be843e65 100644
--- a/arch/x86/include/asm/unaccepted_memory.h
+++ b/arch/x86/include/asm/unaccepted_memory.h
@@ -18,6 +18,15 @@ static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
 	}
 }
 
+static inline void arch_unaccept_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP)) {
+		snp_unaccept_memory(start, end);
+	} else {
+		panic("Cannot unaccept memory: unknown platform\n");
+	}
+}
+
 static inline struct efi_unaccepted_memory *efi_get_unaccepted_table(void)
 {
 	if (efi.unaccepted == EFI_INVALID_TABLE_ADDR)
diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
index 5a4c8b0f56c8..9f1d594dba33 100644
--- a/drivers/firmware/efi/unaccepted_memory.c
+++ b/drivers/firmware/efi/unaccepted_memory.c
@@ -157,6 +157,52 @@ void accept_memory(phys_addr_t start, unsigned long size)
 	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
 }
 
+void unaccept_memory(phys_addr_t start, unsigned long size)
+{
+	unsigned long range_start, range_end, bitrange_end;
+	struct efi_unaccepted_memory *unaccepted;
+	phys_addr_t end = start + size;
+	u64 unit_size, phys_base;
+	unsigned long flags;
+
+	unaccepted = efi_get_unaccepted_table();
+	if (!unaccepted)
+		return;
+
+	phys_base = unaccepted->phys_base;
+	unit_size = unaccepted->unit_size;
+
+	if (start < unaccepted->phys_base)
+		start = unaccepted->phys_base;
+	if (end < unaccepted->phys_base)
+		return;
+
+	start -= phys_base;
+	end -= phys_base;
+
+	/* Make sure not to overrun the bitmap */
+	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
+		end = unaccepted->size * unit_size * BITS_PER_BYTE;
+
+	range_start = start / unit_size;
+	bitrange_end = DIV_ROUND_UP(end, unit_size);
+
+	/* Only unaccept memory that was previously accepted in the range */
+	spin_lock_irqsave(&unaccepted_memory_lock, flags);
+	for_each_clear_bitrange_from(range_start, range_end, unaccepted->bitmap,
+				     bitrange_end) {
+		unsigned long phys_start, phys_end;
+		unsigned long len = range_end - range_start;
+
+		phys_start = range_start * unit_size + phys_base;
+		phys_end = range_end * unit_size + phys_base;
+
+		arch_unaccept_memory(phys_start, phys_end);
+		bitmap_set(unaccepted->bitmap, range_start, len);
+	}
+	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
+}
+
 bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
 {
 	struct efi_unaccepted_memory *unaccepted;
@@ -227,6 +273,16 @@ void accept_hotplug_memory(phys_addr_t start, unsigned long size)
 	arch_accept_memory(start, start + size);
 }
 
+void unaccept_hotplug_memory(phys_addr_t start, unsigned long size)
+{
+	if (range_contains_unaccepted_memory(start, size)) {
+		unaccept_memory(start, size);
+		return;
+	}
+
+	arch_unaccept_memory(start, start + size);
+}
+
 #ifdef CONFIG_PROC_VMCORE
 static bool unaccepted_memory_vmcore_pfn_is_ram(struct vmcore_cb *cb,
 						unsigned long pfn)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2d3c1ea40606..faefaa9b92c6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4504,7 +4504,9 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
 
 bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size);
 void accept_memory(phys_addr_t start, unsigned long size);
+void unaccept_memory(phys_addr_t start, unsigned long size);
 void accept_hotplug_memory(phys_addr_t start, unsigned long size);
+void unaccept_hotplug_memory(phys_addr_t start, unsigned long size);
 
 #else
 
@@ -4518,10 +4520,17 @@ static inline void accept_memory(phys_addr_t start, unsigned long size)
 {
 }
 
+static inline void unaccept_memory(phys_addr_t start, unsigned long size)
+{
+}
+
 static inline void accept_hotplug_memory(phys_addr_t start, unsigned long size)
 {
 }
 
+static inline void unaccept_hotplug_memory(phys_addr_t start, unsigned long size)
+{
+}
 #endif
 
 static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 549ccfd190ee..21b87f2af930 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2240,6 +2240,8 @@ static int try_remove_memory(u64 start, u64 size)
 
 	mem_hotplug_begin();
 
+	unaccept_hotplug_memory(start, size);
+
 	rc = memory_blocks_have_altmaps(start, size);
 	if (rc < 0) {
 		mem_hotplug_done();
-- 
2.52.0

