Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205264A49A7
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907310; cv=none; b=qMlMIQvnRQJG9JNzbCcqOc3eW9GVUQOpT8BXDtkmZZe1/dr+4iD3Lma6/p4DwTPiwNxfBcMnKjeBHBWGnw1RrDCHZMjYE1rWn8Jyk5U9PZ1AIpvQ2yFZVvpwzVWuNhphTSl+dzTgIVGgOYb7mjLc49WWPMCzEqZiKWo09THslyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907310; c=relaxed/simple;
	bh=ZN6cWP/Yb/IvBfN4GQTD664at/DhRbeG7MzN5RUyw4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx0Zgaps/saOdrVbI2o+DxYhCi0aqYmJFHI+AFZ2z6tuBnA1lNeD+NTxZ2VPr/qFpdfZ226TwQhGiwl8BKMn5DAPKf+d4PpV1E6SQj6vJ0xUbOU1lFZ0kf5KIP4d24SgrjaaER+BhqS+wn9/rhfIL9jBP06VVw21WBJ53bwoKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h3OHbzGm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3OHbzGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788907303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbRygIjj1UISKx3LvtxKvIim7ExfCkLiZ8qAFUjhHAw=;
	b=h3OHbzGmuB+iP3ZtwaVK1PJyt2f/KQhrl1UL7YkrWdrzY2QzqsbuGU1p3yYiWCDGS9a2mS
	TQ4CoOioJaXuTIxj21IDXvT5IBYdpGI5+84MRjBfFa+smwofmuK9eflUIFy48DvomSCPT3
	EPwPCUtVwRUEPMK7z1Fl8QD/0Hs54W8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-rCahmzD2MB6o7quf-U0rzQ-1; Tue, 08 Sep 2026 18:41:40 -0400
X-MC-Unique: rCahmzD2MB6o7quf-U0rzQ-1
X-Mimecast-MFC-AGG-ID: rCahmzD2MB6o7quf-U0rzQ_1788907299
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso6108398a12.0
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 15:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788907299; x=1789512099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbRygIjj1UISKx3LvtxKvIim7ExfCkLiZ8qAFUjhHAw=;
        b=mjt/f4d4r81VfRqHJXsfiJxxwWHim3ON3sA+epgGBA1oQCLivcdQIjWet5I4hn95Ue
         cX4tygNByZZHQGMlB6EJIU9UguTL8eKdgXLK4/5wi2BQxIs0ot54cG80JYPxmpzAgDDn
         ZvjT7/61JchXoCJCgRvlmqS6csms5foKFPsj6uEyE7DJcv9jkLtgYZkm3l29Iz2uMr8o
         HgNmqTgOw3hOAtEuGIastrwtosyLFsblrsAdiuLffijcsMBBOqJ0TiSnVuKVoPxdHyN8
         Yj8k0CbxR1Q8CyZ41jvLQCqiYirht7w4umkI0wkk99g7mU5hODcPNT/JqnK6vREOP1+L
         Ny7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQhtMZGuEGf7tzfNQ5/piA9KKcW1XLMlFi0ZXjzB1woxRI2c4/IdjmHY5ajHrnCsInheAQE26h5B0d@lists.linux.dev
X-Gm-Message-State: AFuF++lPHu/zyhN5eG/wmPWEOSgqt7mUtKODGaiBAERrRYjEpKywcJEd
	A+K+Ot2dtRT+vy6YK249j6sqjrP/NeOuPOtxm5a5AN676I5iLfGCIRI0VjMAgVMNGG2t4o3bE9y
	Zoe4yIWZWZU5hQ8FnFSSAbYP6hreYwUbbLrhE+HoWhr7P0TRwCUx2w5o2pGu0YAM=
X-Gm-Gg: AYBFou0SkEmezq0Ul2/X3PgxZBfUVNubfjzbI3kDl6TEZsMwnlfRh4Ec8/EI2Vr9MW7
	RZJHio8jzxA52kznOxZ2dL77+M10vAf9Puw/dKBZlSkMAyH9xUdjtGfGNBAfe7j2Kr4eEjgVHRb
	7pZWOSB1N+kDnkLJqIXBtrYXU+DfGnEQ/H55zj4T8i+KPoUcy2Cft/aW7cuOAgor3v7OC54r+8F
	uQFyFH0JlAXT6zLVdV7o5SVaVXMTNVTYmQUVCThXEs9kohTaz0YIhhn/PHiFsfb4ZkZnX1iXeqa
	Ppbh1n6UYWWCytSrWfFuWxB3O3ZF7HHRFJshwrui6D1EMLIlQgCpjJ8SnPKKKh9IsZRI1Ht2mmw
	5OvD+qRnpHU0QUCDnOOuaC1B/TRHlLvmxC92+crECDw==
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr7157579a91.2.1788907298736;
        Tue, 08 Sep 2026 15:41:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr7157553a91.2.1788907298136;
        Tue, 08 Sep 2026 15:41:38 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd20641e2sm204402a91.3.2026.09.08.15.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:41:36 -0700 (PDT)
Message-ID: <52e58930-8fa4-4c75-981c-25be42d83f2d@redhat.com>
Date: Wed, 9 Sep 2026 08:41:23 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-2-suzuki.poulose@arm.com>
 <c9990440-acab-4c6c-b67f-8bde17feddce@redhat.com>
 <aca629b2-27a0-4c47-acac-87edb3b0d3d9@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aca629b2-27a0-4c47-acac-87edb3b0d3d9@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sjGS207s4-YriSM4H4LTs1DnKrhogddGnRQ_rEpPdgQ_1788907299
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/8/26 8:37 PM, Suzuki K Poulose wrote:
> On 08/09/2026 07:19, Gavin Shan wrote:
>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>> From: Steven Price <steven.price@arm.com>
>>>
>>> The RMM (Realm Management Monitor) provides functionality that can be
>>> accessed by SMC calls from the host.
>>>
>>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>>
>>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> ...
> 
>>> ---
>>>   include/linux/arm-smccc-rmi.h | 494 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 494 insertions(+)
>>>   create mode 100644 include/linux/arm-smccc-rmi.h
>>>
>>
>> Some nitpicks below, please pick up the commits that look reasonable :)
>>
> 
> 
>>> +
>>> +#define RMI_RETURN_STATUS_MASK        (0xFFUL)
>>> +#define RMI_RETURN_INDEX_MASK        (0xFFUL << 8)
>>> +#define RMI_RETURN_MEMREQ_MASK        (0x3UL << 8)
>>> +#define RMI_RETURN_CAN_CANCEL_MASK    (0x1UL << 10)
>>> +
>>> +#define RMI_RETURN_STATUS(ret) FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
>>> +#define RMI_RETURN_INDEX(ret)        FIELD_GET(RMI_RETURN_INDEX_MASK, ret)
>>> +#define RMI_RETURN_MEMREQ(ret) FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
>>> +#define RMI_RETURN_CAN_CANCEL(ret) FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)
>>> +
>>
>> If I'm correct enough, RMI_RETURN_{STATUS, INDEX, MEMREQ, CAN_CANEL} _MASK are used
>> for once in this header file. So we needn't explicitly expose them and combine their
>> definitions with users to fetch the corresponding fields, as below.
>>
>> #define RMI_RETURN_STATUS(ret)        FIELD_GET(GENMASK(7, 0), ret)
>> #define RMI_RETURN_INDEX(ret)        FIELD_GET(GENMASK(15, 8), ret)
>> #define RMI_RETURN_MEMREQ(ret)        FIELD_GET(GENMASK(10, 8), ret)
>> #define RMI_RETURN_CAN_CANCEL(ret)    FIELD_GEt(GENMASK(10, 10), ret)
> 
> I belive the header files were generated from a tool (by Steven) and
> these would make it easier to compare with the generated header file for
> any deviation from the spec. So, I am a bit reluctant make these
> changes.
> 
> That said, I am happy to convert the mask definitions to GENMASK() for
> consistency and readability. i.e., something like:
> 
> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-rmi.h
> index 3eb88caf40964..078197284415e 100644
> --- a/include/linux/arm-smccc-rmi.h
> +++ b/include/linux/arm-smccc-rmi.h
> @@ -139,10 +139,10 @@
>   #define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
>   #define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
> 
> -#define RMI_RETURN_STATUS_MASK         (0xFFUL)
> -#define RMI_RETURN_INDEX_MASK          (0xFFUL << 8)
> -#define RMI_RETURN_MEMREQ_MASK         (0x3UL << 8)
> -#define RMI_RETURN_CAN_CANCEL_MASK     (0x1UL << 10)
> +#define RMI_RETURN_STATUS_MASK         GENMASK(7, 0)
> +#define RMI_RETURN_INDEX_MASK          GENMASK(15, 8)
> +#define RMI_RETURN_MEMREQ_MASK         GENMASK(10, 8)
> +#define RMI_RETURN_CAN_CANCEL_MASK     BIT(10)
> 

Ok.

>>
>>> +#define RMI_SUCCESS            0
>>> +#define RMI_ERROR_INPUT            1
>>> +#define RMI_ERROR_REALM            2
>>> +#define RMI_ERROR_REC            3
>>> +#define RMI_ERROR_RTT            4
>>> +#define RMI_ERROR_NOT_SUPPORTED        5
>>> +#define RMI_ERROR_DEVICE        6
>>> +#define RMI_ERROR_RTT_AUX        7
>>> +#define RMI_ERROR_PSMMU_ST        8
>>> +#define RMI_ERROR_DPT            9
>>> +#define RMI_BUSY            10
>>> +#define RMI_ERROR_GLOBAL        11
>>> +#define RMI_ERROR_TRACKING        12
>>> +#define RMI_INCOMPLETE            13
>>> +#define RMI_BLOCKED            14
>>> +#define RMI_ERROR_GPT            15
>>> +#define RMI_ERROR_GRANULE        16
>>> +
>>> +#define RMI_CONTINUE_KEEP_GOING        0
>>> +#define RMI_CONTINUE_STOP        1
>>> +
>>> +#define RMI_OP_MEM_REQ_NONE        0
>>> +#define RMI_OP_MEM_REQ_DONATE        1
>>> +#define RMI_OP_MEM_REQ_RECLAIM        2
>>> +
>>> +#define RMI_DONATE_SIZE_MASK        3UL
>>> +#define RMI_DONATE_COUNT_MASK        GENMASK(15, 2)
>>> +#define RMI_DONATE_CONTIG_MASK        BIT(16)
>>> +#define RMI_DONATE_STATE_MASK        GENMASK(18, 17)
>>> +
>>> +#define RMI_DONATE_SIZE(req)        FIELD_GET(RMI_DONATE_SIZE_MASK, req)
>>> +#define RMI_DONATE_COUNT(req)        FIELD_GET(RMI_DONATE_COUNT_MASK, req)
>>> +#define RMI_DONATE_CONTIG(req) FIELD_GET(RMI_DONATE_CONTIG_MASK, req)
>>> +#define RMI_DONATE_STATE(req)        FIELD_GET(RMI_DONATE_STATE_MASK, req)
>>> +
>>
>> As above, RMI_DONATE_{SIZE, COUNT, CONTIG, STATE}_MASK are used for once in this
>> header file. So their definitions can be dropped by modifying the followup macros,
>> as below. Some enhancements are also applicable: (a) Use 'BLOCK' to indicate the
>> unit encoded in the request. (b) The macros are put into order from MSB to LSB.
>>
>> #define RMI_DONATE_STATE(req)        FIELD_GET(GENMASK(18, 17), req)
>> #define RMI_DONATE_CONTIG(req)        FIELD_GET(GENMASK(16, 16), req)
>> #define RMI_DONATE_BLOCK_COUNT(req)    FIELD_GET(GENMASK(15, 2), req)
>> #define RMI_DONATE_BLOCK_SIZE(req)    FIELD_GET(GENMASK(1, 0), req)
> 
> Same as above.
> 

Please rename RMI_DONATE_{SIZE, COUNT} to RMI_DONATE_BLOCK_{SIZE, COUNT} if possible.

>>
>>> +#define RMI_OP_MEM_DELEGATED        0
>>> +#define RMI_OP_MEM_UNDELEGATED        1
>>> +#define RMI_OP_MEM_CONDITIONAL        2
>>> +
>>
>> B4.6.40 RmiOpMemContig type is missed here and they should be used in the c code.
>>
>> #define RMI_OP_MEM_NON_CONTIG    0
>> #define RMI_OP_MEM_CONTIG    1
>>
>> In the c code, we shall have:
>>
>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>     ...
>> } else {
>>     ...
>> }
>>
> 
> Does it make much sense though ? I prefer
> 
> if (RMI_DONATE_CONTIG(req))
> 
> to
> 
> 
> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
> 
> 
> than having a field for a single bit values. I am happy to change
> this if there is strong preference to the other.
> 

The point is RMM-v2.0-bet3 expose RMI_OP_{MEM, MEM_NON}_CONTIG instead of true/false
to indicate if the requested memory blocks are physically contiguous or not. So the
expression 'if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)' is consistent to the
RMM-v2.0-bet3 spec.

  
>> Similarly, B4.6.39 RmiOpCanCancel type is missed here and they should be used in
>> the c code.
>>
>> #define RMI_OP_CANNOT_CANCEL    0
>> #define RMI_OP_CAN_CANCEL    1
>>
>> In the c code, we shall have:
>>
>> if (RMI_RETURN_CAN_CANCEL(ret) == RMI_OP_CAN_CANCEL) {
>>      ...
>> } else {
>>      ...
>> }
>>
> 
> Same as above.
> 

Please see above explanation.

>>> +#define RMI_ADDR_TYPE_NONE        0
>>> +#define RMI_ADDR_TYPE_SINGLE        1
>>> +#define RMI_ADDR_TYPE_LIST        2
>>> +
>>> +#define RMI_ADDR_RANGE_SIZE_MASK    GENMASK(1, 0)
>>> +#define RMI_ADDR_RANGE_COUNT_MASK    GENMASK(PAGE_SHIFT - 1, 2)
>>> +#define RMI_ADDR_RANGE_ADDR_MASK    (PAGE_MASK & GENMASK(51, 0))
>>> +#define RMI_ADDR_RANGE_STATE_MASK    GENMASK(63, 62)
>>> +
>>> +#define RMI_ADDR_RANGE_SIZE(ar) (FIELD_GET(RMI_ADDR_RANGE_SIZE_MASK, \
>>> +                           (ar)))
>>> +#define RMI_ADDR_RANGE_COUNT(ar) (FIELD_GET(RMI_ADDR_RANGE_COUNT_MASK, \
>>> +                           (ar)))
>>> +#define RMI_ADDR_RANGE_ADDR(ar)        ((ar) & RMI_ADDR_RANGE_ADDR_MASK)
>>> +#define RMI_ADDR_RANGE_STATE(ar) (FIELD_GET(RMI_ADDR_RANGE_STATE_MASK, \
>>> +                           (ar)))
>>> +
>>
>> I guess it wouldn't a bad idea to explictly indicate 'BLOCK' in the definitions, as
>> below. Some improvements are applicated either: (a) 'ar' is renamed to 'r'; (b) The
>> excessive parentheses are dropped to follow the patterns we already had; (c) For
>> RMI_ADDR_RANGE_ADDR(r), FIELD_GET() is used.
>>
>> #define RMI_ADDR_RANGE_BLOCK_SIZE_MASK        GENMASK(1, 0)
>> #define RMI_ADDR_RANGE_BLOCK_COUNT_MASK        GENMASK(PAGE_SHIFT - 1, 2)
>> #define RMI_ADDR_RANGE_ADDR_MASK        (PAGE_MASK & GENMASK(51, 0))
>> #define RMI_ADDR_RANGE_STATE_MASK        GENMASK(63, 62)
>>
>> #define RMI_ADDR_RANGE_BLOCK_SIZE(r) FIELD_GET(RMI_ADDR_RANGE_SIZE_MASK, r)
>> #define RMI_ADDR_RANGE_BLOCK_COUNT(r) FIELD_GET(RMI_ADDR_RANGE_COUNT_MASK, r)
>> #define RMI_ADDR_RANGE_ADDR(r) FIELD_GET(RMI_ADDR_RANGE_ADDR_MASK, r)
>> #define RMI_ADDR_RANGE_STATE(r) FIELD_GET(RMI_ADDR_RANGE_STATE_MASK, r)
> 
> Ack
> 
>>
>>> +enum rmi_ripas {
>>> +    RMI_EMPTY = 0,
>>> +    RMI_RAM = 1,
>>> +    RMI_DESTROYED = 2,
>>> +    RMI_DEV = 3,
>>> +};
> 
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB    BIT(0)
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB    BIT(1)
>>> +#define RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB    BIT(2)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_256    BIT(3)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_384    BIT(4)
>>> +#define RMI_FEATURE_REGISTER_1_HASH_SHA_512    BIT(5)
>>> +#define RMI_FEATURE_REGISTER_1_MAX_RECS_ORDER    GENMASK(9, 6)
>>> +#define RMI_FEATURE_REGISTER_1_L0GPTSZ        GENMASK(13, 10)
>>> +#define RMI_FEATURE_REGISTER_1_PPS        GENMASK(16, 14)
>>> +
>>> +#define RMI_FEATURE_REGISTER_2_DA        BIT(0)
>>> +#define RMI_FEATURE_REGISTER_2_DA_COH        BIT(1)
>>> +#define RMI_FEATURE_REGISTER_2_VSMMU        BIT(2)
>>> +#define RMI_FEATURE_REGISTER_2_ATS        BIT(3)
>>> +#define RMI_FEATURE_REGISTER_2_PDEV_MAX_VDEVS_ORDER    GENMASK(7, 4)
>>> +#define RMI_FEATURE_REGISTER_2_VDEV_KROU    BIT(8)
>>> +#define RMI_FEATURE_REGISTER_2_NON_TEE_STREAM    BIT(9)
>>> +#define RMI_FEATURE_REGISTER_2_REALM_MAX_VDEVS_ORDER    GENMASK(14, 10)
>>> +
>>> +#define RMI_FEATURE_REGISTER_3_MAX_NUM_AUX_PLANES    GENMASK(3, 0)
>>> +#define RMI_FEATURE_REGISTER_3_RTT_PLANE        GENMASK(5, 4)
>>> +#define RMI_FEATURE_REGISTER_3_RTT_S2AP_INDIRECT    BIT(6)
>>> +
>>> +#define RMI_FEATURE_REGISTER_4_MEC_COUNT        GENMASK(63, 0)
>>> +
>>
>> We would reorder those feature register definitions from MSB ro LSB :-)
> 
> Ack
> 
> Thanks for your review.
> 
> Cheers
> Suzuki
> 

Thanks,
Gavin

