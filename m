Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CA40E8D6
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011987; cv=none; b=Oaor5qCGjUN3qZG4w0oxhugYcYKp0dFmzD5CXYCW8k8t4hLQAunt0iPPHR6MMr3iRljr9tAWsRjvvvxuiy2m23CWGCa0K8JNpJCerM5Pas1U/GuVWvlL/rGSOL+uSp3lRbqT7VNUww+TThLIsYtZJ52eKwY4EEGBGGceCaPU4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011987; c=relaxed/simple;
	bh=NSfwu7yoXAF8kfvPRt9yzyQddZc4/pZJmcex0Ww7tmw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izuvtbYL7xPbJ8v38UHi1Jv4lHLIMsv0VlFiCtLjcNpdtNlH9Z1uE93etpXz0AXR+wL8N+JNI9LXoQAnlpSNTeUPYobi2jlPttZnCbb90iP5XOJFowiFSKpwFxavZ8PWLF6slz6fkYz68tT1Nbgko34YsNyKioK6Vth8f+USDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VWpS/LCP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VWpS/LCP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef9df68bcso325224f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781011984; x=1781616784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=;
        b=VWpS/LCPDaAmp1DL7jPBxYKKO91uLlWRxZobQc3/uyHYqLYRvRm974sK7nNtdr7ikv
         L+kR6YvVAY2AfrdXt98S0XMaQ6vBRePMn43WWwBbiYOX1zGbyFprlG0dQlSVbdv7u+CG
         31MDxR89Hfq67TZ4vl9t0eEutnRD4D4ZNsPyClP94oexA/BgpCa3cIUt9agmLgMy7L/c
         jHetDSPLajNcELZiZMsXrL9lJwC97qu1K5RAs0Y2wC5D5f0jw/XxeabKrM0U8vPBwUy/
         kQwxpkkX/o+S05Adt7JJUtjflcVdF0GWrhOsCmxVGpWaK4Ngn+F+0IvCi9psFRtn6z0F
         zoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011984; x=1781616784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+UubitX36JVc6CTd2RtBwcVL2yqRgVyLq15MXv0auc=;
        b=mcorju4MrzfR8/m3gGB4hbf7Gb8FOErz4McmHeThRMvZqLZU6jboEJ0qsnwOF9pwiA
         g4Ll3nay0XRphQnQfkLSauQorZM6DUlFb1RJ9JwErwLtbgZVVT9LYPn6+xvSAzcdryQ4
         pXngk9JvHgawf3wKzd4h78sN3UJdKsGH+EieFeBUbRnsKmHv5jQW1XuMkq/qUSQMX/Jz
         Ocqh2hXcrPX9N11QU89RXLtyFjcxb5R/bRPziL0PmYPhlZEmMO1DAoi345kqpAL4LTxj
         pMtrNwbpQUe1XSPLb7DpqP6WiqGGmm8TLKP25yjQ5v3/8UGmLVTwRw6v5py0obOf/2g6
         hmuw==
X-Forwarded-Encrypted: i=1; AFNElJ/BIK2yVE6w5Uc4WffDCLJIk5vPExDTABcI05Y45RT/CDGh0N3VtXjul+I65JlGOfRLbGebRIL3G5XY@lists.linux.dev
X-Gm-Message-State: AOJu0YxChifbbZvt50qR92QgJ+ZWGMVuAmGXqOvJmAMXlQ7AsQpihB8j
	Lj6YkRBjAILlOG3IdI5QfeB4pVsM30bSYNBL7wzVmLZh7t6spuQ17/g+gPNPJnGpwCo=
X-Gm-Gg: Acq92OH6MrushD9lf71fWJjRxbKG7f1VTOrLxO/74rLD8Hf88ou/km6nPiss2tqjU0r
	tgPlt3Jyvho4b2UxS7i/gYcYFSPsIE2HBlcV1yey0tlyRB6dK5SsFUuwQzmRASu8nlz7VPg7tBA
	A25I5Qph/+ucF0jdhvBTtq7fMj3iPuLjL9DIlFmIMy0KrLECHAdcorpdgUbN4nnyJ+5yvQumeiG
	FZTdL6j+ld/yczGAdKvcU4EU5xTAPnFxhYkXuKmga9bsjqL5IYVRbdy6bJN/JvndVSNEeYrR6jc
	WNxgcNcS1TBNEH5Kq0OlGwukCcymJLEh/ad4uQISoPUEsp0TaxV3QCo9LAttb9eDLWTeKuHCHo8
	r/+59S5XuXdFTXnCCQ/tOOv7iIf1ZBKDokLrYkAOEkVql1dVC64Yu0JOPJgL+BHp4DRj/RCP2ua
	ay8bqterLQCRQciAGJshn/MUc=
X-Received: by 2002:a05:6000:4022:b0:45e:f68d:e7ac with SMTP id ffacd0b85a97d-46056439196mr1887515f8f.0.1781011984149;
        Tue, 09 Jun 2026 06:33:04 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46059346676sm1079048f8f.26.2026.06.09.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:32:58 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:32:55 +0200
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
Subject: Re: [PATCH v6 17/20] dma: swiotlb: handle set_memory_decrypted()
 failures
Message-ID: <20260609153255.4b9e9373@mordecai>
In-Reply-To: <20260604083959.1265923-18-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-18-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:56 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Check the return value when converting swiotlb pools between encrypted and
> decrypted mappings. If the default pool cannot be decrypted after early
> initialization, mark the pool fully used so it cannot satisfy future bounce
> allocations.
> 
> For late initialization, return the `set_memory_decrypted()` failure. For
> restricted DMA pools, fail device initialization if the reserved pool
> cannot be decrypted.
> 
> This prevents swiotlb from using pools whose encryption attributes do not
> match their metadata, and avoids returning pages with uncertain encryption
> state back to the allocator.

This works fine, but instead of effectively leaking the memory, we
could return it to the buddy allocator and reset nslabs to zero as if
SWIOTLB was not even initialized.

OTOH I don't want to overthink this, because the system is probably not
too useful after such a boot-time failure, so unless you _want_ to
improve the error path, you can simply add:

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 80 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 4c56f64602ea..14d834ca298b 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -248,6 +248,23 @@ static inline unsigned long nr_slots(u64 val)
>  	return DIV_ROUND_UP(val, IO_TLB_SIZE);
>  }
>  
> +static void swiotlb_mark_pool_used(struct io_tlb_pool *pool)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < pool->nareas; i++) {
> +		pool->areas[i].index = 0;
> +		pool->areas[i].used = pool->area_nslabs;
> +	}
> +
> +	for (i = 0; i < pool->nslabs; i++) {
> +		pool->slots[i].list = 0;
> +		pool->slots[i].orig_addr = INVALID_PHYS_ADDR;
> +		pool->slots[i].alloc_size = 0;
> +		pool->slots[i].pad_slots = 0;
> +	}
> +}
> +
>  /*
>   * Early SWIOTLB allocation may be too early to allow an architecture to
>   * perform the desired operations.  This function allows the architecture to
> @@ -272,8 +289,16 @@ void __init swiotlb_update_mem_attributes(void)
>  		return;
>  	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		int ret;
> +
> +		ret = set_memory_decrypted((unsigned long)mem->vaddr,
> +					   bytes >> PAGE_SHIFT);
> +		if (ret) {
> +			pr_warn("Failed to decrypt default memory pool, disabling it\n");
> +			swiotlb_mark_pool_used(mem);
> +		}
> +	}
>  }
>  
>  static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
> @@ -442,9 +467,10 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  {
>  	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
> +	unsigned int order, area_order, slot_order;
> +	bool leak_pages = false;
>  	unsigned int nareas;
>  	unsigned char *vstart = NULL;
> -	unsigned int order, area_order;
>  	bool retried = false;
>  	int rc = 0;
>  
> @@ -504,6 +530,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  			(PAGE_SIZE << order) >> 20);
>  	}
>  
> +	rc = -ENOMEM;
>  	nareas = limit_nareas(default_nareas, nslabs);
>  	area_order = get_order(array_size(sizeof(*mem->areas), nareas));
>  	mem->areas = (struct io_tlb_area *)
> @@ -511,14 +538,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	if (!mem->areas)
>  		goto error_area;
>  
> +	slot_order = get_order(array_size(sizeof(*mem->slots), nslabs));
>  	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
> -		get_order(array_size(sizeof(*mem->slots), nslabs)));
> +					      slot_order);
>  	if (!mem->slots)
>  		goto error_slots;
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_decrypted((unsigned long)vstart,
> -				     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		rc = set_memory_decrypted((unsigned long)vstart,
> +					  (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +		if (rc) {
> +			leak_pages = true;
> +			goto error_decrypt;
> +		}
> +	}
>  
>  	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
>  				 nareas);
> @@ -527,16 +560,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	swiotlb_print_info();
>  	return 0;
>  
> +error_decrypt:
> +	free_pages((unsigned long)mem->slots, slot_order);
>  error_slots:
>  	free_pages((unsigned long)mem->areas, area_order);
>  error_area:
> -	free_pages((unsigned long)vstart, order);
> -	return -ENOMEM;
> +	if (!leak_pages)
> +		free_pages((unsigned long)vstart, order);
> +	return rc;
>  }
>  
>  void __init swiotlb_exit(void)
>  {
>  	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
> +	bool leak_pages = false;
>  	unsigned long tbl_vaddr;
>  	size_t tbl_size, slots_size;
>  	unsigned int area_order;
> @@ -552,19 +589,23 @@ void __init swiotlb_exit(void)
>  	tbl_size = PAGE_ALIGN(mem->end - mem->start);
>  	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
>  
> -	if (io_tlb_default_mem.unencrypted)
> -		set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted) {
> +		if (set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT))
> +			leak_pages = true;
> +	}
>  
>  	if (mem->late_alloc) {
>  		area_order = get_order(array_size(sizeof(*mem->areas),
>  			mem->nareas));
>  		free_pages((unsigned long)mem->areas, area_order);
> -		free_pages(tbl_vaddr, get_order(tbl_size));
> +		if (!leak_pages)
> +			free_pages(tbl_vaddr, get_order(tbl_size));
>  		free_pages((unsigned long)mem->slots, get_order(slots_size));
>  	} else {
>  		memblock_free(mem->areas,
>  			array_size(sizeof(*mem->areas), mem->nareas));
> -		memblock_phys_free(mem->start, tbl_size);
> +		if (!leak_pages)
> +			memblock_phys_free(mem->start, tbl_size);
>  		memblock_free(mem->slots, slots_size);
>  	}
>  
> @@ -1938,9 +1979,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  		 * restricted mem pool is decrypted by default
>  		 */
>  		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> +			int ret;
> +
>  			mem->unencrypted = true;
> -			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> -					     rmem->size >> PAGE_SHIFT);
> +			ret = set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> +						   rmem->size >> PAGE_SHIFT);
> +			if (ret) {
> +				dev_err(dev, "Failed to decrypt restricted DMA pool\n");
> +				kfree(pool->areas);
> +				kfree(pool->slots);
> +				kfree(mem);
> +				return ret;
> +			}
>  		} else {
>  			mem->unencrypted = false;
>  		}

