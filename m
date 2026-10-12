Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F747A0C0
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798639; cv=none; b=L8QYuK2NcLYM4sKr/u0U4UneCXoSUVQDKuGFBpT2sEdCqgZO59ghA5VZsHIDHETaC1er5CDEkZgqh0Hwxa8AKkexC+qSwwNNLs98s7zjV3KU5+2XT+TvZEB+zzAtuVakNI24nqjj3wSdcDOxOtWMfeL0uAG9YDsD9nNSOZ9nZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798639; c=relaxed/simple;
	bh=shN9UC7LcRemUvr47KyUCDvrKEgh4uYaMB7fVm9PprU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtr9vXaKCKoeWoolyp3UeiTJY0zhUdoGhDZUBRIMon1xWiP6KjdRsPCbBsuyThlBy7ahqsbl8hSkZ7rQ/Oi9tMmOXXOVWb20pjeIDFKPwAWtP47mReut9KLRq4RqECL3rREquV5QZfdl7ZUYo7gKLigSW1gABi9pHo1nLFEYRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCoS1Lfa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCoS1Lfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791798633; x=1823334633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=shN9UC7LcRemUvr47KyUCDvrKEgh4uYaMB7fVm9PprU=;
  b=LCoS1LfahEgfDic0PPqf6FhHl/bcRi8aLUZPhPUhxKKVQhVEiN0g0qEK
   oMdRjuv08CkGwuM2m5YAb5mDYc+FoStFZ+87EVcKMpqqXBQ2oXFByl5fP
   en4xMif9s2qJ3YYyXvYgogr89cv7aNvSIXMkhCB9vhxyJunUenUHgPz8/
   0KHcdaKkGuH5gJ+A6+1c6/UJ2n6Uf/jgOhtKyxTQOBglyFCTtatcVZb7n
   V8tA9DslUXFimz7DXiFDengLlssD63pEDYNpUJpXBWmgCFBBUEyaEza3u
   7d9yfcRhxdL+ILVmEYwabhC74qjpv62tJ3YchgGHvrELeeWgdn5me+dg+
   A==;
X-CSE-ConnectionGUID: AxeBzhoERcCq0DCXmCvO9g==
X-CSE-MsgGUID: CWNK1h2xTp2gP2Y3YJ7w4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="388037"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="388037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 02:50:24 -0700
X-CSE-ConnectionGUID: fNQO+b13QXyVytDaxf5V3A==
X-CSE-MsgGUID: Iz00bv/tQnSYZIgrFdH4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="776865"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 02:50:24 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com,
	rick.p.edgecombe@intel.com,
	nik.borisov@suse.com,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH v4 07/10] x86/virt/tdx: Convert the td_conf metadata reader
Date: Mon, 12 Oct 2026 02:47:34 -0700
Message-ID: <20261012094754.27702-8-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012094754.27702-1-chao.gao@intel.com>
References: <20261012094754.27702-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue converting the metadata readers to the table-driven helper.

The "TD Configurability" class holds several scalar fields plus two CPUID
arrays. The arrays have a fixed capacity, but the number of entries to
read is variable and reported by the num_cpuid_config scalar field.

Add a table that pairs each scalar field ID with the 'struct
tdx_sys_info_td_conf' member that holds its value, and read those fields
by walking that table.

Annotate the table as __initconst as it is referenced only during init.

Leave the two arrays open coded. 'struct field_mapping' pairs one field ID
with one structure member, so describing an array would require a field ID
per field plus an entry count that is unknown until num_cpuid_config has
been read. That is not worth building for the only two arrays the kernel
reads.

Read both arrays in a single loop, as both have num_cpuid_config
entries. Store each value directly into its array member instead of
into a temporary u64 first. The members are u64 already, so the extra
copies serve no purpose.

The inner dimension of cpuid_config_values[] is fixed at 2. Read the
two values with two calls instead of an inner loop. This saves a level
of indentation and is simpler to read.

AI was used under supervision to review code and workshop logs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
v4:
 - Drop per-class macros [Nikolay, Dave]
 - Unroll the inner loop that reads cpuid_config_values[] [Nikolay]

v3:
 - Reword the comment above the CPUID loops
---
 arch/x86/virt/vmx/tdx/tdx.c                 | 56 +++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h                 | 10 ++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 33 ------------
 3 files changed, 66 insertions(+), 33 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index ebf9d4d721e1..26cfa3b51647 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -471,6 +471,62 @@ static const struct field_mapping handoff_mappings[] = {
 	FIELD_MAP(TDX_FIELD_MODULE_HV, handoff, module_hv),
 };
 
+static const struct field_mapping td_conf_mappings[] __initconst = {
+	FIELD_MAP(TDX_FIELD_ATTRIBUTES_FIXED0,	td_conf, attributes_fixed0),
+	FIELD_MAP(TDX_FIELD_ATTRIBUTES_FIXED1,	td_conf, attributes_fixed1),
+	FIELD_MAP(TDX_FIELD_XFAM_FIXED0,	td_conf, xfam_fixed0),
+	FIELD_MAP(TDX_FIELD_XFAM_FIXED1,	td_conf, xfam_fixed1),
+	FIELD_MAP(TDX_FIELD_NUM_CPUID_CONFIG,	td_conf, num_cpuid_config),
+	FIELD_MAP(TDX_FIELD_MAX_VCPUS_PER_TD,	td_conf, max_vcpus_per_td),
+};
+
+static __init int get_tdx_sys_info_td_conf(struct tdx_sys_info_td_conf *td_conf)
+{
+	int ret, i;
+
+	ret = read_sys_metadata_table(td_conf_mappings, td_conf);
+	if (ret)
+		return ret;
+
+	/*
+	 * The number of CPUID config entries must not exceed the array
+	 * sizes.
+	 */
+	if (td_conf->num_cpuid_config > ARRAY_SIZE(td_conf->cpuid_config_leaves) ||
+	    td_conf->num_cpuid_config > ARRAY_SIZE(td_conf->cpuid_config_values))
+		return -EINVAL;
+
+	/*
+	 * cpuid_config_leaves[i] holds a CPUID leaf and sub-leaf number,
+	 * and the two u64s of cpuid_config_values[i] mark which bits of
+	 * that leaf's EAX/EBX/ECX/EDX the host can set to 0 or 1 for a TD.
+	 *
+	 * TDX_FIELD_CPUID_CONFIG_LEAVES and TDX_FIELD_CPUID_CONFIG_VALUES
+	 * give the field ID of each array's first element, and the rest
+	 * follow in order.
+	 */
+	for (i = 0; i < td_conf->num_cpuid_config; i++) {
+		u64 cpuid_config_values_id = TDX_FIELD_CPUID_CONFIG_VALUES + i * 2;
+
+		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_LEAVES + i,
+					      &td_conf->cpuid_config_leaves[i]);
+		if (ret)
+			return ret;
+
+		ret = read_sys_metadata_field(cpuid_config_values_id,
+					      &td_conf->cpuid_config_values[i][0]);
+		if (ret)
+			return ret;
+
+		ret = read_sys_metadata_field(cpuid_config_values_id + 1,
+					      &td_conf->cpuid_config_values[i][1]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 #include "tdx_global_metadata.c"
 
 static __init int check_features(struct tdx_sys_info *sysinfo)
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 720e301f599e..e41fc5e4925e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -78,6 +78,16 @@
 #define TDX_FIELD_TDCS_BASE_SIZE		0x9800000100000100ULL
 #define TDX_FIELD_TDVPS_BASE_SIZE		0x9800000100000200ULL
 
+/* Class "TD Configurability" */
+#define TDX_FIELD_ATTRIBUTES_FIXED0		0x1900000300000000ULL
+#define TDX_FIELD_ATTRIBUTES_FIXED1		0x1900000300000001ULL
+#define TDX_FIELD_XFAM_FIXED0			0x1900000300000002ULL
+#define TDX_FIELD_XFAM_FIXED1			0x1900000300000003ULL
+#define TDX_FIELD_NUM_CPUID_CONFIG		0x9900000100000004ULL
+#define TDX_FIELD_MAX_VCPUS_PER_TD		0x9900000100000008ULL
+#define TDX_FIELD_CPUID_CONFIG_LEAVES		0x9900000300000400ULL
+#define TDX_FIELD_CPUID_CONFIG_VALUES		0x9900000300000500ULL
+
 /* Class "TDX Module Handoff" */
 #define TDX_FIELD_MODULE_HV			0x8900000100000000ULL
 
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index f1aeccd08027..ef7f5a5d74ae 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,39 +7,6 @@
  * Include this file to other C file instead.
  */
 
-static __init int get_tdx_sys_info_td_conf(struct tdx_sys_info_td_conf *sysinfo_td_conf)
-{
-	int ret = 0;
-	u64 val;
-	int i, j;
-
-	if (!ret && !(ret = read_sys_metadata_field(0x1900000300000000, &val)))
-		sysinfo_td_conf->attributes_fixed0 = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x1900000300000001, &val)))
-		sysinfo_td_conf->attributes_fixed1 = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x1900000300000002, &val)))
-		sysinfo_td_conf->xfam_fixed0 = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x1900000300000003, &val)))
-		sysinfo_td_conf->xfam_fixed1 = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9900000100000004, &val)))
-		sysinfo_td_conf->num_cpuid_config = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9900000100000008, &val)))
-		sysinfo_td_conf->max_vcpus_per_td = val;
-	if (sysinfo_td_conf->num_cpuid_config > ARRAY_SIZE(sysinfo_td_conf->cpuid_config_leaves))
-		return -EINVAL;
-	for (i = 0; i < sysinfo_td_conf->num_cpuid_config; i++)
-		if (!ret && !(ret = read_sys_metadata_field(0x9900000300000400 + i, &val)))
-			sysinfo_td_conf->cpuid_config_leaves[i] = val;
-	if (sysinfo_td_conf->num_cpuid_config > ARRAY_SIZE(sysinfo_td_conf->cpuid_config_values))
-		return -EINVAL;
-	for (i = 0; i < sysinfo_td_conf->num_cpuid_config; i++)
-		for (j = 0; j < 2; j++)
-			if (!ret && !(ret = read_sys_metadata_field(0x9900000300000500 + i * 2 + j, &val)))
-				sysinfo_td_conf->cpuid_config_values[i][j] = val;
-
-	return ret;
-}
-
 static __init int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 {
 	int ret = 0;
-- 
2.52.0

