Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E205221FE
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865205; cv=none; b=JwSSxWvEKdm6kwB/wmb74Yy+L/tz7hzs1chfaCvkMuKjC6kL1O0AOy06xjeKKk65cIQ/fBNHWGNc9/9T5MEKzyJiqJyDjuqVFfNProv1QG+khAASBZEyVCrajeQf4z5PLNADtJbr0tW9Hb6k17LfYVABc1Ys2NnG56YppkzX0pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865205; c=relaxed/simple;
	bh=PASoVvJRW52udlXwVPLEvyOYeF6gdA9Vi//Tr1ZPV98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJEzOBYkBPM8tCozpHCQ9juCkAo52dPKA/gfpazKiFEfBwVb3TnEVjsusMTZvL6+GUWoIlLGxHN0vkwvpnNAy14jDGzSfPHI1rk8ghoFXkdnmmqkae9MvnfZMEx5ldcYnueUKO0pcMTD+9UPgg54REkqSl72rmsnNpYImhFVSFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvUGzp21; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvUGzp21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788865202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c02abhHVFEdqDQiBq5z2yqG6TQE5ipoCqgc71cPZ6jg=;
	b=dvUGzp21AhrTtJW2YHiBhhtWGGYAfk5NvTlgIx/rXKZhkEos71iWylbonTmEUChkrrtqxK
	X2R7t2h0QfxXy6BA4JjKC+imp01b8w1YuSIpq82QI1jji3tIB5bArbc9nRCBWbI7Di0d2y
	WggGS/djEu98zKCmlPOE9qjQQCI62cw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-syBaS661O2StIkl8HuQDeQ-1; Tue, 08 Sep 2026 06:59:59 -0400
X-MC-Unique: syBaS661O2StIkl8HuQDeQ-1
X-Mimecast-MFC-AGG-ID: syBaS661O2StIkl8HuQDeQ_1788865198
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db050d469fso28128455ad.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 03:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865198; x=1789469998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c02abhHVFEdqDQiBq5z2yqG6TQE5ipoCqgc71cPZ6jg=;
        b=NBkbR0hFwoyyrnw7WQrRFJT1K9mrqXgqv3dMDsY3cx+b5jN+vU0MXzZjP/wG2cMGeT
         R+dPCjN4eFM1DOer31PQoKuYfEn/G5VwqLsS5I+T/mjedKjo201Yl81Aerkq78nAYgPc
         o8jDES0/rlPb5ZcfyzIPsSOnYRDsBv1AW1WXvIv21lhmij+9KBLau88TfT9Sl+3Ykv33
         3MMjerSaVcyzaaPcbt8k6LYS+1KWEesGV70a7VyT86HiPUvq1Tyi9N7zolnu6DP2BhcZ
         U5kUPUszlE0zfW5H5cY7I1R01v7i51xOJc6kLAu3v/aeAwN5i9isOIl0gr2MTWgYF9qf
         LqLA==
X-Forwarded-Encrypted: i=1; AKwUvBwo/pAyb3rdXNZccUUYe1ZK0zsg7MfkugMvlH62Pwd0UW1Pz6766zy986esZMT1QI8tAk6CiyI7uzjZ@lists.linux.dev
X-Gm-Message-State: AFuF++lwD8BR1LG7zPfDR/Qe+Xxs9qEiCBxFM8Hixu+jx8VIHSwET2mB
	YnwEyhG40ieFThDO5kbkDXdezIDAB9FkZVJTY0blHwDDHkitNE58hRQP0hEZqGVu78DJORC4CMK
	KfMWid261/qomdmNuDErBm0qLIXMT6yuc2p8JQBMuMJnsv6yQgWhaNVNTVk1ZraA=
X-Gm-Gg: AYBFou3zkR6pvzjrCvoSmmLar9+GZXPm+gxz5fJK0plv3qSRPZKoqfs4vcG75xEXU1h
	uNnHTGsStqdsi3oF4X2Ctn7H8pdSLbYw0qgs+r/EP1q20WbfXTUsG1oDPOFPpAAsyIu7peqSgYf
	iKJQfheb9x9HbRqUIT6j8A29WQ4ReCX96VIqd2S+z7PPguXXy+mBSRhVGqJEbL2TjRxSmTSp9Qj
	5Epq83m32MFeLNqts6RXsV1qWNiKXPfkT/gw9xM5+FOmUDxewlBMiNYRoHu2pTHhbUjtm3WP27O
	J3Cnq2130TUrfVcIwXRmgLfrXCpIbiuLE/OBkJhOPohMahqXpUW81Xvin8PTD4dMezRvEglpetM
	AH0yKuip/aDYv+M1uzVtp2cRf78luTlhmBUM2TbwBdQ==
X-Received: by 2002:a17:902:e944:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2db6fe6d0f8mr58961675ad.3.1788865198154;
        Tue, 08 Sep 2026 03:59:58 -0700 (PDT)
X-Received: by 2002:a17:902:e944:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2db6fe6d0f8mr58961265ad.3.1788865197629;
        Tue, 08 Sep 2026 03:59:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm57511075ad.25.2026.09.08.03.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:59:56 -0700 (PDT)
Message-ID: <9706a0b9-b686-4502-bfae-08aabe05fb84@redhat.com>
Date: Tue, 8 Sep 2026 20:59:45 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
 <10893135-4757-44de-91b5-180a9774d868@redhat.com>
 <ap--9pJdD_Y_j1aY@FCCLS0092175.localdomain>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ap--9pJdD_Y_j1aY@FCCLS0092175.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rk4rDKKXed-qK7IeQel9XuZUSNk9vdOXRxvwjZZQEfk_1788865198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kohei,

On 9/8/26 6:00 PM, Kohei Enju wrote:
> Hi Gavin,
> 
> On 09/08 17:04, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>> From: Steven Price <steven.price@arm.com>
>>>
>>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>>> feature registers and configure the RMM so that it matches the host's
>>> page size. This means that operations can be done with a granularity
>>> equal to PAGE_SIZE.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>    Changes since v15:
>>>     * Actually check the feature register for the host's page-size support.
>>>    Changes since v14:
>>>     * Move the implementation into drivers/firmware/arm_rmm.
>>>    Changes since v13:
>>>     * Moved out of KVM.
>>> ---
>>>    drivers/firmware/arm_rmm/rmi.c | 58 ++++++++++++++++++++++++++++++++++
>>>    include/linux/arm-rmi-cmds.h   | 17 ++++++++++
>>>    2 files changed, 75 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>>> index 008a783407b4e..76f91c145e1fd 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> @@ -77,6 +77,60 @@ static int rmi_read_features(void)
>>>    	return 0;
>>>    }
>>> +static int rmi_configure(void)
>>> +{
>>> +	unsigned long granule_feature;
>>> +	unsigned long granule_size;
>>> +	int ret = 0;
>>> +	struct rmm_config *config;
>>> +
>>> +	switch (PAGE_SIZE) {
>>> +	case SZ_4K:
>>> +		granule_size = RMI_GRANULE_SIZE_4KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
>>> +		break;
>>> +	case SZ_16K:
>>> +		granule_size = RMI_GRANULE_SIZE_16KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
>>> +		break;
>>> +	case SZ_64K:
>>> +		granule_size = RMI_GRANULE_SIZE_64KB;
>>> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
>>> +		break;
>>> +	default:
>>> +		BUILD_BUG();
>>> +	}
>>> +
>>> +	if (!(rmi_feat_reg(1) & granule_feature)) {
>>> +		pr_err("RMM does not support %luKB granules\n",
>>> +		       PAGE_SIZE >> 10);
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>> +	if (!config)
>>> +		return -ENOMEM;
>>
>> An error message is needed here.
>>
>> 	if (!config) {
>> 		pr_err("Unable to alloc RMM config memory\n");
>> 		return -ENOMEM;
>> 	}
> 
> I largely agree with your suggestions, and they look reasonable to me.
> 
> However, wouldn't this be redundant? Since __GFP_NOWARN is not set, the
> page allocator would normally emit an allocation failure warning with a
> stack trace anyway.
> 
> I don't have a strong preference, but as per "14) Allocating memory" in
> the coding style, I believe it would be considered unnecessary.
> 

You're correct that the error message is most likely redundant here and we
needn't it. However, it's notable the allocation failure warning and stack
trace isn't 100% raised when looking at mm/page_alloc.c::warn_alloc(). At least,
it depends on !__ratelimit(&nopage_rs) even it's less likely to happen. Similarly,
there are conditions to raise a warning and stack track in case of the injected
allocation error in lib/fault-inject.c::fail_dump().

Thanks,
Gavin

> Thanks,
> Kohei
> 
>>
>>> +
>>> +	config->rmi_granule_size = granule_size;
>>> +
>>> +	/*
>>> +	 * For now we set the tracking_region_size to 0 which is the only option
>>> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
>>> +	 * TODO: Support other tracking sizes via Kconfig option for other
>>> +	 * PAGE_SIZES
>>> +	 */
>>> +	config->tracking_region_size = 0;
>>> +
>>> +	ret = rmi_rmm_config_set(virt_to_phys(config));
>>> +	if (ret) {
>>> +		pr_err("RMM config set failed\n");
>>> +		ret = -EINVAL;
>>> +	}
>>
>> The error code from rmi_rmm_config_set() is indicative sometimes. Also, -ENXIO
>> would be more appropriate than -EINVAL?
>>
>> 	if (ret) {
>> 		pr_err("RMM config set failed (%d)\n", ret);
>> 		ret = -ENXIO;
>> 	}
>>
>>> +
>>> +	free_page((unsigned long)config);
>>> +	return ret;
>>> +}
>>> +
>>>    static int __init arm64_init_rmi(void)
>>>    {
>>>    	int ret;
>>> @@ -90,6 +144,10 @@ static int __init arm64_init_rmi(void)
>>>    	if (ret)
>>>    		return ret;
>>> +	ret = rmi_configure();
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	return 0;
>>>    }
>>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>>> index 2fb1f7f86d71e..9aa27697e2377 100644
>>> --- a/include/linux/arm-rmi-cmds.h
>>> +++ b/include/linux/arm-rmi-cmds.h
>>> @@ -12,6 +12,23 @@
>>>    unsigned long rmi_feat_reg(unsigned long id);
>>> +/**
>>> + * rmi_rmm_config_set() - Configure the RMM
>>> + * @cfg_ptr: PA of a struct rmm_config
>>> + *
>>> + * Sets configuration options on the RMM.
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
>>> +
>>> +	return res.a0;
>>> +}
>>> +
>>
>> rmi_rmm_config_set() is used for once by rmi.c::rmi_configure(), I would not expose
>> rmi_rmm_config_set() by combining the logic to rmi.c::rmi_configure().
>>
>>>    /**
>>>     * rmi_features() - Read feature register
>>>     * @index: Feature register index
>>
>> Thanks,
>> Gavin
>>
> 

