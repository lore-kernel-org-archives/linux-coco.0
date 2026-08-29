Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0672F28FF;
	Sat, 29 Aug 2026 05:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982866; cv=none; b=UPMT/METDAXPy2+9YVxGSsT57qgU06zfAahTtLJElFsduCL6pg5qrQ8gMaTJhnLuYcE4Ec7aNwYkkTeuAELnEmTlh/zV6AzHJmN8Gy3EVBUAi7+U9V2BZUjYYEk9ZehHNsgU8IC1R4Oy+9U8WM7TD/uI2HLc79s5pu303F4IETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982866; c=relaxed/simple;
	bh=HIks4LV10ysmsNcUdePgwL6jjgFficWnCTvztD4WSGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dl2aqQnW1P3EhQLqi5TaGSvRhOfXHMBmPR9/Fj8NnA7C+Lx//jfkV1eIAP1dDLVzkEo9Q7+rajOyPFBHsrWjDvQTi8QPvo2HefgXYE6pBBC4e4eeXXw3irOGRnphyQ56mbbnmOiJ1EJWJWAjniQRerZ5mYCQ+7DbSU21+Est+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i134d/Wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i134d/Wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533FB1F000E9;
	Sat, 29 Aug 2026 05:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787982865;
	bh=yFTrJI2OeaOiAaQDcbHU1K6Yg8r+hEUD6sJwtiaktYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=i134d/WacIrlcXNhsLMoRsdAUYUPQU+u5jVamSqmNuVIr31oNDoDyix3Bl7iQ3n4O
	 cJ+/AWv1CT8il1Gy4Xhyz+/lXEW4ePaMV2mK0B+zawE6uIRXRiVqqyhF1AT5YsGMqp
	 Z4VeVGpBz+Ra2Ovxs8VTNU2LA2HRxLYI6st5dFqRodePXpkNwBKWvMowdb4lDySqID
	 /12B349d0ne77G9obHl+zZ3nHAgCn1YbqgpE+1i1hg96c1rGzVc+b1fMQWOlYNMFdx
	 6ST4ftT2MkZXU5U1dLBCmCr2r1ZYrHJg8aLCtQLcAyiJZ+SYyMdufuVjQKNImiZ9SJ
	 PEV9uQfDoOEYg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
In-Reply-To: <178794567779.4159892.8570190086048719424.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-3-aneesh.kumar@kernel.org>
 <178794567779.4159892.8570190086048719424.b4-review@b4>
Date: Sat, 29 Aug 2026 11:24:14 +0530
Message-ID: <yq5atsodtqt5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 58 lines skipped ... ]
>> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>>  	return copied;
>>  }
>>  
>> -static int smccc_trng_probe(struct platform_device *pdev)
>> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>>  {
>>  	struct hwrng *trng;
>>  
>> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
>> +	/* validate the minimum version requirement */
>> +	if (!smccc_probe_trng())
>> +		return -ENODEV;
>
> It feels like slightly poor practice to do this.. It is doing three
> things:
>
> 1) ARM32 disables this entirely for some reason, shouldn't the bus do
>    it? Maybe it already does?
>

Why? The bus only checks whether the firmware function is supported and
creates the device if it is. Further validation should be the driver's
responsibility, shouldn't it?

>
> 2) Checks the API exists and checks but the bus already did this.
>

This checks that the firmware supports the minimum ABI version required
by the driver.

>
> 3) Checks the version number
>
> Maybe the bus should capture the version output and pass it in as an
> argument to probe so the driver can do the min version check directly?
>

One of the earlier discussions suggested that the bus should only check
whether the function ID is supported, rather than checking for an
expected version or anything similar. This keeps the bus code generic.

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
	ret = res.a0;

	if (ret == SMCCC_RET_NOT_SUPPORTED)
		return false;

The other alternative discussed was a device-specific callback that
would perform additional validation and create the device only when
those conditions were met. It was dropped in favor of the simpler bus
code above.

>
> It is very minor anyhow, it looks OK
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> -- 
> Jason

-aneesh
