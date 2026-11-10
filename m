Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284368;
	b=QRaLbp2KtQhMDJiDKLmcIL/0WjtaxRkdp9QJPS2f64DBq6ZXmnj0ACetY39mvd9nLAqz
	 iwPbxBIng6YJ8jB0/Bsntq3wOLKzQv7yLBSnKG9eLJahPwz7WoI/zJoN8+ovyQXYvqnHs
	 myCQwbfbyC9N8E+6XL6V3vf98ByZrGGEMXsc/JtezvYCmA/Ff0PXXdmUh/vkFz3cPOI0y
	 rAbdKd+7R8jAUCQVVd/4jco5dgoEfo2jf7VjKKmJxvzCUtXAYY34fB94X+FHA6qEc7IMB
	 FRS/9DdpvJC1zaK+LBCK9FXrbyfops1Zu3OurPt9svwNaTxP7+NlEMk0/SEzLCRui+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
	b=nHq8+0qNqEC78f61lRgXS6kyny8Q5UxiW/V+szI0ddaJq49/DYQTEgg3D5oPE/PjjnRj
	 fPPBOOnbrj9nQmbQDNzzJWCZl2jeIYPbBvXdNe4O8Llr3sh7zU6Z5zDw6zb7/Beekx+Hf
	 G/0+8X0v+Yei/xBhp6Cem25zPwDrKn3gBgnLuwGzW2nI36S92MEyQYVWr9iY6KOMijjL/
	 ve4+aX9UYZGf8mRDBGNqUErpBq7eVjWtCjCgMYz1ul+1YvrFK27D2lyk5bXMa8Q5IsvmQ
	 gylMpMNF0080ianNxy2g2NZT5/KqytbMO95ymCcfIenBfWkkFMq37K3eNTEQ2FdrXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyBMDvwC;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F960A5BCE
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899F960A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyBMDvwC
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so2710009c88.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284368; x=1794889168; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=pyBMDvwCRXKt8kxPc/1cgspLkwCW1a2k51xVE56qQ9a29OExY863+hBGWPqLl+NgS3
         LT8o28IeK7hCDHyK3EcagyKy2dOfSdX0+IlvQ6lW264KD1iOlL5hlcTMeEpXuOe/oaSJ
         QQEtiqxJRaVEDYhVfW+loJnmwkU/mj9sKUaPsoaZjxcGzndwk9bRI2HBWXATTMkGFCZV
         4Y4jcxLpgYK4P7JjXXjyaXfS+j/2wnVRDN3W1yCzzDJDGXajW1xgbEIGh+o0C7aMGoqa
         ib+59wrPPwNlI9xhlP4xYh24eO2fvM45WAg34Zm2FSzaRQLBXzoPTtjx6RDP2K7m+Jyb
         gigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284368; x=1794889168;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=2g/1sWqJBBWlLvjiDWuVqi4MlOIYmGH/kwbNpzSdNZIO9BYlN0hs0qvryfDO7rFqoB
         /+kOLSpTiw5PICt485kTzSeoN56uqZK7aQbQ/sJJBRC0Fd7Pp3IMg9ufEvxu53jErxb3
         Dw3QTx8aos31RbLlpGnAfaR4MOYcFSLs7FBsbryInvR04Gx3I4ybd4z34MoNvgnmRSRo
         Df5scZSbvytEFMLAZddd3IKa/zicgpbpoHITfFYgiLwm2Bbtu9rCSgF6JNzApqsuqlV2
         AHzovz53koHqBWWjfPpVoeMpRNC1PcicFwET5ZCnDFuwP3uJag8bjCMqbihgA96Nd6e4
         pUfg==
X-Forwarded-Encrypted: i=1; AL+hErHhvx+FAP+WnLcUwdxgVZCL87NhlrMNo1IT+wZwg6iNuQ5HMpkngSSMyDjHupC38FJzq7YFc7tYPns5@lists.linux.dev
X-Gm-Message-State: APuU4Z+j7d/jX9oyQvkrBa4mIEPx0yZqOpqJ0ihLJcjg3Y+wN2dnTvgh
	eGmyMkB4EoNh61+6Jnt4w2DZPXeJIw1xddUg0vydBXj3wISvl1M3zTpz
X-Gm-Gg: AYBFou0OE1/AXAtz+3mcWZpuwu8uMR7W3TAqtcswHCN6AMpMcIN9a5shyrAHUhBEiUN
	1mrHx/HbLTJZqQ3lhQm5JQ8+qIDi7BnkNO1XTtdn9a1h6ZnT5hx6StGwCFMSbBON4467keewMNe
	XnIegQfjeA2xWCoguDIz1HBZjvk0adz9MVDlQaoaEwG90/zLDJDQxyoaf6GhH7tWr3WDKVQak7F
	Mo97WgegekEzxGVA4/PEdEr2vQJaLM7DweaqwK3qmQyMYcwDNgoT5JzEeh0kqk4W78GG5zJyewM
	kiiEl5s4Ks2oVjhZsyZRFLJZisofesFWKEMV2I6fxrV5IDoIjtYubYO1UvDlxGJ36IVe1GI5KZx
	9p05Pixp0MuU4Q3pd2lrWjEdcnp1gedhW2EHQNYL+2UffxsuSbC1f05O4t7B4B9tplKRaa3u+1M
	GxIAMxj9r9O6wF75ZcGkxRlKbHPA3AhFDKUwmJusTfC7R4SHYaI9uFIw9Er3UfwStwQz7HDJrg0
	K+r6yPcutMIlX9mIaijRPrNdwLR5e2FcYQ74zAdD7RmsByCLD1pr797zAcgbOSeve9/ZEmq9Ga+
	uz2S/67bowiTUdDeGJmz5vHLxMv32RRHP7WJoWm93nWlyVg=
X-Received: by 2002:a05:7022:ea55:10b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b3b605183cmr2161968c88.37.1794284367571;
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v6 05/25] X.509: Parse Subject Alternative Name in certificates
Date: Tue, 10 Nov 2026 14:18:12 +1000
Message-ID: <20261110041832.1730924-6-alistair.francis@wdc.com>
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

Store a pointer to the Subject Alternative Name upon parsing for
consumption by CMA-SPDM.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index bfd10f0195e01..c3ec2846695a5 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -596,6 +596,15 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectAltName) {
+		if (ctx->cert->raw_san)
+			return -EBADMSG;
+
+		ctx->cert->raw_san = v;
+		ctx->cert->raw_san_size = vlen;
+		return 0;
+	}
+
 	if (ctx->last_oid == OID_keyUsage) {
 		/*
 		 * Get hold of the keyUsage bit string
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
index 8b68e720693a6..4e6a05a8c7a66 100644
--- a/include/keys/x509-parser.h
+++ b/include/keys/x509-parser.h
@@ -38,6 +38,8 @@ struct x509_certificate {
 	unsigned	raw_subject_size;
 	unsigned	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	const void	*raw_san;		/* Raw subjectAltName in ASN.1 */
+	unsigned	raw_san_size;
 	unsigned	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
-- 
2.56.0

