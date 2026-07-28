Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088C3A9854
	for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248683; cv=none; b=fVdXQQtPqfwzZOMQqSOfef2D1N0iF0n7dpvt+O5c55A1aUAFrhawQ38rm0sENdXDUgOXfXH98xdliBK4OjWWOWTc1aXYaeIoMJLi9ysHuRow/jeoZv+nOfbmLfzIWV6zIOBul6l5Kh5jMZYKlqInxsV01FFVt+28b4linU565aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248683; c=relaxed/simple;
	bh=4XOJjc+yumy68KaAaTWxwFxLNiGxWo7sfJLrQMd0YX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz7k9ejNBhmFG4YqA05UvPpJ+dWF38XMQcxGdbrxE1ky1sGzpLTwIot2RXbqD+9/O4f9ZNGgOeNToJLrlDITRfB49Fdel4C0XfZl0S3tJRgUgM7tQdLv+kStOgamRaKUr3jdwrOXAd00wiqs4QlLWwoNI7xEE9j30NeXDhteFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7rj1UTa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7rj1UTa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so62005e9.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785248680; x=1785853480; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLh0JMDAJYh72m8FtF6BfLrBflAoWAmkZ9Sv6YSjD4c=;
        b=d7rj1UTa8/+EsUST5Wu5Met3JlmKeZN/X0AK49IMkkFH4GyIWWnimqdRBy5LYr1CMO
         23eGhyImmJCpOY52F3EazHIraTJ0mNPunuhJsPDF3GpjUVRGprKcSD4tiTwQ8sHtxfaa
         1U93UruER1ghHe1rjKQtLbvNyLnGOvv/GiY+hmu+2e5eh7ytaluj7iXCM6FBcJEZwTyD
         sx/o+V//ptljd1o72N/gMP48RUyi++862xWUfsZ+uOAsyauQwdtdhefA1XGjY0oozAZB
         GDeAXph6d4614kAYoEy6gjXwQD4N8p4ATY6g4S5yNsnYVPmcP/zSn7eAWzS+Qu646lGv
         YWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248680; x=1785853480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLh0JMDAJYh72m8FtF6BfLrBflAoWAmkZ9Sv6YSjD4c=;
        b=ACxfoHqpKWMCkKTA2LpJX4PSPj9ByqnAGIaDljNdicAoySDJZjai1eytWY0ftTTSQL
         XpcOBrptVLtBxG4HAP/FS4nuXV+chl3JEU6s1IRh11pCQ5VyNLymQYk0JJIX+k0GQCZp
         Dkb9nmDVp/pthnHW6YJqu7NrVsuQA64hpy6/IWQTRLXdOyioB0jZR/XXXBj4PSEe3CkS
         npQyG6k9p5MJrNhUEWr3NR0J6q6p7+ZAkUN+o5PNUlhfnWlEJeGKEoBZP78rxug4DsNx
         rNWyWykNFoqYMkTkX9ELMsHfCtX1MpsYeq8A+di5CT6+2syGnm8E60g2GbcZEkkgsZEH
         oSHg==
X-Forwarded-Encrypted: i=1; AHgh+RqpGuRXY+GevGRNXTSlE3I49bHYGG/Go2fDEXkjfsSLJmcBuQ6d/d/6AuFCfOKrlb2NZ99sHUQ0jl30@lists.linux.dev
X-Gm-Message-State: AOJu0YwLonPzy5KE7Zm7smU4nnU/yXLGjet+srnj4JjM51UOKUn+C5sC
	/ICvozpADmpwuqJwwgTzFTR+LdgJ0oi58Z8WyQFFC1c3F8DsYQWxFZdnOqLFeNlUkw==
X-Gm-Gg: AR+sD12OxJw1njafPC8XdRoF4DYf2DsAEBuxERery2+mE1nqo/pJ1IustihDAUccFz5
	FvEcxN/qJy5QYwt0pHkmzmF5Cy4lte8TTooWms4VbysGvvhOHndmrV9XF6s49ArLc3nvGFAYVPm
	l6ApYOKT9ZQUAzR+LRsidcj6A3RyirKYBX7NCy9vnq5FZIBBqSpGstxbKX4/SquT+pT5a6FTozM
	3pBgjcBYjzRSgiZzTIs+s+leEmbTt7c+deIPHztrhJ4rXAsAQ2zFqyrjN4p9GSiOVGFFHzMeG1X
	7bCpK8+hTSYlsEh284JKZ56UDguPB3T6pUO99vPHSzdEiXEYLne6qQ3LnRsuVhImUhKr1HMhSpl
	3vdVZtfZ/Q/Jx5pb0+zPi+kCuuQZhO1mSBszJkpQD8tPpv76nwom0TafsRQ/IzQNC8h73HzBnQE
	IXlRCd8htJzR2DlM5GU5xveRECmUC3zFjmafmg0jpu6xk=
X-Received: by 2002:a05:600c:35c2:b0:495:5515:3c00 with SMTP id 5b1f17b1804b1-496b53f7910mr71275e9.9.1785248679759;
        Tue, 28 Jul 2026 07:24:39 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm79447515e9.0.2026.07.28.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:24:39 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:24:30 +0000
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <ami7nhBTXzAfqoVE@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-2-aneesh.kumar@kernel.org>

On Fri, Jul 17, 2026 at 11:34:19PM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  kernel/dma/direct.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index d8219efe3273..363d984d90e7 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -164,22 +164,21 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>  	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
>  }
>  
> -static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp)
> +static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp)
>  {
>  	struct page *page;
>  	u64 phys_limit;
> -	void *ret;
>  
>  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
>  		return NULL;
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
> +	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, dma_coherent_ok);
>  	if (!page)
>  		return NULL;
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> -	return ret;
> +	return page;
>  }
>  
>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
> @@ -247,8 +246,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || force_dma_unencrypted(dev)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size, dma_handle,
> +						  &ret, gfp);
> +		return page ? ret : NULL;
> +	}
>  
>  	/* we always manually zero the memory once we are done */
>  	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
> @@ -357,7 +359,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	void *ret;
>  
>  	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +		return dma_direct_alloc_from_pool(dev, size, dma_handle, &ret, gfp);
>  
>  	page = __dma_direct_alloc_pages(dev, size, gfp, false);
>  	if (!page)
> -- 
> 2.43.0
> 
