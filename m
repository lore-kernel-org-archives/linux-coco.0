Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869F18BC3D
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294455; cv=none; b=twRm9JvgBG6FAPf/7AswtHefAxCASeZ3lP4OQbOMaZxoIGHXLKoKH0p0TAZEyF/EUvSXRYk/t+12LLKwxGlvelWlpYg2RcaKU7qQ5QZ59S+9Fo/i7vrmsWZOJvm75pY2eU2fHgLypssbn9Xqo/GfHsbb+VOPbyfBZvh7DG4W0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294455; c=relaxed/simple;
	bh=BYqICiGMLgWqpntKQzARpSvKHz0b8tGLohHeOvC50YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cl1FRcf/LlYMIcAncq4X0DHMEOnBtyb4/q/C2kcxtqzN2LZMqMSBpcaEiIZU/m0+NFT/HZUn7/7Z6/d6CUnGw7N51vmUMfpphcHf9a0U0y0zKZ902w3b4zNS5tXkc26NPUYyUYmYJx32ah1F//E2enQfjgSjBuoBHR4e+62gT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RT2lGv/w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RT2lGv/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lumaw4lMD1kTG9v3IY32vA8t/Mv1AVxHna5hqi0XQCc=;
	b=RT2lGv/wXsiyDAKrcDENEEWJ1OFuLm5zuTXhRDureX9ASZ0KmMcDXpsQjEPOh0URs4Hczu
	R53BlSbb1I1Z3M+4z3Yht7DYomxDYfJQUDwsX3tIIvBvY8RTkvCjkSR7f+tM+X67rrhlWv
	c7cd9ogveS+KxafuWVH38tyCHU+8QtI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-nwJXtrGrMpifct73Hprz8g-1; Thu, 24 Sep 2026 20:00:51 -0400
X-MC-Unique: nwJXtrGrMpifct73Hprz8g-1
X-Mimecast-MFC-AGG-ID: nwJXtrGrMpifct73Hprz8g_1790294450
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so4067685ad.1
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294450; x=1790899250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lumaw4lMD1kTG9v3IY32vA8t/Mv1AVxHna5hqi0XQCc=;
        b=xEOBinnmw8H5Nh22oQ4d+dSPbiGhFPiDtOX+Oug5tMALCQphn+9O18jP6lHF2nev6O
         FIablZb9SaV3r8MN4IRqe/6VEdMH+OSGG77XAGARaxu66ZjVjZ++ZBOziyHlAY/qxMdO
         KGBKQyT6fmAfRIs9Wtwwi27C6iV3YSFZOcO10BJmNjKdHYfdjnj1kw6qI2JTE83Hzr7y
         +ba62XD4YyctLIXZmTZ5fDar4QJfZ+0qGuz/ZEWxn5EriLkLyG9aNYrSMarTVlKATxQo
         VBodUS9S9u0IuNxUCoSxpiZvxhMEQXrIInw/y+44nrgZb9jEDX8pNLmgUAXMW6Be4olY
         M2Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzSiQ2DIOpkershD53gAz65ls2gPblYMinFZeCbBGgxK/4ohHHLVCZDiMI22v3DxsDsQ6Hooshp5JcT@lists.linux.dev
X-Gm-Message-State: AFuF++m17aXqutzMn1v59qGHGLcCWaE4vsvVNFVTGGQMD1d5N8vBPlJh
	iWWGlGiK1d/CxQGc4IYS7Ce3dlEeKp4XJqOrBuoOlfcANo9zH0gw42PYyqyfG1FVSbk7vthfWmo
	RmwtD/ON1oS7/ne2GziS9S78AvLq4rBk356bxdpjYWAWiFg2wo1gunE2zIWaQF8w=
X-Gm-Gg: AYBFou3MW3hanAzllfHLlqgMnSJFVyDbC76vRz9/amy9ZOW/bNmLDszMc9ZlfChnJaL
	9cBW/7+u9XyLFOXaSp13u9CsF7+MbfkTKJpiTfNb8+9RVpQE1OT/tWWiYeTAEOqPmJWAhwKErQ7
	Au/QKXQbkJbQTSzn8xFAiQZv/P2dSm5kwM8+A6EPL9YVvlYawBBlr3rEs5gxRCfu8NdFvCrgkcM
	T/6kGD67f0BfUzQpn5pKKymSVaFUvTnOTO9PYTy60U4CO/li9k9XbpuY8LD20+WS7z/7GA4LPMK
	vltkxahYAaX/QS9vB9XyT95pOBmYlPz8R4YUBWse/5/SR2VKkhqCSaEpEvjdZ1z31vrfPo67vBO
	pq1Mdy5H9Gxk9fjx63r1wBJSEuj9rbreeiAz6lJmk8A==
X-Received: by 2002:a17:903:1b6b:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2df94964b02mr3973115ad.14.1790294449524;
        Thu, 24 Sep 2026 17:00:49 -0700 (PDT)
X-Received: by 2002:a17:903:1b6b:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2df94964b02mr3972225ad.14.1790294448725;
        Thu, 24 Sep 2026 17:00:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ff040sm2112955ad.32.2026.09.24.17.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:00:42 -0700 (PDT)
Message-ID: <1ffe72ff-f20b-4621-a586-10e0358fee67@redhat.com>
Date: Fri, 25 Sep 2026 10:00:33 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MUYbjN_fIhMcj7RQiwFwDyUgZraZHUWgJsDcfIn7YEY_1790294450
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v19:
>   * Read all implemented RmiFeatureRegisters - 5
>   * Use ARRAY_SIZE(rmi_feat_reg_cache) for the loop in rmi_read_features()
>   * Fold rmi_features() into rmi_read_features
>   * Fix comment for rmi_smccc_invoke()
>   * Drop default y
>   * Add retry for RMI_BLOCKED and return to caller
> v18:
>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>     parameters are 0 - Sashiko
>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>     support, which is also in progress
> v16:
>   * Update Kconfig text to include PCIe TDISP.
>   * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>   * The code is moved again, this time into the 'firmware' directory.
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   2 +
>   drivers/firmware/arm_rmm/rmi.c    | 109 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   8 files changed, 188 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

Some nitpicks below, with them addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440..ff9565d3ffa59 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -38,6 +38,7 @@ config ARM64
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_MEM_ENCRYPT
>   	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> +	select ARCH_SUPPORTS_RMM
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>   	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa7..e8b29983b0021 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -293,6 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
>   static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_DIT_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_AMU_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_MPAM_SHIFT, 4, 0),
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b7cc11e4fbfa6..62660bf520a8d 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -310,5 +310,6 @@ source "drivers/firmware/samsung/Kconfig"
>   source "drivers/firmware/smccc/Kconfig"
>   source "drivers/firmware/tegra/Kconfig"
>   source "drivers/firmware/xilinx/Kconfig"
> +source "drivers/firmware/arm_rmm/Kconfig"
>   
>   endmenu
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index be46f1e1dc77f..196a650ccf025 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -39,3 +39,4 @@ obj-y				+= samsung/
>   obj-y				+= smccc/
>   obj-y				+= tegra/
>   obj-y				+= xilinx/
> +obj-y				+= arm_rmm/
> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
> new file mode 100644
> index 0000000000000..a37cba6647360
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Kconfig
> @@ -0,0 +1,25 @@
> +
> +config ARCH_SUPPORTS_RMM
> +	bool
> +
> +config ARM_RMM_RMI
> +	bool "Realm Management Interface (RMI) Support"
> +	depends on ARCH_SUPPORTS_RMM
> +	help
> +	  Support the Realm Management Monitor (RMM) on Arm systems that
> +	  implement the Realm Management Extension (RME), as defined by the
> +	  Arm Confidential Compute Architecture.
> +
> +	  The RMM runs at EL2 in the Realm world and provides the Realm
> +	  Management Interface (RMI) used by a Normal World host to create,
> +	  manage and run protected virtual machines called Realms. The RMM can
> +	  also act as a TSM, as defined by the PCIe TDISP and can manage the
> +	  PCI IDE setup for securing the PCIe links.
> +
> +	  This option builds the host-side RMI support used by KVM to detect a
> +	  compatible RMM, configure it, manage delegated memory and enable
> +	  Realm guests.
> +
> +	  Selecting this option does not by itself make Realm guests available:
> +	  the system must also provide RME-capable hardware and firmware with a
> +	  compatible RMM implementation.
> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 0000000000000..65171988fdcae
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RMI)	= rmi.o
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> new file mode 100644
> index 0000000000000..3baba931f92e4
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/cpufeature.h>
> +#include <linux/memblock.h>
> +#include <linux/arm-rmi-cmds.h>
> +#include <linux/slab.h>
> +
> +#include <asm/memory.h>
> +#include <asm/pgtable-hwdef.h>
> +
> +/* RMM defines RmiFeatureRegister0 to RmiFeatureRegister5. */
> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
> +

Based on the latest RMM implementation, the highest feature register
index is RMI_FEATURE_REGISTER_4_INDEX. So RmiFeatureRegister5 is out of
the range and the correct comments would be: 'RMM defines RmiFeatureRegister0
to RmiFeatureRegister4', or we could simplify this to:

/* RMM defines 5 feature registers */

> +static int rmi_check_version(void)
> +{
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +	unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +	struct arm_smccc_1_2_regs res = {
> +		SMC_RMI_VERSION, host_version,
> +	};
> +
> +	/* If RME isn't supported, then RMI can't be */
> +	if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
> +		return -ENXIO;
> +
> +	rmi_smccc_invoke(&res);
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return -ENXIO;
> +
> +	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
> +	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
> +
> +	if (res.a0 != RMI_SUCCESS) {
> +		unsigned short high_version_major, high_version_minor;
> +
> +		high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
> +		high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
> +
> +		pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
> +		       version_major, version_minor,
> +		       high_version_major, high_version_minor,
> +		       RMI_ABI_MAJOR_VERSION,
> +		       RMI_ABI_MINOR_VERSION);
> +		return -ENXIO;
> +	}
> +
> +	pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
> +
> +	return 0;
> +}
> +
> +static int rmi_read_features(void)
> +{
> +	/*
> +	 * Since we've negotiated a compatible version these feature registers
> +	 * should always be available
> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(rmi_feat_reg_cache); i++) {
> +		struct arm_smccc_1_2_regs args = {
> +			SMC_RMI_FEATURES, i,
> +		};
> +
> +		rmi_smccc_invoke(&args);
> +		if (WARN_ON(args.a0 != RMI_SUCCESS))
> +			return -EINVAL;
> +
> +		rmi_feat_reg_cache[i] = args.a1;
> +	}
> +
> +	return 0;
> +}
> +
> +unsigned long rmi_feat_reg(unsigned long index)
> +{
> +	if (WARN_ON(index >= ARRAY_SIZE(rmi_feat_reg_cache)))
> +		return 0;
> +
> +	return rmi_feat_reg_cache[index];
> +}
> +EXPORT_SYMBOL_GPL(rmi_feat_reg);
> +

I guess "unsigned int index" is sufficient for the space as we shouldn't
have that much feature registers :)

> +
> +static int __init arm64_init_rmi(void)
> +{
> +	int ret;
> +
> +	/* If we can't agree on the RMI ABI version, don't proceed further */
> +	ret = rmi_check_version();
> +	if (ret)
> +		return ret;
> +
> +	ret = rmi_read_features();
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/*
> + * Note arm64_init_rmi() must be called before kvm_init_rmi() otherwise KVM
> + * will not support realm guests. subsys_initcall() is called before
> + * module_init() (used for KVM) so this is OK.
> + */
> +subsys_initcall(arm64_init_rmi);
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> new file mode 100644
> index 0000000000000..5c6c563c81555
> --- /dev/null
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#ifndef __LINUX_ARM_RMI_CMDS_H_
> +#define __LINUX_ARM_RMI_CMDS_H_
> +
> +#include <linux/arm-smccc-rmi.h>
> +#include <linux/bug.h>
> +#include <linux/processor.h>
> +#include <linux/types.h>
> +
> +#define RMM_BLOCKED_RETRY_COUNT		2
> +/*
> + * rmi_smccc_invoke: Invoke the RMI call and return the results, retrying the
> + * command when status is RMI_BUSY. If we encounter RMI_BLOCKED, we retry
> + * it one more time before we give up. The caller is supposed to handle the
> + * result and reissue if required.
> + *
> + * We don't expect to see RMI_BLOCKED on a practical system, except when
> + * there are parallel requests that results in long standing operation,
> + * with one blocking the other.
> + *
> + * @regs: Input parameters filled in. Updated with the ouptput results
> + * after the call.
> + */
> +static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +	long status;
> +	int i = 0;
> +
> +	while (i < RMM_BLOCKED_RETRY_COUNT) {
> +		arm_smccc_1_2_invoke(&args, regs);
> +
> +		status = RMI_RESULT_STATUS(regs->a0);
> +		if (status != RMI_BUSY && status != RMI_BLOCKED)
> +			break;
> +		if (status == RMI_BLOCKED)
> +			i++;
> +		cpu_relax();
> +	}
> +}
> +
> +unsigned long rmi_feat_reg(unsigned long index);
> +
> +#endif

As spotted in the previous comments:

#endif /* __LINUX_ARM_RMI_CMDS_H_ */

Thanks,
Gavin

