Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E845C413623
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007699; cv=none; b=nEikCJaGuABrXa0q9yTERdpA2ICAKFSCIxb+wiYrDmtM9MEz0tIKW2LNxoM/VFSqxWYrwjM8dqElw0/6p+Y7tl5TiAjOpYXg60+Jhqxj7jkIABVxz90raYzekRdd0bqxgUsmyTYholt+meeMJprFq5cvhk14jQaanp70/TfhzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007699; c=relaxed/simple;
	bh=Rl8HUjA4aTjCFQhj+HDrB9xZW8uuYTv5x9JyXO2I/rU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THuQCYcQauPFr+smKavrrD7W20UImxnVKaaca7ZXodGmZ7EC7CEqrwFgtFUJsvo8f+wWQue7NrX9eoBvIQe84bIWKw3tC5HuVQ3geRUzXGmXqfUf/PbLQ6f2vo0RO+usrnfSSCoek9RwbKkiJO5rpLq1vopFtjQ//YR3xO8pf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G4+A4I4a; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G4+A4I4a"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef0ccccfcso370447f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007696; x=1781612496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y47BTKkIONM0+RQeKdRPDrTRuu7HqPM7iSbtp8PzT1o=;
        b=G4+A4I4ao1+Vg9yOllE4VPpUXYN8T3MepKWjkDsKyX7wFtc7w23355e9mvcYCBFsEg
         73jHR/xi0UiFUbH4W/Ir3/E7UFDx2CTWfywXCf79Rur8w0D5h7gb9GpmvBvJLN2CP8OT
         0cEkYrup6+4WD4Z/BIDiuvRH6ywaPA+tFQZtu0F3f8yqXwKpWg+DqwDinIubgqLm+PX+
         LtHWDK7i8/CatO7LxAEBplQijwm7IJ8Kisy4iNRDVjnntsDZ1vpAToh/dk/YrWEjft85
         qH9zx7wUEOjVF2lnbOc9lW7wbUWd5Hf2rAjhsHMKarQjCmv9igzPc+IeXVsftT/4WEhR
         zxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007696; x=1781612496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y47BTKkIONM0+RQeKdRPDrTRuu7HqPM7iSbtp8PzT1o=;
        b=Ku/3pNSQYeTl96/CLO1YR303IfmPoSw7jVZvnhmds32kSAPfEyIITeLbLa4BdpACsW
         Bvbo0uvANPOCGnMfGLXQGDiRLcTOEX53qZ20N5Vlmh15haMkCJiIGu38+3xVHbONsAfX
         +WG2a7b5IF2Pl/mfG30G8QaVKKUd50Odhpq+1UOtvk9zkTos6AU3QBtHyJcXG4Bs4ieD
         MpV9xpRaIlsYrRxdnCiuErdcy5NotHjDKgjY3yzQ5CgDgFPb9QUYz2SAAg26Tk3Zx5cg
         KYP1rWe7EzRQqhjgwi/lQa/zfnZ0YMV6tkH/PIt5o+eFL7IyVFidSU8U0mk/8CydBH73
         AOnw==
X-Forwarded-Encrypted: i=1; AFNElJ9cjwokzix6AG2mDnN0WrvREF9jCjCskJs3ZIhdBFUEavF4kKKA3FYBNGOxu+KCcdj0k/aMnqJyWcDv@lists.linux.dev
X-Gm-Message-State: AOJu0YyWFdaJbu8RvBBUUgpHsLJrCt0Sx9AUvOTSPBaAkFYFgTMdz8Ek
	NEagceo8evBg6XYyxrcHLASK1xIv31qZYY3t8WmStE6UbxmQDyo3K6giLPcxvgCs8qs=
X-Gm-Gg: Acq92OEtj2B8uLjLrzwYaL+PboAPy2qatxLX0SAbkZ40H2g31/KUFon6sLxCJqaTRf+
	W7wclYezUWqQyRt4L989nmBeptwwXDxC69/POPmtJDICk1vpWfMok+0KM+uCA66UyZvgTrEVsZz
	b47r4d3p02f4xjowRWgZtBzm+SYJQexcCPNDxDzPNEECct0cKayYkGppFaTM2ZEErPuD5Njjpdc
	YWBK4ueGhWED5/TadPew49aWD2efQz/R3jJaDt8JnkiQVit+my5tUzYd3XMLXQ6uOqfFkYYVxJ3
	SZS9v9MeTKnlI9aM4b1MQjTxooV8xoIOfZ1SK+7qY6hsmcxihxNF0rK9nf3ofQiw5dontNil8Vr
	CTYlO3fw0RlrTx+Q31qUS030wAUdGz1refSwiRCMK31NyR0C5FVrzLUb6y5rV75KsVAnZpw5D/j
	CfDu5K09KuFxkFHOlGi72TeM4=
X-Received: by 2002:a05:6000:1a88:b0:460:11ac:d58 with SMTP id ffacd0b85a97d-4603064331fmr16626567f8f.3.1781007696224;
        Tue, 09 Jun 2026 05:21:36 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm60125048f8f.12.2026.06.09.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:21:35 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:21:22 +0200
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
Subject: Re: [PATCH v6 05/20] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <20260609142122.7e721621@mordecai>
In-Reply-To: <20260604083959.1265923-6-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-6-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:44 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 
> No functional change in this patch.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Thanks
Petr T

> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index c2595bee3d41..725c7adb0a8d 100644
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
> index 133bb8ca9032..29187cec90d8 100644
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
> index be4d418d92ac..78ce05857c00 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1391,7 +1391,7 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
>   */
>  phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, unsigned int alloc_align_mask,
> -		enum dma_data_direction dir, unsigned long attrs)
> +		enum dma_data_direction dir, unsigned long *attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset;
> @@ -1425,7 +1425,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	size = ALIGN(mapping_size + offset, alloc_align_mask + 1);
>  	index = swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &pool);
>  	if (index == -1) {
> -		if (!(attrs & DMA_ATTR_NO_WARN))
> +		if (!(*attrs & DMA_ATTR_NO_WARN))
>  			dev_warn_ratelimited(dev,
>  	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
>  				 size, mem->nslabs, mem_used(mem));
> @@ -1604,7 +1604,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>  
> -	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs);
> +	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, &attrs);
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  

