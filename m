Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284505;
	b=jw1mjbTNfLPM1k1XS5fHJnS0OGWGBmhmqaP+W9xrQBEfB4z+WN9zZaMIbjZMYQrq0yQx
	 qp8rz3fsUfeEJmVYD+mPrhPlXnf5E3APEccPLZsxbJLLfYR+9EXRCmVfwVgoZtSjNHmya
	 S3vkrTTXA7WiFcrtrzJlQ3mSdbDdOtNmHsivnVdQ3eKynRVNo6IOfjTyE/n3Xm418hDJl
	 WW2zwxsutOk4e8o1mBVwyaIazFAqjOmx5hI1AkISu5Cdhys22zNXHijrSjebguRqTAHi7
	 qGf2YkQAHNQmL12tt+DMKullyYPp3HmBnOL2trDyJvbfqut0IZ1qTpXjf0Eql3+96mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
	b=bVlcWdrH/qkCGLGqWIhqvlsjNNVzAZW3P7eStvfORLkUqnJZXQ26ebdfsm/66U0OGtU6
	 O7oLtkZTfgbSkvImwCIAvR5yv3rWN/hMs283OlA4UbMqC0kln6v7XgSoeBxqH0Ry3JpEI
	 N/MI5wCBHxPHZ+Qms1yjkcR5oh7OXONQv5Jx8w7aEDoucZLuk255EsPyyhDnFAMIh+LzM
	 T9vkr2kUa8KWqZrI04ScEXM8DAA3aS7GTcBHLzALHsgRW0QBxVRG8NSvxk+s80ubBj8wN
	 48Zp0IGLrJLuiFSdOYljSMC+HCYDcM6QxcnsXcSLn6v2wh1NdUrVtUvyRXuzhJrV2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAUIlz4m;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5660A2635
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A5660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAUIlz4m
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37198ed3727so2149647eec.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284504; x=1794889304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=TAUIlz4m0mwULmflGxpfefNCvj70q79+MNThOsl5Q1Zg34X596KVOGraGlt08s90nY
         0J/yQ9jxZJ/SS4CRqPfHjG2C28UxXL+qhbApPUrRO9LC1G84s93kHxtaagRA+QYVw91Y
         82U3MjP1hyZo7bhLHWXwdTmINgVMO3GUrdHk8wmsvn26RSceklfa36RA5dh6NLLXwF4z
         uRJIFbVX/KN3zG81bEfU+xsKDCzfx09zVQidzSLfxxD3nabHioIycGsJj/28j6TSooFs
         UlCDZ1aiFoFJRhFIwcp9sobNwfVlkseOtHOKkLjwdloUiAqcu5HYJq+eLtTDJEIbjEsC
         wjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284504; x=1794889304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=VNUWVvert7QZ/Ox5tYgmPGY66RgwguPM2duU2H1n58Cch1JqA9eNzM0YhOMCrUoZaP
         UbZZ7F9FT/ZqVZL19PeitVZoAtZ7AkvgLPsxWsR34FFjnHPwNqdKM4n1nafR6O6NFusA
         xx70eKORrHVX8KDh9CkWsHQpaBJAP68yFgpdITJh467bT2onmurA3Wv21++wTUp5ADyC
         znvMqPJDEeXTS3Ju9jCOB09oM9M0l6o7MniDy9I8102IIYjwUstMLkyFMAN1oOOeZWNK
         KabUrL71bIWfkr/TXFnOWcQ3xQiSWRxaiJ9pmarACTAWFCHmMspITKJBiOt9asIxVtND
         vWjA==
X-Forwarded-Encrypted: i=1; AL+hErEoQ+GuNnA1DKZMA09pllAvQsN0/9I15x4PIoLqE0nXI63tCjuQec1vsRHucXQkXK1SJ0+s/XMFh/A4@lists.linux.dev
X-Gm-Message-State: APuU4Z+uhWA9MJlNE49rNXlsTbKYPXAAVshNqu8UmXw2UDPAnLcKeLas
	XcDNutWA6pIfNpOrcGMq10DV2lqW+BdFI2NHgBPKT+VAeZsPOrk72kxX
X-Gm-Gg: AYBFou2k7YmL4WcS1tWkijW+99IOTsOzgB4T3Zs7F2jR6gSNz7W3MHd76aRJ6bIkowd
	tytugkK2kqchIanLQs3XK43lxBZxLZUfnVRt6rMtNEq410usY8anTuipwkoZYAyYG1NFndfHSvE
	h8Ckv8oEqobQVFicDWnPFQsrYUfuc98mvNPw6IR0IHBl6U/xz9t0ONoChtCxWPzOgvDzNFlE3Bl
	WA0ekUc+j2DtZoZEzDsaB+4kCJekQK53+G1D1RJ55MKoW8MzNCUgZc9z/EqcvRzBPZl/3gky3I1
	8Er2XM2TMx5xSbZiPnTK40ovXjACgIGf3u2tB0ZK76vqqiTzgSPa6kruJJXEQw1MNHCslEt1xfK
	MTkzpiUsNL34HmvD5q8u0GtRW+n6GScFbRuPp0F8RMR8wK7/Zw9mnEd10rJFmQuZ0og5P+Xu5U5
	0F8WJ13MYWYgBeF+4kAs8FBECthXKPxUl1pfe7rsTkix+i4u8gWDOb9RvTmvAc0143MvbqM7IqF
	OUU0uDJ4g6vFub2VxGRAH3jF5ad+V0vM5KSOT59Z/fkXV94XAJkoBZyijqK92/rUPNXJs6bfwyL
	7iAMnPTfzPw1pfzXwygXDoQVDV0u9+dDLt1iKysQ2Q3R4zA=
X-Received: by 2002:a05:701b:4642:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1b3b5e167e5mr1932957c88.5.1794284503989;
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
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
Subject: [PATCH v6 21/25] keys: Guard asymmetric-type.h behind CONFIG_KEYS
Date: Tue, 10 Nov 2026 14:18:28 +1000
Message-ID: <20261110041832.1730924-22-alistair.francis@wdc.com>
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

The header keys/asymmetric-type.h includes linux/key-type.h,
which is where `struct key_type` is defined.

linux/key-type.h has a `#ifdef CONFIG_KEYS` guard around the entire file,
yet keys/asymmetric-type.h doesn't. So if CONFIG_KEYS is not defined
including keys/asymmetric-type.h will cause build failures as
`struct key_type` isn't defined.

Guard keys/asymmetric-type.h with a `#ifdef CONFIG_KEYS` to fix the
failures seen when including keys/asymmetric-type.h in the Rust bindgen.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/keys/asymmetric-type.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 301efa952e263..b77bfa7bd5904 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -13,6 +13,8 @@
 #include <linux/key-type.h>
 #include <linux/verification.h>
 
+#ifdef CONFIG_KEYS
+
 extern struct key_type key_type_asymmetric;
 
 /*
@@ -93,4 +95,5 @@ int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_si
  * The payload is at the discretion of the subtype.
  */
 
+#endif /* CONFIG_KEYS */
 #endif /* _KEYS_ASYMMETRIC_TYPE_H */
-- 
2.56.0

