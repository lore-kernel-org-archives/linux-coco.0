Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284350;
	b=RwBds0v89k+60LE/E9vgr+sUmsiohJETHjVFmj5xJS7/CfOujUx2D84ymQXYui6LyFKv
	 aXyzLw7jN6hxn7FN19ANf43ioaGdxsj+beH6+rWqM/qOpguaJmDQOdMtYIT2gY2TcNUWC
	 w6gtOvSf7UJhtsjLbJGcx7cVAm3Gs0q688t1oiMTFpKBVRUOUHc2FFlte2BWdw3q99frP
	 rZsi+UlwneLFkCjmkFrVlztXn9SZkOKYt2T7txbYN+x2/Oa+E3ismr3SGXnUM4Wy6pfpk
	 1+lJT8aHNzFk2ljxOeRREmgoO0/j2eKh/OUwSvs8ZkAz+2f0554mJmgpY/aHMNSmxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
	b=ITyxlWi4T8N6LVSQBSFpaWFmoW+6wyNwtgQVH3j3KHoHU0E1/PQgaGApbpkKcDIAEh7N
	 QnFtNnbKfbMJnhdQ97fZNqrgsUFzOJ1cB9LryHYPG5u7F3u103Mfl5JzbfjxGz47HvPZN
	 suW+fsTggIbs29OLl/4v1sLF7+7pL9HMwrWy09AutwwQOaAfCkXFrYcohP0wqcghHst8o
	 scs125MXMyb9Cgzarj+3EZuMYPthBwv75dAtCjnxqEgiaESJinNeaI35F/j7uCtCOeW2A
	 Fki8fEZXuyZR63EKHA1Dq38ZLQk55PfGBPX+8ULz+iP9jLI0zjrVHVOEnVlB8+nGMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBfPjgyM;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB9606A32E
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AB9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBfPjgyM
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2880111c88.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284349; x=1794889149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
        b=HBfPjgyMnE5YYOGL3IjEd0FIUtHt3jtp541TLG0m5S5prvzVuqydGSofWVOA2ii/3x
         +bRmFftg5OrlIa1vNagtIVRPJ6yDnan3ejoGW4nTogMJ4oyiKVr2iUSvu/egPkW8PQqI
         FGh24NS/JUOqChR1HL+Luxfr5tfAEseDv13unulkoTGreJzOElTOzNwEGU7qxf//m1Nh
         QWcfgVlT5ygSzpxn+fpnMRJZjQhZ02Bmw6x5RCkm6TU7Imqy4y3e51WgW2bje8m9bC6X
         +oOwYFc3AHfcoqOVJ1GzDlpCh4H79Vrw23G5MFr4mXYxQEeosfG6CzaCTMRev+qztWty
         P/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284349; x=1794889149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2kMsOhp92fCLsO0obs3IL9PPq/SCiWUbTQc+uhZCXU=;
        b=OIA8FuL2Oploup5fONmIx6RmB4Gu3wBICnp/3vx8o4FwhXxZXvpOT5j39yeC5hEsOx
         eaoaZpaxmJ9dFwRCffzC5Y3MT6gD4pQk7cPpjqXRWnT/HXpI1HTiz4Q3zoX8RoZjD3jM
         hoOycqGkqG3own3XBtie6J96edgUiJiu21x2x3/IjVcXurZ/ahFZVvzsnwD3XaXLiAcz
         ZS9WRRyU/W/pt3iwzIgIOCrrXqxEqKhITnR61+C0IgsTDMKO/46ewqdAnU2VKufSrn/n
         th+GMHAYi/4ElH2Tsu7MPxhaJVl2EKClbJ8sz91whW9vzqaybtNJz/m1gU1mluPb++AG
         qPmA==
X-Forwarded-Encrypted: i=1; AL+hErEBh4o2r2DSr+6IjrjlDoowh+fWnPsHAcLzLAu1AMeHxdxppkSGuue/R21ceQAlerhC4272Gcu6I7FT@lists.linux.dev
X-Gm-Message-State: APuU4Z8wnyG0R7qLMqViAFser05p5EdeN6851GZ9bCgJuHY7TX5Q+jFN
	gIMqiTDSGQk2dNdidzI9b8xrLdC7O0z64rzMOc0E7piccMFygHxTDh1t
X-Gm-Gg: AYBFou0949CGB9JqJ4IIxl9gcWvWUSXK2c3i71cGM09NIIJ687nPfKLq0VRLLWgkWNn
	+tffqh/C7opQDjZ8ENC25e77xNtpJvvfaNY7nPDnahK3Lwl1JUUy8zBsmBXS6E3pP8MIfZh9Uln
	knhFMuuTB1jEy0510t3CWiPqiWl+vgHjeqoXvKu2fKVGQj2lgRKeUpjvZA3GVVIpxFYdlRaA9X1
	uuxqGpQpPF8YgZd9k62482eM+0U7DOUz8I3FqzqxyCSL/3z9OUaDMBgxzgOzPiTVnoGzdWLEN0J
	ZnJLO8ttkdtFTeUlxBMahhogrpOPoQkLQebnbh8Mdb2I8eJUsHF+RSkuH+DndDjzwDECEcUyLBe
	FryCwgsUbyB6x1uXaLERvTZZcGNDoGO7jLX1SmRVF8MvFqZhLRixxl1eb+Axj6aZtuGovysNS9z
	CiCS8DycqnaNSfSQLBrOIoYipvSav0i5Bp8kEnXzGU5d/9pNZKBbQWVsAc3Hvl8dUQi+yjQ+EKp
	LLxJ+aoTJAf/ad9eX619rKE61xrabCXobHX8QnjIJUWuYTgYIbUVFA4zky1Z5qTosaQRike6G2+
	yp11p+Zg5Ngb/Y4WCkezLZxa5n8YJE0v3OxpBdg9EgzEA/A=
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr2240260c88.41.1794284349175;
        Mon, 09 Nov 2026 20:19:09 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:08 -0800 (PST)
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
Subject: [PATCH v6 03/25] rust: validate: add `Validate` trait
Date: Tue, 10 Nov 2026 14:18:10 +1000
Message-ID: <20261110041832.1730924-4-alistair.francis@wdc.com>
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

Introduce the `Validate<Input>` trait and functions to validate
`Untrusted<T>` using said trait. This allows one to access the inner
value of `Untrusted<T>` via `validate{,_ref,_mut}` functions which
subsequently delegate the validation to user-implemented `Validate`
trait.

The `Validate` trait is the only entry point for validation code, making
it easy to spot where data is being validated.

The reason for restricting the types that can be inputs to
`Validate::validate` is to be able to have the `validate...` functions
on `Untrusted`. This is also the reason for the suggestions in the
`Usage in API Design` section in the commit that introduced
`Untrusted<T>`.

The `Validate::validate()` function allows additional context to be
passed, which can be used as part of the validation process. For example
comparing data against already negotiated information.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-4-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/validate.rs | 85 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index 5926d0697d3ff..3f5fed5eef219 100644
--- a/rust/kernel/validate.rs
+++ b/rust/kernel/validate.rs
@@ -11,6 +11,9 @@
 //! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
 //! direct copying of untrusted user data back into userspace without validation.
 //!
+//! The only way to access untrusted data is to [`Validate::validate`] it. This is facilitated by
+//! the [`Validate`] trait.
+//!
 //! # Rationale
 //!
 //! When reading data from an untrusted source, it must be validated before it can be used for
@@ -53,7 +56,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
 /// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -116,6 +119,42 @@ pub fn new(value: T) -> Self
     {
         Self::from(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate<'c, Context, V: Validate<'c, Self, Context>>(
+        self,
+        context: Context,
+    ) -> Result<V, V::Err>
+    where
+        T: Sized,
+    {
+        V::validate(self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_ref<'a, 'c, Context, V: Validate<'c, &'a Self, Context>>(
+        &'a self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_mut<'a, 'c, Context, V: Validate<'c, &'a mut Self, Context>>(
+        &'a mut self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&mut self.0, context)
+    }
 }
 
 impl<T> Untrusted<T> {
@@ -196,3 +235,47 @@ pub fn from_trusted(value: Self) -> Vec<Untrusted<T>, A> {
         unsafe { Vec::from_raw_parts(ptr.cast::<Untrusted<T>>(), length, capacity) }
     }
 }
+
+/// Marks valid input for the [`Validate`] trait.
+pub trait ValidateInput: private::Sealed {
+    /// Type of the inner data.
+    type Inner: ?Sized;
+}
+
+impl<T: ?Sized> ValidateInput for Untrusted<T> {
+    type Inner = T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a Untrusted<T> {
+    type Inner = &'a T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a mut Untrusted<T> {
+    type Inner = &'a mut T;
+}
+
+mod private {
+    use super::Untrusted;
+
+    pub trait Sealed {}
+
+    impl<T: ?Sized> Sealed for Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a mut Untrusted<T> {}
+}
+
+/// Validate [`Untrusted`] data.
+///
+/// Care must be taken when implementing this trait, as unprotected access to unvalidated data is
+/// given to the [`Validate::validate`] function. The implementer must ensure that the data is only
+/// used for logic after successful validation.
+pub trait Validate<'c, Input: ValidateInput, Context>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Validate the raw input.
+    ///
+    /// `Context` is additional context needed for validation. The `'c` lifetime is the lifetime of
+    /// the borrowed context (`&'c Foo`).
+    fn validate(raw: Input::Inner, context: Context) -> Result<Self, Self::Err>;
+}
-- 
2.56.0

