Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF6318BB8
	for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075888; cv=none; b=Z3RICHEKTPd7wfUgjfj4Yj/8zv9FBALwaSqDP4GqXpYgi7ajNkWC2plFikeUzOwGut4gJ445qjc82vdHFjCkDWveRD/TwbhpDnl4RrD+Lr9H5UiLUVkIIg6tgnoyRWG76UsqWk6ZRWcth48ZEPRTTZKmn8NT/tvqk+6G7m2SAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075888; c=relaxed/simple;
	bh=VTpo5ZReKi6aUeoYA7BClj2A3JUFHeXh9bZfnZxoBwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBA0khEECoX7k1jPXb9SYK0I4kzjL8bylNHKJ1739YSd4ZYIyQuNnF4Eqt6BrXt7Zkbz0KI/Fovb73z7YWPooYigsDvPWRxaUG+0MD6BIa9EFwyVTmtLRTd655tVqdKzMQrxnwm7/zH3dhloDSSdmr2N0aCdPNnrTPWs00F5MmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=nD0osAD/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="nD0osAD/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso896275866b.2
        for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792075884; x=1792680684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYfTJ5hv9EMwutjH+FlT+/ZfnsL6STQjw/HcZoZEibo=;
        b=nD0osAD/PkA8EqkwhEi8lTbVIkpGCnP6lNFz/3f/v510KP1XMFtdOrLJMwCPnvbK8f
         mD958IbM5foubEtFwLqhvv3E0ynSC4MkWXSIz721Uer50mgdnStqEfW+maQIBa/doVg7
         rQZHZEFi0UjIdfUzD38uCleuY6M2oE8gbMiH8DLXbDIIaLRW6qqAaTsd4RISR0I6kcii
         cmmGCH/q72MibsL3838b5W5btp2IOTxyhYtXzMWVjUNaK5+X+eh2uOXpBUEFOnyEo1EV
         Pd3nV9jJPNtIxazxJeFczdcG2Ah1SYf0sL4m2Hwpla2mGYMgKkPhad37tH8i8+r9ht6A
         LT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075884; x=1792680684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYfTJ5hv9EMwutjH+FlT+/ZfnsL6STQjw/HcZoZEibo=;
        b=AvIx0hVhFySqVbBdGO5Mk/OB2xbw86kbcIW0/PGjs+j+3w38CD8zQJnmZJjz1h5aca
         vlhmKTZYDOQQWXzJFSZjnZFwNerncwZ1LPqoRH5Ha7cj08AcKpyKKgIC7YtVFjzr6nxU
         IoDRShKPyL0NErl+dnTw5Zk0YJXpqHPUX8e20kLye/r6vfJWPvMI8bvADJ3roM6UwgZi
         ZtbrcA17tYigrDAoBUGVWBgRyuWLL7gjm0BP3MsLNLxAZvQ/EDA4xnVQTEDZSS9+Y3ym
         f4DxX7SytwuWYDBDSDTuBjYSLIC6KsJlSo66/8HzAOYTMPOACfMbfA25PF7LqCFGtpJ5
         NqYg==
X-Gm-Message-State: AFq9FYK1Q1salAm+dNOLow836e3qz6CTuRU3L3ZPiEa0XcwdNvKk/eoQ
	icvj1LMkGvpJQWGD9Q6gYGU9PfGU7ATy8RxHmfIOHlsKDJJK+XASHFhRqCIJZsOo14gb+8JrQ3z
	NdNoU
X-Gm-Gg: AYBFou2ViOY/tgPwFZczKFp1h0w4i3F18tJOzjvR1aGpQh6bHy9njq6A2B/UcEhZJ+A
	1X10gG9pEOySStz7nlVS1T1Zm0I46LAFi65jW91pMX1yqpC9H2lwvQ6Y9mAFA4fqSpETEkb0hRu
	yXlKcPxA2/U/cFnP9aM+HLEPBxc8aZCg3WGjqJxBN6IBBtwUUP+6Q6BJkpSu0Tv2LC60BOAUTbo
	rOQGlAOget/ZELQw/yzGKNBQT8YcLmQz2EifSJMxzZI00rWMilcEAvS3Ls9ByNzVpgdDGHH/FN0
	WW1VviTTcvxoDrQzM5PB2oaqgBApkn18doOXlIyBI3/cmkrtHr0xwKctiGqloaYV5y7cv8PaFr7
	hhpW5Qvv6PjR0h8inTuQCMiiynQ8JcFXcCx6HBeO2/I9ic26zfx3KdeLkA6LeuhZTPvMF/4pvZF
	/rc00BjUj4QmTIfEKYHGNtgmgDYELSGoukD+l4Ly45IJ1uAI9oGzOwdKR2dbrxtkkwR3C09nnTq
	Tmpk7pY7A==
X-Received: by 2002:a17:907:948f:b0:c35:3880:773b with SMTP id a640c23a62f3a-c3538807e2bmr1079685366b.45.1792075884192;
        Thu, 15 Oct 2026 07:51:24 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3fd83464a7sm40271366b.76.2026.10.15.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:51:23 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com
Subject: [PATCH RFC 06/20] ctlv: Prepare blob descriptor validation
Date: Thu, 15 Oct 2026 16:50:39 +0200
Message-ID: <20261015145053.3664509-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015145053.3664509-1-jiri@resnulli.us>
References: <20261015145053.3664509-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Add parsing and VA checks for blob descriptors shared by schema
validation and runtime acquisition.

Keep CONFIG_CTLV unwired until dispatch completes the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/ctlv/Makefile    |   2 +-
 drivers/ctlv/blob_desc.c | 102 +++++++++++++++++++++++++++++++++++++++
 drivers/ctlv/blob_desc.h |  29 +++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ctlv/blob_desc.c
 create mode 100644 drivers/ctlv/blob_desc.h

diff --git a/drivers/ctlv/Makefile b/drivers/ctlv/Makefile
index 4f0fe41bc9e1..5edc0b4b973f 100644
--- a/drivers/ctlv/Makefile
+++ b/drivers/ctlv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += message.o
+ctlv-y += blob_desc.o message.o
diff --git a/drivers/ctlv/blob_desc.c b/drivers/ctlv/blob_desc.c
new file mode 100644
index 000000000000..b84be3d723ab
--- /dev/null
+++ b/drivers/ctlv/blob_desc.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Blob descriptor parsing and validation.
+ */
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+
+#include <uapi/linux/ctlv.h>
+#include <uapi/linux/ctlv_gen.h>
+
+#include "blob_desc.h"
+#include "message.h"
+
+static int ctlv_blob_member(u64 attr_id)
+{
+	switch (attr_id) {
+	case CTLV_ATTR_BLOB_TYPE:
+		return CTLV_BLOB_MEMBER_TYPE;
+	case CTLV_ATTR_BLOB_ADDRESS:
+		return CTLV_BLOB_MEMBER_ADDRESS;
+	case CTLV_ATTR_BLOB_FD:
+		return CTLV_BLOB_MEMBER_FD;
+	case CTLV_ATTR_BLOB_OFFSET:
+		return CTLV_BLOB_MEMBER_OFFSET;
+	case CTLV_ATTR_BLOB_LENGTH:
+		return CTLV_BLOB_MEMBER_LENGTH;
+	default:
+		return -1;
+	}
+}
+
+u32 ctlv_blob_desc_read(const struct ctlv_attr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_attr **bad)
+{
+	const struct ctlv_attr *child = NULL;
+	enum ctlv_message_step step;
+
+	*desc = (struct ctlv_blob_desc){};
+	while ((step = ctlv_message_next(blob, &child)) == CTLV_MESSAGE_STEP_ATTR) {
+		int member = ctlv_blob_member(child->attr_id);
+
+		*bad = child;
+		if (child->flags & ~CTLV_ATTR_F_NESTED)
+			return CTLV_VALIDATION_REASON_UNKNOWN_FLAG;
+		if (child->flags & CTLV_ATTR_F_NESTED)
+			return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+		if (member < 0)
+			return CTLV_VALIDATION_REASON_UNKNOWN_ATTR;
+		if (ctlv_message_attr_payload_len(child) != sizeof(u64))
+			return CTLV_VALIDATION_REASON_BAD_LENGTH;
+		if (desc->present & BIT(member))
+			return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+		desc->present |= BIT(member);
+		desc->member[member] = *(const u64 *)ctlv_message_attr_payload(child);
+	}
+	*bad = NULL;
+	if (step == CTLV_MESSAGE_STEP_BAD)
+		return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+	return 0;
+}
+
+static u32 ctlv_blob_variant(const struct ctlv_blob_desc *desc)
+{
+	u32 required = BIT(CTLV_BLOB_MEMBER_TYPE) | BIT(CTLV_BLOB_MEMBER_LENGTH);
+
+	switch (desc->member[CTLV_BLOB_MEMBER_TYPE]) {
+	case CTLV_BLOB_TYPE_VA:
+		required |= BIT(CTLV_BLOB_MEMBER_ADDRESS);
+		break;
+	default:
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	}
+	if (desc->present != required)
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	return 0;
+}
+
+u32 ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node)
+{
+	u64 start, length, end;
+	u32 reason;
+
+	reason = ctlv_blob_variant(desc);
+	if (reason)
+		return reason;
+	if (!(node->blob.backings & BIT(desc->member[CTLV_BLOB_MEMBER_TYPE])))
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+
+	length = desc->member[CTLV_BLOB_MEMBER_LENGTH];
+	if (!length || length > node->blob.max_len)
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	start = desc->member[desc->present & BIT(CTLV_BLOB_MEMBER_ADDRESS) ?
+				     CTLV_BLOB_MEMBER_ADDRESS :
+				     CTLV_BLOB_MEMBER_OFFSET];
+	if (!IS_ALIGNED(start, node->blob.alignment) || check_add_overflow(start, length, &end))
+		return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+	return 0;
+}
diff --git a/drivers/ctlv/blob_desc.h b/drivers/ctlv/blob_desc.h
new file mode 100644
index 000000000000..27f77af16f01
--- /dev/null
+++ b/drivers/ctlv/blob_desc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _CTLV_BLOB_DESC_H
+#define _CTLV_BLOB_DESC_H
+
+#include <linux/ctlv_family.h>
+#include <linux/types.h>
+
+#include <uapi/linux/ctlv.h>
+
+/* The members of a descriptor, in the order the root family declares them. */
+enum {
+	CTLV_BLOB_MEMBER_TYPE,
+	CTLV_BLOB_MEMBER_ADDRESS,
+	CTLV_BLOB_MEMBER_FD,
+	CTLV_BLOB_MEMBER_OFFSET,
+	CTLV_BLOB_MEMBER_LENGTH,
+	CTLV_BLOB_MEMBERS,
+};
+
+struct ctlv_blob_desc {
+	u64 member[CTLV_BLOB_MEMBERS];
+	u32 present;
+};
+
+u32 ctlv_blob_desc_read(const struct ctlv_attr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_attr **bad);
+u32 ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node);
+
+#endif /* _CTLV_BLOB_DESC_H */
-- 
2.56.0

