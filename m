Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886756;
	b=YoJcELsWnwgPgxhzBS8i3vB+sDQw07ZOvlhO2bQKBfalNUAPseGcQefciwZ2aO/JZnzT
	 p4W286lcO5glbcBX+63kfxaA0yQzyrWMvU8EGAamOmjYj8XfZ8gBWd3uTGZwvN9r05ZcL
	 8sXeRAkJsV2Gdo3/t/3dAXLUVbz0MZGYLY9JoolM2hZfpC8MiyhQw99pVkQMFuwKK0pT2
	 ZJ+ji534v0I/JCv+8kAqFSmxQkhNrhrhu5ZWygK6pP9PN5k/b0RsGWbBeyyJ7cBinB7Rb
	 4kP1Q0wTk0uzt1Z4SFeoNUrcHasf39TDpv2OuyvTsSqpXi4DI1PAQBm9l8HE0aqp1XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
	b=YnDY88cEWO/S+aEw2/scaIqU3y4QG5C4D7FkURnAJ7XhzvW2s4GSicmhMgInbhBmtss7
	 I0n/t6g7a+TeUt20et7bjwWnOCPUjPbN/bw55GNKJcjhlGTST6UglaxmDmTFCmtm7SYEM
	 9LUlKKjlNix9jVz0vXOeUBkUK7Zgk3tPYsOGfVYq8RmmBOlFJYASo1gk0gwO+rfKddXj0
	 I3hRU0O8ByZeH6AjQxs+JqPsCz+enBCQyZxmfCCDyWz052sSIvXkTah1hBbsjcJ2fyhVc
	 6bn5mqayNebyISCGuRfYr53QfIg3QbKVX/j4mDkHWgkG/wWrAdOuznpR4UohP1jvpPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE70606D80C
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 13:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE70606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13702045e9.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 05:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793886753; x=1794491553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=yGMUWYEd03WwhbsSMJmUFrXXijWMst5mGPJdrOwVgiCKwzxGhnas1193EJBHSKLVYC
         fS9oFE/1CGGSs9ACJzPIOSJvvUEE9eaaMxKXx/3uUHiWiskead3vXY3MZf9npjlyhXxw
         laELVIp3Ufptvy9ZdXATQwOQn0kIUlngNAslAQGZ8H/5/PjhB6ycGyNXAtnDGBqixitD
         sInbuNv9GsXprM4uy/mrmqOZsjLW49NET+ZVeuSgqZceEjt9lAVHxWgVeqFK87rmuZrd
         nTvvk0x0uW3zFp479OejBEgLEnMjOkql7qsVs2mDa91ps7iMz76S5oXijjYAaVaj9buI
         kTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886753; x=1794491553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=dxGuQNRS6CN22ayPDS4lHt1Y8UiW3RVncrNevnBAxsejPH/Sdu6TvIvdEiLiy5uAdS
         1uFvN1M8BnvY+qTs6hSdwVUkHJ/1Mx4jIjOYZL1+YsxeFsKxpNrRU2lJa1Rw6jrJJXUV
         Iy5HDofBfscEILNod1ZmJ2SgWQ2u/+QV1JisttxLEpUw+MXNpnotsCNMEa+00SaTXNvB
         hxqKXpZZTBU6HTepK46mSo64eBkcUoFBNX+wCm5juCv2qmYmZIYpsHbZhQiWN3VzP/WI
         WB7nHmG+oXIt05k5ijt6vGq6Leb3kOtnFPOmSL6kAMHoFPXN04g7fL/lzwbqJjuFuSw3
         LwBQ==
X-Gm-Message-State: APuU4Z+hNSMooRmTQKTSGjVoV0d1FhpjYu3xxuqcMlkthjVVHFK+qBti
	bNXvs+CPuBlyQe2WRYp1sShgNQbXLOysKYCM2Hcz1eyjaISBbrncQ4lKAK4si/LXqug=
X-Gm-Gg: AYBFou3clR9HEepnU4tVSVN2U3d2YYuR91DSh7vwIn5LwjnM13VSnmccNskSWzriASq
	OzM1QhYc+K9CH3kMvl+SaaMvrFvNjpydxvhBGpMecuFyLZ1pFvjFA5kgWD5ovfMGqNmsPXXYFuC
	sNw4Ar0J4htnODRZbQMD6KRmebZhjX1Ji7HoqwIFVEASOWKGeqmD6VIQUTdK4K/K+YR/fES7y9S
	RSQ5NmUGpivePv+ZS6pl4G998DpNa++MW6emdKvfAhzgsgNdFWol2bYD1L5Q6gL/RBqpCQIZUwy
	apVxA3y8gqEKRA24TvPxbEkRF1pfX7zsTVbxz1q6siWW3g2UAnejQ8NsUNg+5FT2UAxthH1PqS5
	D/x695f4u/V2sr0D3LFHwqefNs6C4+85OYImIfd2cApwpEG0Xg6AGuM09bmRDn0OHTQ9IJ0gMby
	sXvtUeoEeFwRjYDFE/os7nr2+Ntuo8XV4l7KGvksyl8dL10u2L6Jj2AQav1HFYk3ZkXxbWsbbyg
	hswkGIssnBRFovaw1jJ7GngpAH+sV705MyyiSw+FQ9EDt6iMF18lb4GZG5/Jzn9lpSHjEqFKg5f
	BonwI5ewraU1VDNBCgdbkHlh+VilZSnWqABq9dw=
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ac17191074mr383781755e9.5.1793886753121;
        Thu, 05 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm127121635e9.0.2026.11.05.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:52:32 -0800 (PST)
Date: Thu, 5 Nov 2026 14:52:28 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auyG1AnzpjLdOtpR@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?
>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?
>
>=======
>
>mr-dump:
>  request: {}
>  reply:
>    items[]:
>      id: uint
>      name: string
>      supported-hash-algorithms[]: uint
>      caps: mr-caps
>      register-index?: uint
>
>
>This returns all of the MRs at once?
>
>=======
>
>mr-read:
>  request:
>    id: uint
>  reply:
>    generation: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>
>Get, dump and read? I don't get it

This is another netlink-influenced terminology. "get" fetches one object
info, "dump" fetches all objects info. "read" reads a single MR.

I'll remove get and just have dump accepting id as a "filter".

