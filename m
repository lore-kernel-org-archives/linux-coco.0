Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284378;
	b=B8SuXtvgjAZPuAI1C+tABRxvoBpRXXkuXGijKh6QeJrU7kGjpZSqck5Vp6dQScd6ABZH
	 ENk++kzfVU/FPFOOUH8zbQB8y+lM8mcVZCkppFnKnM4asW5glBzGuTsO8ADQxWj+pzjzg
	 gkiFt82Npoo3rhM4kMPM6WiHrS1ePylqPNAwtNwNCIf4EZh/pcDh/GVac9/Ff7JU/WQbC
	 M2f2OOYBnHHrzuJ8hXrb9DIs+YAlP9EBDeCCDaHm78JuE5mh1nJRgChesUqZr/TQ0f+hs
	 gR4g4fhN11Uy2MF2Ytj1j7dGK5RsPuzwg8KbF9NajrOrkTWJGRxjzTSxxe7HvuLysQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
	b=soDdw+avQ7ZwCnJAUDx+JDO74mXe/IOzslEH/w15n9Cd9Ymle5TY83qw+DR7njPZY6tL
	 Rw5E9LVKO0LcOTjVcQAf87ZD5k1NOryFGa6YISnqsP7Irrcdggd2SB85INLsW7KmpooBN
	 iS84NoOpnt+Q6rzas+Bfg3j/V8wEKPFBX4JXbWl/WiqxHHYouBMxb1FWu8P6IWuk+UJvj
	 5ykpdnptALO6LlutaNZbpjvXNoLI69HFZqZwgEeDr1TKY4veooOKB1xsBwHVfI5iyRS29
	 cc4qmZ6QL+tSWXjokXhiyx9pKaTLyRBwYtVE4yv6AW5UNfzub7YMZ1ij0THNZJfyyVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui4KAfGH;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD29860A6F7F
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD29860A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui4KAfGH
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso947072c88.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284377; x=1794889177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=Ui4KAfGH8U/rlFEfxZdRZld8sbvGwzSrmFNBh7NZAQRmPb5+mEP/tmScEnvycKiRmS
         rOkrmbpaF0H3fP3uGeaH+2RYglv3saRAYy/63lFX4LlXv8MSDyB64KmMRF3LpqPL+vUa
         hKvnL5iBjk6tw4Ip2RYU3OeFX0H4b+3v7NcvyzFLZV83QchN7XBLQLspPgA/eEXWwOmF
         mSd+0hQOH84cqkv0zumy2uHGP2iFV6JIKcTZzdQespLjO/KhC9d0WfILyC2Ke/cWIrcA
         2IrESDxkiVNe7qg5Gcdge+38HmuhmomTnfWCi/4bIkh/V+ALxm8DVaqfq6mXev/pXO8t
         52RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284377; x=1794889177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=S1dzAxYV4ScvD3wtnZ8IRJHMRuTKGevLSlnyM+Me0dR95/wCzgsEyoqsEYp8Ym+2R/
         I8jMJkbU74XOfwSJzB1t9dSZycoOgJyn72ErlgOOfOXu/685SBSb54S2Blt5LDadEZuK
         uBgzcYM34oJ43fYIPJRPJ8rwVg/EtsA1//3aCjgKSMonUD3kyMWTLSrDd5hQBbj6HU8a
         uz2iUTX0+YUw4VYKl2xf9wBX9c51LJu4nC+KYQskhOpid2b2gcdO1KWYH3T33L9SKQLa
         Nv1UA8Z3EBw/Fu4hJrAKB5q1dUH1FFR3DFhAUUtz10b+/D99NqDaST34NuRISdixjfjE
         a71Q==
X-Forwarded-Encrypted: i=1; AL+hErE1j9A2GqGN5FLzjweGzqdfcaa1XlB325CYTnrMzVcEW6iEYHqPBQhZJvQyBwDSge+luSLNuRUU1dlX@lists.linux.dev
X-Gm-Message-State: APuU4Z9Y7g2X8lA4wllHp3gha/qG0lRY+i0+uIA/2bpDYnbQLAbaQViQ
	OvixdyyDk5popn+my/kRdXlhAKY5iCPpyDDejYHFNYtEh7XI1XPu4NKN
X-Gm-Gg: AYBFou1BAus51ucuZG1Dr85A7r28zFDIzvaOBnZ8Q9rdQ0gtercIIPwyf0Xal7lY/a/
	TGLXxJsx/c5BWPn3NMzH+JGCekXFlYCbber0UL4JWuZaRtp3iDmbNyU/gu8WHC9Cga+A0ZX2Fr5
	T7NsrF/oF4IiBMY3UZb6fmzSwREH30y7/stdEAVOpWD4YqSk3dA5gQpXh6CT1IMXyLi/1RvEtXe
	yWLxvkloNC1KvIjEZTo2KWLMajmOJJz3eBAOoUrPgYezNAyn9kPbh28fzJIUwtJWjw4No/NmxkK
	kWjm6VJj5JsOSdCQm8+R38D16r5mi516gI8DLmGR+f0aTDdNj8ZUYMzCTfmB29dazMeTnGpuiIP
	MAKMoKfFM64Y0BdF0ZU0i55LphHmMFBhrmuzZ0NJUf/8cSskdyCZYqkGrY4R9sWyj9ZMLLhC6/L
	vHkoGUle9q9KuL9D7LlMA11u6nljPpmbl0cYq1iMV5ZHT4OOYfKbdtxMrKEgp/08UPcI2FkFVPS
	LAaOIevc4UtB1x6ogmMh51fA7j7GPU9QRtqp2y0bRVYAxtJjnjBcfh9i/f2s6LplCqOIaZMnx4S
	VHNFUqfIhyMqeQfSR+lVRi+KmTXD2rst6JKJa7+y+rDQlc4=
X-Received: by 2002:a05:701b:4502:10b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1b3b5e25dbcmr1978641c88.11.1794284376568;
        Mon, 09 Nov 2026 20:19:36 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:35 -0800 (PST)
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
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 06/25] X.509: Move certificate length retrieval into new helper
Date: Tue, 10 Nov 2026 14:18:13 +1000
Message-ID: <20261110041832.1730924-7-alistair.francis@wdc.com>
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

From: Lukas Wunner <lukas@wunner.de>

The upcoming in-kernel SPDM library (Security Protocol and Data Model,
https://www.dmtf.org/dsp/DSP0274) needs to retrieve the length from
ASN.1 DER-encoded X.509 certificates.

Such code already exists in x509_load_certificate_list(), so move it
into a new helper for reuse by SPDM.

Export the helper so that SPDM can be tristate.  (Some upcoming users of
the SPDM library may be modular, such as SCSI and ATA.)

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_loader.c | 38 +++++++++++++++++++---------
 include/keys/asymmetric-type.h       |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index 0d516c77cc26a..174451b93edad 100644
--- a/crypto/asymmetric_keys/x509_loader.c
+++ b/crypto/asymmetric_keys/x509_loader.c
@@ -4,28 +4,42 @@
 #include <linux/key.h>
 #include <keys/asymmetric-type.h>
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen)
+{
+	ssize_t plen;
+
+	/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
+	 * than 256 bytes in size.
+	 */
+	if (buflen < 4)
+		return -EINVAL;
+
+	if (p[0] != 0x30 ||
+	    p[1] != 0x82)
+		return -EINVAL;
+
+	plen = (p[2] << 8) | p[3];
+	plen += 4;
+	if (plen > buflen)
+		return -EINVAL;
+
+	return plen;
+}
+EXPORT_SYMBOL_GPL(x509_get_certificate_length);
+
 int x509_load_certificate_list(const u8 cert_list[],
 			       const unsigned long list_size,
 			       const struct key *keyring)
 {
 	key_ref_t key;
 	const u8 *p, *end;
-	size_t plen;
+	ssize_t plen;
 
 	p = cert_list;
 	end = p + list_size;
 	while (p < end) {
-		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
-		 * than 256 bytes in size.
-		 */
-		if (end - p < 4)
-			goto dodgy_cert;
-		if (p[0] != 0x30 ||
-		    p[1] != 0x82)
-			goto dodgy_cert;
-		plen = (p[2] << 8) | p[3];
-		plen += 4;
-		if (plen > end - p)
+		plen = x509_get_certificate_length(p, end - p);
+		if (plen < 0)
 			goto dodgy_cert;
 
 		key = key_create_or_update(make_key_ref(keyring, 1),
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 1b91c8f98688d..301efa952e263 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -84,6 +84,8 @@ extern struct key *find_asymmetric_key(struct key *keyring,
 				       const struct asymmetric_key_id *id_2,
 				       bool partial);
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen);
+
 int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
 			       const struct key *keyring);
 
-- 
2.56.0

