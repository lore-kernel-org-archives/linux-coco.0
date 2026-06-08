Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E813655F5;
	Mon,  8 Jun 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917999; cv=none; b=Un9iXfpuKeJlUt7zS9avC3zboomCam5xALQ5f/+zsbLlXipNcAphh6y1X7ugioe3Tuz12dJaWgAW1wVv3Z2VcE3lSol1/dMlMk6DAOTwCCCKUgQYWNcqDn3Jx1MysFv9rEdMYyEBpgr9A1gvRNVOz0d5ctrIPTRtE1FuMLqwEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917999; c=relaxed/simple;
	bh=y4cCLSHODe3aTzG0oO0ce9b53PPjH4NtE4IuCFdiQvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VOv5dY7vsE4NJk9EiW+HQFdwyQfusJsIfU8QUlDXxRm7+1K3EsFNYHQmPmj3zrF1A8VRBY4dNv5ssV5DecMGT0hKCGSQIBdlxYCIUlqt6NeQM3TJeWxzpFY8dvhQ5h2FNoNm1ZPx/I4zNt7j9tsJsDJkWN56Cg6gZtkEtXuBFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT3HVqaw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT3HVqaw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246951F00893;
	Mon,  8 Jun 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917998;
	bh=mN+u0pCJSsPAoXFbYCcI3ncWrm0wZKcAiKPT7u/ARIY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mT3HVqaw3DuU9tlhMrY09QOQltV352yiglepQMcHm1SLLiT/ypbKxV45DUzvAKld8
	 EgGc4D5icVebi8W9iO1+Ms150cbeb7qE6vmDzUFOy0iqcvpIzEoHKvsOnSvANbhBCU
	 YXQR3kHpKdx7v6wtMdhC9GbGkVcL8GT5egeSbhRBFj4Nl2BpotRLND1c43xt6Hd7/d
	 e1yImNR4cPh8ikhKGwRxWIMpYHZKO1EejAwZbDUenP6/OiXIXKFnn6fROU/l0RJQnR
	 Apj2v3s+UBe3X/kCk1+VkwAxJ6TbpQkE67WclAO6R8hShS3KldHQF117mEixaxtveo
	 A3ECAMAWS50Xg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
In-Reply-To: <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
 <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
Date: Mon, 08 Jun 2026 16:56:29 +0530
Message-ID: <yq5aldcpz316.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>> 
>>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
>>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>>
>>>> ...

...

>>> I was trying to avoid conditional compilation altogether and hence the
>>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
>>> in above snippet must come as some condition to this generic probe.
>>>
>>> Adding any more logic or callback defeats the bus idea here if we need
>>> to rely/depend on multiple conditional compilation or callbacks IMO.
>>>
>>> Let's find see if it can work with what we are adding now and may add in
>>> near future and then decide.
>>>
>> 
>> If we move all the conditional checks to the driver probe path, then I
>> think this can work. Something like the below:
>> 
>> struct smccc_device_info {
>> 	u32 func_id;
>> 	bool requires_smc;
>> 	const char *device_name;
>> };
>> 
>> static const struct smccc_device_info smccc_devices[] __initconst = {
>> 	{
>> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
>> 		.requires_smc   = false,
>> 		.device_name    = "arm-smccc-trng",
>> 	},
>> 
>> 	{
>> 		.func_id        = RSI_ABI_VERSION,
>
> Don't we need parameters passed to this (Requested Interface version for 
> e.g.) ? See more below.
>

The idea is that we only check whether the function ID is supported. All
other conditional logic should be handled in the driver probe path, as
demonstrated by the changes in drivers/char/hw_random/arm_smccc_trng.c.

>
>> 		.requires_smc   = true,
>> 		.device_name    = RSI_DEV_NAME,
>> 	},
>> };
>> 
>> static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>> {
>> 	unsigned long ret;
>> 	struct arm_smccc_res res;
>> 
>> 	if (smccc_conduit == SMCCC_CONDUIT_NONE)
>> 		return false;
>> 
>> 	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
>> 		return false;
>> 
>> 	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>> 	ret = res.a0;
>> 
>> 	if ((s32)ret == SMCCC_RET_NOT_SUPPORTED)
>
> Is this a reliable check for all possible SMCCC services ? i.e., Are we 
> expected to get RET_NOT_SUPPORTED for any service for which the backend
> is not available ?
>

That is correct. That is what the SMCCC specification says

> Also, as pointed out RSI_ABI_VERSION may return other errors based on 
> the input (requested version, e.g., RSI_ERROR_INPUT) and we may still go
> ahead and register the device ?
>

Correct, and the driver probe will check for the minimum and maximum supported versions.

>> 		return false;
>> 
>> 	return true;
>> }
>> 
>> static int __init smccc_devices_init(void)
>> {
>> 	struct arm_smccc_device *sdev;
>> 	const struct smccc_device_info *smccc_dev;
>> 
>> 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
>> 		smccc_dev = &smccc_devices[i];
>> 
>> 		if (!smccc_probe_smccc_device(smccc_dev))
>> 			continue;
>> 
>>                 sdev = arm_smccc_device_register(smccc_dev->device_name);
>>                 if (IS_ERR(sdev))
>>                         pr_err("%s: could not register device: %ld\n",
>>                                smccc_dev->device_name, PTR_ERR(sdev));
>> 
>> 	}
>> 
>> 	return 0;
>> }
>> device_initcall(smccc_devices_init);
>> 
>> with the diff to hw_random/smccc_trng
>> 
>> modified   arch/arm64/include/asm/archrandom.h
>> @@ -12,7 +12,7 @@
>>   
>>   extern bool smccc_trng_available;
>>   
>> -static inline bool __init smccc_probe_trng(void)
>> +static inline bool smccc_probe_trng(void)
>>   {
>>   	struct arm_smccc_res res;
>>   
>> modified   drivers/char/hw_random/arm_smccc_trng.c
>> @@ -19,6 +19,8 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/arm-smccc-bus.h>
>>   
>> +#include <asm/archrandom.h>
>> +
>>   #ifdef CONFIG_ARM64
>>   #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
>>   #define MAX_BITS_PER_CALL	(3 * 64UL)
>> @@ -98,6 +100,10 @@ static int smccc_trng_probe(struct arm_smccc_device *sdev)
>>   {
>>   	struct hwrng *trng;
>>   
>> +	/* validate the minimum version requirement */
>> +	if (!smccc_probe_trng())
>> +		return -ENODEV;
>> +
>>   	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
>>   	if (!trng)
>>   		return -ENOMEM;
>> 
>> We can also move arch/arm64/include/asm/rsi_smc.h to
>> include/linux/arm-rsi-smccc.h. There was a suggestion to move these
>
> super minor nit: arm-smccc-rsi.h ?
>

-aneesh
