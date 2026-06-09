Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E44218A6
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012425; cv=none; b=gv/RfaJhXvZVCpyspurVuLcnIxlXzrtTMbrK1hTfBzTEVnbHrx0Yfre6DLpInBVCgEOAP/tDk1m2eTARDJpaUlVHch10/vfs8ob5r25kP3qMqoLGFZEf2TvsAfrc7TBhw+DJhsz0Y32+StwSDSW9bKkxMfZzYWi77WlSBZJcoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012425; c=relaxed/simple;
	bh=nnKNuur4W2YzFI14z8xVfVyyXPMv1Qb2sp3tq/hBgmg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKHtJ6hSK0qM5CGWAD/DTUl9oLIvnNct86kIn2hqv1AHSv5mj34+K5k54IXq/FzpR6aZe5Fq13wkaTo6f+hMZUBXjbH8KTqOIfYjnVEp6PCxWC5KCi9F8s6yLUE7wpztooq3lQzOF3X6dLx73NdD8S3NwtAyO4RLAThU4eLTg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nyw80c5i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nyw80c5i"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef93a0b0fso368857f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781012421; x=1781617221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LapnW6RyijtMlBbcLjGQ51I+00mOkKRbnIVzAqqw2OE=;
        b=Nyw80c5iIXsodqlkg0+unz9OlZ38Olch/jTmmAO0mNHKDKndtwt3d9IFJ6hycYxR/6
         FmNmbEcvZ9Bl9kWuGgFDbxIFHFYrDyfBY0GeY3gMPbxg2rw7UbnkBz7eKkWLmxxFQmQX
         ma1TexJoN2C3gkjuyKZ6f1ngxTKDU0px/A3mpGn2BgbQqC6eTRaAMD1cX+SLyWjo3YqW
         UmCygzdW/YV2PYLA4b9+jYTLR0FWjXGFp+aGfMPLd3Wm1nHtL3y0EDGASACoJ3im6QVG
         r0hP1KfqZoDJDzZzvoMCxbDaRdOrGPx22ak+oE8t+VxfkSJwbUD+TgEMGn9GysO9mjrY
         6GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012421; x=1781617221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LapnW6RyijtMlBbcLjGQ51I+00mOkKRbnIVzAqqw2OE=;
        b=OCpT5XPyWqrhDzTUU6o6XEIi6Qul7hbS3RI2QXHAohNr1cLtp6xYfnfNDj2WhmaUZw
         DnN3jAvv05M5Bj34BqnHWWC+8TtzAGqH3Sy3JeQONaIoV1e19aUh3ouE7y72uYtZXtNT
         +BqsfgR/LD7McVSx2AxYUdNE8rE03DmInjh80ljaHKgnOXTkbxCVKcc1GlQAfq1VFAjg
         ZfBPFhZV2cPOfNOcXTAYXv8C6NIPDWnezVwK3YSA5dZtcsI3P5dUwHK+z6GSSS3uX4FR
         1YhuzRjAeCnNpX633jPGCrQmbjiJBOEh+K/HduCSOijLNgd1Q7sF+WOiC/e9BMfMBzaa
         yj7w==
X-Forwarded-Encrypted: i=1; AFNElJ/CcijFKO5hGeL6rYfPaWH/QwG5tMLfWUpf80GRE4eG3FULzX2L1C93IjCei96q5DGtFTR/01sjlIME@lists.linux.dev
X-Gm-Message-State: AOJu0YzUYSh2Dy/Sc1CKIgGToEgozunD2fy6hlyhAkokEstMmvzooRH6
	zZnTq0rWaoRh6vapt7wFmFh6M4f1wVGIdIvb12uKJUhJ2Hg5IAtkAOaCVttiYjW5VgM=
X-Gm-Gg: Acq92OGYryJvrJQ9Z0yLxfiorQA1puG2cQ7p2GWYgryxKf3gK5sV7umSkUpcrPQ5dX4
	/hhM17P1ysbmklN8Y0o6cdqe3rF2Z3uWV7F/HXZg1F9WQiNd2S6g2/or+RjC60KytUqzi0sQdV5
	5hyx95g8dFXd1LUU57NxQiOqXLj8a6j7HRT32cz3wTGkJ+EIr7qmTqkoEtqYd67KW3PF6PVKRe3
	q7i0HDTsE6tHIa6lW6eKVwgO6CRwhb8uaXjW9PP2qB2dL7KbLv+kmYmj00LIfCPYm+gsirqGG4O
	C6ag/LYKZY2LZuRmyNA7DqXvrREabzoD58pGShg9CG9PtvJbxFTqYekZ7jz4eko5phAL/0DNine
	Fiw+mOHTqO7mygfbbbEy+xq9f1H6wLRCS98aty65Z04mr7txhSQy164AdVBUD4ck6q4AlFQoRqs
	f+BKhHIgSC32NfX+UKig7bZZgAHeiytzbpoA==
X-Received: by 2002:a05:600c:8b82:b0:490:abf1:2ddb with SMTP id 5b1f17b1804b1-490c2603825mr146744795e9.6.1781012421133;
        Tue, 09 Jun 2026 06:40:21 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm68263785f8f.5.2026.06.09.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:40:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:40:18 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 19/20] swiotlb: Preserve allocation virtual address
 for dynamic pools
Message-ID: <20260609154018.554e5448@mordecai>
In-Reply-To: <20260604083959.1265923-20-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-20-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:58 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> swiotlb_alloc_tlb() can allocate from the DMA atomic pool when a decrypted
> pool is needed from atomic context. With CONFIG_DMA_DIRECT_REMAP, the
> atomic pool is backed by remapped virtual addresses, which are not the same
> as the direct-map addresses returned by phys_to_virt().
> 
> swiotlb_init_io_tlb_pool() currently reconstructs the pool virtual address
> from the physical start address. For atomic-pool backed allocations this
> stores the wrong address in pool->vaddr. Later, swiotlb_free_tlb() passes
> that address to dma_free_from_pool(), which will fail to recognize the
> chunk
> 
> Pass the virtual address returned by the allocation path into
> swiotlb_init_io_tlb_pool(), and store that address in pool->vaddr. This
> keeps the pool free path using the same virtual address as the allocator.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Hm, so the old code was broken; you may want to add:

Fixes: 79636caad361 ("swiotlb: if swiotlb is full, fall back to a transient memory pool")

And of course:

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Thank you!
Petr T

> ---
>  kernel/dma/swiotlb.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 14d834ca298b..e4bd8c9eaeda 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -302,9 +302,9 @@ void __init swiotlb_update_mem_attributes(void)
>  }
>  
>  static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
> -		unsigned long nslabs, bool late_alloc, unsigned int nareas)
> +		void *vaddr, unsigned long nslabs, bool late_alloc,
> +		unsigned int nareas)
>  {
> -	void *vaddr = phys_to_virt(start);
>  	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
>  
>  	mem->nslabs = nslabs;
> @@ -445,7 +445,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		return;
>  	}
>  
> -	swiotlb_init_io_tlb_pool(mem, __pa(tlb), nslabs, false, nareas);
> +	swiotlb_init_io_tlb_pool(mem, __pa(tlb), tlb, nslabs, false, nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
>  	if (flags & SWIOTLB_VERBOSE)
> @@ -553,7 +553,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  		}
>  	}
>  
> -	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
> +	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), vstart, nslabs, true,
>  				 nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
> @@ -664,25 +664,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
>   * @phys_limit:	Maximum allowed physical address of the buffer.
>   * @attrs:	DMA attributes for the allocation.
>   * @gfp:	GFP flags for the allocation.
> + * @vaddr:	Receives the virtual address for the allocated buffer.
>   *
>   * Return: Allocated pages, or %NULL on allocation failure.
>   */
>  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
> -		u64 phys_limit, unsigned long attrs, gfp_t gfp)
> +		u64 phys_limit, unsigned long attrs, gfp_t gfp, void **vaddr)
>  {
>  	struct page *page;
>  
> +	*vaddr = NULL;
> +
>  	/*
>  	 * Allocate from the atomic pools if memory is encrypted and
>  	 * the allocation is atomic, because decrypting may block.
>  	 */
>  	if (!gfpflags_allow_blocking(gfp) && (attrs & DMA_ATTR_CC_SHARED)) {
> -		void *vaddr;
> -
>  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
>  			return NULL;
>  
> -		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
> +		return dma_alloc_from_pool(dev, bytes, vaddr, gfp,
>  					   attrs, dma_coherent_ok);
>  	}
>  
> @@ -705,6 +706,8 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  			return NULL;
>  	}
>  
> +	if (page)
> +		*vaddr = phys_to_virt(page_to_phys(page));
>  	return page;
>  }
>  
> @@ -750,6 +753,7 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  {
>  	struct io_tlb_pool *pool;
>  	unsigned int slot_order;
> +	void *tlb_vaddr;
>  	struct page *tlb;
>  	size_t pool_size;
>  	size_t tlb_size;
> @@ -767,7 +771,8 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	pool->unencrypted = !!(attrs & DMA_ATTR_CC_SHARED);
>  
>  	tlb_size = nslabs << IO_TLB_SHIFT;
> -	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp))) {
> +	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp,
> +					 &tlb_vaddr))) {
>  		if (nslabs <= minslabs)
>  			goto error_tlb;
>  		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> @@ -781,12 +786,12 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	if (!pool->slots)
>  		goto error_slots;
>  
> -	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), nslabs, true, nareas);
> +	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), tlb_vaddr, nslabs,
> +				 true, nareas);
>  	return pool;
>  
>  error_slots:
> -	swiotlb_free_tlb(page_address(tlb), tlb_size,
> -			 !!(attrs & DMA_ATTR_CC_SHARED));
> +	swiotlb_free_tlb(tlb_vaddr, tlb_size, !!(attrs & DMA_ATTR_CC_SHARED));
>  error_tlb:
>  	kfree(pool);
>  error:
> @@ -1995,7 +2000,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  			mem->unencrypted = false;
>  		}
>  
> -		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
> +		swiotlb_init_io_tlb_pool(pool, rmem->base, phys_to_virt(rmem->base),
> +					 nslabs,
>  					 false, nareas);
>  		mem->force_bounce = true;
>  		mem->for_alloc = true;

