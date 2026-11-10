Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284480;
	b=HnFI/IU7QWPhpobp8v2zELdt4eYqmH4amN71H8ZqC1t2wDI3z5EgKDDC0p0LschKnB14
	 BXkDJAH3RcviuCGUi6chbOqYQEDNg9/oFqOxmt5UepZbedS9HtfREIjpyoVQIH89HCAkx
	 CgmEi534/QijVdGjym7kZvrKmL1z9SskPxG4lPCgCTJpbanfGSoNPYH41sTFRduWQbivh
	 hROyWRCAZKWCvWD5Op+G481bLN8bMOLvNxYsCeTAE3CX3pz9c/yFc4G+LEQjUnR8XqBJK
	 eY1t6l3oYr23faQa/4sW2QNLHuiHQ0ZxQq0PS86MHStM5sYmoCEUUPSZBV9iY562cyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8beDUCducbr1qlboVGMlG2gCRh53OiHFxZrzDVbsjGM=;
	b=sKrd01M2/86jIvys4hbfROVKIWW2lKStRfiJ6TVqgK6kFFklKKi+OnfH4X3HJoJBxvOv
	 W2sD3FnWzdikGb8I56R24+3jZMS4VHtg+Qt4Brx7nllVFfLpLzcSOxaJ1EPcUU64tvw/s
	 r5VGqJTIiYZEt0nMBxsWPLntyqYBFCopPpVWGR48CPnyy+XMgtJls+HqXmENk0807rqD8
	 rvmzIJVgCE9JzZ0o50ZDY70wuvJ20ZD3j8zpSywjizZRB60dWNGtV/hUFmHoIHvd7ldF9
	 GsqoTVt/G7CODVbu75Tb2ybQNi+5vvw8IavbJD6NOwrWAurfrbaCMKGNIlTAR9MqNTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndTI+JJq;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3EA606BB18
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A3EA606BB18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndTI+JJq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b1ce85287aso1644037c88.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284479; x=1794889279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8beDUCducbr1qlboVGMlG2gCRh53OiHFxZrzDVbsjGM=;
        b=ndTI+JJqJ5AdxOBPrMlEOlfWUirwL8ZxG66Rt4uf+Yh4ZmiIlY85jsTcvYLmgkuzGY
         s/YB9Zn/IgnWL5PBq8KbQXwfkQiytQ2sGAFwiNETsLW04ewwcZzte0eSGZSx1GYrKRTH
         O94AXWcVjNPC6N1vEY5bxbIQufcR68iQi1FOeePvPM5IHh5vr0SsGXMWQs4idKs5rbUk
         EuRtL+IMOJDkpoUw0jNPQdmyOSFrhyWVta8JJXTH7w0ImppDoudubKJzCiB2eNfL74MR
         h6L3hGlE2m4NawAxk9VGXrDcv7s3ZIlPcHlV4kvKN7zM/WDiC8QkqjceiEjtjL/Syrb7
         0xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284479; x=1794889279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8beDUCducbr1qlboVGMlG2gCRh53OiHFxZrzDVbsjGM=;
        b=oHWb26g9eqVwVC2B6vXzJ5Aj1HlZhXyA5ujslj139NCtu3YBAkuToK/sBxx0xWd9Yv
         6VB2pxVTIhlreqS8oyN4qkUeL1rumLmGiahZnsbgb+WmRPO9fydg9XaplrgNViq3U/p0
         peS+FC2LJtU8+/FPnypXUr20NTsZUYXWrZnEwDxmYrPSfRe8M+8af8qqW5HpUQRj7jSj
         Obrwnb+2cAfcJg2in+1xn4vd7y61b5plOPYni94UiwgkKuwQ4+i86l72g2y2OkfYlpAM
         UvG6dB/TE2MQV76YqfXAg21z7W3DIIw7B/D9UfZ8E3BC5H7wm+e4/nItWKQ5qQMMcxO2
         MPrQ==
X-Forwarded-Encrypted: i=1; AL+hErHx2xv+Osw3KOFKqNiFbyuMu4rNQc//iPu+HcAH9J0iz1NwMn6fcgorEnd1shvUTZJKAuQ3OZgUZ6yA@lists.linux.dev
X-Gm-Message-State: APuU4Z9RiY4q/Wk5+Sr56eELmDMRP7lQMDJBuxeU699eSjgTkn3SOM6v
	vQBayBZSiw8CWD5RB8dLGn4nPT2s2H23MLRVCmx1jVKrntmrok6FB9aQ
X-Gm-Gg: AYBFou03V3bzdsL+o97/GRccg8exYG+PPrOBhdvhbikToeTCRHQlmdAJLrOwMUhfvqn
	1RGq5fFMWUKrCcXGvFM6kPZa4trJtuRfq3bejgc0CB54+9YuJsvqq34OlZvZvI57CMCS3b3D+3r
	x+5fkN7nqdOPW+/bjMU1Bt+KM7Y/YJ94sQQpsLeew3T8Fg0pW+nhJSPJ56cNmgubuHvh7vJULC5
	tTe5y7M8t5b4STI5TQ8e2hOo1DW158aLr4LaB6zSl+yRYmeich2p4rEF+ZSaMNrWme2Fpo5qiUa
	OP72lqIYbwcX6gShI7w6Q7U1gpPVj1bF+Dk+PTl7yNxmZ4R2pI/3uDK61QWt6vWYZARRh0M+id7
	rgXyMHgW+ui7IS+t0hY3S38p+c580KqMRRqtA7WJbtTm4/amAmupPrHHEwF97epPnOOYedsr11T
	YmCSexDBWZO5EYHZRJKefajtidWmtJtoQKYDAmDX4MmdVgFyxYluClfy1Cq+oKRTlGn+trT8bTk
	h+o9oxMphwduK3naumq6EKDbU4UxWeW3N4QyM9lwWPOd8MrXsYNHyPwSIpp1pjG6R7iOVHIUACQ
	WsN83kJttesl1stLRMW4c2UW7/lbm/aGFufogOYSqxh+ixA=
X-Received: by 2002:a05:7022:b90a:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b3b619ab8emr2011606c88.44.1794284479054;
        Mon, 09 Nov 2026 20:21:19 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:18 -0800 (PST)
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v6 18/25] lib: rspdm: Support SPDM get_digests
Date: Tue, 10 Nov 2026 14:18:25 +1000
Message-ID: <20261110041832.1730924-19-alistair.francis@wdc.com>
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

Support the GET_DIGESTS SPDM command.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 lib/rspdm/consts.rs    |   5 +-
 lib/rspdm/lib.rs       |   4 ++
 lib/rspdm/state.rs     |  70 +++++++++++++++++++++++++++-
 lib/rspdm/validator.rs | 101 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 177 insertions(+), 3 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index bcc149de77425..b80c37f1ee70c 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -18,10 +18,11 @@
 pub(crate) const SPDM_VER_10: u8 = 0x10;
 pub(crate) const SPDM_VER_11: u8 = 0x11;
 pub(crate) const SPDM_VER_12: u8 = 0x12;
-#[expect(dead_code)]
 pub(crate) const SPDM_VER_13: u8 = 0x13;
 pub(crate) const SPDM_VER_14: u8 = 0x14;
 
+pub(crate) const SPDM_SLOTS: usize = 8;
+
 pub(crate) const SPDM_MIN_VER: u8 = SPDM_VER_10;
 pub(crate) const SPDM_MAX_VER: u8 = SPDM_VER_14;
 
@@ -82,6 +83,8 @@
 #[cfg(CONFIG_CRYPTO_SHA512)]
 pub(crate) const SPDM_HASH_SHA_512: u32 = bit_u32(2);
 
+pub(crate) const SPDM_GET_DIGESTS: u8 = 0x81;
+
 // If the crypto support isn't enabled don't offer the algorithms
 // to the responder
 #[cfg(CONFIG_CRYPTO_RSA)]
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 2d5eddd9fdc8c..ee996ecfb4ce1 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -276,6 +276,10 @@ fn from(code: SpdmErrorCode) -> Self {
         return e.to_errno() as c_int;
     }
 
+    if let Err(e) = state.get_digests() {
+        return e.to_errno() as c_int;
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 169d0d3fee9bd..a44f98a941cd0 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -33,9 +33,11 @@
     SPDM_OPAQUE_DATA_FMT_GENERAL,
     SPDM_REQ,
     SPDM_RSP_MIN_CAPS,
+    SPDM_SLOTS,
     SPDM_VER_10,
     SPDM_VER_11,
-    SPDM_VER_12, //
+    SPDM_VER_12,
+    SPDM_VER_13, //
 };
 
 #[cfg(CONFIG_CRYPTO_SHA256)]
@@ -60,6 +62,8 @@
 use crate::validator::{
     GetCapabilitiesReq,
     GetCapabilitiesRsp,
+    GetDigestsReq,
+    GetDigestsRsp,
     GetVersionReq,
     GetVersionRsp,
     NegotiateAlgsReq,
@@ -129,6 +133,12 @@ pub(crate) struct SpdmState<T: Transport> {
     /// Hash algorithm for measurement blocks. Selected by responder during
     /// NEGOTIATE_ALGORITHMS exchange.
     pub(crate) meas_hash_alg: u32,
+    /// Bitmask of responder's supported certificate slots. Received during
+    /// GET_DIGESTS exchange (from SPDM 1.3).
+    pub(crate) supported_slots: u8,
+    /// Bitmask of responder's provisioned certificate slots. Received during
+    /// GET_DIGESTS exchange.
+    pub(crate) provisioned_slots: u8,
 
     /// Human-readable name of `base_asym_alg`'s signature encoding. Passed
     /// to the crypto subsystem when calling `verify_signature()`.
@@ -139,6 +149,13 @@ pub(crate) struct SpdmState<T: Transport> {
 
     /// Hash transformation for `base_hash_alg` computation.
     crypto: Option<Shash>,
+
+    /// Certificate chain in each of the 8 slots. Empty `KVec` if a slot is
+    /// not populated. Prefixed by the 4 + H header per SPDM 1.0.0 table 15.
+    pub(crate) certs: [KVec<u8>; SPDM_SLOTS],
+    /// Hash of each slot's certificate chain, as reported by the DIGESTS
+    /// response. Empty `KVec` if a slot is not provisioned.
+    pub(crate) digests: [KVec<u8>; SPDM_SLOTS],
 }
 
 impl<T: Transport> SpdmState<T> {
@@ -164,12 +181,24 @@ pub(crate) fn new(
             base_asym_alg: 0,
             base_hash_alg: 0,
             meas_hash_alg: 0,
+            supported_slots: 0,
+            provisioned_slots: 0,
             base_asym_enc: c"",
             sig_len: 0,
             crypto: None,
+            certs: [const { KVec::new() }; SPDM_SLOTS],
+            digests: [const { KVec::new() }; SPDM_SLOTS],
         }
     }
 
+    /// Hash length of `base_hash_alg` (in bytes). H in SPDM specification.
+    pub(crate) fn hash_len(&self) -> usize {
+        self.crypto
+            .as_ref()
+            .map(|hash| hash.hash_len())
+            .unwrap_or(0)
+    }
+
     /// Start a SPDM exchange
     ///
     /// The data in `request_buf` is sent to the device and the response
@@ -230,6 +259,10 @@ pub(crate) fn get_version(&mut self) -> Result<(), Error> {
         // Reset all negotiated session state as we are re-authenticating
         self.data_transfer_sz = self.transport_sz;
 
+        for digest in self.digests.as_mut() {
+            digest.clear();
+        }
+
         let mut request_buf = request.to_bytes()?;
 
         let response_vec: KVec<u8> = KVec::from_elem(0u8, SPDM_GET_VERSION_LEN, GFP_KERNEL)?;
@@ -432,4 +465,39 @@ pub(crate) fn negotiate_algs(&mut self) -> Result<(), Error> {
 
         Ok(())
     }
+
+    pub(crate) fn get_digests(&mut self) -> Result<(), Error> {
+        let mut request = GetDigestsReq::default();
+        request.header.version = self.version;
+
+        let rsp_sz = core::mem::size_of::<SpdmHeader>() + SPDM_SLOTS * self.hash_len();
+
+        let mut request_buf = request.to_bytes()?;
+
+        let response_vec: KVec<u8> = KVec::from_elem(0u8, rsp_sz, GFP_KERNEL)?;
+
+        let response: GetDigestsRsp = self
+            .spdm_exchange(request_buf.as_mut_slice(), response_vec)?
+            .validate(&*self)?;
+
+        let mut deprovisioned_slots = self.provisioned_slots & !response.header.param2;
+        while (deprovisioned_slots.trailing_zeros() as usize) < SPDM_SLOTS {
+            let slot = deprovisioned_slots.trailing_zeros() as usize;
+            self.certs[slot].clear();
+            deprovisioned_slots &= !(1 << slot);
+        }
+
+        self.provisioned_slots = response.header.param2;
+
+        let supported_slots = if self.version >= SPDM_VER_13 {
+            response.header.param1
+        } else {
+            0xFF
+        };
+
+        self.supported_slots = supported_slots;
+        self.digests = response.digests;
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index 335f2f43dc07c..54207527e9f4d 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -12,6 +12,7 @@
     SPDM_CAP_SUPPORTED_ALGORITHMS,
     SPDM_CTEXPONENT,
     SPDM_GET_CAPABILITIES,
+    SPDM_GET_DIGESTS,
     SPDM_GET_VERSION,
     SPDM_HASH_ALGOS,
     SPDM_MEAS_SPEC_DMTF,
@@ -19,9 +20,11 @@
     SPDM_MIN_VER,
     SPDM_NEGOTIATE_ALGS,
     SPDM_REQ_CAPS,
+    SPDM_SLOTS,
     SPDM_VER_10,
     SPDM_VER_11,
-    SPDM_VER_12, //
+    SPDM_VER_12,
+    SPDM_VER_13, //
 };
 use crate::{
     SpdmErrorCode,
@@ -725,3 +728,99 @@ fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<T>) -> Result<Self, Se
         })
     }
 }
+
+pub(crate) struct GetDigestsReq {
+    pub(crate) header: SpdmHeader,
+}
+
+impl GetDigestsReq {
+    pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
+        self.header.to_bytes()
+    }
+}
+
+impl Default for GetDigestsReq {
+    fn default() -> Self {
+        GetDigestsReq {
+            header: SpdmHeader::new(SPDM_GET_DIGESTS),
+        }
+    }
+}
+
+pub(crate) struct GetDigestsRsp {
+    pub(crate) header: SpdmHeader,
+
+    pub(crate) digests: [KVec<u8>; SPDM_SLOTS],
+
+    // KeyPairIDs, added in 1.3
+
+    // CertificateInfo, added in 1.3
+
+    // KeyUsageMask, added in 1.3
+    /// The actual length of the SPDM message. `raw_bytes` might be longer
+    /// as it includes transport specific padding.
+    length: usize,
+
+    /// Entire response, used for the transcript hash.
+    raw_bytes: KVec<u8>,
+}
+
+impl GetDigestsRsp {
+    #[expect(dead_code)]
+    pub(crate) fn as_bytes(&self) -> Result<&[u8], Error> {
+        self.raw_bytes.get(..self.length).ok_or(EPROTO)
+    }
+}
+
+impl<'c, T: Transport> Validate<'c, Untrusted<KVec<u8>>, &'c SpdmState<T>> for GetDigestsRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<T>) -> Result<Self, Self::Err> {
+        let header: SpdmHeader =
+            Untrusted::new(unvalidated.get(0..4).ok_or(EPROTO)?).validate(context)?;
+
+        if header.code != SPDM_GET_DIGESTS - 0x80 {
+            return Err(EPROTO);
+        }
+
+        if header.version != context.version {
+            dev_err!(&context.dev, "Invalid version response\n");
+            return Err(EPROTO);
+        }
+
+        if header.param2 == 0 {
+            dev_err!(&context.dev, "No certificates provisioned\n");
+            return Err(EPROTO);
+        }
+
+        let mut digests: [KVec<u8>; SPDM_SLOTS] = [const { KVec::new() }; SPDM_SLOTS];
+        let mut offset = mem::size_of::<SpdmHeader>();
+        let mut slot_mask = header.param2;
+
+        while (slot_mask.trailing_zeros() as usize) < SPDM_SLOTS {
+            let slot = slot_mask.trailing_zeros() as usize;
+
+            digests[slot].extend_from_slice(
+                unvalidated
+                    .get(offset..(offset + context.hash_len()))
+                    .ok_or(EPROTO)?,
+                GFP_KERNEL,
+            )?;
+            offset += context.hash_len();
+
+            slot_mask &= !(1 << slot);
+        }
+
+        if context.version >= SPDM_VER_13 && (header.param2 & !header.param1 != 0) {
+            dev_err!(&context.dev, "Malformed digests response\n");
+            return Err(EPROTO);
+        }
+
+        Ok(GetDigestsRsp {
+            header,
+            digests,
+            length: offset,
+            raw_bytes: unvalidated,
+        })
+    }
+}
-- 
2.56.0

