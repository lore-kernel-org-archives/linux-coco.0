Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834B27E7E3
	for <linux-coco@lists.linux.dev>; Thu, 10 Jul 2025 05:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752125080; cv=none; b=Y/RCXCQlYTQWsaMTr2AZ8mMgpnRijYbGE5sCq6gYGf8Xa1zjb4+9iZ+V/+ZKWmJ75v+rfWZvSmLwrzSBSq5jD8xERCkBQYa49GOfuvoUh+gzNMimeT5RuaWXo8pDRhBSxNOL0spCSpw30Dp3cM6Ooe0uKgq296z/xoqHc1qtRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752125080; c=relaxed/simple;
	bh=Ey67Z/gTuqQmc1QbGtinKiUnNLbmMPU31ReUX4pxfq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rm44FY6f1NIYn+jBDXwBC5i85wkN1P6msNZtnPjY/kfBYNlLBMAKTtsElmC9GUlkv+ZLrrPfP/3JeOcM/iEjbdIgzmG3jdgR/Ua2XweWHbb5FcJ+Iv8sfnRyJzcvbLvxarexOCadqLYrOcG9ajSSJpuI2aji9Kb4AI5MfMpJlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMabfacT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMabfacT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752125076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CceeV7J/K+B1j1BDTYnc8IYXP16jroD6AWzd6NMmE60=;
	b=IMabfacT9S6sGDnaEQ+L+fbQLVdV+amyZprQQg9dRKxzZiPXkAA/xhBFfnTKI9MquCpE4t
	w9vgixcqVc/lfQzacI5/Z42k0AK0zC4KG1VyggYJzdmGNX8GKGBqkgpm/P+mr+kYPUnXnw
	dNVS6Myyvwh+EAUeNFl/cj5JwFHHois=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-5z1qabHtMGqNfbQcjnAbuw-1; Thu, 10 Jul 2025 01:24:34 -0400
X-MC-Unique: 5z1qabHtMGqNfbQcjnAbuw-1
X-Mimecast-MFC-AGG-ID: 5z1qabHtMGqNfbQcjnAbuw_1752125073
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748cf01de06so997134b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Jul 2025 22:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752125073; x=1752729873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CceeV7J/K+B1j1BDTYnc8IYXP16jroD6AWzd6NMmE60=;
        b=LmW1NZM2Xwpu/vMU/Lk297+ELSEBgLx1RBBjJLabMEWvmdjTkQ+Kqn/Sewxadl2qFi
         Ac4iVcoidMF4dAACH4FPTzc8pj+cKYVD0L8FPsbEjwqcwjB8nfvBWbUubouUEzlgxDzd
         yOYbjCwux5AIH+TspcF/l7VWlJCPWQVMszji7VANvRpzd2pGfVN7PDp6p6QLkPbPV5vE
         orqzgYEGS0RSmKuiCa555Fc/pBM/xOmgJKoIZID0mUe71MSgG8zNwUUjyDea6KKyGIkW
         35TMwX0bUeViXf30vbhTdqfcjdNBsTPGZ+Clk6MiYDZVwDSS/OipZEmTi7GbwxNCfZ3F
         CJjA==
X-Forwarded-Encrypted: i=1; AJvYcCWrbcS1eAocWCjvtdzRJGuTWHoMNZzblRzzcQP1VdfUrkkLoZK2a9ps1Zz1S5Q3yyUWdqMm4IF/+UwM@lists.linux.dev
X-Gm-Message-State: AOJu0YzXKta/bvnPsCoZwpFx1pBP4jJ6oJXlQsrSH++27y8NIlVk4+og
	JBKOq1WvhFCDDBmm2wUmjr7K0r5uqSMS36Pyq7l8KLmIMwpplG1i7q9+/N2k3zAvI/azvouFrsP
	j9rho8SaJauOBH3uteCiYpGlpzyGcGCLvg9D1OZ8r4pU/G9DRIV2y2BoAJCMxwjk=
X-Gm-Gg: ASbGncuLhDKOQonYd1wAvs+OiI/cw+MowCqPp9LKPk+UG9LQJV/zJrEtNAoF+oEuFng
	YuX8qKx45pXcpgSa0nN8bas9AMVSv3BeVeRibbxS44yWBlcFmSJuLeJr7YK4HlhMrbZWx4ZDP+4
	kxGUW35sjZDIemJcZsf28odA02KvIVx8ePZY8dzrpPT6+DDF3En/U1yjmr9fJQyx+CzOhjO9X8x
	9WB1b1ce6+HDXUrR4dqW0k4ICLVIV8iT9DHZiUztX+2iKc88Q9PW5NpODrRCqsyzV6MoNJF9rsB
	8m42xolmqc7Ffc7FAhbcGauFz3zYEsHOWCshAfZ+acy2iqxz7H0+gWz4pxjwiQ==
X-Received: by 2002:a05:6a21:33aa:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-23003fd7f75mr2412324637.7.1752125073311;
        Wed, 09 Jul 2025 22:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhW5qdYaRRhJg7AUBogJ5g2fTOaOL30BzyYQhpOK9w1RwhZRAF6XqSga3MM3ZEdVwm9ACHkA==
X-Received: by 2002:a05:6a21:33aa:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-23003fd7f75mr2412277637.7.1752125072831;
        Wed, 09 Jul 2025 22:24:32 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd7140sm950086b3a.24.2025.07.09.22.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 22:24:31 -0700 (PDT)
Message-ID: <a8183dcd-f82e-49b3-b5b4-96e5363e060a@redhat.com>
Date: Thu, 10 Jul 2025 15:24:22 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/43] arm64: RME: Allow VMM to set RIPAS
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
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-16-steven.price@arm.com>
 <60bb33b4-133e-4ebd-950c-e9e2ba8fc38b@redhat.com>
 <b2f3ddac-956e-4779-9202-fc393266aa6c@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b2f3ddac-956e-4779-9202-fc393266aa6c@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LrAkS2xWVh1FI9-Vc_dFtmgBwnlOSOGCV_xtP-6EQOQ_1752125073
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve,

On 7/10/25 12:42 AM, Steven Price wrote:
> On 02/07/2025 01:37, Gavin Shan wrote:
>> On 6/11/25 8:48 PM, Steven Price wrote:
>>> Each page within the protected region of the realm guest can be marked
>>> as either RAM or EMPTY. Allow the VMM to control this before the guest
>>> has started and provide the equivalent functions to change this (with
>>> the guest's approval) at runtime.
>>>
>>> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
>>> unmapped from the guest and undelegated allowing the memory to be reused
>>> by the host. When transitioning to RIPAS RAM the actual population of
>>> the leaf RTTs is done later on stage 2 fault, however it may be
>>> necessary to allocate additional RTTs to allow the RMM track the RIPAS
>>> for the requested range.
>>>
>>> When freeing a block mapping it is necessary to temporarily unfold the
>>> RTT which requires delegating an extra page to the RMM, this page can
>>> then be recovered once the contents of the block mapping have been
>>> freed.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes from v8:
>>>    * Propagate the 'may_block' flag to allow conditional calls to
>>>      cond_resched_rwlock_write().
>>>    * Introduce alloc_rtt() to wrap alloc_delegated_granule() and
>>>      kvm_account_pgtable_pages() and use when allocating RTTs.
>>>    * Code reorganisation to allow init_ipa_state and set_ipa_state to
>>>      share a common ripas_change() function,
>>>    * Other minor changes following review.
>>> Changes from v7:
>>>    * Replace use of "only_shared" with the upstream "attr_filter" field
>>>      of struct kvm_gfn_range.
>>>    * Clean up the logic in alloc_delegated_granule() for when to call
>>>      kvm_account_pgtable_pages().
>>>    * Rename realm_destroy_protected_granule() to
>>>      realm_destroy_private_granule() to match the naming elsewhere. Also
>>>      fix the return codes in the function to be descriptive.
>>>    * Several other minor changes to names/return codes.
>>> Changes from v6:
>>>    * Split the code dealing with the guest triggering a RIPAS change into
>>>      a separate patch, so this patch is purely for the VMM setting up the
>>>      RIPAS before the guest first runs.
>>>    * Drop the useless flags argument from alloc_delegated_granule().
>>>    * Account RTTs allocated for a guest using kvm_account_pgtable_pages().
>>>    * Deal with the RMM granule size potentially being smaller than the
>>>      host's PAGE_SIZE. Although note alloc_delegated_granule() currently
>>>      still allocates an entire host page for every RMM granule (so wasting
>>>      memory when PAGE_SIZE>4k).
>>> Changes from v5:
>>>    * Adapt to rebasing.
>>>    * Introduce find_map_level()
>>>    * Rename some functions to be clearer.
>>>    * Drop the "spare page" functionality.
>>> Changes from v2:
>>>    * {alloc,free}_delegated_page() moved from previous patch to this one.
>>>    * alloc_delegated_page() now takes a gfp_t flags parameter.
>>>    * Fix the reference counting of guestmem pages to avoid leaking memory.
>>>    * Several misc code improvements and extra comments.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   6 +
>>>    arch/arm64/kvm/mmu.c             |   8 +-
>>>    arch/arm64/kvm/rme.c             | 447 +++++++++++++++++++++++++++++++
>>>    3 files changed, 458 insertions(+), 3 deletions(-)
>>>
>>
>> With below nitpicks addressed. The changes looks good to me.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> Thanks, most the nitpicks I agree - thanks for raising. Just one below I
> wanted to comment on...
> 
> [...]

You're welcome.

>>> +
>>> +enum ripas_action {
>>> +    RIPAS_INIT,
>>> +    RIPAS_SET,
>>> +};
>>> +
>>> +static int ripas_change(struct kvm *kvm,
>>> +            struct kvm_vcpu *vcpu,
>>> +            unsigned long ipa,
>>> +            unsigned long end,
>>> +            enum ripas_action action,
>>> +            unsigned long *top_ipa)
>>> +{
>>
>> The 'enum ripas_action' is used in limited scope, I would replace it
>> with a 'bool'
>> parameter to ripas_change(), something like below. If we plan to support
>> more actions
>> in future, then the 'enum ripas_action' makes sense to me.
> 
> The v1.1 spec[1] adds RMI_RTT_SET_S2AP (set stage 2 access permission).
> So that adds a third option to the enum. I agree the enum is a little
> clunky but it allows extension and at least spells out the action which
> is occurring.
> 
> The part I'm not especially happy with is the 'vcpu' argument which is
> not applicable to RIPAS_INIT but otherwise required (and in those cases
> could replace 'kvm'). But I couldn't come up with a better solution for
> that.
> 
> [1] Available from:
> https://developer.arm.com/documentation/den0137/latest (following the
> small "here" link near the end).
> 

Right, it's as I guessed. A enum looks good if we need to extend it
to cover the third case (RMI_RTT_SET_S2AP in RMMv1.1). Note that I just
started looking into RMMv1.1 implementation several days ago and didn't
have a good understanding on RMMv1.1 at present :-)

Thanks,
Gavin

> Thanks,
> Steve
> 
>> static int ripas_change(struct kvm *kvm,
>>              struct kvm_vcpu *vcpu,
>>              unsigned long ipa,
>>              unsigned long end,
>>              bool set_ripas,
>>              unsigned long *top_ipa)
>>
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +    phys_addr_t rd_phys = virt_to_phys(realm->rd);
>>> +    phys_addr_t rec_phys;
>>> +    struct kvm_mmu_memory_cache *memcache = NULL;
>>> +    int ret = 0;
>>> +
>>> +    if (vcpu) {
>>> +        rec_phys = virt_to_phys(vcpu->arch.rec.rec_page);
>>> +        memcache = &vcpu->arch.mmu_page_cache;
>>> +
>>> +        WARN_ON(action != RIPAS_SET);
>>> +    } else {
>>> +        WARN_ON(action != RIPAS_INIT);
>>> +    }
>>> +
>>> +    while (ipa < end) {
>>> +        unsigned long next;
>>> +
>>> +        switch (action) {
>>> +        case RIPAS_INIT:
>>> +            ret = rmi_rtt_init_ripas(rd_phys, ipa, end, &next);
>>> +            break;
>>> +        case RIPAS_SET:
>>> +            ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end,
>>> +                        &next);
>>> +            break;
>>> +        }
>>> +
>>
>> if 'enum ripas_action' is replaced by 'bool set_ripas' as above, this needs
>> twist either.
>>
>>> +        switch (RMI_RETURN_STATUS(ret)) {
>>> +        case RMI_SUCCESS:
>>> +            ipa = next;
>>> +            break;
>>> +        case RMI_ERROR_RTT:
>>> +            int err_level = RMI_RETURN_INDEX(ret);
>>> +            int level = find_map_level(realm, ipa, end);
>>> +
>>> +            if (err_level >= level)
>>> +                return -EINVAL;
>>> +
>>> +            ret = realm_create_rtt_levels(realm, ipa, err_level,
>>> +                              level, memcache);
>>> +            if (ret)
>>> +                return ret;
>>> +            /* Retry with the RTT levels in place */
>>> +            break;
>>> +        default:
>>> +            WARN_ON(1);
>>> +            return -ENXIO;
>>> +        }
>>> +    }
>>> +
>>> +    if (top_ipa)
>>> +        *top_ipa = ipa;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int realm_init_ipa_state(struct kvm *kvm,
>>> +                unsigned long ipa,
>>> +                unsigned long end)
>>> +{
>>> +    return ripas_change(kvm, NULL, ipa, end, RIPAS_INIT, NULL);
>>> +}
>>> +
>>> +static int kvm_init_ipa_range_realm(struct kvm *kvm,
>>> +                    struct arm_rme_init_ripas *args)
>>> +{
>>> +    gpa_t addr, end;
>>> +
>>> +    addr = args->base;
>>> +    end = addr + args->size;
>>> +
>>> +    if (end < addr)
>>> +        return -EINVAL;
>>> +
>>> +    if (kvm_realm_state(kvm) != REALM_STATE_NEW)
>>> +        return -EPERM;
>>> +
>>> +    return realm_init_ipa_state(kvm, addr, end);
>>> +}
>>> +
>>>    /* Protects access to rme_vmid_bitmap */
>>>    static DEFINE_SPINLOCK(rme_vmid_lock);
>>>    static unsigned long *rme_vmid_bitmap;
>>> @@ -441,6 +876,18 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct
>>> kvm_enable_cap *cap)
>>>        case KVM_CAP_ARM_RME_CREATE_REALM:
>>>            r = kvm_create_realm(kvm);
>>>            break;
>>> +    case KVM_CAP_ARM_RME_INIT_RIPAS_REALM: {
>>> +        struct arm_rme_init_ripas args;
>>> +        void __user *argp = u64_to_user_ptr(cap->args[1]);
>>> +
>>> +        if (copy_from_user(&args, argp, sizeof(args))) {
>>> +            r = -EFAULT;
>>> +            break;
>>> +        }
>>> +
>>> +        r = kvm_init_ipa_range_realm(kvm, &args);
>>> +        break;
>>> +    }
>>>        default:
>>>            r = -EINVAL;
>>>            break;
>>
>> Thanks,
>> Gavin
>>
> 

