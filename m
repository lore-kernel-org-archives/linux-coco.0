Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E6258CE7
	for <linux-coco@lists.linux.dev>; Mon, 17 Nov 2025 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347109; cv=none; b=X4JluXtDJrY3eEka18sxIK6e+SkcKW24SXNB9L2co2YzGqEKBo5nwcCDJ4TN6ylKkGr8lq8o+xYvWuOz5ke4Hk8jW1NcoFB3Mzy7ftMd+VG3pZvGp2XHBw33DbNZ8KbwhsMx1ZrFCREhQ/905keOWCdgbQuwoLYRnLnVWm5JABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347109; c=relaxed/simple;
	bh=q+8YG5wvhUNTkFQsn+oDvkGFn15zsRWkS62GXdMz8vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pidFxbSDoDC69PZFuoY+EFZ5e09UKTg4E6uon6HCrKHYHfeYNYwylA+uy1cqyLG0kkjY901oDOcbyGnVinABeRmHKNj/9Do3Alm94s5OU4hdQufWQUECqR24baJosu/6/JzLIwDJTU3HReHdhz4p0C81VUzmYUanpuP549Ov9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVxqPpV1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVxqPpV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763347109; x=1794883109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q+8YG5wvhUNTkFQsn+oDvkGFn15zsRWkS62GXdMz8vg=;
  b=YVxqPpV10Bkk6h/fLZiaVmkwc0uTOaHYf5B7mP4VmjGe54byWBdqu0wM
   1GGXvER1nNKYBgLmSsO74w3L5jhp+wJqT40BrUrd2CLVrv7XUc5t5w741
   vTEVGy5i+Q+RuwlsORq8J1Fcq6anoZfPhrGZJTPmMVj2ZwD9tuyeDcVo+
   4vIoDutjUqW2T8n6OQDwHpGTff1f4u8alLzy09UwR7UHbTJGB+FRYxT/8
   rsvvg9HB3awGVXURy73c/NLlEnjIViwYpae79Lr333RyY67LT4c6ACqd+
   V9CHroyjna1t4gov0Y1dj6kO1cO2eyCwTMxr++n8AD3bK/5gYPN9Hb7re
   g==;
X-CSE-ConnectionGUID: BDWc63jqRE6qwSrfIL4IbQ==
X-CSE-MsgGUID: 2rE9Zn/uSuiJC11kRwaLew==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82729531"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82729531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 18:38:29 -0800
X-CSE-ConnectionGUID: HNb9RiKnR1Spk4nYLSjOdg==
X-CSE-MsgGUID: 3BPABotWQjqUoaPwa/2VFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="227658254"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2025 18:38:24 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: chao.gao@intel.com,
	dave.jiang@intel.com,
	baolu.lu@linux.intel.com,
	yilun.xu@linux.intel.com,
	yilun.xu@intel.com,
	zhenzhong.duan@intel.com,
	kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com,
	dave.hansen@linux.intel.com,
	dan.j.williams@intel.com,
	kas@kernel.org,
	x86@kernel.org
Subject: [PATCH v1 09/26] ACPICA: Add KEYP table definition
Date: Mon, 17 Nov 2025 10:22:53 +0800
Message-Id: <20251117022311.2443900-10-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Jiang <dave.jiang@intel.com>

ACPICA commit af970172e2dde62d1ab8ba1429c97339ef3c6c23

Software uses this table to discover the base address of the Key
Configuration Unit (KCU) register block associated with each IDE capable
host bridge.

[1]: Root Complex IDE Key Configuration Unit Software Programming Guide
     https://cdrdv2.intel.com/v1/dl/getContent/732838

Link: https://github.com/acpica/acpica/commit/af970172
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 include/acpi/actbl2.h | 59 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index f726bce3eb84..4040e4df051b 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -32,6 +32,7 @@
 #define ACPI_SIG_ERDT           "ERDT"	/* Enhanced Resource Director Technology */
 #define ACPI_SIG_IORT           "IORT"	/* IO Remapping Table */
 #define ACPI_SIG_IVRS           "IVRS"	/* I/O Virtualization Reporting Structure */
+#define ACPI_SIG_KEYP           "KEYP"	/* Key Programming Interface for IDE */
 #define ACPI_SIG_LPIT           "LPIT"	/* Low Power Idle Table */
 #define ACPI_SIG_MADT           "APIC"	/* Multiple APIC Description Table */
 #define ACPI_SIG_MCFG           "MCFG"	/* PCI Memory Mapped Configuration table */
@@ -1065,6 +1066,64 @@ struct acpi_ivrs_memory {
 	u64 memory_length;
 };
 
+/*******************************************************************************
+ *
+ * KEYP - Key Programming Interface for Root Complex Integrity and Data
+ *        Encryption (IDE)
+ *        Version 1
+ *
+ * Conforms to "Key Programming Interface for Root Complex Integrity and Data
+ * Encryption (IDE)" document. See under ACPI-Related Documents.
+ *
+ ******************************************************************************/
+struct acpi_table_keyp {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 reserved;
+};
+
+/* KEYP common subtable header */
+
+struct acpi_keyp_common_header {
+	u8 type;
+	u8 reserved;
+	u16 length;
+};
+
+/* Values for Type field above */
+
+enum acpi_keyp_type {
+	ACPI_KEYP_TYPE_CONFIG_UNIT = 0,
+};
+
+/* Root Port Information Structure */
+
+struct acpi_keyp_rp_info {
+	u16 segment;
+	u8 bus;
+	u8 devfn;
+};
+
+/* Key Configuration Unit Structure */
+
+struct acpi_keyp_config_unit {
+	struct acpi_keyp_common_header header;
+	u8 protocol_type;
+	u8 version;
+	u8 root_port_count;
+	u8 flags;
+	u64 register_base_address;
+	struct acpi_keyp_rp_info rp_info[];
+};
+
+enum acpi_keyp_protocol_type {
+	ACPI_KEYP_PROTO_TYPE_INVALID = 0,
+	ACPI_KEYP_PROTO_TYPE_PCIE,
+	ACPI_KEYP_PROTO_TYPE_CXL,
+	ACPI_KEYP_PROTO_TYPE_RESERVED
+};
+
+#define ACPI_KEYP_F_TVM_USABLE      (1)
+
 /*******************************************************************************
  *
  * LPIT - Low Power Idle Table
-- 
2.25.1

