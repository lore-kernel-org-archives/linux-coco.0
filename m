Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E289189537
	for <linux-coco@lists.linux.dev>; Fri, 23 Aug 2024 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427721; cv=none; b=iomDEdi25Dq5Ezysbl0/GiNV+NVTINFk4QLp/9zTMnvKQQ9JDSWVTcCCiL0XJJIgKJsxteCfKyISgbSecrEJFz7Fi5kamDhp8/O6uONrljHkBSDeCUSfuH6O8f+KYrIWr7qrO/AzT+OB7rjTs+ZHj6E5+Fxxrwc11nF2dtGg1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427721; c=relaxed/simple;
	bh=d2lLjaWZ8rtPGJTc9ht9/ixiuFYJdf8ks42GV3rz1sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJrm/W/Mg11kvmIthW8kPfgbKrjzHobrqpNmQ+bnlaAxtqnqS6ynzQSl4FNlzbF56B0i7DlarniCJuA1kDW9VB9qczNWVhk+lpr+UkECbdROL47if2P61EINhWmICrmfL70peLTKKBWT47haTslRvlz+z1S9Og6EpxLek9w2sjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxzKJi6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxzKJi6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30332C4AF09;
	Fri, 23 Aug 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724427720;
	bh=d2lLjaWZ8rtPGJTc9ht9/ixiuFYJdf8ks42GV3rz1sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxzKJi6V6BzhQ27x9+HwbeT/ltGXiSmpBaS3qfA4TEjAa3hDjQQpgtpEeXiFoDoNG
	 zbM7TQFr9+4uarb7U8gQcZ28HIu+svtyTBFmZBI8Q8FZZVei8D/oPSJnzDpFESRbRl
	 0N+BIA4WKL68tbA5RohzGvyYX+ohPjOJs7jU3QAuk3B9+F36uHJqU1doTh9uqNAPzW
	 Wrdf34NYb5x3urLdZDIWNk6qRbsGH3dfCelXcYy5HX733/HN5i3HKVtnlDN6U/oGPy
	 sCrZN00nt/h4PT2tXEiWhstukRJeoFTwyADQ7ryHWauR73Yr2/DJ5WXaU0AOS9YFwB
	 cs0LFNM83T6aA==
Date: Fri, 23 Aug 2024 16:41:55 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/6] drivers/virt: pkvm: Hook up mem_encrypt API using
 pKVM hypercalls
Message-ID: <20240823154155.GB525@willie-the-truck>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-5-will@kernel.org>
 <86a5h5yg5y.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a5h5yg5y.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marc,

On Wed, Aug 21, 2024 at 05:49:45PM +0100, Marc Zyngier wrote:
> On Tue, 30 Jul 2024 16:11:10 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > If we detect the presence of pKVM's SHARE and UNSHARE hypercalls, then
> > register a backend implementation of the mem_encrypt API so that things
> > like DMA buffers can be shared appropriately with the host.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  Documentation/virt/kvm/arm/hypercalls.rst     | 50 +++++++++++++++++
> >  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 55 +++++++++++++++++++
> >  include/linux/arm-smccc.h                     | 14 +++++
> >  3 files changed, 119 insertions(+)
> > 
> 
> [...]
> 
> > diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> > index 16b6dcc54e02..9cb7c95920b0 100644
> > --- a/include/linux/arm-smccc.h
> > +++ b/include/linux/arm-smccc.h
> > @@ -116,6 +116,8 @@
> >  #define ARM_SMCCC_KVM_FUNC_FEATURES		0
> >  #define ARM_SMCCC_KVM_FUNC_PTP			1
> >  #define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
> > +#define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
> > +#define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
> >  #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
> >  #define ARM_SMCCC_KVM_NUM_FUNCS			128
> 
> As you will certainly add a bunch of other calls (hopefully soon-ish),
> how about reserving an actual range for those, so that we can
> future-proof the ABI early?
> 
> Grab 64 right away, and we don't have to worry about new stuff for a
> while.
> 
> What do you think?

I think that's incredibly generous. Let's see whether we really need
that to start with...

/me dives into android15-6.6

So we currently allocate 3-11 there and some of those are because we
messed up v1 of a hypercall and had to introduce a new one. I don't plan
to inflict that on upstream, but avoiding conflicts would be good.

The big thing on the horizon is a hypercall-based IOMMU interface which
looks like it will need ~10 new calls. I suppose we could multiplex some
of that, but otherwise 32 would probably do us if you don't want to give
up such a big chunk of the space immediately.

Will
