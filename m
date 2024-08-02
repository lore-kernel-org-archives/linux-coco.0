Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D02101AE
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722611643; cv=none; b=sGmype3KMRSShVgo8R9a3d2V3T929OSyYyAD3GiRc/vf2z+kcB1ObG0/FHIiJwnOVpi3DkxRhKAICRdnu3/jTV74wdarDnu/7qFdzTDiqGx9Jt0Ozja7F1belOzlhQ51mXNmSrARIhIzjjnpBAOtYQd6oqBlmJsATWC8+VVBn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722611643; c=relaxed/simple;
	bh=Onp+bDqV+mVw+X0za0GKkDKhytlXClc7CGWb4zE2mbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvUIxz3mEvwrlNjDuuZu0eYF8K8PxLG4Yf2NmIACRV+3hSidnP2YSA+xsrs41gGM4cl3c2aTTp8rpuzT9O+zA4dekpIOQ8ROisHu9XEXlvlcc/1SX8CCkIVEeL1E89JkLY7BGaJik6KDcSFhF3wp2yRGHys6AF2350RqhKKRGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50663C4AF0B;
	Fri,  2 Aug 2024 15:14:01 +0000 (UTC)
Date: Fri, 2 Aug 2024 16:13:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/6] firmware/smccc: Call arch-specific hook on
 discovering KVM services
Message-ID: <Zqz3t0vNwmCj1cJT@arm.com>
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

On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
> Will Deacon <will@kernel.org> writes:
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
> 
> That is a bit late to detect RMM?

It may be late for RMM but I'm not sure that's relevant. This function
is about KVM services provided to a guest. The RMM is meant (in theory
at least) to be hypervisor-agnostic. We shouldn't place any realm guest
initialisation in the kvm_guest.c file.

-- 
Catalin
