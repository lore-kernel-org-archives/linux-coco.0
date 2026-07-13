Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110F3546F0
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968494; cv=none; b=Gi/AG4EwUjBdlDMrom0N+hL2Fg8GsXiCPidz7nhgT3KcxFSGVwzv1Llat/zCdHW61mLutmFUzIZazy/UqbNcjbZPY3taeJyukvvsLzbVs/eXQfLXj3aAi/cuHsJSPQsTGPYm3cQWb/g2d9YrNOxiVx8DMbiXxlEK/hTBNGBQxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968494; c=relaxed/simple;
	bh=18BF4tvFtN7rb81d7yZbxHf143U9lHFn+oOlQiGvmi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJC5fFJH0/OZRJ3HXJepRnvOCngliNW6R7ZAKmb5JJ6NsLOyTTIELeSxNHxfm3xQGRZ1OsPk/aF1NuYu3tqm6UfJl6nxrQ/BR5oO+CIU7Om9TfXcw4eFPFR/CLGNApDZyJ299HHNUvJeQ/W81KDIUkpLEvobfIqhqn3lxlspFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dSEjc0Jh; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dSEjc0Jh"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ff88549786so40962806d6.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783968491; x=1784573291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4oaM697jjJh0i29DhT77Bw1lzVGGZ7UjxKZh4sSss8=;
        b=dSEjc0JhoGM6UOpuHc6XII2x7cUJRO3dkm5Nk1xWHFQAEElLdZm2xJW+d9XhAnQMKr
         tsp6EgSygFAw8CO5aPVWOCwy3z73QRJg1bzdcPO6bsWXD9U37nwQ0S/4V6UIW3GgRBWE
         WiNvSP2TFNYjtTGH9amAGYUDrd0LU5RotoFRVpwHVpi+azAKNWueNuUvQd7lKI2vXJYl
         yjYW0+hvu7Wxz+8w8TF0vg4zdf7KekOzMjhhqRncvP/p+nOI/32J6ifnMPb6I3HFSQb8
         DnEl1q8GF3snn3N9/LUJtyYSjrjmSJXMfQyWHYKyvGqbrYb8jtEpiXpINxoLNoLq5p25
         I4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783968491; x=1784573291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4oaM697jjJh0i29DhT77Bw1lzVGGZ7UjxKZh4sSss8=;
        b=qknvFgQfISjWW+UUeiK4aZDvx198gCNrcghNfC2VlwFXibNpgZgn/56RkSaA+XJtig
         s8mAW1vNix5SyexgdnIuavjtV+XhUPG2mb9cE7kpslfnCasV9Vxr5Q5Zl3TsWYAlxMSQ
         vJlBixtgF3oVXNQOOGl1OztQF0ChUNbzun6QE7NrBsYqT443KSMhhTDkusw7753ZyN8P
         mBzdisVNx52b4GG9Fp3pYWscvRYla5+bIcmigqL2JmlAs0x7nU7bYQLPRhVSKJtPwEx/
         cPvQCAxVbWgJjmxX1VlFRIlmQPHmo8b/UiiK5gNSOVmWj+VejnGBgGAiROG6FckV51TE
         nvUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5LSXLVL3VHUU+wIPF3gLV/JSbXYmymxX9Vz9d/ZCupiU6WRIZxnsGFobhW7iSnSyB/Gs0jNz3v0f1@lists.linux.dev
X-Gm-Message-State: AOJu0YxosiOJKPcrte9Ba0s+atU7CzCjr2XAvSj8Qn3VrPTrnzw3lelB
	HrYN9QEmg0alYcNXr6Tq5rAQxzsEIYeyGHQGly4JDme/C5hLN9785xDIhk4qPAC5ClM=
X-Gm-Gg: AfdE7cnE8Q3QpYLkj8dzkvy9KSchWlfIwvzhn/VZ3CQy0KmWyLMItVi2KJo49e2YCBt
	Lf0hoO6NB4bcGl/IZt5RoYJlOF8rri3RCUAZHDqqflKGFBGJRwOgDF5ovjxreytTEVDqeWa9qme
	glZpor+Dnuh51lp6hXhatgYEyvVD0k9Kr9zJ1zSnY9jpjNF2MC8gajKx3QcI9UtcTGw/5tQ6aoc
	7YX0crfRIbZbQPwrSBAApfa2FHNPpPoWMBX4lY6bYfhGsGbp7yWKqXz5FIeY4t7C5q3knODIPce
	rd//LxZx+LL8lHKRiKSgR5vUDb7KKTdx4Wm1eVoSFFWr7eObe0no+Unhj0VxTzdrFoG2B4NyoHh
	UfSpqLjxQZjQ/e12H2gpFUp3N5pt3kA/bu3a6t/K0eUmNTHiqZ6INXMFvF07Y0g+3AeCRw8U=
X-Received: by 2002:a05:6214:e8c:b0:904:49fa:3085 with SMTP id 6a1803df08f44-90449fa364dmr123814316d6.18.1783968491378;
        Mon, 13 Jul 2026 11:48:11 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82e8ffdsm139962266d6.37.2026.07.13.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:48:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjLhK-0000000E1oE-0kyB;
	Mon, 13 Jul 2026 15:48:10 -0300
Date: Mon, 13 Jul 2026 15:48:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260713184810.GM3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-12-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -114,14 +120,17 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (ret) {
> -		leak_pages = true;
> -		goto remove_mapping;
> +	if (dma_pool->cc_shared) {
> +		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> +					   1 << order);
> +		if (ret) {
> +			leak_pages = true;
> +			goto remove_mapping;
> +		}
>  	}

This makes the memory_decrypted conditional, but it doesn't change
the lines a few above:

	addr = dma_common_contiguous_remap(page, pool_size,
			pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
                            ^^^^^^^^^^^^
			__builtin_return_address(0));
	if (!addr)
		goto free_page;

It is wrong to pass pgprot_decrypted() to the arch code if
set_memory_decrypted() was not called.

Also it looks at some point the nature of the atomic pool has become
confused. Originally it was just to allocate atomic memory that had
been vmap'd outside the atomic context (to set the non-coherent
pgprot), so every caller was expecting non-cached memory.

Then it was reused to also allocate CC shared memory outside the
atomic context. That was fine for x86 that doesn't use DMA_REMAP but
on ARM64 it now means all atomic pool CC memory is uncached? That
doesn't seem to make any sense...

I suppose along the lines of this patch the solution is to add a
noncoherent property to the pool so we can select the correct
combination:

 noncoherent !SHARED = vmap pgprot_noncached
!noncoherent  SHARED= vmap pgprot_decrypted + set_memory_decrypted
 noncoherent  SHARED = (probably unrealistic in real systems)
!noncoherent !SHARED = normal __dma_direct_alloc_pages()

But I don't view this as that important, the CC hypervisor is probably
going to use the S2 page table to force cachable on all system memory
so the non-cached pgprot is a NOP, but the extra vmap is wasteful and
it is confusing.. So maybe a little fixme is all that is needed here.

Jason
