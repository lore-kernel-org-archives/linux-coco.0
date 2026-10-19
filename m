Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435663;
	b=Fmxncwje8KIG+OMPZ0SAhwaxojrWU/2tLLgE5aGnLPbgrKTXikZNkaB7cNdjxdur8IYp
	 ssEihT7/7nqYDWkbacVZgZYIU2JpmbRUdpZzN9Gz1gv+cmEAq59wCN/3eC1t00CQwnD/a
	 pElbXlUQBtrtdEDIWEg4FEg9CjvGvNZEZl4HxWiQ6gv8MPOvp8tpn6SJGHtxBmcrrFV+9
	 MNitn1YRqHkVSGjxv4W53wiHqbAYuC2Qv6So26LvS4+7JTchzTGAKe8LGKrWgRVjY2a4y
	 t8GijDjIFOe/muWtkLlJpbAMNY9Gjz41OaF6G9B0+ylgbLaWlN6RGP8qpJDP0lrDcTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435663;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YAALrzlzmVl1OkMzs1NTGr++xCGdt/+rea1rk2p0kKo=;
	b=2gkx8SyxipAeB1JW9oEELzkmzL3RQ4k55WnAGCeVZcGiOA+11iYnsZAaV1aHhwV1hqlZ
	 MU89JFrnLN/6WCPhXXEq51ccWeSo6YiZImQnDt2a1A0t7Pw8JO+zVwbkCRAApcMBzzN4l
	 b6YWggKl7o+epT75xywCtmSp0Fce/OyCFepPqjBfK5ghHf4TS1nKOTixjC9AI4xozvXxE
	 GegHYvy+STigJ7naUMNUsSTUQPOBoQgzh/RwVDraNYGJFoo+8jsRJDllC6yegzs7+0Leo
	 sKg2CEg1rLjelKCPN1Q1IsVQvH6wqZe069KFm5fHFMqCIR4DZHCgaAZnmOMTnbenWXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gQUT9CIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.63
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1E606A31C
	for <linux-coco@lists.linux.dev>; Mon, 19 Oct 2026 18:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gQUT9CIz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/kyHHnjtJZPTQjavFXo6xYib5HG4DtGCgi3okwYL1VHeUOB7kxHOEEBlwhPlQNXzzjszjnLwEV71K6O1cmhGGh5+P/3z+hsmH7RU2ivYpPkukMWeKAswPzlBwrf9HdJZrhMQypOPFlEbgvGLT9O6ojdmCLRRTt5uEE8bCpO6lloA4/f6ToI8dsBhmtycYZ/Uvq0i6+xowjcL6ENaLtVw/vYDudLbnPDAM6iXHCSPBCb+FtrLpFTufEq3JqA5n+wSMXN3xmZjXT4LlWIcPUB7mrMvRmqsyvlZw9y7JhiBG+kaR8Ze2AOSAT74rigxd8T//pAtGkEOemmmftq7czNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAALrzlzmVl1OkMzs1NTGr++xCGdt/+rea1rk2p0kKo=;
 b=uN2ZXP313SdHoYxY84xfpbN1V3p+1zY1UhesPq3BKjYN+sa0iWRpQ1lI/PKKq8lJOoQCGILNeQ74Xarz0ZOaK0EpU0QF7qYCXT1wgC8/v7fCZVG50BbA+1/4jVWdKAh1oumcad2HiqdINzLctkwYiw2IAwDce5io4FN0NzWfHxqspJLrJQEuBi/rODPuKDAiEeY9flJqHoCrR9njCbwM7p4cYQzdNYTpI6HkuHssyDTlVaFtFpzGBrlTj7DXevyScfwiAFwScFuWvEYlZNgFfiSz5q30VoL1dwdbP6vpduRbi+YdfjF25K8y9F1koE/kZqFRXkpTjWxRgkh2hcy2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAALrzlzmVl1OkMzs1NTGr++xCGdt/+rea1rk2p0kKo=;
 b=gQUT9CIzMwzPb5kijdjO8tEK1nrKc8YFzwiSlWx9Rsmku7dvlYs9q3CF0+eR3K1mPHoxhgiJ8qxbPDs06mTtniki2qL/DkTYwWsydDR0M5yiIyHbuxGg+THXpRGXEV47YSrBXyco0R4JA7/lAciNuV+qy7CMvfFHCQOIEP/NjV8=
Received: from SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:47:36 +0000
Received: from SJ1PEPF000037A4.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::34) by SJ0PR03CA0234.outlook.office365.com
 (2603:10b6:a03:39f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 18:47:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A4.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 18:47:36 +0000
Received: from nigeria-2635-os.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 13:47:37 -0500
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: <hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<ardb@kernel.org>, <rppt@kernel.org>, <akpm@linux-foundation.org>,
	<arnd@arndb.de>, <thomas.lendacky@amd.com>, <shivankg@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Subject: [PATCH] x86/sev: Apply the RMP table e820 fixups before memblock is populated
Date: Mon, 19 Oct 2026 18:47:24 +0000
Message-ID: <20261019184724.358131-1-Ashish.Kalra@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A4:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e8a0df-f66e-446b-0481-08df2e1171ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9iwhgo2p2ka9LwQnNsEq0zYyAxqWQO3OHzcHGPqOpQbJppmMUA41ANyHXCLn8+mPY6M4FkZZbAM7RgQ5N/7MXrScOIQgwOSpUFNlKacRHMU9L9j/RrIWyV71Sc8BQ9D9aJPeRaFUq1hkdqNUobcnZRv9DLeSiQ/YlrSX1qzeVPHfKAqKtMGmAXoGYo5LBK+CcPd6yCds5vVSGv9tojsJJWpF7kAAt9rDYl7G7mTrDQV1iFLkf90Yd1+OMjk3HF5hJSOByxinp03cwvGf7kvWH1enrEU7sQ1kQyX4QVaLkix44f2aC3slm+iubX3SXZZdBPylD/G1HM+4qloJQjpZVgDa/dvlXEM5gPsoPc4S9aVS2BFRj+BzKCqhdNdwETxzFjO7uaQnNiFdFvimfK7/evkybrlHqnrkumUmG2Eo6Xjw35odBUsvAcLrIpu3BIVnYcvotm0H/j0qszIzUafEEX0QYGHZ7nozboMOk4vfgrpuid3Osu6eTa3fPt2T48poSZITW07LiDa8K3nym8hY+foUrhPsMLnn0fYNv2Qe25G3Z/X/1wvOLKu+uW18g2A24aeV5PdIZjyNP1YjCgDonFSrXHG3TdkZAy2KumcjkBKib7q/eeKmEYaTkh87wDBxLwbayeAnfAb1ohglf1wMZSVNnqbiVBKx1eoFTsuy4I6xmjzB23zM71lNv5z9JYtUQbJznVuPkic7AWxmH841KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+r40KQ3qF/qQ93Zgwglp1Zf0uY443Y9S5wfBPiB40knb494rlWsrs3ehNEkcrVDTWGmXVTd4xjtfBKE7/+fTUyU5BnOdGXaRDLwTgLTCOKh/TEA1dmAW/E/HAXmpYXMUWOONIv3h8+KH5yhGVu/S0YnBgPuPTDde/m1CFjdBJ2f5Wn46FvxlgGOJk1EGDiCr9HT/NyL72RgLtsk0JOOgPvRakdJCmrXrsDFX7DQA7sJ0K8oSm2phC616mJv1zg7zBCQ4NXsXA7QFRCkWZETVKahd75gT0zmifX74V+FpiBIU+K9HA3u/l0IcKdaPI2ik4zVpDM83SNP91IXmqznPfgBwP7W7g9ojjsuHcJ1y8cvhV2K6TA2SdX6Do6USL6uejweOJuX26Iph11V9BiLcvl2oFIt4Qyo4eaLFEIoBcXQIqbPksjMFVQnU93BSsJzx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:47:36.4988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e8a0df-f66e-446b-0481-08df2e1171ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816

From: Ashish Kalra <ashish.kalra@amd.com>

When the start and/or end of the RMP table is not 2MB aligned,
snp_fixup_e820_tables() converts the 2MB chunk containing it from RAM to
reserved in the e820 tables, so that it is never used by the kernel (or
by a kexec-ed kernel) and SNP_INIT marks it HV-Fixed.

The fixups are done from mem_encrypt_setup_arch(), which runs after
max_pfn has been computed and after e820__memblock_setup() has populated
memblock from the e820 table. The RAM part of those chunks therefore
remains in memblock.memory. Commit 88a921aa3c6b ("x86/sev: Ensure that
RMP table fixups are reserved") dealt with one consequence of that, the
chunks still being allocatable, by additionally reserving them in
memblock, but memblock still describes them as memory.

That trips up the direct map setup. init_range_memory_mapping() maps the
memblock.memory ranges, so the RAM part of a chunk gets mapped. When a
subsequent, lower range is mapped, the trimming in phys_pmd_init() or
phys_pud_init() consults e820 instead, finds no RAM in the 2MB (or 1GB)
slot and clears the already populated entry. At boot this goes through
set_pmd_safe()/set_pud_safe() and triggers:

  SEV-SNP: RMP table physical range [0x000000bf77900000 - 0x000000c037efffff]
  SEV-SNP: Reserving start/end of RMP table on a 2MB boundary [0x000000bf77800000]
  SEV-SNP: Reserving start/end of RMP table on a 2MB boundary [0x000000c037e00000]
  ...
  init_memory_mapping: [mem 0xbf60000000-0xbf778fffff]
   [mem 0xbf60000000-0xbf777fffff] page 2M
   [mem 0xbf77800000-0xbf778fffff] page 4k
  init_memory_mapping: [mem 0xbf40000000-0xbf5fffffff] page 2M
  WARNING: arch/x86/mm/init_64.c:89 at phys_pmd_init+0x389/0x4b0, CPU#0: swapper/0
  Call Trace:
   phys_pud_init
   phys_p4d_init
   __kernel_physical_mapping_init
   init_memory_mapping
   init_range_memory_mapping
   init_mem_mapping
   setup_arch
   start_kernel

and leaks the page table page that hung off the cleared entry.

None of the fixups depend on memblock: the RMP table is probed and
CC_ATTR_HOST_SEV_SNP is set from early_cpu_init(), and the segmented RMP
case only needs early_memremap(). They do depend on the e820 tables,
which are only built in e820__memory_setup() (which also populates
e820_table_kexec), so the fixups cannot run any earlier than that.

Do the fixups in setup_arch() right after trim_bios_range() and before
max_pfn is computed, like the other e820 trimming done there, so that
max_pfn and memblock are derived from the final e820 table, and finalize
the table with e820__update_table(). The memblock reservation is then no
longer needed and is removed.

Fixes: 400fea4b9651 ("x86/sev: Add callback to apply RMP table fixups for kexec")
Co-developed-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 arch/x86/kernel/setup.c   |  4 ++++
 arch/x86/mm/mem_encrypt.c |  7 -------
 arch/x86/virt/svm/sev.c   | 12 +++++++-----
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c..668230a0b01d 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -56,6 +56,7 @@
 #include <asm/prom.h>
 #include <asm/proto.h>
 #include <asm/realmode.h>
+#include <asm/sev.h>
 #include <asm/thermal.h>
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
@@ -1029,6 +1030,9 @@ void __init setup_arch(char **cmdline_p)
 
 	e820_add_kernel_range();
 	trim_bios_range();
+
+	/* Do the RMP table fixups before max_pfn and memblock use e820. */
+	snp_fixup_e820_tables();
 #ifdef CONFIG_X86_32
 	if (ppro_with_ram_bug()) {
 		pr_info("Applying PPro RAM bug workaround: punching 256 kB hole at 1.75 GB physical.\n");
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..558e61a983c6 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -104,13 +104,6 @@ void __init mem_encrypt_setup_arch(void)
 	phys_addr_t total_mem = memblock_phys_mem_size();
 	unsigned long size;
 
-	/*
-	 * Do RMP table fixups after the e820 tables have been setup by
-	 * e820__memory_setup().
-	 */
-	if (cc_platform_has(CC_ATTR_HOST_SEV_SNP))
-		snp_fixup_e820_tables();
-
 	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
 		return;
 
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index bd70c4d0b774..7cd77cb06728 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -207,8 +207,6 @@ static void __init __snp_fixup_e820_tables(u64 pa)
 		pr_info("Reserving start/end of RMP table on a 2MB boundary [0x%016llx]\n", pa);
 		e820__range_update(pa, PMD_SIZE, E820_TYPE_RAM, E820_TYPE_RESERVED);
 		e820__range_update_table(e820_table_kexec, pa, PMD_SIZE, E820_TYPE_RAM, E820_TYPE_RESERVED);
-		if (!memblock_is_region_reserved(pa, PMD_SIZE))
-			memblock_reserve(pa, PMD_SIZE);
 	}
 }
 
@@ -261,11 +259,15 @@ static void __init fixup_e820_tables_for_contiguous_rmp(void)
 
 void __init snp_fixup_e820_tables(void)
 {
-	if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED) {
+	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
+		return;
+
+	if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED)
 		fixup_e820_tables_for_segmented_rmp();
-	} else {
+	else
 		fixup_e820_tables_for_contiguous_rmp();
-	}
+
+	e820__update_table(e820_table);
 }
 
 static void clear_rmp(void)

base-commit: 250ee734115bca1c1f7a38d838909aa83cce87ae
-- 
2.43.0

