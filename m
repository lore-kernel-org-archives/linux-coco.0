Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABA48C3F1
	for <linux-coco@lists.linux.dev>; Wed, 17 Jun 2026 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710878; cv=none; b=YJ8L81cKXpXSh8ChEqCA+HPGusM10CITZ3weJ5Lf9X9Ud/WNS+Su3NxKdmRtzogM6yLLaIkktBJQQD5Ku4hj1MBVEnw0GcUpeaeJEllbu7yGdGfRcDq8vbufjSD8eqL4DxjgghvKKeTEgqlvpAPs0gFCVQPuGSIVN1P5DUbbfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710878; c=relaxed/simple;
	bh=9QIEPp5EWbcjDNMKHBFL5JldJkQ5+OL5Nn42Ql7e+rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUNDtQfFA6ILi8lKmvjrwdKJ101/hMgJkRclQBvojzyF63mNrrwmWBWjhkCDbXDPA8liD8fZa6oSlqOHJz/4Z2MD38vAcuGVgHqHdK/T9lezRwyKNbfZgqHpm5z0Ae0YxowXl2IyBVhVyPrbYo0IBoumZPhXATrAFVYDoO3L1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IWFEjX/m; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IWFEjX/m"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5175cb5946dso46467421cf.0
        for <linux-coco@lists.linux.dev>; Wed, 17 Jun 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781710864; x=1782315664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElWjBVhbO2IQzO43OlPWnTyijSop9myiCxf+4rjWyeA=;
        b=IWFEjX/m+dBcDweoZ3io4TEymCPU99r3gA0NCsdiLiogjkklZuUBo+cm4O+0/GFVl7
         n2WPSXTh55L9ttWu2fxPm3hZQ2NhW2nrLA2t6NaK6CtXHnZdEcsrC4Gkz5PeBm14d74A
         QuEx1ELyW1MUuQLTqgP/NWoWgWwgWr5EWbX8ZwHP5FHO+06rw1SNJgZ5rV6aVIpjATED
         f+j3Ic/25TTnuXvi4TZmHjNwJuEdNVr/9k94C9PejX3Df4Sj8X69kBvBAiNBYI3tJKAW
         dpcqQJVYvaqIBnW2TSwjZs7akEtnCM3n/1TTJj67DSwdxhLTaFNwlGGBB1tdDUljFByV
         950A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710864; x=1782315664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElWjBVhbO2IQzO43OlPWnTyijSop9myiCxf+4rjWyeA=;
        b=kcMAlHjj/YZJIshiJnu8l40EZV+kP8nnXx/MFwhRd8uS3kINU+INFwgOGP/GDRYPBY
         jM6XB7RbysPLDC6gLIna8Lk9QbXSw4RgA9jsOAQq8LL6PKQoW5yRoriDNXVU242KyF55
         j0+XZuyWgfyMJXMC0u2WAwUilcT6qdeybbBWQ/JTCX74CpiX8WsP6SWuHuCZu5Z9dxaF
         84lRL+l3ts0y8ffETlkEEcZeTwRVUF5Yre3XPOWADac1MDA+vIL873ZmJnTFWYHxp4xW
         ++QNHz44chqV4OAaSkvlklWVo0QTgxJEfRaqN0dbVJvxxi6JXuNU1dUyRdy6x66TVIZ8
         KCGA==
X-Forwarded-Encrypted: i=1; AFNElJ98a2JRgKq3LnIniV0u9lTQFvFkc7t/yiYpfkaiZ92KB0M0KVaPvYT5YFfjI6aLsBhTfJlLVnhU16O4@lists.linux.dev
X-Gm-Message-State: AOJu0YxrKFXxfGW1bEMxhrDkkhCoWvNzs+6Bzl3W0R2QHAaJbPV0YYMr
	2dh7W0P9I32nRla6CKO5iGtNS+5rF81YIatBXZYT9l4KZe3DTE+FAwPvITlrJSVoDO0=
X-Gm-Gg: Acq92OGBMBrpDOpMH7v0juDGjxwHJYYEnRJWQDwM0BlaqoKcqEMLkMxyhiump46xK8u
	8e7KPTFpuL8GMz0+sjYzwh7z5zg0+SX186REVv/QTWWXc0VJe9/RJXXKPrsLiRAu7cBB6WmNXoz
	xCzhBV6C2yYQaf3dZ6p/gWE3IWXVgXAIHu0SQUvzFdB7NE561E9iZLH4D+NYoF0UCnFTLsaxOXp
	cEF0bul6QkJH59mTAJ62j1EWwtjZzq8asiAejnBO3wmmZTOYYdMTdaiEV58W6EmN7EPHwhs/QXj
	Uv9Ar5s+dwNXpgUYaf9EbI9FtFBP2c5eewLTARsPI/z68nJT92LEZx0YcM8Q+gVSwTcbDDqFDe8
	GlWWPAlYRWDUiTJqOh5aUGntrvMtjt9ZOqOnmlciVQWFidaGP3XvK58geb5GfUvXrxLWxW7TOcR
	YrH7mIcdZ87Mhcv7Cm6wvkIsT186XOsSbtNto0E6aJaz1EuIxACigDmU2p0BIy/H181Jsu6JSAE
	Xyxhw==
X-Received: by 2002:ac8:638b:0:b0:517:7620:20f9 with SMTP id d75a77b69052e-519a8e01895mr53967651cf.19.1781710863733;
        Wed, 17 Jun 2026 08:41:03 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm171544001cf.14.2026.06.17.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:41:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZsNx-00000000iiO-3Q8i;
	Wed, 17 Jun 2026 12:41:01 -0300
Date: Wed, 17 Jun 2026 12:41:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
	"Cheloha, Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260617154101.GE3577091@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>

On Wed, Jun 17, 2026 at 10:50:39AM +1000, Alexey Kardashevskiy wrote:
> > @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> >   {
> >   	bool remap = false, set_uncached = false;
> > -	bool mark_mem_decrypt = true;
> > +	bool mark_mem_decrypt = false;
> >   	struct page *page;
> >   	void *ret;
> > +	/*
> > +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> > +	 * attribute. The direct allocator uses it internally after it has
> > +	 * decided that the backing pages must be shared/decrypted, so the
> > +	 * rest of the allocation path can consistently select DMA addresses,
> > +	 * choose compatible pools and restore encryption on free.
> 
> Why this limit?
> 
> Context: I am looking for a memory pool for a few shared pages (to
> do some guest<->host communication), SWIOTLB seems like the right
> fit but swiotlb_alloc() is not exported and
> dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed.  Thanks,

Then setup your struct device so that the DMA API knows the
guest<->host channel requires unecrypted and it will work correctly.

I think this is a reasonable API to use for that, and I was just
advocating that hyperv should be using it too.

But it all relies on a properly setup struct device.

Jason
