Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C44117BED0
	for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249701; cv=none; b=U3hKGulQIDGmw1aUOo6/q7Z+Afd7VJGOBZVukcOhYXx715Yad/CgzfyBq0j1vJZnJCdq4n4Na9kaBbmjvxFL17R/XeS03UUVcp+vVM/OjJ8FLluWoLUNBhsJagDmmGUaNrdVcyZdPVhKnC2kw1+76PgL0rb1B7VU9dzCzsniPwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249701; c=relaxed/simple;
	bh=HyNNoVnivWfWMKFmKPjajYoM7OeYhzbKX854ccuv5SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riM5GOCmOT82DVdFDQF/6NzM2Kb9suFoXMUnZDmZi8sXC76cpBQzNJie6cgPZKt17IUo6bctUd7mPs6ioGNlLivQCJzlhWfHAtfDmawJILQj5/kdvYmxcck9lnwYkQgBjWqVfOlVntlfPrZSU0njrVQ7EKPzLTpXnVxrRqfe6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nZCi1QxM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nZCi1QxM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495509b08ebso51225e9.1
        for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785249697; x=1785854497; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCZrUOE9kwIF4hUfSxEIdPGLi7SYMbxXEbVOya3wkPE=;
        b=nZCi1QxMNLpboyj/G8xvxbjUSDUfSUnVdVfsclOeqZFLa9IDM2aFdIA/gXHwQSFoeg
         NsbQqflcmyLbiDfG8Z6o+4WfpDQ3ksKKqiG0uoAoCMpmE/4LatVuI8lDg0HZg2Zcu4AU
         rsFysvJnMtJfgLugTXrcauP8DYOlHDsY8cYFOGeJcKJm9ciwmNQHwqv4PdJIzI7fC1cb
         cCaGk2acRqmoRcbErbLOC2u+Azk17QgoJxo7HQKm6PakmjPz6Bi6x8khu4EUZqOLM4PP
         8Su4kTOnpag1rM/9BbYAU5Wd/NzKT/7nZYkAvW+fj/GyJnbOVXbLYoqkRoPlD71jt5HP
         flag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249697; x=1785854497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCZrUOE9kwIF4hUfSxEIdPGLi7SYMbxXEbVOya3wkPE=;
        b=q5uIW7GmYA1UasAvB5xoJxcBkI6Hu3zYEFNGFBrKKigt7axl/e7+2q8qpwbBlyNnU3
         025EKtcIzPPgR/5swwOq86NId8jmUeifMplb5F/i4ls2TKJYqYEAz5lQdxs4ShCcNl0T
         PxVFctK8Ylk59nmcIFwb6vBnhuZAlFGmBgF6EHleMIMaDpu4v4QUXQyU6qHn3KqtHZ+i
         laVaGazhwH3E4wBHmHGRIjTo/l9fyBSB8u8M5NYS19ztiFklstxZjXoj8S44Zc9zZLT9
         dWPeW0S/zFrshiy4Gl4UaSkUF9tj36QmMKcYAq7a22Poc49ssJILzLPemlR+BfSkfu21
         XGWg==
X-Forwarded-Encrypted: i=1; AHgh+RoqqI5NAMlIdREFnvN5Hx1UQ/q/BGm16eCJBDVW9yFEyeJzIo97PnUpMapJg9Tfwf7c9r7T1YxZ23TQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxwEYCiEwyK5ufyKZrFbk20UtMPkaJIYp+7Ab5iMZsK1qoEqoni
	xiPfw2hRuLbtrzXubnnwioq/J59y7l5N6R95ZS9UltDT395JzPYY3ynnmE49/Z/lmQ==
X-Gm-Gg: AR+sD12aiLPMKr6bDEXaWJ1RRCWOPn2IZkV/HSwysiWw76fEdWUO7NP+lkIGcdooGBf
	9tWIyhwhSyzpb+Wzg2THIU1A7r1Ydb+BbeASWWGPn7IUZy9XvhLBzW8bhcgcU859UtlE7UHwD6b
	smco8P5xp+bzEZXM7d3j/KW/nzSAkTVFFYRUrqJenTg6aL9PySTwxDQDT/IBW6os0EZEXNUK3tP
	B4CVckvpQz1tKsC+Bny3/8erMZ9RW+v4Id+fz1BFwLjNV8Z9C2hZ/Br94e9VS+jnBi2Hj+gwTH+
	yVeImKawzYsu7I5y+GofY6ksc8bms0coY29vJrvmSx2Gb5a5dCeiMObPZeJqLYjOXEcf5OxLqoh
	3qJ3EleIxr+pJ5SqIjEYB2uKfrqlS4RbvQXxc/l5vrBNtV6WAzd/PUuaknmLy4bejumbzoxPKgu
	sQPhmbLaCVQaeb080ugon24WzdQN8o1l+8t/6N/CoQoeU=
X-Received: by 2002:a05:600c:528c:b0:490:ab15:b9e8 with SMTP id 5b1f17b1804b1-496b944f535mr5111045e9.2.1785249696887;
        Tue, 28 Jul 2026 07:41:36 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c338fsm83874795e9.8.2026.07.28.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:41:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:41:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <ami_mpd_1pF4Tmdu@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-13-aneesh.kumar@kernel.org>

On Fri, Jul 17, 2026 at 11:34:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 

I do not understand the point of this, why would
swiotlb_tbl_map_single() force attrs over the caller which should
already know the context (whether DMA is shared or not) which case
would this be useful to force from the SWIOTLB code?

Thanks,
Mostafa


> No functional change in this patch.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 83bf15ae9777..c42e40e60575 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1180,7 +1180,7 @@ static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
>  	trace_swiotlb_bounced(dev, phys, size);
>  
>  	phys = swiotlb_tbl_map_single(dev, phys, size, iova_mask(iovad), dir,
> -			attrs);
> +				      &attrs);
>  
>  	/*
>  	 * Untrusted devices should not see padding areas with random leftover
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2cbf2b588f5b..8c4abe65cd49 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -243,7 +243,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  	 */
>  	trace_swiotlb_bounced(dev, dev_addr, size);
>  
> -	map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, attrs);
> +	map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, &attrs);
>  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index c92ff6791595..ea4c0a292dea 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -238,7 +238,7 @@ static inline phys_addr_t default_swiotlb_limit(void)
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
>  		size_t mapping_size, unsigned int alloc_aligned_mask,
> -		enum dma_data_direction dir, unsigned long attrs);
> +		enum dma_data_direction dir, unsigned long *attrs);
>  dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs);
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 908de28aceb2..046ae92c4832 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1396,7 +1396,7 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
>   */
>  phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, unsigned int alloc_align_mask,
> -		enum dma_data_direction dir, unsigned long attrs)
> +		enum dma_data_direction dir, unsigned long *attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset;
> @@ -1430,7 +1430,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	size = ALIGN(mapping_size + offset, alloc_align_mask + 1);
>  	index = swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &pool);
>  	if (index == -1) {
> -		if (!(attrs & DMA_ATTR_NO_WARN))
> +		if (!(*attrs & DMA_ATTR_NO_WARN))
>  			dev_warn_ratelimited(dev,
>  	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
>  				 size, mem->nslabs, mem_used(mem));
> @@ -1609,7 +1609,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>  
> -	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs);
> +	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, &attrs);
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> -- 
> 2.43.0
> 
