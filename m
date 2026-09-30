Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508593B3C1D
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746884; cv=none; b=rmww+hzlhTemHRaikzQZyqwZuZcQv3Tnf22kLrQ0HdZnWeIkXVqfWKvYCS9yD9pd82rcR551kGjfBMob+fZXwXZ1E6rUhQEkX0CHKNqfd/mPnlQR4/2UeNArhcx3lPbIY8mHeRu8+pwdPvJHNIbYQD6nZ8BrQxcReo5Orjo58qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746884; c=relaxed/simple;
	bh=q2v/osZjxi7h32nT5ySFdmZTRBLTsBcuuYUKbmbhATU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j86rX4iTJg9URRo0KiPzJ8hfBLf04bmcesZMl9doX1ieiXVNg7KiWtjKyrQqXAyeGB7yLVHGLJtaok+aWPWSAq3z0G+wrZfDyAqakzp0CxLNVesoHRE2gRlCord5lV0plRlwYeqkj7s0JO/4QE8JpyjW7pppHF3c4dU01EMIY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8gO3zD7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8gO3zD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790746876; x=1822282876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q2v/osZjxi7h32nT5ySFdmZTRBLTsBcuuYUKbmbhATU=;
  b=l8gO3zD7Bad85Dm1ZDrd5RUSUSww3ecGwq/iemhb2POUM82pt5qliWbM
   ro98IXNllwU24OmEjaZXg07ejvAGB7rvSssXZdCUvNK5FBPhhHIrnZooB
   ww7Wp5WJHQSYLIv+wJISmDv2IU7LwQCc/uL7+KOlWydD7EJOOD1rLQPpi
   w8KbRXVwIGLwMZefDPm0jPeaEHjNJpFohqzQ5rNFy9F2QCe/SIQ65FnAZ
   L5cn3AZK8QBXnlSRIhFbqF03R0bJw9aJ3fcn/D5iFYcgaJYojX9D0iZnH
   5RzUncT7h8Svdws7GvT08BagI7u6g/T0u62j8m5qgIk3/RttG4w2P4tx/
   A==;
X-CSE-ConnectionGUID: SAtfVMSQQO26qBj0UAYZ1g==
X-CSE-MsgGUID: ZWVzsIwpR7SqXQJwZuYIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102149119"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102149119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:41:04 -0700
X-CSE-ConnectionGUID: rTHVA477QA2a+VTuizz+pA==
X-CSE-MsgGUID: L9jQM28ORv2jPBKaKI9RmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278936423"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:41:03 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: yilun.xu@linux.intel.com,
	chao.gao@intel.com,
	binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [PATCH v3 07/10] x86/virt/tdx: Convert the td_conf metadata reader
Date: Tue, 29 Sep 2026 22:38:41 -0700
Message-ID: <20260930053901.22528-8-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260930053901.22528-1-chao.gao@intel.com>
References: <20260930053901.22528-1-chao.gao@intel.com>
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
per element plus an entry count that is unknown until num_cpuid_config has
been read. That is not worth building for the only two arrays the kernel
reads.

Read the arrays with explicit loops as the generated code did, but store
each value directly into its array member instead of into a temporary u64
first. The members are u64 already, so the extra copies serve no purpose.

AI was used under supervision to review code and workshop logs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
v3:
 - Reword the comment above the CPUID loops
---
 arch/x86/virt/vmx/tdx/tdx.c                 | 53 +++++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h                 | 10 ++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 33 -------------
 3 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 79561312ebfd..e821ab76a140 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -482,6 +482,59 @@ static const struct field_mapping handoff_mappings[] = {
 	TDX_SYSINFO_MAP_HANDOFF(TDX_FIELD_MODULE_HV, module_hv),
 };
 
+#define TDX_SYSINFO_MAP_TD_CONF(_field_id, _member) \
+	TDX_SYSINFO_MAP(_field_id, struct tdx_sys_info_td_conf, _member)
+
+static const struct field_mapping td_conf_mappings[] __initconst = {
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_ATTRIBUTES_FIXED0,	attributes_fixed0),
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_ATTRIBUTES_FIXED1,	attributes_fixed1),
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_XFAM_FIXED0,		xfam_fixed0),
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_XFAM_FIXED1,		xfam_fixed1),
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_NUM_CPUID_CONFIG,	num_cpuid_config),
+	TDX_SYSINFO_MAP_TD_CONF(TDX_FIELD_MAX_VCPUS_PER_TD,	max_vcpus_per_td),
+};
+
+static __init int get_tdx_sys_info_td_conf(struct tdx_sys_info_td_conf *td_conf)
+{
+	int ret, i, j;
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
+	 * TDX_FIELD_CPUID_CONFIG_LEAVES and TDX_FIELD_CPUID_CONFIG_VALUES
+	 * give the field ID of each array's first element. The remaining
+	 * elements follow consecutively, in the order they appear in the
+	 * structure.
+	 */
+	for (i = 0; i < td_conf->num_cpuid_config; i++) {
+		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_LEAVES + i,
+					      &td_conf->cpuid_config_leaves[i]);
+		if (ret)
+			return ret;
+
+		/* Each config has two u64s of CPUID values. */
+		for (j = 0; j < 2; j++) {
+			ret = read_sys_metadata_field(
+				TDX_FIELD_CPUID_CONFIG_VALUES + i * 2 + j,
+				&td_conf->cpuid_config_values[i][j]);
+			if (ret)
+				return ret;
+		}
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
index 8ca1cdcf55fe..f248c962fd5d 100644
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

