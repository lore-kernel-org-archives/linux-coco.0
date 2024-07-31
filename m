Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FAB1B29C6
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434118; cv=none; b=cdXTFMqqpvC6FegQ0GzPnp3CflDkMFEs+dTYZQO14GceY88cE3WchwAxs3sUJF0sTnU33BvO1KMOP8VaTADKp6nEBa5D9//TSrMUYxsio2wncb3s3mDZdR8Xfug4uc7xdoO4RiKTNiXmZh1ibfEyK1n3kpL1i2I7WUreY7hwblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434118; c=relaxed/simple;
	bh=Kf1cT5XmjOjJLAl2ZlZCAvOxxJIm/WN70X2OxQoDjLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjeeL/Vh6WHMEpTvbHc7dh+01r/5FAao8EtBaqF71T8snnmSqWWRXKIaQwwCWMg3YhbwsTFCHN3rgIW9lu8gwLLRuAXN+1RDQoWcH15S6bIEJaT3BeSc9JXO2KygVtl1e7hKuPfl/RayR3UlStu68u2RTcET2hReqdN3lWj0pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CE8D1007;
	Wed, 31 Jul 2024 06:55:41 -0700 (PDT)
Received: from [10.57.94.83] (unknown [10.57.94.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B0813F5A1;
	Wed, 31 Jul 2024 06:55:14 -0700 (PDT)
Message-ID: <7bbe63b9-339f-4a67-bde6-1a5f01da36a4@arm.com>
Date: Wed, 31 Jul 2024 14:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Support for running as a pKVM protected guest
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Steven Price <steven.price@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
References: <20240730151113.1497-1-will@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240730151113.1497-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Will,

On 30/07/2024 16:11, Will Deacon wrote:
> Hi folks,
> 
> Since the patches for running as a CCA guest were posted already at [1],
> I figured it was worth posting the equivalent pKVM changes needed to run
> as a protected guest under an Android host kernel. In particular, I've
> tried to structure the code so that the CCA patches can use the same
> hooks. I'd welcome feedback from the CCA developers (i.e. Steven and
> Suzuki) as to whether this is sufficient.

Thanks for the patches ! The hooks for set_memory_*crypted() and the
ioremap_prot() looks fitting for the CCA support. We will cherry pick
those and base our next version on it. On a side note, this doesn't
solve the "fixmap" for earlycon. Hopefully, we can push something
based on this in the coming weeks.

Kind regards
Suzuki

> 
> There are also some pKVM-specific details which are worth discussion:
> 
>    * I've kept the code compatible with Android, so these patches allow
>      an upstream kernel to run as a protected guest on a production
>      (unlocked) Android device. This seemed like a good property for v1,
>      but I'm happy to break compatibility if folks prefer a cleaner
>      interface (e.g. using consecutive hypercall numbers).
> 
>    * I've included only the hypercalls that are necessary for a
>      functioning guest. Android has some others, but I'd prefer to land
>      the host support upstream before we expose optional interfaces as
>      ABI.
> 
>    * For now, the stage-2 page size cannot be larger than the guest
>      stage-1 page size otherwise the guest will fail to boot.
> 
>    * I don't forcefully configure SWIOTLB, as we rely on Restricted DMA
>      pools (CONFIG_DMA_RESTRICTED_POOL) for devices that need it.
> 
> I also pushed a branch at [2] based on -rc1.
> 
> Cheers,
> 
> Will
> 
> [1] https://lore.kernel.org/r/20240701095505.165383-1-steven.price@arm.com
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-guest
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Suzuki Poulose <suzuki.poulose@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-coco@lists.linux.dev
> 
> --->8
> 
> Marc Zyngier (1):
>    firmware/smccc: Call arch-specific hook on discovering KVM services
> 
> Will Deacon (5):
>    drivers/virt: pkvm: Add initial support for running as a protected
>      guest
>    arm64: mm: Add top-level dispatcher for internal mem_encrypt API
>    drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
>    arm64: mm: Add confidential computing hook to ioremap_prot()
>    drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall
> 
>   Documentation/virt/kvm/arm/hypercalls.rst     |  98 ++++++++++++++
>   arch/arm/include/asm/hypervisor.h             |   2 +
>   arch/arm64/Kconfig                            |   1 +
>   arch/arm64/include/asm/hypervisor.h           |  11 ++
>   arch/arm64/include/asm/io.h                   |   4 +
>   arch/arm64/include/asm/mem_encrypt.h          |  15 +++
>   arch/arm64/include/asm/set_memory.h           |   1 +
>   arch/arm64/mm/Makefile                        |   2 +-
>   arch/arm64/mm/ioremap.c                       |  23 +++-
>   arch/arm64/mm/mem_encrypt.c                   |  50 +++++++
>   drivers/firmware/smccc/kvm_guest.c            |   2 +
>   drivers/virt/coco/Kconfig                     |   2 +
>   drivers/virt/coco/Makefile                    |   1 +
>   drivers/virt/coco/pkvm-guest/Kconfig          |  10 ++
>   drivers/virt/coco/pkvm-guest/Makefile         |   2 +
>   drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 127 ++++++++++++++++++
>   include/linux/arm-smccc.h                     |  28 ++++
>   17 files changed, 377 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm64/include/asm/mem_encrypt.h
>   create mode 100644 arch/arm64/mm/mem_encrypt.c
>   create mode 100644 drivers/virt/coco/pkvm-guest/Kconfig
>   create mode 100644 drivers/virt/coco/pkvm-guest/Makefile
>   create mode 100644 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> 

