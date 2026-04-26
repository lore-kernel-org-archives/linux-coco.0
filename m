Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910E3EEBB
	for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777208735; cv=none; b=W3rgA4s6sCvzp58CCYo0ds7IMiLaXzj6sY0EiOJi6Hf22AJ63ODQzqCvjd/ZDTG07BVpcd+Isd3DYV/WAM4tNiV4Tny9LrKBubsgq7D8JS4BUy4pm/petf6ccZDogxttg5kF5Suqb9O/c710bVN4A20Z0fH6wQ8OkOiBfPyvzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777208735; c=relaxed/simple;
	bh=p372NUN8mpdPi0B1Wv7deQ9himnMrrfonWh6E7CqgbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkWRLUEu+JXUXjN6riVkuvylzLUfXr340H6CXPNMUbC4xPfos3GvNQLxltciE0x62EGUnQp/gIlkqqhjVKYp1WmjvO3LxAtGvHl+XEUN5Dhyo4qXJgmZiSsnFAPpXqtAnUwdNIo85dpOk1MEXDi70mvzF8BQKEqOVzaICK+PNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TIe5eIvG; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TIe5eIvG"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-612d8a59cc0so2935881137.3
        for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777208732; x=1777813532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZgLj8cyLE1pTCqai3ecepNuqq+WdEKm5C7L8MuPHFc=;
        b=TIe5eIvG4A/C00wWfFxYKnk9q1afjlNem9itLYxjx7QdMXHdmyzmfqRIzaE9v3JvB2
         E7XwzbsB/IoISgD1f51siuNH45MdtPFWfJjfCc/4sM8j8BP3/ppMAUa/A5uMuRRF1yUe
         ixTluRyVjv9thcuTItAeIOGlaDhr4sVQ2Mzw4FnAAj6XqimGm0N5HxD5aD1y2BVhBtNM
         Iju9MNhrFDuhCzu2VJDnvJqwDpZt88hnkL9o6TzE2isM3yGskCM4tGTRyj0HmJ7Ydtz5
         h2WQjWaR0e+m5zdIMQS2YGoVEYWiipn6gXGakszjyaBoido1T3aVe7hWymnO7GMmNTsC
         pAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208732; x=1777813532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZgLj8cyLE1pTCqai3ecepNuqq+WdEKm5C7L8MuPHFc=;
        b=SvhAsLdCTH8vIQmKzqniPBoW6IYAt3zAG7/Yc1Urrpur4WLvD2x64A1Qtv7CCF0n/C
         Ii0krD+bBV0LT4jQqox6QUO8SxY0CevkV0HusQ7b/u0QhZxNdVd8VpEQzy2IO0bx6Tf3
         coihv4OH+L1T3VHtkYakzaJ9hsqO6iDQvqnXllOMnbbqxM6RSe/SRd+BHq1563kxELxS
         VqlkPuXS/IqvvCOc+Ikkde+xsbgOT+r5BhOTkGd0NDUycb6l92CH6naMoS/iTRDH/u48
         c5OVzj/5AC9MM1xwbMwpjbP7w9tDOygUGjGWmvjVcNY8e7rgOhxPlCQPTkLO3sPnEbRZ
         6lJg==
X-Forwarded-Encrypted: i=1; AFNElJ+nh3ZtdpruoB1Ig8hlmvD5FLYzkx18WTYB0b0wLWVyD/oYGxwGDwpY8Y9a8QishKk0w1SL/yCWWj8q@lists.linux.dev
X-Gm-Message-State: AOJu0YwQHcxpbt34CGBM+XiRfTRyb8oSFPJt0L7uU0QZKvRbPVkXD8A9
	3PUxhjRZg4avDj5Md8QEcNfID4ptLHkGJfp889TWGFGn/1wnR82JFnd39GSCCvqbFqw=
X-Gm-Gg: AeBDieubab+GY6TXE58bv7UQEeAEwN0RZ2ThsXTUddbJW8vV9EH8nRlQmhPmXgGTklL
	RvmKzVniZP2hQ270OX9v26IayxNcyr6SrIIfoPFwWVWjBeSmCFzrn+5lwUWzknixC9ICJoxAC47
	VVGMOz16tb6F+wRHyUZ0mu95/EQHMmP/QFGecU7NvEcae0slvpIRW9o95Ho5DIoBv9m4jDKzHOn
	bJ4z/TvH8/TAEi0y1/eV2ynQ/uR2TDXWSwQB8QWmT0gFVh0/jbCJQxe0lg9HoCLf2IkDfkFbKWi
	M5H3sv2vuW+SinriWYEyKo/wDpYg9TfJ3vWgz54wYJxd6MyQNcacUJ7y9fPBVyJ37alHQjhEgdu
	40QDCFt5ozFz9xudc/mIjJNmRJiDG8CuTdixp9ZE9fgsyqLi2FCbjOT7vIzXycfwROD1y0CPzf9
	R5EO989GhLInPPyLQjtXyFTVCYKVbhsDKKOr3xpMgbyyb5rALmN5k8QDNrI2EMLsAJsaRrOW3f9
	Jb3i4Fnp/8HqQ95Zr/S/IvOdFw=
X-Received: by 2002:a05:6102:5e94:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-616f772efecmr18253527137.18.1777208732488;
        Sun, 26 Apr 2026 06:05:32 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7df88sm249063966d6.35.2026.04.26.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:05:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGzAx-0000000Egs5-0CBA;
	Sun, 26 Apr 2026 10:05:31 -0300
Date: Sun, 26 Apr 2026 10:05:31 -0300
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
Message-ID: <20260426130531.GF804026@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424225514.GE804026@ziepe.ca>

> > static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> > 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> > 		unsigned long attrs, bool flush)
> > {
> > 	dma_addr_t dma_addr;
> > 
> > 	if (is_swiotlb_force_bounce(dev)) {
> > 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> > 			return DMA_MAPPING_ERROR;
> > 
> > 		return swiotlb_map(dev, phys, size, dir, attrs);
> > 	}
> > 
> > 	if (attrs & DMA_ATTR_MMIO) {
> > 		dma_addr = phys;
> > 		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> > 			goto err_overflow;
> > 		goto dma_mapped;
> 
> I suspect P2P is probably broken on CC because this doesn't make
> sense..

Actually, I suppose it is fully broken because it will jump to swiotlb
and then should fail.

> This should flow into the
> phys_to_dma_unencrypted/phys_to_dma_encrypted block as well AFAICT, it
> shouldn't just assign phys. Assigning phys to dma on a CC system is
> always wrong, right?
> 
> It is is more like
> 
>         /* To be updated, callers should specify MMIO | CC_SHARED instead of
> 	   * implying it. */
>         if (attrs & DMA_ATTR_MMIO)
> 	   attrs |= DMA_ATTR_CC_SHARED;

So no need for this if, we can go directly to marking the MMIO callers
with DMA_ATTR_CC_SHARED once this is fixed for mmio:

>         if (attrs & DMA_ATTR_CC_SHARED) {
>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
>  	} else {
>  		dma_addr = phys_to_dma_encrypted(dev, phys);
>  	}

Jasn
