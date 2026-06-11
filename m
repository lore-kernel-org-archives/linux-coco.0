Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DE3E833F
	for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177447; cv=none; b=GuDTv0to64V1hb19DI/Hgp9gEeOm4K/KTNW7BNDfUByt6BCJ40dsxczOT0nOTV8GwLRlB3LBZrGiiEE1BgqjVlDwHUfEggYEs+uY9lEePbq+O0mOdCebMp/M1einp9+Aw+DmuSS+/jsuD8nO/WyPOGhjlNbu1e/pPuitC7glskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177447; c=relaxed/simple;
	bh=haH/H6OcYua3Z5rTl0sktjLmKVSLqKAqacU21OYuo/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWTdZStjrceKMMuzCCqXFG57V+6K47bPAeneh/l/2bLRlRec2Ua/FT1KsSWjq92Y2/bigibiHjyMUy+MeWJY6EOUVzAzstUQe+qgJxWTX7tMM8rAcVeA4hU0hUStTIfQA5AzPFPkmRBPmDkYkSBf/HGmqNFNSKRRv/B6rtHvfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Iq1lOZ8R; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Iq1lOZ8R"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5177b9a02bdso108925131cf.1
        for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781177445; x=1781782245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=haH/H6OcYua3Z5rTl0sktjLmKVSLqKAqacU21OYuo/8=;
        b=Iq1lOZ8RZe0moH5N0hb8bGIYJ5WBFM1t8JVsBtHxKlPsiHD0Gr0dIrlJCiwojYNRkh
         VDz4dSAX9eecKRgoatYAXLehJH8G2D1Fme7UYQzQjz4h7ird5OZP9GqvxiKBMKpb4glR
         HRAxeATB3+0R36u+cNQO9ZgkSWUqPlP25GvHfeoHyRiM39DRJyQjXdcNrtorIVkz3ofV
         140Qd28Mlqx2fADbxp5uI+h0Fpg4AtKkWYyzxBVOh7SDA8rFPsjj21vOKw0ou7VidhAf
         /CWzWnWzAXP3ZsQSFqH/JNLmKhU3lo6O7fXr9EHHaV0TDJpq6Ce9643H06i9eQV/AYeA
         tBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177445; x=1781782245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haH/H6OcYua3Z5rTl0sktjLmKVSLqKAqacU21OYuo/8=;
        b=SLKZVzTQ89/tOdgzG5WBuIN+WPS6gA6KEiU6JNEqtiqw8B7fGPAtV0QWy4PNLfIHO/
         svMf77JQbzQjZKmYVpAz4qaagX1OvRF/AC0qvyI/Xj5qCMx7CdouOkszIWPNEi6bIgb6
         rQL9lPQaRe85d+2xidDo6pNqj1WVj6ht85m+Ux6y2jM7naSwqS+2jcbOAyiCcMZ+DIyg
         zaCe5C6qaA6K8yy4wa5RBO0JXW/rGE0jCKxv/2eRZKiJvEkPxNIBXVylQ7Y4h+i6VgsW
         cMYCBCmvHQvItjvbX9PfmueVfB6rriILX/btZUd2ornX1xHqde+GkeopI0Nl5aWFpuUJ
         FYJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rEUEoLMDd1WUAG+HgDPpdPC/cs48hEw2iiZ8kEyG6O2C5Py1zDogZ+wqU7PKsixHfwfpMLHg9xVyW@lists.linux.dev
X-Gm-Message-State: AOJu0YxCYFF/V5idUeC1sew53MJIz1Qqj7sArpyj07sLKGInyAqWsxZM
	nRpUgijtoceUGgSvZd4PpiuZb+BzaGGX5zdmR7EwWjdvJI619YGFzvtIFCf/CkHIzZQ=
X-Gm-Gg: Acq92OGB9NP5S/81RtE499D3P4F/XORWNt3kAj2EHfek8i+NgbTpgAmwwEEFWNiNHzU
	lk5FA6SKE1MnqRo1bm07Tr3ZzdTN/i9jPOVu/aVmefFh2gdriIiJxbfoYDZQ8fh+pIl+i9xuRpu
	tY0IejGtLf81YxthcN1kqVLhyr/WjJuyDb3La5jcfQOxI69el2SPavbdNvJAdUDtCpIYb8PhVW0
	Xn8oRX52mi8Ij69Xt6kBrKcfMuw9MgU7rPt0783zDAvTqas5NMh3Ky/qXzzziDvIXYYYFTVjpg+
	PAOap0SgZAtmTtwnZ4laYoAsxu1DddVafxzId6ZOyiv0gArpDdVu5ZtngGWpwqUQ4l2KzzUzwbJ
	ay4vNPFXAN/B7/Xz1uHHQuDb9zRc35TsvlJh0eFllH3Q1PVpbgTRrTlhONrg03/q5p2RSIYAYp7
	2XCqtcMvpinn88afr3OPYcT/CHlK0nXK/Txv7xl7yGNZL5wwbBYIkfC3HyKPxRnliWb4KsxOb2R
	b2VVUkjzb0LujvJ
X-Received: by 2002:a05:622a:354:b0:517:875a:d619 with SMTP id d75a77b69052e-517ede4125cmr35159281cf.6.1781177440327;
        Thu, 11 Jun 2026 04:30:40 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517ef61dfeasm14521801cf.24.2026.06.11.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wXdcM-00000005deq-1WZO;
	Thu, 11 Jun 2026 08:30:38 -0300
Date: Thu, 11 Jun 2026 08:30:38 -0300
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
Message-ID: <20260611113038.GA1066031@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
 <yq5afr2uzum9.fsf@kernel.org>
 <20260610164153.GQ2764304@ziepe.ca>
 <yq5acxxxn0gp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxxxn0gp.fsf@kernel.org>

On Thu, Jun 11, 2026 at 10:21:50AM +0530, Aneesh Kumar K.V wrote:

> If we are adding DMA_ATTR_ALLOC_SHARED, should we also allow
> dma_alloc_attrs() to take that attribute value?

I don't think we should..

It is hard to see any reason to allocate shared memory through the DMA
API. The way the DMA API works only the device that it is allocated
for can access that memory, so it is effectively private to the
device. Thus what purpose is shared device private memory?

> +DMA_ATTR_CC_SHARED
> +------------------
> +
> +This attribute indicates that a DMA mapping is shared, or decrypted, for
> +confidential computing guests. For normal system memory, the caller must
> +already have marked the memory decrypted with set_memory_decrypted(). CPU
> +PTEs for the mapping must use pgprot_decrypted(), and the same shared
> +semantic may be passed to a vIOMMU when it sets up the IOPTE.
> +
> +This attribute describes an existing mapping. It does not allocate shared
> +backing pages and must not be passed to dma_alloc_attrs(). For MMIO, use
> +this together with DMA_ATTR_MMIO to indicate shared MMIO. Unless
> +DMA_ATTR_MMIO is provided, the mapping requires a struct page.

Yes, though we need to fix a few ATTR_MMIO users to make this
statement true

> +DMA_ATTR_ALLOC_CC_SHARED
> +------------------------
> +
> +This attribute indicates that a dma_alloc_attrs() allocation must use
> +shared, or decrypted, backing pages for confidential computing guests.
> +Allocation paths use this request when they select shared DMA pools,
> +decrypt newly allocated pages or restore encryption on free.
> +
> +DMA_ATTR_ALLOC_CC_SHARED differs from DMA_ATTR_CC_SHARED in that it
> +requests shared backing memory from the allocation path. DMA_ATTR_CC_SHARED
> +describes an already-shared mapping and requires the caller to have
> +prepared normal system memory before mapping it. Callers that need shared
> +memory from dma_alloc_attrs() should request DMA_ATTR_ALLOC_CC_SHARED
> +instead of DMA_ATTR_CC_SHARED.

The semantic is right, but I would make it a private attribute since
no driver should use it.

Jason
