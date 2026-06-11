Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95C3DA5A5
	for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177864; cv=none; b=CY7HUH+qcPosr6/GgBkWBWQlofQXeA11rbiSk8VSzYcSy1f+kVMt/crEQ+BBOPQzQ4xIyxmo198UkH2V34mykNrFywie3vxEugBxA/CfTisXCvkJ/orIC6ax1ddc/68fYQhRxFsqJHtNnAEsGX6h/K2tvHDgcxl0/yWjwIxVXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177864; c=relaxed/simple;
	bh=orxD3R+xslULBC2Qa+4Si7LAvHUVQFpXJKWY1Fr3wjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPfNSKGbkdvMBjLvK/YHchzA3cJN6qQuIQyGWClF9gDFJ0uLo9NdhACb6SMI26XTNPgqIeb7uGYM1l9tRMzTSiMBzOgVn8ETloqRvraxR5FPZ/innA0BtS4fxTANGRaObK1MWyBvghiE5Z4V+8p9L1A14lIgwksmZjgmTSsFouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TFVdIrHZ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TFVdIrHZ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ce3876a50cso80032076d6.0
        for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781177862; x=1781782662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CsqKJTBvj+SobIiLXzFxApwnBR8BVsF1yARBI6K1lw=;
        b=TFVdIrHZ0tS320SxQ3wdg/Yk2Ti1PxH7+EYUWiKtzEJ6WFor87OkFs4m1bY+JMfQ2D
         +X2YkrL2tDbhOcW4mOBXZf+WqkMachSwO3tJIQNbCmFjsEBF2A9f/K7izt9XhAAFUac3
         E3xEw51Vs1u501ehM8sIK8K9cOhiyu/YuMURiuJ41C6X2OKMBViYLBfgnqnpfnclj68i
         6VDNW2LV18Vvv30RNqps7eKXgjG+1xvu9Ovgc74+U3b/poGZwZ44mEKH+bpcwpUxdvW4
         nD4CtZxs1aab6oU7IMuABiS/OMWrQ8sgpZH/GbiWaxSLScUY0q8VW5d/QnIF+xjvvjFT
         BCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177862; x=1781782662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CsqKJTBvj+SobIiLXzFxApwnBR8BVsF1yARBI6K1lw=;
        b=iRTJxpXZgkhihAmGM1iYnRPMATP06g1tWd0gQb1Kylj/YQfodhI8JQI4JuM9VKjyTt
         sZ5uhmNkd7SUC49wOIkNOvrllqH1iQRVtvgT/JJ8lB5azbakCjeM5SBaYERGqwRjjtmB
         nnQ+CCpaXMK9PRcHdDjPQoOnXm7PbqSDiJ6MzQ8BTud1z73Rn2PP4kfw/zHm7VHdY/wK
         MFkU3Q0KqIHIslP/uCG2OOIOLJyLrDuTO2ecvLOrHZ1vbkhQjt3ZneHVIgT5WWePyjzO
         436kESao/Z/rWHFlK9S2sMetqfpCZuq50STBA4rhvqZqmKoZy+k9pSv8SyjgA+GSRAat
         d6pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ITPWkHOt5TopwNeT+wcUIkTJfCJEgjj1DDANfqsq91caloFDyhbNn4fcE2innsO2hD1yqpwfYTXNl@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwi14tgOJm0EmZUrRoVsP6Vtdsu/LxWHY7typHxXFZlANY/ahm
	ZshhFIWa3kSYdM4kZky5NMk4K42KsGv/FjvyL3KXq8eak6HErenWDu3TVLi/g3kJku4=
X-Gm-Gg: Acq92OH5xbatc11cP29fVfd7OxuM3FBIa2nv1OEW9aiz/8vFkILyNeC0h8SetO+9jWe
	cDwWWiJ/T6RdjNlftax9s87q8ja2wwGRjfTLbCHlKVzbqBm9ScrUf5AZ/lh5bKYkTzc7SRPnGzW
	41mWk/DZg7nY982bbhhlRQP6URz4DisnW256SuBjqf9d0hf7OHmbmAXH3/d2deqmbgbTBQlzH8w
	vJA0cXW29x+CudX+C8iqcoVgSbQEK3HMFcMQQm2hRHLahAduB6ge7Y2pdovNXOI7wIuyR8xRRUY
	1U+R1Suywj/nwu8DVSTZ3Cm1brVJQE3Ef7IYYYQSCIG5OQlwffVkl3+pctH1ab/L08Y+pLNWEj9
	5S46HNFMkIPNX3jU3CIjUUj2vkwYJRr/t7Vjf7uZVeAmDuraznMIt++nybaykbDMO4bw5jwNn+v
	AXA1Ga76OYmudfgRV7d34VagbXYSkQYcVl5rZYmmfCI/2q9wm0G2q/VyoT9calcjsPRuqOLOsXq
	7M6ZcepkmraMxqc
X-Received: by 2002:a05:6214:410b:b0:8ce:b2e9:a4c1 with SMTP id 6a1803df08f44-8d1d8cfbdc0mr38674016d6.14.1781177861623;
        Thu, 11 Jun 2026 04:37:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1e838f586sm15478786d6.20.2026.06.11.04.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wXdjA-00000005ezW-0ftx;
	Thu, 11 Jun 2026 08:37:40 -0300
Date: Thu, 11 Jun 2026 08:37:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260611113740.GB1066031@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
 <yq5aa4t1myw4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4t1myw4.fsf@kernel.org>

On Thu, Jun 11, 2026 at 10:55:47AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > The sashiko note does look legit though:
> >
> > 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > 	    !gfpflags_allow_blocking(gfp) && !coherent) {
> > 		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> > 					   gfp, attrs, NULL);
> > 		if (!page)
> > 			return NULL;
> >
> > I don't see anything doing the force_dma_unencrypted test along this
> > callchain..
> >
> > I guess it should be done one step up in dma_alloc_attrs() instead of
> > in dma_direct_alloc()?
> >
> 
> I think we should do something similar to what dma_map_phys() does here,
> considering that we only support DMA direct with DMA_ATTR_CC_SHARED/DMA_ATTR_ALLOC_CC_SHARED.

Yeah, I think that's the right idea for now..

> +	if (force_dma_unencrypted(dev))
> +		attrs |= DMA_ATTR_ALLOC_CC_SHARED;
> +
> +	is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
> +
>  	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
>  		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
> +	} else if (is_cc_shared) {
> +		trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL, flag,
> +				attrs);

But it would be clearer to put the test in the iommu_ functions I
think, since they are the ones that have the issue. We will need to
fix it someday..

I think we can ignore the op-> functions, arches cannot support CC and
still use dma_map_ops..

Jason
