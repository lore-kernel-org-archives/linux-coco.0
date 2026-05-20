Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BA2E3397
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284448; cv=none; b=JI6uULWrBKpzjT92gA6pwrZTVJMQwdqiM5Vwj23azfIKazF9/brQDzZXEMBjF/ubMDvbs20tetldVIkGyiYwCJd9a9ak3eElS/srRa28O3bY+AojaSQQdEeaQ9STFd8n8kc0z4Z8a84cECJmafSRlUKB4dz+vZGfOtXjWNEz78o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284448; c=relaxed/simple;
	bh=gECXMGpw9B7sH8oWBrgJbLY+YztieOR6VxnjmWmVTTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv2sM/LfJMDFj/PXGVuDoEhwSKEYWfkvPDTPxfX5MVDBTFnsKDqNNvbyp51FX5NGq4SxgcnuSUQ64egbWbv+LZwukQinj+b1Faf6Xy/ckesGIe7fy9BMdah6e9+BnZFemzeQg22CDyi1e0pIcM6AzdND1Uf1gFQsiXpV/A2vpqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=h3IxkLwK; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="h3IxkLwK"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b98482b253so79711586d6.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779284441; x=1779889241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+SwQbDLFG0Y+rBu9pL52xRO2ueMe5MsHi84X45A//o=;
        b=h3IxkLwKWjyKUU7MSz9bokgAL4aEMcTyzldspbFFRqq2RbQP/VyTHFGDfvKshF+nAs
         gOgS8tVIRngvbGnJlo6WY4/W1Iw3q/cIBonaiGXSFJmGnO296OdvjiOWy/plNc5DmQ11
         xgP+nw0lpCqwoHiatRFik07mt5JkIhufk0A3K3O3H66mSTOK8PNM4ZVIFiF5cuaHgbUx
         0PI77OZuWEpaRDWLp11sIf2Pl6kFwG2S/H+PTk07G9t3rNhBhGLEfAegoctR0x81UDAN
         wfq1+5X4pRWrXGUcTHAVJJh2pzlfNA1DQUibjtrc4d90Vaf1grH/BDSjYSone8m6PwaE
         Ii8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284441; x=1779889241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+SwQbDLFG0Y+rBu9pL52xRO2ueMe5MsHi84X45A//o=;
        b=sq1i++3QW6s+qdmeygi5NVDcyDPv/D/Lqhw3BvtUCLXFEUYZYu9ck7ppwXoZ9sEI+d
         dRfTrCFbfabuOYws9/+ABgFWWrbIWdF3bZSbJ+R/amQrziJiRwYrbq5VtrKFqlfjNr40
         DHV0ueu6D9NRZ6pHOyMb9z/RZjPbX11+gSjcvx3jeXgAEraPZp3O+0DZGoetbBfGbPz/
         mrYAOPXmohRSd0psXc+0HopaRjeO9EnypZa17lgxtCc+CTcZXI2gpOAspTGZawccyBxc
         xFhQLbyuKTeIOgoNlG3tZVz4BJAu5PuOby2z8CbJh+fIBXDEqWbvfHyzTN6EELxVzBsa
         E+KA==
X-Forwarded-Encrypted: i=1; AFNElJ84V8Lsyrfj2l+yQ8RQm1IupgoSvQprax4xwbkqknF1KntLZA7bzQ1hwrHczgTWGJxhRtbm3FZg8lNj@lists.linux.dev
X-Gm-Message-State: AOJu0YwsdkCSgg3BbFHGxSejm+1W3K0+isgDbaRjpjWVuw/cmuvwSNWN
	CO7ukPmj7Qpwg9fJlWyh6aEjZeN0wfzbX9gZcEh/3EwxrAIohIVlX3PanFRQbKKBB1A=
X-Gm-Gg: Acq92OEfipYXdCDqRJhl9bZTmR5fyY53rdW8w5467QXv9O+r+FyCKW0rPYYvr9fJt8H
	MUUamtmMmtvPjXR2b5+iMnSdZZ3cJsYIIMOjCIqBbm9Te183VligpM56gAoov+8nqmrYF4Gljlr
	oZeZdY1aYojHK/qlHg0WvFJ07PyRYwDlIVQnVh/g28vpwFNQtqImt+gC34ehgTtieE7AbzsjDHA
	3ZUmAsdavhGDpclFvzWIwfn5qeoc1OxdF0Cm2UNyzc2YGIa3tTcd6G048idaSqsjG2GJi3oRhe1
	c7n78wU02mtfiZpKQne8LQ32ftXLyaQW3nGucbfMoG9PsE+P1WxXrz+tRxjcCMyErEFAcY6mtKJ
	f6/UdyW8K6aKia50Y2gC+UbaLAMxCLqUOZ5A8XVnUosANjoX9FaUDiTPTVy+ZcmiW/dc1tUw2pV
	S8QZuBoF/eylcUiAla4FAH7YvAB+tcx3Ug4Dzjr7ue7RSVqyu1rCCcTLQ3zqmOD/EC89WifCWGv
	0aX5z2Myho/DEmo
X-Received: by 2002:a05:6214:5c42:b0:8ca:16fd:7297 with SMTP id 6a1803df08f44-8ca16fd752cmr347910676d6.30.1779284440966;
        Wed, 20 May 2026 06:40:40 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360ac735sm122405916d6.19.2026.05.20.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:40:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPhA7-0000000HB8S-389S;
	Wed, 20 May 2026 10:40:39 -0300
Date: Wed, 20 May 2026 10:40:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260520134039.GT7702@ziepe.ca>
References: <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
 <20260519152741.GM7702@ziepe.ca>
 <yq5a8q9fs7ud.fsf@kernel.org>
 <20260519161120.GO7702@ziepe.ca>
 <yq5a5x4ispg8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5x4ispg8.fsf@kernel.org>

On Wed, May 20, 2026 at 09:27:27AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, May 19, 2026 at 09:35:30PM +0530, Aneesh Kumar K.V wrote:
> >> Yes, that also resulted in simpler and cleaner code.
> >> 
> >> swiotlb_tbl_map_single
> >> 	/*
> >> 	 * If the physical address is encrypted but the device requires
> >> 	 * decrypted DMA, use a decrypted io_tlb_mem and update the
> >> 	 * attributes so the caller knows that a decrypted io_tlb_mem
> >> 	 * was used.
> >> 	 */
> >> 	if (!(*attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> >> 		*attrs |= DMA_ATTR_CC_SHARED;
> >> 
> >> 	if (mem->unencrypted != !!(*attrs & DMA_ATTR_CC_SHARED))
> >> 		return (phys_addr_t)DMA_MAPPING_ERROR;
> >
> > Yeah, exactly that is so much clearer now that the mem->unecrypted is
> > tied directly.
> >
> > That logic is reversed though, the incoming ATTR_CC doesn't matter for
> > swiotlb, that is just the source of the memcpy.
> >
> > /* swiotlb pool is incorrect for this device */
> > if (mem->unencrypted != force_dma_unencrypted(dev))
> >     return (phys_addr_t)DMA_MAPPING_ERROR;
> >
> > /* Force attrs to match the kind of memory in the pool */
> > if (mem->unencrypted)
> >      *attrs |= DMA_ATTR_CC_SHARED;
> > else
> >      *attrs &= ~DMA_ATTR_CC_SHARED;
> >
> >
> > Attrs should be forced to whatever memory swiotlb selected.
> >
> 
> But that will not handle a T=1 device that wants to use swiotlb to
> bounce unencrypted memory. That is:
> 
> force_dma_unencrypted(dev) == 0  /* T=1 device */
> attrs = DMA_ATTR_CC_SHARED;
>
> In that case, it should use an unencrypted io_tlb_mem:
> mem->unencrypted == 1

No! The DMA_ATTR_CC_SHARED only states the nature of the source
memory, the DMA transfer will always happen under T=1

It is perfectly fine to memcpy from shared to private and do a T=1 DMA
from the private memory if we have to bounce.

Jason
