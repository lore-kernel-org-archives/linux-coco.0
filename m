Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2435353A75
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003653; cv=none; b=KaUJphA7LEIdbvOqnf7ENY0BlMa5nLq2ShtU+Ulbb/iqibEnPtq3m2ngfS4mbkPJC55EDV+virPQZcDEaCiSgX9Lfx7RzhR9VPprScmRZ2bxme631qq/hD+lsYExPzPI5ojjv/EJzJtuNAVK9NQqXXbjRCnP8d0L4Z4wFUcwDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003653; c=relaxed/simple;
	bh=wPrLPIkahV/48dLiq8gAC7HDusdQj1NNPVoCnuPpx5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzekqfTQ9zHkmlemHfF0YCcLZ1zTyiFgRU/1zH+5Bfoy41s2G8kMZNBpU00mFXUUEZJMJJ4Au7HUhUMSxpauQAfGTM+tIy+/h/sZ5aa6x5POCy4fGz2FCSDZ1W06Q7BHEG77PPFkBe1humUGp0Lb/PK8Mn6DtL3rg+hmV1J4JHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=e/anwoG3; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="e/anwoG3"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c08df8513so13020421cf.3
        for <linux-coco@lists.linux.dev>; Thu, 02 Jul 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783003651; x=1783608451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHZVkcI1dGlitqBERLzcSZUkSvuExam94MObbuJvLAQ=;
        b=e/anwoG31Hergg0KVEgIbZj5/SqaoWCwXRJNQWcBpbLJtvc7SL+7ktcXjj6+hxVPUW
         hzbx0lKe4w+pvCLT8cJsVaEtyBHnIdKLj20bxiRjlzDK7HVgVagjObGZ1uljB6ka9BGT
         hsoOSgBmdABYIe+ovbxAayzM5yHc+sEmJVzkK9t9RIC/inIdVXIxs1GZlb0UdaoEua3x
         LKaDvPe8d/ctF9vJTs2LhglylsJBRfi94e31fu07YgrbZMClPkYVx8BwbQPrFf2pFLn5
         /o3w0/q16qbRByvBQiSyGQZ+olveDhTGBZu0Bb89d/x1GGZQMCDiKFJukmHIbVftvt10
         jYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003651; x=1783608451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHZVkcI1dGlitqBERLzcSZUkSvuExam94MObbuJvLAQ=;
        b=Hpb1vegW0JYhhBe38/Ann0bt/PrE68kThVp0D+ubDT9cQGE0QxtysxOa0rvpz4YzQR
         UoTjJT70EJzAlgqpOjgU+IB37K0NTGmYUGRAtyNrpdosCjg7G3buYdi5OfP7PfBH9r3E
         MpXVmabsqjE8H6FZyWJRkIhG3JGEZwnEYiHHhz9IMWNx7r/bh5Xo+mPi0N51klZHi0b4
         fBy7ugV0cKtiXcsgp80p6SeUFMxiDTMNv7GVGJCPgkO0KMERy9ZhHc9Z5sz12NlV+y+L
         0QNt6paGMVmQ/rL4pVTi8TLeqOP+Hq5MXVAznzRYRLCW35/ZhYbSjxSENWAZtU3PYycj
         cU5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zlYEFIAw9Zh23/qQtsDq5phj0bR7qwr93/hIBPEYJB7fXcmjDIV604w3B0epCkrbGXyIRWuDdZxXF@lists.linux.dev
X-Gm-Message-State: AOJu0YzyGVu6lQ725EflAD8Zbqsyw36RfZfcerp3lOKJWrTJJFKUDLzR
	scrn/Goej0ok8Rpg/rUhH5ZuFQY+2j+cEt314dVPRwmi3TtDogYFA2bXyCbXVT5Qpg4=
X-Gm-Gg: AfdE7ckVmmEJfvLstrTaf5/pOMLeO9BLqoScc0qcBmDj8uUd04r5/4gDnjvlogi4K53
	OFOpEh2hq4c4L5BM/+OSo3aRXknCIEjuUIqzTst5UppLd8Ky5jkkbXfi+fYvb6lDVxN0F5CwNui
	u6qx5Pu4xAU38WpHWv04SS5/K79ramVkNsn/Hg+L8R6JFSu/Bza3G6PY3o7mh1011LJ17QTUbhe
	r98jvsSKzz/3RcCVV0f6XFHgI3nVsxa9e7KWadgVGf/bePIf+yifIrSXZ5Yyu6ThjEUhug2wyf3
	0R5k4jpEe0lgb4sjSZH2X06mqcFIM0QH2D24NjJVLQZyG7nEQl+oqj5dIJID4Nrj1lvVdDgzmzG
	pD+5htbgBsJyjPPAIlqjB8ymV0yw97KWoLi3TtuzlfrE8yOyx8Wa0nhFZt6Ij1qrXMYBUQhGyOk
	AEFczJgYooGOulbNViH3btRn534t3j7j8LFXjVodPTDuvhFzDZPBOQz7kgVt9THxOSPhI=
X-Received: by 2002:a05:622a:1b92:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-51c2aebaa70mr65534301cf.40.1783003650663;
        Thu, 02 Jul 2026 07:47:30 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c30c61857sm15516901cf.28.2026.07.02.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:47:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfIhN-00000005tmX-0mNc;
	Thu, 02 Jul 2026 11:47:29 -0300
Date: Thu, 2 Jul 2026 11:47:29 -0300
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
Message-ID: <20260702144729.GP7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
 <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
 <20260630160242.GI7525@ziepe.ca>
 <98800d21-18f6-44d6-9ba0-da9b77567d85@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98800d21-18f6-44d6-9ba0-da9b77567d85@amd.com>

On Thu, Jul 02, 2026 at 10:25:16AM +1000, Alexey Kardashevskiy wrote:

> > > not externally available so I'll have to trick the DMA layer into
> > > using SWIOTLB (which is still all shared, right?) as I specifically
> > > want to skip page conversions. Setting low DMA mask won't guarantee
> > > that the DMA layer won't allocate a page outside of SWIOTLB and
> > > convert it. Manually do
> > 
> > Why so particular?
> 
> aahhh I missed "pre-". I need a way to get pre-shared pages for my
> sev-guest activities.

It sounds to me like you don't, what you are worried about is
optimizing the dma_alloc_coherent flow to avoid fragmentation and all
CC architetures require this optimization.

So I'm strongly against you trying to open code something in your
driver. Use the DMA API as-is. Propose general DMA API improvements to
reduce the fragmentation problem. It is a real problem.

Jason
