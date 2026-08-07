Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445A3F6C4F
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096308; cv=none; b=pk+jhfgTnNu93CzwYeh7+cbvL6TTlM8+BqnLbppTLkI8FSFr0kJK/xeLXUoIQv6tBbF0AKZIAcBEJqnRoiO69NkzFa3DqAxAgOmSWYW8vIKn+Qce3NoJXJWqzrRpdpJDLnG7y0RXhi3mIazcRX+qge/y43/zlGlMaZGLssu3koM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096308; c=relaxed/simple;
	bh=Zoi9izk/va9t0fdNhetVSgFenPIicWLXh7EZnbEnteQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnOQ9CpQ6gMAFstJK3KOyDW0yOwhZo8yTEGhf0D9aAxoR3Et5Yfk5BC+P+kmXElHDTUFlLWE9F21YBzCXrzD9NlpdAiagE+LR5J216bblQG1k618Sw50PS7gWljZ24PmLiN0dbEVe3UW3Tr8wSRPMm493+nGK6XuCQ7aif/QBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X9BJtwZW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X9BJtwZW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so6305a12.1
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786096305; x=1786701105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYbufw58gsel6FCE1/jEcLG9PAf4/Ixif2gUvboMhY0=;
        b=X9BJtwZW/c6Pgmr2logTTHw9GcQswqbqKKrbz+IkuXiObTMl8Iv21+Vbt/YVweUcxl
         inJt8qlWv1tFRt1EdVkfCN+TlzfbEGi90iyd++71BIegGKP8yOrOKJkaIZtVBkIVYm5j
         50Qo2HQifVaISTzZN0VzQ9rSHcpFldBb3X4ZkhquGX9tM/Le0kvhId2pBWo8jCJwDxkM
         KuX4iAtvyqfgAzpFi8mV9NyCIQtoWS5fWMzIynLvQVSO1nDbFjUgYHZ5rhGKJ0tMROMc
         85A+aNe216uGz+x9oIixM23d6ypzrTxp5KZTxw9ZercK2zzjGy7I98L6fW1LTgwjvD46
         kj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096305; x=1786701105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYbufw58gsel6FCE1/jEcLG9PAf4/Ixif2gUvboMhY0=;
        b=M4P9MMODKtPe8CfnPVd0T77z03S7i6Mnzctv9H0UqDKow5Em4QWXWEUUBhu1tQAs5Q
         outarzUZvVI4ZHW5KYgqSSxf2pURD9luxS7f/mlICcfw0LBOM0WNh/XiDRUYVag+HOE5
         HPH0AgDVdzNd0/K0S2wrVUkHK2l20IRDvsCNvkkpQeN7ofa07JRXytPAml7my1lA/G1x
         V+XpmlbH27VOdsLddBg/zEQEoh6sZZe9Yr6MoA38TMy+dEnThedg9aMO8JeV9/yjU7QF
         2BOdAHSdo5siOgSNWoMqKx+UHBRKhWHKE1I2udJbjy3jRAiQreLzUvyuuWtJfzm+4GIg
         chVg==
X-Forwarded-Encrypted: i=1; AHgh+RpMVQw+4UHD/px/IsCUAyGw+JFuevk6zHPn7cNuq0H+yt1zdpZDa91zRsXpITFZpLhM4tNjH+154O/S@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1jrHJwWkVIUD9nAfxnWK7qXuCWhHHopfF0gu4qvsLe819gNDe
	nR3cRADsJdyK+fGrZGP9CJPx+dPJ8ZiAb800U+j3630ksN+SAXImowdClymkUtyMaA==
X-Gm-Gg: AR+sD13kcN85SVJIu281uf0IQ7ItMD7lbYjdP8cLHZgVUO/uPPul0bpJS0/3kS05r50
	y5YJg5sbSaPJV5uW3XCkB6zTg+3ftWrB6Cy664sT2crijcxLmYcF6ocDSnv0k0xIzT3zSVRXLC2
	7xc9IF+CkDpicIaSaRMphkzdpXGKmtATwRdWKGEY7ZhZYm8dD+49JzfpTa4baaguq2igHSYPjDh
	v8cFgJzjqv4EPRN5tZEPzaX1g4o7ay9hchruh93tnUDVsRTsLvFGOfH3vMbV5WGFxcvXBLRWT4C
	DFDuNJ9lDmSj+e7WBrV4l5A/DP9GQvJ5v/A16dTW8ii9jtloIyilOzUifle4+HtUtby4/vecBr9
	jhGClmh8GSDy9DwygqPn1T04sguUVA2E3IHoIpSVpQ12K+w/+5lDfddRAuu5Klf60kxIyGcDtpJ
	0rD0NRLbRRhyKmNujB8LMi6vzkqYdUjQpWI4LZcMYRFxsllI10xjSZn0gYFWfC1bKLkCL+zKTeG
	7mWUYAoCAZXZ3rykkGrzMM5eFdhjw==
X-Received: by 2002:a05:6402:a5c6:20b0:69c:cf5e:a504 with SMTP id 4fb4d7f45d1cf-6a1da7b32camr36697a12.8.1786096304665;
        Fri, 07 Aug 2026 02:51:44 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a6fa80sm32856466b.22.2026.08.07.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:43 -0700 (PDT)
Date: Fri, 7 Aug 2026 09:51:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <anWqq-vjEwwaziaM@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <CGME20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb@eucas1p1.samsung.com>
 <yq5azezfeeax.fsf@kernel.org>
 <85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>

Hi Marek,

On Fri, Jul 31, 2026 at 09:33:47AM +0200, Marek Szyprowski wrote:
> On 25.07.2026 09:09, Aneesh Kumar K.V wrote:
> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
> >> This series tracks confidential-computing shared DMA state through the
> >> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
> >> DMA buffers are handled consistently.
> >>
> >> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> >>
[...]
> > pKVM topic branch is now available 
> >
> > https://lore.kernel.org/all/178467286876.125042.12010461715645610054.b4-ty@kernel.org/
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/coco
> I've just got back from my holiday's and I see that there is everything ready to give
> this patchset some tests in linux-next. I hope nothing will break.
> 
> I've applied this patchset to dma-mapping-for-next, on top of pKVM topic branch with

I was trying to find this tree and it seems the MAINTAINERS file have
the wrong address:
DMA MAPPING HELPERS
M:      Marek Szyprowski <m.szyprowski@samsung.com>
R:      Robin Murphy <robin.murphy@arm.com>
L:      iommu@lists.linux.dev
S:      Supported
W:      http://git.infradead.org/users/hch/dma-mapping.git
T:      git git://git.infradead.org/users/hch/dma-mapping.git

I believe the corret one is:
https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/

Thanks,
Mostafa

> patch "[PATCH v8 17/23] dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED"
> rebased onto latest changes in arch/arm64/mm/init.c.
> 
> The remaining items pointed in the review can be fixed incrementally.
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
