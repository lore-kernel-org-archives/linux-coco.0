Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF861175D35
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722613461; cv=none; b=rq4oVHCt8s1RCzYPXODpMfILbfcveitgKfHel4tMHt1cG42fEzzJgRbwCq+2wwPX/3VBGteVJPZVps6yFl1VYS8Aim1iN+zQkQVypeD62tfyvT9yj0RfE5t3JIzGvKgmctOIdkokxwMUZGhkHqDVbQ48ZOzLFmDO2l3G99Z5c1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722613461; c=relaxed/simple;
	bh=XHREq/Unuu4KVKP+3Kajpxn1l7KW/mAFsw0QxklpGGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTA2urgD2xSPZl0e0DJKkYtdU8To32UnAGF+h3vnQvEYP3Rr5k7bdsgX5LNeHGakSwTA7Ui+CJJ6o5pm6lB+vOB0xomrqgYhg/ZXXL09xbvU6uma6JvrWj1Zb3QYBFy9adKEHObQcdbMZQ/YzY8SumKIyZymuBgquXM24qHI19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6262FC32782;
	Fri,  2 Aug 2024 15:44:19 +0000 (UTC)
Date: Fri, 2 Aug 2024 16:44:16 +0100
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
Message-ID: <Zqz-0IosZbF76d0E@arm.com>
References: <20240730151113.1497-1-will@kernel.org>
 <20240730151113.1497-2-will@kernel.org>
 <yq5ar0b9tyib.fsf@kernel.org>
 <20240731155045.GA3296@willie-the-truck>
 <yq5ao76dtv6n.fsf@kernel.org>
 <yq5ale1htv0w.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ale1htv0w.fsf@kernel.org>

On Wed, Jul 31, 2024 at 09:26:31PM +0530, Aneesh Kumar K.V wrote:
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> > Will Deacon <will@kernel.org> writes:
> >> On Wed, Jul 31, 2024 at 08:11:16PM +0530, Aneesh Kumar K.V wrote:
> >>> Will Deacon <will@kernel.org> writes:
> >>> > diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
> >>> > index 89a68e7eeaa6..f3319be20b36 100644
> >>> > --- a/drivers/firmware/smccc/kvm_guest.c
> >>> > +++ b/drivers/firmware/smccc/kvm_guest.c
> >>> > @@ -39,6 +39,8 @@ void __init kvm_init_hyp_services(void)
> >>> >  
> >>> >  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
> >>> >  		 res.a3, res.a2, res.a1, res.a0);
> >>> > +
> >>> > +	kvm_arch_init_hyp_services();
> >>> >  }
> >>> >
> >>> 
> >>> That is a bit late to detect RMM? One of the requirements is to
> >>> figure out the pgprot_t flags for early_ioremap so that "earlycon" will
> >>> work (by mapping the address as shared alias). To do that we need to
> >>> make an RSI call to detect PROT_NS_SHARED mask as below. 
> >>> 
> >>> 	if (rsi_get_realm_config(&config))
> >>> 		return;
> >>> 	prot_ns_shared = BIT(config.ipa_bits - 1);
> >>
> >> Why can't the earlycon MMIO address just have that high bit set?
> >>
> >> I think it's horribly fragile to try detecting all of this stuff before
> >> we're allowed to touch the console. We don't even bother with pKVM --
> >> it's the guest firmware's responsibility to MMIO_GUARD the UART if it
> >> detects a debuggable payload.
> >
> > To mark something shared, we need to know the mask value which is
> > returned via rsi_get_realm_config() call.
> 
> I guess you are suggesting to leave it to firmware to set up the device
> tree "reg-offset" with shared bit set?

As you know, we've been through these options internally and we
concluded not to encode this information in the DT for various reasons.

Personally I don't like this IPA split but that's too late to change it
now in the RMM spec.

-- 
Catalin
