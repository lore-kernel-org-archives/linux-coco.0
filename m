Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F033A9FF
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783969720; cv=none; b=B2W18RPb2BuTXefzWqZWcZMDmzztqwsuuscfqXfU8oUawdniZ3XFoMk4U3mLsiaseVM5MjfeHAy5Zhjcn02kvDLIeIsePydrLoLFfj6cnGglPl5ZRnXiYB5K/ajYqkS7aRQQ6DoP9Nfp71zOi1N/AVURr726nXdU8PNObO87yAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783969720; c=relaxed/simple;
	bh=GJtnY2yRqKWNI1Dlg/xVBMh0aCykSCHp+2ZiZ1vJGtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ql6lli/ING5aznyzgu+jF1nOzPMgs1Svf+UVOoDDw/xAEE9hpZxu0LtpO6QHI4HyVvY97P7z61K8E8Dz/7cQ9SaeBoFEazFr2unUJtVJ/yDk2D/GlSaEHvS5HhcW6EGtDB+rXtkrMs8NeKBHIWtQ2o8+JZuQo4cRMCo1OmlRuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=S7TM1GTu; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="S7TM1GTu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8efef6533aaso2134116d6.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783969716; x=1784574516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xI/VqVGbyjLJTRr9oYnYDAONmrfr0w8bRuYGoSNi5Tw=;
        b=S7TM1GTuioAjX2jtAYgGUY7O7lrvNuNIohe4J9zx44RaMCDIfVCYCVePp3ruilMMCE
         hpcoY80D6C6jbz0KWt1PgBhE2+bt5WBm8Nz8wl4SVziEDa6l7bEgeFCDA6iMaJe99CPc
         GnheGVbiyl4uK/ob40QBAIWZB0c+GRy8G3IC2wCPDfxGAGWDge/fRcUs8h+4TznucPNc
         OWmRKteywp3zM86HqjkEcSK44ulsH81WWHLpAIYNhNJ4psw6CQuDi5VIl4iIv3COZExy
         gWIlTOYpf4WL1Wf1SM7Mz3xMi0B9VAH4HDOlNUOMMkiMsgzp08H9QPHzIauSyKZoEOm1
         FExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969716; x=1784574516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI/VqVGbyjLJTRr9oYnYDAONmrfr0w8bRuYGoSNi5Tw=;
        b=In9+RLNju3m/zm9Nz3RBxIYmzuL+Xem7F/rgB4vpnf4HSZC5fAI5PjetZ7TUoYTlO4
         1VxQ8c6bHP7NMgkMkAyTnCYlvhBljq/b0xeYqYvdOEEmETIlmA1nIR5TOR2xdXY8b+W0
         NzuaPSsGfbyBNCNKdC849u3zMkDWEPhhrjZS8EjWieK/D/bV0h9sKIGOtIGf7J5kc0cI
         vV0P3d/nCJLy06HXmO2f7rWW+7+rIZBImqE+AHIF4wFinumriSmkmpwCLfOv1cLgGTHv
         ko3p24DMUbYDJ3PAm3hIT2Xbwu6y0+lf3+UfUo3IoWjp2Tyxp9SwmkEJbcGiCxsQgUmL
         exYA==
X-Forwarded-Encrypted: i=1; AHgh+RpjCfzoMdd0LoXLZToaa9lq0JlU2ctTj/ssv+jFrhdsOIcs0V8fUWvUFlcYAufMmAbH8gm0FCYurKE9@lists.linux.dev
X-Gm-Message-State: AOJu0YwnHOtXzpD62xhLvN0V7XUh2KOfeIWineBo53Zdo3d4ISZ9TZDc
	OSYVuCf9TWD77sliLz5x3VTJXkB0/TD+2tNVhbQYMbKmgq1z4+tWj5QLzsCbpCdn4wQ=
X-Gm-Gg: AfdE7clUi+QzCZhpifcJBJAyzYQ22nRZ/I1xxCaz8vL92vJtwlhcvx2DnhbLcXHzUDd
	7jlihWkMiUBcMas+zSlV8vgJShW6kWCpHi6UOESV04lur5jTY7mDUHnZaWpcgrYP6Giem82g8KA
	51JBkK/hFENRl8WEdBg5trPb1JsKePyTN0Q0Oa0ZzTAQlobesHMUWrWlFuFPfzqIRgHKLG2ZgzP
	Irk/1CFHkZcxD43W49KW7HSAZE4adio+N1jnrJUoKPcMqoac33EakGrmZ98v39mNslWPiFtlA1P
	rjssfeE4xA+Z7D4RDwTOAR70XHTVI8vTQVPN5dEensUQkyEoXKDwvsd/ev78mv+ilt9UxPzXz06
	h6RbCbJzacF3Q1QaJxH00ajQ+3iZ1YXUUrxLalLWRvWG6Wl/6u+SFWwR/M+Wk
X-Received: by 2002:a05:6214:419c:b0:8ef:6c8a:e8db with SMTP id 6a1803df08f44-9040206aa9fmr110916776d6.47.1783969715612;
        Mon, 13 Jul 2026 12:08:35 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e0811sm137651756d6.3.2026.07.13.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:08:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjM14-0000000E3qf-1Q0G;
	Mon, 13 Jul 2026 16:08:34 -0300
Date: Mon, 13 Jul 2026 16:08:34 -0300
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
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 05/22] swiotlb: Preserve allocation virtual address
 for dynamic pools
Message-ID: <20260713190834.GN3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-6-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-6-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:09AM +0530, Aneesh Kumar K.V (Arm) wrote:
> swiotlb_alloc_tlb() can allocate from the DMA atomic pool when a decrypted
> pool is needed from atomic context. With CONFIG_DMA_DIRECT_REMAP, the
> atomic pool is backed by remapped virtual addresses, which are not the same
> as the direct-map addresses returned by phys_to_virt().
> 
> swiotlb_init_io_tlb_pool() currently reconstructs the pool virtual address
> from the physical start address. For atomic-pool backed allocations this
> stores the wrong address in pool->vaddr. Later, swiotlb_free_tlb() passes
> that address to dma_free_from_pool(), which will fail to recognize the
> chunk
> 
> Pass the virtual address returned by the allocation path into
> swiotlb_init_io_tlb_pool(), and store that address in pool->vaddr. This
> keeps the pool free path using the same virtual address as the allocator.
> 
> Fixes: 79636caad361 ("swiotlb: if swiotlb is full, fall back to a transient memory pool")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
