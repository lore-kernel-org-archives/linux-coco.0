Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AD12BE65F
	for <linux-coco@lists.linux.dev>; Sat, 25 Jul 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784989961; cv=none; b=rg0yL3m7ORma++U51sZGy+hBSsVQp45COT4VEJrVklvhUpW9gXpk1TIGr3llm6SP7lcqQZIfSAMdkiYsd2wmc+scZoSKplacsW7uUuXKWzChuGSVfAX2/AhOiEr4TiTo3vDwDZqVNZXjB0r7AcAwRgvsbrKcIjq8L+6Jg8pDTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784989961; c=relaxed/simple;
	bh=S27wxW5RiXGSWAyfDHFRMon4Va9e0JZw9F8o+Hg7Llk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnqXidPTTnny7KJawQwWPxmM8WiNJLKbOt3hjmJqQwedAuAQ5AVua9RoIGv5ZHD+uGjUZQ5sxFzTQLehy1d2wMmT/6iOrvbC2T84kKYh0Y1+em5Xty1dnXn840f0pG71WW94/77UTS+wHKaSFL7J4yIoqbShxpAGT4mJ35bsIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=as6eaP6h; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="as6eaP6h"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so325225241.3
        for <linux-coco@lists.linux.dev>; Sat, 25 Jul 2026 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784989958; x=1785594758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDjgTbE6npl3ZujjcO5BO0pJ+G7Th/Ah/Rj5MPFfgH0=;
        b=as6eaP6hQhXRTKrB7Rvo/zQE35Yxl8QW+n+pa3Do1ILvkdEWlOinWPzlOUHOmvKTh4
         WC9kQ8G5EbRT2DgHUWfIJ9VGROOgBbjnitPmb9SX7OulLlL03zmRpOB8M0NdOYTNunN1
         9kQTcQi+814Ozv3PgrPi+M9FNagl/jTVwza4p/SSqegyND5vLOj3OMPGGdK/VP/i0gJP
         EvsTF4PPH3V5W0HG3fktubSQBy6yHOZZdDw34lF/mzUI/LCjmTOaB0IY0Jy2E0pvRanq
         GiCQKwY3wL3Bm1N2jUKXxz+X9dnWKjyyZ4mq+uIuCUREjLvnbp+rT4wP4ypWz/ILzwxa
         wBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989958; x=1785594758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDjgTbE6npl3ZujjcO5BO0pJ+G7Th/Ah/Rj5MPFfgH0=;
        b=JJA1aW0bQx/N3WF1mI0xiw+CWlZsi3oL2yqS++fhA3CvwoSkvxcXkn2Gng1n5TyL7W
         pjBa0haYx4sDcpSKc26JmGy+SPV9kq+WnMROujzi437M0TQFmqC23DEUtkyIOkOBQY1/
         f9iOVTG+FOQAM3eRE87nl1hhlK/qwwlFFDGwYUS5aCKRuMZIUzZCK+Ha62jZlfKazMvQ
         HY0fHBUYd3ZR0Y1R3U9fgzbV3nxuXJqyVxMDzEjlYcr1ydR1eYGNv8+rO8TrpXnZL8UR
         ZKN6NSFcJbxGC6gJszluOLDRYr7R+VdBxa1kNydOBomIVfYjyyzNwPPxAnIiUOSle0cI
         brEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmRMEOYvjqHivGDmaNeGvYdJ0iF/wosXe4IkPtD1FSFy6g2u+sS2+wMp0eSPS12z9nOyfYx4YxIZRO@lists.linux.dev
X-Gm-Message-State: AOJu0YzbBRJlEJc4hmQIk2paOOCdrD3KE6rAUgktCxeUI0tOs63vURli
	vR+We7J5z4tYG54xhPrn/fiL5PMoiuQD6i7s3YpevPULUjGq/TqA4OV4j65SlVDWqZ0=
X-Gm-Gg: AR+sD10DsAdYt/pE8rtfSsfU47UnthyS7Rr0h+v2Pxv+v2FTm+qMXNQhh0wLadHiB14
	1G87rPxGuvCC16L38GF9++vP4LjciLHwdo0ZwWoA5hdXn6iQm8OJF9vDNjukyGlBJ3t8pRHEkji
	80dMTO79/3fGyJgeZvr2pusKcHmzHo/5lK6UPxMmkMq49ipxPCBexAdZxmPHYqQaAECvMG1RyXb
	9jLB0TnIPach9SULfv/5AWJFdr+Y7fnA6Eidivk5D9WRFm11bJyz5xdtWUG+NgCaa1QILLqMbpt
	GIO3FQBvTBpaAqMqn4tfgNl2DvOaygevcgWOVxwLIorycUtjJ/xZrJZubpHi/4T2ggSgdX2/fNV
	XceTEC8rFb8eZErU6L6Dogr27E1Cqf9R2wg92bVHZM0fzbuMCOQJ57GbCSC0lXps=
X-Received: by 2002:a05:6102:5794:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7503e26761cmr1503853137.7.1784989958188;
        Sat, 25 Jul 2026 07:32:38 -0700 (PDT)
Received: from ziepe.ca ([12.18.163.234])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-750362e67cfsm1546647137.8.2026.07.25.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:37 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wndQX-000000000hB-3EP5;
	Sat, 25 Jul 2026 11:32:33 -0300
Date: Sat, 25 Jul 2026 11:32:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <amTJAXNy9fGFrve6@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260721124056.GK110966@unreal>
 <amEglRH3u6UFFnIQ@ziepe.ca>
 <20260723075108.GB110966@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723075108.GB110966@unreal>

On Thu, Jul 23, 2026 at 10:51:08AM +0300, Leon Romanovsky wrote:
> On Wed, Jul 22, 2026 at 04:57:09PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 21, 2026 at 03:40:56PM +0300, Leon Romanovsky wrote:
> > 
> > > Why don't we continue the effort to remove "struct page" entirely
> > > from the DMA API internals?
> > > 
> > > IMHO, everything not exposed to DMA API users should use
> > > phys_addr_t, including the DMA address pool.
> > 
> > The alloc interfaces return a struct page, that is why this stuff is
> > organized like this. Look at dma_alloc_pages()
> 
> And I didn't say that we should change dma_alloc_pages(). It is external
> API, which needs to be struct *page. I'm talking about internals.
> 
> Even dma_alloc_pages() flow shows how convoluted and non-uniform
> the code underneath which performs translations all the time.

Yeah, but I don't really want to go from phys/virt to page, I'd rather
see the other direction that is easier to reason about

Maybe some small wrapper that returned phys or whatever would clean
this up

Jason
