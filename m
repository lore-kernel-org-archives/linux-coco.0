Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE8356748
	for <linux-coco@lists.linux.dev>; Wed,  2 Sep 2026 01:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313907; cv=none; b=GpZ0ML7gyYzSWzSF+BdaEqSiszDVpJzLc2eQW7M2OrjTrl3q4PmiwoJX21Q38RkZ+JfPe3yImsYnxrLT+iwFW/55cHQ3XPFL3re8Nk93RObnX7dyqBh1Nw2OByUeyJ0KKAQKUu8VqM041TVXwatnCPqw0TR+GNUsuCzF8IqTxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313907; c=relaxed/simple;
	bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PknIR0tO3CWOW+gDO2+aNyl5OnLlwHGBRljoD2iTnYf3n5LpcY4XTnLshF3AxEF+/UpV7ZompSvZPOW1ha/RFvf9nYOpsnfqOqbmJQKfPnG3lVCQZBMuELU/jZsYKpXWfQoB8BFGZa6OHG5V0IQq/rZuw9gd+3pXJCmRCpNWUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Cokh/1k8; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Cokh/1k8"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90ccb6102a1so4603576d6.3
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 18:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788313900; x=1788918700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=Cokh/1k85vJ4CHgv5xK2B6hIC0TBeuhQwpiDPs/T6jzFx4j3tSi7FxhK/fuEvlQJpV
         PgJwRJPA29geLfVJFt9nIH/L/Ep+i9sendCwtO27hjtPQJe/Q9ddQRyIAPkwcfg4jZ5w
         lIMAtNsKQ26s64ofj9UIYqkeXP9QFuEtUoYpfxdijkLiZHG+VvmcTe9JmBvIdJbg91rh
         DSxOusKi5yjI2HL9XBTXqNEJRuHLGevNFEgCv+Hkk7NE0pXnvTwRxr8XJiL8pZCoICgp
         OxNZ7S3Kd5fjQITLcgeixgJEVstV/UKqf67D7/AOutS/eCV5TM5/kU1mIy9mJLBior2o
         xFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313900; x=1788918700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=R49BlbakAHGOQKVdBNcNw7CKPxMPaT3mOWL9Rx2zGGl48yCqxRo28KNgHk8RpWxbnp
         p9UvX7vmazLyRT5/KpVWc1Yy4/RywBpI/LnjrRuS41hBzvgRaNrBp9FV4QprEV7h5NPH
         haCCO76KTsYM91AvjS9dvTGbhYScFILmXs26KtfKfAz5ESRIxyMKf7G4Cnzg/J4DOdWl
         uuy5sxd2OxMvPogAJ7MrpvuwlFKgqIbfKNSZT2ZZ549yxj+i0HcMSpoQxVvsoNApesFu
         KFxremPqSSw6cTsb4K6jNKIvLBwOrI6xWvEAKKJnnyArmmnM0LwY+r4m4ZG6VnrPOZ/z
         J2Aw==
X-Forwarded-Encrypted: i=1; AKwUvBy/1ihJjJn6OFbDG0UQ0dk0TB+xSFLQummcWS3KgFH+pb1zcMIm8AJToNRmqbaWK1p5FeH79j7FAYfj@lists.linux.dev
X-Gm-Message-State: AFuF++mZg/YCzBkOITAxQwOQv7vB99tbycR1Y9SuT0rZ0RUmGentlCDa
	ZQSqucuyv/75zPFgghdSSYmwzwcGi4n4j4IlizIgv638hEQyn3W2/IvuikklcHNInU0=
X-Gm-Gg: AR+sD11L3Wt0mTdn/yl8YMbkQtlRfWmlJquoR4pyp7ylMFWeMcRTEy0Q5vv+COzkX1g
	pp3d3KnDJGB9+zhfGM1D9pQDmfAeos3sSFny09b8VkhmSto7kwFzXeVXm1L+jRgUMTpobjAdPEP
	9Wk01lu0TFJok+j2OI9xrf6z0+A9ffXlz2sWwKFcPpD/Ij8xJ8rut0AZ4PKGezX2EZiOqGYyeA+
	MmmGMPnV++WrKQOQ57xU3+EP7b/sZQPY1DbuMV7dLyUOmh1H/jtagWo18xQpMPfyjkSaaW5I3nY
	Lh2NTVZtlVjv3+hDVVvQHestuJZIBVVTV+zJ6SMyXjYJbIixD0mYRfZuA8cDT9BOLwfEI83xy/e
	ftKiYjlbilEVb/tB4bt83RCbq71agUbVExdOCv40h7pYeF7Dh5ZXfZ1r5gDZgj3m1XcVeCS5Hsv
	aUCSq6y0m67ZEQD9j79sEsiem71srvLblbRT667IQO2/jm0fdO6Tu2fgB3igyq1K/Xti4WNKBNY
	JMv1oGswSxyfjeusP2DEAeUGkFQ4JpzYkzZIGjdNUnH7g==
X-Received: by 2002:a05:6214:2584:b0:90c:c53c:a032 with SMTP id 6a1803df08f44-90ebabce888mr24156306d6.25.1788313899587;
        Tue, 01 Sep 2026 18:51:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef4f20sm7284946d6.41.2026.09.01.18.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:51:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1a8X-0000000Czw5-2tb4;
	Tue, 01 Sep 2026 22:51:37 -0300
Date: Tue, 1 Sep 2026 22:51:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902015137.GA2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
 <20260901174230.GA2847102@ziepe.ca>
 <apcitkpASOREamQs@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcitkpASOREamQs@nvidia.com>

On Tue, Sep 01, 2026 at 12:08:38PM -0700, Nicolin Chen wrote:

> The viommu object here is an empty vehicle that almost has no use
> but to allow another vehicle (vdevice) on top to forward vBDF. It
> makes VMM code a bit awkward: there is no iommu instance, so VMM
> doesn't enable iommu driver, then there is no good place to alloc
> the viomu object for VIOMMU_TYPE_ARM_REALM_SMMUV3.

It would have to allocate singletons viommu for each psmmu as part of
setting up the vdevices.

Somehow I'd rather the vmm deal with that then invent a whole new set
of uapis and flows..

At best maybe we can invent a kernel side helper to create the
singletons like the auto domains, but IDK if it is really so hard for
the VMM (especially compared with how hard everything else is in CC)

Jason
