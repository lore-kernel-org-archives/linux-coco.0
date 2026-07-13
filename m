Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957927F4F5
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966263; cv=none; b=L9ueUcQkY7TcVOH2zLbhaGOKaIXOEbRTtEmnFfevePFSQafssIbofsL7q9iqqGXpTI6hhifGs7ox6xR+E0PI1X1HwCeIUwtmJPMa8OVvzlC6R8VEmTZ095j0r2ElwKy20yFasLKtM+bYEYaQPHQcNfQvCy6kqxlnsoUROW3h+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966263; c=relaxed/simple;
	bh=YUh8//1CawO0lxzXPLb9x+Xef1uhNSh6FnuTiN+bISs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHlTPbijDGgj37kNqTntzJ4d/SIFxU3VLRDms5OHcltE+dpKm4seZY6BPXIKCTmDRioSYbtWCpyYuSfaFdsTw3lxb8Pff3daLRB51lTSa6jehClHNouwAOVA8olT1kOdsxpYh+WzfAiKdyzpTKy8WRQzEW+9GhXhFqCk+85OBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n6/FWQ0w; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n6/FWQ0w"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f29ec73064so28772856d6.1
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 11:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783966261; x=1784571061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r3LqUwIJYp9NQ4diqGbAZyVDrYnzRQFmiULYhYdIqPw=;
        b=n6/FWQ0wnierPOkvMhyNNZTldoqpZAG3Arq3OOs1866F1dmlBGONXD3k1tfLokROCG
         5AEhSN0HyBgLM64A3sw3rkllCGmvv9VUtOGkRmypbnHqg0cebaQ/H3/QyA9Z8TSWiBNg
         YPYd5dxkF6ArruBfRWMOr26/wCAUegxEXIP+CDatRIQxOptOIW6fQNeOXj7qbey5+6wk
         eea6Uk45c6p6YmMsh24uLKMVAp9ZDW7dPtCj4zl46IA6kY+e2MHDkKvt6GZgCGVAQfo1
         H5nU3Dq4fcJKup8A21bDoDcgneD4TX7WlWGHZVvQzwCug4CsgFj65hfB8KMBuwJCi4r2
         haxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783966261; x=1784571061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3LqUwIJYp9NQ4diqGbAZyVDrYnzRQFmiULYhYdIqPw=;
        b=PV1wjDO5MEURQid6y+BWBkJnbFEfmE5BkJhEaX/kxnKqAAv6Uuu0JjfZstGmEchnd9
         ZdGVKeckyNfOp2MfEjIuv0aMh+AOq18mz6KXez3ibzXtDcimSczdUpM7pBGQQFMNPFNf
         0opNRnLU1Cby5f/yJu7sJlKpsSUtM2acmsfkBiJni5SElfoI4VeGRsfJy77AQw2pcl5P
         V5p5fF7uvFrRE9J/6v9I2F2T+F7c6tezeQ8BiMa4d0DqYn0MoT+QAx+D14Wxeo32hjzY
         U4gc137tPluVYrvNtjKl9AJ6fbkahHrS0bX1TQ8y01PaqtCfhY9PuNzWILH+vUPg6Uiz
         2DiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnYDz7YcGu3CEBQYqNhSvrkyEpD7nObRcgLTRR7yppQ8BTE2SjT8UQeiuqVbx3PjeD4QgyL2MWD5iJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2q8LLZF4jLF+9iwWk+mZEmITK2y7Zg8QCJi5+E5jU5YXc0mPf
	/Mjfn+nlFI90tDq2Z0MnlOobtsq5K4mboYO+KhPIbKgIduLvpnMzU+mj/IbIqZ3Q6zg=
X-Gm-Gg: AfdE7cku7ib79W0MHmtQSVt7AW1DCAhbO+7Z9CvoFPPCHMg0BWHfyK2ofPqhp/FuUBt
	+PeQHnfcfLTC76zeVq7jr+fdcFEN84rdqDuUC7XC7/UJV10wZ59Lxwu8FwhJL17TRo1TB4+jgVv
	o2RnJUAv5/ss/mNVvIUmDo+EjrbDw0ipWJlbVmCuXBOj0eKyy3ynmXiGq05BPtf/A+3l59nq6KD
	yxSf14rhCUqrZZt81JWGXiJkON6wNHTFgp+1V8Hr8ZH6GWEvcJcjoffA1+LEoZgc1aNymH18WL8
	DQr9rlzqwt5MaJL3ZBFZ0UdXAmMIJsV5Y1sSfStOK/eQ6m6KskTwElksudN/M/stqz6yB2NVhtj
	oiv+/aob4orD6ze70mpQdp96Zlf5W3xeaaVTBRvT16CjH9OqUaHPajrXYDY1D
X-Received: by 2002:a05:6214:601a:b0:8f6:8677:7ea5 with SMTP id 6a1803df08f44-90402c68ee8mr99154096d6.37.1783966260999;
        Mon, 13 Jul 2026 11:11:00 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm135284216d6.21.2026.07.13.11.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:11:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjL7L-0000000DyOu-42Rk;
	Mon, 13 Jul 2026 15:10:59 -0300
Date: Mon, 13 Jul 2026 15:10:59 -0300
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
Subject: Re: [PATCH v7 04/22] dma: free atomic pool pages by physical address
Message-ID: <20260713181059.GL3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-5-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-5-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> dma_direct_alloc_pages() may satisfy atomic allocations from the coherent
> atomic pools. The pool allocation is keyed by the virtual address stored in
> the gen_pool, but the pages API returns only the backing struct page.
> 
> On architectures with CONFIG_DMA_DIRECT_REMAP, atomic pool chunks are added
> to the gen_pool using their remapped virtual address.
> dma_direct_free_pages() reconstructs a linear-map address with
> page_address(page) and passes that to dma_free_from_pool(). That address
> does not match the gen_pool virtual range, so the pool lookup can fail and
> the code can fall through to freeing a pool-owned page through the normal
> page allocator path.
> 
> Add a page-based pool free helper that looks up the owning pool chunk by
> physical address, translates it back to the gen_pool virtual address, and
> frees that address to the pool. Use it from dma_direct_free_pages() while
> keeping the existing virtual-address helper for coherent allocation frees.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/dma-map-ops.h |  1 +
>  kernel/dma/direct.c         |  4 +--
>  kernel/dma/pool.c           | 54 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 2 deletions(-)

This seems pretty suboptimal?

If !CONFIG_DMA_DIRECT_REMAP then page_to_virt() was used to compute
the genpool's addr so dma_free_from_pool_page() can use the same
logic, which is how things must be working at all today

The CONFIG_DMA_DIRECT_REMAP scenario does look broken, so I'm
surprised there isn't a Fixes line on this commit? I don't have an
opinion on the search, but since alloc_pages() is used there is 8
bytes in the struct page that could be used to store the remapped
vaddr to avoid the search if someday someone wants to improve
this. Maybe a small comment hinting that direction would be a nice
addition.

Jason
