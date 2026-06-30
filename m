Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FE46AF06
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835371; cv=none; b=BBBZqZSLY9ONC8HpVMI1xFFHhvDC1DrXJho54ITfrnqTPWYbffGq91KLgPxoUiRAJf+ZD6Y8CzELxeACfVP+0Q04SoQtZtq+UsOIJXexglVT0KI8qPlkHX9sQdq4din0yBy2bKffkJxiHYlPVlbHPjwECTsqsNWyx08bxYINg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835371; c=relaxed/simple;
	bh=kHw7DLrL4QjCK55x79lTHIkq15rpEE6+NeVSt2Lz+08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKa0AXa08AKXvlKmzgX4KprPJ7jrY8uDkvirnx2FAv4/tQHF0D+f5Od5U2bFRY6abqb20ld311Z7IxygtCKKBKFyodKgClfleJfuoOErDDE3miq1CswoPYwYrrmYHQroY02U/oZWtJKgAD7+Ga0a6riA5vEK5rD1spBjdqIueSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dYdw35nh; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dYdw35nh"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e50c5d14cso153613685a.2
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782835367; x=1783440167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GI+sDv/bw0RypxsaDxkfRwNjpEKuAX+hIc2iRD1v3+Q=;
        b=dYdw35nhcym0hOws2kRXnqOlgUNWUJgStsZcX0Z/sHJVjgAmcZfF4GSrQCrM6CXnFv
         66GKoJoj1bBxzKKm/M+qOv2C2lNLgBn1D8KMEKTI5BmUzF07khxTMHbhfeh/L56BAAg1
         W0PUDq+g4MS0vAMeKFSONYz1dTCKxU+vtTe+Ad1G3j/O+02gMH9aJn7NUorpH9mCxzsH
         ts7zeVvCf6Ido8QFjMAvM2o17xkRMnuBiH5nV67CFOHaTw/WsrmT1uwrr3a/wx2TJMIG
         ddeQUPfuLddwm0GpA2cu6jMRIbTweBxQjD6bN/Kpe5JQj3hXo3SYkSjdEaBpzhwwLAhZ
         eDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835367; x=1783440167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI+sDv/bw0RypxsaDxkfRwNjpEKuAX+hIc2iRD1v3+Q=;
        b=AKxjRwQFXk7xlygpnVQXbndN+9HD8jpxBdbmBm7P+cePRn23NXNN0iQm0TN4vTbhn2
         4vo6/U5CCmWfKxlktjpwJY5Qg+FG5QsnRZ3JcRe32gWQKQM3gooI78yKANKY0jRA021V
         KFRJpZU8VMV/QoL5ZKUOveX3yyKajqC12cgeO2dMol9nZxn2VSXomAIj6vmLBKCMV+7U
         3jJT1eL8whuWy3jwWryiV4JUq97Xj0DyUpAAaokbn2hOAAEZYaI+R5VA4lO6stZkWusQ
         WxHuD/iNao3mj/cDYdVfJzP+GIpI6zpOMWRqBzgeAD1gZewAK8j86A4hhaWP0OdKgoIz
         pD/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bcZXh5Acz0QftOU6Lb9DT2KNRRx0HjC0AwljJrI4exQl/ioZa/089yl9/fllnZUvww72LBr2R5cJ1@lists.linux.dev
X-Gm-Message-State: AOJu0YzVGYiXX4I3Zr+2zlbdOuOr8o1XL5JslN5sv0nmieiM17vM1sZB
	n+0Bj+HgoHfv8W6GlBZMof2vF1Qzz+t5ineAIT5nQQx75Kxx4Ux70kyxRb5o7J1pUCU=
X-Gm-Gg: AfdE7cnfPnRKttzKvlRyuifHRwmpXKFk87KX15UGlqK7x+IURjPGYGxcf++fbtbFbpo
	rZs9jIyapv0/Ne5UiDOTaQGDIo90F5Q37VV46enw9RPVZvUZpNrwfPmbVJzjSocI78Rq9MiI3/E
	4eahEceFAN9U3P/5aoqrV9xDo0Gmx6G3FQWEE6OopiPLBPkU25HdVpU26VtNgTuC3VnbpaV1u08
	n08VaBfTge45L2zRE1sGLwFvPk0p0SFv+qvNyuw/BFait1XF17ltRdY5dlm/3uxK7Vj6cC+6q3P
	I1y2mLSXI935U/iCFSfRdayLjdeA01bc7UCUGC1mWZunuVYkLEK1jX34Td5dNBxO0VdSYrE7Irk
	K4hnWP0TT3PxVHhAocy7SkZgMVpsz4h6FaeA8ugvSdfEuNBAipciarpNBLIrkCUEpvlatfQ7Ois
	ysnSgUIJtU6J2mBWoMWr4FG0CqgsS3GMISJl7hkxbQ+qIDSNrBOdDOUG7jhXkZuKFRryc=
X-Received: by 2002:a05:620a:839b:b0:915:c4de:7ac0 with SMTP id af79cd13be357-92e6278d80fmr646181785a.31.1782835365891;
        Tue, 30 Jun 2026 09:02:45 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6236b9fcsm262102385a.41.2026.06.30.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:02:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1weav4-000000027Ay-3dT0;
	Tue, 30 Jun 2026 13:02:42 -0300
Date: Tue, 30 Jun 2026 13:02:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
	"Cheloha, Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260630160242.GI7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
 <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>

On Thu, Jun 18, 2026 at 12:39:21PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 18/6/26 01:41, Jason Gunthorpe wrote:
> > On Wed, Jun 17, 2026 at 10:50:39AM +1000, Alexey Kardashevskiy wrote:
> > > > @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> > > >    		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> > > >    {
> > > >    	bool remap = false, set_uncached = false;
> > > > -	bool mark_mem_decrypt = true;
> > > > +	bool mark_mem_decrypt = false;
> > > >    	struct page *page;
> > > >    	void *ret;
> > > > +	/*
> > > > +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> > > > +	 * attribute. The direct allocator uses it internally after it has
> > > > +	 * decided that the backing pages must be shared/decrypted, so the
> > > > +	 * rest of the allocation path can consistently select DMA addresses,
> > > > +	 * choose compatible pools and restore encryption on free.
> > > 
> > > Why this limit?
> > > 
> > > Context: I am looking for a memory pool for a few shared pages (to
> > > do some guest<->host communication), SWIOTLB seems like the right
> > > fit but swiotlb_alloc() is not exported and
> > > dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed.  Thanks,
> > 
> > Then setup your struct device so that the DMA API knows the
> > guest<->host channel requires unecrypted and it will work correctly.
> > 
> > I think this is a reasonable API to use for that, and I was just
> > advocating that hyperv should be using it too.
> > 
> > But it all relies on a properly setup struct device.
> 
> Sounds good but how do I do that in practice? 

I think we haven't got there yet, I understood Dan's plan was to add a
bit in the struct device that signals if the device must be
unencrypted or can support all memory.

Currently the dma api assumes all devices must have unencrypted by
default so it should be fine already, shouldn't it?

> not externally available so I'll have to trick the DMA layer into
> using SWIOTLB (which is still all shared, right?) as I specifically
> want to skip page conversions. Setting low DMA mask won't guarantee
> that the DMA layer won't allocate a page outside of SWIOTLB and
> convert it. Manually do

Why so particular? Any address that satisifies the constraints should
be good enough?

Jason
