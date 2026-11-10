Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284359;
	b=N/onoO/JHjR9thjTfFMJT6KDzHFsIfcgqdzlnwkM4okJIfZvAZyD7uBxGS2Es7azymZl
	 VTDyzZGRIxtKqUn3kN17TAy4uk4tMNeARp8nuIv280pOXDlLCz/nJYLmekQxBML7JmYdF
	 7Sr+z56OK4niWcnZPyd+ZQEKAEA+FfYz/2RV15wgHt/WfHheAW+IIkhnur3RwzJaOWzbv
	 NK+GC5VVkfHpZGmkcDY0pVO2jPutGsj6uk85equ7NlG+zuREfSyrJaKkWgysl2RGQmspj
	 CVXJKwvjQLAOP9te2cJ7DW6TNZ8cRAyvWIDcIwQOpc/66ABN5tYE2nsfh4i56t/BBeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
	b=QSGWBZmhygVbVhO6PvaDNrIOR9mNB3TCkgfb2orKmM5M0KhuIyYQrZ077q6CWrURNbdX
	 L4qmLaMRFiiC43dMTgORI8ZD8MXIJnuVOmScDocFNWg9paaIQyY2Y2Myz+DTJOw4MO/OG
	 Zg+HiCD1Z9UBkG+Xy3zGUZ9lLbaDEkm7GTar+r7u973UdStQHscif6DRRUv2pvdKC3NEY
	 uRmhFNbuA1Xynnc3ArQ7t001fSLq7tkD13/FrUv4O7kw4L9U8nMZxWGHa68TPOR6nOjyo
	 aBafMthMogUZMgPtgRc90jzUzhMAczmq4TIHBlhds/edhZsZmmh6AMFBXM50PZjRSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLRbHwKu;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C7606A33A
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1C7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLRbHwKu
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2460607c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284358; x=1794889158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=RLRbHwKuDx2If5mBaNs1vAWIZM9j1tIdrllV1+MqEbCQkrRH1NAMn9/IKzbwYQpIqp
         9oQcwv5XT/L4QoK6WaBu75LBNmhBhkMwZdoN7+Cb8U5HGUyfyLB8l2sVG6zZSzDFrtsM
         PA0DjdlG4ENDv0Z4gwAzXJIGyQJPdv8B/BaLhoCa+tPNCV+nnvXmmNWHPgiel2r3T2eL
         exkEdPgZTRqKBQS24OUL4xErFDKQuyp1uDsp+r/vd9DVBPCjK0BeI0TN5CbMvCYa2zd3
         T7tNKKin1Su0+cQk6JqJt8jZjLDgSMowtYIdTaA7BvSmOv4sNPolZwP/maT7jXW7fDg5
         QH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284358; x=1794889158;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPU4IMrUNrr8h45vc8EL5JTCvYSHe/yNNj7XMONjgu8=;
        b=FuomZ8xFSV1qKzBudd1RjW/tQragh0wTmDeOo1jrgarl4RWgBVZFw8MYXHmiPIhJ49
         MAtZOoA8MNsLR38LiWfSSiG7DszZFTeBJQY2TnI0PSA1Zr1FCkeJ50DW17XFvnuo27Jn
         ETrm+u6uX2Ci+gMA9HnuPUEnqp1lp0pN09YZ7vnknXmZtueqxYiWH6ZuLFXKUYDD/YCs
         O3BRvpPUDIHLPHI4emRwJgY1Fq5LV3GuxUrPHTC54roSkqo0GJgEDQUVubJGZGD90eIk
         omV0S2AC7FSfP8DK43Rd39/dh3gxuxixk16cK3F5ZLkUD47Sy5nEyRYjCzO6/13scSJ6
         CCMA==
X-Forwarded-Encrypted: i=1; AL+hErH7cAZkBUlS34tGt8gK66rH3QehVmdtYYTBqYMs6Oo5thpTqUm+/x6g6Ax5lwI25XdEY5/VU6VU+Pz0@lists.linux.dev
X-Gm-Message-State: APuU4Z9PSi7cgHYGoXV3rCG/MIHCMkijvJnaElfDGgOwC1KQDKO81Jjw
	1Vu421ILisSeYHu1SWUvEgnMp8ut/pocqC7KlY12psiq2f7CjIqS7Gps
X-Gm-Gg: AYBFou3PVbVN9Onig0lf4MzzKqTyNPBR7+5RVQVRxqN8TmkozVn6pt6OBH8X9RXAyXv
	924SayZsp1+Zzq9IXUF0a3DY6U2li+CEc+4cJjJ9gR9XzADjBlc0ppOzRlUJBXWV9rIYaqqZvIU
	qu5yIoEXEX6E2iuSx9G7CuoM0QD18NKjUZVGd6DucnHGBzx+Kc0tyzArwdT9zN4DxRzsKB/Bd+S
	KgVqY/KgA3iX2vG9Xx7u718LzvPjDJ7hGcDi0LsrYzgPJtAMQoIs2XrbIldfBKOQXYfCOIu3961
	QYD7EPuRnw4fWUkHo3p3vd54enA6rQHiJXTrTplTwkQy2n+VRp8/fzKEE/MKeZV3+aGxZ8Mgoub
	NvJDXvC+wpX2VSEilU/fHiqJGGSJ4xysWrEmsXii9bRLzAKDlJDk3WlbwqHIPRkulGDhdGCWZhn
	DLZq2N1JFR3a/ws5+PPZqn8IiwAqpHGdlnWlow3oi3KxlWxHaDehuWGREo07fvEIlfiUihtT0k/
	etewYTJdfmQnZzMN0atawTkHB2qei18D2pU/8BGewV6kqW7QTwxSy327mBhXIIF4pkL8M67Jmxi
	uiJxcCQZm3tmp0AJ0WsUnl1IXZcY0UyKGpHBnAvjiEmg/cshm60S7w8FpGexsGHunf8O
X-Received: by 2002:a05:701a:ca05:b0:190:3950:43e2 with SMTP id a92af1059eb24-1b3b6000497mr2107814c88.8.1794284358348;
        Mon, 09 Nov 2026 20:19:18 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:17 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 04/25] X.509: Make certificate parser public
Date: Tue, 10 Nov 2026 14:18:11 +1000
Message-ID: <20261110041832.1730924-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

The upcoming support for PCI device authentication with CMA-SPDM
(PCIe r6.1 sec 6.31) requires validating the Subject Alternative Name
in X.509 certificates.

High-level functions for X.509 parsing such as key_create_or_update()
throw away the internal, low-level struct x509_certificate after
extracting the struct public_key and public_key_signature from it.
The Subject Alternative Name is thus inaccessible when using those
functions.

Afford CMA-SPDM access to the Subject Alternative Name by making struct
x509_certificate public, together with the functions for parsing an
X.509 certificate into such a struct and freeing such a struct.

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_parser.h | 42 +--------------------
 include/keys/x509-parser.h           | 55 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 41 deletions(-)
 create mode 100644 include/keys/x509-parser.h

diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index b7aeebdddb360..39f1521b773dd 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,51 +5,11 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
-#include <linux/cleanup.h>
-#include <linux/time.h>
-#include <crypto/public_key.h>
-#include <keys/asymmetric-type.h>
-#include <crypto/sha2.h>
-
-struct x509_certificate {
-	struct x509_certificate *next;
-	struct x509_certificate *signer;	/* Certificate that signed this one */
-	struct public_key *pub;			/* Public key details */
-	struct public_key_signature *sig;	/* Signature parameters */
-	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
-	char		*issuer;		/* Name of certificate issuer */
-	char		*subject;		/* Name of certificate subject */
-	struct asymmetric_key_id *id;		/* Issuer + Serial number */
-	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
-	time64_t	valid_from;
-	time64_t	valid_to;
-	const void	*tbs;			/* Signed data */
-	unsigned	tbs_size;		/* Size of signed data */
-	unsigned	raw_sig_size;		/* Size of signature */
-	const void	*raw_sig;		/* Signature data */
-	const void	*raw_serial;		/* Raw serial number in ASN.1 */
-	unsigned	raw_serial_size;
-	unsigned	raw_issuer_size;
-	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
-	const void	*raw_subject;		/* Raw subject name in ASN.1 */
-	unsigned	raw_subject_size;
-	unsigned	raw_skid_size;
-	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
-	unsigned	index;
-	bool		seen;			/* Infinite recursion prevention */
-	bool		verified;
-	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
-	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
-	bool		blacklisted;
-};
+#include <keys/x509-parser.h>
 
 /*
  * x509_cert_parser.c
  */
-extern void x509_free_certificate(struct x509_certificate *cert);
-DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
-	    if (!IS_ERR(_T)) x509_free_certificate(_T))
-extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
 extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
 			    unsigned char tag,
 			    const unsigned char *value, size_t vlen);
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
new file mode 100644
index 0000000000000..8b68e720693a6
--- /dev/null
+++ b/include/keys/x509-parser.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* X.509 certificate parser
+ *
+ * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#ifndef _KEYS_X509_PARSER_H
+#define _KEYS_X509_PARSER_H
+
+#include <linux/cleanup.h>
+#include <linux/time.h>
+#include <crypto/public_key.h>
+#include <keys/asymmetric-type.h>
+#include <crypto/sha2.h>
+
+struct x509_certificate {
+	struct x509_certificate *next;
+	struct x509_certificate *signer;	/* Certificate that signed this one */
+	struct public_key *pub;			/* Public key details */
+	struct public_key_signature *sig;	/* Signature parameters */
+	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
+	char		*issuer;		/* Name of certificate issuer */
+	char		*subject;		/* Name of certificate subject */
+	struct asymmetric_key_id *id;		/* Issuer + Serial number */
+	struct asymmetric_key_id *skid;		/* Subject + subjectKeyId (optional) */
+	time64_t	valid_from;
+	time64_t	valid_to;
+	const void	*tbs;			/* Signed data */
+	unsigned	tbs_size;		/* Size of signed data */
+	unsigned	raw_sig_size;		/* Size of signature */
+	const void	*raw_sig;		/* Signature data */
+	const void	*raw_serial;		/* Raw serial number in ASN.1 */
+	unsigned	raw_serial_size;
+	unsigned	raw_issuer_size;
+	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
+	const void	*raw_subject;		/* Raw subject name in ASN.1 */
+	unsigned	raw_subject_size;
+	unsigned	raw_skid_size;
+	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	unsigned	index;
+	bool		seen;			/* Infinite recursion prevention */
+	bool		verified;
+	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
+	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
+	bool		blacklisted;
+};
+
+struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
+void x509_free_certificate(struct x509_certificate *cert);
+
+DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
+	    if (!IS_ERR(_T)) x509_free_certificate(_T))
+
+#endif /* _KEYS_X509_PARSER_H */
-- 
2.56.0

