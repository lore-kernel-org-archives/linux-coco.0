Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1397402424
	for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536514; cv=none; b=FXzCovLOazxfO8qsfKod0JdjLuqUhN1r/Ir2e6zC6JFxpP8+cmEB6tQ2F2FOKdcDwK8JE2VIMWr4VrcYJutGionpXel8hBxFte0Qyg0GnwjN4XHzGTK9VuV1LTcx4DpQatPUYBif/6ueReiKLWIrw65xUx+l80TeY4gKWZm/Oik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536514; c=relaxed/simple;
	bh=UMds3JWYoP4xBh9/MVtO7qrCiFXS+QTbkrgDexGU2lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fh2/YAFgVHfymimqOw86f17FzHxZ2Cj/7H0Hnk2Lk1kDBz0JJRNgR3rqZcSndtopi6ZhIPylsL2559NPtDIeuB7TP+xKwkQ3+tNW1t2c4BqExehhmI2HJMpG09mkTK9BQHNvlOU4bZiFW02AB/Ox3iX0Oc5dYw++b8745m5YarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=otpBswBz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="otpBswBz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45EFB153B;
	Mon, 15 Jun 2026 08:15:07 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29AF3F915;
	Mon, 15 Jun 2026 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781536512; bh=UMds3JWYoP4xBh9/MVtO7qrCiFXS+QTbkrgDexGU2lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=otpBswBzH9O7Ge221RiwYL1pM+rZbDK1y6azYqw6h/bfL58KOx+j5GhPusqfeqrgC
	 UW3MkAsQHlw4FZBw4bjAvMvuRdKOTkhsNG7PPl+O6yGp9qZj7WS6SQVRvcaqZK/La/
	 Sbw1ivz4uRfRhzBUiuEVfMtdssP8SEffMnIrSs+A=
Message-ID: <56c6c2c7-c270-4864-a26b-a7de8428acec@arm.com>
Date: Mon, 15 Jun 2026 17:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-3-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260611130429.295516-3-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aneesh,

thanks for doing this, we have thought about this for quite a while, but 
no one dared to just bite the bullet...

On 6/11/26 15:04, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/include/asm/archrandom.h     |  2 +-
>   drivers/char/hw_random/arm_smccc_trng.c | 32 +++++++++-----
>   drivers/firmware/smccc/smccc.c          | 58 +++++++++++++++++++++----
>   3 files changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f95..7605dd81bd1e 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -12,7 +12,7 @@
>   
>   extern bool smccc_trng_available;
>   
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>   {
>   	struct arm_smccc_res res;
>   
> diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
> index dcb8e7f37f25..8f7f9d830cf2 100644
> --- a/drivers/char/hw_random/arm_smccc_trng.c
> +++ b/drivers/char/hw_random/arm_smccc_trng.c
> @@ -16,8 +16,10 @@
>   #include <linux/device.h>
>   #include <linux/hw_random.h>
>   #include <linux/module.h>
> -#include <linux/platform_device.h>
>   #include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +
> +#include <asm/archrandom.h>
>   
>   #ifdef CONFIG_ARM64
>   #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>   	return copied;
>   }
>   
> -static int smccc_trng_probe(struct platform_device *pdev)
> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>   {
>   	struct hwrng *trng;
>   
> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
> +	/* validate the minimum version requirement */
> +	if (!smccc_probe_trng())
> +		return -ENODEV;
> +
> +	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
>   	if (!trng)
>   		return -ENOMEM;
>   
>   	trng->name = "smccc_trng";
>   	trng->read = smccc_trng_read;
>   
> -	return devm_hwrng_register(&pdev->dev, trng);
> +	return devm_hwrng_register(&sdev->dev, trng);
>   }
>   
> -static struct platform_driver smccc_trng_driver = {
> -	.driver = {
> -		.name		= "smccc_trng",
> -	},
> -	.probe		= smccc_trng_probe,
> +static const struct arm_smccc_device_id smccc_trng_id_table[] = {
> +	{ .name = "arm-smccc-trng" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
> +
> +static struct arm_smccc_driver smccc_trng_driver = {
> +	.name	  = KBUILD_MODNAME,
> +	.probe	  = smccc_trng_probe,
> +	.id_table = smccc_trng_id_table,
>   };
> -module_platform_driver(smccc_trng_driver);
> +module_arm_smccc_driver(smccc_trng_driver);
>   
> -MODULE_ALIAS("platform:smccc_trng");
>   MODULE_AUTHOR("Andre Przywara");
>   MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..a47696f3a5de 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -9,7 +9,8 @@
>   #include <linux/init.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/arm-smccc-bus.h>
> +
>   #include <asm/archrandom.h>
>   
>   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> @@ -81,16 +82,55 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>   }
>   EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
>   
> +struct smccc_device_info {
> +	u32 func_id;
> +	bool requires_smc;
> +	const char *device_name;
> +};
> +
> +static const struct smccc_device_info smccc_devices[] __initconst = {
> +	{
> +		.func_id        = ARM_SMCCC_TRNG_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-trng",
> +	},
> +};
> +
> +static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +	unsigned long ret;
> +	struct arm_smccc_res res;
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +	ret = res.a0;

Mostly a nit:
Why the assignment to a variable of the same type here? Wouldn't it be 
cleaner to let "ret" be an "int"? Then you can save the cast below.
Or drop the assignment, and just cast res.a0 below directly.

In any case, I tested this in a KVM guest, and it worked flawlessly: the 
device is created, works, and sysfs looks good, both with this file 
compiled in (=y), and also as a module. Module autoloading also seems to 
work.
So that's:

Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre.


> +
> +	if ((s32)ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>   static int __init smccc_devices_init(void)
>   {
> -	struct platform_device *pdev;
> -
> -	if (smccc_trng_available) {
> -		pdev = platform_device_register_simple("smccc_trng", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev))
> -			pr_err("smccc_trng: could not register device: %ld\n",
> -			       PTR_ERR(pdev));
> +	struct arm_smccc_device *sdev;
> +	const struct smccc_device_info *smccc_dev;
> +
> +	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +		smccc_dev = &smccc_devices[i];
> +
> +		if (!smccc_probe_smccc_device(smccc_dev))
> +			continue;
> +
> +		sdev = arm_smccc_device_register(smccc_dev->device_name);
> +		if (IS_ERR(sdev))
> +			pr_err("%s: could not register device: %ld\n",
> +			       smccc_dev->device_name, PTR_ERR(sdev));
>   	}
>   
>   	return 0;

