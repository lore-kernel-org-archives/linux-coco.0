Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D68476043
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798632; cv=none; b=nVhUQ3Ua/C1dDc1okoydhkVhWCMpzPrgYre04GVVHFPf8fm4RAdrdR3PADOr4Ynp5YzpmLNRFdKFDfZX1ZGt/YdBIOAjlJ5Y5ZBA0zZrarYsi8GByJfjNPG03R0fGct58877ybcg1HOZC6uklvi4uNE8NpXUQql80FcPSJTk6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798632; c=relaxed/simple;
	bh=0oRDAGcO5Tk4l9FF7dbhyKsOR9wAENUL12Zm1+PwymI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=An6Uz/1C4GdJqmCsr0cfIBp99kbgUSVed7X6vh3ml1cbJWZ220Z8/IVJisXn9dfd0jS0V7y3ghBp6nAU+PMbdRXtAtvhsVppPStX2X4XmBhNvoFdmWJz4K/YkkfqLUNhBzSIJidOGdZ5YxMc69GCNsDyugSJrq7UE6OHVJE0fqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ff9Ndd7x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ff9Ndd7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791798626; x=1823334626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0oRDAGcO5Tk4l9FF7dbhyKsOR9wAENUL12Zm1+PwymI=;
  b=ff9Ndd7xx7lhON4VRglgKdtDM8SbucD9QiBMtyzXPWFqtEW2H3w1qC3C
   0qMkVp6hPZpzpTS3IXTxXvQpIfe777ngMJULaUNwHH7Ut0nitqlDjIiDG
   SAPFPIMbSM04BN1UvH91kPl58i9dWaAOr2rv9uNtufxQXVMcT55IBD7Fq
   0Gpoc0yb/o5NScKyts31M0Etdf1OjCgQmpZy84ouGednWJQiR5wG4TjnQ
   4OH6drmESvsjc7CeEEX88d1QhO+4CT+Xu25WulFqLjSd1G7W/AFTONkwn
   mYTIETo7MQ2rqylu9c5IpQABCGNqBy2L8Pq/VZioro/nK3mIjdQOTO9qk
   A==;
X-CSE-ConnectionGUID: zpGV55CaQq+QFUS14/9UuA==
X-CSE-MsgGUID: EqbgbF0CTGeWwYB2UwZDzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="388014"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="388014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 02:50:22 -0700
X-CSE-ConnectionGUID: yF2ODxRWT2+fdb5nsrexFg==
X-CSE-MsgGUID: U3rc8xWTS8yY4iA5aW+Mfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="776847"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 02:50:22 -0700
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
Subject: [PATCH v4 04/10] x86/virt/tdx: Convert the tdmr metadata reader
Date: Mon, 12 Oct 2026 02:47:31 -0700
Message-ID: <20261012094754.27702-5-chao.gao@intel.com>
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
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
v4:
 - Collect tags [Rick]
 - Drop per-class macros [Nikolay, Dave]
---
 arch/x86/virt/vmx/tdx/tdx.c                 | 14 +++++++++
 arch/x86/virt/vmx/tdx/tdx.h                 |  8 +++++
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 35 ++-------------------
 3 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 9f17c52c026a..8dcd8b6ca3a2 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -447,6 +447,20 @@ static const struct field_mapping features_mappings[] __initconst = {
 	FIELD_MAP(TDX_FIELD_TDX_FEATURES0, features, tdx_features0),
 };
 
+static const struct field_mapping tdmr_mappings[] __initconst = {
+	FIELD_MAP(TDX_FIELD_MAX_TDMRS,		tdmr, max_tdmrs),
+	FIELD_MAP(TDX_FIELD_PAMT_4K_ENTRY_SIZE,	tdmr, pamt_4k_entry_size),
+	FIELD_MAP(TDX_FIELD_PAMT_2M_ENTRY_SIZE,	tdmr, pamt_2m_entry_size),
+	FIELD_MAP(TDX_FIELD_PAMT_1G_ENTRY_SIZE,	tdmr, pamt_1g_entry_size),
+	FIELD_MAP(TDX_FIELD_MAX_RESERVED_PER_TDMR,
+		  tdmr, max_reserved_per_tdmr),
+};
+
+static const struct field_mapping dpamt_mappings[] __initconst = {
+	FIELD_MAP(TDX_FIELD_PAMT_PAGE_BITMAP_ENTRY_BITS,
+		  tdmr, pamt_page_bitmap_entry_bits),
+};
+
 #include "tdx_global_metadata.c"
 
 static __init int check_features(struct tdx_sys_info *sysinfo)
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 87e055a2546c..4faf07925dc0 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -65,6 +65,14 @@
 /* Class "TDX Module Info" */
 #define TDX_FIELD_TDX_FEATURES0			0x0A00000300000008ULL
 
+/* Class "TDMR Info" */
+#define TDX_FIELD_MAX_TDMRS			0x9100000100000008ULL
+#define TDX_FIELD_MAX_RESERVED_PER_TDMR		0x9100000100000009ULL
+#define TDX_FIELD_PAMT_4K_ENTRY_SIZE		0x9100000100000010ULL
+#define TDX_FIELD_PAMT_2M_ENTRY_SIZE		0x9100000100000011ULL
+#define TDX_FIELD_PAMT_1G_ENTRY_SIZE		0x9100000100000012ULL
+#define TDX_FIELD_PAMT_PAGE_BITMAP_ENTRY_BITS	0x9100000000000013ULL
+
 /* TDX page types */
 #define	PT_NDA		0x0
 #define	PT_RSVD		0x1
diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 62c24dda0ca9..0d47ac3335f7 100644
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
@@ -111,7 +80,7 @@ static __init int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 		sysinfo->version.update_version);
 
 	ret = ret ?: read_sys_metadata_table(features_mappings, &sysinfo->features);
-	ret = ret ?: get_tdx_sys_info_tdmr(&sysinfo->tdmr);
+	ret = ret ?: read_sys_metadata_table(tdmr_mappings, &sysinfo->tdmr);
 	ret = ret ?: get_tdx_sys_info_td_ctrl(&sysinfo->td_ctrl);
 	ret = ret ?: get_tdx_sys_info_td_conf(&sysinfo->td_conf);
 
@@ -122,7 +91,7 @@ static __init int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
 	 * DPAMT but don't expose the metadata.
 	 */
 	if (!ret && tdx_supports_dynamic_pamt(sysinfo))
-		ret = get_tdx_sys_info_tdmr_dpamt(&sysinfo->tdmr);
+		ret = read_sys_metadata_table(dpamt_mappings, &sysinfo->tdmr);
 
 	return ret;
 }
-- 
2.52.0

