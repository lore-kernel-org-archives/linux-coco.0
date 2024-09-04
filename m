Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7D1CF28F
	for <linux-coco@lists.linux.dev>; Wed,  4 Sep 2024 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452994; cv=none; b=gSX6BVlRPpfNHB4izwiaOKOxRWenahcT+mDqwQnWo2yT/qJdKJ1HoqXUPO1ku+B3v8mtCi4oN2Rbk0xKfG+gQ9Vltlv/O67M3mfF9c41Z/77HYYQm5w21g9wQUWgaF45kfuWoAh1mZmQZapav9fpSpXHvh5aZB9XnNmj8drf/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452994; c=relaxed/simple;
	bh=ywrrvWGMOTGS+YcrhqzeKRqIPvwsjsNTnVgiKZAIX6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN2tI/991+7kkPuOTk/5Kym4IsJfGlI7sVKIPM/j8ifIeFgMceNxICGTlfFkHjq71k/ydlpXl27HE4jWLCVR1LiHbuTpjHk0JLmF6YDJFwOL2gXpUAZnK5mWvRtnMhydi/hoJKFSslmjVGsHBs1Xu/wLpnCbABQ14q+D87OR110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPWQiTaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPWQiTaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4A8C4CEC8;
	Wed,  4 Sep 2024 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725452994;
	bh=ywrrvWGMOTGS+YcrhqzeKRqIPvwsjsNTnVgiKZAIX6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPWQiTaO5s8P0ZjSqzA0bUwrXTUqj5r5mUo16ge5GurjvEDTLHbnHDTYIl6fg11Nb
	 tqRChBxU2jmgwnYRYUOEHFyCQvo8tUE+qVSnpgadnab/s4OXoAFceI8KJuUk/Rt9uN
	 sG232kEDccAQajm+dE68HNuGj8di3S+sUoEsbcOJ8rigdUZvXJSLrbulbXzI3MDfdH
	 xepfarbUV1XbWfsArJPRlbbcsgw1OxyEg6ftumb+YduO3W+1d7ix4L+YqFNnFunsfu
	 X3qjRKolTGyz6ngclxLuHaOBDcva451jiRY4M4jbbuZF00mk6fPPM+2dSfQyoUZTqd
	 Eg0NIFrr2BD+Q==
Date: Wed, 4 Sep 2024 13:29:48 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 5/7] arm64: mm: Add confidential computing hook to
 ioremap_prot()
Message-ID: <20240904122948.GF13550@willie-the-truck>
References: <20240830130150.8568-1-will@kernel.org>
 <20240830130150.8568-6-will@kernel.org>
 <ZtYNPQnP5_YEiLy5@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtYNPQnP5_YEiLy5@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Sep 02, 2024 at 08:08:45PM +0100, Catalin Marinas wrote:
> On Fri, Aug 30, 2024 at 02:01:48PM +0100, Will Deacon wrote:
> > @@ -16,7 +28,16 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
> >  	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
> >  		return NULL;
> >  
> > -	return generic_ioremap_prot(phys_addr, size, __pgprot(prot));
> > +	/*
> > +	 * If a hook is registered (e.g. for confidential computing
> > +	 * purposes), call that now and barf if it fails.
> > +	 */
> > +	if (unlikely(ioremap_prot_hook) &&
> > +	    WARN_ON(ioremap_prot_hook(phys_addr, size, &pgprot))) {
> > +		return NULL;
> > +	}
> > +
> > +	return generic_ioremap_prot(phys_addr, size, pgprot);
> >  }
> >  EXPORT_SYMBOL(ioremap_prot);
> 
> I mentioned on the CCA series, the patch is all good but we may need
> something similar for io_remap_pfn_range() which uses
> pgprot_decrypted() (I think it mostly matters for the pKVM case).

Thanks for pointing this out.

We've not needed this on Android yet, but I think that it would be
pretty straightforward to add with an arm64 definition of
io_remap_pfn_range(). I'd just prefer to leave that until we know that
we need it -- in all likelihood a driver would MMIO_GUARD the resources
as part of its own ioremap() before remapping into userspace.

Will
