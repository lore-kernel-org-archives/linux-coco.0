Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56D3BE62A
	for <linux-coco@lists.linux.dev>; Mon, 27 Jul 2026 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126250; cv=none; b=PNmXwoGuAJRodT5ZRL7CkRVBZJZpBeKkv9Q5AijHagCwdp1pzGt3emWhWYYMeqh7RXetDHu6UXRfmlPfrUd8HLwzYLj7K3lPlve+0vZDUKNoVIZTU697fQnE6mfgzVcGLIh3ixVHCwvCxhNKZ0+wrCi+E0C7Pssr0p/OTAlho4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126250; c=relaxed/simple;
	bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hC354dPbpabuY1KKOZwFSs8U/6NA0RaI69DPZSuS5sldh5srytvjreutfEyg5ZOsFznfYnLsDJ6P8U9DtSSsF42fIF2Lo8SSOfQ1/4I5mID7to3caaj8V7CpcrD14H+O2do6mMgzVegTb7t6aXMEbn9nHwBra4nC4AYJC+OkLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pw1KYJHf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pw1KYJHf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1861024a91.0
        for <linux-coco@lists.linux.dev>; Sun, 26 Jul 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785126249; x=1785731049; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=;
        b=Pw1KYJHfdhuaa7Zzdw1pfCwXzNL/74j3UzwHZqbpJgtdJESbOeslLyun2Z5xrY66QP
         J9Fq+TDu8+f6sWdVdK+eWlZaEmJsJcl3xDGT8UMBE31j7BjhsUlRljZcJNYUwvJj/ZbV
         45ObXrjsRdzu9Bmtr0oebykxoXgtA1dQ3ZdIHVXrVd7FbwzLbG/LL+ldxfqaEEt9uyHJ
         sE0x6iHHr8u5pStPK9nqa/S1BdbZ5XE51MzkgZnZojzQ0LxSiBAdCW8VHSLQy48VTmtC
         yp9UCMt9QsDVrw6VKr42V4CSD1PHjJvXGOdiT7M14e4J3xXEzbXN/lmvn++cPWNZmwWu
         yVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126249; x=1785731049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yy8IISh+FV9cpGipg7vORYQVek5AJgkZkfEGn4HmLng=;
        b=Lm7DPSFuvyXnN3DocmfIuwgTbH/i0j/cYWeGOdBuPIZpgWVJMP/i3ka/9ucsUT6/zq
         +GUWK1q3ds63KzQzk4LL8Df9m0Bd6QYQDzbSpPZ3LuhxWfIwEiZMxcqkXlbpYBm6Squ4
         jswWe04A+7uFNQznkkvQmyGbFufTiLCIWr02z+VfFnjtU/0+CEok/hOskjos/ti/sq29
         sT3JOJO6TNjrAusrUQkGVUNRLyuPTVFoSEeI1RukR1e++vH5FKpvsdts890yQaZ0JrU9
         2zMpdVmBUDnAxdPvci+K6W1xmnHon+1oMR01WSHtWcAdAUn2X39LSKiLg8ztHFIcmFRc
         0dDA==
X-Forwarded-Encrypted: i=1; AHgh+RqC834vSSlALBipXsvJJ1NlRE0HNRDcTZvUAcjJgFMxmeaay68j+Vb1l+cBAWIU5LHzCV8yhUTxJhpz@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1XR7JsyjTKsOjbi2GI4zI45/zqLC8VYYDPe9YpY7XL7jximii
	GcIwQFmgFKQWysEqT3HKXJGhdQlgl17Cf9ZOVt00sNleeKxKcEoadDr9kMWcy9u0AJY=
X-Gm-Gg: AR+sD134YNjj6/yJF3AmytVhf4nG4dMJeUfeGNA1F48HvUHVF760ZebRrfhdjL4c4za
	1jM/Yeevsy0B0xLL/VG9Qk6Ysi91StKbn13zjS2fUp72GbKg+qqb9eEVExi+ymwde6GoAp0maWW
	1mLTQx5Tv5axY/a7xbVm2NojRre5V6IvKYiac3svo69HJ1Gy3E/JUMe1H/ElGRm1fifPcWgB1I6
	o7AYl3wwsLIPemROAoN1jkEcgHCjEyuc46UF5rJFiYLNzyCRJJWJRDAvvrA+1Z8vN64oYTOh9Ix
	ntZ1+SF282GO2pRuK+reCrcauJrOeA6/nCEhteAq9RXTyRwc3sxiRE2s7B2hE2esoGtSJMYLzjv
	D99DcDi8j5kmKQUHjR6NwS5C7bWdMcVVkYUglKrLQZOF1j2Z/ZB1ziDfPLKViiQ==
X-Received: by 2002:a17:90b:5350:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38f29399845mr6819950a91.2.1785126248497;
        Sun, 26 Jul 2026 21:24:08 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm4471929a91.14.2026.07.26.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:24:08 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1woCsf-0002Mt-Ls;
	Mon, 27 Jul 2026 01:23:57 -0300
Date: Mon, 27 Jul 2026 01:23:57 -0300
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
Message-ID: <ambdXXcfgK+cxqxa@ziepe.ca>
References: <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
 <amTJY_CdE-uDgoGG@ziepe.ca>
 <20260726081753.GD12003@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081753.GD12003@unreal>

On Sun, Jul 26, 2026 at 11:17:53AM +0300, Leon Romanovsky wrote:

> Currently, the phys type universally describes memory and can be
> reliably translated into any required representation. It is the most
> fundamental type we have.

You cannot go from phys to page reliably unless you make assumptions
about the phys, that's the whole issue here. If the callchain expects
and intends to use a page it should really stay in a page and not take
a side trip to phys.

I agree it would help to have some helpers that were more phys based
for the callchains that want that since we are mixing two fairly
different activities in these functions..

But making phys the only output out of the pool isn't going to be an
improvement.

BTW how does a struct page even work for decrypted memory? You can't
actually use it that way right? If you try to access it then you'll
get the wrong IPA and it should explode?

Maybe we should be blocking the struct page path entirely for CC
shared?

Jason
