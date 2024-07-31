Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5A1B581F
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441194; cv=none; b=juJn3Y2DvrBcDLDZNLuPhMH2tkCLwf7+ucmyTpNLgZ05+exNTQ6g5vP2P1UT3I3SjGRPJIpp6urJI7z6p/v2QIV2Sq92YhkvVp43FmJnU+mW5zJ8x5oKJ3sdaUQFHR5ybDokT5yBovOVHOZgjRUOiuGMAgyFSZrV79s28yVHMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441194; c=relaxed/simple;
	bh=GiWuXJHUEoAKmVL2TSM7QKFuD/UvLsAiKfix5ofjpGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqIfCuf0NZlvId9brSpp/M8WqS7Vnrca8Ff3ZkFYNg0QhZGFb/9i70FM2wkjw03unqkLFkPLaOpgn9dCLEgmPujyXnSm1n4ItpppWodoLGWjetD1mmHXTm8ClCtxVUoyjIDj2yR/j1lNDZGp9fEwev4bfF0abfp9JeVloIYSbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDEL5s+H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDEL5s+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A6FC4AF09;
	Wed, 31 Jul 2024 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722441194;
	bh=GiWuXJHUEoAKmVL2TSM7QKFuD/UvLsAiKfix5ofjpGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NDEL5s+HOh5f2IKq6KZPwRDZImjyHYYttwer3GYbirMSM8UyZYUbCaOjK8KyoX3Ob
	 ALn83luZ+VtzoQRR0JxZW0gAH6WcSzKNDvW+0wbJSP5iugX6z+w9HreE9xAiogFCEU
	 raoF8d376fVD/pN3/QIvo5FCS0obgTk4aNSI1RFw7CUgFZqrWH0TM8DwkQ6LTfJmaU
	 lsXvf073Z/miZ9s0Z2jw5WOQKqHa/sGPjDu3oC3MRdet0LYNqsADAjpPlYCvCzraWx
	 sjiBK0wUerhD9/6rql80N6W/iaDWYtfRkgzb+vrWkIWhqQrEFhTENkmIe+8Lu3zVTm
	 oNk8fjr3ncGQA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
In-Reply-To: <20240731155045.GA3296@willie-the-truck>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org> <yq5ar0b9tyib.fsf@kernel.org>
 <20240731155045.GA3296@willie-the-truck>
Date: Wed, 31 Jul 2024 21:23:04 +0530
Message-ID: <yq5ao76dtv6n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Will Deacon <will@kernel.org> writes:

> On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
>> Will Deacon <will@kernel.org> writes:
>> 
>> > From: Marc Zyngier <maz@kernel.org>
>> >
>> > arm64 will soon require its own callback to initialise services
>> > that are only available on this architecture. Introduce a hook
>> > that can be overloaded by the architecture.
>> >
>> > Signed-off-by: Marc Zyngier <maz@kernel.org>
>> > Signed-off-by: Will Deacon <will@kernel.org>
>> > ---
>> >  arch/arm/include/asm/hypervisor.h   | 2 ++
>> >  arch/arm64/include/asm/hypervisor.h | 4 ++++
>> >  drivers/firmware/smccc/kvm_guest.c  | 2 ++
>> >  3 files changed, 8 insertions(+)
>> >
>> > diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
>> > index bd61502b9715..8a648e506540 100644
>> > --- a/arch/arm/include/asm/hypervisor.h
>> > +++ b/arch/arm/include/asm/hypervisor.h
>> > @@ -7,4 +7,6 @@
>> >  void kvm_init_hyp_services(void);
>> >  bool kvm_arm_hyp_service_available(u32 func_id);
>> >  
>> > +static inline void kvm_arch_init_hyp_services(void) { };
>> > +
>> >  #endif
>> > diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
>> > index 0ae427f352c8..8cab2ab535b7 100644
>> > --- a/arch/arm64/include/asm/hypervisor.h
>> > +++ b/arch/arm64/include/asm/hypervisor.h
>> > @@ -7,4 +7,8 @@
>> >  void kvm_init_hyp_services(void);
>> >  bool kvm_arm_hyp_service_available(u32 func_id);
>> >  
>> > +static inline void kvm_arch_init_hyp_services(void)
>> > +{
>> > +};
>> > +
>> >  #endif
>> > diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
>> > index 89a68e7eeaa6..f3319be20b36 100644
>> > --- a/drivers/firmware/smccc/kvm_guest.c
>> > +++ b/drivers/firmware/smccc/kvm_guest.c
>> > @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
>> >  
>> >  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
>> >  		 res.a3, res.a2, res.a1, res.a0);
>> > +
>> > +	kvm_arch_init_hyp_services();
>> >  }
>> >
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
>
> I think it's horribly fragile to try detecting all of this stuff before
> we're allowed to touch the console. We don't even bother with pKVM --
> it's the guest firmware's responsibility to MMIO_GUARD the UART if it
> detects a debuggable payload.
>

To mark something shared, we need to know the mask value which is
returned via rsi_get_realm_config() call.

-aneesh
