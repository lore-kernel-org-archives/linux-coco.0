Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792528125;
	b=s43E5AX7+SoyZymHmHMu9fNTItVw1NZeV5hUXKLMbr1GMRZdKaq8p6u7rzBoLjRSt7+F
	 moVJBHd5FXM75v9PLDx7PUgIoRRNOX+HNxG1KLtnvWmKGOzr9uqFFwIiDNOR3TcPRtSQP
	 oEB4TYjqIkcIQLXFgqoGhcly1CgDBR34xPNK8chmvfSgiLvfJydwZ5aeD3GB81K8bl27M
	 6VRzn1HeRC8HHvmiwDYZPgSWydsQ+iNJiaTKMFeI9lLR9Gu2ttQuQZI9S0sc4Uxa6S2Oq
	 RAPiF6FJg5KeEXxjWeazq1GGk38Esks66qUpCRLsgXDKWpDbXAvmJ3FluZf9IIh9uuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528125;
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
	bh=8sxb4PUvzOuL0fOoCIuwKf0L1MN/qQQBUKKJxyF1XOI=;
	b=rm6dITjlLsNviCgE16ieE9RHafF9Hgax77l6HR1/H1zdFmHRCkvEh1geN7sgHouFBu+V
	 BQ8hlMNSy8aQayomg/MSaMCt1WZ46hNEQWDpAGofuezh0BLDFcpRvlYPvSxWw6uJ63+re
	 ekLSn78IWyTzk1dK+dpvgVrzc+5XxyqAqU6MLL2JFHKwY19QsyuCSDKZjvtHVvUg6qFdY
	 1oi4o5pFwghe+/zjER6Vr7vRf4sYZGM2LJf/MIUBTHuL0qdtY6RGOFx472p9vmqxagwpL
	 NOmQ/Btvzd+MLIe2V0LQUirMMPEoFGZ2rDEShMtj1p8Jdly+bVLXoPaC5WI/2lQ+eZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=I3C7o4H8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.28
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AAA606A31D
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 20:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AAA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=I3C7o4H8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHzXgwYpjTO8JvL2ZnZXxtk2JKMZq1xAO4uGAHsCFNkhlO0VrcdCNerC1dkYoEMFq8cTpbdxN72vp/zafrK7WmNBjDG7KUHMbQMaowBOitFJDrUlwxsOSLLT9SapxXf4mqvI9KIs+kPV9DKFhr4SDG72uPlsHwhMiSVPl4CqUy0rKmOD/h5G1z0u8rZTZst7AMtVPnbsDC2KjHC4ZoKQKgTRBPvV5b+z+8n/nfkReHDOIKQPaNTHfvwWPwpRE1le9fPrkX+Da6YkaqoY1fCrUFizy1Xf4ZZtNADexNZ2NyK+bBZ8FYxixvzPYEK8oTHnqye6TzvURAmeetnRXyEBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sxb4PUvzOuL0fOoCIuwKf0L1MN/qQQBUKKJxyF1XOI=;
 b=h9mqONLxXReUkjBmKneB+rz/yga2F5uQh5RHE/9W3+Y8m0HlF+32+V7PvX+chcgvtu1NkWUMiaNTStU1xGYtkA0p80c43Nq4HBtypAoHpwvAcCvK7W37yWms27amHYKmCO4BhcfbK9BdDMJn4JL6XrdFUlkk6Pjj8SZgjd/lXRy1KiMPhG4xVK320fHhmbSH7zVoF+bJEb0UUFPo9m6/V5z4RbFvWJgTdcfN9+azlF/IAw28W5ONcpGUEkcKKd1KvTCCv/ipPKLNf0lKVdZHU/4ufLfSRSlDEGI5E5ro1K3gxWOi7PwYN6UQMakeNtaH1ccTcK9p3H5uhoLxBDnnjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sxb4PUvzOuL0fOoCIuwKf0L1MN/qQQBUKKJxyF1XOI=;
 b=I3C7o4H8qVLJvH36xUZoGekpdG5XR+Mrrfs9xgjPCoTTLLr00gBfHswgmrv/pQJoslMhdie0hRJ/k4u6KY8BenuAR2+esdcW3WiDrmDH+RzrUnrLgQ6aqZv3vColgc1wnK45FbJBFf0JlqUhqTzCHAa4NA+ZbQRQ/DDMuev5OHk=
Received: from BN9PR03CA0929.namprd03.prod.outlook.com (2603:10b6:408:107::34)
 by SA5PPF8ECEC29A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 20:28:40 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::a9) by BN9PR03CA0929.outlook.office365.com
 (2603:10b6:408:107::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 20
 Oct 2026 20:28:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 20:28:40 +0000
Received: from nigeria-2635-os.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 15:28:37 -0500
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: <hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<ardb@kernel.org>, <rppt@kernel.org>, <akpm@linux-foundation.org>,
	<arnd@arndb.de>, <thomas.lendacky@amd.com>, <shivankg@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Subject: [PATCH v2] x86/sev: Apply the RMP table e820 fixups before memblock is populated
Date: Tue, 20 Oct 2026 20:28:18 +0000
Message-ID: <20261020202818.368416-1-Ashish.Kalra@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|SA5PPF8ECEC29A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 59719039-afb2-412a-8fd4-08df2ee8ba55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|56012099006|11063799006|261009223027099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Uoia9SwxPCCIxgwmslnoZMbwk62yldPWm/3NIjcJ+RdU1qi+r1WlanIlxEilElZt3BeyIRmADa+8CNMX49hQ7/wJglgB5yY1ZmuGFTJmL04Ghb2T9ixGXMtY0n1x+SyA3hDyE+bq5wR+C++YDwLABchyce0l8pU/gq7VNYNCOErJ7e//vuBeauETGCJQYU4CWOmu8rwPrt6Z05vd7bBWTa3MF4UIlC3aaFpJtOlRIO9eI9/6duU/+y+y6eQwkwV0P7VQG45ATgKgiQGd2XrABM1AcZ0iMcaQQ/FuIRNGy+fSg34iSYkaEpXp+EC7GV+fbsJRFJrAkleyvjIvqNDYZXH/fRNlKCZmTXSiTwzGFA0zPAezqDsCupxu2tde0MbCZzN4UPsILIi1AGAJvhbkZr1B53Zsi8ipa++Renaht7m8s966S6pXZIi1uMnX2LbIVww2jaFGL9J2ltnGFmnpOx05dCV9Fc0/eCuiWAMjAX8dVXInmppF9myK8zrF5A791OHVDMNPMKjL9QwSP8FzwmZmYH2vdLrHZH01EBvzwMI70vo2Rc1g8sjOkZKyqEeDPqsiLQQkSDdZg3WYnJfSJVCL1sbcObvPC/dxWeYn1BBJxtett6y5/sHu0YoqeXKzQ/hvyMrd+e75OqPKSikNFFFevzFGm68BX2NynvC8l8jjNT+Q5TjGHzPsZ4q1H5OQreoXRpYyu4YPIlwynb8EBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(56012099006)(11063799006)(261009223027099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c+Rkth4WvYMZnByJkMJyvpgh8Zf1MP3vElnGR+fEJ7GganNOjqHLhowoV1RQBxCMl79uHcgLPGxP1k3s2GrcGvqVVHXcPgtqwtR6GfLATJaXmT81gZNKmXc/JNFfBauIBlrMpBP+KY4fVKBPZk6BxGSok9jbYSx+5VB9oIDrr5qomjRfnrb4mDeqp0ICHIX55E2cfj0ALIdK1n54Iug7AaKHoeoU+gRU3HubVeJCNOWZPLKj9dPwUn7HJmm4X9LIWB+h1/YuCuRpnp3yFRWaCYiJu9t9rfc8RsdK6VvEt+XSCmjnO3kv2t5ZyzFZ8VdsjzNyhBgpCqsXGk5DpjA8DRA92zL2QVrHYpHZb6ZNTEN2pOEDcLT1vRuF7Ihh0f8/Bj1K/+i2VfNkvnPvAxJnVrWxbRP0mI6dTdhfB+qgCSSWZbA0ESH/MB4ndTuvytdT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:28:40.2938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59719039-afb2-412a-8fd4-08df2ee8ba55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8ECEC29A9

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

Move them into a new mem_encrypt_fixup_e820() called from setup_arch()
right after trim_bios_range(), before max_pfn is computed and memblock is
populated, so that both are derived from the final e820 table, and
finalize the table with e820__update_table(). mem_encrypt_setup_arch()
keeps the SWIOTLB sizing, which needs the memblock-derived memory size and
stays after e820__memblock_setup(). The memblock reservation is then no
longer needed and is removed.

Fixes: 400fea4b9651 ("x86/sev: Add callback to apply RMP table fixups for kexec")
Co-developed-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
v2:
 - Route the fixup through a new mem_encrypt_fixup_e820() wrapper instead of
   calling snp_fixup_e820_tables() directly from setup_arch().  This keeps
   the memory-encryption specifics out of setup.c (no <asm/sev.h> there) and
   alongside mem_encrypt_setup_arch() in the mem_encrypt layer.  No
   functional change.

 arch/x86/include/asm/mem_encrypt.h |  2 ++
 arch/x86/kernel/setup.c            |  1 +
 arch/x86/mm/mem_encrypt.c          | 14 +++++++-------
 arch/x86/virt/svm/sev.c            |  9 ++++-----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index ea6494628cb0..f357df65cdd2 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -21,9 +21,11 @@ struct boot_params;
 #ifdef CONFIG_X86_MEM_ENCRYPT
 void __init mem_encrypt_init(void);
 void __init mem_encrypt_setup_arch(void);
+void __init mem_encrypt_fixup_e820(void);
 #else
 static inline void mem_encrypt_init(void) { }
 static inline void __init mem_encrypt_setup_arch(void) { }
+static inline void __init mem_encrypt_fixup_e820(void) { }
 #endif
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c..b16b5d8fc569 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1029,6 +1029,7 @@ void __init setup_arch(char **cmdline_p)
 
 	e820_add_kernel_range();
 	trim_bios_range();
+	mem_encrypt_fixup_e820();
 #ifdef CONFIG_X86_32
 	if (ppro_with_ram_bug()) {
 		pr_info("Applying PPro RAM bug workaround: punching 256 kB hole at 1.75 GB physical.\n");
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..07146a63af11 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -99,18 +99,18 @@ void __init mem_encrypt_init(void)
 	print_mem_encrypt_feature_info();
 }
 
+/* Fix up e820 for the RMP table before max_pfn and memblock use it. */
+void __init mem_encrypt_fixup_e820(void)
+{
+	if (cc_platform_has(CC_ATTR_HOST_SEV_SNP))
+		snp_fixup_e820_tables();
+}
+
 void __init mem_encrypt_setup_arch(void)
 {
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
index bd70c4d0b774..73b359d3b743 100644
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
 
@@ -261,11 +259,12 @@ static void __init fixup_e820_tables_for_contiguous_rmp(void)
 
 void __init snp_fixup_e820_tables(void)
 {
-	if (rmp_cfg & MSR_AMD64_SEG_RMP_ENABLED) {
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

