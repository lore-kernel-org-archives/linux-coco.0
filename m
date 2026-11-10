Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284342;
	b=vLog2nqjaOyAsd4HXVt+5NeU/1chmDiE97aB5ZskRNj2R9l1fMOxgdZDYzfuAVn7PN1e
	 O8ABiZ8uFxhdUDvZ9xtc41guLGWAo38Iw0i8HqtnEaQ1wBXo/OLmoXQpGf+vctNbBKWgP
	 2uKHvvR19i1O6vAw5sARn1OgOM0XVwEIl68DKNPt5vxKhS+gzfUb8a6kF4IaYKbjTZFZw
	 DP1vMoU6ldCy/dtAJz6XGaHYh49PKFztbAkMhoUNt43nAYVZ4e6R7d28s5vULq3AY8NjP
	 9aizYUjX2peA1HWhrafvWSEulV7EKTe61m/EBRQWVObdChz+AP0s6VIR6atz+uFfk2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=voHVtFiTaOYWQ2BNxOE2wKBfGbWc/Y1RKhh4B4Lqnjs=;
	b=bJIiUsQ6EF9lIMNi5g5N1LG8Pc0YlHsCox2HOlaqvJcWmTDDQFzqtGli6aFZv1HtaCPz
	 BcMIvPe6gZdTxL/MWF/IgqT1XhD24gmFqMFczzuFZ2X4YiMckT3QifGHn/g9E9tbBPUM8
	 SreFyI1eJhetjqv7fyxEvuP44kRro9gIoaEnrIZfw4x+Q4JEpE314dZcVoVogpZVNZVs5
	 mvDrvNAQeCqHEOZ5vYmyZonOoh2megB9YfB7lsd7iAJeGFOhI3FFbQ8UDhKUzhZpppNFH
	 UX7wD1ARxpfp82efDAF9aYlCEratSuMY915cFlQFbmllR65r3nBQ0VpI2bEUI7v09LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzrhgSqH;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A4606A338
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113A4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzrhgSqH
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso2023703c88.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284341; x=1794889141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voHVtFiTaOYWQ2BNxOE2wKBfGbWc/Y1RKhh4B4Lqnjs=;
        b=qzrhgSqH0ZpydYbho/wJM3Ex5WVyL2yrRY7u0h+XzeraZJ5WLEafD/QcZPeM8sKo/m
         V3qZshP1Flmlxgdy0Gaclwb8n/JiRfGjVG+OuztuhFvkrcf77BvthtImkXTPqpa2FBRs
         qaISmkdlL5jieuDOZ/0pQU1CAIQfNKmTIsT6DPTY164O3okr0TMCuTH0jfnOEH+HOStb
         pMRETC+B8NevE8M5uLvMB6DSwdV0yYcuSofDU1DHfT3WP7rmw3Gor2RhQtpdYnCg4Zmk
         1UuzKMqmcQRC4IMixnZvXeD9krSCl11SZTcGI3Lt83pR7jSlwL+J2bsEOC5GedUM79Oa
         ZNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284341; x=1794889141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voHVtFiTaOYWQ2BNxOE2wKBfGbWc/Y1RKhh4B4Lqnjs=;
        b=McCJ/9z5CAD85flXxxD6abuT9DZxTnKT0RbnXdYElmMMZ/piMr0HZKteVFUH82ZnPe
         UaWfn8Mirf+t5DJB8noiM+QVuKi356iRnefbacfqyzD1qxoXdD1uWh9Ssvyrce3PId4o
         GFOFiH2qdVpWk/gtJHi91cPzbzQ9ajx4AV8VUKAXv/64KFzoQJzYCcAX7GwNLdCbwKCm
         KXlYtvpn+0m/jaYkmt+8jafh8Z9S1TucprZ7bE1t5IPe+1sQTVwFueoS9HYPLpnb5rIa
         yX+jhmRxaBLX9Pa1B0PJDKHD8GZbeKGjqLuO2pDmwpNEBSThNfeBt1s7++dSfPxJo638
         fT1g==
X-Forwarded-Encrypted: i=1; AL+hErHBDg1jdDTUX0bf6F76hHFM6xNDBVc5JYC6NSmvwTgo0BFPb+aq665W1rgQYhnVgIFf4z1L0v/Ki9K6@lists.linux.dev
X-Gm-Message-State: APuU4Z8OdbnogOJVEVbJM6NSDmNy1g6ydPlB79Y/K7EncXW3tpOZATWo
	Qw7VQFU1cHVbuMaf7BeSgYcgDwKg93bSm3nY52oY/eq+qWilJQqlTmb7
X-Gm-Gg: AYBFou1mrfYEL6pEWUEJ0ZOZSBp/UC15s/xRAbwewiettBB0+OoDmi4bZOlAtXhbwBq
	SMZhpTEkkcW2QppxlcuVM2ux1JGRniHdTeMh4FRTLPYRafaddcovOgwVg1lcu07CO9Tb6nQHxiA
	qtVJlzgXJhSoXBWnKAkMf9sykp+t0j0flBDAs+wsZvUR20fjuNf5+sP1Cb1psvsQ1dl3O4ZIepE
	CuiWODJx+o3c944T096iVNQlpijmWtbX6SrwNb6QZL+8/luQcrq2AVDODFQHy6ft29bACSiNqIz
	kNSMrarXV+DiwpiRXv0Ltvkyv9XqI6A2FzXpdDQNk65y5pH4lKwWNUvvv48Icfcqobft7PgvvLN
	33xIRS/FJCazI1tKvzWEw8VeGYv/4/wqq4gFSrT2FEVgCR+VO5RHIb6tcecFO3ALQlWwxfieYB6
	ju6Tipi8cOW+P+dRH7SCkgaFfoKKfduE7uoGjLbIlQ6xvDj+qP9zQfgGVGQW9DIi9mDFUNnGZs+
	jfBtM+n5kSINnS8WD9LQim0Rl1/ZuGHKNT6bSw2WNW2EDAzEyho48US5HUuABy6HazEzBTgtq7o
	yu73UNQ1wZJ1OlpT9Y1za1L8+k0MPKkZhJzPksSHs3J5fThgOedwhwSAj9dwJmisu4sI
X-Received: by 2002:a05:701b:2608:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-1b3b5fd221dmr1835080c88.7.1794284340890;
        Mon, 09 Nov 2026 20:19:00 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:00 -0800 (PST)
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
Subject: [PATCH v6 02/25] rust: create basic untrusted data API
Date: Tue, 10 Nov 2026 14:18:09 +1000
Message-ID: <20261110041832.1730924-3-alistair.francis@wdc.com>
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

From: Benno Lossin <benno.lossin@proton.me>

When the kernel receives external data (e.g. from userspace), it usually
is a very bad idea to directly use the data for logic decision in the
kernel. For this reason, such data should be explicitly marked and
validated before making decision based on its value.

The `Untrusted<T>` wrapper type marks a value of type `T` as untrusted.
The particular meaning of "untrusted" highly depends on the type `T`.
For example `T = u8` ensures that the value of the byte cannot be
retrieved. However, `T = [u8]` still allows to access the length of the
slice. Similarly, `T = KVec<U>` allows modifications.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-3-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/lib.rs      |   1 +
 rust/kernel/validate.rs | 198 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 rust/kernel/validate.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557a..a3c54971e9dea 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -147,6 +147,7 @@
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
+pub mod validate;
 pub mod workqueue;
 pub mod xarray;
 
diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
new file mode 100644
index 0000000000000..5926d0697d3ff
--- /dev/null
+++ b/rust/kernel/validate.rs
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Untrusted data API.
+//!
+//! # Overview
+//!
+//! Untrusted data is marked using the [`Untrusted<T>`] type. See [Rationale](#rationale) for the
+//! reasons to mark untrusted data throughout the kernel. It is a totally opaque wrapper, it is not
+//! possible to read the data inside.
+//!
+//! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
+//! direct copying of untrusted user data back into userspace without validation.
+//!
+//! # Rationale
+//!
+//! When reading data from an untrusted source, it must be validated before it can be used for
+//! **logic**. For example, this is a very bad idea:
+//!
+//! ```
+//! # fn read_bytes_from_network() -> KBox<[u8]> {
+//! #     Box::new([1, 0], kernel::alloc::flags::GFP_KERNEL).unwrap()
+//! # }
+//! let bytes: KBox<[u8]> = read_bytes_from_network();
+//! let data_index = bytes[0];
+//! let data = bytes[usize::from(data_index)];
+//! ```
+//!
+//! While this will not lead to a memory violation (because the array index checks the bounds), it
+//! might result in a kernel panic. For this reason, all untrusted data must be wrapped in
+//! [`Untrusted<T>`]. This type only allows validating the data or passing it along, since copying
+//! data from userspace back into userspace is allowed for untrusted data.
+
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::from_ref,
+    slice, //
+};
+
+use crate::alloc::{
+    Allocator,
+    Vec, //
+};
+
+/// Untrusted data of type `T`.
+///
+/// Data coming from userspace is considered untrusted and should be marked by this type.
+///
+/// The particular meaning of [`Untrusted<T>`] depends heavily on the type `T`. For example,
+/// `&Untrusted<[u8]>` is a reference to an untrusted slice. But the length is not considered
+/// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
+/// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
+/// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
+/// totally opaque.
+///
+/// # Usage in API Design
+///
+/// The exact location where to put [`Untrusted`] depends on the kind of API. When asking for an
+/// untrusted input value, or buffer to write to, always move the [`Untrusted`] wrapper as far
+/// inwards as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_from_userspace(buf: &mut [Untrusted<u8>]) { todo!() }
+///
+/// // and not this
+/// pub fn read_from_userspace(buf: &mut Untrusted<[u8]>) { todo!() }
+/// ```
+///
+/// The reason for this is that `&mut Untrusted<[u8]>` can be converted into `&mut [Untrusted<u8>]`
+/// very easily, but the converse is not possible.
+///
+/// For the same reason, when returning untrusted data by-value, one should move the [`Untrusted`]
+/// wrapper as far outward as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_all_from_userspace() -> Untrusted<KVec<u8>> { todo!() }
+///
+/// // and not this
+/// pub fn read_all_from_userspace() -> KVec<Untrusted<u8>> { todo!() }
+/// ```
+///
+/// Here too the reason is that `KVec<Untrusted<u8>>` is more restrictive compared to
+/// `Untrusted<KVec<u8>>`.
+#[repr(transparent)]
+pub struct Untrusted<T: ?Sized>(T);
+
+impl<T> From<T> for Untrusted<T> {
+    #[inline]
+    fn from(value: T) -> Self {
+        Self(value)
+    }
+}
+
+impl<T: ?Sized> Untrusted<T> {
+    /// Marks the given value as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::validate::Untrusted;
+    ///
+    /// # mod bindings { pub(crate) unsafe fn read_foo_info() -> [u8; 4] { todo!() } };
+    /// fn read_foo_info() -> Untrusted<[u8; 4]> {
+    ///     // SAFETY: just an FFI call without preconditions.
+    ///     Untrusted::new(unsafe { bindings::read_foo_info() })
+    /// }
+    /// ```
+    #[inline]
+    pub fn new(value: T) -> Self
+    where
+        T: Sized,
+    {
+        Self::from(value)
+    }
+}
+
+impl<T> Untrusted<T> {
+    /// Marks the data behind the given reference as untrusted.
+    ///
+    /// Unlike [`Untrusted::new`], this does not require moving the value.
+    #[inline]
+    pub const fn from_ref(value: &T) -> &Self {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`. The cast
+        // does not introduce interior mutability, as `Untrusted<T>`
+        // has interior mutability if and only if `T` has.
+        unsafe { &*from_ref(value).cast::<Self>() }
+    }
+
+    /// Marks the given slice of data as untrusted.
+    #[inline]
+    pub const fn from_slice(value: &[T]) -> &[Self] {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`. The cast
+        // does not introduce interior mutability either, as `Untrusted<T>`
+        // has interior mutability if and only if `T` has.
+        unsafe { slice::from_raw_parts(value.as_ptr().cast::<Self>(), value.len()) }
+    }
+
+    /// Marks the given mutable slice of data as untrusted.
+    ///
+    /// To obtain a mutable slice of untrusted data from a trusted buffer, mark the whole buffer
+    /// as untrusted first instead, e.g. with [`Vec::from_trusted`].
+    #[inline]
+    const fn from_mut_slice(value: &mut [T]) -> &mut [Self] {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`, see `from_slice()`; the conversion is
+        // sound here because it is only reachable via `DerefMut`, where the source is already
+        // untrusted.
+        unsafe { slice::from_raw_parts_mut(value.as_mut_ptr().cast::<Self>(), value.len()) }
+    }
+}
+
+impl<T> Deref for Untrusted<[T]> {
+    type Target = [Untrusted<T>];
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        Untrusted::from_slice(&self.0)
+    }
+}
+
+impl<T> DerefMut for Untrusted<[T]> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        Untrusted::from_mut_slice(&mut self.0)
+    }
+}
+
+impl<T, A: Allocator> Deref for Untrusted<Vec<T, A>> {
+    type Target = [Untrusted<T>];
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        Untrusted::from_slice(self.0.as_slice())
+    }
+}
+
+impl<T, A: Allocator> DerefMut for Untrusted<Vec<T, A>> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        Untrusted::from_mut_slice(self.0.as_mut_slice())
+    }
+}
+
+impl<T, A: Allocator> Vec<T, A> {
+    /// Converts `value` into a `Vec<Untrusted<T>, A>`, marking every element as untrusted.
+    #[inline]
+    pub fn from_trusted(value: Self) -> Vec<Untrusted<T>, A> {
+        let (ptr, length, capacity) = value.into_raw_parts();
+
+        // SAFETY: `Untrusted<T>` transparently wraps `T`, so `ptr`, `length` and `capacity` also
+        // describe a valid `Vec<Untrusted<T>, A>` allocation (same layout, alignment and drop
+        // behaviour).
+        unsafe { Vec::from_raw_parts(ptr.cast::<Untrusted<T>>(), length, capacity) }
+    }
+}
-- 
2.56.0

