Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA074219E9
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010756; cv=none; b=QEqPckyjiEbnyQOddLFRtZ61ZjBSrERPoYY9mGZvdHslQ9q4VfafgHUbDUrv3HLzn7YLrSjHK83BuUsWCo6aTYridLuNz4RPOOhdG1v47DIfmDEtL/fp7dkv4Np4Or6F87MN8x9GFi+ZX1pOHqR2KMNW4RIUprvEVpkH/P8VzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010756; c=relaxed/simple;
	bh=cRmrex5oPCwg42dkdhJaD73cEwhY7jfqwVZ+TJf7vSo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/O9RYGBP5NFxqakZ87aAuzNcnFrel25gcO81K+TE2i6ZfS5g9UzEztHHoxjg+BNzdjAqff5H91l+8BNCIju5OZT4zkfujJGag+KFh29MEudmmqW36FvCBDiB38/bNvv/tZNLBhzf7OoCINZhrMO8MRV6ShkWIcg32IYRJds9aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VI+azN29; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VI+azN29"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c28f84fdso9551925e9.0
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781010754; x=1781615554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOb0YWdrCyqRf70PqWxcCcSyY2RJrYltX6EkSx4+w3M=;
        b=VI+azN29saguK39X9YkY6UqcJLDr8c4i0hv1xEz2YNGH1PYV5dR2etPSGRS87CXsFB
         +eSJc08/mfMBRJQoVgk151iSQ0kXz3TRCUMkpdWtsiZxtqEPtbdjDIhRpkZxDRxmpxNU
         c2QSDMPPL7WOiNBw2UXyya1j7HHl8NLgzp9hmoY1qvxGIAtV7HM6vVW01xxQoXVKW410
         F45bB+SGntGcBdn+7Tkq/qLUo29FgT7Fq1JXGBqmQTDuWdnmq9Mc+7x8SiFbckud4VMD
         mhgKzFegKW/LVE9JRsya3uSBQV+DC8r/UoXjfXTE7lHUIx6pcGstjgq6f5GxFRzviQjh
         +AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010754; x=1781615554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOb0YWdrCyqRf70PqWxcCcSyY2RJrYltX6EkSx4+w3M=;
        b=OJD0RV7+2yMK/hMvKq7sWKYZpjyc0ICWuFRjAMJ0ZoPQ9HT2YFSlanSG58za2Q33Xa
         Ls0fOnF/PYbIeGMH6SRrOXT+OS2e8WXdTcJ7A3AnferRtZV1Pzd9BeZ0V/JFA+CkJmrA
         /Az8TmaG8wVymxhq1b4rHvvgcqdg5L3BG+d44ubdp7WpeydWEh1GTvKjuT88dybV23tl
         HkYxcamptxr2GBuQVUZcaE8jg7hMKjOaDTVQt2ZL19NZ+yuHxSLhCmafZ8b/mK15KV1p
         m2Mi5Hb0Ji2wiHKH8gU0I9i8k+fcZ1BN+xsbxeLRhdEgd0JYa3WcM+4qvwotJdVyMAAR
         aceQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uYD7iBG7jeo6PMy5dG746KFRnSB2TtKFSxtGbgcCKJuVJnBLHDdX20aQ5qe3j9neSv8h2vnIPhsd+@lists.linux.dev
X-Gm-Message-State: AOJu0YwTBN9wV6/x63VfBwRC2IUx/bKEnOJSgNOOOtaZCufNzWlrack5
	H8GQOZot7IamHkDwedkQIohDB25IYzuPHyOZPoXMft7T8qualwUK5Q2rxlgf9CNeBkQ=
X-Gm-Gg: Acq92OHPAYiwuTp581YSXGxaoSYmOfn1SAOlmZu8+7vYFPwcSgfsdq5+lU+zq1uU+nr
	2DJNZrq9JOlSOUdCjHdSHu/vRPj89V7YacTzH4NVlA8kINvfQ7slpbAAL7/6XQSdG7ydR6rL25M
	9idkKblXFZKrwOjykPBljUudtgVOgfLSfBCUGbpen2GLtgl/5jutb+EFzQi2NJAcOVlM846YnCO
	TJj5hAoJM0Gtm+oNWKX12ejchzT3fiEKHDb1PUCK9scjINh0/QGQYVD2BmUq/e3Xen0cQoO1uw2
	nySGNz2EPw8iWV+Kla1qXN5rh7ziWtgtuvRIfS3tI/UxqCz5E3GrbOzdeaAWFcopHjdKJJ1FCxz
	1zUbJDhTdSj/u1xDwDL/Y3mi2gYghfaWY92lcHqHemMxWjddIcuW8TyoEljsaByDzk/FBW+Z0aV
	H1BafDnXZLbby+1NKk1vuZEOY=
X-Received: by 2002:a05:600c:8b65:b0:490:b4d4:5c16 with SMTP id 5b1f17b1804b1-490d72759f0mr16962775e9.8.1781010753634;
        Tue, 09 Jun 2026 06:12:33 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm111677469f8f.29.2026.06.09.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:12:26 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:12:22 +0200
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
 <svens@linux.ibm.com>, x86@kernel.org, stable@vger.kernel.org, Michael
 Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 14/20] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <20260609151222.476a5521@mordecai>
In-Reply-To: <20260604083959.1265923-15-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-15-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:53 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Commit 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool
> helper") changed dma_direct_alloc_from_pool() to return the CPU address
> from dma_alloc_from_pool(). That fits dma_direct_alloc(), but
> dma_direct_alloc_pages() also uses the helper and expects a struct page *.
> 
> Fix this by making dma_direct_alloc_from_pool() return the struct page *
> again, and pass the CPU address back through an out-parameter for the
> dma_direct_alloc() caller.
> 
> Fixes: 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool helper")
> Cc: stable@vger.kernel.org

While I totally agree with the reasoning and the fix, it's interesting
that this bug has been apparently present in the kernel for 5+ years
without anybody hitting nasty memory corruption bugs.

How can it be? Is the buggy code path never actually used in practice?
Does it hint at a missed opportunity to simplify the code?

Anyway, these these thoughts are intended for a possible future
cleanup. For now, let's apply the fix as is, of course.

Petr T

> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4e446aa4130e..e0ab9ff3f1d6 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -157,24 +157,24 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>  	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
>  }
>  
> -static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> +static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp,
> +		unsigned long attrs)
>  {
>  	struct page *page;
>  	u64 phys_limit;
> -	void *ret;
>  
>  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
>  		return NULL;
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, attrs,
> +	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, attrs,
>  				   dma_coherent_ok);
>  	if (!page)
>  		return NULL;
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
>  					 !!(attrs & DMA_ATTR_CC_SHARED));
> -	return ret;
> +	return page;
>  }
>  
>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
> @@ -270,9 +270,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size,
> +					dma_handle, &cpu_addr,
> +					gfp, attrs);
> +		return page ? cpu_addr : NULL;
> +	}
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size, attrs);
> @@ -445,7 +448,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  
>  	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +						  &cpu_addr, gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size, attrs);

