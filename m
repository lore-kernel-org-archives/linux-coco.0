Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616C357D1A
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971587; cv=none; b=PRU/49q0eMZlnqNzHas0+d5HXg011c+alJ3mQdn4a+BinvaQFASxNMutTDrIeabdir+Lw2UDUBzLvI9Mcy5PzWQ6Tyj5ZMkAp22Qle1j4+Ce+KXBpvPlOQAssZu68bCnorbP+ff0PEFsZfKhxWD/S6wks2bAbjwXNtBue7lff0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971587; c=relaxed/simple;
	bh=6ObL/bIb2BF9Fm+HEWevziQ1Coe0QkELhGyBpHyDwZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4gngz6sgIPwYyAOZYFJrc7rvL6cesNp2WheTNN19VBmxzUS0scxXT6NF3c5+hZzin6oC0zbxOPIFjTI27nuq0hZa9w+QXK37511yeGuSbZquzDENKSRyStW1LLqBgwliKUTX0XlotkRIH7vzVdTok47xkY0yxDOv/jqTHbEitA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NO/3ybPv; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NO/3ybPv"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f032b47e3cso27466976d6.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971583; x=1784576383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JWJRfd6QdZf7qlUjcbW5D2kIZlwkQZ3KWr7+m1ApiM=;
        b=NO/3ybPvNWMbEG/xIVeSH5OgAl3LgFBHDsGdtqAkRHnA0w2hmMlWerbtTmYxwjD24x
         sjABuM3YonyAYJljybB63/Ohf40quEQlGJGQOYdu8WGclBSC7zQRmyiAl2keH19NoBY5
         yplsbamXo021O8Zpz1l31qGTKDtzfl+Q23YIqORiJfGNDmsrRbEmoSD9kGOqgEOjg9v1
         chdemy4EnB3CHTjFWiMhspwqC1U/u7siwCig0d4hAqkzJ9ZFxHGlhnBlfhzk5B2sut1s
         nMtH/JSZBU9e8B9On1LDRMhPaf0+Fh9STBt7SahH1yPq6bC1Ux6G6h8je2nB8oul5IWL
         svFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971583; x=1784576383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JWJRfd6QdZf7qlUjcbW5D2kIZlwkQZ3KWr7+m1ApiM=;
        b=FznMPUKMQoa/bJ3Gg1dUO7uQq82f2kwD4F+uJD4p3kVN0lDEn8FoIPMRUtpgoZ6dEL
         fUXX98d7EBt1cvxEMGEdzbni6bL+FoUFbmSX2/pr4d323E5cuubthEeEm2NV78xCaESQ
         58HrpIyuDvqGOcnYXmab7XEX3Gz9Rj75xmk30hgl30m3nQLXqFNcdbauftj68r1SKrXe
         GtpNj1/CBi9r8auowonWdJcvaVX4FT84GmrTEsC0OGp9Z4SOMslfuMuCzSO1U7gUvQbQ
         G/Revx9KQgIoIPeSDM0YiIP0pdajE2Jkm/+nxYvtH6Ji0OXWchrDr/EpBig3zXcinXMR
         0RyA==
X-Forwarded-Encrypted: i=1; AHgh+RqAUtCPM/RCI2rxr7TGiUFp/yzXD6DzLFsGeBVuyL3EXx2Xf6tjl+eBfesg6po0YSDycJwUdDh7KpCk@lists.linux.dev
X-Gm-Message-State: AOJu0YygME5NfELyrVvhg5bpyM4lsXCWGI3bGicu4oEXA6BX8NdywONC
	12nwFAPT6tdFTgK6q7xJvu+UTWu993GLyFlCxlPj2sUxKBUiR3Mv1A3HIJO74uBRL7k=
X-Gm-Gg: AfdE7cnl+qKRtf5/Iznwqkwo55ETKyH7aFU9BOD6fuFDRWYs0G/fp+PMEYJTRs/r07m
	MCrSGBODpHv8UJE0lGuILhVEYz9RU0tnEUgsh+lyWWmzMkPf+qGjmi/gqdLmmQA8wKGUkJiGRgK
	VwL/nNwtwmt89y5I9fog0KrCQqrEDKuQRBGL8SlIniBkNz75istRZZLy/aFcXM5OYuGolN1rXPi
	7pimq0JJcBBr5wtuFD3+5rTZsDRR4pXhgPzHjWKNAO7tWALRyjSQ8W1gNxVVDIVp0Jkal1OUcRC
	IoJD2Fe15AfSMCcGPCW3SsfpESttKIvW0q+Opa9DkdjIunLkLdWwEwoMb3BwJonKCTBmXwP9WWd
	D6Q6Ci9csasUVqnlqz8MUcOrkc84JQOs/6RE+PRwCJ4QO5h4Qymf5/l5qS1OI
X-Received: by 2002:a05:6214:4c8a:b0:8f1:3533:7a83 with SMTP id 6a1803df08f44-90402c68b4dmr105755746d6.33.1783971582552;
        Mon, 13 Jul 2026 12:39:42 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90725bc050esm20419156d6.28.2026.07.13.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMVB-0000000E6bn-2D9o;
	Mon, 13 Jul 2026 16:39:41 -0300
Date: Mon, 13 Jul 2026 16:39:41 -0300
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
Subject: Re: [PATCH v7 18/22] dma-direct: select DMA address encoding from
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <20260713193941.GX3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-19-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-19-aneesh.kumar@kernel.org>

> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 !!(attrs & __DMA_ATTR_ALLOC_CC_SHARED));

The !! isn't needed when going through bool, the compiler does it
automatically.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
