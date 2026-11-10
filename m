Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284394;
	b=y3YgOkW1pHi/ri6oFgOZE+deoHPCmfUk8k85szY1zMmD4Ufq7yBjP/fzi0ws8afzRXeK
	 E+rs40H6kR0gv14xpFpugg4SZ3MAkacDXksswt5Zhsps1ieT/i8zi1enykjXpJ+gbkRGi
	 PcIknZHW9WXCS/rcV74kjM3q5MufL1KYSfU5QcuXN7eLVEOeOim8VH52QtoM0XwMeHbJq
	 Y5BUN6nMLunI3KNISouPmAS3tpedBgpE0wWZ7RTWCA5P6+5IA42qolPMVp8Ds2HgXQFe4
	 wqk6m2Fxvf7ja6Dp9jyPZWc0rh9f0DuFS7otq9gVlGkeirUnhXGhaXTWciHl/U6zD2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
	b=XAOyVcpj2T9bvomWtyy01OTfRHEbF5xhaftlEHfXoJdMS5wVFgabV8D0QvdS2bBUodHy
	 rOUUnJNmBNZFq8gPIu4JiTvePwJ6KrUXN1Sng/0exZ28/GlOqpARV4BOG0ghmBm6YXosZ
	 JaDZ/VlgjYPf90sZi45qktGmPlsysgIUtgTo/PCl7My/nNEYC5jTfq/vi75TSkqQPa/za
	 v5sbe5FMhiBjZ/BdoSZbAusdS59N/fBpQRn+TKeLSqzxUzfeogV68+X5mMcAN3emX2wp0
	 EaD2Yd0fJvfrLLGfSRd7MHPbA44CwJwESOiigy8iKSOjlCK52QM1+a1cZxM5rmese4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/8Bxj22";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F460A2636
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0F460A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/8Bxj22
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3720addb068so2720675eec.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284393; x=1794889193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=H/8Bxj22wEG3t7pxgENEdBX8fWtS8SIDnp7pyl648eJ8GKxUbkhJu9GajlbC731pVj
         g15O1wMW5Agdq9JKPR8dAUA7P8VL1TbXbMDDer6Rzc/w5cpPXV4E/P2fLw9JJsQSP4Yn
         fq1xGi3bjQ7WNKbrphBQ12SFeITi80kbgS6mDDIneUHhHWiwkG4/g41k5FzSFu+sQVEr
         pxksL4fYcCgUw3k1HgSgrcYdbfM3s1eg4lE1SW/Di3l/ryRgXSac8jpqR0ah7udcg87Q
         exB1NgU0LuEYsH+QixNf8rK+lBn0AOFGEkzzYuE9owrH5VF8WnWzdsixxUDHt1bWEjRJ
         BdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284393; x=1794889193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=MbI2SwTMsX+3aFFOF5WUkLdIYiyHjItbj87pagRaxdi/nfR1C5tY9z3OzCgWyhwx6d
         mxy6Z5W77CUEA+oKQHa9NSEiOyeKZGFpUhP7cdQBQjL0iSjeYqL/129DdTpZXYbn6nnz
         EoOD11FXv8z1jUFAoVZIDvTBvgPjO0oNftvM7vAg6nKluLJ5wD0a016fK6xLNQWpX0hZ
         U9wbKAo8tzji+BXyQrxwg+J1qd3bpTKeZHeDmPaAt9KVCJ6dnXnfWI3li1v//Y5opHh6
         lnpQ+UPUQxHG9AaxLIhvU6XKN+WVgDVz9ZsvUilyd0wc3iduVn710apuazI6lV5g+ZMo
         44ow==
X-Forwarded-Encrypted: i=1; AL+hErER51d9Dyi1iyPrppvxyxzu0iFE8BiB/B5lBNuh2iO0j7H8G4bpAFdK5br97sJCHWHtW24BzUCN0euq@lists.linux.dev
X-Gm-Message-State: APuU4Z8Sd4ABIgnBtnyR/EXuiyB7ZSRli6IHxhJzG5q+uS9y8c2p2SyM
	RreGHoZTZK9dWcjFIcjdqXcABlnh+u5SYevEx5Obv/oLPaH66EocCQjs
X-Gm-Gg: AYBFou3QeXDpLtHI2IaM+auiuT1Z8iUprz8B7kJz8Rjeinb/PlGO4ZpqtYF5lQmhGZ/
	rSGBrXQaiJ9YYpn/CqIQkqe3moRxcsCB1dQYDnKELYd47cbH3soQDyvnyecwbbBKvWAbDONjY+Q
	E+Qxq1oNFPwFVFDBfjlnbWny1IE+8pxQGa60i7whpGneCkYiHTZ/0ezFMdHUzOu9HP83qrAqWLh
	oZqC8V2Y6VYHARMv7csTI9pNYLkcicsWE0YXMDgiwCZ7nQltCEyulyD4uxLTShfdEJ9gvwE4e1k
	4CrtEsM3akpNu/VDj7ngcJUPtUULm/+1tVnwR7EthLKuuXz8lIaqxSRgDaVWKdNltyufnxQ0QHo
	F8lJTYyDteGguBtX1V/IMIeBaLQ6emJ7mLCO9E7KURkzzXyLx1E3MGiKBmhmtlK2AMYFIgymPF+
	rW5aJ+XF109uG6JhCLqE7M4h+u7E3yvi+urLS5ABigfHY9RFfU36IfRsU8pdPxXHiD1vKI8M3HK
	VpX/bxvEjo6TvZxwrDwm2gM2Ggvc7uz3+gbqF6tCBUjw3OeTJ7A67OCMW2qHhSidC4GH1nwA4oH
	1zYJhajV6iK/UWIRzEG2ul/Mlyp94rQ+VUlPfael1RoQ624=
X-Received: by 2002:a05:701b:2807:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3b61860eemr1668909c88.47.1794284393237;
        Mon, 09 Nov 2026 20:19:53 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:52 -0800 (PST)
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
Subject: [PATCH v6 08/25] rust: device: Expose Device as_raw() publicly
Date: Tue, 10 Nov 2026 14:18:15 +1000
Message-ID: <20261110041832.1730924-9-alistair.francis@wdc.com>
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

We are going to call the as_raw() function later as part of the SPDM
library, so expose it publicly.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/device.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..be89e9023b09f 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -262,7 +262,8 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
 
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
-    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
-- 
2.56.0

