Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F123AE9B
	for <linux-coco@lists.linux.dev>; Sat,  2 Aug 2025 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754142119; cv=none; b=AZeNqBBUdxhZARpmQpP2HcFoUa/Ub0Jn4hqF0Aan/Cv8v+xCVwge884dJ7MYcLAT/GkORncmoRDu6TCuFz+wg22J92N8uOevrUKS3Ixt6uwMQjCzpOgqr20/fcNoPNtmjZghkaYp9NrxE18Prumad4wxgwUhQuIyN/fvqhbDhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754142119; c=relaxed/simple;
	bh=A3twgw+3GWVYYFsSIocE5ftAItdu/FBceRJG47y6ZNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAq3RHCj9j+F2gNNbrwiPH/zCB0D1a0YnNnXP6cmzzvdwYWc0QY9zPPcXBgeSl7pGpmk8xmYAnSKuxnBdwWPtTFwy64TE9v0RSWNF8341rR8GkEZPgMDglO+k2LtA+/XuPvh5tZTnA8A7GAv8Y81NfrwRFQKmcIxL8xOro+VT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=R+rP3Ys0; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="R+rP3Ys0"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab8403b6daso27204351cf.2
        for <linux-coco@lists.linux.dev>; Sat, 02 Aug 2025 06:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754142116; x=1754746916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQYB2j5N3eZBI44lsWtNzt2CVeD9f75v+QDgKG5n1yk=;
        b=R+rP3Ys0tLaqlZfAEWqjWjNmFEpd+nqhizMeUWTyiiLXVR4JK9S5Qu8JBXRQjXQfkI
         8y+zV7Eqh0cZe+HVjd+x0QUHoebXFBYgvDtKPjO3mUBLYh0rmoiAGP2n8pzVKgi7BOSb
         jDwbB0swXJeRECgzSmW+fIt+YlF6+UvuL3TXwKfMXoNpXNbXVj9PuranIjUk40jt7i7a
         uEkBBKM9GOvvRtqmIaY2xsT3e9mDHUIN6VO8vhAlKsg2ApWlzOM8AtZotPJvb+YiOldQ
         JNXqUSBPa6VZM8SJPNGpOOq//jRC74/Y1C9gy2gtRdh3Gkrd40/WXppcE2SxnUNle0B/
         ffvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754142116; x=1754746916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQYB2j5N3eZBI44lsWtNzt2CVeD9f75v+QDgKG5n1yk=;
        b=wF1bV5eq79spDNR3N23zA6OONCa/EgBFV0WwjXH0O0x3VAtl8iSh6jNCxRQszf3s0J
         PMWh0U8coEcak5WOAlJ6m1F6d9j3yc/XXOK9Lpgdplwb84bAj6wJf9MkWgyDm0HU5cI7
         6zOxQCl7OePi6daF0B8c64P5FCfqzb4HHHROseQ5qkvRtr94GtHQOxpURlKaFyNazBur
         Ifkbg60o3u/SdbvbqK4SgMS+MoJ/pWpftgzwphx93/VPsi9ANuj7aXW8HJ8/Y14KcCoX
         5zdJdliLBPumAe9/GSqgMtDD2z7lM9ArC46CGZXgTkLS2SaYl5xDoJfWucH24xjgzVsP
         JP8Q==
X-Gm-Message-State: AOJu0YzkIOkFmtfw6jcLELpwd+sFu2SYzTMVfOzi04tE5YkYafEqaSda
	Vv6CyzMxTppS86hpxCaEjHdO/7w/nAvZg4EbCXG4G/xqyC123NAxO1aDA/9W2J9DqME=
X-Gm-Gg: ASbGncus8ovbdxidJEagEwnnWzn7m7pwo6TZgCCUoZuJOLxeFH2R5iFcaneMTw1slla
	dy4AsJP0DUq4RTkNpdCOTyXvfziend8794V2aqVx4F94fh73E7SnRhBQwLBFnXFM7xqiTqytVx/
	YVtyjlDfpfm/849ZZardlV4IuajhuAyQrrTVjp2hhncGDuevoguVk1HrX9q6oYp5x7u7DWygTpL
	keXC08HnNOlW6PbJS6UnaswpF8hAqkpoLlaBHmfCsKtSDYZJAAfVq2/ir1RiMXwcDg1TeXOX/AD
	tNKyWWBEjS0H5HZYz9Bh4yIWNzUi/+osQBo/ZcuEuW4gpgiN32W1T3Qnj4rsRJYHMiuQCrLCpyY
	I4QBYQe65LD7VkbATfTtudm91FJ7Lw5nE2axoUtTe+PhbVlnHCMX4Qorm6qRmT91IseDgI1iuf5
	8908c=
X-Google-Smtp-Source: AGHT+IH9zuh0IwBkoewvGIgO8/CED1zpnPpU3SJpI3mT+2sTUv+6/McJoV9dw9ylKlFlqAeQzA5i+Q==
X-Received: by 2002:ac8:5a86:0:b0:4ab:5c2d:fb25 with SMTP id d75a77b69052e-4af109b48d1mr49979041cf.19.1754142116061;
        Sat, 02 Aug 2025 06:41:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aeeedb0403sm30889761cf.47.2025.08.02.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 06:41:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uiCUk-00000001A2v-3YjF;
	Sat, 02 Aug 2025 10:41:54 -0300
Date: Sat, 2 Aug 2025 10:41:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <20250802134154.GI26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <20250728143318.GD26511@ziepe.ca>
 <yq5a5xfbbe35.fsf@kernel.org>
 <20250729143339.GH26511@ziepe.ca>
 <yq5aikj69kpn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aikj69kpn.fsf@kernel.org>

On Sat, Aug 02, 2025 at 02:14:20PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Jul 29, 2025 at 01:53:10PM +0530, Aneesh Kumar K.V wrote:
> >> Jason Gunthorpe <jgg@ziepe.ca> writes:
> >> 
> >> > On Mon, Jul 28, 2025 at 07:21:41PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >> @@ -48,3 +49,12 @@ int set_memory_decrypted(unsigned long addr, int numpages)
> >> >>  	return crypt_ops->decrypt(addr, numpages);
> >> >>  }
> >> >>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
> >> >> +
> >> >> +bool force_dma_unencrypted(struct device *dev)
> >> >> +{
> >> >> +	if (dev->tdi_enabled)
> >> >> +		return false;
> >> >
> >> > Is this OK? I see code like this:
> >> >
> >> > static inline dma_addr_t phys_to_dma_direct(struct device *dev,
> >> > 		phys_addr_t phys)
> >> > {
> >> > 	if (force_dma_unencrypted(dev))
> >> > 		return phys_to_dma_unencrypted(dev, phys);
> >> > 	return phys_to_dma(dev, phys);
> >> >
> >> > What are the ARM rules for generating dma addreses?
> >> >
> >> > 1) Device is T=0, memory is unencrypted, call dma_addr_unencrypted()
> >> >    and do "top bit IBA set"
> >> >
> >> > 2) Device is T=1, memory is encrypted, use the phys_to_dma() normally
> >> >
> >> > 3) Device it T=1, memory is uncrypted, use the phys_to_dma()
> >> >    normally??? Seems odd, I would have guessed the DMA address sould
> >> >    be the same as case #1?
> >> >
> >> > Can you document this in a comment?
> >> >
> >> 
> >> If a device is operating in secure mode (T=1), it is currently assumed
> >> that only access to private (encrypted) memory is supported.
> >
> > No, this is no how the PCI specs were written as far as I
> > understand. The XT bit thing is supposed to add more fine grained
> > device side control over what memory the DMA can target. T alone does
> > not do that.
> >
> >> It is unclear whether devices would need to perform DMA to shared
> >> (unencrypted) memory while operating in this mode, as TLPs with T=1
> >> are generally expected to target private memory.
> >
> > PCI SIG supports it, kernel should support it.
> >
> 
> Would we also need a separate DMA allocation API for allocating
> addresses intended to be shared with the non-secure hypervisor?
> 
> Are there any existing drivers in the kernel that already require such
> shared allocations, which I could use as a reference?

The most likely case in the near term is PCI P2P to shared MMIO.

I don't know any way to allocate shared memory in a driver??

At the bare minimum this patch should be documenting the correct
architecture and outlining any gaps in the current implementation.

I also don't really understand what the above code is even
doing.. Isn't the design on ARM that the IPA always encodes the
shared/private in the top bit?

How do we get a shared page that does not already have a phys_addr_t
in the shared IPA? Shouldn't the kernel have switched to the shared
IPA alias when it returned the swiotlb buffer? eg why do we need to do:

#define dma_addr_unencrypted(x)		((x) | PROT_NS_SHARED)

At all?

Suzuki ?

Jason
