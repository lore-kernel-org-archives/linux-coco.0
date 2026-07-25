Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1F2DC792
	for <linux-coco@lists.linux.dev>; Sat, 25 Jul 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990058; cv=none; b=mKbSARnimIyncvKNpXtAlHJq/EnnYnMPSs4zkE3dhd5R9yxuwzFFNWWwyftnaLD/BRC7TLYEFn+JgVlXfH8Mu1tNv7lYGURQCrJANy3kt/h+helWbYFRhCqJI8HMcZUln1MdkQK92WCkwrcIaAZF2l6SeNDs2UssgraNsw6l2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990058; c=relaxed/simple;
	bh=YvPY+TLfnAZJLuA11fwmu2rvBC8Nt5tUSqw5kT8WiQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAzWMN77WtpuQMkJSIqPVo9L1Dq31jraV2s0XprxQrDz8kjR3qfRRperWtZEG5D4TAb12Sl7S3mPFeu1G4l8qioGeMAuWWAy055+bLtvPM7kBxyU0jsaeDuADahdUX8Y3sPkV5rKgTvH4IjLtmZ7vIOQ/Jgfio4o7KR+ujEyaV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=f/jXYrHo; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="f/jXYrHo"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-977310532a7so1662774241.0
        for <linux-coco@lists.linux.dev>; Sat, 25 Jul 2026 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784990056; x=1785594856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD91S1DbebApVBCN527t7AaQw07MlhokwGC+vI5FhsI=;
        b=f/jXYrHoUNwkUo0ysIPduhLyz3ZH+DbFCJMo2MM/B8Z5vfUCfTHLhRqfyMWulpeRNI
         k2PkAxPsMGLkHu5Ye5rZBEqjADW/h++cK1nHshtoRJ78nmH+dQ31aqeYPshsJnsHRQ/T
         z/ShW59Bfk8tk5ktu62w1OROSljfKZACpk2B7IMwfQRdThYOX3FJQnp8JGQDXjv/3s6w
         iIqeWUNSCl3rIwhy+ZUDYUOBlkb5Icv+ZVnnlQ/yi4XSgk9KX1EKWHAYwZtnCDP2vSao
         5B2aQxYOFkXT4wCrriFnkNKqqUxlT/RGi4XtM2fccm+NMqktPoC4IFg3SmsBTh0X8/qq
         g4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784990056; x=1785594856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD91S1DbebApVBCN527t7AaQw07MlhokwGC+vI5FhsI=;
        b=dbqDUVlWsGHU+QtdWlMl0PC7BKz+5OOLyGXQ/zxN8fDWQsWhb4sfgrNAXTCYFdbipV
         8E+NaMn0SP6wyoUSS4j8Zo55pmNplTH26T1FSW1+Mi0lCei9sFMMKEJMKn0SwrIoLZWN
         bCxEOm4FqH0xVxaa2iaBlzBIX7gSuccZ3aP/H+YeI4xA3w4k/GbWBV62aL3mCvPVpxy7
         mZSqbkZO1PyVIarAKsizJjCddpy/aQJwpU5fEHOCvRXjW2n9hmxH4ZsYdObfuoiaRduu
         9eOltMjO5Gr8nwh0/osvknIyC8sAoquyPBjUu/SYAkdMszrxTUnaKUkLJXnVonpMYR89
         YoWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop4x3/0nZsSaLFAl+DfO2xdOm6O0GceE8DPdQvNu39IfLi847pOoAdP6L98THTLVVGnvf0XVQeNNVj@lists.linux.dev
X-Gm-Message-State: AOJu0YzAsczztdOB3KTKFCd0S1PBywe/AXZxs8EHS3KiBz2TeDzdRGv/
	tgzmqNVhswvgyNenI9XbkKh3S9RfhIiMS2OwqQPyU5wPERzfZJ92Hx3BFHNBH/MmTb0=
X-Gm-Gg: AR+sD11yvgBXQu0N8PI1YTsl4PeeFSVls8LV4eOqTCwZcTB5thQtNgbjAuXsullGDFO
	BjCdsOrZE+/KZ+mqRaTIIRuA7npILvMDphVKRkjRPvV5/tQxaVjCWyIACCWvu9mVmOMHbSeEBQb
	2P1mzqg/Z+pB88UL2D6o6GSxUz/BefkquzpAxF1Dhc9wD2y/kx8ae63kAlLCuRxuae+zdn1unp7
	Nfy5Dba2EWz2UAsZKCiugvp1ywvFBYz1WGfOcRHL+fcEB/37PgKpsEUvTZakXoRZbf3J8oOCV2k
	Ql4rusek1CtQzKSAiFwITzLIX4Pdr3Y7re6HRIpd0AmOoyyJMD0dqu43rfUCnViSfP0kejJ5K4V
	tlNhHX8SASiSoO55Bug7O3pU++vleZR0S40q0SUd1pknTgJ18g9EC
X-Received: by 2002:a67:fd76:0:b0:744:d517:b0b0 with SMTP id ada2fe7eead31-74f9f02b7f2mr2159251137.10.1784990055747;
        Sat, 25 Jul 2026 07:34:15 -0700 (PDT)
Received: from ziepe.ca ([12.18.163.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774f12690sm1878229241.12.2026.07.25.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:34:15 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wndS7-000000000hU-1YTd;
	Sat, 25 Jul 2026 11:34:11 -0300
Date: Sat, 25 Jul 2026 11:34:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <amTJY_CdE-uDgoGG@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723075704.GC110966@unreal>

On Thu, Jul 23, 2026 at 10:57:04AM +0300, Leon Romanovsky wrote:
> On Wed, Jul 22, 2026 at 04:59:12PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 21, 2026 at 06:33:21PM +0300, Leon Romanovsky wrote:
> > 
> > > Something like, but probably void* needs to be phys_addr_t:
> > > 
> > > static inline struct page *dma_phys_to_page(void *addr)
> > > {
> > > #ifdef CONFIG_DMA_DIRECT_REMAP
> > > 	return vmalloc_to_page(addr);
> > > #else
> > > 	return virt_to_page(addr);
> > > #endif
> > > }
> > 
> > I don't like this, we don't know for sure the addr will be in a vmap
> > and this will fail if it isn't.
> 
> Of course we know. The existing "#ifdef CONFIG_DMA_DIRECT_REMAP" is
> relevant for addresses acquired from pool.

Yeah, but I still don't like it :) It is hard to follow if you make
those kinds of leaps, someone will call this new helper on something
they shouldn't

> dma_phys_to_page() is a bad name for some low-level conversion function.
> It needs to be internal to DMA logic, in the level when we convert from
> phys to page.

I think we should not convert from phys to page, that's also easy to
do wrong

Jason
