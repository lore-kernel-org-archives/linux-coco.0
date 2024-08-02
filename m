Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D784B175D4B
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612637; cv=none; b=qkuIbjgQNUBcNS15VbZAqwRA6ljLjkLvQ5mdJiT36MNvB/DfecwFkPajc33UD7IxjSx1UUzUAHxoFXHE1K82L0Ssv10h5JN/Mc1epjj/9aiSe7PdUHokj65BrGTluz99zO0sqcekjPeNofEWMungK2KuixE00l1lPMpJkm+vaGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612637; c=relaxed/simple;
	bh=exhk/Jpdgb2Y8VT2Mb2mS4OsFv81ZLSqHmG3NS54Uic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVyDIx5V91cw8YFpVwtlgc+hqYfzZ4dmPlHN4dixF4Lbj13IieRUXhP7TyKA76t1VQc7SdNpH6DjwkIzyTTlrsJhqRZ0pMHPp1AaCvbobxZVM1/JT73PKKipl/eu8jqKESpB45NZyd0CGsoFlvILZeNjK+oHdzJG+QRpiz8cNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7731BDA7;
	Fri,  2 Aug 2024 08:30:59 -0700 (PDT)
Received: from [10.57.95.187] (unknown [10.57.95.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45FBD3F766;
	Fri,  2 Aug 2024 08:30:32 -0700 (PDT)
Message-ID: <6812b889-7002-4615-854d-07e386cba416@arm.com>
Date: Fri, 2 Aug 2024 16:30:30 +0100
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240731155045.GA3296@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2024 16:50, Will Deacon wrote:
> On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
>> Will Deacon <will@kernel.org> writes:
>>
>>> From: Marc Zyngier <maz@kernel.org>
>>>
>>> arm64 will soon require its own callback to initialise services
>>> that are only available on this architecture. Introduce a hook
>>> that can be overloaded by the architecture.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>>   arch/arm/include/asm/hypervisor.h   | 2 ++
>>>   arch/arm64/include/asm/hypervisor.h | 4 ++++
>>>   drivers/firmware/smccc/kvm_guest.c  | 2 ++
>>>   3 files changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
>>> index bd61502b9715..8a648e506540 100644
>>> --- a/arch/arm/include/asm/hypervisor.h
>>> +++ b/arch/arm/include/asm/hypervisor.h
>>> @@ -7,4 +7,6 @@
>>>   void kvm_init_hyp_services(void);
>>>   bool kvm_arm_hyp_service_available(u32 func_id);
>>>   
>>> +static inline void kvm_arch_init_hyp_services(void) { };
>>> +
>>>   #endif
>>> diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
>>> index 0ae427f352c8..8cab2ab535b7 100644
>>> --- a/arch/arm64/include/asm/hypervisor.h
>>> +++ b/arch/arm64/include/asm/hypervisor.h
>>> @@ -7,4 +7,8 @@
>>>   void kvm_init_hyp_services(void);
>>>   bool kvm_arm_hyp_service_available(u32 func_id);
>>>   
>>> +static inline void kvm_arch_init_hyp_services(void)
>>> +{
>>> +};
>>> +
>>>   #endif
>>> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
>>> index 89a68e7eeaa6..f3319be20b36 100644
>>> --- a/drivers/firmware/smccc/kvm_guest.c
>>> +++ b/drivers/firmware/smccc/kvm_guest.c
>>> @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
>>>   
>>>   	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
>>>   		 res.a3, res.a2, res.a1, res.a0);
>>> +
>>> +	kvm_arch_init_hyp_services();
>>>   }
>>>
>>
>> That is a bit late to detect RMM? One of the requirements is to
>> figure out the pgprot_t flags for early_ioremap so that "earlycon" will
>> work (by mapping the address as shared alias). To do that we need to
>> make an RSI call to detect PROT_NS_SHARED mask as below.
>>
>> 	if (rsi_get_realm_config(&config))
>> 		return;
>> 	prot_ns_shared = BIT(config.ipa_bits - 1);
> 
> Why can't the earlycon MMIO address just have that high bit set?

Do you mean the "earlycon=<MMIO-address-to-use>" ? That could work,
except that :
1. It breaks the Realm's view of the {I}"PA" space
2. If the address is missed, it is fatal for the Realm.
3. All higher level tools that specify the command line parameter now
    need to fixup the "MMIO" address, based on the "ipa_bits" chosen by
    the VMM (which could vary with the VMMs and Hyp/System)

Also, we are making some changes to the guest support to make it future
proof for running the same guest in a less privileged context within
R_EL1 (read unprivileged plane with RMM v1.1), where the console
could be "private". And we are modifying the code to "apply" the prot_ns
dynamically (instead of hard coding it for all I/O).

Suzuki

> 
> I think it's horribly fragile to try detecting all of this stuff before
> we're allowed to touch the console. We don't even bother with pKVM --
> it's the guest firmware's responsibility to MMIO_GUARD the UART if it
> detects a debuggable payload.
> 
> Will
> 

