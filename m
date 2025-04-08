Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64325F78F
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094273; cv=none; b=Bscyu7BPrXCIilTfDqVi0JSAj5XS/REMFjd9YZknduNSSRih2d5t/VoBLyWuTDUqbnoHiPtB01Kzk6rcL/AOH2zXlRuDgmjOM5v3u7dKRHUjQ+5pt2+/YGl2l7RSPCPXqVhBX7TfrNB5Bm/YT/WEg1PU4oKW9ROFTMd2OQ1psnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094273; c=relaxed/simple;
	bh=Oz3GUpFJ10kwqmVTG/QRdcwv51pw9nvmSjTO6MPD85c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0i/nWjnb+1hIoRrNcSmLSG3TvUM7x8gMldvBzCzfyDIvK91+36WxvrLHrZBNXljieX+NOp2e/BQxNIjlzMT8HuxXyRhRjKDfkqtEMJQQJTTKL0dHCwsCEifM9S71IyVhzl5l5L4ydyHfCDiDYavxsCerFyfl7mHd5G8keE6P88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSLXiWiO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSLXiWiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744094270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
	b=RSLXiWiOc8mo0gPKv12Nn8ldttp2lHYM8vmbmm7+Z8NJ+deMg6eAqXjMWcGKe8+z96iVva
	iVFYR3hspZwvoJ3gN3RQmz6+mWCIWKbGYjgAMnnAQGM1JI7i5+fULCxmVF562rcZ0WVkvi
	VX/OXjsSz8r3mRpX2Rzd3ssFuLeLk9M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-XxWQT9yuPLesIZsQwSJH9A-1; Tue, 08 Apr 2025 02:37:47 -0400
X-MC-Unique: XxWQT9yuPLesIZsQwSJH9A-1
X-Mimecast-MFC-AGG-ID: XxWQT9yuPLesIZsQwSJH9A_1744094266
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so4767463a91.1
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 23:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094266; x=1744699066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v20FJ701EIe028OJtt1tD17tf+Uzfk0Oz819ryH+Ys=;
        b=BYqHR37zC7jPT3B7hI4IeJbTDKrq+kUIKWc7+mDxykr4HpGb0A6kB1AiWqLeFw41TU
         ykKvr+kQxxmzvs+j39ZtHZ+H646gO/gyll9LPlrYSywHa8ciKT9x6plHVh/viM22xs/9
         fD/kigatwYK8vsrYdcToW0nY91Gd45BLy3pMAWbqek6Rb2klXxwIim4gCBrXsoqpD20s
         5FCAm2fWHxmZJTVoZszOdqqGImHMr4UO0UFc/MFBijZixjd1lmKxpruO63GkKPf3TKw/
         N9Iql81gOO4ckcE+gfnHvEZEYEYaC3zPGSXvlwTffqgWxdia1Hs75Kz3IXTdUxuQaLKd
         VkXA==
X-Forwarded-Encrypted: i=1; AJvYcCWPshHCa6Xnoia6ubTmeDTU8YhkIhIPT46egXDGES+50y2xoMM/hFX/vDDodHttOZcTh8fjGpJ7lMR7@lists.linux.dev
X-Gm-Message-State: AOJu0YyNrf6S17N3rJJIJPXxCzD0nYh1HcssfhUo2+lQb3zebxrY5nvX
	9pl7TtPal6KXEO2imTdfpCppkTo30QA6iZhuKdzYg+NakXfkrGOeZpqjF6OujB6tCC2WrhUtgiS
	tZHmfYT0AJeAFJMhvBdRWrwbER+gvxQHUT84hDXhEPFZ2iQqyvvHMtvbFK8M=
X-Gm-Gg: ASbGncvgh4Kq3zEY9go82PF/sXIJ16HQERN2afiS+sSbjRlVsOW7t/exRub2ShTZMnd
	OnHwuFz9fMNJAgzJLDgm9huw7pXAKA0D+t1dyhRgoGfAvqeffbhPHp1gQOc3GCX6VsjDZ/F2CVY
	/hqCr3e2oKe24AAgwEBnVWvBZ+C/PmvRUFkZy/5LQekf/VoktIbyr8fQO7yg4Z4R5ovusaqikL5
	7pOm+LhMDzHMXY4KJYcMz0LgR3xTkSjzaYPPmnmxSJxDO1zG04o9ZN3mjAU4zUDdJd1hCBDoknQ
	1KO/hisweGeyFX8b
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510593a91.22.1744094266482;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqBBqwWUYhtFhCnTMpC42RqocSQyCJuLXXFnIrjI7SQP3rPRugb4tcWmMuJB3JDe5p/oXtw==
X-Received: by 2002:a17:90b:514e:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-306a4b70e72mr18510574a91.22.1744094266139;
        Mon, 07 Apr 2025 23:37:46 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983bce79sm10080504a91.37.2025.04.07.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 23:37:45 -0700 (PDT)
Message-ID: <7fa4269b-a20c-4cfc-b6e7-e70214ec6366@redhat.com>
Date: Tue, 8 Apr 2025 16:37:36 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
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
 <20250213161426.102987-35-steven.price@arm.com>
 <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
 <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hX7Aq_970QylPDfvAlEvK8xxI3WHHBI1v1EGmqv4X-Y_1744094266
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 11:51, Gavin Shan wrote:
>> On 2/14/25 2:14 AM, Steven Price wrote:
>>> For protected memory read only isn't supported. While it may be possible
>>> to support read only for unprotected memory, this isn't supported at the
>>> present time.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    arch/arm64/kvm/arm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>
>> It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
>> negative impact. It's something to be done in the future if I'm correct.
> 
> I'll add to the commit message:
> 
>      Note that this does mean that e.g. ROM (or flash) data cannot be
>      emulated correctly by the VMM.
> 

Please also to mention this if you agree: At present, there is no exposed
APIs from RMM allowing to specifying stage-2 page-table entry's permission.
read-only regions for ROM and flash have to be backed up by read-write stage-2
page-table entries. It's going to rely on the stage-1 page-table to have the
proper permissions for those read-only regions.

>>  From QEMU's perspective, all ROM data, which is populated by it, can
>> be written. It conflicts to the natural limit: all ROM data should be
>> read-only.
> 
> Yes this is my understanding of the main impact. I'm not sure how useful
> (shared) ROM/flash emulation is. It can certainly be added in the future
> if needed. Protected read-only memory I don't believe is useful - the
> only sane response I can see from a write fault in that case is killing
> the guest.
> 

Yes, VMM is still able to write to those regions even they're read-only
since they're emulated. For misbehaving guest where those regions are also
mapped as read-write, the data resident in those regions can be corrupted
by guest. It's not the expected output.

Since RMM doesn't have exposed APIs allowing to specify page-table entry's
permissions, meaning all entries have read-write permissions, we have to
give read-write permission to those read-only regions for now. In long run,
it's something to be fixed, starting from RMM.

Thanks,
Gavin

> Thanks,
> Steve
> 
>> QEMU
>> ====
>> rom_add_blob
>>    rom_set_mr
>>      memory_region_set_readonly
>>        memory_region_transaction_commit
>>          kvm_region_commit
>>            kvm_set_phys_mem
>>              kvm_mem_flags                                    // flag
>> KVM_MEM_READONLY is missed
>>              kvm_set_user_memory_region
>>                kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)
>>
>> non-secure host
>> ===============
>> rec_exit_sync_dabt
>>    kvm_handle_guest_abort
>>      user_mem_abort
>>        __kvm_faultin_pfn                       // writable == true
>>          realm_map_ipa
>>            WARN_ON(!(prot & KVM_PGTABLE_PROT_W)
>>
>> non-secure host
>> ===============
>> kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
>>    kvm_populate_realm
>>      __kvm_faultin_pfn                      // writable == true
>>        realm_create_protected_data_page
>>
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 1f3674e95f03..0f1d65f87e2b 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_ONE_REG:
>>>        case KVM_CAP_ARM_PSCI:
>>>        case KVM_CAP_ARM_PSCI_0_2:
>>> -    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_MP_STATE:
>>>        case KVM_CAP_IMMEDIATE_EXIT:
>>>        case KVM_CAP_VCPU_EVENTS:
>>> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>>> long ext)
>>>        case KVM_CAP_COUNTER_OFFSET:
>>>            r = 1;
>>>            break;
>>> +    case KVM_CAP_READONLY_MEM:
>>>        case KVM_CAP_SET_GUEST_DEBUG:
>>>            r = !kvm_is_realm(kvm);
>>>            break;
>>
>> Thanks,
>> Gavin
>>
> 

