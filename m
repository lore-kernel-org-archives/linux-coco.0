Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284333;
	b=nlliXSgu3R8SYWtR9iAI2ySRxSBxCiGwPRWjjrx9O+04eHUZFb0ONIRLHLMtnRDT6xyT
	 mGwYTFO7VWhfUY0oeXoParBkRtJ+dF2Tggw8I8Aa5HEWLYvN7vJkJKmoErFVHryMZwaBz
	 Kb60O074kcLkrWhb43bONcS9tfSLrsldGL/1ewPWa85OOv2MVD3OYApP0jKxGJqIsK9Rh
	 D3sul1oUG+X793IXsz6qGFkgqmjxpD7majn1ovt83l6Gtp7pENdDnOGk0RC3VDbW1OJs2
	 MZ8ABEoDSetDxiufceZY7iD/2dAFszAQzLVjvjl4hFA0bdL8NnCvBxl761it0vAS1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
	b=4VQS48VOhVW0LxdghFa4IBqYHmz71DORGdPc2V8yRot3FVknCALLz+CMKRcxuhO4i358
	 d1FLAPZx+sIE8Ma8TSVwGIsJwDzc8XnzNifn1so2qaQtH4jJ5TqIxF7g+lezrRRr9uuMK
	 B8whMZK9xbrCFtX0GaF4pvlgw/p0xdtCDRqx89EBHne8HVxUDMzhoD3hPnamNP1o3zBM+
	 cjnqktWh5x29MQw2qvwVykIyqN+ck8iNxb1qNjpNtgeynuojgfBrtwGX5GHtqUe7NLOy0
	 SJyQVXHHn1OjC7e1eUzNP2qs16i9ivKAUXYKZwAYSYMqBsz8n0DwnL5aAbBCYRPAoZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKV9RmmQ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098E606A335
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6098E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKV9RmmQ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1357550c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284332; x=1794889132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=cKV9RmmQ7TVok1PTDvS5a+jYFs0kyxWTDbCGDW2KrhNLWCaQZCj9CVuC5wdeKky70e
         W1qZYXP6vxH94XMlxr+tGR0430RIvNdUltKnHhr8PBIXjjD8swtcb0JbVi5+p9wRr7Ug
         fCXFKdZr0vQjlLn9MBJ1iK5YonbwEc0yi03Dh1WSl9b8RhY7ZdLVfY5oJGG/bBg+3Pjo
         UOilQCSCWkyHSl/YzlxiZvd9szoHHsJOfDJOECq3c4QRPqAq5dVIED/VZN7XXAh8WT6a
         6p0zsGw43zxycdwUD1LotULoMNDYDfLf66qjwqdZPRX5CuyjMgVNRrZa2VVr/K4/WyAE
         Sgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284332; x=1794889132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=dkRu3UNB6Un/qFgUAMKjHofBgpfNcVsnmoWexNOB9s8UkZNnReqsX5vvVh9ra7Hm6+
         Ln3ksxJHyiNWsHE9L11wHAHdSzEhiXnR0oPw5VBzgGiu+6vfttd/jB162Jxu9PBbsrQC
         Ng7DghkMxqf2O6bdsdxLIL10tFjLcux4iexJ2Bhp+MiBz2fVCDQweK3/+LInwbzcmQmi
         dCZMbqXIwqXUIdlX31J4bikckHf4LWHihANmHyygO6VTyn8CTcJQqX8I8NcPt80a2POj
         W9XWg+6bbMkVMdh9+SeW8FWtc8fr5OqNc4joo6FcC7+Tx2wpFQ/qU/TvgtH7wEmWgMys
         loGg==
X-Forwarded-Encrypted: i=1; AL+hErE49Q0QEyFmwYeQzdrbUif4sj/goZ0AHqBVaHgv7fPARCeAtxj20lKBBhOfwaI0TcsKsjwEnYE3//K1@lists.linux.dev
X-Gm-Message-State: APuU4Z+IApHEKPnupYs3GH5NRh9/uYrm+ZuYH5nP0v9nTBCm5fdPdSvC
	LTx12O/x+rLno8pOBWVeIx7xVpL8CF624dO7N3FLAfkO7BoqAYLJY1Ep
X-Gm-Gg: AYBFou0Xs+ET4bcy4O64sHdtE4M/yOJjqxzArghwGaaD/kxVvCUmrAvx/ZYcTXmqFQl
	RYx2H51cSgI+FvabYL6pprNtkFp9kXjnN8loQmwiaWwqcLzK2wlOJkjbvQP7a9sWVy0/sBCYdHU
	kP8IhDqCombvmUgGBZoxb2rHs8tKXFJX7QI0mAxazmkRFlscbwQt8rfBVbqtuDOQPlEmfKg2PFo
	S6ir+jYLfa4Lzze6jlSlS044pVumGzsuj2Ru8YqiRfVhd0hTBxvKyjyC8e1mzTqFL5W5e+8orZZ
	na5MpTuEwSCa+jqLHVQJiDuvUpv2ZvjAvGFBwpKeVy1SDrgA6lAO6+i3AfJSVInPeRJFe1Jjuk/
	7/8XuFrFTuwIQ5x85uPdKc6MHgf9VHovZbDp5xlXZPRd3Bv6cS6cf+YfEVamuK6hXIGdjWFMUG9
	rb/V6fj4KE74yxEaU+PURnii4uPPUuhaA9lFMBGPQdpOADYEqnk6QK2+TVmlXZYYm/zNfdlP/ws
	L3qc9mn+7QkbuoLR0NO3LC0IylefoV40Nl7za3KxOqkkrHtPPwC2iWUsN6SWlrOODcZjkWpkZh7
	YZ+GBkiNG9IXOVm0P+A+F5qsIWcLkFXofE1E8i0DKv0f24U=
X-Received: by 2002:a05:7022:408c:b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b3b5e5d8e0mr1852652c88.23.1794284332360;
        Mon, 09 Nov 2026 20:18:52 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:18:51 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 01/25] virt: coco: change tsm_register() to use a const struct
Date: Tue, 10 Nov 2026 14:18:08 +1000
Message-ID: <20261110041832.1730924-2-alistair.francis@wdc.com>
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
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5ab..48df8c579c74d 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8f..6b735ac2a814e 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c835..6ac12de8c4d36 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.56.0

