Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585349;
	b=Wm3a6Ck1jCiH9EVWBemZ51qrG1MX/r0NOQnHVC5FsMy4RAJkXX1l9hhWnbHjKDSzYozI
	 uLNpbV63b9KF+t7CMUNVVdDHOr640rz/gMzNrZVr3GoXDnOIPB+3kUXgttH8gijyLpVN5
	 SAtfdIEHG9gLHRQ+L4HAAWZdppSs7zOQwTvbqbL6kOyU+WA/4veKxWc7zYBsLgFgSS3Rn
	 7VRXHfXQ4itM/2wC7Fn9CR7BY5ohEv8hanFXpR9lkl0Ixh+jaI82rKIMWqmitvoz6gh+I
	 mjzQooT7GIRJUdEuJ7JOdLmCjbz3w2guJkzqmgjpYtH0KrMyMI9u7YTIKn2dkVx61CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
	b=Dhh1650lfRKKtHJ9cu8mXg1pRVsjqHVbPNPhvC+OimTs9Xd02SWae5aS1ci/uASmChAP
	 N+sRttae8BKBLKb//55C3MIkBRhQcLqHUrXO/RYlG9s32b5RorX7MeClS4bwLYwZ88+/3
	 B8ny4zL0NbG+laOrntoHjU7jAVFymZoROPDoSSeuu4RP/5UyXxs156cV3/lKLVx8btmjI
	 jbjS59XGk7h/f+2FH9S+O2O5WQ6l6gqxKTxMk2CbZKCICH3xYoA0B3sEH9lMU3awnAzUi
	 icMyp+R3E7+rESVKkcXDs3YDEDv31qo3FSKxIW2p+Rg5L7fTsi2iMnEdLiuO7PKAvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=OVgmeEak;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DFA60A382C
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DFA60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=OVgmeEak
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1689170a12.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794585348; x=1795190148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=OVgmeEakTXagMrf7KCxMSasBALinSfICSlO9a3tuupj7TnQ1kxqnPiwaS1OCg6wkpI
         SdVr7zTCzRVAGQDIwVPRITf2Bz/5g4VoEPRJIPtusUxlIo414HtQ5gAPdRWQ7LVpeneX
         slsHn8tFnM1Y22s+kw+XjYdwYPAaHvxyyoFxhTq168iqtL+uXAkKvOaLXT/fctikvIUH
         9jacPAcqDv6wKS7SwfZHubtAbHQJRmQNntm3CcG9KAfnO2Z18XomJqYgwFaI4gbM64x6
         wsj02R4YdTGcA3EU9UJ7Uv/wDAX2DU9I1RwZ8w5GG5gmXKOKcG+XpXbHLSJubH6HX9is
         WzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585348; x=1795190148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxvTir9QXhDFYqOHYJz6yAUDC5oR63nA97+1lOlMaoA=;
        b=AovAMUQM15svG4Ot16BMNHHdT8OnGduyCnCBKQRRFvOb/HLil1dgBhPRUJQ3owovEZ
         RoQ3lLuz2a/IUXrWLZnu52Mo3ugJb2sjUKFikUVC4XzKGmDy6zNxG9+Sdch4rWQULe9U
         +S312mkekZ01Ijq8dReLIOTKjF96WbdCdIR1DkmTYN6zWYTBul7YZTA/iz4SLys8TWh6
         yf0D7FEK5tXMItZs/hlQ9IvZAMRinKLnrs+mPCVslPD3gfwGJ8K7VxVNzrKGhpY/F9lI
         WJ0nlnc4g06Y0eLAmT/ho30Tq1bg1us1CW7Oq4YpWoSkFgg1YbDmlRdiNSlJ/3n7DLYY
         q9pA==
X-Gm-Message-State: APuU4Z+K7tM292Gusv3PrJtHs6qGi10GPRsoyaIyqR+oV/lQK2IsguM4
	0WRyUqVLVEs8SKcB855VhdUglCUUH0ov9rYNcr5Je8hpFX+0pXIAgQaE1lIXIu/GJZBBgRQ+9ch
	isSBK
X-Gm-Gg: AYBFou2U431vbkkktCdHgs7ba0qVZIMRhVl8rOe1ngdZl4RhfiEkgVfiAEB4Z3HWawG
	ZLoIpqZe8hZZucQg/VZ6xojXZje+VsXTVt3Y7rlqB2IB4RHhI7E7HkaBwe5gwrUVsFSyyLEnmtg
	/hANlXZrnQkhSR6TgzkI4JKyKKSROoAsnyng7p9t3jFpGLj9VzX+vnir7gL6Ct+koDdcYpWsjAi
	P1hDStHI8KMe0AKwpsJTgsMEr6sg4fJEOmweS45dzz8e3BgWD/4ri74QFcxy1dDTWkGUrb8C6cU
	3mTR8GmSuNzXDF2aizAPCGX1OGzWrRJ8oAZ2tOc6WX8p/pt7CE8rJhD/oHb5+62TkGKw9YeGGV9
	KtQb6yCEWrw50NMFT3C0xQCT2cF4YaHtEoXiR6nq0UWB1U7J++Xm2wm4TWw+MrTq0bQGi0+aCim
	qSe1xvmtWxNXABXbvdDevNYYArJswjT3DtPaQ2OKBERuY4REbxJ90oJEqR6gBvCJiRgLafXDdup
	Tkc8ZlXEVgLJtE2N4NefVhjJVh8SbM1gWAd4fBNrHKE3T8GQHtis0TSGJXP1SOxSSbrcTtYAjNC
	6rGmVvXv3HLR5hAA4XLFV+jGNYY2xlpAJEDhqUuqbxoPnfnBsVSkGrl3CMG8
X-Received: by 2002:a17:906:c151:b0:c42:102f:15d3 with SMTP id a640c23a62f3a-c5096541a80mr254985966b.34.1794585347782;
        Fri, 13 Nov 2026 07:55:47 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm115330066b.76.2026.11.13.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:55:46 -0800 (PST)
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
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 06/15] ctlv: Prepare blob descriptor validation
Date: Fri, 13 Nov 2026 16:55:05 +0100
Message-ID: <20261113155515.2510194-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113155515.2510194-1-jiri@resnulli.us>
References: <20261113155515.2510194-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Add parsing and VA checks for blob descriptors shared by schema
validation and runtime acquisition.

Keep CONFIG_CTLV unwired until dispatch completes the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- returned EOVERFLOW for a blob range that wraps
- said TLV, type, record and field instead of attr
- said record instead of nest, the root being one
- numbered every enum member
- took the UAPI headers from include/uapi/ctlv/
- moved to lib/ctlv/
---
 lib/ctlv/Makefile    |   2 +-
 lib/ctlv/blob_desc.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 lib/ctlv/blob_desc.h |  29 +++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 lib/ctlv/blob_desc.c
 create mode 100644 lib/ctlv/blob_desc.h

diff --git a/lib/ctlv/Makefile b/lib/ctlv/Makefile
index 4f0fe41bc9e1..5edc0b4b973f 100644
--- a/lib/ctlv/Makefile
+++ b/lib/ctlv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += message.o
+ctlv-y += blob_desc.o message.o
diff --git a/lib/ctlv/blob_desc.c b/lib/ctlv/blob_desc.c
new file mode 100644
index 000000000000..7c68ef5702fd
--- /dev/null
+++ b/lib/ctlv/blob_desc.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Blob descriptor parsing and validation.
+ */
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/overflow.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+#include <uapi/ctlv/ctlv_gen.h>
+
+#include "blob_desc.h"
+#include "message.h"
+
+static int ctlv_blob_member(u64 type)
+{
+	switch (type) {
+	case CTLV_T_BLOB_TYPE:
+		return CTLV_BLOB_MEMBER_TYPE;
+	case CTLV_T_BLOB_ADDRESS:
+		return CTLV_BLOB_MEMBER_ADDRESS;
+	case CTLV_T_BLOB_FD:
+		return CTLV_BLOB_MEMBER_FD;
+	case CTLV_T_BLOB_OFFSET:
+		return CTLV_BLOB_MEMBER_OFFSET;
+	case CTLV_T_BLOB_LENGTH:
+		return CTLV_BLOB_MEMBER_LENGTH;
+	default:
+		return -1;
+	}
+}
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad)
+{
+	const struct ctlv_hdr *child = NULL;
+	enum ctlv_message_step step;
+
+	*desc = (struct ctlv_blob_desc){};
+	while ((step = ctlv_message_next(blob, &child)) == CTLV_MESSAGE_STEP_TLV) {
+		int member = ctlv_blob_member(child->type);
+
+		*bad = child;
+		if (child->flags & ~CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_UNKNOWN_FLAG;
+		if (child->flags & CTLV_HDR_F_RECORD)
+			return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+		if (member < 0)
+			return CTLV_VALIDATION_REASON_UNKNOWN_TYPE;
+		if (ctlv_message_hdr_payload_len(child) != sizeof(u64))
+			return CTLV_VALIDATION_REASON_BAD_LENGTH;
+		if (desc->present & BIT(member))
+			return CTLV_VALIDATION_REASON_BAD_BLOB_DESCRIPTOR;
+		desc->present |= BIT(member);
+		desc->member[member] = *(const u64 *)ctlv_message_hdr_payload(child);
+	}
+	*bad = NULL;
+	if (step == CTLV_MESSAGE_STEP_BAD)
+		return CTLV_VALIDATION_REASON_MALFORMED_MESSAGE;
+	return 0;
+}
+
+static bool ctlv_blob_variant_ok(const struct ctlv_blob_desc *desc)
+{
+	u32 required = BIT(CTLV_BLOB_MEMBER_TYPE) | BIT(CTLV_BLOB_MEMBER_LENGTH);
+
+	switch (desc->member[CTLV_BLOB_MEMBER_TYPE]) {
+	case CTLV_BLOB_TYPE_VA:
+		required |= BIT(CTLV_BLOB_MEMBER_ADDRESS);
+		break;
+	default:
+		return false;
+	}
+	return desc->present == required;
+}
+
+/* Every failure is a bad descriptor; only a range that wraps is -EOVERFLOW. */
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node)
+{
+	u64 start, length, end;
+
+	if (!ctlv_blob_variant_ok(desc) ||
+	    !(node->blob.backings & BIT(desc->member[CTLV_BLOB_MEMBER_TYPE])))
+		return -EINVAL;
+
+	length = desc->member[CTLV_BLOB_MEMBER_LENGTH];
+	if (!length || length > node->blob.max_len)
+		return -EINVAL;
+	start = desc->member[desc->present & BIT(CTLV_BLOB_MEMBER_ADDRESS) ?
+				     CTLV_BLOB_MEMBER_ADDRESS :
+				     CTLV_BLOB_MEMBER_OFFSET];
+	if (!IS_ALIGNED(start, node->blob.alignment))
+		return -EINVAL;
+	if (check_add_overflow(start, length, &end))
+		return -EOVERFLOW;
+	return 0;
+}
diff --git a/lib/ctlv/blob_desc.h b/lib/ctlv/blob_desc.h
new file mode 100644
index 000000000000..e88693cbee4b
--- /dev/null
+++ b/lib/ctlv/blob_desc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _CTLV_BLOB_DESC_H
+#define _CTLV_BLOB_DESC_H
+
+#include <linux/ctlv_family.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv.h>
+
+/* The members of a descriptor, in the order the root family declares them. */
+enum {
+	CTLV_BLOB_MEMBER_TYPE = 0,
+	CTLV_BLOB_MEMBER_ADDRESS = 1,
+	CTLV_BLOB_MEMBER_FD = 2,
+	CTLV_BLOB_MEMBER_OFFSET = 3,
+	CTLV_BLOB_MEMBER_LENGTH = 4,
+	CTLV_BLOB_MEMBERS = 5,
+};
+
+struct ctlv_blob_desc {
+	u64 member[CTLV_BLOB_MEMBERS];
+	u32 present;
+};
+
+u32 ctlv_blob_desc_read(const struct ctlv_hdr *blob, struct ctlv_blob_desc *desc,
+			const struct ctlv_hdr **bad);
+int ctlv_blob_desc_check(const struct ctlv_blob_desc *desc, const struct ctlv_node_schema *node);
+
+#endif /* _CTLV_BLOB_DESC_H */
-- 
2.56.0

