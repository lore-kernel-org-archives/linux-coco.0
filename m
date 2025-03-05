Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C37C2C6
	for <linux-coco@lists.linux.dev>; Wed,  5 Mar 2025 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133772; cv=none; b=XsokB3WZ6LVX+3f1Q9x6GUinYQuxdBMNLHzjeikLJxrqdm6u1/XR0xlljV+0zZvpqKPIocrvXggwVEA/0jb1LcyWX181ECXEKbIWlVm9cOE0THxT60F05MUHsyu7j5r0w0GL6TI0wvFpmEvDDDl8jxVKNk0Oe+nRod6RZgmEyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133772; c=relaxed/simple;
	bh=1eNeeZMatMhbyDkf4IzA6vyYEqGA9LjWEzci90EKIKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+7FMLBXHKc8+0A/SbINjx2aGZ5b/egeESD7Q0EPcV0MEFrkRB8Ss+qVFarNCijixyChacaNbPlXXQqjfTrQwlD7AUOH2LXhKdMn9Lvhkdd3oihLDhT/EsOSlApodimgTRp88UwzOiExI/JVRPdNefHDQ4ILaOfTyZhRNmMn6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dejinywc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dejinywc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741133769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+nZIdJ+GUg9TiIWa5Z45oEZwDdDHGq5zn5aUSYMnu4=;
	b=dejinywc0xPzvpCNvruoSHQKXK2dp5bh0o92Q0O/d6KRyS+4vNKPHIkDnZzICPRkZ64VK1
	igLcqFuiRxYMbmwIjviI2voyg078/px3n21wWisEiWb6XQiu2FziN0v+/ZOp868azk4AIJ
	6cb29zMl3Njc9x29IrjMb3WQixA1Hqs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-Hkc_C0riMqSRj8eIC3hzWA-1; Tue, 04 Mar 2025 19:16:06 -0500
X-MC-Unique: Hkc_C0riMqSRj8eIC3hzWA-1
X-Mimecast-MFC-AGG-ID: Hkc_C0riMqSRj8eIC3hzWA_1741133765
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22349ce68a9so48514415ad.0
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 16:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133765; x=1741738565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+nZIdJ+GUg9TiIWa5Z45oEZwDdDHGq5zn5aUSYMnu4=;
        b=egW0VOVZFQmqRDafIlNq0KIHpP16ETMUBgYY4fvRfTcaviIp/K7BRKM3CbsBohhaR6
         rYVjvgN+BkZFblzPkgZ2DQ2zucHDO4VkGcT0IvrFQ92FfJ7gtMLLNNT2L5nOLbt85KHI
         MD7pisqnV/51OjaOuevdqSGxMHBaip96JnjIdqH0JuM+O7YdPHJrX4fDpyTVJQsgvXS6
         ELtyQgYe4uXUzlzrcOb6I+ylZWHUATR2iLvKXdVnV4vCAyCmNsZ0sAvueZrchMjxZJif
         7I24QA3brskI+SzAfZ/9d5KGa6U5tJZeAjYXzUCEMNttJhx+ArD6NB9nZCHXlR/Pf206
         8QUw==
X-Forwarded-Encrypted: i=1; AJvYcCUGeEkNvd+Ii7pMtFdOjFmHXq3u4OER0ZcesYNQPkPCiAIy+0Ne6R7z/ajsVO4UW021wNNWBAzjoqlk@lists.linux.dev
X-Gm-Message-State: AOJu0YxDcO+r0Yz23d27S74roa4JHQh1KuQjXs+2sPyUIAal6Z9s/ic+
	ccUnsJ77bXvmn01tfxDgGdm2uf0HdjIp22C8v74Xse13M8qiWaSd54raEP8l65G6M36OHMFWHzN
	0euGz1X3JL99nKvNb5K46b8sgnZ7KBSKGTXH1tiHVz9/sik2nfzzSU0BKo3o=
X-Gm-Gg: ASbGncvMpvPTB6QNEVyhdIxNgORu3WvFE9St1zP65k+ysX6VFBeCW8Yyh/lTNtv4AiF
	XNNI3lhgeNlCeuektD2CknqXte0hekBjZtI9FDAiIQf34TmwwxQ0PHqYloTuAvnE3n4S2B6DAx0
	d6D4zbkrBsNgL9/tb7qMgoh/VFvkkGSWGoN4Y56lOMrh7lzefs2NpYl84IatPmAvUL66WHWHMox
	vOte2txn0nW7+cf2Wi7Nb5shVC47V7SaaRJCf/LS3ihZCFBDRwZ78B5yK8UFeuPRWfp1srM7SzC
	nvWAxudy1HF0D7E=
X-Received: by 2002:a05:6a00:b42:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73682b73e82mr1248282b3a.9.1741133764836;
        Tue, 04 Mar 2025 16:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtbldcyedC0VzElSl5L414yZHuxZ/AzfRFOHxkoXbZKPjFlAxwXPjGCGBZbMPisg2mcwac1Q==
X-Received: by 2002:a05:6a00:b42:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73682b73e82mr1248225b3a.9.1741133764350;
        Tue, 04 Mar 2025 16:16:04 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363a0f88bfsm7109144b3a.24.2025.03.04.16.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 16:16:03 -0800 (PST)
Message-ID: <1e1aa766-c358-4a4f-918e-f0044fe499fe@redhat.com>
Date: Wed, 5 Mar 2025 10:15:54 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/45] arm64: RME: Add wrappers for RMI calls
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-6-steven.price@arm.com>
 <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
 <59f84354-e890-48c8-ba06-87dda471f364@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <59f84354-e890-48c8-ba06-87dda471f364@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -SP7JpCM45rSctzCBqomyGljBAYqWOUQ023PAc5-Dj8_1741133765
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/25 1:05 AM, Steven Price wrote:
> On 03/03/2025 03:42, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> The wrappers make the call sites easier to read and deal with the
>>> boiler plate of handling the error codes from the RMM.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v5:
>>>    * Further improve comments
>>> Changes from v4:
>>>    * Improve comments
>>> Changes from v2:
>>>    * Make output arguments optional.
>>>    * Mask RIPAS value rmi_rtt_read_entry()
>>>    * Drop unused rmi_rtt_get_phys()
>>> ---
>>>    arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>>>    1 file changed, 508 insertions(+)
>>>    create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>>>
>>
>> With the following nitpicks addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> Thanks, there were a couple of other pages and params_ptr references
> that I've updated to granules and just 'params' too now. With hindsight
> conflating pages and granules in the earlier versions of this series was
> a big mistake ;)
> 

Yeah, that was because the assumption was the page size and granule size are
equal(4KB), but they're still different things. With the intention to support
ARM CCA on host with non-aligned page sizes (16KB/64KB), we have to differentiate
granule/page.

Ideally, the granule is only visible to RMI calls and their helpers. An new memory
allocator seems inevitable so that the allocated pages can be distributed on requests
by various RMI helpers in granule. It means the allocator is the line to separate page
and granule :)

Thanks,
Gavin

> Steve
> 
>>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/
>>> asm/rmi_cmds.h
>>> new file mode 100644
>>> index 000000000000..043b7ff278ee
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>>> @@ -0,0 +1,508 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2023 ARM Ltd.
>>> + */
>>> +
>>> +#ifndef __ASM_RMI_CMDS_H
>>> +#define __ASM_RMI_CMDS_H
>>> +
>>
>> [...]
>>
>>> +
>>> +/**
>>> + * rmi_rec_aux_count() - Get number of auxiliary granules required
>>> + * @rd: PA of the RD
>>> + * @aux_count: Number of pages written to this pointer
>>                    ^^^^^^^^^^^^^^^
>>                    Number of granules
>>> + *
>>> + * A REC may require extra auxiliary pages to be delegated for the
>>> RMM to
>>                                          ^^^^^
>>                                          granules
>>
>>> + * store metadata (not visible to the normal world) in. This function
>>> provides
>>> + * the number of pages that are required.
>>                      ^^^^^
>>                      granules
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rec_aux_count(unsigned long rd, unsigned long
>>> *aux_count)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_AUX_COUNT, rd, &res);
>>> +
>>> +    if (aux_count)
>>> +        *aux_count = res.a1;
>>> +    return res.a0;
>>> +}
>>> +
>>> +/**
>>> + * rmi_rec_create() - Create a REC
>>> + * @rd: PA of the RD
>>> + * @rec: PA of the target REC
>>> + * @params_ptr: PA of REC parameters
>>> + *
>>> + * Create a REC using the parameters specified in the struct
>>> rec_params pointed
>>> + * to by @params_ptr.
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rec_create(unsigned long rd, unsigned long rec,
>>> +                 unsigned long params_ptr)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_CREATE, rd, rec, params_ptr, &res);
>>> +
>>> +    return res.a0;
>>> +}
>>> +
>>
>> 'params_ptr' may be renamed to 'params'.
>>
>>
>> [...]
>>> +#endif /* __ASM_RMI_CMDS_H */
>>
>> Thanks,
>> Gavin
>>
> 

