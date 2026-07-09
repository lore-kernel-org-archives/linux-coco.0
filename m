Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB33876B3
	for <linux-coco@lists.linux.dev>; Thu,  9 Jul 2026 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620819; cv=none; b=PB6Ptc2l8y41+y8j7AouGOOb72X7k3QoQD6M8/pq305coDXDqPSa8yfQrfZoJbFXc7CGy6LwFhMI0tIy+BSwPd2UiI4aKEnfovY5raT2oRV7B905fs4ViVAMP8DfubZ3PPgb2NDBRsfHi46665SYoexW6fh42GOr49O7WYqiOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620819; c=relaxed/simple;
	bh=bvUrlGSFk5YOKRSganZsEuUYcVv+Ux1auqFKnDwJzG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMzI/9frZMnSE9vzpTTes6bQUrpTljXlBvwJZMcEX333M/v0/8kpPArIaywzYI4OITy88mMSw/kKJTK7FMRUCzqettzCCnFIIsCKGfPph+Nv4w01gurvFKCDLrPrddIbiT5UuaXRd3IPItBrBzVbQlO34sU8VtZBHuF9Q+emO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=W30nxUWe; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W30nxUWe"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ff20870ac7so1877396d6.1
        for <linux-coco@lists.linux.dev>; Thu, 09 Jul 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783620817; x=1784225617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHkQmsdB2OewXXEQfHxageXwJQg6EnEw6Gurdq9kErI=;
        b=W30nxUWesP6diPPmP3mg9MWKyOJiRr9vt4sLrFXlitBqiyqZMRgJ67HJTI7rGFymnp
         Jt29jaO/+dWLLQ8FFefyzDtY/jBnAETJ7I6GtPenFl6QYpwj6vM2cYTbMWkN5EF69+G4
         oJs/J/ucDfbyUc2nYJF4BpVR7hkwqKw1kV/K+5virlKijE4OPTBxHGdOJtQ97+wH0EHH
         722GqxAox1Dblv/+O68I5QXQ//Xz/7+4LiWget/D/6S7xI3mT9PO5/iRd3WuYPC7ZEwV
         g8BHlgKiMEafksKMpp6uFPKJZkZrLEYbaP/nPOdrdC65MhepWB9yEbtr+ZANqAB4xp6v
         xTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620817; x=1784225617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHkQmsdB2OewXXEQfHxageXwJQg6EnEw6Gurdq9kErI=;
        b=DGOSHbFL1hzj0/JxG2Xz4i4+/uTQvXh1Z3RzxkN9ks2E0vrs/zExX0zFfY6VLBCtjv
         6djyzyhQlQiLdiSnnwFVl2UzsULDP7J0pviNgmyxPapmMQ4UQontx5aOxa+7Z+A/HEgN
         YZGlu8xdS7dCpn2LkORGmEtpntGNXDJZOn6qeurt9uoAmCmpfCm+jGzbYrFKepJ1nrU3
         DDG9El1coXWezLOaDXcHW1xdbaZwBzzjQotnsezzJrtbT70flskXj6xwReI1Q4jkRw8G
         H2uyh4dRO4dtYD3EfGQu2beEEsjZPv0aHF4fLkQhAS/MziLy8WF+X53egJBorGMT47m0
         mM1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWirIVgWJCK4lLaUeIK3ZwUJOWdhRzzbABr3bHEAjSkvQoR/H0uCkecypjd7foQR58PG25ULfrB+ZI@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkiD/d7b1r2GGIVM04bDnVnTe4u6KJPRA1+ZjZUkUrUWc4Zxm
	ZvYyJ1axQGbgL98NHRE2z/PI4Mn9AMkYi5Y7qdddW2KKYC1sKCV3CbHbmAF1qkdogfI=
X-Gm-Gg: AfdE7cmsl/RXiiWZr4vtOSHDIjfF9gsE+vwS+bfOZ0M7ag6Ru7H0EI4NWU7UQHfraFS
	22WevIpzccBmT/uGjAJOJdBeVzGX5J6CvrPb40pcNV/NvBxVwW1mVO6kY0JXfV5FIC+97wQ9gcG
	wav+hbgUR4sCtIRUB0H+pfPS1gvJqsgJ3Ge9vlaxq2EVtrq/erWOKnQyIhK8JLdu4JPHYNHtlxr
	mioRNPXSga8iVNplwJwOgNFWC/zGKZhZ3xOAbjLdGqac/J/bY263/zsukR0TDisc8nJ5riP20mx
	MbItbplBY2/pCdMVB6UguB/SEQa0xEJct4nFCILkdiXIXbGoJuUpjosIHWBboD0eTfN3GVUAQPE
	xhv9GtB1iG7KZdo1FS01/ApL4pN/tDPfRcVGzWjiu6pZ7TKjEB/maOw4xSzja
X-Received: by 2002:ac8:690c:0:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51c8b3b4eb1mr92527611cf.51.1783620817365;
        Thu, 09 Jul 2026 11:13:37 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82ea9casm22695666d6.42.2026.07.09.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:13:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1whtFg-00000005Kqr-0IQc;
	Thu, 09 Jul 2026 15:13:36 -0300
Date: Thu, 9 Jul 2026 15:13:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260709181336.GM118978@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-CT3oanlDfgTy4@arm.com>

On Thu, Jul 09, 2026 at 12:13:19PM +0100, Catalin Marinas wrote:
> > > For AMD/SME, on host with memory encryption we now end up setting the C
> > > bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
> > > some other MMIO bus understands this attribute. Maybe we should stick to
> > > something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
> > > since this is not universally defined, just use the old dma_addr = phys
> > > if MMIO and ignore any unlikely DMA offsets.
> > >
> > 
> > Considering for AMD/SME system an unencrypted dma addr is one without C
> > bit, will this be good?
> > 
> > 	/*
> > 	 * For host memory encryption and device requiring unencrypted DMA,
> > 	 * MMIO memory is treated as shared by default.
> > 	 */
> > 	if (attrs & DMA_ATTR_MMIO) {
> > 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
> > 			attrs |= DMA_ATTR_CC_SHARED;
> > 	}
> 
> Yes, I think it does the trick, preserves the current semantics for AMD.
> I guess you could use a single 'if' for all checks (up to you).

Please don't change it, MMIO P2P is broken on CC systems today and it
should stay broken. Passing DMA_ATTR_MMIO with DMA_ATTR_CC_SHARED is
an error that we need to correct in the drivers not make work in the
core code.

Jason

 
