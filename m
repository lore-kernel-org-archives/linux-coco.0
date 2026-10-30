Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372720;
	b=WImUHe8IjOuLXzg33sQqPOC6RoJCA0SuQDG9Kn9c8wazPhsEhHZHacCu4Q6kDfNCOsxp
	 X4FwH7VJIH/h1bVjnggkL7YGJGjz8+Ls11FNxpQEC2xU+PHMN1coCu70DH9Qrgb3KGrmX
	 Fbim+Sabvv4g/o+PhC/Jh4KaSqXJw86430GmjEpYhmYSHOdv0BmMDIYuDZUzL1u8Gyxs3
	 8wP7nIKPrm93ZauZXO4vLMTKEG/F5uUP0AliFjIAOr8yJAxTddUNiFqQVPycOlfI+oHOg
	 ZDfKJx3eiHsyBd0Vk+rznCeEzv9MjmVR4ZYFPUq7de7p7OBcCdJ10ombbJ2Y0yuFxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
	b=ZqXYX9jahfzIxz1XHtBQY9lfh6D9NH5uBNNYL4ezZU/xZUUHYe3qeo2ZKcRPhqjM79AX
	 DJ5dORPJkat4ImmYl7SjYN3ubCwE/a0Bl26NyEmCwk2d//Tev9KBK8jzjhVrdhbYVhUDy
	 FFtI+//O9uFO20mLYfXJQlwfL0DUjHy/9u1Ykbtt67qQ0c3VtO9iRF2JrFsdHq2UDKI7z
	 9N6uOs44sGU4HHAIENUneNmeot8aFWRLFLISTtYivGTu2hdHMcqWL3Y2g7ry6P2NYjLoB
	 I4VOPYCc3VPi0HtltTe0C8v0ReUl4w9i87VKO4ZX9ig23qYnAI4jF85r6NgMTM0/q+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="Yqpgu/2H";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAE8606A31C
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 15:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Yqpgu/2H
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd2c386so460517f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372717; x=1793977517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=Yqpgu/2HRn6sGRD8fy2ay4dBV6nAjKRE2w2P/zYJYwTaqLfXejv8ObqrJ/vSt1sUOw
         9fAbSP0bXVY7PPGlSJ+tQZq+XxPpU9V0rCgHMmN61iFE8K0lo64mTIEx+c02jiwBVfoX
         kxWnb7f9pIf8aDzrxnBjn2upKlEvhEvPeF35XidKGVIzzjYQGXn5USlXo7138LPCQeot
         +0K1QWYTlj8rQTCivLX6PyN6f9MpD9vU2fZCWA/P9/muTadYD7iHeaZryNmLI0sSHFt3
         bkJB/HArcVY9er23v4SG2dekQGoQzuaOF0V1oxz4oJfZOKr5WdouNokMEcpq2VLeD/Zo
         C8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372717; x=1793977517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=zov9S/bpT7Nhfh2MFNkGXLXEpXgx0ku5EU/ROEhc4IZaU7gGMzqWXxQfEy/3iRCk6w
         EPQ/YJLzSg4qHwK2DAnGVUSP9q4vsrCBWOaXBhvGPdB5aPZ2PRjdJXShTjNhUX9O2QCI
         giSSYhP1iarOoGLkHjrA16f8e0kzLp1Rw62qGI7WS4QkwSg9XXXsl7zy1ePRkUDHsq1/
         8Xjz2+MAZfcGWoI4ZYlWHkCVIIjxQXNJZxeA+RJCSXFQHoNgcO/8mS6KBQcrb+GskJb5
         PrnGUENwisMeFF0w4JTyTxcfRPePcZe0YSjl5sNwg0OLLLNn++j7FOmg6Ef4V4e9fntw
         JXvA==
X-Gm-Message-State: AFq9FYLXrOKijqUADUApel0E+BGBV9WlSBxiS9UtyxlIrPqhAOd/c3+Q
	GYN2b+s+mkJVh4Qd58RAnynUsXSqOyJ/aVjsLRdOD+WYt65ydP7ilVOqNkWPAazJR6s=
X-Gm-Gg: AYBFou2aTAiGwQExEGmNZH+t7KqUfMShBlC14lruZwEyYcOrNvGkEFClIGgXRjaW4Az
	e94l/Azdw2JaZCltILZepu28WsJdUuhKHmBFUBhhACsnbgRJbb0QFQcnfeBqJepxNuMMfHCvUpt
	+4ZcODjtYFTd32nn1Q16k49KPuaJnfRuVrsG+Zx4YYJf+X701nd53vNdU1SILPliZrRlXn/4Upu
	oJb5Kd2v5cW0BoAz+VLlDKJ0XCp13HOXGomreVNU4B7s00BlV/eqf4VmumxLlmw7X8sL2h8J5Gk
	HuhWqd9AgIOftly15w7vk2kYECCbLcGGcMRQBfzlFLM9DWfmiKF4a4OLmDD3ZHKqd3O57N2wZQE
	eGA1dtDLjScacoP6g6HVdbqL2Oj7+Hel+1dEkqCG3mez2Q1/0SrJDhkGul0JY+BwaanYET6kB/E
	Ns3jEo7n45Uxd+A3L+8f00cwfEXtTbbUKpDbaq/jMRUutg7n6QlFLY6hfdNPv6+D6ilTQJJP+0B
	S+EIp1zexEVhukkOEvvvds3kddzfues2MWvmGE1cTiF2BjRsxDvwBU0rd4eAY46b5x8XTT0iKJO
	X9c1+BgoQFTQREOo/jR4SqoXeoNbtEtwdn2jGdui
X-Received: by 2002:a5d:4ec6:0:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e6e3091c8mr5024505f8f.36.1793372717264;
        Fri, 30 Oct 2026 08:05:17 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b77f06sm3716923f8f.21.2026.10.30.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:05:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:05:13 +0100
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
Message-ID: <auSxxPM5z8BzgNm3@FV6GYCPJ69>
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

>> +
>> +/* attrs of group cap */
>> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
>> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
>> +
>> +enum _ctlv_attestation_attr_cap {
>> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
>> +};
>> +
>> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
>
>I feel like there are too many layers here for a code generator..
>
>enum ctvl_attestation_attributes {
>   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
>}
>
>Do the intermediate constants add anything?

True. I originally had it like you suggest, I changed to enums to avoid
the explicit numbers. But you are right, does not add anything.
Changed back.
