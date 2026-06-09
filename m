Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B729BD87
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011609; cv=none; b=K2zqMV9gU5OR2ScVb+onF4zmZb7KcC/Q/Q21ptyLni+hKDJl0mRKwQGm1+zmwt6gy+tWzREvtsqb+7SM8YZD+sdD8G1rU+nNqnCFu0J/kOJ1zkjozJFYJitdC5blEmhGGA60TgMX+hSiZIfhXP5cRWRMhRk8ryxF1OYw1OziUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011609; c=relaxed/simple;
	bh=twwp9hFllxfAH5zTiaxs+mflqhqxD3N7oFJ/LghNab4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A66goM9iwCfCRJoebMNGZ0bf1FjngBr5OC/vrz9lio1j5pxWkHDOSZg6sR550Ijy5JNR/2NY7ePy0H3lwaGGqHq5AuIMar7l4hrNvgQGa1OI1pr+c3c7FT0lli2UUQxKNxHgePv8iDWEU+Vny+UGUm/sMDMKHMxWLjMl20PF2b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XuRXDZ7L; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XuRXDZ7L"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8adf813so6028655e9.1
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781011606; x=1781616406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Mb3ECCQF4KDrnD1oEZunr+tebvyQKuHVVgCgeE/hK8=;
        b=XuRXDZ7LdWnvnkgIc3avGgSurHiOPkd4dwZnADgOVv1hF530K7EqIfzEQi7QCvEiH7
         XtNmjsxsfuJwJTxNxNuG8y+LuDQy65ZCEZggzt9TPcZCrR+u5uq3KjK7PDWZUj3IpzDg
         EbTfOAgBVGcTanP+lb5/As2jyoDFnQxC3Z+8QteNSYNupnHgL5Shddn/Yqb4hnS797p2
         A1NN76b+7S1oS/MOg8cnHoA91mXASkCFyQZNNQM81ukxqWl/vywztdeGMP57eZoM5Jpm
         wo4o+5WJqO3pwn4FJSPFislvZVxsCzxkP8MfTAKRdYGh4pAdyg8Ix+xzSYhzz32Y8bok
         VZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011606; x=1781616406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Mb3ECCQF4KDrnD1oEZunr+tebvyQKuHVVgCgeE/hK8=;
        b=buOWLcXdbgzf3qg4ugcUpDzkNIU8pmHSBZ7cgA3Cpas8+11zEog+nrwZLZhYpnw0Yg
         sU9SUoLhuwbe2k30SfET1e4lc+UuPNJIDnSTHL1vv7PTWbsV8wNrYI1ifKDsKvqRkmiE
         jUXMIobc9YlzEd+rej+1fRdEdkMqfE5Pfbs2n6y71hEjyIoIDOP+yyWc9BqNFrY9dBKW
         4jC2Hp/PaOLvi9BCn1/jefHQmO3NA7tvxOOSmYdfbnGJ/BiDwbBo6ueuS6sLua7LySdI
         yWA3mdBEuGNumuOrxbETX/kMqEDDdxBrKVtt28dTjPtQVWsJI34LXgB40XGbb+hHBnU7
         XMIg==
X-Forwarded-Encrypted: i=1; AFNElJ/yWsd2pr4o9+HOjXhMudud+58S3QVqqW2AmUbRke82qLUw/fxdyAUWsX0K/pUx9ioC91T3j4WiTcI5@lists.linux.dev
X-Gm-Message-State: AOJu0YyJlHwNupQIjnc6+Yw7FHh47oGYtgxKPz6XOsQa62CsOdsXgkdH
	+Nkw8WDiapT8uZPK7Z0tVNdRr1D3ErEbNSl2udwv1sBqDGxLHyE5PTi4VhEZBWDdN8Q=
X-Gm-Gg: Acq92OHTlV3oJCOHR5bblNWAq/59FFjJe8WOEE9lhh0gLmurNeJp43E6YfMHISld2+v
	8rWDEwCMZ+VofU1oDODn2MLKz6EhzM29PiyzvWB+aOvz4AJxgE+FISjsG8zbtfPb4L56ocmagfB
	BRuip24lg+Hat0oFrKDxHJCjRMc7N6AZgFHWViYzp00KNAXNJLYMZs9l+yBmGA4zupkdwUXd4A7
	Alci8bzqqFdhbFMgzPT13SLXDBx+Agz8Stb1lGZa+f4vYhuRbl2z5MymCwKiBX9E71limfafEaL
	AXRTrxuu765RB++eiY7Pa+EjbjfBBzefb6T4GxJzVDXR4V3itFpnRaf9wYLaCaVod3+SLCzGwOY
	HB7Oer+A5YHSAyAOogCGq2VR5IqcAnEuaTkNtgjedP1Z5jnF+AuYp+ymfdqTshPuFLk+9Dv8qOx
	UV9n/16x74rbnMVe9GdicpvIg=
X-Received: by 2002:a05:600c:8705:b0:490:3fdd:d344 with SMTP id 5b1f17b1804b1-490c25897eamr150306735e9.1.1781011605912;
        Tue, 09 Jun 2026 06:26:45 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm469464095e9.5.2026.06.09.06.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:26:45 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:13:54 +0200
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
Subject: Re: [PATCH v6 15/20] iommu/dma: Check atomic pool allocation result
 directly
Message-ID: <20260609151354.534bb18d@mordecai>
In-Reply-To: <20260604083959.1265923-16-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-16-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:54 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The non-blocking, non-coherent allocation path uses dma_alloc_from_pool(),
> which returns the allocated page and fills cpu_addr only on success.
> 
> Do not rely on cpu_addr to detect allocation failure in this path. Check
> the returned page directly before using it for the IOMMU mapping.
> 
> Fixes: 9420139f516d ("dma-pool: fix coherent pool allocations for IOMMU mappings")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  drivers/iommu/dma-iommu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 725c7adb0a8d..52c599f4472c 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1671,13 +1671,16 @@ void *iommu_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
>  	}
>  
>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !gfpflags_allow_blocking(gfp) && !coherent)
> +	    !gfpflags_allow_blocking(gfp) && !coherent) {
>  		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
>  					   gfp, attrs, NULL);
> -	else
> +		if (!page)
> +			return NULL;
> +	} else {
>  		cpu_addr = iommu_dma_alloc_pages(dev, size, &page, gfp, attrs);
> -	if (!cpu_addr)
> -		return NULL;
> +		if (!cpu_addr)
> +			return NULL;
> +	}
>  
>  	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
>  			dev->coherent_dma_mask);

