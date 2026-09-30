Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADE3B42D6
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746866; cv=none; b=OR27m2VVLT/euzk05i1cD8giJvFIY1tXMomiYd1VX4Nsob/eybhJBuh+EXCD4waFL2bstXZ2hJO9VQkw3IEVkDxTDJBdGFzNTOACA68PL2Mbjfv17y/ooc2AwMvc26Wt1yxJJ+MHem8jUENnV41wR2hdYeSaeJWq5RX3rW4y19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746866; c=relaxed/simple;
	bh=Cm6dmU1l4xfttZ2AVXjfsIAw6ZUJD5tOA2TKKdoTZR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvvYLTtPfbt/Cpl8VMHO43MgwcCysS/+AJPPgpn3f83t0BcmZ1meBupbVyfS8gMPOzo4scMhdEHB/SD7GbZShQ4pmh6lkOAV7phNtT6b8gXM7fcg/4EAPXYYtG20ibir8GTCUlC89Y2Y+VHi2q+1meU7QWFG9XqZeZJx65A3B4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJ8PK1Dz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJ8PK1Dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790746865; x=1822282865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cm6dmU1l4xfttZ2AVXjfsIAw6ZUJD5tOA2TKKdoTZR4=;
  b=NJ8PK1Dz882LYnO2YCx3RNstx5tAtOUooHPCzXcc7w/Ose8RWQmSnq4G
   QfUTUmdW8zD7HG7QWx1C9+GfpI3x5uuCvbQ+J1PkElqmGioy0pIbs8pEi
   NSzqYMcJ0PazJpRw4RPWeIxP46BhJ86pw07GTlavmlZMBAQr0xFFsDQa3
   CeMZWOLPrDAcET5oV6CFpusImdaJ4o8bKk0HUN+IizLu+JjmVxxcgdcG8
   wV7izDLH5nG+jHfHsE3A2FlpbIG7ue+pHDsgY4tnNpH0WvA7+giUsOXkL
   mh38rwsPjVqImMXbnZZ0D1v+F0BCpUNGpcVj4z550rkP3kKGy+skwsIxB
   g==;
X-CSE-ConnectionGUID: npyeK0wqQnaMJyzoHYRQiA==
X-CSE-MsgGUID: pdzlgkpDRryIX4nfP5Hbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102149082"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102149082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:40:59 -0700
X-CSE-ConnectionGUID: XFmdSlsEThWP9/RdlMPKyQ==
X-CSE-MsgGUID: S+UXnwdtSG+Y7rxZvJuCkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278936396"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:40:59 -0700
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
Subject: [PATCH v3 02/10] x86/virt/tdx: Convert the version metadata reader
Date: Tue, 29 Sep 2026 22:38:36 -0700
Message-ID: <20260930053901.22528-3-chao.gao@intel.com>
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

With the helper to read a table of metadata fields in place, the
existing metadata readers can be standardized on it.

Convert the version metadata reader: add a table that pairs each field ID
with the 'struct tdx_sys_info_version' member that holds its value, and
read all version fields by walking that table.

Name the field IDs for readability, so the table entries don't carry raw
hex literals.

AI was used under supervision to review code and workshop logs.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
v3:
 - Drop the get_tdx_sys_info_*() wrappers to remove an unnecessary layer
   of abstraction. [Rick, Dave]
 - Shorten the field ID defines from TDX_MD_FIELD_ID_* to TDX_FIELD_*
   [Rick]
---
 arch/x86/virt/vmx/tdx/tdx.c                 | 15 ++++++++++++---
 arch/x86/virt/vmx/tdx/tdx.h                 | 10 ++++++++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 17 +----------------
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 67a80ed86bd3..9d8a55a5da31 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -408,8 +408,8 @@ struct field_mapping {
 };
 
 /* Read each metadata field listed in @mappings[] into @data. */
-static int __maybe_unused __read_sys_metadata_table(const struct field_mapping *mappings,
-						    int num_mappings, void *data)
+static int __read_sys_metadata_table(const struct field_mapping *mappings,
+				     int num_mappings, void *data)
 {
 	int i, ret;
 	u64 val;
@@ -434,6 +434,15 @@ static int __maybe_unused __read_sys_metadata_table(const struct field_mapping *
 	.size		= sizeof_field(_type, _member),		\
 }
 
+#define TDX_SYSINFO_MAP_VERSION(_field_id, _member) \
+	TDX_SYSINFO_MAP(_field_id, struct tdx_sys_info_version, _member)
+
+static const struct field_mapping version_mappings[] = {
+	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_MINOR_VERSION,  minor_version),
+	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_MAJOR_VERSION,  major_version),
+	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_UPDATE_VERSION, update_version),
+};
+
 #include "tdx_global_metadata.c"
 
 static __init int check_features(struct tdx_sys_info *sysinfo)
@@ -1401,7 +1410,7 @@ int tdx_module_run_update(void)
 	if (ret)
 		return ret;
 
-	ret = get_tdx_sys_info_version(&tdx_sysinfo.version);
+	ret = read_sys_metadata_table(version_mappings, &tdx_sysinfo.version);
 	/*
 	 * Only fails if there is something unexpected
 	 * and severely wrong with the module.
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index db209541d3cd..10cbc2d77a5a 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -52,6 +52,16 @@
 #define TDH_PHYMEM_PAMT_REMOVE		59
 #define TDH_SYS_DISABLE			69
 
+/*
+ * TDX global metadata field IDs.
+ *
+ * See "global_metadata.pdf" in Intel TDX Module ABI Definitions.
+ */
+/* Class "TDX Module Version" */
+#define TDX_FIELD_MINOR_VERSION			0x0800000100000003ULL
+#define TDX_FIELD_MAJOR_VERSION			0x0800000100000004ULL
+#define TDX_FIELD_UPDATE_VERSION		0x0800000100000005ULL
+
 /* TDX page types */
 #define	PT_NDA		0x0
 #define	PT_RSVD		0x1
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 98ebf17aab1c..c55674cd4ce6 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,21 +7,6 @@
  * Include this file to other C file instead.
  */
 
-static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
-{
-	int ret = 0;
-	u64 val;
-
-	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000003, &val)))
-		sysinfo_version->minor_version = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000004, &val)))
-		sysinfo_version->major_version = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000005, &val)))
-		sysinfo_version->update_version = val;
-
-	return ret;
-}
-
 static __init int get_tdx_sys_info_features(struct tdx_sys_info_features *sysinfo_features)
 {
 	int ret = 0;
@@ -129,7 +114,7 @@ static __init int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 {
 	int ret = 0;
 
-	ret = ret ?: get_tdx_sys_info_version(&sysinfo->version);
+	ret = ret ?: read_sys_metadata_table(version_mappings, &sysinfo->version);
 
 	pr_info("Module version: " TDX_VERSION_FMT "\n",
 		sysinfo->version.major_version,
-- 
2.52.0

