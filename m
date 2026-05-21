Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31992701DC
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 00:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323997; cv=none; b=AwUz2CP/kzrTnphYZTZ7XG9d7uVG0RujxQGtMiLNFl/JcMBtIsd8emlSCp6EqvTV4YeEZLuWq8cnpeTugJxJsXvics0e6sD7hlS9o1IEbLoP3S50zwGqee7ZUfyXtqRgtChQSYOtjl/n/hDTHLvQtlzR482k84hv4vlRSpt7MNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323997; c=relaxed/simple;
	bh=mdHecRRmI+XKM2TkJIkFi/wwIB6XFVf43GosBajpWxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqRE/yw4wTJtBUzR2OuJy1KLQx4f4sMXi52x+k1anmb4GmLR2XJk66JnT0J5//K8w3YYyEmMvmhzmUwdt8AFRG47ev1FHll04LwqO2qVCEiHvM5/IheX/wSz9Wj1bV/LqGyifTRQRqTRa/NXS/Jk/AWrTxyhDwlze3583ngcVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dooUUcBO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dooUUcBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779323993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tV7iZwvmmQQLSqky4R1D09YTKc/1j9bjaXabqWBMECY=;
	b=dooUUcBOWXml/QONGVJHt+XiYFRmRI6dfHoVGr+9FbesaoNM3YXK47A4ifCQ3AZBLNe49X
	lDXdNr2nook/aGdJtsSk0WN1dZiqJurmYC8JRanzudh+cc3V6m3rgXiJu1wIjN7XggH69a
	gyovKZcZQuLscT4DMNpmNoaN2wXNMkk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-9sTJoYmXPjCVWNeVM1EMaA-1; Wed, 20 May 2026 20:39:52 -0400
X-MC-Unique: 9sTJoYmXPjCVWNeVM1EMaA-1
X-Mimecast-MFC-AGG-ID: 9sTJoYmXPjCVWNeVM1EMaA_1779323991
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8397b14a689so3644781b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 17:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323991; x=1779928791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV7iZwvmmQQLSqky4R1D09YTKc/1j9bjaXabqWBMECY=;
        b=D3uL3/IS1XmyIUue2IuAquYgobpjI0Cn+DIsSS5el2RTerGAJiGtQfgg+Czpr7BnS9
         mLuzorrvdlE6Y6ZZd+FhLf+ZXuD4g00lHFQcz7RAB9CzXzXFmJgLRr1NFgN0AgqQvOUd
         aa9s9iGRSEb7xM8u6TtjoYmJgB5BYroRUn0OEj3Osx3erFBr8a5weFQnekQj23/25HH0
         akFIcV5qM+2qAUcFvk/7XEey1+usx2Cs31LH0H8Z5nDcOEGRXU5iTjqD0LIELUP4maup
         SE5OeKhb4PTS9HLE6BEoFOaYFItdzrOhKaajTnRj2Yj+aiRK4uC+pW8JvY1pG/85ypwT
         vuHg==
X-Forwarded-Encrypted: i=1; AFNElJ/TnKj8TILCnr7DoZr0HeGUfMZuicRujz+aVOg0LsWIHk9Y2dpGOitcRZldyNODKdmOYmYiaI/NOULv@lists.linux.dev
X-Gm-Message-State: AOJu0YySk/nFH03HScwXQVZj+mIH3NP/l21e2PPW73t5s634kURupkQ6
	4eMo5K4OFdukGF/IUFeIIs4VElx75YTuoGu1Vi4jpGYRGzPoxs7Pw53FfsCQkqkXeuoXsUgyQm3
	lNGtdDsnzb8tB+n5vV478fVnX8EK0cu5yTuyvQXkx2lyCYG3FHeOu6p8NgDm4M/g=
X-Gm-Gg: Acq92OFN0ErFumMP8X3QyTuUQAnMuGAAgslmHGc1V0Z5PL4hBNmaVqDrg5BdB22nTr9
	hXLeNYTyLIxwpaM6BtZRfNSp33Jc75PZWO602y6teO0pL06NJA3NfjJZIp0WssNbys8BVM5KlcZ
	S5HbcbTxbL5njUy6EPe6uj85Un6f1BIiIGmFZDKsdLhkZAJt5ZSSw18K2tDcUQydSivxgZ6lqTF
	bJmy6QxlrO0ukjfUz9rQqW1+U8AzzPWe60FTii6F6zEazTFMxr0rBIHn7JZhRF8fjPHyIWZJxpK
	twnM5EI0bfN8mBZa3T5vArIVzomFBnscwz5S3TXOlqzddOxpxWHFn2B6g9mil9iGGJlNGmSMj/g
	kT6lC29P9mupIPnFDzIlQMWP5+l7sS7hPZtZiZa89njA6q+u3KMAXmwXfRv/NPJ8w
X-Received: by 2002:a05:6a00:1742:b0:83a:ebec:452f with SMTP id d2e1a72fcca58-8414ae6f985mr687573b3a.42.1779323990973;
        Wed, 20 May 2026 17:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:83a:ebec:452f with SMTP id d2e1a72fcca58-8414ae6f985mr687526b3a.42.1779323990418;
        Wed, 20 May 2026 17:39:50 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663cfdsm27427984b3a.9.2026.05.20.17.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 17:39:49 -0700 (PDT)
Message-ID: <ee494ecd-8979-40f2-896e-82137abbf440@redhat.com>
Date: Thu, 21 May 2026 10:39:39 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/44] arm64: RMI: Check for RMI support at init
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-7-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-7-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TbZTW3MSxwc-iRSvWIjUIx2hEWWS4RiLYWq47TlCzTY_1779323991
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steven,

On 5/13/26 11:17 PM, Steven Price wrote:
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/include/asm/rmi_cmds.h |  3 ++
>   arch/arm64/kernel/Makefile        |  2 +-
>   arch/arm64/kernel/cpufeature.c    |  1 +
>   arch/arm64/kernel/rmi.c           | 65 +++++++++++++++++++++++++++++++
>   4 files changed, 70 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/kernel/rmi.c
> 

[...]

> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
> new file mode 100644
> index 000000000000..99c1ccc35c11
> --- /dev/null
> +++ b/arch/arm64/kernel/rmi.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2025 ARM Ltd.
> + */
> +
> +#include <linux/memblock.h>
> +
> +#include <asm/rmi_cmds.h>
> +
> +unsigned long rmm_feat_reg0;
> +unsigned long rmm_feat_reg1;
> +
> +static int rmi_check_version(void)
> +{
> +	struct arm_smccc_res res;
> +	unsigned short version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +	unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +
> +	/* If RME isn't supported, then RMI can't be */
> +	if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
> +		return -ENXIO;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
> +
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
> +static int __init arm64_init_rmi(void)
> +{
> +	/* Continue without realm support if we can't agree on a version */
> +	if (rmi_check_version())
> +		return 0;

Is this still a valid point that we have to return zero on errors returned
from rmi_check_version() or other other function calls like rmi_features()?
arm64_init_rmi() is triggered by subsys_initcall() where the return value
needs to indicate success or failure. It's fine to return error code from
arm64_init_rmi() in the path.

> +
> +	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
> +		return 0;
> +	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
> +		return 0;
> +
> +	return 0;
> +}
> +subsys_initcall(arm64_init_rmi);

Thanks,
Gavin

