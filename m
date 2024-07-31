Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB55156CF
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441052; cv=none; b=l/uOuXUKtRE/ieNzkSStGrcCRuVF++3+PlIxFhzAC/mI+i2m7oKfJonVCShT6MZZVl063jBAHxeVZVrE6cKF0fOd0/J1CtfXjJ88+jaTcVov/tzmc+9CSeUy4njpgV02DrggyXq0Um9jn5V2y2bz8Hp9lg8TRuUhmmwC+zFvKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441052; c=relaxed/simple;
	bh=FWkJVy9uvBNaOZOV9mRbbaomEWFm1HAXWT08CghSiiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7J5dPvWLCUaHAaReY5bpON/kYL2+bnhe/0YnFXe0Iv9Yq5c1qTyugqS24txu9Ga+dc5Zj6fWwtF/IfN3dboXomGqnWlhKHxa+R0l27c84y170DFz8FRbGb/8+6fGiXsDFQKVPXNj2ay3ZtlsYjSo5LeO8i1xT5EwYdSfDsYWJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyAQODFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyAQODFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00277C4AF0B;
	Wed, 31 Jul 2024 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722441051;
	bh=FWkJVy9uvBNaOZOV9mRbbaomEWFm1HAXWT08CghSiiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyAQODFz9IL2mfqo5QsjnNaFYd8LmZENKCDu9WiID+9imW37tiqIfRVCSzDbK3hEV
	 5OdSDeD/RF1xUXWd2jVqvhHtkwE28Cy52vmbNSCecTYjrFDhhhXWknSF7W1n34WI/+
	 1sd+q9OxZZituVv+Uf6pVrXLheuzDzZjdU1GY1ID3bVHW835rzs2s1TQwJ2mJXCdT4
	 q+fT4/Owv3M38d783MlU7YwhXOxCU1k/EaW7nHVpd864Z/wEvhUBLFxqRwD+VHZ06p
	 wjbcFfI5xJN8ViEVW+CQou893/lUbfFMYZDKMwoge4ffYN8BdW2NxEUQzOSJwwB387
	 R+hKAXrxk7NCQ==
Date: Wed, 31 Jul 2024 16:50:46 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <20240731155045.GA3296@willie-the-truck>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org>
 <yq5ar0b9tyib.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ar0b9tyib.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
> Will Deacon <will@kernel.org> writes:
> 
> > From: Marc Zyngier <maz@kernel.org>
> >
> > arm64 will soon require its own callback to initialise services
> > that are only available on this architecture. Introduce a hook
> > that can be overloaded by the architecture.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm/include/asm/hypervisor.h   | 2 ++
> >  arch/arm64/include/asm/hypervisor.h | 4 ++++
> >  drivers/firmware/smccc/kvm_guest.c  | 2 ++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
> > index bd61502b9715..8a648e506540 100644
> > --- a/arch/arm/include/asm/hypervisor.h
> > +++ b/arch/arm/include/asm/hypervisor.h
> > @@ -7,4 +7,6 @@
> >  void kvm_init_hyp_services(void);
> >  bool kvm_arm_hyp_service_available(u32 func_id);
> >  
> > +static inline void kvm_arch_init_hyp_services(void) { };
> > +
> >  #endif
> > diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
> > index 0ae427f352c8..8cab2ab535b7 100644
> > --- a/arch/arm64/include/asm/hypervisor.h
> > +++ b/arch/arm64/include/asm/hypervisor.h
> > @@ -7,4 +7,8 @@
> >  void kvm_init_hyp_services(void);
> >  bool kvm_arm_hyp_service_available(u32 func_id);
> >  
> > +static inline void kvm_arch_init_hyp_services(void)
> > +{
> > +};
> > +
> >  #endif
> > diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> > index 89a68e7eeaa6..f3319be20b36 100644
> > --- a/drivers/firmware/smccc/kvm_guest.c
> > +++ b/drivers/firmware/smccc/kvm_guest.c
> > @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
> >  
> >  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
> >  		 res.a3, res.a2, res.a1, res.a0);
> > +
> > +	kvm_arch_init_hyp_services();
> >  }
> >
> 
> That is a bit late to detect RMM? One of the requirements is to
> figure out the pgprot_t flags for early_ioremap so that "earlycon" will
> work (by mapping the address as shared alias). To do that we need to
> make an RSI call to detect PROT_NS_SHARED mask as below. 
> 
> 	if (rsi_get_realm_config(&config))
> 		return;
> 	prot_ns_shared = BIT(config.ipa_bits - 1);

Why can't the earlycon MMIO address just have that high bit set?

I think it's horribly fragile to try detecting all of this stuff before
we're allowed to touch the console. We don't even bother with pKVM --
it's the guest firmware's responsibility to MMIO_GUARD the UART if it
detects a debuggable payload.

Will
