Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4274D3B4E80
	for <linux-coco@lists.linux.dev>; Mon,  8 Jun 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936082; cv=none; b=RvjK0ukYqCv0TV4Cibqf8p2zYwXtK7oznqC46GG0XBCFtnCmFrjn+cUYLFzyvV0MT+N0dWl5vPDhGQb8ljxzMvLWQaRvFo8ubEyW88apoXzTT04KiA9Frv8AjJSnNVOF7/fR6L6IbqZQ//wXH/r5oVcivZZWDlTHgu7sdekFaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936082; c=relaxed/simple;
	bh=o1gFPXFWJiu/z2dHtJZURkMXw13o+ZM7ANlgOI9GSJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGb3T9gqcG4ixclJnJyTN6C9NV7SyAM9DqESz5+9WiSYI/4M3u7lexMcvxmtPFbJHnEvV3mYysWZ5f+v0E4JyVA2UDHWJM0+sNBVopyKnci/9IGL0HxtMjkprIKM0+SXdtaGlNJ5gOc0JpWoBR3nsOFv5k8v+9i4Qn3hRmiqho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XjgYPwFZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XjgYPwFZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 871F822D7;
	Mon,  8 Jun 2026 09:27:54 -0700 (PDT)
Received: from [10.57.73.11] (unknown [10.57.73.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D7B3FD88;
	Mon,  8 Jun 2026 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780936079; bh=o1gFPXFWJiu/z2dHtJZURkMXw13o+ZM7ANlgOI9GSJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XjgYPwFZfhLCQqo6vvRmbJe2830zLANh86BF2ZdclMoy3/MRsdhK75KcshtcuPjQm
	 ugZMDuczAeyCZSDIepP5x8Cs8XlKTF4fv0KGQvLEXd/y/MHFC5gc3v4sIgDjgDeO19
	 /4PYGYcoZ0rYndCygfCmArJ/NERZT93i9fCUMwOQ=
Message-ID: <6f58a9e0-8f61-4202-acef-901108808cfd@arm.com>
Date: Mon, 8 Jun 2026 17:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: Sudeep Holla <sudeep.holla@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org> <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
 <yq5aldcpz316.fsf@kernel.org>
 <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 13:32, Sudeep Holla wrote:
> On Mon, Jun 08, 2026 at 04:56:29PM +0530, Aneesh Kumar K.V wrote:
>> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
>>
>>> On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
>>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>>
>>>>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
>>>>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>>>>
>>>>>> ...
>>
>> ...
>>
>>>>> I was trying to avoid conditional compilation altogether and hence the
>>>>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
>>>>> in above snippet must come as some condition to this generic probe.
>>>>>
>>>>> Adding any more logic or callback defeats the bus idea here if we need
>>>>> to rely/depend on multiple conditional compilation or callbacks IMO.
>>>>>
>>>>> Let's find see if it can work with what we are adding now and may add in
>>>>> near future and then decide.
>>>>>
>>>>
>>>> If we move all the conditional checks to the driver probe path, then I
>>>> think this can work. Something like the below:
>>>>
>>>> struct smccc_device_info {
>>>> 	u32 func_id;
>>>> 	bool requires_smc;
>>>> 	const char *device_name;
>>>> };
>>>>
>>>> static const struct smccc_device_info smccc_devices[] __initconst = {
>>>> 	{
>>>> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
>>>> 		.requires_smc   = false,
>>>> 		.device_name    = "arm-smccc-trng",
>>>> 	},
>>>>
>>>> 	{
>>>> 		.func_id        = RSI_ABI_VERSION,
>>>
>>> Don't we need parameters passed to this (Requested Interface version for
>>> e.g.) ? See more below.
>>>
>>
>> The idea is that we only check whether the function ID is supported. All
>> other conditional logic should be handled in the driver probe path, as
>> demonstrated by the changes in drivers/char/hw_random/arm_smccc_trng.c.
>>
> 
> +1. Yes, we just want to know whether the firmware is aware of that feature
> before creating the `smccc_device` for it. The device probe can then perform a
> more thorough, feature-specific check to determine whether the device/feature
> is usable.
> 
> That is the main idea behind the approach I suggested. Please let me know if
> you still see any issues or think this may not work.

Ok, yea, I kind of forgot that we are boot strapping a driver based on
this "smccc device" and the device is only an indication of the firmware
service, the driver would decide if the service matches its expectation.

Thanks for the clarification, apologies for the noise.

Suzuki



> 

