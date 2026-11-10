Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284463;
	b=s6n3j7BczX7kguO5jyW6aDI8R5t5d/Eln8VNQHcUSzs3oqHK7dNWoa+2qgPp/kMwP7e0
	 Yil+EQizIGwkG8q3jPkBrz2Ed/PHW66YpCgYbadVBXJWtHq7qw7SKOEcbPjfVVaYj/HL3
	 aezfv6TMMkp5zp+nzuStNEm6aup/cgfKyGDbJnrZ5h25HkOc5c+QvJtbtTAxCkfwRbr2A
	 RKZrzc73+R/wEWTpGls554pl7QRS5hcQ9uembaNgyA3fsjnJnHaqhbHhwEf6WEru7SAip
	 bEwDObdoEhOmj8HVj05M61Kp+MvgJOI0otAaoLL5fKo6ysY5WYFKuGK/TeJwt+iWLJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
	b=UqQ8XAVGVXNSyvkoXvVS5poKM/f5Ajwr+N0VVfcGzhS991cY9urordEafM2n9NJmxHr8
	 jyPTeUGiESB8wfoLN+9nKR3ETjaJxhVLMF9TgVE6Ry8uGtabMkWBLGZQhdWtr9a9CkIXG
	 /dZtdTca7HhSVKD4M7D+cxuZv27lKaprkVG2Y3LKW9XN5DwZxC4d525KSirFB1xu/f0zn
	 Q38DRuOhGfhoeAq3q46WWtrSpA7g9yRhr9zyZSedUkmBg+zY+U7/Qu8ZqPk7dKZdM7+Mb
	 jOC6qoV37+Q1qPn6/TZk+dhC8jCRfEuq5eEDxD4bjmXpvgGRiRJrq1nCBYn2rLvMYGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlSmcAnQ;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD71606A321
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlSmcAnQ
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2462307c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284462; x=1794889262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=hlSmcAnQhKgGl1SbLBGIZpblPtJ5S7KZPlb3zQX5gzlg2PFbAnlrwYF5DEPmJSegFt
         YncmMyAe+bJ8jcXjM1eSYT2JkQFuvYsZIz4AIqHvj9ILRhtazCHvmHF9XROPhW0V/iYK
         K/5b6wUK++WlU3lgM+qC1fDMV4wDd7PMBGmwB2L+Caz3VKDeKkImyL7Kv2m2mtd1gHs+
         gK8hpz9rmXPu0wZvkcW3FnvhulxVdSasSFrY9bP+jdUJNcHsUPQxW8aSwbNNd0v4GD3Z
         OGxy00eUrTVY4/C1tlO2WZyJT0rr3S7G7N3n0DdXtsfOB0TdgO2Pr6kef6G3awMNCeDI
         5T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284462; x=1794889262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=YmC8Bfaj/Hp7ni9RoRvgjN3CHQnwJKQeQ+odDbqpKtAIKxhPZGfSgUAK7UPpbaIR9Q
         gRLGxJWlspBpxGUCQuwkljq2ipMxMFbWCM7ZOWS1RHobqgaI+peFv7vbxeMi2XVSLVRS
         8FgMYSuZGuvmnCdwmC60CKzHut4YJ1iatPOTzAcidG8GeMSPBsSAcHZn6yxaJWAWdIMz
         t8ZaaTY/Ig1fSfq+JQ6i3ch9+96RlQMvcDXCjixZwlqqL+daFX7JVT16S4e8Ghyl5Fbe
         8/0ELQ4tAKx8IUFL5bg0s9UE2ZrXDp6J9LI8hxXsQHXs3r2joXaoczvzs/6ob7+YZ+Jl
         CHcQ==
X-Forwarded-Encrypted: i=1; AL+hErEn45S1E/ODoF1poreJjecNWkTwjTGw2N9NYLLULrZwrGAB3h5VkEoqeVyKFqyL/08kF2JdPJZKe623@lists.linux.dev
X-Gm-Message-State: APuU4Z/mBQINUgelgUD+Vc0MfzACyXVk0ptbZwenaxTLhBaalecrFKs9
	10hSXg6MStuQz4+2xveaf93yKUkBOEc6bR6pF5qL+CahdF/TxygfT9qp
X-Gm-Gg: AYBFou2/tJ7fMiEs3v6PWJtebtp+pPAJCkMhKyXLEbBwMcMMaU7FRNy8VKB22KA/FDP
	+SkbCYWmMs49g2uQvpsjG0HsZlrkvTtitbd3s6ZHLqKYNIQXlnkZbzOHAw7hk7cXm+HURosbgvg
	RcqFkBcU9YmWz/H7NgrWVJteVlz1k2iRLTJCDklcOXMPvvHKq5Td1vwrrabX6YqN5nOT2VZZDNh
	wHEI2Peyohh3QcnNofbb0+icohI4V0O83D9wwWSrZgjKkSSiw1C0Aap6N9/Yj5xzTGQuI31LAds
	1Lqw7PVN2z5uOcYzCDIBN1ppcNA5DqWOdrJmfrhbPJcqPiZ8Y/3h1Vy6eAxhT3CnU/T6nbBjMBg
	xPzxSbFhOMF5IHfvrlrIcxAgKlNEp8Wpj8+jjjQyuEJoTtBVDweVjwaN0zmblXa8eepHU/SfS2e
	4zovvgD4hq0uVpE91o4jYB2ro6ggW9nDwP+540Bbjv0BjJDwQTdbaMdXUo8n0qDIa7G5FXI08Xc
	84h9naTuYdBE07/ydx6OHgsPC1Zt2nMcDfn+8Jb+34OdN0eNQFAdol582xhyMHYNAj2guXH0zUD
	uvt1cHUNeCfRmChnGohjYnm00Bn4x+gIAqjLgBEunyu165A=
X-Received: by 2002:a05:7022:f8a:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b3b60039e7mr2636172c88.10.1794284461889;
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
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
Subject: [PATCH v6 16/25] rust: kernel: Add crypto hash bindings
Date: Tue, 10 Nov 2026 14:18:23 +1000
Message-ID: <20261110041832.1730924-17-alistair.francis@wdc.com>
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

Initial support for the kernel crypto hash bindings, which will be used
by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/Kconfig         |   1 +
 rust/kernel/hash.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   2 +
 3 files changed, 144 insertions(+)
 create mode 100644 rust/kernel/hash.rs

diff --git a/lib/Kconfig b/lib/Kconfig
index daf219282f441..7b1952c5d5c18 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -593,6 +593,7 @@ config RSPDM
 	depends on RUST
 	select KEYS
 	select CRYPTO
+	select CRYPTO_HASH2
 	select ASYMMETRIC_KEY_TYPE
 	select ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select X509_CERTIFICATE_PARSER
diff --git a/rust/kernel/hash.rs b/rust/kernel/hash.rs
new file mode 100644
index 0000000000000..84b3c79a2895f
--- /dev/null
+++ b/rust/kernel/hash.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel crypto hash APIs.
+//!
+//! C headers: [`include/crypto/hash.h`](srctree/include/crypto/hash.h).
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/crypto/devel-algos.html#hashing-hash>
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
+    str::CStr,
+};
+
+/// Synchronous hash transformation plus its descriptor buffer.
+pub struct Shash {
+    shash: NonNull<bindings::crypto_shash>,
+    desc: NonNull<bindings::shash_desc>,
+    desc_len: usize,
+    desc_capacity: usize,
+    hash_len: usize,
+    name: &'static CStr,
+}
+
+impl Shash {
+    /// Allocates a hash transformation and its descriptor buffer.
+    pub fn new(name: &'static CStr) -> Result<Self> {
+        // SAFETY: `name.as_char_ptr()` is a valid NUL-terminated C string.
+        // `crypto_alloc_shash()` returns a valid pointer or an ERR_PTR.
+        let shash =
+            from_err_ptr(unsafe { bindings::crypto_alloc_shash(name.as_char_ptr(), 0, 0) })?;
+        let shash = NonNull::new(shash).ok_or(ENOMEM)?;
+
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let desc_size = unsafe { bindings::crypto_shash_descsize(shash.as_ptr()) } as usize;
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let hash_len = unsafe { bindings::crypto_shash_digestsize(shash.as_ptr()) } as usize;
+        let desc_len = core::mem::size_of::<bindings::shash_desc>() + desc_size;
+
+        let desc_vec = match KVec::from_elem(0u8, desc_len, GFP_KERNEL) {
+            Ok(desc_vec) => desc_vec,
+            Err(e) => {
+                // SAFETY: `shash` was allocated above and must be freed if the
+                // descriptor allocation fails.
+                unsafe {
+                    bindings::crypto_free_shash(shash.as_ptr());
+                }
+                return Err(e.into());
+            }
+        };
+
+        let (desc_buf, _desc_len, desc_capacity) = desc_vec.into_raw_parts();
+
+        debug_assert_eq!(
+            desc_buf.addr() % core::mem::align_of::<bindings::shash_desc>(),
+            0,
+            "kmalloc alignment insufficient for shash_desc"
+        );
+        let desc = NonNull::new(desc_buf.cast::<bindings::shash_desc>()).ok_or(ENOMEM)?;
+
+        // SAFETY: `desc` points to an allocation of `desc_len` bytes, which is
+        // exactly large enough for a `shash_desc` header and its trailing
+        // algorithm state. No explicit init is needed as
+        // `crypto_shash_digest()` re-initialises the descriptor on each call.
+        unsafe {
+            (*desc.as_ptr()).tfm = shash.as_ptr();
+        }
+
+        Ok(Self {
+            shash,
+            desc,
+            desc_len,
+            desc_capacity,
+            hash_len,
+            name,
+        })
+    }
+
+    /// Return the name of the hash
+    #[inline]
+    pub fn name(&self) -> &'static CStr {
+        self.name
+    }
+
+    /// Return the length of the hash output (in bytes)
+    #[inline]
+    pub fn hash_len(&self) -> usize {
+        self.hash_len
+    }
+
+    /// Computes a one-shot digest into `out`, which must be exactly the digest
+    /// size of the selected hash algorithm.
+    #[inline]
+    pub fn digest(&mut self, data: &[u8], out: &mut [u8]) -> Result {
+        if out.len() != self.hash_len {
+            return Err(EINVAL);
+        }
+
+        let data_len = u32::try_from(data.len()).map_err(|_| EINVAL)?;
+
+        // SAFETY: `self.desc` was created by `Shash::new()` and points to a
+        // valid `shash_desc` with a valid `tfm`. `out` is checked above to be
+        // exactly `crypto_shash_digestsize()` bytes.
+        unsafe {
+            to_result(bindings::crypto_shash_digest(
+                self.desc.as_ptr(),
+                data.as_ptr(),
+                data_len,
+                out.as_mut_ptr(),
+            ))
+        }
+    }
+}
+
+impl Drop for Shash {
+    fn drop(&mut self) {
+        // SAFETY: `self.desc` was produced from a `KVec<u8>` allocation by
+        // `into_raw_parts()` in `Shash::new()`, and `desc_len` and
+        // `desc_capacity` are the exact values handed out at that time.
+        let desc_vec = unsafe {
+            KVec::<u8>::from_raw_parts(
+                self.desc.as_ptr().cast::<u8>(),
+                self.desc_len,
+                self.desc_capacity,
+            )
+        };
+        drop(desc_vec);
+
+        // SAFETY: `self.shash` is a valid handle created by `crypto_alloc_shash()`.
+        unsafe {
+            bindings::crypto_free_shash(self.shash.as_ptr());
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a3c54971e9dea..0cf6eab448d08 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -82,6 +82,8 @@
 pub mod fwctl;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
+#[cfg(CONFIG_CRYPTO_HASH2 = "y")]
+pub mod hash;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.56.0

