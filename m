Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA934457D6
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928140; cv=none; b=o27XaoUbIEr6CwgmZqkVWFU0sdOfFKkm7fSCF6dz7oVYASH/NucBT5euROqV8TRwpMcPvZF6yR9EUVt3aadYvcoTEuClx8AutZaP6QdvWbE9n3QWNzTuWKHwxJICzaitXzpgO2f6Yy2C7oakhJFSzDzaW8ewfqMYGjKsmjOos8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928140; c=relaxed/simple;
	bh=P0OxvIlwXFlZKXBox4D35AqZ0d9zqjfnL5KrlHp7kic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrL4E1eF9jZkYE3T3vpOO1wn7L2AJbIsknBaRv3r4poRHv8vlDOcl9eONJaAH7S5hh+lNDCtqqFMc73wKi/L2jWmfhgqzRsQeBsqoHPOA11Ztrive7vbkD/20UhMktk2ByRXosQi6jew3N/zrbTmz87gbyVDXiILHVD1u9K3PoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jQGO5bCu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jQGO5bCu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8E51153B;
	Wed,  5 Aug 2026 04:08:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44DB33F66F;
	Wed,  5 Aug 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785928137; bh=P0OxvIlwXFlZKXBox4D35AqZ0d9zqjfnL5KrlHp7kic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQGO5bCukJRjemEPQY1lNv08XVTF38bNT8w947ighphTBvgGEObggRCSeMnX7qdp6
	 CgoylbVXuQayeom/12yTTDXLAptVZcj/O8/FFBDMGgYyPHQF3Sg8EDXQuFua88fp8Q
	 4yUX5/7EqEe4nfjwmaaLBf86zf4RccGzuG7PoLrM=
Date: Wed, 5 Aug 2026 12:08:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Olivia Mackall <olivia@selenic.com>
Subject: Re: [PATCH v9 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <anMZre8CV6dc8do4@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-3-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063255.1638614-3-aneesh.kumar@kernel.org>

+ Herbert, Olivia for the drivers/char/hw_random/ changes

On Wed, Aug 05, 2026 at 12:02:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
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

This looks fine to me, autoload still works unless we mismatch old
modules with newer kernel. It's on the 'arm_smccc' bus rather than
'platform'.

> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm/include/asm/archrandom.h       |  2 +-
>  arch/arm64/include/asm/archrandom.h     |  2 +-
>  drivers/char/hw_random/arm_smccc_trng.c | 32 +++++++++-----
>  drivers/firmware/smccc/smccc.c          | 58 +++++++++++++++++++++----
>  4 files changed, 72 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
> index cc4714eb1a75..ee39a03ddf8a 100644
> --- a/arch/arm/include/asm/archrandom.h
> +++ b/arch/arm/include/asm/archrandom.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_ARCHRANDOM_H
>  #define _ASM_ARCHRANDOM_H
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	return false;
>  }
> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f95..7605dd81bd1e 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -12,7 +12,7 @@
>  
>  extern bool smccc_trng_available;
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	struct arm_smccc_res res;
>  
> diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
> index dcb8e7f37f25..8f7f9d830cf2 100644
> --- a/drivers/char/hw_random/arm_smccc_trng.c
> +++ b/drivers/char/hw_random/arm_smccc_trng.c
> @@ -16,8 +16,10 @@
>  #include <linux/device.h>
>  #include <linux/hw_random.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +
> +#include <asm/archrandom.h>
>  
>  #ifdef CONFIG_ARM64
>  #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>  	return copied;
>  }
>  
> -static int smccc_trng_probe(struct platform_device *pdev)
> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>  {
>  	struct hwrng *trng;
>  
> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
> +	/* validate the minimum version requirement */
> +	if (!smccc_probe_trng())
> +		return -ENODEV;
> +
> +	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
>  	if (!trng)
>  		return -ENOMEM;
>  
>  	trng->name = "smccc_trng";
>  	trng->read = smccc_trng_read;
>  
> -	return devm_hwrng_register(&pdev->dev, trng);
> +	return devm_hwrng_register(&sdev->dev, trng);
>  }
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
>  };
> -module_platform_driver(smccc_trng_driver);
> +module_arm_smccc_driver(smccc_trng_driver);
>  
> -MODULE_ALIAS("platform:smccc_trng");
>  MODULE_AUTHOR("Andre Przywara");
>  MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..092bdbac26f2 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -9,7 +9,8 @@
>  #include <linux/init.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/arm-smccc-bus.h>
> +
>  #include <asm/archrandom.h>
>  
>  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> @@ -81,16 +82,55 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>  }
>  EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
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
> +	int ret;
> +	struct arm_smccc_res res = {};
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +	ret = res.a0;
> +
> +	if (ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __init smccc_devices_init(void)
>  {
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
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
