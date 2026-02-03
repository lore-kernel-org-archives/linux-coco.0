Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B8313540
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141011; cv=fail; b=iQvjjwFYwXYtht4OwyrbLiR8xZGSkU4T14E1MOf4CxVF6r3DelUiORBCXTR98ATn0CsvRhMG5YlW0XLDea9ewGtJzt6LCqLTuT0lGVmhcJPwzDBsREhC/hyiL6QzAkjs8Vz8g+46gjUSeGQfIuZ66rKQDiuXAl3yd1fB3Z2SczQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141011; c=relaxed/simple;
	bh=uyQ4AYbFceq+0f2pp6yunMAFcitR8jaQ95xtpEt3I7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGmv2g0+0pAxSaru+EwrHmbwygjkTvrnB+LgddpbM31sgJsp3eGVUnEPUebsy9RQOtR8B5bfTfOjFymeqk2q3xZqMs3D/Ol7/C8fFKVmQqmHi2df6VrK+ClPaokEK4BRYAtyoy7jo/V5YpacK4NxkRuHd8xCjBi/9KBiDlfFKA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EQFwfj1g; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EQFwfj1g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+uVz8v9ImFdNWFmVSydDfpb7n+AGIJqJa/B5ZLXz7vtZ/NUVAqvVWAawdjA8uYunRtz1VHf/l+hiYOYjw323RxhvbiV5JYj+XTCDzB4JokLKYI6DXmQ8gJdPsTSjTM8oj7L5QoyQwvKUupmgRGaFQuiMpLnxfNmuLkL5XgNUnav+HH0WfiFk1L8H+xVsP4gK/ktJAgLJmgoCcOVYm68ue7uAlqvU8q6kCExHBYLRsrJxbtAl/BJ9QeFdRTqwZRtOvUZW/paa6knf74+iIxvdBYWWSJKNUOTHcZrBE5hEVzAqY6T/xtNpBCIMMMqiLlmaldqbFWGxrrjftByIVGfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XYDwwfKs1xLCt/9o93NAUKEdzyyyti1OLGKwH3XgXg=;
 b=NbtjwlzOrTvvzrgcwKBYDTBiQMdRDu38my3WIxcFsyJBFEZQbXE3NeMv4hkZBpU0stiHOqnlgYspEQBZwwjo/qGH7IjncnRTbMf9cWU1vUv+Sl3wAfFP4sG6BBE9raPuGWSb+SL7Dra1BIryWK+w3BGB2Tk+mUCnWj9Eoe67W8eMvSLBlWKciHQvTRjYMp9FCLQDBbXRNC8UTijOH1yKP1bBc4r0pQKwXDzL6+BYp4Z2iJwyidAV09EVbbhGSb9dLXcnFDi9GrvNBejn/hueCZofTLPfJ6dfzt+LsdeWGWvvAAdvBlqTEluLWB8qUIIOGk5o1cDXFy3OZc87bs8uzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kvack.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XYDwwfKs1xLCt/9o93NAUKEdzyyyti1OLGKwH3XgXg=;
 b=EQFwfj1gSsQw8AdpPKgHWoddFLmwuAEFjbeCGq+OmeXMzuuuw/E5MQYoBdK4gQ3L6H8jHOL8Uz9+2dME8O2Top7XhiIVkoWQw1JobINbnQkvBIear/xQRryTObx450zgbdknWA4ZEIkh8a8WUWylVwmlWNewBJURO0qgnt8er1A=
Received: from BN9PR03CA0283.namprd03.prod.outlook.com (2603:10b6:408:f5::18)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:50:05 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::b) by BN9PR03CA0283.outlook.office365.com
 (2603:10b6:408:f5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 17:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 17:50:05 +0000
Received: from ellora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 11:50:04 -0600
From: "Pratik R. Sampat" <prsampat@amd.com>
To: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <kas@kernel.org>, <ardb@kernel.org>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <osalvador@suse.de>,
	<thomas.lendacky@amd.com>, <michael.roth@amd.com>, <prsampat@amd.com>
Subject: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory during hot-add
Date: Tue, 3 Feb 2026 11:49:45 -0600
Message-ID: <20260203174946.1198053-2-prsampat@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203174946.1198053-1-prsampat@amd.com>
References: <20260203174946.1198053-1-prsampat@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 17954940-4f4e-4357-446b-08de634caa16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uKTSCHHu4pXllR0zeRnpIaRGr2+zDiwFtDVzVTxvvv+IrVkJWIX0VPm9swbU?=
 =?us-ascii?Q?7+/k1Zu9iRrkJCtbB2aApNABXG3LegzhgHoIwwTK0iv5Bwa/4QqrGK/2cIbn?=
 =?us-ascii?Q?H5LKn9Qe7TSWmo+eqX/VaboEVUcIs4MWAktOUTc31b/I1t65WmcNqL9CU6WW?=
 =?us-ascii?Q?IkG6Rzhh1yQ99CqmYy3jQREP+v76xp0+3I47QcwRW1+/JD3lHbs4xtuFt0zv?=
 =?us-ascii?Q?Oyt6fcwmWy7hmEZotOzUphEiJrHzukJUfndyHdlD+LVcWdnwufA+zG1qMLVj?=
 =?us-ascii?Q?5403SciN8OBgYw8783f6h84sD3+Muaq1wyvSkp1Q6vmtMZXayjlwGFgekng/?=
 =?us-ascii?Q?sSMcq97eoZcc+PUt5MrCbuz5SvHIwiBYE3vaqGRnfFItAqouG+bEpa8vUADO?=
 =?us-ascii?Q?uVl4RWWTcSpyqqzHYUctLJ6P6iKzH6fPJRUoPTL3+Snz0KP6Bo5kJQ1zTJsX?=
 =?us-ascii?Q?LQ9DIJhUenbXclaTc/rtN7Ad09uTdOQzQ0+Z90Vmz7JNafVpbxlTB4m+SfKq?=
 =?us-ascii?Q?exRIIuJaN9uD0XiaoKICjQDzy/ms0oE15yaIQBkZbBXSuhqSKaFofHZEBred?=
 =?us-ascii?Q?aeRxax37NU5vNQzBXo3dxKMnOl7uOL2rIwhajT4x0g+KiQpvaBDl47J2CySF?=
 =?us-ascii?Q?MlOc0GxMkuj80jm0AM6Ri+zQZAZkY+b2frzGjReYkE6JBmMqwFSkkUeBLu/N?=
 =?us-ascii?Q?ZabinOYlF4bwmVhYqhNRXL6EAJRjlVz5vSOAjcOlOEG0cBRgfvQbKRkuLn2+?=
 =?us-ascii?Q?94A0pgyWlePMfKO+lfWiOHSo1s0r2X8TQwtcczQETkqvzDODYPwfyViVHR6u?=
 =?us-ascii?Q?gsI08h6FNPWN3FlWCAk7rhWZhtBYaqSJFWI9ZSve5QNyxUJ3nTGFQS2GJ7Hi?=
 =?us-ascii?Q?Ldm/2euSKhd6+bJWWj6DAOprgwTpGc4L3B2onyO6C2W3maFhx7Z0UHnC9pji?=
 =?us-ascii?Q?C4SOtBUsbNlPpdaehb9dkiY4Mg0AUUEizc37NwpyJs0imDgIm1kxLeCmoQAQ?=
 =?us-ascii?Q?G4A9KAowK8TZTuvmFO3f8ARW34xUU4HC3Gaa/nEHmexRxDUPE+FIfF486u0n?=
 =?us-ascii?Q?Vk85xFDiWnTgz84zXBujOFkXNryLZyMGMwDG6A1EE/hwqAWSzM+em/Dalq54?=
 =?us-ascii?Q?dZ3mti/3hV3c4W0k8uTXZRMdcm5doDBoVXMjuGL9qnuoFHXxRu8TOlyUARRS?=
 =?us-ascii?Q?Vqa58PERenn5woCGmDszySeMKsAU1eyzwAe4K9cC8tokoTROXu+a6NBFU0br?=
 =?us-ascii?Q?82bL31lFAzGL58aoH54nbnUFXpp9SG//LqjwEINGJtLR7S+0u6AXw1PCqLTV?=
 =?us-ascii?Q?7rHCm0A5wPadUry9dvhaXSsMUwsvdjFJd0BCqQIh0dECYkjwvdoQvAhHcy1W?=
 =?us-ascii?Q?5dYGqHVFVqNUipBW9mx0BwG0iuE/vdPeevgyhtra7QV6DiWBjOEgrIL57zAt?=
 =?us-ascii?Q?x5aWgsG3ENmfXhdWmTsH9HHLKE6DDjmNHcOAxJtp6XKvSU6SiZ41pSfVFXgB?=
 =?us-ascii?Q?2vq73pvmORXxLaPtkHS+u0SJ3duJrSDAHCJ9eZXRtYuiZUmKkcDK4Z7dQrSM?=
 =?us-ascii?Q?0sLENpmxutAc2x3ySusX3/ERePTfDpVrVgaO5yjS3tZWb2N+Nt1BzJEsD7N5?=
 =?us-ascii?Q?YtfFX672Koiosy7AteFzHZfbaMY1O5af7UFymvydCbWyWV/egUgqKgwNYHOx?=
 =?us-ascii?Q?HmMIeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9YLnC7bCuc9vQDMcUnUYU7fwkyRHcwmn9j6wlQqG3weObohHmmD3TQTK0ylvJOSTExhWZdB/JaeF4Gx8P9esl3TEPK1cXYum5Kw4XWvAdMxhIrWaiPEtig+CKIkt+4yMDs5D301nH6niD52avFyAYNrb+jnyVtXU2PoOys+xP0m/j5rTmv95Gi79ocnI5ni961upMLjcfAW2gtlr0hllblGhITwxoHdEuzqBwa1rKkc0a7gizsaWLuOYqIUlWqDeVv760osNeJ6gxXx7Cm8v3M6h3XNhvXYHVYDvkeqAAMTbI7mVzXv8M04D97BcHbrhM/MvbvUkFKAGwJe9YOpTjsz5beyaiREOGaDJPd4Hpro6I6+4Y888IlgkoQOD6/Tea0855wDt3DjDGYIAHU9X35yK+HjGMZAwOdU6SVxW0sd7wONGHlDR44AQZ290dyW5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:50:05.4998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17954940-4f4e-4357-446b-08de634caa16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584

Confidential computing guests require memory to be accepted before use.
The unaccepted memory bitmap maintained by firmware does not track
most hotplugged memory ranges apart from system memory annotated to be
cold plugged at boot.

Explicitly validate and transition the newly added memory to a private
state, making it usable by the guest.

Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
---
 drivers/firmware/efi/unaccepted_memory.c | 47 ++++++++++++++++++++++++
 include/linux/mm.h                       |  5 +++
 mm/memory_hotplug.c                      |  2 +
 3 files changed, 54 insertions(+)

diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
index c2c067eff634..359779133cb4 100644
--- a/drivers/firmware/efi/unaccepted_memory.c
+++ b/drivers/firmware/efi/unaccepted_memory.c
@@ -209,6 +209,53 @@ bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
 	return ret;
 }
 
+/*
+ * Unaccepted memory bitmap only covers initial boot memory and not the
+ * hotpluggable range that is part of SRAT parsing. However, some initial memory
+ * with the attribute EFI_MEMORY_HOT_PLUGGABLE can indicate boot time memory
+ * that can be hot-removed. Hence post acceptance, only for that range update
+ * the unaccepted bitmap to reflect this change.
+ */
+void accept_hotplug_memory(phys_addr_t start, unsigned long size)
+{
+	struct efi_unaccepted_memory *unaccepted;
+	unsigned long range_start, range_len;
+	phys_addr_t end = start + size;
+	u64 phys_base, unit_size;
+	unsigned long flags;
+
+	unaccepted = efi_get_unaccepted_table();
+	if (!unaccepted)
+		return;
+
+	/* Accept hotplug range unconditionally */
+	arch_accept_memory(start, end);
+
+	phys_base = unaccepted->phys_base;
+	unit_size = unaccepted->unit_size;
+
+	/* Only update bitmap for the region that is represented by it */
+	if (start >= phys_base + unaccepted->size * unit_size * BITS_PER_BYTE)
+		return;
+
+	start = max(start, phys_base);
+	if (end < phys_base)
+		return;
+
+	start -= phys_base;
+	end -= phys_base;
+
+	/* Make sure not to overrun the bitmap */
+	end = min(end, unaccepted->size * unit_size * BITS_PER_BYTE);
+
+	range_start = start / unit_size;
+	range_len = DIV_ROUND_UP(end, unit_size) - range_start;
+
+	spin_lock_irqsave(&unaccepted_memory_lock, flags);
+	bitmap_clear(unaccepted->bitmap, range_start, range_len);
+	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
+}
+
 #ifdef CONFIG_PROC_VMCORE
 static bool unaccepted_memory_vmcore_pfn_is_ram(struct vmcore_cb *cb,
 						unsigned long pfn)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 15076261d0c2..2d3c1ea40606 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4504,6 +4504,7 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
 
 bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size);
 void accept_memory(phys_addr_t start, unsigned long size);
+void accept_hotplug_memory(phys_addr_t start, unsigned long size);
 
 #else
 
@@ -4517,6 +4518,10 @@ static inline void accept_memory(phys_addr_t start, unsigned long size)
 {
 }
 
+static inline void accept_hotplug_memory(phys_addr_t start, unsigned long size)
+{
+}
+
 #endif
 
 static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index a63ec679d861..549ccfd190ee 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1567,6 +1567,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	if (!strcmp(res->name, "System RAM"))
 		firmware_map_add_hotplug(start, start + size, "System RAM");
 
+	accept_hotplug_memory(start, size);
+
 	/* device_online() will take the lock when calling online_pages() */
 	mem_hotplug_done();
 
-- 
2.52.0

