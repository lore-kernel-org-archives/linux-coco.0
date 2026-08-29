Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DB41C72;
	Sat, 29 Aug 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983951; cv=none; b=HtCom1iUxShG11fq4R0NTdf7z8l2c0G6PoBQLGqqvMEeMzuJKUJd5H1RB7CRx+PRWPTsUEZEICZ/bZ4ETVcJu+XdUSnRAit7Ya1XOehNSBcAQaDMIxlum8ilYU9EIfmPTdW73VKG/drVwlUFeOaCgBXTf+FyqlokJ3cDxu5uKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983951; c=relaxed/simple;
	bh=Cp4EmIoziIZQhnMLJowP2o1f3w59naAntr9YLFs8PCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ee8HuKvI9vTO98kNyGXK+H9XFxIaMnmNuBFib3hpf6vrwGdE/GCxmtlj+BvTQUg4DH7Nm+tIU0ipib2J5WQ9o9Q4+O/0CUvhxmmvCzunlWFYAXDHoQRUpFmTPPG9MF7G/myosJeqlDvq+uvqEyzxwaxEDJd9/4aIZbSsZsF+Uog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7m7g7Ps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7m7g7Ps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1701A1F000E9;
	Sat, 29 Aug 2026 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983950;
	bh=TRZw1V1vB378QeSlvx5BVidjqGhxuO+qRstnpjHPWb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L7m7g7Ps2C498I4YlV7/C6DjkiyJ6vKG70Snu3K+r9J9UaUIbMjW1gV4QlFQh536/
	 jSpCSm/Qt2WZ7gRJFGJTw1dAf0EC3itaGrMZvE79e9OxcdHvfTi9pORbP74TT0ztwE
	 oHZFrpLtxWSWg2hBsGhnBMd8yVdcYS8fah5iOjplxgWvMqjiuI+XKsmDySwfT1cOCG
	 s0LzhW6Px8IrQroI1TiwDC+N75K1wi+KYe554VP+n0gwZWXWqr0c6m8xuY7Ij5f9O7
	 dJAh7PwqyAav04unbNz3h1+NHKHPuNjwHd2j59jK1UWyKH/MZdRYyZyZGLNGDWyXh4
	 sqXuw4fuPdYWQ==
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
Subject: Re: [PATCH v9 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <178794567780.4159892.17969556982711821646.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-7-aneesh.kumar@kernel.org>
 <178794567780.4159892.17969556982711821646.b4-review@b4>
Date: Sat, 29 Aug 2026 11:42:20 +0530
Message-ID: <yq5ald9ptpyz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 43 lines skipped ... ]
>> @@ -94,6 +95,12 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>  		.requires_smc   = false,
>>  		.device_name    = "arm-smccc-trng",
>>  	},
>> +
>> +	{
>> +		.func_id        = SMC_RSI_ABI_VERSION,
>  [Severity: High]
>  Does this new entry cause uninitialized registers to be passed to the
>  firmware?
>
>  Looking at smccc_probe_smccc_device():
>
>  	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>
>  The invocation only passes the func_id, leaving r1 uninitialized. Since the
>  SMC_RSI_ABI_VERSION ABI requires r1 to hold the requested version parameter,
>  does this leak uninitialized kernel register state to the firmware and pass
>  a garbage ABI version?
>

Yes. This even can result in error return from firmware like

[   rmm ] SMC_RMI_VERSION                   6 > RMI_RMI_ERROR_INPUT


>
> This seems like a good point.. Several other APIs had this 'pass a
> thing in' as part of their version contract too.
>
> There is ABI incompatabilitiy here right? It would make sense to break
> up the really different versions into different device strings if
> possible. eg v1 and v2?
>

The goal is only to check whether the firmware function is supported,
hence the explicit check for SMCCC_RET_NOT_SUPPORTED.

	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
	ret = res.a0;

	if (ret == SMCCC_RET_NOT_SUPPORTED)
		return false;


>
> ...
>
>  [Severity: High]
>  Could this also execute an SMC64 call on 32-bit ARM (AArch32) systems?
>
>  The smccc_devices array unconditionally includes SMC_RSI_ABI_VERSION, which
>  is an SMC64 call. Executing an SMC64 function identifier from an AArch32
>  execution state is architecturally unpredictable and could cause a crash
>  or hang on 32-bit hardware.
>
> No idea if sashiko is right , but it is what I was wondering about in
> the rng patch...
>

I will check whether issuing an SMC64 call on 32-bit ARM is a problem.

>
>> [ ... 44 lines skipped ... ]
>> +static void unregister_cca_tsm_report(void *data)
>> +{
>> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>> +}
>> +
>> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>>  {
>>  	int ret;
>>  
>> @@ -178,30 +175,33 @@ static int __init arm_cca_guest_init(void)
>>  		return -ENODEV;
>>  
>>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>> -	if (ret < 0)
>> -		pr_err("Error %d registering with TSM\n", ret);
>> +	if (ret < 0) {
>> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
>> +		return ret;
>> +	}
>>  
>> -	return ret;
>> +	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
>> +				       NULL);
>> +	if (ret < 0) {
>
> Can just make unregister the remove function. Don't need to use devm
> for everything.
>

IIUC, you are suggesting to do the below?

static void cca_tsm_remove(struct arm_smccc_device *sdev)
{
        tsm_report_unregister(&arm_cca_tsm_report_ops);
}

static struct arm_smccc_driver cca_tsm_driver = {
        .driver_name = "arm_cca_tsm",
        .probe = cca_tsm_probe,
        .remove = cca_tsm_remove,
        ...

-aneesh
