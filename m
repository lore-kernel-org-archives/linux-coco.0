Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E1E358367;
	Thu,  4 Jun 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564904; cv=none; b=sWBrnRoy/upyKDPUAvT4zDZqLuCXKLWQGLdEkFdCnmTAAxSSzysA4+RHkZZ8PnZ74F45xQZ6onug7g2ZR57bYn+5M/LQ0nAuVLC3srqTg1uf1e2FIsdMCquuEkkZAp0BOa1WTDFsQ6iy494LXvLPAcZwZ0V/HXuBiOXL3dLdmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564904; c=relaxed/simple;
	bh=qkGSUKomIDUyq068lOrtMwKHtnhBX043F/VSZzyuviQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvSX2Fbfhz2JRg3TnzifFPzIcHQoj9uEVy3GVxe9ceIb69Gd0TULgTl0XnA/ZgJwLIVFXEhLWKUrdPpMTEsaeyKtRO6dRGxxyzpEkdp1MOlNZvHLRXO4STqLkmck3x0TTfJlpDxzHhlYfKRHJiCDlqijCZSk5OdKAzSy1Nlp8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDqaXv36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDqaXv36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2671F00893;
	Thu,  4 Jun 2026 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564903;
	bh=dNw5Co3y7LwscFZy6jowrPYsDHekQNpDvhOzWqn0niM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bDqaXv36KnS5AV0w0eWLKbEYl0jPQLNRWk3ANk06cZD/3wZLUXGeq4zTcLZQMJRdb
	 FS8tc44udOeGXserCpp8tU5QPiusNcQVST4LHuaLhOuxbovXcO6PTvVGnmHrDxx6qf
	 6Nkj1G2as9PpZeiyo+IQauWFDIkGa+RpYdqAEjYHQANT3NJ4+ndRwJizycHChk1nAZ
	 8e3TsMXYucFWbV4pohkLgwg8O1PmPrD4j+BSZhSqJG2ubRiHDObGPfQJVVlesnPI+4
	 kxwWeekwUjjdF/v/1nUCfdxNQK8JarBO6MjZ9QDvKHp/SNybxXl3eWWoCAKQL/xaDA
	 EipozfzWduRSA==
Date: Thu, 4 Jun 2026 10:21:38 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527100233.428018-4-aneesh.kumar@kernel.org>

On Wed, May 27, 2026 at 03:32:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and the RSI ABI version check succeeds, create an arm-rsi-dev SMCCC
> device. Convert the Arm CCA guest TSM provider to an SMCCC driver so it
> binds to that discovered RSI service and keeps module autoloading through
> the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/include/asm/rsi.h                  |  2 +-
>  arch/arm64/kernel/rsi.c                       |  2 +-
>  drivers/firmware/smccc/Makefile               |  4 ++
>  drivers/firmware/smccc/rmm.c                  | 25 ++++++++
>  drivers/firmware/smccc/rmm.h                  | 17 ++++++
>  drivers/firmware/smccc/smccc.c                |  8 +++
>  drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>  drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>  .../{arm-cca-guest.c => arm-cca.c}            | 60 +++++++++----------
>  9 files changed, 89 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/firmware/smccc/rmm.c
>  create mode 100644 drivers/firmware/smccc/rmm.h
>  rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
> 
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 88b50d660e85..2d2d363aaaee 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -10,7 +10,7 @@
>  #include <linux/jump_label.h>
>  #include <asm/rsi_cmds.h>
>  
> -#define RSI_PDEV_NAME "arm-cca-dev"
> +#define RSI_DEV_NAME "arm-rsi-dev"
>  
>  DECLARE_STATIC_KEY_FALSE(rsi_present);
>  
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 92160f2e57ff..da440f71bb64 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
>  }
>  
>  static struct platform_device rsi_dev = {
> -	.name = RSI_PDEV_NAME,
> +	.name = "arm-cca-dev",
>  	.id = PLATFORM_DEVID_NONE
>  };
>  
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..33c850aaff4d 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,7 @@
>  #
>  obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>  obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +
> +ifeq ($(CONFIG_HAVE_ARM_SMCCC_DISCOVERY),y)
> +obj-$(CONFIG_ARM64) += rmm.o
> +endif
> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
> new file mode 100644
> index 000000000000..d572f47e955c
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/err.h>
> +#include <linux/printk.h>
> +
> +#include "rmm.h"
> +
> +void __init register_rsi_device(void)
> +{
> +	unsigned long ret;
> +
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> +		return;
> +
> +	ret = rsi_request_version(RSI_ABI_VERSION, NULL, NULL);
> +	if (ret != RSI_SUCCESS)
> +		return;
> +
> +	if (IS_ERR(arm_smccc_device_register(RSI_DEV_NAME)))
> +		pr_err("%s: could not register device\n", RSI_DEV_NAME);
> +}

OK, I had something else in my mind when I started looking at 1/4. I didn't
expect each device added on this bus comes up with it's own way to enumerate
it. IMO, it defeats the purpose of building the smccc bus. We may find the
specs for each feature deviated a bit but we can have a generic probe
IMO, let's try that before exploring per feature probe function.

I have a brief sketch of what I think we should aim for(uncompiled/untested)
below. Let me know if that makes sense. I just based it on your bus code.

Regards,
Sudeep

-->8

diff --git c/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
index 695c920a8087..450605ddfab6 100644
--- c/drivers/firmware/smccc/smccc.c
+++ w/drivers/firmware/smccc/smccc.c
@@ -9,21 +9,58 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/idr.h>
 #include <linux/slab.h>

-#include <asm/archrandom.h>
-
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
 static DEFINE_IDA(arm_smccc_bus_id);

-bool __ro_after_init smccc_trng_available = false;
+struct smccc_device_info {
+       u32 func_id;
+       bool requires_smc;
+       unsigned long min_return;
+       const char *device_name;
+};
+
+bool __ro_after_init smccc_trng_available;
 s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
 s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;

+static const struct smccc_device_info smccc_devices[] __initconst = {
+       {
+               .func_id        = ARM_SMCCC_TRNG_VERSION,
+               .requires_smc   = false,
+               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
+               .device_name    = "arm-smccc-trng",
+       },
+};
+
+static bool __init
+smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
+{
+       struct arm_smccc_res res;
+       unsigned long ret;
+
+       if (!IS_ENABLED(CONFIG_ARM64))
+               return false;
+
+       if (smccc_conduit == SMCCC_CONDUIT_NONE)
+               return false;
+
+       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
+               return false;
+
+       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
+       ret = res.a0;
+
+       if ((s32)ret < 0)
+               return false;
+
+       return ret >= smccc_dev->min_return;
+}
+
 void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
 {
        struct arm_smccc_res res;
@@ -31,7 +68,7 @@ void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
        smccc_version = version;
        smccc_conduit = conduit;

-       smccc_trng_available = smccc_probe_trng();
+       smccc_trng_available = smccc_probe_smccc_device(&smccc_devices[0]);

        if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&
            (smccc_conduit != SMCCC_CONDUIT_NONE)) {
@@ -241,14 +278,20 @@ subsys_initcall(arm_smccc_bus_init);

 static int __init smccc_devices_init(void)
 {
-       struct platform_device *pdev;
-
-       if (smccc_trng_available) {
-               pdev = platform_device_register_simple("smccc_trng", -1,
-                                                      NULL, 0);
-               if (IS_ERR(pdev))
-                       pr_err("smccc_trng: could not register device: %ld\n",
-                              PTR_ERR(pdev));
+       const struct smccc_device_info *smccc_dev;
+       struct arm_smccc_device *sdev;
+       int i;
+
+       for (i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
+               smccc_dev = &smccc_devices[i];
+
+               if (!smccc_probe_smccc_device(smccc_dev))
+                       continue;
+
+               sdev = arm_smccc_device_register(smccc_dev->device_name);
+               if (IS_ERR(sdev))
+                       pr_err("%s: could not register device: %ld\n",
+                              smccc_dev->device_name, PTR_ERR(sdev));
        }

        return 0;

