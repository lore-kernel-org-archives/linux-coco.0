Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D7356747
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970894; cv=none; b=JBjKr/LERl1ZqnJLXhHOSlybYx1DCcUQxiB3kx9ngxtJIouGi5ARcrNi99TSwk8puamtJPykKtVmuB3MryQlGgwNr1/OqJGnmAJmWQ7/1h09i2yYZYo2BzHzL87iPY5+c16DqFxIL5nMrRmbjDkwuz/eUDi/dY61yLRl5phhPWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970894; c=relaxed/simple;
	bh=ASIpMrAC+mByzdrQ5Zb07sCc54XQ+GfbRmFG4npeTmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc5njmi3y5v/op6DJZjNxQTHCFpVro6A94RG0FxYHw1citdm+dW6Gidjbbvg7e05OjWj6iK+v2w3Xqbw7q5yAxbl/hHmONAslEVYklZblle+MZcKjOXLo13sdEds9bkDQVRZy/JwcUCx6zd+qGXLtd1+VIvHRWvqaD32Avo2g1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oL4pJKgI; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oL4pJKgI"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e55b62640so205383885a.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970892; x=1784575692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bN9JaggjBtthcoIhUPMeMbFxrz5q2FPyWPTtAmvW2io=;
        b=oL4pJKgIYISyvEOUNFcsuwfuyD4Ral6m0gx8X61BT7+0eJzfb8U2ooDE1ZywIPKBAu
         BlDmsJnjtw326YEtJRvlfA3k8WzBUMeeVxo82sNQwcHIAIKzmboQfOR11CtLJ17vhHJs
         Cjrrk+cEKdfjbQnS7Fd1M7aHKEx0bRvw6cwaFgg/bx//Q1H1gwBeZITJ3uecXaw3qtxP
         EbhshjpTh8RKbO1c2D3UaSnbKwP7gaBsIVtGL3PRH5j+NChwFILEh0rTPfyLqZlAMOmE
         ezk9lkIekScvNXLFKR71wk7TZGwIHmQPdjWArzgQH7f7y9Bzh+0LNs499xO0IjMRNAcL
         IQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970892; x=1784575692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN9JaggjBtthcoIhUPMeMbFxrz5q2FPyWPTtAmvW2io=;
        b=I0hhAAN6QEl8WKcZEXexohAx7vn2K/EhkYKNr/9/3X54uqLt+sZnGv2yBENbul4hjy
         xFCE1+1byIOGxv8sVeMC4Ws9iQsZdK9mR67I8t37pEuW1CaGeia/ckM3BXrK/xxj5GtP
         fCziQgtgfDnX94vF9ytRdOC3ONbcGPGpZ0sgDiA2vtYXnvPFxVwNEgtlU7EVffWI2PT7
         XgZqUAZeOIDMlXCM7/oV+pnuS+/Nc1skfGR9DqVQBkA1NewsWMsa8Akg0jAPpNgPGBgP
         me0a9+Gh8U2zCohfJZOzgnoJbp19N2MQyqcKVOuSN7u90ULYTdv5BwQNOKg2EC5jihx4
         +mvw==
X-Forwarded-Encrypted: i=1; AHgh+RpPYHTQLNxpZznTQoplpH6dSTMLJ4uK0e8O7dxTyzaJ7KcTeAqla8pqasAUOKZiU49gcpvcWs+qX9WO@lists.linux.dev
X-Gm-Message-State: AOJu0YykSHoQ9V692jgXO4eAPXcFVT2LeZ+Ss1897rLZ/w9a4s2LpBym
	ylPo9fduZSw+BeloHZSsKK/oNvucOIiNM3X/T9SUhRAZtJfPB/5qSAboitHL+MJcWIU=
X-Gm-Gg: AfdE7cn+s1YHdpz9QLhXdBP45bjiSlOIsHA+Qvg2FTkgIT6nbD6gSs/FxsCxDLTS+IJ
	amztR7zBO9T6IlYIS++tKZdejbAh2amEovinfF+UNnedUiz6dcTT8uqSO6QpfYqugfRNVqPZq6/
	ijx1jixxg8XyZsT8EWmHePBbSDNqSMD0KQ0IJlI6wbRMwdeoI4GdzodnUYtPzKgvm+pD4mq+b1O
	ZUbwZT5s4JV1cymesoXlCvKy6YssJ6v1Jlp2I47uFJd0Gcb7tNIJRJgJ5NZpAytn0dXpIO54RVD
	PxsdxK6DxH25WIE7zjbiQI1OMFArCsQqjc4usBv0LS9pk1dIDTRr6VDWpcLLCuLOI2R98sqJpvf
	0OHMr80tY5GZ5vrR1HxYdLeTcVGk1aQRGW9CZEdaQ9F99hbf8sMx9A6kMuB0MJ155tlBTHCI=
X-Received: by 2002:a05:620a:2616:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ef2b55ebbmr1041396385a.31.1783970891864;
        Mon, 13 Jul 2026 12:28:11 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm137804776d6.21.2026.07.13.12.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:28:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMK0-0000000E5Zr-4AHb;
	Mon, 13 Jul 2026 16:28:09 -0300
Date: Mon, 13 Jul 2026 16:28:08 -0300
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
Subject: Re: [PATCH v7 15/22] dma-direct: pass attrs to dma_capable() for
 DMA_ATTR_CC_SHARED checks
Message-ID: <20260713192808.GU3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-16-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-16-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:19AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach dma_capable() about DMA_ATTR_CC_SHARED so the capability
> check can reject encrypted DMA addresses for devices that require
> unencrypted/shared DMA.
> 
> Also propagate DMA_ATTR_CC_SHARED in swiotlb_map() when the selected
> SWIOTLB pool is decrypted so the capability check sees the correct DMA
> address attribute.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/x86/kernel/amd_gart_64.c | 30 ++++++++++++++++--------------
>  drivers/xen/swiotlb-xen.c     |  6 +++---
>  include/linux/dma-direct.h    | 10 +++++++++-
>  kernel/dma/direct.h           |  6 +++---
>  kernel/dma/swiotlb.c          |  2 +-
>  5 files changed, 32 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
