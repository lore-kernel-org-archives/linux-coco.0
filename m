Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D892745E
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783969931; cv=none; b=cYn4LSFlVd19KbNLcQ9HDYi+JfHd6+GOVjqGfrwqUnrPml9crWxxJfXZtSVldM++KcP8OEsnmIowtRvHUKB2wMXPrfm5xO2DhQC+I9837sX43LXo17pbJDNZFxWwQQVE0PNl/9sKkDEN5KFiy2OcC2/excpkXxkNBevkg6j/AVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783969931; c=relaxed/simple;
	bh=zQwwTTQgdWMUuBKytoq9EwDKG6Cm405oXwoG7/OyDFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYxlYIRIuWdPoqOqTznIpjP5V1U4fosd+P13BNPOWceyKDpKES/r+gCG0H+pkt3tCPRYJdUI8k7OPmJp1lsQN2eG1C7DZvWvqWzk30uukV2aFMz+W/5Qbs6k+TdeWrjljZRrOcuRscjmNAlCzTtTYNlMorsUakOxz2TuX2XHqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FTYUqOpe; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FTYUqOpe"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c16ac21acso1497391cf.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783969929; x=1784574729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/NxveP/pyfIFv71kVfPTlg3b5XZeJTUOET5rnvr6kHo=;
        b=FTYUqOpe8D1xKOGrFQ/CM2+g4sCo45Oq+MhB9F9vx+Yd5+InjZqJZFbxhFW8N8flw8
         TKvLz7IHOhvuVv/VCoU1efR9wIaRFEn9QVu2kY1kpE5L4arDxPTpE7iuOdH1rqfUBkAp
         YyeQh7PhutMCT5p6i+XCPx7t/tQ56hW3XHzwNj8vqGWI+rBCPRWuS2Teok+fb0tRjLjH
         Wyi1PToLkU0h9XguSoMfxKfuf3tr41VqfgBOOrXTTJbu2AfwMMCAw1y9I2nnbW+J9UbS
         GajC8Tna76zVNOgGHZwPXCPQzKpLvPDXRkW/fnS1ZiKKWudUi4/LeRQtcQ7yN4NkZwaB
         kDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969929; x=1784574729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NxveP/pyfIFv71kVfPTlg3b5XZeJTUOET5rnvr6kHo=;
        b=fa7cFH0PvpSvyQs5+SDQ58O0n2E7w6za7pBjpl/N2o5LZlVRzliphxEpdudFyQ824I
         VIT+yPlWKGTf7eZcqJkls83eWSsxmMwsAKT4/uz08FRYHeUzCJTa1B22d+56+CC7kyOA
         za1uOrde4Yb9VEv5sNSgSuDctUNFD01vpzpF2sXr8cZfmxaSBftpi3nS/YrUdG8ZxOdj
         B0ZAnx6eqBD0Dh/d1BI5p3+JNd/qtTswQBol45bz0F90gzB2AjxoT3zcHc4OYbj5DkrE
         KGwDhTYnxDp2nMGJbC+uCA5PjhKmQyKNTlhdcqMMMlQu6xG1/n9ZN2iZH9EJmy9wyeYx
         wX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqzVlak9rINuXSSKqC+KBfWYy+Edd/4nxztrlJtFtn46chEqXghjyvyhyEqoKW9cFWEealJ19TbNioM@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6XWCjh5aeoXoh+E9xb2JKlwVngIjijYndjz3BfFK3H/u+uloq
	WLgXy2mTLDOqukcE0+HV3QraFLFeynT8Epq6RCuN9ZsRLoW7TeoWYmjC+SvI0wKQkuKpcC0iHXS
	uW8KI
X-Gm-Gg: AfdE7cmiFa3EoHj3+HtSvCQI16a6Xpg2tiYQRI9nF4qVUnRAxBOCHMnDcHMG9VSS4o7
	XVxMicEuyJwRg/o29fEjU/tMuT6XwunBWpOFCLK18m3oHKQUUqVRPhsyf4pxQQ09qV2Fd7Qav6/
	4sOwLSYsvr+QUsE0oKtyFgYw0xHJytlXwyqKAS3QXZl+E3mskVYrHUwbAbfQD39Q5T68VU6Wncm
	9t7Qnju4kJS3ltk60DJXaO5NhEf278+5o2M2K4yKGg4MN1f63k40CUf3TiWYDQGPcl3WSAcpfI0
	B4k03/uSinmBptKPSTVdKQLDcwv5L5dBk0+/1m3tw9aJ2Lp8lK1t3hmP2AT3KYjN6YwDnuULEJU
	p8LVXR0gpuYSd8whKW7bel+j4FnFUpHKe84/VZlGCajtvEyRppJMI66nWXn/r
X-Received: by 2002:a05:622a:551a:b0:51b:f217:539f with SMTP id d75a77b69052e-51cbf0569bbmr98856591cf.17.1783969928867;
        Mon, 13 Jul 2026 12:12:08 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacad30asm88764001cf.9.2026.07.13.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:12:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjM4V-0000000E4Bs-31V7;
	Mon, 13 Jul 2026 16:12:07 -0300
Date: Mon, 13 Jul 2026 16:12:07 -0300
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
Subject: Re: [PATCH v7 07/22] dma-direct: swiotlb: handle swiotlb alloc/free
 outside __dma_direct_alloc_pages
Message-ID: <20260713191207.GO3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-8-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-8-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Move swiotlb allocation out of __dma_direct_alloc_pages() and handle it in
> dma_direct_alloc() / dma_direct_alloc_pages().
> 
> This is needed for follow-up changes that simplify the handling of
> memory encryption/decryption based on the DMA attribute flags.
> 
> swiotlb backing pages are already mapped decrypted by
> swiotlb_update_mem_attributes() and rmem_swiotlb_device_init(), so
> dma-direct should not call dma_set_decrypted() on allocation nor
> dma_set_encrypted() on free for swiotlb-backed memory.
> 
> Update alloc/free paths to detect swiotlb-backed pages and skip
> encrypt/decrypt transitions for those paths. Keep the existing highmem
> rejection in dma_direct_alloc_pages() for swiotlb allocations.
> 
> Only for "restricted-dma-pool", we currently set `for_alloc = true`, while
> rmem_swiotlb_device_init() decrypts the whole pool up front. This pool is
> typically used together with "shared-dma-pool", where the shared region is
> accessed after remap/ioremap and the returned address is suitable for
> decrypted memory access. So existing code paths remain valid.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h |  6 ++++
>  kernel/dma/direct.c     | 71 ++++++++++++++++++++++++++++++-----------
>  kernel/dma/swiotlb.c    |  6 ++++
>  3 files changed, 65 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
