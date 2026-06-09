Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7441363C
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007507; cv=none; b=QQW/9dTJzLt1p6de0g5en9klcYEcKs+R8W2diuJJLSG1p9YL563JBkr5bgWOt7yKusuWXnHhH1X0/3IxzTx/6J2PkfeOLzBth+NUWZ1PuoBiB0K3sqEret66DIEj/A4+Koz02Oh6EvSyTKXuKbQFKuc72AtI78EXmmR6HmWnqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007507; c=relaxed/simple;
	bh=AWet2x3HjRD8h6Y0eGbnk+I6u0raEbNWeeBz8Mgsei8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4hicfR60eJcU6dtus2ZK5FFlovkjx1lEOFx0fa2FHVLbmgwXdFpz//SEFUkuzSsHLaMBsvpTnHgUnCcxRChattuFm03/kgl9oqO6Vz3LbT2AqL5xXs7z9M9iBbOk9GVkasmLkhk5OBNNiDLo6GZHLmmjYWSJLnY8i2Ob4+HZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dPyEeshT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dPyEeshT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1c39fe4so5484415e9.3
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007504; x=1781612304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cgmjA35OZT82unFdAfj17g91mhG8pXqbVF134yH8ow=;
        b=dPyEeshTh1m0a0yinTGJlL72vV8JmtvaWM6RyWiQ55kW6qTZqBPKZ/iHrOxKt5jroB
         t9RXYE4OxMI+WPZn67crwJ4PCYXNZDADCyvgeMW/CNduMEviGno/mK0PYYG6OHJZLlJL
         4ahA/pTBV6aRBo4gWfdyosKedHdoXnjbGJMw+MtLNtTvhKZky+JKiWKHNuXmnI34WJtb
         fT2qpwEECyyXytZWksViH49k4E8uqqafHaFbXuGmncDIYOdjRCCVJjITHifSANImWbMM
         QGXmNR7kRoGhIcHbJxPbI7LspD82EiFfJj8CLxAQ0KS2JTSM/wXU/3o5iCi1XPQEPFrm
         /x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007504; x=1781612304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cgmjA35OZT82unFdAfj17g91mhG8pXqbVF134yH8ow=;
        b=i7jIXSLWWhrZQ/uQLhtpWFzSJfwSFQ3oQaC4rZLJsLjASLgynU4XcQ/+sUDTpmwUO5
         /gI+FYSUIHa7MM2cmAVWQSqclrFbVvAEE4fFypPXTVCP9uFpPvHjCnDEpg2lktKoM/yi
         jfAdsVVtB9JG2M/bWBZZmp5XZbb7AuGHaBy4PwDhmi2iF2ZKN7Q1TaXtKBAhCQgiFCKk
         Br/uyxkpTuar7cSJKzH1zj8ND7xCYKM8v9+AbGHIdMQBbCghAdv2Olbn4ztQKxcrl1we
         AAniBsUqqekY82R26aoQNmo1OTaUkRN/gc9hZEP4lXVnitIvXl5uNQ8Psf5wwoP05ETT
         0iCg==
X-Forwarded-Encrypted: i=1; AFNElJ9u2RBh9Gg6cZf2Xgk5NWOrYPe9GQTfXFa/BdGvJUtnXUt+UCQ2GHzzy7f7X9EEQkGNoCunir0aHBOl@lists.linux.dev
X-Gm-Message-State: AOJu0YwCdTo7veqaIOpbAgEPHoWBfeQp3BkXIPF5DehRwMmsB2MSx9M3
	BAKAGTUvPc9LbiZp39EDUmAK+0TxOLrjXqQvtK3wV6djGinK7HP9cLKkItuqAdx/A7c=
X-Gm-Gg: Acq92OEkawh7fSqomKEjASOp/+jCsXib4LGp9RrFjYe43wCUqiBAwC6jTE6qLKm16qM
	vAQDyykgDRhcYfrMZVejdxwxLG+qCu3WhD6DWXZqxxXcZUhGA94ar5zgJMa63ZuA1A0hpp0BuOu
	X/s4vuLKRF11F205uQF/QuKeqb8+KkzUMC0wwaI3HiU7cVq9/tZ/96FN82DzguO24UYwWx2YG1x
	gFUAxaZXb85+OVzG4Kvbr0mflpBKnTtDSA4+NZgrVj/SjOfNNRF0VIIbt+UUNmGvyQbrfRdVw0p
	KlrkDPy3pj+0pIrkL82+npevzsVMEiHrTArqASCSsOcnVbNgHUXFgEOO6taVRRjOB0SPLWaoN2N
	bkOwQ1RIUdqHtG009wQfVGSFKnEDtq08UwWQM29pFU9TLrGgavJqRbZqFSQDZZ1yG+K9ipmCEns
	AF4TwzPC1Klzuv8nCIvvAm3k8=
X-Received: by 2002:a05:600c:6990:b0:490:c123:3b7a with SMTP id 5b1f17b1804b1-490c25f5864mr145239965e9.4.1781007503651;
        Tue, 09 Jun 2026 05:18:23 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm61851766f8f.20.2026.06.09.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:18:14 +0200
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
 <svens@linux.ibm.com>, x86@kernel.org, Jiri Pirko <jiri@nvidia.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260609141814.413c1f2f@mordecai>
In-Reply-To: <20260604083959.1265923-4-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-4-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:42 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Propagate force_dma_unencrypted() into DMA_ATTR_CC_SHARED in the
> dma-direct allocation path and use the attribute to drive the related
> decisions.
> 
> This updates dma_direct_alloc(), dma_direct_free(), and
> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  kernel/dma/direct.c | 53 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index a741c8a2ee66..90dc5057a0c0 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> -	bool mark_mem_decrypt = true;
> +	bool mark_mem_decrypt = false;
>  	struct page *page;
>  	void *ret;
>  
> +	/*
> +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> +	 * attribute. The direct allocator uses it internally after it has
> +	 * decided that the backing pages must be shared/decrypted, so the
> +	 * rest of the allocation path can consistently select DMA addresses,
> +	 * choose compatible pools and restore encryption on free.
> +	 */
> +	if (attrs & DMA_ATTR_CC_SHARED)
> +		return NULL;
> +
> +	if (force_dma_unencrypted(dev)) {
> +		attrs |= DMA_ATTR_CC_SHARED;
> +		mark_mem_decrypt = true;
> +	}
> +
>  	size = PAGE_ALIGN(size);
>  	if (attrs & DMA_ATTR_NO_WARN)
>  		gfp |= __GFP_NOWARN;
>  
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev))
> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) ==
> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
>  		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
>  
>  	if (!dev_is_dma_coherent(dev)) {
> @@ -236,7 +251,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * Remapping or decrypting memory may block, allocate the memory from
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
> -	if ((remap || force_dma_unencrypted(dev)) &&
> +	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
>  	    dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> @@ -312,12 +327,24 @@ void dma_direct_free(struct device *dev, size_t size,
>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>  {
>  	phys_addr_t phys;
> -	bool mark_mem_encrypted = true;
> +	bool mark_mem_encrypted = false;
>  	struct io_tlb_pool *swiotlb_pool;
>  	unsigned int page_order = get_order(size);
>  
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
> +	/* see dma_direct_alloc() for details */
> +	WARN_ON(attrs & DMA_ATTR_CC_SHARED);
> +
> +	/*
> +	 * if the device had requested for an unencrypted buffer,
> +	 * convert it to encrypted on free
> +	 */
> +	if (force_dma_unencrypted(dev)) {
> +		attrs |= DMA_ATTR_CC_SHARED;
> +		mark_mem_encrypted = true;
> +	}
> +
> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) ==
> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
>  		/* cpu_addr is a struct page cookie, not a kernel address */
>  		dma_free_contiguous(dev, cpu_addr, size);
>  		return;
> @@ -366,10 +393,14 @@ void dma_direct_free(struct device *dev, size_t size,
>  struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
>  {
> +	unsigned long attrs = 0;
>  	struct page *page;
>  	void *ret;
>  
> -	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> +	if (force_dma_unencrypted(dev))
> +		attrs |= DMA_ATTR_CC_SHARED;
> +
> +	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
> @@ -403,7 +434,11 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  	phys_addr_t phys;
>  	void *vaddr = page_address(page);
>  	struct io_tlb_pool *swiotlb_pool;
> -	bool mark_mem_encrypted = true;
> +	/*
> +	 * if the device had requested for an unencrypted buffer,
> +	 * convert it to encrypted on free
> +	 */
> +	bool mark_mem_encrypted = force_dma_unencrypted(dev);
>  
>  	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&

