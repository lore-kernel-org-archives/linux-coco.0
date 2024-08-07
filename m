Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063B41E672B
	for <linux-coco@lists.linux.dev>; Wed,  7 Aug 2024 12:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034602; cv=none; b=gZvTaFoxxBDciywmZIURiLKxZNGof1r/rx4dCERXf+e1BZA8fy9MexsQa0cG6OtTFTV2e/WwrxOaC102GchejByG7oHRXZQMRl3nCey4Eh8+QIb/nVn9uoQxTh6wF5bxLzrHcyNYglb91Yg+AzY2zbzuA2XK9bEhJzt4WeXIRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034602; c=relaxed/simple;
	bh=jUOkcgallepVd1Ev/LGlVFW1XDyGdrE/xmCunCUvWg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mYeNYOpulg+a3WV8isCVWXsaC403HRGpLk/6wpGHEgwb1+aBtQzNqgQJycecM18/D4QTL3YJf+Ycpi0cUAJjyQHTWBU4szO0A2eyhiTKbsmlKVhfWXyHuRRO5bLlnc1p7UjfK5SBSuHSakcOPGHkGzD2eGBryAPiGRxSOBABZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA574FEC;
	Wed,  7 Aug 2024 05:43:44 -0700 (PDT)
Received: from [10.57.67.188] (unknown [10.57.67.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99AD83F5A1;
	Wed,  7 Aug 2024 05:43:17 -0700 (PDT)
Message-ID: <685c5f13-439f-46eb-8d61-aa1d476b69a1@arm.com>
Date: Wed, 7 Aug 2024 13:43:16 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Will Deacon <will@kernel.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Sudeep Holla
 <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Steven Price <steven.price@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org> <yq5ar0b9tyib.fsf@kernel.org>
 <20240731155045.GA3296@willie-the-truck>
 <6812b889-7002-4615-854d-07e386cba416@arm.com>
In-Reply-To: <6812b889-7002-4615-854d-07e386cba416@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/08/2024 16:30, Suzuki K Poulose wrote:
> On 31/07/2024 16:50, Will Deacon wrote:
>> On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
>>> Will Deacon <will@kernel.org> writes:
>>>
>>>> From: Marc Zyngier <maz@kernel.org>
>>>>
>>>> arm64 will soon require its own callback to initialise services
>>>> that are only available on this architecture. Introduce a hook
>>>> that can be overloaded by the architecture.
>>>>
>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>> Signed-off-by: Will Deacon <will@kernel.org>
>>>> ---
>>>>   arch/arm/include/asm/hypervisor.h   | 2 ++
>>>>   arch/arm64/include/asm/hypervisor.h | 4 ++++
>>>>   drivers/firmware/smccc/kvm_guest.c  | 2 ++
>>>>   3 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm/include/asm/hypervisor.h 
>>>> b/arch/arm/include/asm/hypervisor.h
>>>> index bd61502b9715..8a648e506540 100644
>>>> --- a/arch/arm/include/asm/hypervisor.h
>>>> +++ b/arch/arm/include/asm/hypervisor.h
>>>> @@ -7,4 +7,6 @@
>>>>   void kvm_init_hyp_services(void);
>>>>   bool kvm_arm_hyp_service_available(u32 func_id);
>>>> +static inline void kvm_arch_init_hyp_services(void) { };
>>>> +
>>>>   #endif
>>>> diff --git a/arch/arm64/include/asm/hypervisor.h 
>>>> b/arch/arm64/include/asm/hypervisor.h
>>>> index 0ae427f352c8..8cab2ab535b7 100644
>>>> --- a/arch/arm64/include/asm/hypervisor.h
>>>> +++ b/arch/arm64/include/asm/hypervisor.h
>>>> @@ -7,4 +7,8 @@
>>>>   void kvm_init_hyp_services(void);
>>>>   bool kvm_arm_hyp_service_available(u32 func_id);
>>>> +static inline void kvm_arch_init_hyp_services(void)
>>>> +{
>>>> +};
>>>> +
>>>>   #endif
>>>> diff --git a/drivers/firmware/smccc/kvm_guest.c 
>>>> b/drivers/firmware/smccc/kvm_guest.c
>>>> index 89a68e7eeaa6..f3319be20b36 100644
>>>> --- a/drivers/firmware/smccc/kvm_guest.c
>>>> +++ b/drivers/firmware/smccc/kvm_guest.c
>>>> @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
>>>>       pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 
>>>> 0x%08lx)\n",
>>>>            res.a3, res.a2, res.a1, res.a0);
>>>> +
>>>> +    kvm_arch_init_hyp_services();
>>>>   }
>>>>
>>>
>>> That is a bit late to detect RMM? One of the requirements is to
>>> figure out the pgprot_t flags for early_ioremap so that "earlycon" will
>>> work (by mapping the address as shared alias). To do that we need to
>>> make an RSI call to detect PROT_NS_SHARED mask as below.
>>>
>>>     if (rsi_get_realm_config(&config))
>>>         return;
>>>     prot_ns_shared = BIT(config.ipa_bits - 1);
>>
>> Why can't the earlycon MMIO address just have that high bit set?
> 
> Do you mean the "earlycon=<MMIO-address-to-use>" ? That could work,
> except that :
> 1. It breaks the Realm's view of the {I}"PA" space
> 2. If the address is missed, it is fatal for the Realm.
> 3. All higher level tools that specify the command line parameter now
>     need to fixup the "MMIO" address, based on the "ipa_bits" chosen by
>     the VMM (which could vary with the VMMs and Hyp/System)
> 
> Also, we are making some changes to the guest support to make it future
> proof for running the same guest in a less privileged context within
> R_EL1 (read unprivileged plane with RMM v1.1), where the console
> could be "private". And we are modifying the code to "apply" the prot_ns
> dynamically (instead of hard coding it for all I/O).

Also, forgot to add, we do need this for EFI runtim services where EFI
mapping may need to apply the "Shared" bit for MMIO.


See:

https://lore.kernel.org/all/20240701095505.165383-12-steven.price@arm.com/

Suzuki


> 
> Suzuki
> 
>>
>> I think it's horribly fragile to try detecting all of this stuff before
>> we're allowed to touch the console. We don't even bother with pKVM --
>> it's the guest firmware's responsibility to MMIO_GUARD the UART if it
>> detects a debuggable payload.
>>
>> Will
>>
> 

