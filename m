Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302738;
	b=AwbwD+guU31Pa33nqwMqcejDsW8iKAC1Hdna7TllUrv4RPn/vu8HKsFkVU4NTXOfRKtJ
	 QG60ipxESz53TXVx/i/iu2sR79hOIgI13i16TtJLmdERiOtHnbsfUmAAqa70nQf6kMTtG
	 gtGmeKqK+5qdHUl8Knhhoerw+5pMa4WKqTRXoNP2SG1y0yhfeAQBaVB6/9Gv0B9aDLzTr
	 iJ+nGjv9elr0NiPULOX3k0wNafCo0b2v0SuhvMv26QdeoTp5AKoipRCBFUXFUx1bE94TD
	 8HXzFUOEMFqPTYM/599ovwjoNSNk0Hvf7Ghpf9hiJQOa4zTSFrypmjPJtWcgmfRkCgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
	b=3+dCA5OGyxbjS+qdLgynysNc9TLRg+CF19kfV2pc0rvzA1zj2tAfwajSwT0rCQBFel7N
	 Yr+jOgQwk4vNyM94T9/A6XwH8Dlj4MndpTXMjRbfHvI8w1bXQvLZdX9tFQZh6+TNbz5ea
	 3WdqtkkfeoBUizs4B9e3wuyBH/yY+DLlBSUOZgR/1xEERnK4v8HojlDGF9QvMyXThsQuD
	 v720WBkTGbQ0LPRxfhYGw0vaUsV/MbXN0oB1Zw8gDS8MqLSEvuf0rdma2DTR4zHsFQeV3
	 tZv4KMeQpT6kv8H6MH/kpu9UrtgU0CBbmn69YASDsqRHcOpkgKd81VmKqAPN5jB0/lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF72606A31E
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 19:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso417041fa.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793302734; x=1793907534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
        b=ZQXBSJO6XoxXub5/SYqkYhKJuZ5AvjNYpk70A0U7VxKUvUJL1AiPH+fQams4tSMFiT
         H6ctjKuc+JbQpPx+JDXVmPkf2+m932DUz604FnQtsELvkmk1mpo1Awvxvu2XvJfADaJn
         R+xPTjtd4a1rgJ0d83CJNckQEq+UBU4YMCokNlWgdcbSM2TxoiUPEH031K1U2pxOPQGr
         GFjQk6/8F4zczoIP8qeHPx7R9/wmqC3Ux55f7a53qtErk7Zs8mzMZ4Qe98VhudIrZEDu
         ov2YhB3RQtXatnX6mc3LoLfRhTtcol7ql4AsyCT5XBlthtg0EBXz0sIDOwfQmeWfItg7
         qcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302734; x=1793907534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
        b=KGqqqZmeF1rOS2ATMk3GTLKWZmT/K43DkF47OJQ/xJg7IYVsWxcP0RnxkgBhLIkkc4
         n08pB10HzlpwyB3Y4wjKp+6v9xXUYFayzYkT3xC8gN2B3wCjn3YNa8HTBYIRazJyh6N/
         rmNh1pXoZbRKkgJv3TLuVE95Ff3rrNBPXALHSESKNG4iRRitPZwreGNnim//hBP8f/uj
         Z1tUm5vdCynQnCS3s7ttPMIldrV+NdzBbHb8DXLH05OAwsMI5zNSSdLPQg4giUAHDnDm
         hM/nUU5MnT6EeSGQBxyAImSha3/U+7CYDttoWHqy4abc2/UhNveNmvy+Aeb48pc59Szn
         /Trg==
X-Gm-Message-State: AFq9FYLf+qqyW3kW91jFWmxl6pK+/9fgboampWPzV0iblx4pO5FFNT6g
	4g/CBTjfa1lueWlPzN3MLhQMX71gHyKrUMNjUa4eTLlCFY2wRjtKCYwNUjY3PLpk5Cc=
X-Gm-Gg: AYBFou2tVQdCXe8lOkEEd18vcpL7z4BlYUrc0eml/TG1A7qyNmWs0RoskM71zyMveTB
	Lcz69E3yMJeFWHSr1E36fAnoVY5JAUG+Y7pjS69mT83KXlElP7VUERcAR9gaZwex3iXSLW6g2Bf
	T6SUP0+Xfj1yz3uisI1sN0WrGoBYB92ZiyQO9rCAft9uUaqKRlSf6UuyMQQicDhNiPkDNucU+tO
	VAo6Bxuu0RiPeIRRqmASvlaBFInDe1xR4vi2cA55KfPUfvHKCBlesitjI1FrexWDBHyqMBH0RPV
	1Y8WJZnrmbS6GMCUJXgaj3AXFqOV6twAIZoQm51q3SpN24q5h88PqzXPILmfx5aqGrwr310H7U/
	Jv473HW+f7FrNQqRMozosIoze2tx1kSExXfyYl3v3BtW3psdf46psJpD/bpTbclH/71KGWYWkjQ
	Bud3yDOTHyh0hKdclF4VXAuieLKFAOGMGAcHq/wofWvKbpQzKZ36cn7KYJSGE3RPpLxoNirXfOi
	W5MDrIQxLxG8z3+wgF11Pk0uDwYJzeRq2DpVZsSi9y6c5fiHV27OoI2YV8gDKlZnul2gYfNwPK9
	TNQmttC5urHxgwgsYXNMW45zd0IKb/gwAS6/UUMOErDoswHgVm5GeFiQVGE=
X-Received: by 2002:a05:6512:3f03:b0:5be:414b:a84b with SMTP id 2adb3069b0e04-5bfcadda82dmr2380923e87.51.1793302734163;
        Thu, 29 Oct 2026 12:38:54 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd7ef0c2esm69050e87.50.2026.10.29.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:38:53 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:38:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auOgwlGeW-vRGVb0@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auMX4kbsflE9kK3Q@FV6GYCPJ69>
 <20261029184324.GE3734323@nvidia.com>
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
In-Reply-To: <20261029184324.GE3734323@nvidia.com>

Thu, Oct 29, 2026 at 07:43:24PM +0100, jgg@nvidia.com wrote:
>On Thu, Oct 29, 2026 at 11:04:58AM +0100, Jiri Pirko wrote:
>> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> 
>> [..]
>> 
>> >
>> >=======
>> >
>> >device-get:
>> >  request: {}
>> >  reply:
>> >    caps:
>> >      evidence?:
>> >        min-challenge-length: uint
>> >        max-challenge-length: uint
>> >
>> >Did anyone implement a variable length challenge? That seems a bit
>> >strange. There is also a very important crypto warning here that the
>> 
>> Yes. TPM2_Quote accepts variable-length qualifyingData, represented by
>> TPM2B_DATA with an explicit length. This varies per request on the same
>> TPM:
>> 
>> [1] TPM Library Part 2, section 10.3.3, page 136: TPM2B_DATA.
>> https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_2_Structures_Version_185_pub_c0a962a931.pdf#page=136
>> 
>> [2] Part 3, section 18.4.2, page 158: TPM2_Quote qualifyingData.
>> https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf#page=158
>> 
>> The PSA Attestation API, section 4.4, also requires one implementation to
>> support 32-, 48-, and 64-byte challenges:
>> https://arm-software.github.io/psa-api/attestation/1.0/api/api.html
>> 
>> FIRME DEN0149 1.0 ALP2, section 8.12, Table 8.23, page 100, likewise
>> defines an explicit Platform challenge size parameter in x4[31:0].
>> FIRME itself does not mandate the specific 32/48/64-byte set:
>> https://documentation-service.arm.com/static/699c3b70b60ef220b14ec14d?token=#page=100
>
>I feel like userspace needs to know the difference between 'any size
>between 0 and 100 and 'exactly one of 32, 64, 128' ?

True.
