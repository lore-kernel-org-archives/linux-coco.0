Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C307357D12
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971609; cv=none; b=tgRiCawFnw+HPU9NWNpWrZUjW5h6S3U4omuon4mJ3gHok7Ly2Hf74im46Zd0BYXl202jCa7nKXxua6nr2j3FWjQsXz9IvRVjhCziMV65xvqYwbed1lbaIUU1jhARKWmvvq1pDXSDJRHl1bF7L9RvyxeBzWlKJCdxol33aYDkUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971609; c=relaxed/simple;
	bh=M9QKRtZ168nKUwDynjsu2QK6gybRC0iEdsj+58oUPCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYj7j/4eUOUAVNSTgudohlnV3kBlTQ5080ZyzRDIVgDYuRLq2IScLuaTPfo49JvryYKyinGCn9zUP+s4+vVOyHJf0BwdOgQgoqzO47c+V4TzMqIYs4DokHLC6rfge0MeyuOd9E9yni3ge3adtsfGsLkBFQVDfxloDqBnfgIfc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=H0TRjsHo; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="H0TRjsHo"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f23e851626so35286456d6.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971607; x=1784576407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3axe3nHsSV3pW5ca03j1xpTM6jT4Lmr5n6MpYvrruyI=;
        b=H0TRjsHoUAIVqOszZK5FaSEhy86txUql6BsNgMU6NAhoiCoFGJ2IaFylEPz/lK3jGw
         Zp9+JXZ6wT1ZJL8985KzFkFl6KsuL818y+pqn3fGlBAUmGXmJIa2YLm/D3L2zDr/4WJx
         GKKMDwKzwtylCauIHZmopY4plFIZA54ODYMFuSDJVR2WPoaah8nGkjVFckbc7tJ5gl4+
         APimHVkbaB3e1+qd1TfNPdfM0Q1fnTHdmVgCwZkdjzkltnd2deqqXRxjhBMisiTlgnHo
         M1qa2HhDce5NmS9U6RoLJgv2aY92tP0kbP7qewZpQ0NGYIicGyudWDeEwkARNqwmKPc0
         e7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971607; x=1784576407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3axe3nHsSV3pW5ca03j1xpTM6jT4Lmr5n6MpYvrruyI=;
        b=Y3YoXoNfpeeWNjJquq0hvyz60YQIXtO0Xht3QSqxDNgrJwPPJmHeCMbYy4/lIAa2Ds
         5Mr5RXtQn3xp2oL1mhp1+OYv2D3Qb5TwyEbUe9JhkYrPPKwG07BjUpUSAuoPT2IHlsbm
         rCTXAv5V02PEJNjGrHGXYUqye9SkKSj0EfreSoNTTbiMTT6ZETkq6CUrnA/mSC0MQ9LE
         UABkIsKauESDxRXpCzFjB7vre2n+FASnYnD6jrtHHv5KDpQT50A8PLknjsfv7ElFnzUF
         ///Ggp8e3mI+jEVxnzFT6xUd2ZV9JwmEuhwb3L7K2IjYzx1UAFMdxYsWwPh507f7nbf4
         ztWg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/+YHOtXzriYy+69je/87umBA5Bo8wXnkJ41mm3TpUDh/5pbYDRT0cD4jDcDT68UD1Vhf6yLS4tSal@lists.linux.dev
X-Gm-Message-State: AOJu0YzTFYiatGCojLnGujXJsm2J7tWcd5QyfM2plTIM2Rewchi3gpEL
	0njycUKffzUGX1pDTV6fq2m37HfnHYC3aYzCtZ4/6UI+NjwG22Ndt3FR55ObxjtnM7M=
X-Gm-Gg: AfdE7ckgtlSa4p1bHmLFzLiEdaSxu2HxsfMrjcGCOM2TlfWP7E86mvzWW8zkUX52fB8
	rCnsIe1gQy0TvmYXDlD9FQWIq85P8nEVUE2WTn2uoFKSuAuCAfDYEkycW6rwNJSKhb2aPzUk1rX
	0vi8YngRgHzZeAmz7TBemeMcdEoShbcRDVM3m0WwcPowMGnhJjhiMh1JWeYnlov2AQHB57mlZGe
	bCtQWxrqtHfgM2y3v/0AlTI/DXspkugAhmH8Mbu+1SSu+QyP96tmRC4y4/Jbu5CO6KiXgvfNUw6
	ZTUfbeO+GO03bv6Jj3jmYSahhaRBVpqbsjuhHU75MrMj7CgXCEt/oHd3Up1MvisYVfLT37Mu5S7
	q9XETbJ7wk/Nkf6cXSZ4v3n9K4+J5WfwBbX4nMabHJuHKEZ4cOE4KJGwyH5IR
X-Received: by 2002:a05:6214:e8c:b0:8fd:6e12:9711 with SMTP id 6a1803df08f44-90747d1c8bbmr12839976d6.63.1783971607034;
        Mon, 13 Jul 2026 12:40:07 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c06e1sm136829916d6.14.2026.07.13.12.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:40:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMVa-0000000E6cV-053d;
	Mon, 13 Jul 2026 16:40:06 -0300
Date: Mon, 13 Jul 2026 16:40:06 -0300
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
Subject: Re: [PATCH v7 19/22] dma-direct: rename ret to cpu_addr in alloc
 helpers
Message-ID: <20260713194006.GY3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-20-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-20-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:23AM +0530, Aneesh Kumar K.V (Arm) wrote:
> ret in dma_direct_alloc() and dma_direct_alloc_pages() holds the returned
> CPU mapping, not a generic return value. Rename it to cpu_addr and update
> the remaining uses to match.
> 
> This makes the allocation paths easier to follow and keeps the local naming
> consistent with what the variable actually represents.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
