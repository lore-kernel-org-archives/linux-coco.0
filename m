Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3C4F4CEE
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738307; cv=none; b=VrmJGruMTlu39VlU6HqZWr93aYY7VHnWWTyAg3QN7fDbWjciF7hX6mo1rnwKv3UwAg0Cwd591p+bB0b8PB8vD5cAAlU8/kwmofYzY7UeHPmN0KrUjn+J+YO9XEgnDbGcXJV48n+y3JULjFGfUCrMxQtO82CtqeZvPUnZHiNhMN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738307; c=relaxed/simple;
	bh=kLCUBKUyKSBmyX86DoO24PXOVX3ZEud/eaxMU6SLFXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HELjc1CuykuZ9heq/8dKvl1FNxBpz1hfz8XmYhOv2y7wq+WhEHXkjknUE2ly38H56fPtFQwCtHxLzxL1ZcFGnzDhjxHPQpJx3c1k4lF7A0t8fXou9laC0DdVNtEcNgAychOKwI7ngNK6X7cAXlKnqZpE22Qza7T5/CaRzHO3/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxeAmxw6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxeAmxw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789738304; x=1821274304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kLCUBKUyKSBmyX86DoO24PXOVX3ZEud/eaxMU6SLFXA=;
  b=lxeAmxw6JNxtuprXqVOqS2yjWDXaUTeyXPZ7dKsdZMAq2kxCNcsgxAlZ
   NK1O63QhkmrFRy+TMKRtc1KoSZWvUtq22GVne6KSyHAaL8bh0tKuZdMhh
   Pw+SUpwLR39zvmakfa2jejy+NC+qDX6UZJlPXd0WatcgrLdvNxLQukv3Y
   +egF60pGHTHb4WckYiAKIMrmczxmYnTVoxP8KBPLvorO3suaJkURhyLIu
   qaz7GO2M5RDRtNQ0dtJidbTfhOo1rFO+D3++6KFxMYZ55ziixik94oF9h
   yDoYdFarUiPTzhQg68POQvrFLDmfwB1EBckASBtkDk/cXL76kcd7PzhdB
   w==;
X-CSE-ConnectionGUID: whq/lQXXSCaTamp4XOFcfw==
X-CSE-MsgGUID: x/XvUChCT1WnmKTJreRPQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="115776130"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="115776130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:31:42 -0700
X-CSE-ConnectionGUID: FzWkJb1ITuG8OWjidp+m7g==
X-CSE-MsgGUID: wox0qpMfSGejwwb/7Crt0Q==
X-ExtLoop1: 1
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:31:41 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: yilun.xu@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [RFC PATCH v2 04/10] x86/virt/tdx: Convert the tdmr metadata reader
Date: Fri, 18 Sep 2026 06:29:23 -0700
Message-ID: <20260918132946.76533-5-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260918132946.76533-1-chao.gao@intel.com>
References: <20260918132946.76533-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue converting the metadata readers to the table-driven helper.

The "TDMR info" metadata class has two readers: one for the fields that are
always present, and one for the fields that exist only when the module
supports Dynamic PAMT.

Add a table for each, both pairing field IDs with the 'struct
tdx_sys_info_tdmr' members that hold their values, and read all fields by
walking the tables.

Annotate both tables as __initconst since they are referenced only during
init.

AI was used under supervision to review the code and workshop the
changelog.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/virt/vmx/tdx/tdx.c                 | 25 +++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.h                 |  8 ++++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 31 ---------------------
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 59e2396fea39..72aed3fc2b25 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -460,6 +460,31 @@ static __init int get_tdx_sys_info_features(struct tdx_sys_info_features *featur
 	return read_sys_metadata_table(feature_mappings, features);
 }
 
+#define TDX_SYSINFO_MAP_TDMR(_field_id, _member) \
+	TDX_SYSINFO_MAP(_field_id, struct tdx_sys_info_tdmr, _member)
+
+static const struct field_mapping tdmr_mappings[] __initconst = {
+	TDX_SYSINFO_MAP_TDMR(MAX_TDMRS,			max_tdmrs),
+	TDX_SYSINFO_MAP_TDMR(MAX_RESERVED_PER_TDMR,	max_reserved_per_tdmr),
+	TDX_SYSINFO_MAP_TDMR(PAMT_4K_ENTRY_SIZE,	pamt_4k_entry_size),
+	TDX_SYSINFO_MAP_TDMR(PAMT_2M_ENTRY_SIZE,	pamt_2m_entry_size),
+	TDX_SYSINFO_MAP_TDMR(PAMT_1G_ENTRY_SIZE,	pamt_1g_entry_size),
+};
+
+static __init int get_tdx_sys_info_tdmr(struct tdx_sys_info_tdmr *tdmr)
+{
+	return read_sys_metadata_table(tdmr_mappings, tdmr);
+}
+
+static const struct field_mapping dpamt_mappings[] __initconst = {
+	TDX_SYSINFO_MAP_TDMR(PAMT_PAGE_BITMAP_ENTRY_BITS, pamt_page_bitmap_entry_bits),
+};
+
+static __init int get_tdx_sys_info_tdmr_dpamt(struct tdx_sys_info_tdmr *tdmr)
+{
+	return read_sys_metadata_table(dpamt_mappings, tdmr);
+}
+
 #include "tdx_global_metadata.c"
 
 static __init int check_features(struct tdx_sys_info *sysinfo)
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 582b6ff9a0bb..9a8c32b180e1 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -73,6 +73,14 @@
 /* Class "TDX Module Info" */
 #define TDX_MD_FIELD_ID_TDX_FEATURES0			0x0A00000300000008ULL
 
+/* Class "TDMR Info" */
+#define TDX_MD_FIELD_ID_MAX_TDMRS			0x9100000100000008ULL
+#define TDX_MD_FIELD_ID_MAX_RESERVED_PER_TDMR		0x9100000100000009ULL
+#define TDX_MD_FIELD_ID_PAMT_4K_ENTRY_SIZE		0x9100000100000010ULL
+#define TDX_MD_FIELD_ID_PAMT_2M_ENTRY_SIZE		0x9100000100000011ULL
+#define TDX_MD_FIELD_ID_PAMT_1G_ENTRY_SIZE		0x9100000100000012ULL
+#define TDX_MD_FIELD_ID_PAMT_PAGE_BITMAP_ENTRY_BITS	0x9100000000000013ULL
+
 /* TDX page types */
 #define	PT_NDA		0x0
 #define	PT_RSVD		0x1
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 615f4d23c5d8..f0673dc28cb9 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,37 +7,6 @@
  * Include this file to other C file instead.
  */
 
-static __init int get_tdx_sys_info_tdmr_dpamt(struct tdx_sys_info_tdmr *sysinfo_tdmr)
-{
-	int ret;
-	u64 val;
-
-	ret = read_sys_metadata_field(0x9100000000000013, &val);
-	if (!ret)
-		sysinfo_tdmr->pamt_page_bitmap_entry_bits = val;
-
-	return ret;
-}
-
-static __init int get_tdx_sys_info_tdmr(struct tdx_sys_info_tdmr *sysinfo_tdmr)
-{
-	int ret = 0;
-	u64 val;
-
-	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000008, &val)))
-		sysinfo_tdmr->max_tdmrs = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000009, &val)))
-		sysinfo_tdmr->max_reserved_per_tdmr = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000010, &val)))
-		sysinfo_tdmr->pamt_4k_entry_size = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000011, &val)))
-		sysinfo_tdmr->pamt_2m_entry_size = val;
-	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000012, &val)))
-		sysinfo_tdmr->pamt_1g_entry_size = val;
-
-	return ret;
-}
-
 static __init int get_tdx_sys_info_td_ctrl(struct tdx_sys_info_td_ctrl *sysinfo_td_ctrl)
 {
 	int ret = 0;
-- 
2.52.0

