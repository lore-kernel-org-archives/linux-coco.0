Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284497;
	b=r96UVCrNvybbv4T7WWC8KaCZCZq7HfwW353PossshZqOdM/Bo0LJ91OYM6xX8erl4YfU
	 jURnd87CIB/3uJD+vZl1h2+l+89BI4UdxkSNFUMewHzujo8vYWtIEubJNfm1Ae02GVxOk
	 WlQAX+xbUeQU1HSoqFxYMubMOzEoaVPbJJnFlO3MVvkKLjoLwQHDMoF+DRBO5sTrySTg9
	 J/WOWot6o+Ai/YdYCfmTHLV76+HM5qrQepF3ttMQQ0n5GcImIMi1wIX4gEbAcLJFjtupU
	 8hqH1iR6egfgC3WEuQ+nnzdeMpuE5ERbAAg8GKNz4C6z72oKgz9IFNijo23RjvDeqUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=odWeZv+wWSyD8twL4Iv1hdHOEwYuH8TFJO8N5Al4CP4=;
	b=Yhwo9C1WGoDpiM2STEZxOT/BWAZsgvuU+MIvhwRBA4lg3L3MbDYnojo27b9l3flQnQ0a
	 H4wzkQp3Y3ALiZVJmeBZRc4fd7piC3pcCgqEl16AtRBY8ZaGpMLMO59opwGI58at989k8
	 FMzHvaeg83JNjDTrns4TOZlMekAzirJAmWcriYEcB3j0eK9b2JRDgGbsQ3JE9CKIWlOqX
	 z/kl/hWMQTEFfomIjZHr9E4ok6MVQq4grOtDAmJvNq5Za1Dwgo8tkrNj6Rq41seg6nJ81
	 cTPNXFwW9Dk2e1SPLplzFeqbIxNg4X5xl/DgQIKli79tidEb4wSpkHTjJs6rebdx77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGrIwoAr;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CD606E8EF
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41CD606E8EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGrIwoAr
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1156980c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284496; x=1794889296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odWeZv+wWSyD8twL4Iv1hdHOEwYuH8TFJO8N5Al4CP4=;
        b=TGrIwoArh7WGEzZAs9dSlHeVDqbbOJTa8CI5ICvqkuMyPDo6NBGfN5fem7rhfolu7U
         KPsW1Ed40awMYGaUjzcGVdDW0iFOelMHr3Z8IRTibeSgi7LoBUVXzjkXpAJSbphDqC4k
         vZgKfzMkjfo3nLdl2LBA9QxOGnsNj1sq7UdGOxxG8pfyC1lUFUH+Qhzp+6tA9UVMKkNZ
         jyVYbZTR/XyLIgUyVgndxd20E3QORNZCUdFax3rwYnesVlPIZLqDH4j24RPhM0fQQIYw
         +o2OKu5D7jF6crrqYGzqXlzn2PXozeA5MzQ2cMVrjTzrMx2MCoBkZ6NXzV15PgDVCf6C
         l7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284496; x=1794889296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=odWeZv+wWSyD8twL4Iv1hdHOEwYuH8TFJO8N5Al4CP4=;
        b=YN4vrCfwvm8aXgPgZyFaOUcneu2Ra3WCFWTcuToHt9DaQeOhIRXEK7W+d5czoa9GOr
         uB3STdrNserl3QhEPThQNA+mamlAg8nCFRLp8P59SeJgc8vjThrqmhb9F8swXcOOI4yB
         NUUaqccVy86FP9Lg+hv72Qpe+EHAxpHAr1AA8j3K5IZhlwrD32JGrcmxTQjhWYI7WV71
         Zz3OZnKYZIqyJXbuMh0H5zsCIA8W3qOsbWZruM17gcXT+9c3TUGT5f3qLHnVx/kbbnq4
         7+crLZ7VLTi5YOx4/GBFqGv9keFjBfg5wA+XXh4o9feA6E97QRHVb/vxaKArU0TkO8st
         wP1g==
X-Forwarded-Encrypted: i=1; AL+hErHaSL/NUBZDm10i39oAeRy5ncoHeATtJjO6ErGTQr/IiEGk0pkGbp82qEymRHMwVJPmRSlIr2zaBmFn@lists.linux.dev
X-Gm-Message-State: APuU4Z/YP0PWx+eKPGVjfr9dcMWnGirEGZn0DH8fSh3AF8G8LL5+gOTN
	ooI1JU29e2p41gtAlKgiwnZP8YhsI1SxF/pU2iL7Sx5lLY9HNC0P/7PV
X-Gm-Gg: AYBFou3M3Ow423Z44iMzrGhY9aq2Mo5Q3Zd+wlmvSdVFe+bH30xviV3w4GPl/no6npE
	g0mThtv3SXvcXH4uB7ky5Ry0v6rCLNo0NJW+CDoa5tJpBs0wbdLi7praY6/SrX33NIP09tJLVB6
	5+VEGqJXYNwk/9e7S5GZ3D/tudXO3IymwtPDcfOQidC8KLkfd9EhyFm9508TC4Nx1SIDAt6y7Tl
	T1nRYM+JOubGIx75sjL1EAoZN3f2XEl0o1luHDipQy39L6VGWMX1K6ordOUE7QI+cLoPlxR6nvr
	OIkCnRXORO4L4m210QexLqmFl/vkqcoIOvjqj1TLuWrlNlm+EcbMZrRIee6uWPZNQfbIr52kRfl
	ul36nBhEzVWWSjDDuVv/pC5CfkdlVxCnOAEUd26qO7SLJ1a1PpKhLaG3XMRwkbjXmf5MDC8pfdw
	bDg7OXbzkoZJ2ffOVJrYUS4A+Yza+1Yh2SfFOQFzwo4f0hfFXIUeauVAa0IBHj8au8tLAHEi+qQ
	zheK8vHKt4e4YgnJoovhSZfkCTWqzr+yHZQYQ0SLSigth60RAYIZ9qVjPBlGhhAgZ3xrFnxLxPz
	yTF1kTLnp/v2CuNxId+tGzXBZGYvXX+xwc2fHhbHBrbHitM=
X-Received: by 2002:a05:7023:a5b:10b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1b3b5fda050mr2101350c88.11.1794284495718;
        Mon, 09 Nov 2026 20:21:35 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:35 -0800 (PST)
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
Subject: [PATCH v6 20/25] rust: public_key: Add crypto public key bindings
Date: Tue, 10 Nov 2026 14:18:27 +1000
Message-ID: <20261110041832.1730924-21-alistair.francis@wdc.com>
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

Initial support for the kernel crypto public key (asymmetric-keys) bindings,
which will be used by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  2 +
 rust/kernel/public_key.rs       | 83 +++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 rust/kernel/public_key.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a2512fda77e1f..da8855899c530 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <crypto/hash.h>
+#include <crypto/public_key.h>
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0cf6eab448d08..8ad9e61d1a6fb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -122,6 +122,8 @@
 pub mod print;
 pub mod processor;
 pub mod ptr;
+#[cfg(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE = "y")]
+pub mod public_key;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
 pub mod ratelimit;
diff --git a/rust/kernel/public_key.rs b/rust/kernel/public_key.rs
new file mode 100644
index 0000000000000..0c0d4c98bb570
--- /dev/null
+++ b/rust/kernel/public_key.rs
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel crypto public key APIs.
+//!
+//! C headers: [`include/crypto/public_key.h`](srctree/include/crypto/public_key.h).
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/crypto/asymmetric-keys.html>
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::to_result, //
+};
+
+/// Owned `struct public_key` wrapper.
+pub struct PublicKey {
+    key: NonNull<bindings::public_key>,
+}
+
+impl PublicKey {
+    /// Create a Rust `PublicKey` from a valid C `struct public_key` pointer.
+    ///
+    /// # Safety
+    ///
+    /// `key` must point to a valid, exclusively-owned `struct public_key`
+    /// whose ownership is transferred to the returned `PublicKey`. The key
+    /// is freed with `public_key_free()` when the `PublicKey` is dropped,
+    /// so the caller must not free it itself or pass the same pointer to
+    /// `from_raw()` again.
+    #[inline]
+    pub unsafe fn from_raw(key: NonNull<bindings::public_key>) -> Self {
+        Self { key }
+    }
+
+    /// Verify a signature using this public key.
+    #[inline]
+    pub fn verify_signature(
+        &self,
+        signature: &[u8],
+        encoding: &'static CStr,
+        hash_algo: &'static CStr,
+        message: &[u8],
+    ) -> Result {
+        // SAFETY: `self.key` is valid per the struct invariants; its
+        // `pkey_algo` is populated by the key parser.
+        let pkey_algo = unsafe { (*self.key.as_ptr()).pkey_algo };
+
+        let sig = bindings::public_key_signature {
+            pkey_algo,
+            s: signature.as_ptr().cast_mut(),
+            s_size: u32::try_from(signature.len()).map_err(|_| EINVAL)?,
+            encoding: encoding.as_char_ptr().cast::<u8>(),
+            hash_algo: hash_algo.as_char_ptr().cast::<u8>(),
+            m: message.as_ptr().cast_mut(),
+            m_size: u32::try_from(message.len()).map_err(|_| EINVAL)?,
+            ..Default::default()
+        };
+
+        // SAFETY: `self.key` is a valid public key handle, and `sig` points to
+        // valid signature/message data owned by the caller for the duration of
+        // this call.
+        unsafe {
+            to_result(bindings::public_key_verify_signature(
+                self.key.as_ptr(),
+                &sig,
+            ))
+        }
+    }
+}
+
+impl Drop for PublicKey {
+    fn drop(&mut self) {
+        // SAFETY: `self.key` was either returned by `x509_cert_parse()` or
+        // manually transferred from an `x509_certificate` and has not been
+        // freed yet.
+        unsafe {
+            bindings::public_key_free(self.key.as_ptr());
+        }
+    }
+}
-- 
2.56.0

