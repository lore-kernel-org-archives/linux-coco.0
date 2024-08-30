Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF2D192D6A
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025981; cv=none; b=h5vCaRWOORBrAv4vdCi0mj/OG4vqW6x11kRMTwzofsuevm6KkzopMxJtc+MN74v6Y+DSmX5+P3DyjRZUAYfibyhzIMr1zwvdoW1H0OL1cdcLSokwq9Uecar1BsBJ78Ou1dyV9W1QRxg6uFnH6T7JGHxOkvm7bH9hBRsVuwdRso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025981; c=relaxed/simple;
	bh=MNi1Fy5rMh2qADRXbv3To1NiBq40mwW4RSHJw8TnCkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXeOZpciTa5FNrzT/Au0/izyJ5nDqh//v3Vrgm/fK43tZfA1ww/Ycskjf0yQrYfxzlrnvuJkkIfbUZOTUQMg/NwtAkY3fF/ynoIKT27Mqaw6qgpy87M54MxufSFKtmEjBU4TREm+WoRqFBBX60KVkv3oeP5EkSUNkwuWOud0p6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2DEC1063;
	Fri, 30 Aug 2024 06:53:24 -0700 (PDT)
Received: from [10.1.30.22] (e122027.cambridge.arm.com [10.1.30.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2E873F762;
	Fri, 30 Aug 2024 06:52:56 -0700 (PDT)
Message-ID: <0b672910-34c0-4ed0-8828-c06571737e72@arm.com>
Date: Fri, 30 Aug 2024 14:52:54 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Support for running as a pKVM protected guest
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Suzuki Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 linux-coco@lists.linux.dev
References: <20240830130150.8568-1-will@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240830130150.8568-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2024 14:01, Will Deacon wrote:
> Hi all,
> 
> This is version two of the series previously posted here:
> 
>   https://lore.kernel.org/r/20240730151113.1497-1-will@kernel.org
> 
> Changes since v1:
>   * New patch allocating additional hypercalls for future pKVM usage
> 
> It looks like the CCA series is now using some of the pieces here [1],
> so it would be great to merge this with an Ack from the kvmarm
> maintainers.

Indeed, for what it's worth, patches 3 and 5 are both:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> Cheers,
> 
> Will
> 
> [1] https://lore.kernel.org/r/20240819131924.372366-1-steven.price@arm.com
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
>   firmware/smccc: Call arch-specific hook on discovering KVM services
> 
> Will Deacon (6):
>   drivers/virt: pkvm: Add initial support for running as a protected
>     guest
>   arm64: mm: Add top-level dispatcher for internal mem_encrypt API
>   drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
>   arm64: mm: Add confidential computing hook to ioremap_prot()
>   drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall
>   arm64: smccc: Reserve block of KVM "vendor" services for pKVM
>     hypercalls
> 
>  Documentation/virt/kvm/arm/hypercalls.rst     |  98 ++++++++++++++
>  arch/arm/include/asm/hypervisor.h             |   2 +
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/hypervisor.h           |  11 ++
>  arch/arm64/include/asm/io.h                   |   4 +
>  arch/arm64/include/asm/mem_encrypt.h          |  15 +++
>  arch/arm64/include/asm/set_memory.h           |   1 +
>  arch/arm64/mm/Makefile                        |   2 +-
>  arch/arm64/mm/ioremap.c                       |  23 +++-
>  arch/arm64/mm/mem_encrypt.c                   |  50 +++++++
>  drivers/firmware/smccc/kvm_guest.c            |   2 +
>  drivers/virt/coco/Kconfig                     |   2 +
>  drivers/virt/coco/Makefile                    |   1 +
>  drivers/virt/coco/pkvm-guest/Kconfig          |  10 ++
>  drivers/virt/coco/pkvm-guest/Makefile         |   2 +
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 127 ++++++++++++++++++
>  include/linux/arm-smccc.h                     |  88 ++++++++++++
>  17 files changed, 437 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/include/asm/mem_encrypt.h
>  create mode 100644 arch/arm64/mm/mem_encrypt.c
>  create mode 100644 drivers/virt/coco/pkvm-guest/Kconfig
>  create mode 100644 drivers/virt/coco/pkvm-guest/Makefile
>  create mode 100644 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> 

