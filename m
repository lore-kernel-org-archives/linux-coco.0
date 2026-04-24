Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69191A681D
	for <linux-coco@lists.linux.dev>; Fri, 24 Apr 2026 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777071318; cv=none; b=FcahQ99TWrAwZRpmNXk7oX7e+BU0wcq7iuuw7txo9ncDHhqJH/LAChKmCjX/5Mq3FFk4A/DNHJJ6YFpcOEaX9igDSlH6EPq0rFNqOuEdVgi+bjpduWbXCEmqKGqCqR9tkDkC6i3c/Hqw1/YrIcM0BlK4Oa7hJUo64cbGBX2kLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777071318; c=relaxed/simple;
	bh=cV0Gxz7W/U+/DxuSBdghEEEy6w6inDWrgGPifnEQWHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfys4mLP6MndIKXNenf3BeMtZM/li6++xfzML9kHkVM+HS4cfZP4inmYbeY8AWWgOTUPkRs5YAkwZlptuYZ3iJVJi3vGRsfXDqF4AdneBVNNUPkvB/Vh+X5TvzyEMrgRcvOuU1jghV7hZO7/jGKTNcbp5tGxbDY92+Ppxw2Ii3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=j2s6gtMi; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="j2s6gtMi"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899a5db525cso65839386d6.3
        for <linux-coco@lists.linux.dev>; Fri, 24 Apr 2026 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777071316; x=1777676116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw33gELuGUNq59I/OY2f7G4Yqpl4DyjVQaY1TU/E47I=;
        b=j2s6gtMidN7T236PMkGx+W4FXYwRa6eIECKjvlTJY82WwyHmZRaKuNaSDUmc+WNFsV
         cekEdt/9KprVLPLDQCiMzVnHKVWKWH4HsUXvHrQb7pkVSv4VbhVNR6p7tPI+Z8v1zLbZ
         jolb9ZsQ5nODJc6zqd0LgQvEAyWxZ8LB79i8M/UPA1VDFpMJDkzr8fsDayLx4sl+iI2i
         YSNU/eAQhCfGU9CEGyvJLDpOjn2t3NjXsX/PCdJKy5Z1xwmULACsg/Zs/q+meNJcYcfw
         Ic3RKOmv+Ho+7op0txrn/ntUQvTXqgdw6cwXfVzE8Y8v4vBpebI+RE9J6+1fF+yrYVj+
         eL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777071316; x=1777676116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw33gELuGUNq59I/OY2f7G4Yqpl4DyjVQaY1TU/E47I=;
        b=liuypKvsNhFaANE1eXqq+65yGnEp9RBHBLS8whdmhZVrBXN5tdesnaqKVFggCSCwOC
         EKL3hEm0tUTfXqtB/i8CSCQT/j4Jow2fj3i5HNz6b/Wcgq4VlTlcgKAOe85Uc2tnX6qb
         NMw4jXJuGuzmqjoZ76BQ7XQXn2un6jXeTC8nVV1k3XVkq3BfJbmkjvJYp0gvkHnFS9ta
         cZGcdSzhz2VLOX4HGp5V7I+l3GGnuaItzblKWfY68lCz5FVruEjGE9lkY+MVVvldReXu
         kSTCSH3zhBarQxGrkdISY8BLprG5q2+E67xqTZojKHkFyYCw+lNHB6/JT2ZlV/guk9ai
         1HKg==
X-Forwarded-Encrypted: i=1; AFNElJ/FiJ/IUhPzXCPxZ82V+IKlCwWI9gb8/cSLxJF3UwmpLLmxPFwxqbJhskeBFb3prixBusy3wwqqX+qe@lists.linux.dev
X-Gm-Message-State: AOJu0YxWfyvaBjVnZUJba91YzeMOnPZm+bTP9zljvHRFVYRvAWo23MHA
	btYNuH/IxYgAS8TD2OqOtbgwbaPBvG+9xgR0m5iv8ag4W+OoEzPZh4GcljjSeCgD2nU=
X-Gm-Gg: AeBDietCsmdMeQAvY5Zc8lLXL7WE3Z3dqrjwR9EnsBh0TZSpWRmH3Qzq5fCgnRyYbBH
	sGVH5V2rZVYivv8iuYqc8mBoRdeOJhGsu3BUZ3KrVlTYJI2Fg4uGd5pdbODdw6Dvq5+DZu/ZYD9
	6KQ8JORwtF4k1YFS8daT0YZa18DagpwVI8xG/0Vb6OraMlpv2nJCBsxzfhOLqdBz0UqNU/yR9Em
	08ebwaUDC0cyS5IUnnyRParyrMU44njBdMFki9IwcO4hiwS8OK584WKqq9/6PlxdrPvUhJNXotB
	zudHyRkQixAqTd6cbZnIb1r1/RJ3SvMAxRy/TnhxfQjlzfr25Zk1S9S8Kg1HqDrHbTMpCXDOVFX
	pxsA1wvtnzZeZEmxby+SANBJptartAMW+3Sl3E6AGQ6Vru8+NntvvgGiz9vOqgrADwL1lk1PllP
	Co1qJg4Yu4uuzqBrN06Pl8jhEn7aLMybKDja0VoQ37gzLcY6BM+6oCKW154lONUc3cRsx2hbKWs
	izKI1Owz3xTKLxG
X-Received: by 2002:ad4:5f0e:0:b0:8b2:2474:8f3a with SMTP id 6a1803df08f44-8b224749034mr37604816d6.25.1777071315667;
        Fri, 24 Apr 2026 15:55:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac78513sm198480506d6.19.2026.04.24.15.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 15:55:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGPQY-00000004wIG-2XfJ;
	Fri, 24 Apr 2026 19:55:14 -0300
Date: Fri, 24 Apr 2026 19:55:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260424225514.GE804026@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik9jcpzm.fsf@kernel.org>

On Wed, Apr 22, 2026 at 02:48:37PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
> >> >> You reach there when is_swiotlb_force_bounce(dev) is true and
> >> >> DMA_ATTR_CC_SHARED is set. What am I missing?
> >> >>
> >> >
> >> >So a swiotlb_force_bounce will not use swiotlb bouncing if
> >> >DMA_ATTR_CC_SHARED is set ? 
> >> 
> >> Correct. Bouncing does not make sense in this case, as shared memory is
> >> already being mapped.
> >
> > It is a little bit mangled, there are many reasons force_swiotlb can
> > be set, but we loose them as it flows through - swiotlb_init()
> > just has a simple SWIOTLB_FORCE
> >
> > Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
> > selected for CC reasons. For instance if you have the swiotlb force
> > command line parameter I would still expect it bounce shared memory.
> >
> > Arguably I think this arch flow is misdesigned, the
> > is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
> > the correct API to check if the device can DMA to the presented
> > address, and it will trigger swiotlb_map() just the same without
> > creating this gap.
> >
> > Jason
> 
> Something like this?

Yeah that reads pretty sanely.

> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> 		unsigned long attrs, bool flush)
> {
> 	dma_addr_t dma_addr;
> 
> 	if (is_swiotlb_force_bounce(dev)) {
> 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> 			return DMA_MAPPING_ERROR;
> 
> 		return swiotlb_map(dev, phys, size, dir, attrs);
> 	}
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		dma_addr = phys;
> 		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> 			goto err_overflow;
> 		goto dma_mapped;

I suspect P2P is probably broken on CC because this doesn't make
sense..

This should flow into the
phys_to_dma_unencrypted/phys_to_dma_encrypted block as well AFAICT, it
shouldn't just assign phys. Assigning phys to dma on a CC system is
always wrong, right?

It is is more like

        /* To be updated, callers should specify MMIO | CC_SHARED instead of
	 * implying it. */
        if (attrs & DMA_ATTR_MMIO)
	   attrs |= DMA_ATTR_CC_SHARED;

        if (attrs & DMA_ATTR_CC_SHARED) {
 		dma_addr = phys_to_dma_unencrypted(dev, phys);
 	} else {
 		dma_addr = phys_to_dma_encrypted(dev, phys);
 	}

        if (!dma_capable()) {
            if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT)
	       fail
        }

> and dma_capable() now does
> static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
> 		bool is_ram, unsigned long attrs)
> {
> ....
> 
> 	/*
> 	 * if phys addr attribute is encrypted but the
> 	 * device is forcing an encrypted dma addr
> 	 */
> 	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> 		return false;

Yeah

And with the above little edits it works for MMIO now too.

Jason
