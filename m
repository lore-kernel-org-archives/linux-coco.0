Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D2747126B
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863626; cv=none; b=FbG6hQMET6ab+OeIwSvL4KcZxW7QVEiFgJ7rtlYDL43RCEhQur/z4ERkjk8TVafgOfLRrnSYNi6Gv0WKq0msHA88Ugsd90DTGBmWMc889Vqx9UNDM36PC8NAAYZhExMSgSv0btghQ5yPUjamqYjTOqXhVIALmnDLQ8BhSQbrDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863626; c=relaxed/simple;
	bh=OrGS45tssdwz0Wu7L2zQYru/yP7pd41ssjIeJd+6cHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKumACgaVu79ffCPhtJQ8BbKMB5U/VGnyeJdByzv+zkksyL0FIPC5Fck2rtIWrGN8Fji/HITT64qVnqTikq1eS/hdocgutkbjzaD9dq1FrvuOmPYTgKhdH13huzMuQOtVaxgddGA5/2OhyMYnHC8kyEA0gnXoGmOgPNhvWcVI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aScfSouS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aScfSouS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791863623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUqyt0vezPpSgZq+1/oWOilSNokxX7sjQOB+0OZMeo0=;
	b=aScfSouSD7rQYmbp3Zs+GGyXXzueZ2kfrlhB6NxYGeQlScLdU68jv0vc6EI3eiPHxPo0gY
	elXMQZMHT01DUnAqIwmt8n294l7Wk5jKQuaF2NM4r1Voz2auV84doGgUraYJpSH4g0CLya
	aWoy1lVuLQ55EnoVY3swgElCr3dTwlQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-gLeeapSpOxi_afxTSkQavQ-1; Tue, 13 Oct 2026 03:53:36 +0000
X-MC-Unique: gLeeapSpOxi_afxTSkQavQ-1
X-Mimecast-MFC-AGG-ID: gLeeapSpOxi_afxTSkQavQ_1791863615
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso3133286a91.1
        for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 20:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863615; x=1792468415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUqyt0vezPpSgZq+1/oWOilSNokxX7sjQOB+0OZMeo0=;
        b=AZGEKyci+tb8+AJLhXawFt8g/gzCrfAaJel32wUwHiBjf78Zw/nGVQ6RGcNCjlQpJ9
         NXPz0B18n6YJauJ1U1MpXAHDMWG4CVrxFKrWEcnV+Wl6+QR4sY9m6CMOcJ5Dgzd6DZvo
         NoFXY8g29ofQP9ULmfgBjy/pLj32OkDaO3Wl33FUuQlse2sNj1NB0gWAFmOBfD2xeaMw
         YDfWlk+HuxWEOINIry9fv1UWRzIQIgIBbJLZuY2GQDIL17xCwombOUK/aW2gT52Axvf5
         551+HZNwcZT+NB950YCPRBzm604LMWr8wGjgD4zm/lNx899zDzgDyErPwslIBK09fLcF
         eh8g==
X-Forwarded-Encrypted: i=1; AKwUvByAzWh5w8j96+MV5GZMyoIe//66oRc6TmDV6q0UH3+LSyVEqPioedcEE4KowkG9ft56cOy3+TerMgCB@lists.linux.dev
X-Gm-Message-State: AFq9FYK8whR5k34bnHMeBU4TfXpHJYbY8Ahm+XgfbiLM1SVC3iSRK/ai
	v6nnKA+gluDcf5SXmrYz+HTHmhmDVWloAGJCP5g5iWYrYF+St5ejT3dDhU9tTsZTe9i5N8olkkk
	knQKnFBlj3/iAPkoLUKE9Mq8PJqXsVt9LSPx3Qfhxl8u00cQwGCae9EbJq4uYHfw=
X-Gm-Gg: AYBFou3TUYq9ZzHD3AFBLurggFcYIWdciDfU2s27OCTXwVRFi4ZKf2lnP/CaqbckCHX
	i0WX29AWAZagEILMoPL+ZQiDwAAa1LmS2M2y4T10UNddEMiR3UwJI0cQMwdOGhkmSr7SRk5BWNI
	4pJThWjbZLElzasIQnD3fLZJrb89Nf979NQx/MSTJa6nxJbz2gBRt/dvuDJqXjC4oV6WIcd7n5S
	AuXJNa4UGdN43Z378Elxw6nH33iAUnfrKTAKVO8yfjXVX58+AyLcgdv2SKmdqOhU+Lf1Kaxt11L
	+TgJd5S25PMOLndOdCy6EnGNm+NOpdFn1voA36wLf1KfTK2TgWYtEXLLdVxkeooFcHB/62Es+Gi
	+OgjnKCeFV7+Zknc6hOudMVlNg/zRm6VXJY+CnnBJIA==
X-Received: by 2002:a17:90b:6c5:b0:3ac:450a:f9ac with SMTP id 98e67ed59e1d1-3ac450b4782mr286965a91.64.1791863615077;
        Mon, 12 Oct 2026 20:53:35 -0700 (PDT)
X-Received: by 2002:a17:90b:6c5:b0:3ac:450a:f9ac with SMTP id 98e67ed59e1d1-3ac450b4782mr286938a91.64.1791863614431;
        Mon, 12 Oct 2026 20:53:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm18786368a91.8.2026.10.12.20.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 20:53:33 -0700 (PDT)
Message-ID: <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
Date: Tue, 13 Oct 2026 13:53:24 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
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
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261002061507.1600269-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KPsl506toI3Y4GZ7tja-RBvtqWNQu3QvLV9-nrh5sf0_1791863615
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> All RMM feature registers are read and exposed for future code to
> use. Also restrict the support to SMC conduit.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---

[...]

> ---
>   MAINTAINERS                       |   2 +
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   arch/arm64/kvm/sys_regs.c         |   2 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   1 +
>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   10 files changed, 194 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> new file mode 100644
> index 0000000000000..06f5392c982d2
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/arm-rmi-cmds.h>
> +#include <linux/cpufeature.h>
> +#include <linux/memblock.h>
> +#include <linux/slab.h>
> +
> +#include <asm/memory.h>
> +#include <asm/pgtable-hwdef.h>
> +
> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
> +
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
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> +		return -ENXIO;

I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
is immediately called by rmi_smccc_invoke() after this check.

	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
             arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
		return -ENXIO;

Thanks,
Gavin

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

[...]



