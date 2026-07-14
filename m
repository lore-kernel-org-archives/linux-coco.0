Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E56448381
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 12:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031824; cv=none; b=CVmaZgcWOMX967fCDegO2bOIU2qVQDkIuWVg4rk2A2agl7WqIRHRsjKvIwTCwOrznpHi3CFz3p0xh08XVchOqTnsCb6Z5pzMgwBnNacSs+6qaPJD+4QWzJsKZ21JvXnLfSgjPYCh5e2zhShEd3zYvkSyJD2LOr2vPYJFql7RAL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031824; c=relaxed/simple;
	bh=DFDuu4u3kEC19GzAK9vAdZ2AnSTtPZQ33CXAXmTNzxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsERh8gFauXGoP9T0zDIEIsR8AwuEbedi3wG2Z2i1ViD42dYgL8bLQKDW26Zm2x1HldVnw7RVUKYEhSnYHHJuyc9NnPG0HZmdMOzf4Ct21I7ZHTi6Hmzw1xNVvdUU6rTdO8Syafjy0/GTRFhv5KQXnw/6rB+JenveDZ8jz0P378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cS+RO7No; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cS+RO7No"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c2808dbc3so25240701cf.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031816; x=1784636616; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XrBPfnLDD8eQ7eCQ6RhRSXn0CPQXVWcRtTZW3fZ/anA=;
        b=cS+RO7NoPeHXxWoGTkhvnhqVf4crNgb616W0/rM5IdjjG0uNvvl9QnIkKyqjJXZ6WF
         n/ECD+IFV0jwa85MDSvppoTi3RvWsGjHbj15A/azMbrKlqsGMKbuDgbZxIlHLw9xsKIw
         xk3VTknsIfHBNUkhw2wqEAtcupbwRSd11T5+oAataxwCMLFQUTborWFcATCFyQTFJsLs
         FJMQxutuuwk9ht9Qfp2Mb79wGAcFavERErt+qIBq5E2vlaOAi8w5hzK9WDlnyChwyQAZ
         wuHRfXYHv2U9uhmB41ofb0CUGCN0fv4KY27LneVDtWeO55fCA8BElvChaSddcG9Gb3/J
         M4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031816; x=1784636616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrBPfnLDD8eQ7eCQ6RhRSXn0CPQXVWcRtTZW3fZ/anA=;
        b=ZawacSoMJ60bgZ4WRF3Rh3wVLuQtdj262pzN3CyDWCeLsDqK2X82ljMdnEnnFQCxbd
         mCPbgwcJXMtaiFJCiNkfCx/RxtF0sIh5X/6EzeRr1+ZPrVAtpTqoe9I0v41XdwCK+d1L
         otYYGXmpCBechE9jIkcyHbuM0it7cmZDOQ1ffKNzevPbg6Xg5Z/AHgneXS1yXs4CF34j
         KZLLpbumgXSSpS84q5pswYVBy7vXLAbmm2g6wSGq5bbWIHer0uBIq2HO60SZvdEJMZY3
         gTeqrxDRo4Lyer1WWwbOoa0p1ZR7OTfGBYXZ/q+fLEWpG7qvo3Nj4U8/Ihxr3EZ8hAFU
         BdOg==
X-Forwarded-Encrypted: i=1; AHgh+RoOqIAM7Kjj0xRVc+sE0q82n4FqfYSA8r8U89RRzAWODUQx/R7jPnI8cRxr4/tIBgjnJao2c6cQh+Ns@lists.linux.dev
X-Gm-Message-State: AOJu0YwouKRbtZwOJSOF4xghKyTs4Fe6mXbkkde7Srb/rO7V6AlKS+oe
	xP2+W+zYsOe56HHMo2fOwzYam5sqwFg/x+8ttdeb5LehFQjsEIBL6+F7uu1rNh6hebw=
X-Gm-Gg: AfdE7ckzm8jJuCIH9TWYqGigGBC923Nws85nK7LKY2KwGoKcIMshMQoCMVFWfPoYQpi
	VnG4u04IVmihBhh93Ap1MshylHvN+Tn3kg4TK2MW+VKATZ57SEC1U1h+suUgl9E5LqeSVPgN6mp
	MbB+W//D+mTYMBN4D0AzD6hYtl/htyyXauqh8OVFdXC2a3oSab1h5ZMZOR60XK/vWUA1NDJmVT+
	+JE9r4LcrkU7LY6nNZBKmNQotbbLstR6ehrhkyGTiBMqPonValyMtPy/a9Tk5UKxlpatqpKZxUL
	QpqZSkDHrNR4640EAsBu7M88Uf3P6Ujzq9IWs80zcG4SWt51lDpvwxU0LilhNnd0jHZsKQOJEMk
	aFzHv7q8VoyT3cqwJBRchrMrMiYZ2s4aMshRnzt8wVyEtZReENtRUD3JdFVrq
X-Received: by 2002:ac8:578b:0:b0:51a:8c97:9375 with SMTP id d75a77b69052e-51e42494cb4mr15995711cf.61.1784031816150;
        Tue, 14 Jul 2026 05:23:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacad30asm109896611cf.9.2026.07.14.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:23:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcAg-0000000FRbN-3RTk;
	Tue, 14 Jul 2026 09:23:34 -0300
Date: Tue, 14 Jul 2026 09:23:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 04/22] dma: free atomic pool pages by physical address
Message-ID: <20260714122334.GF3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-5-aneesh.kumar@kernel.org>
 <20260713181059.GL3133966@ziepe.ca>
 <yq5awluymdf6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5awluymdf6.fsf@kernel.org>

On Tue, Jul 14, 2026 at 09:27:01AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Jul 01, 2026 at 11:19:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> dma_direct_alloc_pages() may satisfy atomic allocations from the coherent
> >> atomic pools. The pool allocation is keyed by the virtual address stored in
> >> the gen_pool, but the pages API returns only the backing struct page.
> >> 
> >> On architectures with CONFIG_DMA_DIRECT_REMAP, atomic pool chunks are added
> >> to the gen_pool using their remapped virtual address.
> >> dma_direct_free_pages() reconstructs a linear-map address with
> >> page_address(page) and passes that to dma_free_from_pool(). That address
> >> does not match the gen_pool virtual range, so the pool lookup can fail and
> >> the code can fall through to freeing a pool-owned page through the normal
> >> page allocator path.
> >> 
> >> Add a page-based pool free helper that looks up the owning pool chunk by
> >> physical address, translates it back to the gen_pool virtual address, and
> >> frees that address to the pool. Use it from dma_direct_free_pages() while
> >> keeping the existing virtual-address helper for coherent allocation frees.
> >> 
> >> Tested-by: Michael Kelley <mhklinux@outlook.com>
> >> Tested-by: Mostafa Saleh <smostafa@google.com>
> >> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >> ---
> >>  include/linux/dma-map-ops.h |  1 +
> >>  kernel/dma/direct.c         |  4 +--
> >>  kernel/dma/pool.c           | 54 +++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 57 insertions(+), 2 deletions(-)
> >
> > This seems pretty suboptimal?
> >
> > If !CONFIG_DMA_DIRECT_REMAP then page_to_virt() was used to compute
> > the genpool's addr so dma_free_from_pool_page() can use the same
> > logic, which is how things must be working at all today
> >
> > The CONFIG_DMA_DIRECT_REMAP scenario does look broken, so I'm
> > surprised there isn't a Fixes line on this commit? I don't have an
> > opinion on the search, but since alloc_pages() is used there is 8
> > bytes in the struct page that could be used to store the remapped
> > vaddr to avoid the search if someday someone wants to improve
> > this. Maybe a small comment hinting that direction would be a nice
> > addition.
> 
> Something like
> 
> +/*
> + * FIXME!! We could avoid this by storing the remapped virtual address in
> + * struct page and using that for lookup.
> + */
>  bool dma_free_from_pool_page(struct device *dev, struct page *page, size_t size)

Plus some if (!IS_ENABLED()) that does the direct lookup

I would just use : not !! :)

Jason
