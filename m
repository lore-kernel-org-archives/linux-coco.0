Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284386;
	b=nj+MkqP7O0Tfovrz1zRJrzbEUPcjNSEZitaLppRJ59xH7JaYCQjIfLLbwd13Iy2D6AWP
	 PFmoKNddAwqTY+NG926/j9Pr+WOtuMXai1TGp+xzIeAfXezSCP0Y4NpqydHSlSPdNCYIb
	 lnuHlBa4Lc+948fD1SC07i86ZMa+5514IurkRv9EZlWEJfear2CMcnASYfIXFBoI9rWDh
	 r3XOHf4KBQDMtAd0CCMJ/+sJjUdV1GDpfe2701gjNk3rdanNJqJCmYLoR31bHQR6KXOpK
	 8JF3dCh7/AAJ53HpVSmctt4al7SdIeaqO4fcNTk3xUqJW8scMLwJlDeL8IOX4dBYhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
	b=CBgkHvqg6pku/mCs3LMmke2sDMR1VPsEAp+DEQnXnoSiH8RDxaF7X2Hrf0oDxiERBuIl
	 O4T2gJvmgSUJAoHg8Mz9UIAwJD5lNDmWteFpjuvhcfAO2XtJtS70zBcg1uVc4wDvfDCM3
	 SSpbPBTr80gmRTeywxPaCR4xDPZVnW4iAvSDQDjAQB+6GytIinYyTBybVlrBTrt5vpS9N
	 cTBTPVjh2wnL+nK/+nE4OIAhCYBHq81qe460lIF9TKaqvHHy20djuFo24CenvmVEBFIoU
	 w6GE0wCIqmS+zJ84mYzZjpBaR5Y/AdCkRki93xK2BLqWUpFveaaX5P39oth4OaHjFbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/vjsfgA";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F606E8EC
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F7F606E8EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/vjsfgA
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2461090c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284385; x=1794889185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
        b=s/vjsfgAkD3ih+wq0lJvbjYOVlnjstqcaFpUO2CpqODu8uYOcLorGae4tuQrZho+BG
         1Ro6IrR8Ypb+ACPE/LrgCv+FQ91lV6ba4TtaadMvZ4XKyyQWy8hRhvIjpcJSRIBZNHI0
         +uPWYHRQBfaWwrsoHSUujA5uvqESY/eO6d0fL2GLIcKAbLI4PjikqXaAWjUcGkoLJ3ss
         6INkL8iMLYPfXIg8fPut1zF9umTRqNSzt/fvpXmrbmtHUOIoWSxc1X/7LUM7SglWOB7q
         fRmo1zlLb79zvdBkNsDAvI/023ZKfuqCTrC8USwr/ozVgnD7ssFQKnh/MOEubKxxahWK
         L4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284385; x=1794889185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
        b=lvU/SdXPkjilOIQZPz76V6+Avq4sTWRjMZ4/vUxWicPN86HFp2xN4QSVGICFDZKr6N
         M5n5t8l49Xbgzg4GbGNs/K8y5guqbXKENnpeSHNtXQ8HeMPRsgWp08AzcUS2tVSDvhKG
         jpSLfnTjI2mKXixdiNdfnBhrlFL9ReMkLMz8ZTnAOZIOBY/2/Zym2cOzreNGf2XYgwDV
         feI3oxwY7G0uYq7WFPiHVvMg/BkKy13Pa0m07/8TiT1Vmg2Q222J59HK55XRVvk2XAFm
         rnKYdj3DUOubTV+PdmcFSk4LtpOtk6hAeCOJTzYk2BfNlZeKHt9l35JRUleDhSBje27M
         OwkA==
X-Forwarded-Encrypted: i=1; AL+hErG0Ovfa+Ig0h6rFJ3vQ6hJM6U/3b/lOCodeORpjotlZeyHg7ssV8pZg38f2IuEwCfu/qojPvD0sfDjg@lists.linux.dev
X-Gm-Message-State: APuU4Z9NodENvhjsnTnkxNTukkJJv+Nr+/0J892ZXotEQvIHqox8jTad
	IwO1WwySmvVvTmPxYQcNixzEOSlqyLF84jo5eNVrSpMY7gceaMg9yaAQ
X-Gm-Gg: AYBFou2cC7HskYQxjYYsFXJgHFB0cQgaFdQkI1szZxcjeoBjU8geTQTGJM7lz7vkeAd
	qJoLZ4gZf3FQtIZfmIskgY00Bm8Iy7M73bjeraAiBzIOjG8rpFkPP4moMs2a5Mft8uCigv2MI89
	lvyV0c+E6k28a7tbCvY1nVWCHaQ7XZ8IvbrfdgaLqAlIRe9rKPxO5u7YMdwuvCR4q0lxXDqoDZr
	XC2wufKbWVFmvBf6+dSmKISG81Mk6nkZnq0cdbRFXouBpYiv3GIysvZi+abZIvwcPao094YB5nm
	CyYOjpgTNEYcmWA23SEY9ee4buZ7fWZyVdjIOsBzi8lD5jng2n5UQZWrtBu7pLlOj67OZ9PMqdT
	mDRkwQmr42S/xREnrZFHOBs/4iaohMs+NKLGEpzB7L181kXGduiFf+r23zxxCiKk1GU5qWxiJ/O
	K1FBZr/saJTrSpRsfotiA9v/I4pUrcejXEC+NhIluzI2GyQrroOIRNOSS1mE35cObzuoAPRh3fu
	fEd838oPTTGa4yCU9yYaYXenjJt8oj28FJ4yqFxcRMpluUl2ShHFwtXHGKweHCIrRBpFSAtBs6E
	csIHMBKXNLg6kS60wb9oXIPn2Mo4s8WbzGiDEZasd/iIe9o=
X-Received: by 2002:a05:701b:450c:10b0:149:49c:233 with SMTP id a92af1059eb24-1b3b603e878mr2107744c88.27.1794284384921;
        Mon, 09 Nov 2026 20:19:44 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:44 -0800 (PST)
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
Subject: [PATCH v6 07/25] rust: add bindings for hash.h
Date: Tue, 10 Nov 2026 14:18:14 +1000
Message-ID: <20261110041832.1730924-8-alistair.francis@wdc.com>
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

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 22 ++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc73..4992bc3194e7e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,7 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/hash.h>
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 0000000000000..1e50fe16c5031
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+#ifdef CONFIG_CRYPTO_HASH2
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+
+#endif /* CONFIG_CRYPTO_HASH2 */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7bd..0dcdad905f0ef 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -67,6 +67,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.56.0

