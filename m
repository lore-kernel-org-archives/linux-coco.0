Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA115FD13
	for <linux-coco@lists.linux.dev>; Fri, 23 Aug 2024 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418814; cv=none; b=gkDVs5P5X6KVQk9pphBgACbte87PmNpK7N0456gFCKS4oD55zOeIET//WP9rijcS1dSGh6Oo4JOnvHJD9lqO9S/kCbjt7zsy91tmSYyoF6NUHW+CKu5muUn5FhocyQJ3zI2nRMwSoJi6h/0d94gfJCoV9HD6AlL0wawQI0q7s9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418814; c=relaxed/simple;
	bh=eUPl3EghpfIK03KxkCDx4/r/ZIVGhtwPMOIIp/Sbkqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9CVRQK4pc/0ECF+WV194rT6Bd5gqTUU7Xv19kUXgey2kFjIZSW39OZYpW9o+6/sZFiWoDk6dkrXERnSv0yS6Xj7q/1xBBDPwoiF4eSfvNu2qkfEIpPUzvGytlQ+t2kUxL8+W4ieUBAzRcr6zvpTxWZmBk5zoT6vycBGA6wrNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y40UTMUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y40UTMUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04032C32786;
	Fri, 23 Aug 2024 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724418813;
	bh=eUPl3EghpfIK03KxkCDx4/r/ZIVGhtwPMOIIp/Sbkqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y40UTMUTkIOoN4CjMWJUvviYXOM6aGa+FtIrJESYEAb7z/mjh0O1ytWPQRd/+EOXV
	 xDFFJjx9820RHBjIWNs8An26j4RK7s/AKRT504oCWEDx69WV4mgMUyQMp2XhxWQn8D
	 BZ4upD3hiDvG/tsXjHb5frihJWnLCnXWK2HRh93ZhkfpSfWVtDKyRRZ3Ln4zDm8gyV
	 hMxD/Y1P3+0hraT1hxD3X/pa7fa4+ecA3kxDDt56u+prfwTXG/f0xXXZ7N2kbBLde0
	 C4v6YpHsg3EaaVfcD3TbdVlFz98PmPR8AC6BOgeWYBic2WHXjlPrpohkqR2C5INjB6
	 Mtylk4XFFnaZA==
Date: Fri, 23 Aug 2024 14:13:28 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
Message-ID: <20240823131327.GB32156@willie-the-truck>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org>
 <yq5ar0b9tyib.fsf@kernel.org>
 <20240731155045.GA3296@willie-the-truck>
 <6812b889-7002-4615-854d-07e386cba416@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6812b889-7002-4615-854d-07e386cba416@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 02, 2024 at 04:30:30PM +0100, Suzuki K Poulose wrote:
> On 31/07/2024 16:50, Will Deacon wrote:
> > On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
> > > Will Deacon <will@kernel.org> writes:
> > > 
> > > > From: Marc Zyngier <maz@kernel.org>
> > > > 
> > > > arm64 will soon require its own callback to initialise services
> > > > that are only available on this architecture. Introduce a hook
> > > > that can be overloaded by the architecture.
> > > > 
> > > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > > Signed-off-by: Will Deacon <will@kernel.org>
> > > > ---
> > > >   arch/arm/include/asm/hypervisor.h   | 2 ++
> > > >   arch/arm64/include/asm/hypervisor.h | 4 ++++
> > > >   drivers/firmware/smccc/kvm_guest.c  | 2 ++
> > > >   3 files changed, 8 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/include/asm/hypervisor.h b/arch/arm/include/asm/hypervisor.h
> > > > index bd61502b9715..8a648e506540 100644
> > > > --- a/arch/arm/include/asm/hypervisor.h
> > > > +++ b/arch/arm/include/asm/hypervisor.h
> > > > @@ -7,4 +7,6 @@
> > > >   void kvm_init_hyp_services(void);
> > > >   bool kvm_arm_hyp_service_available(u32 func_id);
> > > > +static inline void kvm_arch_init_hyp_services(void) { };
> > > > +
> > > >   #endif
> > > > diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
> > > > index 0ae427f352c8..8cab2ab535b7 100644
> > > > --- a/arch/arm64/include/asm/hypervisor.h
> > > > +++ b/arch/arm64/include/asm/hypervisor.h
> > > > @@ -7,4 +7,8 @@
> > > >   void kvm_init_hyp_services(void);
> > > >   bool kvm_arm_hyp_service_available(u32 func_id);
> > > > +static inline void kvm_arch_init_hyp_services(void)
> > > > +{
> > > > +};
> > > > +
> > > >   #endif
> > > > diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> > > > index 89a68e7eeaa6..f3319be20b36 100644
> > > > --- a/drivers/firmware/smccc/kvm_guest.c
> > > > +++ b/drivers/firmware/smccc/kvm_guest.c
> > > > @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
> > > >   	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
> > > >   		 res.a3, res.a2, res.a1, res.a0);
> > > > +
> > > > +	kvm_arch_init_hyp_services();
> > > >   }
> > > > 
> > > 
> > > That is a bit late to detect RMM? One of the requirements is to
> > > figure out the pgprot_t flags for early_ioremap so that "earlycon" will
> > > work (by mapping the address as shared alias). To do that we need to
> > > make an RSI call to detect PROT_NS_SHARED mask as below.
> > > 
> > > 	if (rsi_get_realm_config(&config))
> > > 		return;
> > > 	prot_ns_shared = BIT(config.ipa_bits - 1);
> > 
> > Why can't the earlycon MMIO address just have that high bit set?
> 
> Do you mean the "earlycon=<MMIO-address-to-use>" ? That could work,
> except that :
> 1. It breaks the Realm's view of the {I}"PA" space

Breaks in what sense? It won't work?

> 2. If the address is missed, it is fatal for the Realm.

If earlycon= has broken/missing addresses, it's going to be fatal for
whoever is consuming it anyway, no?

> 3. All higher level tools that specify the command line parameter now
>    need to fixup the "MMIO" address, based on the "ipa_bits" chosen by
>    the VMM (which could vary with the VMMs and Hyp/System)

Should be fine for earlycon, though?

If not, then perhaps the RSI should include calls for putchar() so that
earlycon can be implemented using a service rather than trying to use
MMIO with a bunch of awkward caveats.

Will
