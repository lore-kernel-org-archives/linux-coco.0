Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77A11BBBC3
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722436886; cv=none; b=R/rCyGB7qMhbG92TynJp1LbSkYlel90bIOyp9LYIkRxc45JVc3clDyegWBJF8JBJtwygqlv41lQnrdoo1NQDvbeyAI9KxrZbB1hX4HpXc704gMjzAE12XXa6ZoXT0DOHmlxTO8HmhhSV5vMSwpQGG2ZLAr2TvhTe4eNSp3Lv+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722436886; c=relaxed/simple;
	bh=kv7SwymjS4VsQEJ49rXdtlWxxjUvag67ZYexouhv3f4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cSRTxoEnBUUlTYaBOmYgm8XBNvKFPQ40TMpyVrsKETzreFDjUXmlpP5O/7a+i1ThhEOtoHJgZg0WMFuXNoxz1tOJuLYu9Ne7yG+62Fy31UoyoUdv3qs2CkvZlth5B0OsxnJFNgDAKPEtHvsOlMDbZubMkqhY/Pkynn9NRz6WPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuoWLeu/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuoWLeu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C812C116B1;
	Wed, 31 Jul 2024 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722436886;
	bh=kv7SwymjS4VsQEJ49rXdtlWxxjUvag67ZYexouhv3f4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YuoWLeu/gjrsYi9lPU6yd4AMB3b89iDCvWYdLQIuahzott5gU51Mq9KY1pudwC61D
	 50gN2zw6uWv2Sw75s/iUTgU2IRY5uqKvRx8PAkc97gY+FPeyWb0pDIUR4jLYWYdh/p
	 wCovZfETn33uqTlvLdAfp7iBWCWpunNkHXP2Z4rYMaZl/6+Ojrn8Y6S8gxIQLK50+3
	 E6OVqNpRT2atfE66qqcOuY7fDBY+BeUMVk/eTtK1N9AKOur7ST2w0QgHhpP8JkqO4X
	 3gfcXFymmdUowNCo69KeWL9TWQOcSo2T2Tc/LE3+qEhjMEgJfwbAJYm/rWQZPyo3cj
	 N7RzW6efBGChw==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
In-Reply-To: <20240730151113.1497-2-will@kernel.org>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org>
Date: Wed, 31 Jul 2024 20:11:16 +0530
Message-ID: <yq5ar0b9tyib.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Will Deacon <will@kernel.org> writes:

> From: Marc Zyngier <maz@kernel.org>
>
> arm64 will soon require its own callback to initialise services
> that are only available on this architecture. Introduce a hook
> that can be overloaded by the architecture.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm/include/asm/hypervisor.h   | 2 ++
>  arch/arm64/include/asm/hypervisor.h | 4 ++++
>  drivers/firmware/smccc/kvm_guest.c  | 2 ++
>  3 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
> index bd61502b9715..8a648e506540 100644
> --- a/arch/arm/include/asm/hypervisor.h
> +++ b/arch/arm/include/asm/hypervisor.h
> @@ -7,4 +7,6 @@
>  void kvm_init_hyp_services(void);
>  bool kvm_arm_hyp_service_available(u32 func_id);
>  
> +static inline void kvm_arch_init_hyp_services(void) { };
> +
>  #endif
> diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
> index 0ae427f352c8..8cab2ab535b7 100644
> --- a/arch/arm64/include/asm/hypervisor.h
> +++ b/arch/arm64/include/asm/hypervisor.h
> @@ -7,4 +7,8 @@
>  void kvm_init_hyp_services(void);
>  bool kvm_arm_hyp_service_available(u32 func_id);
>  
> +static inline void kvm_arch_init_hyp_services(void)
> +{
> +};
> +
>  #endif
> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> index 89a68e7eeaa6..f3319be20b36 100644
> --- a/drivers/firmware/smccc/kvm_guest.c
> +++ b/drivers/firmware/smccc/kvm_guest.c
> @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
>  
>  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
>  		 res.a3, res.a2, res.a1, res.a0);
> +
> +	kvm_arch_init_hyp_services();
>  }
>

That is a bit late to detect RMM? One of the requirements is to
figure out the pgprot_t flags for early_ioremap so that "earlycon" will
work (by mapping the address as shared alias). To do that we need to
make an RSI call to detect PROT_NS_SHARED mask as below. 

	if (rsi_get_realm_config(&config))
		return;
	prot_ns_shared = BIT(config.ipa_bits - 1);

-aneesh 
