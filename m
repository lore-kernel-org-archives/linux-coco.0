Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A8448BBB
	for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249101; cv=none; b=YCwsrA+3R/VOxlXeaqyaf5Ef47D6Y5kCVn+Vk/LdA07m0S8g5xRQK1pFP7xJxEliHHKuc/Ov3oATNlWLEOWp9UmjHY4C6LuG+bESsqI+Rr4VqLzReTKTSMN2dikx8OgTc+6f3nhEvYQULHDwcoFWKOz+pIK3xK1sHxf84LGJ8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249101; c=relaxed/simple;
	bh=6NJ7tOMwjbPhaKtcUtOtEU/HVu8ov9rsYzJHH2Qdc70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNq1B8t/c93BAVVU9KnaU7TH77Wta4H+1Bkt5geUxIb1G3A8umzTHbE6HgfD+oCdbwXLVPC/wuxaJIt5zOvhZs3wFR4PbnZoLrJ2AaAdsUizggM3aLFvt5OP1sRGp4yFyGaaHe2RiL4noiu0+d7Rur8tTRBVC9R2/mb0Qchiw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PpHlQWx8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PpHlQWx8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495509b08ebso50085e9.1
        for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785249098; x=1785853898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXqe2wlo2yiPOh072n71Jij5i60MC3cIjM/IN/S3eis=;
        b=PpHlQWx8Kcdo91H9nlVNk+VYR650EM7avB+cxBvWuE3guQQ/g+CAFuulu48GTYrPke
         vYgLshLBYWtdLafdBNSMmAZzJuCeUF9o/O8yFpoJkiu5dHpZRw/hk0Z6OfG04RCwJnJz
         fj+y7+y0LwWXw3SPTIEqfSzLOuZ1IF/QFM8Uyw96BwWtcuSUz1fR/sJAXsXT/QAFttJ6
         hPL4tjtgCL5bcMy3pDQ/9siOb0VBun2MlMWeTAb/PK+TqS0nFjbt45wFJliJ7t/LD2Tx
         MJHUWumvBKPkiXSA+3HCJ+x6A3CXHCICccgwDwjTt2CjXldiV+MnllS1hPyig3KC+A8t
         e6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249098; x=1785853898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXqe2wlo2yiPOh072n71Jij5i60MC3cIjM/IN/S3eis=;
        b=a2Xw87O7aLWWni5REGi5XYIz344ikPT37uf07m1yvVuekDgdy8tf47CjTkxlyJRroY
         HgcKw0upIIk33u4cs+J6kdEKA7NAMJSMYGu1hLeSZd0TZQSyRqtSl14R8DtdW+0Wktur
         o2f8DNx7KUvlDnUnvMSii2R3UCznbCX/XDhKhJwuAGKUgZPx7530j1f/Rg/qRYX4YPLW
         oKYkcFpNv/yRmN0TkmiIuSlIvTfbCJyuu+GhcREgc++f7IqBAho82eyvLoT+AQpQdgjP
         zYmRjH5dh31RNlMULA2HhZMx9u7qfnQWuN/3ErqcGPMRceaBD3suz4P24IEvwMc/Bkis
         vzaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTKA+RfK44ONO5j7UL/86ReknfE8PnF8A2mSwm7J2hOfkYNzhWGwwXDCgcUpCS1iIAIIcSaMVudOTP@lists.linux.dev
X-Gm-Message-State: AOJu0YwCDLGE8iRwjohu0aGZx8ovmGJ6M2+GOtkrHdAJjpRkFAdBGGle
	sRJHvy1x1jQ96z3CDmmMB82A37ndeG1CD63HcZCy5f2sP+Rn0YHbFJKpAaUldO2n2g==
X-Gm-Gg: AR+sD10nQL60VVH5Hb8JyY9AJgxgv1dSM9QDfE18Mr0X439laNEC3HFWvs0dMt7IgFT
	umhr9cUCDCe3vyLEGYT+4+fFRYLbn+VfMQKueuXMENDiL8H5fQ3sv+iN3rjVYUM525fJkobEx2Q
	KcMzenMldml5f+NphWDF4e7Cf4GbeoFO9H6S+XJWBEZSvh8MenWFwSGc/SZY8dVURdY0XG4n9mV
	ET27q5Rcnp0CKE2aodAaUhMkp7n5L5ehqfaYs3atBu4u+gUv2NWTyTt99S0YEM3elZNBWiuBfb6
	oxHANQYdlc6gjSPgpwi5gp/nJjydqCDtZEOhAxvsq7vSqL58I1QoOv8kSLvlDYjmDrl2mTY1opX
	nvUoknQ6VHp16SavyN2U0lAuOPO6XyxtAAy4+cYtzuy3jy0Lo6VL1kZ8WJ3SGt6qikXTMoAzCYL
	UhXV1QbivlFQI2ma3u3fW28hDpvsfRgTgCQHgfPMdJN9A=
X-Received: by 2002:a05:600d:6405:20b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-496b53e888dmr48025e9.1.1785249097771;
        Tue, 28 Jul 2026 07:31:37 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm54228115f8f.36.2026.07.28.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:31:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:31:30 +0000
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
	Jason Gunthorpe <jgg@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 19/23] dma-direct: select DMA address encoding from
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <ami9QgMEfCcU0ToH@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-20-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-20-aneesh.kumar@kernel.org>

On Fri, Jul 17, 2026 at 11:34:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Make the dma-direct helpers derive the DMA address encoding from
> __DMA_ATTR_ALLOC_CC_SHARED instead of implicitly relying on
> force_dma_unencrypted() inside phys_to_dma_direct()
> 
> Pass an explicit unencrypted/decrypted state into phys_to_dma_direct(),
> make the alloc paths return DMA addresses that match the requested buffer
> encryption state. Also only call dma_set_decrypted() when
> __DMA_ATTR_ALLOC_CC_SHARED is actually set.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  kernel/dma/direct.c | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index f7f064323bd9..eb0ce0787885 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -26,11 +26,11 @@
>  u64 zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
>  
>  static inline dma_addr_t phys_to_dma_direct(struct device *dev,
> -		phys_addr_t phys)
> +		phys_addr_t phys, bool unencrypted)
>  {
> -	if (force_dma_unencrypted(dev))
> +	if (unencrypted)
>  		return phys_to_dma_unencrypted(dev, phys);
> -	return phys_to_dma(dev, phys);
> +	return phys_to_dma_encrypted(dev, phys);
>  }
>  
>  static inline struct page *dma_direct_to_page(struct device *dev,
> @@ -41,8 +41,9 @@ static inline struct page *dma_direct_to_page(struct device *dev,
>  
>  u64 dma_direct_get_required_mask(struct device *dev)
>  {
> +	bool require_decrypted = force_dma_unencrypted(dev);
>  	phys_addr_t phys = ((phys_addr_t)max_pfn << PAGE_SHIFT) - 1;
> -	u64 max_dma = phys_to_dma_direct(dev, phys);
> +	u64 max_dma = phys_to_dma_direct(dev, phys, require_decrypted);
>  
>  	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
>  }
> @@ -71,7 +72,8 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>  
>  bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  {
> -	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys);
> +	bool require_decrypted = force_dma_unencrypted(dev);
> +	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys, require_decrypted);
>  
>  	if (dma_addr == DMA_MAPPING_ERROR)
>  		return false;
> @@ -81,17 +83,18 @@ bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  
>  static int dma_set_decrypted(struct device *dev, void *vaddr, size_t size)
>  {
> -	if (!force_dma_unencrypted(dev))
> -		return 0;
> -	return set_memory_decrypted((unsigned long)vaddr, PFN_UP(size));
> +	int ret;
> +
> +	ret = set_memory_decrypted((unsigned long)vaddr, PFN_UP(size));
> +	if (ret)
> +		pr_warn_ratelimited("leaking DMA memory that can't be decrypted\n");
> +	return ret;
>  }
>  
>  static int dma_set_encrypted(struct device *dev, void *vaddr, size_t size)
>  {
>  	int ret;
>  
> -	if (!force_dma_unencrypted(dev))
> -		return 0;
>  	ret = set_memory_encrypted((unsigned long)vaddr, PFN_UP(size));
>  	if (ret)
>  		pr_warn_ratelimited("leaking DMA memory that can't be re-encrypted\n");
> @@ -171,7 +174,8 @@ static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>  				   dma_coherent_ok);
>  	if (!page)
>  		return NULL;
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return page;
>  }
>  
> @@ -187,9 +191,11 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
>  	/* remove any dirty cache lines on the kernel alias */
>  	if (!PageHighMem(page))
>  		arch_dma_prep_coherent(page, size);
> -
> -	/* return the page pointer as the opaque cookie */
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	/*
> +	 * return the page pointer as the opaque cookie.
> +	 * Never used for unencrypted allocation
> +	 */
> +	*dma_handle = phys_to_dma_encrypted(dev, page_to_phys(page));
>  	return page;
>  }
>  
> @@ -329,7 +335,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		ret = uncached_cpu_addr;
>  	}
>  
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return ret;
>  
>  
> @@ -450,11 +457,13 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		return NULL;
>  
>  	ret = page_address(page);
> -	if (dma_set_decrypted(dev, ret, size))
> +	if ((attrs & __DMA_ATTR_ALLOC_CC_SHARED) &&
> +	    dma_set_decrypted(dev, ret, size))
>  		goto out_leak_pages;
>  setup_page:
>  	memset(ret, 0, size);
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return page;
>  out_leak_pages:
>  	return NULL;
> -- 
> 2.43.0
> 
