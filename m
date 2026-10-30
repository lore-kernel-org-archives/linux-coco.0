Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366964;
	b=A9JQn1QxVwk5rtXCAz1IuslvV3kkOLBcEVZfy29kWLusY/A7PdcUzIhGpkFKT0Bunysb
	 SiWty5xS1HJ2AXgSUYEmj2wsVgiXGp6NRfgKFNiY3m+uvQjBqUx5jD0U9kZ7MrBlaDbpV
	 hI4Wjuy+4Dz8hClR7qqaUlpvYTd4ocq6EoALqeokXHSwe7fjyeNIL4MdqBLGLWTuazoXz
	 u6Asp/hy1m7wyNfE+Tt8zpfvSlMjgFvNaS2q8zniy/zvlXE7FV9YCbC923mmZGg4ys5Dd
	 6V1F6ds2iWyt/6m+1b8CpYmi0SRpS0l6eRNTuUNBfKXkGCxN/kOtF1kYBfKc3cOe1OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=c4GhHQfOETP0JBoD1YsAYRSKnFxUsVlKKFwgPkGlhAU=;
	b=GrSEAQjwCzzanfADSz/vsRjikKyXdO9NxH4xi1i0loORNFqR3xYFJeVPfK28Zm7vN1v2
	 H244irSFseFjRzZ6TUvCEBbnx4KgBhHdOd23w7tU9RFAJ0gwCKJr1i7W742npEYMru0mp
	 j4b0XtTo/Asn9zvFdPTpQnhWnzilbn1WFn17VqN/8i7oM1KsDRRfzTJaxlnTGQLCM45by
	 XDB9xaTKu0Cp8PuasfLlHaTjVh3TK7bTwCLFLdi6n3PuTJQ5o7DbeVNSQLUQ2C4x1qFRq
	 Rmol+63ADBjrGj+L5UWatB9/FljKofuZ3tH66IUiFCYIHe+b4biGm2oQ8SQyFs1KHVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=MrtFnXB7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6499B606A31A
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6499B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=MrtFnXB7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4245605e9.2
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793366960; x=1793971760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4GhHQfOETP0JBoD1YsAYRSKnFxUsVlKKFwgPkGlhAU=;
        b=MrtFnXB7y7cyz0NOP24R2fwrs7migNDvGs5pSfUfYduZ5K3W3GobIvsTFc8TCz+vqm
         i8stQhj9VdiiebQudmpX8D2ldOzwWnebclTUvsiDHBP8bkRzloX0SwrWdCjdGOAvAB2r
         vL1lgHZAh9nRieQyEsq5NqQG6b5lUJLGBBeOqq4bNQ0wOR8kaMnnGGXnEDvkAgg4B6S/
         Rn61rCbkMKMthY9Krd3XJxlBOSJ61bOpl5ub7ByjEXyka9kwiPrkM508IoH8h/ugJS5s
         7JE3WjzhTEUTEgkbleVAmr6njOoxJOwnnVlyJkAaWvIek63ctEew+VygcJgZUA3lZgpu
         Nlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366960; x=1793971760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4GhHQfOETP0JBoD1YsAYRSKnFxUsVlKKFwgPkGlhAU=;
        b=XUEYRgnSOTFACee7lZ/+PW+LMoSUCBVgvoaBv2i2Lht92E7E30P97M2rwwR/PqWFmc
         9flIDfE2VyD6cUJKsWL61b0EUhnyGjlxa17B2jDUvehn8FCWbKA3v5fRqjdV+RbcaLl/
         5IreKIlbe0oAvoyn95zJNyXGKWaLnRpbiFHjdsQcjKvsKqZtVG5ahi8GYaHJBg/X3oUc
         EB1bjitRoXNAqwpkmK/3ewdi0iKI/PbVY6pOoqNJ1Yq5zkwTWOW7qwYMHOoTLHbxJVUH
         tGVhywcWM0LeUX1qSCSglv6XR5wX1KnCY5aSHCdsLKRZYj3hnnt78RYuThGfpVLJkgzk
         xu3A==
X-Gm-Message-State: AFq9FYJjK6iHxjspL6D+FKy4L1PikhR+6uRiBPaH+774naxMJMAfHXRx
	wewvd76phNKIoTO8csVskK51mOLkqGGjaQYgrDWQwTtVaGIGikIJVrFhjJDZSRnhRSo=
X-Gm-Gg: AYBFou2OTExm0lzN3I9rsrAUfDH3yA3S+HuV718z2bs9R2IACwfwfFk42Y5qDhVZJq2
	R8dmBAFOsPMQIpxjqcbjFX554koUKat3NtKIVf7NFgfcMUX6uLqtVi9yX20vJjzCpEZloz5dul5
	Lpm9Zs5zXCKPH2KJujequ7YTDw5CoqX61eoNvqNmrMFW4Zi0WLvODxpIA/682Lp31Pnk5tH5DQ1
	4jUvvFDm8TNARGitDs2pEhNA+zL4Py1r4bRzSoR8OBDNkZXK9SZfJAeXd4kPgwRfV7k59zppY5r
	cWQ2bG4NevjWVt+SzKWt8cq2wtCLlIDGJ5hYkRL5hokrC5ZyiLV76+rxz7NijUNLD5etwK+Gz64
	xVaUyFstrNG7sFxOFp7WtDaeClCs+t94vEOnlV6Hgkd8rq3o/YpGE08M+K07RT5MyhpRq+juEho
	Yng4Q9QY1NSUM01lquHpsXY91DlYtW1rNW2nwZpZBdoz5W9wEsPdBtXmQ4u30l75mjyF1Obr3rB
	PfuN/0dIlZeQ/Sx3fPEdN00yrFForkjtBTNVP8H1OvSb+pxOkGiefA2ZF+Muqfdn2JWtGIIn8we
	63p4JqCdjuje1DtzdKNg0R7GOV5cmutS6GXnFA==
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr48752555e9.26.1793366959078;
        Fri, 30 Oct 2026 06:29:19 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm45074465e9.2.2026.10.30.06.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:29:18 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:29:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 01/11] attestation: Restrict inherited operations
 per instance
Message-ID: <auSa4z54poQuahuA@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-2-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-2-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:08PM +0100, aneesh.kumar@kernel.org wrote:


[...]


>+Per-instance features
>+=====================
>+
>+A provider descriptor describes the maximum capabilities of its instances.
>+A child family may restrict evidence retrieval, verifier verdicts, TDISP or
>+trust-state reporting and RUN through ``attestation_features_set_locked()``.
>+The features must be a subset of the descriptor. Verdicts require evidence;
>+RUN additionally requires verdicts and at least one native state reporter.
>+Providers that do not restrict their features keep the descriptor's defaults.

This is already covered by CTLV op enable/disable helpers. Why exactly
do you need to duplicate this in features? I believe they should be
fixed.

[..]

