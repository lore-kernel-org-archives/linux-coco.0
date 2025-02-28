Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE31EF38C
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 17:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762484; cv=none; b=NK7rN1FHa2c8SHBTnH0/5iXSIvx9BA1p+MU6FLez/NdS1pIY0zR/PG2G8Ki2mzU9LyQVy7Os+ZNDlM8oINseE81IQwKaH/PgP6wPJt2Q9pp49ZziX5sgQlNK//GW2c5J3Y7ZddqomDLKyoVuKkRBr5u3EtRxvo6OVMvLTpvcVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762484; c=relaxed/simple;
	bh=Ksa1M2URKta/PhoGiy4gircs0cKYJG4eWuTkZ5ZKvjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=nbAhqSvJOadrzshBnhupQryqalGwHkyFjoaseOn8AZfQlrD7qObeCFlkBqNlUR6gFGjEIWCIeti1/AgRE1ySQQjn0ktKYcNT6xGASzpvHMb+Kh1xmQnDG8hKqKD+Ci0m/sSuc9F3FCQXTUDaptoo4zVgfnoBk/NeFNOPNQQFRfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMK/Ru2M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMK/Ru2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740762481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nS7fF8L8t1+avyJ6pviS0kCFZYZceBM1sa3c81ODJY=;
	b=GMK/Ru2MLyK6C6yq9S829fOkwJk4RXGqwBPKosPVkWK/kvv0yhNwAM+suGhO44nchLVK/V
	aYvLfDsqNy7l7ICL+r1Ftlly9wUFJzrO/Ti/Z9RlKzFGoHcDo34HDDHOxvLsp0EzycPnwq
	gM+ciFOfbPzFXYBqI1Ksne0A6UDO5xs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664--B-P3VhePAqxJMDrkIF0Eg-1; Fri, 28 Feb 2025 12:08:00 -0500
X-MC-Unique: -B-P3VhePAqxJMDrkIF0Eg-1
X-Mimecast-MFC-AGG-ID: -B-P3VhePAqxJMDrkIF0Eg_1740762476
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393e89e910so13856205e9.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 09:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762476; x=1741367276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nS7fF8L8t1+avyJ6pviS0kCFZYZceBM1sa3c81ODJY=;
        b=ljiHAC04M8LBTu6L/vAAkNcHc3ApGymn6x2izKlqXjqrV7jRMiSf2E8kaGYvd8saOY
         UqOQbuLZWF4EQzzmiHXv8yN1ib7z9HUsWFaZXxfgm+q1WcE5R0UaqY4dqVehAnqX7/aJ
         OGlWeV31xMVpf6wJuOTqHMY+l/Rm0/4N9Q7Zj2MZMQpBbmSHVBJyYdf/BN4TTT9jy72e
         6UoEZ70tKkgycPEkoG2mb89I4tPMagK3PBDsyrdk6FVMG5iHmy9g9EQFSxWqHXTG53hG
         CgwxWRvAyFKHlzxUN6HSOxis0AEHuzZ6vQyWiFe1lC1dtDL8aQs32+gMrJVtSLEMoB2Z
         0C5w==
X-Forwarded-Encrypted: i=1; AJvYcCUplYS353t8f9Ua4nqD4uiLbDlO1J0H0advUQw7fLZ3ib5J/5hDgGuJuyWBmyM2feqC+6pjUkJB40BF@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx/Xy1JeJTgLH2Vllk12WaS2MUXJh78kS/px2voSpje2GMmhC3
	8zvIWZs8JdZnQNncMMPV83L97zh8uiDTwPt1qieQ6MjQopLPycTpNGadXylq9PUDQxCl+nDd/cs
	UlVclbbpSlvqkBnv9HoygNyGf9fNKRMrRjtJZP7X4jnRw4cCG2QYk38wRdKo=
X-Gm-Gg: ASbGncvyLOoeX9cFf4G36gjBCP88d8Hs/ixXRZoCfb+m1adGX0SNTsi9g2qrZ+wGwXN
	pSfPV8x6MBcDwByndUEXZUrhEknNDVN2ncdbBNK+RVQt8xTVdcKByR3glSr4JJ3NhiRjhQT8PlS
	NTfNiG1vKCgDLkBb50O/6rmEcUMytKzj50InYh2ph7cXthMhNV7evLpReHn7tzYxXmhiREslfpd
	Y9siLDZiDWSIn1vQ7uosUU2S7SUu8RMIJ/KCXiqT7uZ3HtqS9JFY0q1Ket54MUvvZdG+/QMhRS0
	m5AtEmoHWt+4UDpLpk38
X-Received: by 2002:a05:600c:1c25:b0:439:8340:637 with SMTP id 5b1f17b1804b1-43ba6774ba2mr41118245e9.30.1740762476033;
        Fri, 28 Feb 2025 09:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT5lVwEvi1NYBOm/4AGf7I1bPtCAZ2aMeaY+YrZA5HnzpATeQRyKTtPTEseLbhxBVQleI/AQ==
X-Received: by 2002:a05:600c:1c25:b0:439:8340:637 with SMTP id 5b1f17b1804b1-43ba6774ba2mr41117315e9.30.1740762475346;
        Fri, 28 Feb 2025 09:07:55 -0800 (PST)
Received: from stex1.redhat.com ([5.179.147.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7dcfsm5841288f8f.55.2025.02.28.09.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:07:52 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@redhat.com>,
	Joerg Roedel <jroedel@suse.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [RFC PATCH v2 4/6] tpm: add interface to interact with devices based on TCG Simulator
Date: Fri, 28 Feb 2025 18:07:18 +0100
Message-ID: <20250228170720.144739-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228170720.144739-1-sgarzare@redhat.com>
References: <20250228170720.144739-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EP1ToVp3ruhMT7yIpjybMexYC0jDpQwFAHmescgRFVY_1740762476
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is primarily designed to support an enlightened driver for the
AMD SVSM based vTPM, but it could be used by any TPM driver which
communicates with a TPM device implemented through the TCG TPM reference
implementation (https://github.com/TrustedComputingGroup/TPM)

Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
James, Claudio are you fine with the Cdb, Sob?
The code is based to what was in the initial RFC, but I removed the
tpm_platform module, moved some code in the header, changed some names,
etc.
For these reasons I reset the author but added C-o-b.
Please, let me know if this is okay or if I need to do anything
else (reset the author, etc.)
---
 include/linux/tpm_tcgsim.h | 136 +++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 include/linux/tpm_tcgsim.h

diff --git a/include/linux/tpm_tcgsim.h b/include/linux/tpm_tcgsim.h
new file mode 100644
index 000000000000..bd5b123c393b
--- /dev/null
+++ b/include/linux/tpm_tcgsim.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ *
+ * Generic interface usable by TPM drivers interacting with devices
+ * implemented through the TCG Simulator.
+ */
+#ifndef _TPM_TCGSIM_H_
+#define _TPM_TCGSIM_H_
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+/*
+ * The current TCG Simulator TPM commands we support.  The complete list is
+ * in the TcpTpmProtocol header:
+ *
+ * https://github.com/TrustedComputingGroup/TPM/blob/main/TPMCmd/Simulator/include/TpmTcpProtocol.h
+ */
+
+#define TPM_SEND_COMMAND		8
+#define TPM_SIGNAL_CANCEL_ON		9
+#define TPM_SIGNAL_CANCEL_OFF		10
+/*
+ * Any platform specific commands should be placed here and should start
+ * at 0x8000 to avoid clashes with the TCG Simulator protocol.  They should
+ * follow the same self describing buffer format below.
+ */
+
+#define TPM_TCGSIM_MAX_BUFFER		4096 /* max req/resp buffer size */
+
+/**
+ * struct tpm_req - generic request header for single word command
+ *
+ * @cmd:	The command to send
+ */
+struct tpm_req {
+	u32 cmd;
+} __packed;
+
+/**
+ * struct tpm_resp - generic response header
+ *
+ * @size:	The response size (zero if nothing follows)
+ *
+ * Note: most TCG Simulator commands simply return zero here with no indication
+ * of success or failure.
+ */
+struct tpm_resp {
+	u32 size;
+} __packed;
+
+/**
+ * struct tpm_send_cmd_req - Structure for a TPM_SEND_COMMAND request
+ *
+ * @hdr:	The request header whit the command (must be TPM_SEND_COMMAND)
+ * @locality:	The locality
+ * @inbuf_size:	The size of the input buffer following
+ * @inbuf:	A buffer of size inbuf_size
+ *
+ * Note that TCG Simulator expects @inbuf_size to be equal to the size of the
+ * specific TPM command, otherwise an TPM_RC_COMMAND_SIZE error is
+ * returned.
+ */
+struct tpm_send_cmd_req {
+	struct tpm_req hdr;
+	u8 locality;
+	u32 inbuf_size;
+	u8 inbuf[];
+} __packed;
+
+/**
+ * struct tpm_send_cmd_req - Structure for a TPM_SEND_COMMAND response
+ *
+ * @hdr:	The response header whit the following size
+ * @outbuf:	A buffer of size hdr.size
+ */
+struct tpm_send_cmd_resp {
+	struct tpm_resp hdr;
+	u8 outbuf[];
+} __packed;
+
+/**
+ * tpm_tcgsim_fill_send_cmd() - fill a struct tpm_send_cmd_req to be sent to the
+ * TCG Simulator.
+ * @req: The struct tpm_send_cmd_req to fill
+ * @locality: The locality
+ * @buf: The buffer from where to copy the payload of the command
+ * @len: The size of the buffer
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static inline int
+tpm_tcgsim_fill_send_cmd(struct tpm_send_cmd_req *req, u8 locality,
+			 const u8 *buf, size_t len)
+{
+	if (len > TPM_TCGSIM_MAX_BUFFER - sizeof(*req))
+		return -EINVAL;
+
+	req->hdr.cmd = TPM_SEND_COMMAND;
+	req->locality = locality;
+	req->inbuf_size = len;
+
+	memcpy(req->inbuf, buf, len);
+
+	return 0;
+}
+
+/**
+ * tpm_tcgsim_parse_send_cmd() - Parse a struct tpm_send_cmd_resp received from
+ * the TCG Simulator
+ * @resp: The struct tpm_send_cmd_resp to parse
+ * @buf: The buffer where to copy the response
+ * @len: The size of the buffer
+ *
+ * Return: buffer size filled with the response on success, negative error
+ * code on failure.
+ */
+static inline int
+tpm_tcgsim_parse_send_cmd(const struct tpm_send_cmd_resp *resp, u8 *buf,
+			  size_t len)
+{
+	if (len < resp->hdr.size)
+		return -E2BIG;
+
+	if (resp->hdr.size > TPM_TCGSIM_MAX_BUFFER - sizeof(*resp))
+		return -EINVAL;  // Invalid response from the platform TPM
+
+	memcpy(buf, resp->outbuf, resp->hdr.size);
+
+	return resp->hdr.size;
+}
+
+#endif /* _TPM_TCGSIM_H_ */
-- 
2.48.1

