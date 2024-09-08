Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3D28DD0
	for <linux-coco@lists.linux.dev>; Sun,  8 Sep 2024 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725771474; cv=none; b=gI+yvkiQ+CqPwQH75C2XexjwXVpwXKbMwNvh15Pyz1uMvgpPMcasUJBH0NVTz0tmYNSmZWCa0/Ec6D8AIgoA9+SRTM3wA0ETvkSuhj8qyhpxAPoRsH+RU/t42F3/LrlpA6HclCDCxbcItP6anD75K3ywraIqK96KTvtfASg1raw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725771474; c=relaxed/simple;
	bh=TTfU1gIn373WQAv+wSjs1LLHvBRpR9JaaQ4A3DvKcak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUmMeg16KrZ/baTAJfPUJMkSuhDgKG2zhmK0xrgVj2e9LzRyvM7N4PemWqAMnOYf7PkzolrTlPbUzJc+6kXciocAHF+aiaUz6JwawnMv0w1Yl4geL/7bh/8h/Qb/jm7qulOjfpCXrdAW3sc8aBpjeLXrzowpRLKKVQUx6nuDniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxa+7gj4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxa+7gj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725771472; x=1757307472;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TTfU1gIn373WQAv+wSjs1LLHvBRpR9JaaQ4A3DvKcak=;
  b=mxa+7gj4XZZPJFScvoSbByOaa359t5b7ouhuI8gLm2gPQbz4D5xGm53j
   OlUER0OxPAQ4O8rkCLnzzwHu22rZlG5SdCojtjoEuFJBscWeZ011BVMQL
   YEiDGZxo7SID1Sz/L4+Hiygj3ICSzISArGqKkOdDR9T2Kg3YHROrbs+Iw
   Ol0mtBYFE+7BNnAgZpwmzku8d+MtbuvwswSeAQoE5A2pWJOR0xFUBK6WO
   XXMcWQRrR95ZDBLXwlGXi6oGG8T+Ovf44ZZUfov3Slvyr7LwPRXyxWoI9
   pIZCxfpPfyeidkFVGUwomulz8bqRyvtRYss2Eedw9tiKy5JClK6AB/wcZ
   g==;
X-CSE-ConnectionGUID: o5/atS1KT2+IhvgWqhEWxg==
X-CSE-MsgGUID: UmWrNlbKQOKEdJ8sHFPSlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35152179"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35152179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 21:57:51 -0700
X-CSE-ConnectionGUID: 07id3TQkQD6aR7ZdNXOj0w==
X-CSE-MsgGUID: B/75QyiQSmya8HRsgEZMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70924663"
Received: from ibarbour-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.116.49])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 21:57:50 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Sat, 07 Sep 2024 23:56:21 -0500
Subject: [PATCH RFC 3/3] tsm: Add TVM Measurement Sample Code
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240907-tsm-rtmr-v1-3-12fc4d43d4e7@intel.com>
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
In-Reply-To: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, 
 Samuel Ortiz <sameo@rivosinc.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Lukas Wunner <lukas@wunner.de>, 
 Dionna Amalie Glaze <dionnaglaze@google.com>, 
 Qinkun Bao <qinkun@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
X-Mailer: b4 0.13.0

This sample kernel module demonstrates how to make MRs accessible to user mode
through TSM.

Once loaded, this module registers a virtual measurement provider with the TSM
core and will result in the directory tree below.

/sys/kernel/tsm/
└── measurement-example
    ├── config_mr
    ├── full_report
    ├── report_digest
    ├── rtmr0
    │   ├── append_event
    │   ├── digest
    │   ├── event_log
    │   └── hash_algo
    ├── rtmr1
    │   ├── append_event
    │   ├── digest
    │   ├── event_log
    │   └── hash_algo
    ├── static_mr
    └── user_data

Among the MRs in this example:

- `static_mr` and `config_mr` are static MRs.
- `full_report` illustrates that a complete architecture-dependent attestation
  report structure (for instance, the `TDREPORT` structure in Intel TDX) can be
  presented as an MR.
- `user_data` represents the data provided by the software to be incorporated
  into the attestation report. Writing to this MR and then reading from
  `full_report` effectively triggers a request for an attestation report from
  the underlying CC hardware.
- `report_digest` serves as an example MR to demonstrate the use of the
  `TSM_MR_F_L` flag.
- `rtmr0` is an RTMR with `TSM_MR_F_W` **cleared**, preventing direct
  extensions; as a result, `rtmr0/digest` is read-only, and the sole method to
  extend this RTMR is by writing to `rtmr0/append_event`.
- `rtmr1` is an RTMR with `TSM_MR_F_W` **set**, permitting direct extensions;
  thus, `rtmr1/digest` is writable.

See comments in `samples/tsm/measurement-example.c` for more details.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 samples/Kconfig                   |   4 ++
 samples/Makefile                  |   1 +
 samples/tsm/Makefile              |   2 +
 samples/tsm/measurement-example.c | 116 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 123 insertions(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index b288d9991d27..8159d3ca6487 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -184,6 +184,10 @@ config SAMPLE_TIMER
 	bool "Timer sample"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
 
+config SAMPLE_TSM
+	tristate "TSM measurement sample"
+	depends on TSM_REPORTS
+
 config SAMPLE_UHID
 	bool "UHID sample"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
diff --git a/samples/Makefile b/samples/Makefile
index b85fa64390c5..891f5c12cd39 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_SAMPLE_KMEMLEAK)		+= kmemleak/
 obj-$(CONFIG_SAMPLE_CORESIGHT_SYSCFG)	+= coresight/
 obj-$(CONFIG_SAMPLE_FPROBE)		+= fprobe/
 obj-$(CONFIG_SAMPLES_RUST)		+= rust/
+obj-$(CONFIG_SAMPLE_TSM)		+= tsm/
diff --git a/samples/tsm/Makefile b/samples/tsm/Makefile
new file mode 100644
index 000000000000..3969a59221e9
--- /dev/null
+++ b/samples/tsm/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SAMPLE_TSM) += measurement-example.o
diff --git a/samples/tsm/measurement-example.c b/samples/tsm/measurement-example.c
new file mode 100644
index 000000000000..b10bda4ba1ee
--- /dev/null
+++ b/samples/tsm/measurement-example.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024 Intel Corporation. All rights reserved. */
+
+#include <linux/module.h>
+#include <linux/tsm.h>
+#include <crypto/hash_info.h>
+#include <crypto/hash.h>
+
+struct __aligned(16)
+{
+	u8 static_mr[SHA384_DIGEST_SIZE];
+	u8 config_mr[SHA512_DIGEST_SIZE];
+	u8 rtmr0[SHA256_DIGEST_SIZE];
+	u8 rtmr1[SHA384_DIGEST_SIZE];
+	u8 user_data[SHA512_DIGEST_SIZE];
+	u8 report_digest[SHA512_DIGEST_SIZE];
+}
+example_report = {
+	.static_mr = "STATIC MR",
+	.config_mr = "CONFIG MR",
+};
+
+DEFINE_FREE(shash, struct crypto_shash *,
+	    if (!IS_ERR(_T)) crypto_free_shash(_T));
+
+static int _refresh_report(struct tsm_measurement_provider *pvd,
+			   const struct tsm_measurement_register *mr)
+{
+	pr_debug(KBUILD_MODNAME ": %s(%s,%s)\n", __func__, pvd->name,
+		 mr->mr_name);
+	struct crypto_shash *tfm __free(shash) =
+		crypto_alloc_shash(hash_algo_name[HASH_ALGO_SHA512], 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+	return crypto_shash_tfm_digest(tfm, (u8 *)&example_report,
+				       offsetof(typeof(example_report),
+						report_digest),
+				       example_report.report_digest);
+}
+
+static int _extend_mr(struct tsm_measurement_provider *pvd,
+		      const struct tsm_measurement_register *mr, const u8 *data)
+{
+	SHASH_DESC_ON_STACK(desc, 0);
+	int rc;
+
+	pr_debug(KBUILD_MODNAME ": %s(%s,%s)\n", __func__, pvd->name,
+		 mr->mr_name);
+
+	desc->tfm = crypto_alloc_shash(hash_algo_name[mr->mr_hash], 0, 0);
+	if (IS_ERR(desc->tfm))
+		return PTR_ERR(desc->tfm);
+
+	BUG_ON(crypto_shash_digestsize(desc->tfm) != mr->mr_size);
+
+	rc = crypto_shash_init(desc);
+	if (!rc)
+		rc = crypto_shash_update(desc, mr->mr_value, mr->mr_size);
+	if (!rc)
+		rc = crypto_shash_finup(desc, data, mr->mr_size, mr->mr_value);
+
+	crypto_free_shash(desc->tfm);
+	return rc;
+}
+
+#define MR_(mr) #mr, &example_report.mr, sizeof(example_report.mr), TSM_MR_F_R
+static const struct tsm_measurement_register example_mrs[] = {
+	/* the entire report can be considered as a LIVE MR */
+	{ "full_report", &example_report, sizeof(example_report),
+	  TSM_MR_F_LIVE },
+	/* static MR, read-only */
+	{ MR_(static_mr) },
+	/* config MR, read-only */
+	{ MR_(config_mr) },
+	/* RTMR, direct extension prohibited */
+	{ MR_(rtmr0) | TSM_MR_F_RTMR, HASH_ALGO_SHA256 },
+	/* RTMR, direct extension allowed */
+	{ MR_(rtmr1) | TSM_MR_F_RTMR | TSM_MR_F_W, HASH_ALGO_SHA384 },
+	/* most CC archs allow including user data in attestation */
+	{ MR_(user_data) | TSM_MR_F_W },
+	/* LIVE MR example, usually doesn't exist in real CC arch */
+	{ MR_(report_digest) | TSM_MR_F_L },
+	/* terminating NULL entry */
+	{}
+};
+#undef MR_
+
+static struct tsm_measurement_provider example_measurement_provider = {
+	.name = "measurement-example",
+	.mrs = example_mrs,
+	.refresh = _refresh_report,
+	.extend = _extend_mr,
+};
+
+static int __init measurement_example_init(void)
+{
+	int rc = tsm_register_measurement_provider(
+		&example_measurement_provider);
+	pr_debug(KBUILD_MODNAME ": tsm_register_measurement_provider(%p)=%d\n",
+		 &example_measurement_provider, rc);
+	return rc;
+}
+
+static void __exit measurement_example_exit(void)
+{
+	int rc = tsm_unregister_measurement_provider(
+		&example_measurement_provider);
+	pr_debug(KBUILD_MODNAME
+		 ": tsm_unregister_measurement_provider(%p)=%d\n",
+		 &example_measurement_provider, rc);
+}
+
+module_init(measurement_example_init);
+module_exit(measurement_example_exit);
+
+MODULE_LICENSE("GPL");

-- 
2.43.0

