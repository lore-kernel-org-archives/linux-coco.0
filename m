Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284538;
	b=QsAGv2Rl2NchBlXIRm2KaaAgVSjm8ixPkg/QEsYg8X2Hzvbc9GnVp6E2hFe1NsNKaRJl
	 tsdQ3IbDT2JEFCTFzixCB1vIoWScvjxCYYN76pGtOXo27IAo90y8OG8+KLE9rfPgHxG/c
	 eFEnJPrBKFTEbR3KmroDDiY7x0LBuAN09uw+p8hjTr/a8OJmAJNexw/LaNrkAKOQ9ur6Q
	 nK2ExuiAXu7q0vrmkddvsZEMKhtAoWctjYeY8nwUaPrM2B9Rm/DKyz9/ncAXKCo3QFsY1
	 BxsXKHEm1URO6GEZ5OyxN2/L8m6ZLLogX2sxvAjgwZQ0um75nWVVnfOSI2YnTXUwbIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
	b=D3T4t0m2deknFsFJvaYm+I9YSc0PXO6WidHNUSUR9ecjC943jUBVCMU14brxpoe1YuxZ
	 HinP7FeDb0qvZ6BVNvrPC6c07ssVT/8W8GSLWkvO/5ohK9bIRO39kvi4rCU/RrtsPYK+r
	 lnyMczESWhQHoUmwQlTX3Li+nbx0B04snYzoTCS91iD0DJLfm2Oo6SkGcaKWt7JwyCfyB
	 IxtKKfXs1BIG/5kbvij1w2MqbCiSTJIIKhQUQp21aF+VW3b0c6D2SwGBlKG+Mwzyt1/7w
	 eVEKzU/6NAef9jyua4XdMZvtHyFgl1oOnX/u2aLA5TbyZ2QwP+gCKTCX4PmhsTkbgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xx+61Cku;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E05606A733
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E05606A733
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xx+61Cku
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2883153c88.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284537; x=1794889337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=xx+61CkuoNt9lw/ThO/gdFDSfUGwGFUfnGyn4tw36mze/1Pxy+0BkgBfgucx2VQiJA
         /nvJ3U+8IEHAf4NwAfvidPCzgwSDeYh31Pqs6B6cAZycQ/VuJ8d2f5SBZSFZWvdF9tEZ
         4Catg12VyYa2iRAwCFqfIAwFbZAyrg3YGJkYK3yvRGI77RGOSb/RmuLZsF1zQ8NvUhKH
         DXwceCO+3ZfehU8KmHxX8VFOGL6okwwq39yW07701J2Melp2mBmgI2gCq2mTXVyhuwVQ
         4IGJA0bOjiE6wxm7PV220NCJEi/3+houdrLvARQIqgV/rFtb3Wf8Sx68S7/KPVBQzzDb
         CD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284537; x=1794889337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=ox8AmZU9jDozSBevmBl7KTsOQ+qeETbRTF2ZMx9x7TfJXA6SDg0r+kouhMCgy3QKdo
         FdvkfPXpmPS8xVBq8Emmf34SQ+bOFE2kRcq1o+Nbn9qzqi4bpPyMWOxodVMp0EudVwe6
         mO/SqPJIIW3/ptX2qIVsd5cX3lMMXW/dw/gpZyblUxOWtp8QDVerqTuBsGwllN7L1uRZ
         a/VfLfA+7UJnFUKvMALiLsjCi+0JRCkSZnY8pEBrYorL+YkRqReYnDS4+39sYHXoU9MM
         Kkl99eGQ++XJUc5CdRcks4tm0ZpkZQGoOS5swvr+Ej8/O75X8D4/w6JEH2TJk/Ug75Lp
         L6mw==
X-Forwarded-Encrypted: i=1; AL+hErHAUvcMgab8VnLWlbGUihxRFcWUN61ZQAqQToBiY8mX0XiyS2bMNBsLaIRzcbd7UanaYqhM9mLp+4Se@lists.linux.dev
X-Gm-Message-State: APuU4Z8IuLd56l/TbIpuBmssYIw1KWr/RrRLUiAv5napc5f/uA5uEXsJ
	JTCNZXtC6YW/i6zskcDZrEcV0Hy4L0DtfXsM4O3GpidbOSAD/6G5hJ8Y
X-Gm-Gg: AYBFou0m2a+ix5k6GEz/081W8kCXVYn0icPSLqUO1YgJcUsvA15vMxuY+bg4wN9o31b
	PkACVOVtVuPx+AisGH/aSbDd0tDM4S/YOdWMI2Ss/2kwtIJMDBR4z47ZhFZ+pPiyBYpAQyQ7zNc
	ckHoU0vvhkl8QJpdpk2xySfhgtkrFZCJ5AwGUgAW3KqzTPbXbLojcGLIPFuy589pKdA1GHTw4tl
	sTxYJPtSoU3Kr/AcDQwLHfEdJTkdLYSb9jPxaM4/wjefbeJjMiKrX+MRg/2w0dDDUTZbRMctmLb
	RWVONd9Nw9pHQ93ztnQ33SfknEmclf3JW6tK/V4b+HylFZzLq8fFHUhZIwzk3I2RGzEs73ybco+
	0hR+75mCZf3GqVLrxNQRgag0t0TF5DN8owbQv2DnsnheQWScArScOfSgwfosUVCQRdeqzLQmCjw
	AJlgkHEq+BIik/t67kTI7CgiBjZlJug/GaH7Uqr9bnUkGXkPzg+APAaOIbmJ6fqaK7uGOM+Cg7b
	TLWYY3Hrq5OZZgSxkO/wlaHGTZbBgm2C1jzkGqdr1YRlltpgmZfD3AUc4JZWNwoYYtTwInEqcFH
	68vdMGxYhA7OuV4qBhnDWemyHIrsn8eXEVD8Ojnw1ezTWu8=
X-Received: by 2002:a05:701b:270c:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b3b5fda3bfmr2024081c88.13.1794284537372;
        Mon, 09 Nov 2026 20:22:17 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:22:16 -0800 (PST)
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
Subject: [PATCH v6 25/25] lib: rspdm: Expose public Rust API
Date: Tue, 10 Nov 2026 14:18:32 +1000
Message-ID: <20261110041832.1730924-26-alistair.francis@wdc.com>
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

Expose a public Rust API and an example that can be used to authenticate
an SPDM responder.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/rspdm/lib.rs   | 69 ++++++++++++++++------------------------------
 lib/rspdm/state.rs | 43 +++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 49 deletions(-)

diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 6bfe1eedc4121..6b1f864fe7266 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -9,6 +9,26 @@
 //!
 //! Top level library, including C compatible public functions to be called
 //! from other subsytems.
+//!
+//! ```rust,ignore
+//! struct MyTransport { }
+//!
+//! impl Transport for MyTransport {
+//!     fn exchange(
+//!         &self,
+//!         dev: &Device,
+//!         request: &[u8],
+//!         response: &mut [u8],
+//!     ) -> Result<usize, Error> {
+//!         todo!()
+//!     }
+//! }
+//!
+//! fn authenticate_device(dev: &Device, transport: &MyTransport) -> Result {
+//!     let mut state = SpdmState::new(ARef::from(dev), transport, 512, None);
+//!     state.authenticate()
+//! }
+//! ```
 
 use crate::bindings::{
     spdm_state, //
@@ -30,7 +50,7 @@
 };
 
 use crate::consts::SPDM_MIN_DATA_TRANSFER_SIZE;
-use crate::state::{
+pub use crate::state::{
     SpdmState,
     Transport, //
 };
@@ -263,51 +283,8 @@ fn from(code: SpdmErrorCode) -> Self {
 
     let mut state = mutex.lock();
 
-    if let Err(e) = state.get_version() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_capabilities() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.negotiate_algs() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_digests() {
-        return e.to_errno() as c_int;
-    }
-
-    if state.provisioned_slots == 0 {
-        return -(bindings::EIO as c_int);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.get_certificate(slot) {
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.validate_cert_chain(slot) {
-            pr_err!("Certificate in slot {slot} failed to verify: {e:?}\n");
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let provisioned_slots = state.provisioned_slots.trailing_zeros();
-    if let Err(e) = state.challenge(provisioned_slots as u8) {
+    if let Err(e) = state.authenticate() {
+        dev_err!(&state.dev, "Authentication failed: {e:?}\n");
         return e.to_errno() as c_int;
     }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 059398e95b92d..0fe99caf27958 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -96,7 +96,7 @@
 ///
 /// This trait abstracts the bus-specific message transport (for example
 /// a DOE mailbox for PCIe CMA) from the SPDM session logic.
-pub(crate) trait Transport {
+pub trait Transport {
     /// Perform a single SPDM message exchange.
     ///
     /// Send `request` to the responder and write the response into
@@ -115,7 +115,7 @@ pub(crate) trait Transport {
 /// it does not need to stay bound to its driver. `T` is data and an
 /// exchange function owned by the caller, so the borrow checker enforces
 /// that the transport data outlives `SpdmState`.
-pub(crate) struct SpdmState<T: Transport> {
+pub struct SpdmState<T: Transport> {
     /// Responder device (reference counted). Used for error reporting and
     /// passed to `transport`.
     pub(crate) dev: ARef<Device>,
@@ -194,7 +194,7 @@ impl<T: Transport> SpdmState<T> {
     ///
     /// `transport_sz` is the maximum message size the transport can carry,
     /// and must be at least the SPDM minimum data transfer size (42 bytes).
-    pub(crate) fn new(
+    pub fn new(
         dev: ARef<Device>,
         transport: T,
         transport_sz: u32,
@@ -232,6 +232,43 @@ pub(crate) fn hash_len(&self) -> usize {
             .unwrap_or(0)
     }
 
+    /// Authenticates the responder through a sequence of GET_VERSION,
+    /// GET_CAPABILITIES, NEGOTIATE_ALGORITHMS, GET_DIGESTS, GET_CERTIFICATE
+    /// and CHALLENGE exchanges.
+    pub fn authenticate(&mut self) -> Result {
+        self.get_version()?;
+        self.get_capabilities()?;
+        self.negotiate_algs()?;
+        self.get_digests()?;
+
+        if self.provisioned_slots == 0 {
+            return Err(EIO);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.get_certificate(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.validate_cert_chain(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let provisioned_slots = self.provisioned_slots.trailing_zeros();
+        self.challenge(provisioned_slots as u8)?;
+
+        Ok(())
+    }
+
     /// Start a SPDM exchange
     ///
     /// The data in `request_buf` is sent to the device and the response
-- 
2.56.0

