Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619054;
	b=3T4uQeplkOQF3EK39117N9heZGBJQ3/0Zly0WeXIp7znJ/XehLm2DCd8ff0pMbQLPj1C
	 7JB1JlKt+m4SFy9u7psDzrtz/L9VaMJcVaS2wS14IfMO338ym6XsleLtbClpfSOIZBNJS
	 vnh6fg48DJL0cMHh1R6EpNZI4io+8ujxf7dQSGYBqdTPkFyoVhbk3Mmv0G+84DrBaDHKZ
	 Z+5WTz4cLZbXQcCMc1IA5+agNOtyvBRYMiBW6oqE4KrqsOgQ52sYpDQKdX/kEqipF3tLO
	 2lrBsMcpxTS5s/KnN1CBFg6Z2OfuTDo59XhN/4dfhqmTYv4b2AD4OudE24abIqo1ChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RopkjFnH/L5NMVxm+y2n/4o6xw3wiVYjMxy6v3/2wg0=;
	b=XiQDwMQYqp+kH3NL+S5Tio/GabPPuqxCoAVXbz85LRJ0nj9IIZDU7rbXZAjI6hpRRLjC
	 /dFlkzgFMSwVi4g7Y0kGPIAWURqA1A/cqkIBgeTKqHMHYfyry0e6OJzQzbmnlddERlJST
	 GW/Iv28QJJDeRF6nz33UV3cl/hy/Bn0DR/xbK6nF/8tIW6KzvAX7tIQKroLOhYcwHuQmC
	 Okca6O2ceUW8rfYLZBw0ZIih26KxLiIqTUkji+IbFgwkw7sEISPFXWTkJd5DOOIP397VD
	 xZUB4Yah/flk1OA+OcKATZFqh99qr+jkl/PEjCK0/Ng+gnDERror+i4Xv476xgt74AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=sXcK2Nov;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234160A260A
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 11:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8234160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=sXcK2Nov
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso23797345e9.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793619052; x=1794223852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RopkjFnH/L5NMVxm+y2n/4o6xw3wiVYjMxy6v3/2wg0=;
        b=sXcK2NovY48hvg6EmE/3bDf0R+rJ1ekz0ZuwCMBacIZcM4799MC/bChBWbPygg9Cpl
         iid8HHBLBy5fqkbz5IW717cFpYAuSHx8fNXOT2y/uWKu6O/iS2hzCZ+bvjJqSx0zu2LT
         PNgoGwKuLsteM846rklP0uPCryza2LyjJ86qASd+ceFKGfTI4Isdp3wa9kkrSOIpx+6o
         vipQziJM5ADO44mHjsTNfElAoLDNLulZ6BOtPJqtzUxk6TxeHIGY0rc9b9s+qfZIq/Zl
         8vfXenAkG58I9lOD9rIxJ+KZFmW/cVSCxwoCOX6NEeZHcO9krVhg6XlYY+ODOaOB4ulc
         LdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619052; x=1794223852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RopkjFnH/L5NMVxm+y2n/4o6xw3wiVYjMxy6v3/2wg0=;
        b=LxFpLvQKt9zEQwgp/NkeEsIhsEigDUXpCKmn0RwQQPJ+tAxANHwU89UsgAT24QgFn/
         BiUoKF7v+/Tp7sQr6tlC2eVI1U2sAeJ1IEeebztbJTCPYFC4/rQKoe4Iabicskis5WHR
         kk8yd2P6wDTQbyplBvK6SPfjlVy2MIijsPXSdMVrWdDMDb9JfGOlsVE2yIk8WSidGPkh
         ZRF4GjbbKlVr2rmWAQQwgGlzubNB+Vhs78Cfv8tA/mBCqzyiMZEBhpLjNgt1ybQDPqQ5
         aSN30u1qVAEL/M0uNhAZwOf2jfV+gyuIeBtCzIt5EiFd4BI/r10XucIS7N5sQuO+84e7
         js1g==
X-Gm-Message-State: AFq9FYJHHb1mjBwTmOZINe5NEuf88efWD3IiePuP/oH3Hk6I98Et4bOJ
	Fb4G8J19NZwc79q826Yvm7lyIjqF5b+yEunRXoBdqtaXEZX6s7ZzZ5XrfHc+wG+YWzQ=
X-Gm-Gg: AYBFou1E7pbAB1gu7d2UKJN4FOYHJ+kcPwxCA2wxUj/Br1E9vj2qSCWIZX3htFpzyp2
	YLZgdwQBnchJQEBMMY68RAiYcIk80RKCN+hTsxu4zEIjizHY8BG4ujLNhiApZjtgpv28BL3hzV1
	unfN9gLUOYNc51IlxVJTFI9WDgsdnOm+SDxNBAEE8zvpeOCaiF8P2kWIx0PMDnLCiQu9icCh0/2
	NSkS2g1bQ+Lig76W+pGpL52Pf88oPtFhcpt4OTCP5qTPp1GH3U1QSkqGOnXd/KrKjjjA9ZYsI6q
	yMtqQhnobt8ZgV4knBAKwRq8xeFk6hekgFImMPAR4PTN0qZXS9GC61sbeYboqIieM4SrX6GEkJj
	udHp0iP2G1vmxQxjSjxnz+3hOJbMzP5CtX2FWCRwzfpGHVVSU1cu/4es+ixmVXvOXmzJhGzMVs8
	BuuE7cJr1UUw7v4m08nm2bo6g2V6QxEHRtry4H8RYa98gC6AxohsR4eLrW0okOoqHoKu+mnXb4l
	ZDEfgEDiX84yqV7hitt0A01xIDtqds5r2THc6YzmMoYmanKyUOk2TT+CNTIV2nix3IO5hn2owKC
	TvAu09PuRR3tiA6Kh5p7neOi/3cLqiYTnlK1nbD3gUVXD2fHsT+bqI3jUR5w
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr233942805e9.22.1793619051662;
        Mon, 02 Nov 2026 03:30:51 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09bcc967sm199946425e9.3.2026.11.02.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:30:51 -0800 (PST)
Date: Mon, 2 Nov 2026 12:30:48 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev, Dan Williams <djbw@kernel.org>
Subject: Re: [RFC PATCH v1 06/11] PCI/TSM: Describe the PCI attestation
 control family
Message-ID: <auh0MBdHJw0cqKa8@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-7-aneesh.kumar@kernel.org>
 <auShvL2m00S70H3d@FV6GYCPJ69>
 <yq5ah5i2a487.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ah5i2a487.fsf@kernel.org>

Sat, Oct 31, 2026 at 05:22:48AM +0100, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Wed, Oct 28, 2026 at 04:26:13PM +0100, aneesh.kumar@kernel.org wrote:
>>
>>
>> [..]
>>
>>
>>>diff --git a/Documentation/ctlv/specs/ctlv-attestation-pci.yaml b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>>>new file mode 100644
>>>index 000000000000..edb35cede0c2
>>>--- /dev/null
>>>+++ b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>>>@@ -0,0 +1,79 @@
>>>+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>>>+%YAML 1.2
>>>+---
>>>+family:
>>>+  name: ctlv-attestation-pci
>>>+  inherits: ctlv-attestation
>>>+  pre-init: true
>>>+
>>>+attr-groups:
>>>+  - name: pci
>>>+    attrs:
>>>+      - name: name
>>>+        type: string
>>>+        min-length: 1
>>>+        max-length: 31
>>>+      - name: generation
>>>+        type: uint
>>>+        max: 4294967295
>>>+      - name: tsm-id
>>>+        type: uint
>>>+        max: 2147483647
>>>+      - name: connected
>>>+        type: uint
>>>+        max: 1
>>>+      - name: locked
>>>+        type: uint
>>>+        max: 1
>>>+      - name: accepted
>>>+        type: uint
>>>+        max: 1
>>>+      - name: dsm
>>>+        type: string
>>>+        min-length: 1
>>>+        max-length: 31
>>>+
>>>+      - name: object
>>>+        enum: evidence-blob-class
>>>+      - name: challenge
>>>+        type: binary
>>>+        min-length: 32
>>>+        max-length: 32
>>>+
>>>+attr-sets:
>>>+  - name: device-info
>>>+    attrs: pci.name
>>>+  - name: change-reply
>>>+    attrs: pci.generation
>>>+  - name: state-reply
>>>+    attrs:
>>>+      - pci.generation
>>>+      - pci.connected
>>>+      - pci.locked
>>>+      - pci.accepted
>>>+    optional-attrs:
>>>+      - pci.tsm-id
>>>+      - pci.dsm
>>>+
>>>+  - name: refresh-request
>>>+    attrs:
>>>+      - pci.generation
>>>+      - pci.object
>>>+    optional-attrs:
>>>+      - pci.challenge
>>>+
>>>+ops:
>>>+  - name: state-get
>>>+    type: action
>>>+    fd-access: read
>>>+    reply:
>>>+      attrs: state-reply
>>>+  - name: evidence-refresh
>>
>> I'm missing why exactly you need this op. Can't you do whatever is
>> needed in the provider evidence_get implementation? Why it needs to be 2
>> step.
>>
>> Also, why do you think this is provider-specific op?
>>
>
>I was considering evidence-get to return the evidence generated by
>evidence-refresh. Without an explicit refresh, evidence-get would return
>the previously fetched evidence. There is no particular reason for this
>two-step approach; evidence-get could always fetch fresh evidence,
>making evidence-refresh redundant.

Okay. The aim of evidence-get is to do get fresh evidence upon each
call. I will document this more clearly.
