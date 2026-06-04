Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE370386C1E
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568653; cv=none; b=iRDu16udGsQUIFbbkS1bekzyo4eG+OF/ayuHXSh7rwqRggsbvc9n4FjlS0tY/g8djSQ6q+Zy1bzMdic331gLakz1NOhy09vnRzztWyb4uJ+QSszwFAPmfsWVy1SPtWGlvl/EFRq61sZk+TKSIfkGrRnoTewT/5lAcvWqSTkNHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568653; c=relaxed/simple;
	bh=GOLViXGsANaa4b3Q03QnUA/suUOXvVvZf/cOY8uV/UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB5cvRjZtGl6IwU+Or45QM8ADmuxbucInuk0vA39u6ZUE91o91pD5nkXAHv47BAl+orCs58Vy9zJqvI7RwfnxyWNvcdMg6yybqJPfs418LkrdGoLiE2Q0PXF6FXDlNb5loJCFJXGy/I2is2usc/ffGHBrXVM2AE5HFFSf1gBzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VqOaCIwF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VqOaCIwF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54F2A497;
	Thu,  4 Jun 2026 03:24:04 -0700 (PDT)
Received: from [10.1.31.44] (Suzukis-MBP.cambridge.arm.com [10.1.31.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0FF3F7D8;
	Thu,  4 Jun 2026 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780568649; bh=GOLViXGsANaa4b3Q03QnUA/suUOXvVvZf/cOY8uV/UQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VqOaCIwFI1rUfNG6mmEPhsKl2U/C1zTZyN0FgtlsdwTprCBZ44+rM7xCyLMJqI/3u
	 iKO2irs82oHd/eh1/6FvjGkYlon/Ggy6rpzSXv4LVYx5hYq2KhGdPzha6P73u+HwBJ
	 gyeK+8CkC4ol2WzxG+UeO9cVewdQ4s6pTamWJfso=
Message-ID: <bee6166c-f63e-4692-a874-b80b7a6f6dc4@arm.com>
Date: Thu, 4 Jun 2026 11:24:05 +0100
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
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2026 10:21, Sudeep Holla wrote:
> On Wed, May 27, 2026 at 03:32:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
>> platform device. Like arm-smccc-trng, this device is not an independent
>> platform resource; it is a software representation of the RSI firmware
>> service discovered through SMCCC.
>>
>> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
>> is SMC and the RSI ABI version check succeeds, create an arm-rsi-dev SMCCC
>> device. Convert the Arm CCA guest TSM provider to an SMCCC driver so it
>> binds to that discovered RSI service and keeps module autoloading through
>> the SMCCC device id table.
>>
>> Keep the old arm-cca-dev platform-device registration for now. Userspace
>> has used that device as a Realm-guest indicator, so removing it is left to
>> a follow-up patch that adds a replacement sysfs ABI.
>>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   arch/arm64/include/asm/rsi.h                  |  2 +-
>>   arch/arm64/kernel/rsi.c                       |  2 +-
>>   drivers/firmware/smccc/Makefile               |  4 ++
>>   drivers/firmware/smccc/rmm.c                  | 25 ++++++++
>>   drivers/firmware/smccc/rmm.h                  | 17 ++++++
>>   drivers/firmware/smccc/smccc.c                |  8 +++
>>   drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>>   drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>>   .../{arm-cca-guest.c => arm-cca.c}            | 60 +++++++++----------
>>   9 files changed, 89 insertions(+), 32 deletions(-)
>>   create mode 100644 drivers/firmware/smccc/rmm.c
>>   create mode 100644 drivers/firmware/smccc/rmm.h
>>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
>>
>> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
>> index 88b50d660e85..2d2d363aaaee 100644
>> --- a/arch/arm64/include/asm/rsi.h
>> +++ b/arch/arm64/include/asm/rsi.h
>> @@ -10,7 +10,7 @@
>>   #include <linux/jump_label.h>
>>   #include <asm/rsi_cmds.h>
>>   
>> -#define RSI_PDEV_NAME "arm-cca-dev"
>> +#define RSI_DEV_NAME "arm-rsi-dev"
>>   
>>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>>   
>> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
>> index 92160f2e57ff..da440f71bb64 100644
>> --- a/arch/arm64/kernel/rsi.c
>> +++ b/arch/arm64/kernel/rsi.c
>> @@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
>>   }
>>   
>>   static struct platform_device rsi_dev = {
>> -	.name = RSI_PDEV_NAME,
>> +	.name = "arm-cca-dev",
>>   	.id = PLATFORM_DEVID_NONE
>>   };
>>   
>> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
>> index 40d19144a860..33c850aaff4d 100644
>> --- a/drivers/firmware/smccc/Makefile
>> +++ b/drivers/firmware/smccc/Makefile
>> @@ -2,3 +2,7 @@
>>   #
>>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
>> +
>> +ifeq ($(CONFIG_HAVE_ARM_SMCCC_DISCOVERY),y)
>> +obj-$(CONFIG_ARM64) += rmm.o
>> +endif
>> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
>> new file mode 100644
>> index 000000000000..d572f47e955c
>> --- /dev/null
>> +++ b/drivers/firmware/smccc/rmm.c
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Arm Limited
>> + */
>> +
>> +#include <linux/arm-smccc-bus.h>
>> +#include <linux/err.h>
>> +#include <linux/printk.h>
>> +
>> +#include "rmm.h"
>> +
>> +void __init register_rsi_device(void)
>> +{
>> +	unsigned long ret;
>> +
>> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>> +		return;
>> +
>> +	ret = rsi_request_version(RSI_ABI_VERSION, NULL, NULL);
>> +	if (ret != RSI_SUCCESS)
>> +		return;
>> +
>> +	if (IS_ERR(arm_smccc_device_register(RSI_DEV_NAME)))
>> +		pr_err("%s: could not register device\n", RSI_DEV_NAME);
>> +}
> 
> OK, I had something else in my mind when I started looking at 1/4. I didn't
> expect each device added on this bus comes up with it's own way to enumerate
> it. IMO, it defeats the purpose of building the smccc bus. We may find the
> specs for each feature deviated a bit but we can have a generic probe
> IMO, let's try that before exploring per feature probe function.

I guess this is ideal, but see below.

> 
> I have a brief sketch of what I think we should aim for(uncompiled/untested)
> below. Let me know if that makes sense. I just based it on your bus code.
> 
> Regards,
> Sudeep
> 
> -->8
> 
> diff --git c/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> index 695c920a8087..450605ddfab6 100644
> --- c/drivers/firmware/smccc/smccc.c
> +++ w/drivers/firmware/smccc/smccc.c
> @@ -9,21 +9,58 @@
>   #include <linux/init.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/kernel.h>
> -#include <linux/platform_device.h>
>   #include <linux/arm-smccc-bus.h>
>   #include <linux/idr.h>
>   #include <linux/slab.h>
> 
> -#include <asm/archrandom.h>
> -
>   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>   static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>   static DEFINE_IDA(arm_smccc_bus_id);
> 
> -bool __ro_after_init smccc_trng_available = false;
> +struct smccc_device_info {
> +       u32 func_id;
> +       bool requires_smc;
> +       unsigned long min_return;

Is this viable for all ? There may be additional restrictions around
the return values and further SMC calls ? Which brings us to call backs
and we kind of have a variant of that here.

Suzuki


> +       const char *device_name;
> +};
> +
> +bool __ro_after_init smccc_trng_available;
>   s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
>   s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
> 
> +static const struct smccc_device_info smccc_devices[] __initconst = {
> +       {
> +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> +               .requires_smc   = false,
> +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> +               .device_name    = "arm-smccc-trng",
> +       },
> +};
> +
> +static bool __init
> +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long ret;
> +
> +       if (!IS_ENABLED(CONFIG_ARM64))
> +               return false;
> +
> +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +               return false;
> +
> +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +               return false;
> +
> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +       ret = res.a0;
> +
> +       if ((s32)ret < 0)
> +               return false;
> +
> +       return ret >= smccc_dev->min_return;
> +}
> +
>   void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>   {
>          struct arm_smccc_res res;
> @@ -31,7 +68,7 @@ void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>          smccc_version = version;
>          smccc_conduit = conduit;
> 
> -       smccc_trng_available = smccc_probe_trng();
> +       smccc_trng_available = smccc_probe_smccc_device(&smccc_devices[0]);
> 
>          if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&
>              (smccc_conduit != SMCCC_CONDUIT_NONE)) {
> @@ -241,14 +278,20 @@ subsys_initcall(arm_smccc_bus_init);
> 
>   static int __init smccc_devices_init(void)
>   {
> -       struct platform_device *pdev;
> -
> -       if (smccc_trng_available) {
> -               pdev = platform_device_register_simple("smccc_trng", -1,
> -                                                      NULL, 0);
> -               if (IS_ERR(pdev))
> -                       pr_err("smccc_trng: could not register device: %ld\n",
> -                              PTR_ERR(pdev));
> +       const struct smccc_device_info *smccc_dev;
> +       struct arm_smccc_device *sdev;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +               smccc_dev = &smccc_devices[i];
> +
> +               if (!smccc_probe_smccc_device(smccc_dev))
> +                       continue;
> +
> +               sdev = arm_smccc_device_register(smccc_dev->device_name);
> +               if (IS_ERR(sdev))
> +                       pr_err("%s: could not register device: %ld\n",
> +                              smccc_dev->device_name, PTR_ERR(sdev));
>          }
> 
>          return 0;
> 

