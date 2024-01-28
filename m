Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA33C470
	for <linux-coco@lists.linux.dev>; Sun, 28 Jan 2024 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706477246; cv=none; b=JbiF3WlnnI1RmVqoJmNinKW3Z8DCmG8EaZA/PJO/J150zzEFpD/m6kNGdOd9Gsq2xEHzZgNs80mIvOgbEWu+ccFWXkg3rWdd2z+IFxGGfkM4OSOD9tjTSx4IvESYE3keVrkw2Rpqav2L8czZ6A+GNd2MNho7nPB+cWXMp3f8X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706477246; c=relaxed/simple;
	bh=iAvElGpmB/Rvg9W98fx+iYhTPLkcxixxyEQE/0lymRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4T5tlAxNWfmBgQyEOfYeNxuiqiCk0xZBiIvlIXb4aHF846AVpNliagEz19dV1sLrzY0p3r4gU81jnwl2avwUSrfamFU3L9Ymwl+UyP82cCkQkHNKBZvWI4Ghx12SsexZBT0rsYQcGzUCHFqKTAg/yv3A9vSDWy6HgT35XvFt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zqcDR4v5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zqcDR4v5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e775695c6so18493935e9.3
        for <linux-coco@lists.linux.dev>; Sun, 28 Jan 2024 13:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706477241; x=1707082041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAdowOYiNk9LMfv+UynB8I9wUbUzkvAgTWLx2oynNk0=;
        b=zqcDR4v53I/V9P1Ww6U3cXWgEhAgc9TwXbKVuvuodtvNhcdmU4IB8S1s44/eh+n0mK
         GFEHnfq7iJFejr8xGjcJ8bnUBqpWNUJ35F3Wk+2Qjt8bz4BfhEGiJRA6X4D00l8tnYnI
         TCZAibi+YVvtFEBGdovtYhV9c7I7oS1TNHNtUjmfXiXpeplfMQ9lBT4KYkGEYGVvUK6H
         rZcn074LnwWayROMUhHlI06MmLR4jel2JUMBwTSDn2lU/G0++md1j4mtwtfVzVZSJwN+
         QLZDqLMPO31rVrIXhurFNcbGBGuRHCmU24fiEqgK1kzKdWk66Hf2hjRtLp9USrca75HJ
         9Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706477241; x=1707082041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAdowOYiNk9LMfv+UynB8I9wUbUzkvAgTWLx2oynNk0=;
        b=uSLsyQvaIalUx6k3z+ekTeujA3hcUhf73G1z7Dho9E1r0T57ERGpdaYbyZzBFAOG56
         tmosVPzWYtVIrESGHfRlcGitStXTrn8+cWWiIabVXEKZfWXSQfW77i9LKaCTX3GK0lli
         Q9r+rC8mpgDcMAoYYKJplGNWmIm2i2UvkPJxcmnDzrKOEDvp5RMRnRK2quq7XVMN3Psl
         rqmmnRSLB76qezQXjGmCGHAEZoiipbVVe9rrwgYn2t+0K02CyA+8aCrrb/Ll7vhppofA
         3PLyclzw2qdSSn+M7hH6ayDb02M5rZdknf8aMI7aFuQnMngTzJjpLs5cL45acpNTmOeU
         1JnQ==
X-Gm-Message-State: AOJu0Yxj7YiT0LqzigAdi6zZETnznUh11Pg++7Se754pLKXqBwl7GtX4
	DXM1FwutEqz+oTUYoq3I1wadB5H7Ug4iTSTxm1lBalzy4wHFMM80C2mFDzq7pRw=
X-Google-Smtp-Source: AGHT+IG11VpZM9f0yxDJuq8DM4wLRKDiN+1lAEjzdzfh9r9Cl/M6Y5bSwrD4NhvWpmwjeSFcK4Shhg==
X-Received: by 2002:a05:600c:4715:b0:40e:bed4:4d07 with SMTP id v21-20020a05600c471500b0040ebed44d07mr4395060wmo.8.1706477240534;
        Sun, 28 Jan 2024 13:27:20 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b0040d62f89381sm8218208wmo.35.2024.01.28.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 13:27:20 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Qinkun Bao <qinkun@google.com>,
	"Yao, Jiewen" <jiewen.yao@intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	biao.lu@intel.com,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/4] tsm: Runtime measurement register support
Date: Sun, 28 Jan 2024 22:25:20 +0100
Message-ID: <20240128212532.2754325-2-sameo@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240128212532.2754325-1-sameo@rivosinc.com>
References: <20240128212532.2754325-1-sameo@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some confidential computing architecture (Intel TDX, ARM-CCA, RISC-V
CoVE) provide the TVM (confidential computing guest) with a set of
runtime measurement registers (RTMR). TVMs can extend those registers
with their measurements at runtime, i.e. after the TVM initial
measurements are finalized and the TVM actually runs.

RTMRs are separated from the initial measurement registers set, and TSMs
typically includes RTMR values into a distinct section of their signed
attestion reports.

We add support for extending and reading a TSM runtime measurement
registers by extending the TSM ops structure with resp. an rtmr_extend()
and an rtmr_read() function pointers. TSM providers/backends will
implement those ops if they are capable of exposing RTMRs to their
TVMs. This capability is now described by a tsm_capabilites structure,
passed by the TSM provider to the TSM framework at registration time.

TVMs can configure, extend and read RTMRs from the configfs-tsm interface.

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 drivers/virt/coco/tsm.c | 80 +++++++++++++++++++++++++++++++++++++++++
 include/linux/tsm.h     | 39 +++++++++++++++++++-
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index d1c2db83a8ca..1a8c3c096120 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
+#include <linux/tpm.h>
 
 static struct tsm_provider {
 	const struct tsm_ops *ops;
@@ -50,6 +51,85 @@ enum tsm_data_select {
 	TSM_CERTS,
 };
 
+/**
+ * DOC: Trusted Security Module (TSM) Runtime Measurement Register (RTMR) Interface
+ *
+ * The TSM RTMR interface is a common ABI for allowing TVMs to extend
+ * and read measurement registers at runtime, i.e. after the TVM initial
+ * measurement is finalized. TSMs that support such capability will typically
+ * include all runtime measurement registers values into their signed
+ * attestation report, providing the TVM post-boot measurements to e.g. remote
+ * attestation services.
+ *
+ * A TVM uses the TSM RTMR configfs ABI to create all runtime measurement
+ * registers (RTMR) that it needs. Each created RTMR must be configured first
+ * before being readable and extensible. TVM configures an RTMR by setting its
+ * index and optionally by mapping it to one or more TCG PCR indexes.
+ *
+ * A TSM backend statically declares the number of RTMRs it supports and which
+ * hash algorithm must be used when extending them. This declaration is done
+ * through the tsm_capabilities structure, at TSM registration time (see
+ * tsm_register()).
+ */
+
+/**
+ * struct tsm_rtmr_state - tracks the state of a TSM RTMR.
+ * @index: The RTMR hardware index.
+ * @alg: The hash algorithm used for this RTMR.
+ * @digest: The RTMR cached digest value.
+ * @cached_digest: Is the RTMR cached digest valid or not.
+ * @cfg: The configfs item for this RTMR.
+ */
+struct tsm_rtmr_state {
+	u32 index;
+	enum hash_algo alg;
+	u8 digest[TSM_DIGEST_MAX];
+	bool cached_digest;
+	struct config_item cfg;
+};
+
+static bool is_rtmr_configured(struct tsm_rtmr_state *rtmr_state)
+{
+	return rtmr_state->index != U32_MAX;
+}
+
+/**
+ * struct tsm_rtmrs_state - tracks the state of all RTMRs for a TSM.
+ * @rtmrs: The array of all created RTMRs.
+ * @tcg_map: A mapping between TCG PCR and RTMRs, indexed by PCR indexes.
+ * Entry `i` on this map points to an RTMR that covers TCG PCR[i] for the TSM
+ * hash algorithm.
+ * @group: The configfs group for a TSM RTMRs.
+ */
+static struct tsm_rtmrs_state {
+	struct tsm_rtmr_state **rtmrs;
+	const struct tsm_rtmr_state *tcg_map[TPM2_PLATFORM_PCR];
+	struct config_group *group;
+} *tsm_rtmrs;
+
+static int tsm_rtmr_read(struct tsm_provider *tsm, u32 idx,
+			 u8 *digest, size_t digest_size)
+{
+	if (tsm->ops && tsm->ops->rtmr_read)
+		return tsm->ops->rtmr_read(idx, digest, digest_size);
+
+	return -ENXIO;
+}
+
+static int tsm_rtmr_extend(struct tsm_provider *tsm, u32 idx,
+			   const u8 *digest, size_t digest_size)
+{
+	if (tsm->ops && tsm->ops->rtmr_extend)
+		return tsm->ops->rtmr_extend(idx, digest, digest_size);
+
+	return -ENXIO;
+}
+
+static struct tsm_rtmr_state *to_tsm_rtmr_state(struct config_item *cfg)
+{
+	return container_of(cfg, struct tsm_rtmr_state, cfg);
+}
+
 static struct tsm_report *to_tsm_report(struct config_item *cfg)
 {
 	struct tsm_report_state *state =
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index de8324a2223c..a546983c24fc 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -2,11 +2,13 @@
 #ifndef __TSM_H
 #define __TSM_H
 
+#include <crypto/hash_info.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
 #define TSM_INBLOB_MAX 64
 #define TSM_OUTBLOB_MAX SZ_32K
+#define TSM_DIGEST_MAX SHA512_DIGEST_SIZE
 
 /*
  * Privilege level is a nested permission concept to allow confidential
@@ -42,12 +44,44 @@ struct tsm_report {
 	u8 *auxblob;
 };
 
+#define TSM_MAX_RTMR 32
+
+/**
+ * struct tsm_rtmr_desc - Describes a TSM Runtime Measurement Register (RTMR).
+ * @hash_alg: The hash algorithm used to extend this runtime measurement
+ *            register.
+ * @tcg_pcr_mask: A bit mask of all TCG PCRs mapped to this RTMR.
+ */
+struct tsm_rtmr_desc {
+	enum hash_algo hash_alg;
+	unsigned long tcg_pcr_mask;
+};
+
+/**
+ * struct tsm_capabilities - Describes a TSM capabilities.
+ * @num_rtmrs: The number of Runtime Measurement Registers (RTMR) available from
+ *             a TSM.
+ * @rtmr_hash_alg: The hash algorithm used to extend a runtime measurement
+ *                 register.
+ */
+struct tsm_capabilities {
+	size_t num_rtmrs;
+	const struct tsm_rtmr_desc *rtmrs;
+};
+
 /**
  * struct tsm_ops - attributes and operations for tsm instances
  * @name: tsm id reflected in /sys/kernel/config/tsm/report/$report/provider
  * @privlevel_floor: convey base privlevel for nested scenarios
+ * @capabilities: Describe the TSM capabilities, e.g. the number of available
+ *                runtime measurement registers (see `struct tsm_capabilities`).
  * @report_new: Populate @report with the report blob and auxblob
- * (optional), return 0 on successful population, or -errno otherwise
+ *              (optional), return 0 on successful population, or -errno
+ *              otherwise
+ * @rtmr_extend: Extend an RTMR with the provided digest.
+ *               Return 0 on successful extension, or -errno otherwise.
+ * @rtmr_read: Reads the value of an RTMR.
+ *             Return the number of bytes read or -errno for errors.
  *
  * Implementation specific ops, only one is expected to be registered at
  * a time i.e. only one of "sev-guest", "tdx-guest", etc.
@@ -55,7 +89,10 @@ struct tsm_report {
 struct tsm_ops {
 	const char *name;
 	const unsigned int privlevel_floor;
+	const struct tsm_capabilities capabilities;
 	int (*report_new)(struct tsm_report *report, void *data);
+	int (*rtmr_extend)(u32 idx, const u8 *digest, size_t digest_size);
+	ssize_t (*rtmr_read)(u32 idx, u8 *digest, size_t digest_size);
 };
 
 extern const struct config_item_type tsm_report_default_type;
-- 
2.42.0

