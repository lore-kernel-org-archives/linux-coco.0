Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4661E1DF8
	for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417559; cv=none; b=mxgnJRkSX4tCPBinyI4KYG5+udxVwNsbEfgaZtkWj8qf0BpKrRCgALAow4LD4zwfDw7Uz1YXH2XxodFoSjDs4VDW3Bns6t0ITJJhs2weq5dsC3IxwncTedHnKQTOHaoKDB5YuhWb6hAQNIG1NCyA/voQofaYaCKDcg1UZl88PHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417559; c=relaxed/simple;
	bh=JanhuPR/iml68kEFk6VsdfPYwqYcdQYvtjajdTMi5bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UeTtHefrP6foCKZcdI236U7F8hYp0C94HakpjkHsr6MV3F3NFF5WljGdCktzhxDLEWCwJu3SF9qJQ8RWmA7HFP8tXxlYGRMbdphVg87Hc+FqZSF444FSYw8bVjbqbkP0d9Hx6Kg+VgNGV2UdZqAEzPiyrwMIq+CxgQ8zpt3fmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIshL1yd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIshL1yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743417555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cwx8PB++1jPTpqj+0lA5MhEHp2F2B5hQ/5H2FoJu9E=;
	b=fIshL1ydBeFVhdgGMTrAn2kTMKgniTv1/mSILZAoJCxIDlyDc0LQ+hmLuwzRkxrkVrpQCA
	HmB5mzDT61yFJjPDPx9m8WhFy+UyFqGXQYwqMxXIASdxCcMMwone4XyrntMH0yy8vvzmEE
	syPrpWCt7sf1iSlNMDMbdYzDa0mtWVQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-veZWdSTONqOcanKzgE_a8g-1; Mon, 31 Mar 2025 06:39:14 -0400
X-MC-Unique: veZWdSTONqOcanKzgE_a8g-1
X-Mimecast-MFC-AGG-ID: veZWdSTONqOcanKzgE_a8g_1743417554
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so3124225e9.0
        for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 03:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417553; x=1744022353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cwx8PB++1jPTpqj+0lA5MhEHp2F2B5hQ/5H2FoJu9E=;
        b=RtRGsulvRhKCvSzHekauRdvWt/EivfL/UCKnrizFuZf9mGk2YD8KIA10IOvSpgPC5o
         obxQ8YPDYKuJ1sOOIEXT0/PUKxjbuNYQq2RDxJQ0No9WO2FUn0ufqCiyHCX5PyZGULNk
         oGJz1HOZO2YiH/gt4ELZO/BGWtFPoI0Z16OrJoF/4e64M79GDIdnbjHStSj2lU7bu2a2
         xso9AF/JwN7fWOMeUBMpbTDbLrlQTXGpsHHK0VzwKSpK06yBM6K1cmulUDqUjJJhdjnG
         kNji/C3EO6n5l4DaFcYgjfdQX1a0oBSfvqWsM7ZBlmYx/gwK3t7zzlBDeDrkFRpC80dp
         o1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUNLVFBzWJMcFYPr9ACb4M2PQxxXoIbHxFdZCNMZUFRh1UBSqMzMWg6mq9N1ZCN5CSbaM/ORrhnQSVS@lists.linux.dev
X-Gm-Message-State: AOJu0YwTpED1r4c4LItSAbow68lS5J7zKaTtx9O/9oRh6Bp0nzTg83yJ
	0v7CIfjAs66zSyabZ2APKSFcWD/TmZq7sRFf43mzPJp87I03/ntVtxX2n61/z7VM+Y7P4pcO2bU
	tZE5rylEKZmYbjoS3geqA86vjSg2Fm/r4Tk3Lom+oWoj+zgF19FEgCVnrj7U=
X-Gm-Gg: ASbGncvPRhY6l4zDmCWG8nSQjEnAiliCtG64LKeZ4Unx1O2kWnkNte7G9kN2x/GOhoW
	Y7o3M3fNR51tFtnv++9ezN3M4IsSPpo02VHOIFy+3+v6z2V/5zaSTVRq77bp5/5rIG+4qyUQnHj
	axruVMXfcx3gQ0VFBFS+Ec+QErzQEyvORYvmYezTbFTpI9uoZ4DWUJ/EUnB01XNBB7rxaYkO2CE
	F/cPtSMMMflCR3OmJxrmGh7oYWIbMJar7eiWLBPJ/Feb+0bZ4vEx01D6HuoP9j0dp44q5QRxYIU
	aC1wQkajYu/pY/ItxT+PKm9G4feiav1dAXJu/epB39fKVe26HCXthENDMRi7gWnP3w==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr8370173f8f.22.1743417553607;
        Mon, 31 Mar 2025 03:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFsoB89UBurLAVASbUoQ/cK98O2vrnpvAMoMpoqAdUnbLHZg7VaZ3OwNXdLnVYlU6Ca4bi/A==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr8370129f8f.22.1743417553104;
        Mon, 31 Mar 2025 03:39:13 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589e4sm11068910f8f.10.2025.03.31.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:39:12 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-coco@lists.linux.dev,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <jroedel@suse.de>,
	x86@kernel.org,
	Dionna Glaze <dionnaglaze@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 2/4] svsm: add header with SVSM_VTPM_CMD helpers
Date: Mon, 31 Mar 2025 12:38:55 +0200
Message-ID: <20250331103900.92701-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331103900.92701-1-sgarzare@redhat.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r3ShlWKX16X3TEemmD2W5p_W0pgWKWs93ZpF6p8npaY_1743417554
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by
the AMD SVSM spec [1].

The vTPM protocol follows the Official TPM 2.0 Reference Implementation
(originally by Microsoft, now part of the TCG) simulator protocol.

[1] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00

Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- added Jarkko's R-b
v4:
- used svsm_vtpm_ prefix consistently [Jarkko]
- removed __packed where not needed [Jarkko]
- expanded headers to avoid obfuscation [Jarkko]
- used `buf` instead of `inbuf`/`outbuf` [Jarkko]
- added more documentation quoting the specification
- removed TPM_* macros since we only use TPM_SEND_COMMAND in one place
  and don't want dependencies on external headers, but put the value
  directly as specified in the AMD SVSM specification
- header renamed in tpm_svsm.h so it will fall under TPM DEVICE DRIVER
  section [Borislav, Jarkko]
v3:
- renamed header and prefix to make clear it's related to the SVSM vTPM
  protocol
- renamed fill/parse functions [Tom]
- removed link to the spec because those URLs are unstable [Borislav]
---
 include/linux/tpm_svsm.h | 149 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 include/linux/tpm_svsm.h

diff --git a/include/linux/tpm_svsm.h b/include/linux/tpm_svsm.h
new file mode 100644
index 000000000000..38e341f9761a
--- /dev/null
+++ b/include/linux/tpm_svsm.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ *
+ * Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by the
+ * AMD SVSM spec [1].
+ *
+ * The vTPM protocol follows the Official TPM 2.0 Reference Implementation
+ * (originally by Microsoft, now part of the TCG) simulator protocol.
+ *
+ * [1] "Secure VM Service Module for SEV-SNP Guests"
+ *     Publication # 58019 Revision: 1.00
+ */
+#ifndef _TPM_SVSM_H_
+#define _TPM_SVSM_H_
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#define SVSM_VTPM_MAX_BUFFER		4096 /* max req/resp buffer size */
+
+/**
+ * struct svsm_vtpm_request - Generic request for single word command
+ * @cmd:	The command to send
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 15: vTPM Common Request/Response Structure
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ */
+struct svsm_vtpm_request {
+	u32 cmd;
+};
+
+/**
+ * struct svsm_vtpm_response - Generic response
+ * @size:	The response size (zero if nothing follows)
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 15: vTPM Common Request/Response Structure
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ *
+ * Note: most TCG Simulator commands simply return zero here with no indication
+ * of success or failure.
+ */
+struct svsm_vtpm_response {
+	u32 size;
+};
+
+/**
+ * struct svsm_vtpm_cmd_request - Structure for a TPM_SEND_COMMAND request
+ * @cmd:	The command to send (must be TPM_SEND_COMMAND)
+ * @locality:	The locality
+ * @buf_size:	The size of the input buffer following
+ * @buf:	A buffer of size buf_size
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 16: TPM_SEND_COMMAND Request Structure
+ *     Byte      Size       Meaning
+ *     Offset    (Bytes)
+ *     0x000     4          Platform command (8)
+ *     0x004     1          Locality (must-be-0)
+ *     0x005     4          TPM Command size (in bytes)
+ *     0x009     Variable   TPM Command
+ *
+ * Note: the TCG Simulator expects @buf_size to be equal to the size of the
+ * specific TPM command, otherwise an TPM_RC_COMMAND_SIZE error is returned.
+ */
+struct svsm_vtpm_cmd_request {
+	u32 cmd;
+	u8 locality;
+	u32 buf_size;
+	u8 buf[];
+} __packed;
+
+/**
+ * struct svsm_vtpm_cmd_response - Structure for a TPM_SEND_COMMAND response
+ * @buf_size:	The size of the output buffer following
+ * @buf:	A buffer of size buf_size
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 17: TPM_SEND_COMMAND Response Structure
+ *     Byte      Size       Meaning
+ *     Offset    (Bytes)
+ *     0x000     4          Response size (in bytes)
+ *     0x004     Variable   Response
+ */
+struct svsm_vtpm_cmd_response {
+	u32 buf_size;
+	u8 buf[];
+};
+
+/**
+ * svsm_vtpm_cmd_request_fill() - Fill a TPM_SEND_COMMAND request to be sent to SVSM
+ * @req: The struct svsm_vtpm_cmd_request to fill
+ * @locality: The locality
+ * @buf: The buffer from where to copy the payload of the command
+ * @len: The size of the buffer
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static inline int
+svsm_vtpm_cmd_request_fill(struct svsm_vtpm_cmd_request *req, u8 locality,
+			   const u8 *buf, size_t len)
+{
+	if (len > SVSM_VTPM_MAX_BUFFER - sizeof(*req))
+		return -EINVAL;
+
+	req->cmd = 8; /* TPM_SEND_COMMAND */
+	req->locality = locality;
+	req->buf_size = len;
+
+	memcpy(req->buf, buf, len);
+
+	return 0;
+}
+
+/**
+ * svsm_vtpm_cmd_response_parse() - Parse a TPM_SEND_COMMAND response received from SVSM
+ * @resp: The struct svsm_vtpm_cmd_response to parse
+ * @buf: The buffer where to copy the response
+ * @len: The size of the buffer
+ *
+ * Return: buffer size filled with the response on success, negative error
+ * code on failure.
+ */
+static inline int
+svsm_vtpm_cmd_response_parse(const struct svsm_vtpm_cmd_response *resp, u8 *buf,
+			     size_t len)
+{
+	if (len < resp->buf_size)
+		return -E2BIG;
+
+	if (resp->buf_size > SVSM_VTPM_MAX_BUFFER - sizeof(*resp))
+		return -EINVAL;  // Invalid response from the platform TPM
+
+	memcpy(buf, resp->buf, resp->buf_size);
+
+	return resp->buf_size;
+}
+
+#endif /* _TPM_SVSM_H_ */
-- 
2.49.0

