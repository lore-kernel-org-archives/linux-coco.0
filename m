Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85BB357D0A
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971694; cv=none; b=hwmCC3QiXHQiB7Qet+7iEdw2J9u8UMXKfVMahoKM8yyEyNYRd+HTDaRtz07amaxKL/WX0jGtaAN6S3ISNwl12XBNxqxLJYsdjf/bLuCQTwP+Jia+tE/29ipZSEu/vClwt0LAEU/SH0tPtXR2hNMaYELU8rTfFpg3T6GEU1I6JtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971694; c=relaxed/simple;
	bh=B2Rb2Qu3H6K9h4z3M1wOOTBejPY5tvykheBX1AXjDsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg7Bxcafj9RlQubJleLQodA1mUoVAPh2Fgomp2nC5rSMJamMmZ44QZR52emGlwl2pO8O+AMcHefP/nvvradebe8lH1FGGSiyE2L6ETFek7VgLvvX+rG2g2Nlx6p+uMu+PhFXGJb0MfpqkSkMOOCQiBCc+3B+qN5t/0q0aB6cWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G5NRlAy8; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G5NRlAy8"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c29b46382so23068251cf.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971693; x=1784576493; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaFiCRG6TDd5hbIwyaOKkhGT65gZ81YsG2fbaxJfaHI=;
        b=G5NRlAy8cwkrAh1Prkq1cAg4bZzK2z+kGBiu3BuO5Fftb9jRU+CKhuPSrF3SxcWsCm
         iqrmqWSBLMbNVuaQPvGrWH4jzn6TqSTnRuBszK3NtJuDZo3eMpXm9E2CGw4FPooGXBb8
         t8HoIjPvNYVHEblCtxBRvVY0EG/+WJgwQHT0LVjbeJ+kyjSgHbYQxT2oDkTkJQWk2Xoo
         Yd0Zbp4yQkc3+rxcgGTGVPKe2cXrl6Hpvo3/MQZgq8fBNg428N1PcWBM6O/BdXyOcLQM
         kJN1ddYAwQebc8WAHmzAJL+DJwQKHEWFn8NXNEsZCz8mBlJcQb6i4Bklj2PtMZbEdJoP
         x0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971693; x=1784576493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaFiCRG6TDd5hbIwyaOKkhGT65gZ81YsG2fbaxJfaHI=;
        b=KyZBFcS0p/MR2LECJggVFBXh852/E25tr72E3TSEZdTTvep7TctJ/YtfHFg7FPYrQG
         +Jcq7aWEPzN7U4K6WsiMLxmKi3pVTSgSucBK+BvDT9CvLwck+HYnS4B+O4jlVNsD0BWl
         SaanrRJaq5TZW8RM9mVsN/JBgTRcxA8X4Dr9gG1ma6/FdY8d5+RRVHYE9XoFzd89oxp/
         X2Rh6JNTE/tTcbpSdv8usf5S4AoadVe6AnfB+kF8KRikimAQxBkaAkjiFKOO4TOf95Yc
         78NqgYPcbnJvjlq1PzzJV2cXRJEe3kCKQ9qAfQllAJ+zEmVrxbbRuGlvjHIFoMSEMXsB
         H1Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqVxSnSIckzXwJdv0/dbSkYD7NMB/eV2lX++st4hgGcOHtxU+AWl15uE7+ohc/zmgwi8O4hI2VtDDYf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy040l9KYYcwTFCTL6Abb5+IN/LIIlc66YGp3jGZP7ZQibtTPWQ
	bxAboxLkk+Fc1ONDAIEsik5cP/hJQ54Wue7Y4VOLPOCLCEZgttC/RU7pdE+w8Wd7Kx4=
X-Gm-Gg: AfdE7cm4DWfapefN7eXLBTTbt/w9xRWO+dMdA2vUdOjxDHSNaaWgxc7UqkQG0XEA0up
	SAa15Xj5Lsv4qvUYMAz5y8Yh3uySp/KVYNKewDe23wRnpIh1wPIfpyYkPPR1YtWVCwjieE2iqGr
	z9Jiwfk4AR/5aU5tMNLMNCfjgTfQmj0dOIMDf9rpdaoB4ODGXEfQAJw7EIFt6Lb1cQ4zlDTyo3k
	StOjc/oBIh8gyczAu+0UiAFTOMUleHN9nT1SY1Dkjs0JrELlivP9i6c+MMtxiDB+eJLURCPJ4b/
	IxIZL8HTVex3onlF0sU6CRkBp7EN9m8+F9EjnfRnRsls3hL/eklpeOVE1NIU1syzzJDfLw6oDky
	Shs0/CJZmKFqVQhh5343YZNLClDdv3u5QNGYJquzjvKnPqUOsTgiL8X0/zx9m
X-Received: by 2002:ac8:5fcf:0:b0:517:8711:d46c with SMTP id d75a77b69052e-51cbf0f3fa9mr100726891cf.31.1783971692761;
        Mon, 13 Jul 2026 12:41:32 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caafd8b44sm90213801cf.30.2026.07.13.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:41:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMWx-0000000E6nC-2kaU;
	Mon, 13 Jul 2026 16:41:31 -0300
Date: Mon, 13 Jul 2026 16:41:31 -0300
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
Subject: Re: [PATCH v7 20/22] dma: swiotlb: free dynamic pools from process
 context
Message-ID: <20260713194131.GZ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-21-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-21-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:24AM +0530, Aneesh Kumar K.V (Arm) wrote:

> @@ -840,7 +843,7 @@ static void swiotlb_del_pool(struct device *dev, struct io_tlb_pool *pool)
>  	list_del_rcu(&pool->node);
>  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
>  
> -	call_rcu(&pool->rcu, swiotlb_dyn_free);
> +	swiotlb_schedule_dyn_free(pool);

This knows if the pool has cc_shared memory in it since there is now a
flag tracking that? So should the work queue version be conditional on
that flag?

Jason
