Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586D4DB572
	for <linux-coco@lists.linux.dev>; Wed, 13 May 2026 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693106; cv=none; b=KffRhtG13AumYu4DopFrQIVCMQSzch25HrJWr5fq/nnh+uiC0mJfEYYHWZJYfU3ZQjX3WzzDJaq1txTwYOokjHcNj9gUI4Ggd8WL7NI51Hk+VvP3ClXNTrGOLVBphUHdE54QLTr+dyiqWQiZGs15ZtT6sA0k+gAVdiIItKjFLbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693106; c=relaxed/simple;
	bh=BfC504n+kThMXbLodptWdwF+5sTWwaf4D5wXQNX5RnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kla3V/ViDrdf2f/H6MpxvplCittP9eHxIDqKZ13Im+TciH0Kxwo9B2c1g/gXM396lUoLem1Zo2jU2nPkRx8DItFO1PJr6xPas5PEs5ti0y/ykko44Fp6X6WkQLKQcFvErnL9XOrpJkFJB9M7+dSSkQ3Y1XBcWtXhgeiR6MABPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=diTLTNGm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="diTLTNGm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9103019f8c4so73483285a.3
        for <linux-coco@lists.linux.dev>; Wed, 13 May 2026 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778693092; x=1779297892; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQtwNmxswhQih8gmC6FPDl+zfVKzr3i0rq4YmglfcBk=;
        b=diTLTNGmhCzdtJ+NRsujqK+1p/V4K8syBN7koLP8469L3r5vDF8JmO9dVYvGRYQ0JO
         GQ4+v62TgIC5yZ1XXI+khnEcjBWf/vMziwrSTq5V2Zif5/iDDg4yqURpG3pgf5FSAxqy
         NkAeHJN4Ur8P53UGvYapAHzmCTTP3l7radxOY0U5LkTOxRHhuQBzKAOmFzf6MPFqgF/g
         y7JU21ZOfCTiroh9dQkDRAfVqKQ3+IAih6J//pbBVvr2OYjGhBBDmUdlMy5SgVaWVIzR
         olnPTOMuYD0xzd6t/cQaassSeCkY5IGJZKhVn9/mzDDbj8tnnsjsOo8gSa4r3MfB81Ho
         HJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693092; x=1779297892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQtwNmxswhQih8gmC6FPDl+zfVKzr3i0rq4YmglfcBk=;
        b=Xd5KMSCoMGekaYCqciBqtwB+otQdjXxucmB8283vo8H9RumE2CvdMggHynaMqyonbf
         B2sbzZ/Sy/tYXqWriUotgd2yKT5w8y7bMgksTzXFmPto2Zmgn2nztijKYzDQG6wAuyEY
         6Vf4QPu1CK7CWLePWFJKzCIPX7OKDzT918pwdn6R/yfD8Wrcy9PD2mgYaRGgl81rdHHr
         nDJZewMTooa/NU8qSukOynM0bZkJ7mjbnV3wiBCWQZLZPIBv76CXdBE9mACLM88YVQ4f
         ZFRsUzLcf8PwY0FZiusaf4Kk/s9QdDvN8lciJqeTwFVBHWUaYEdL46NYbLXwE2wLMdza
         IMmA==
X-Forwarded-Encrypted: i=1; AFNElJ+SWj3JLai9l0u3qDsDB35zJjq8eU9/yjaVeWom9HTuiCE1ygdXMvOkPjNJt5WLoth61V6vpQ9BGonS@lists.linux.dev
X-Gm-Message-State: AOJu0YzDYA82t7NYRuIVjqZJYYKCYRWmFLpUR8MJxB1eVVNNzMB3Oz1R
	AwIzGpkRjqootaCC3HXVWjd1b4+YKR2XofGmT5Y+gegS9JEbRF9LKWnQvuVacDMAW693yYlU6a8
	8lnRCWmc=
X-Gm-Gg: Acq92OE9ETLhb2JD0Y/3Kvs0DRYPdwKEVpYogQzLPY+kYKMJKQQ4T8qretvDg2eINBT
	5byATwfsZ34GYOW2P+tN3NpRVkpGLPIhR8snerBLWoQJT3LL4FiLm9jR4oqbu+hYwiFck6XFuSC
	/7+eGjN8Z0f1t0bAQ5e/zyPNDUXsxSlNqdXG4WS8YNIzUKK+nwOdCx6m4YOk0Y9dhBj6Z/ON8wZ
	yXEF6DoKlkvffZUCW7fSlpGK9nC2gExYTybawnz//g2q9A2JChOp6908FYZDF9pKhTeJV4Pg1Of
	acTDyBWmY/PdtsTvDc7KsY1IcbR8HSFocng23KDnqPOfr/hBko+sJWfA+cIOoRX9DMWfLGKQByb
	ZndCy53E3Md/nmKS7nzx0r6Me3I+o1TM8NXRy4LZ2KWFjU6Hut4h9KtezW1ztURg5qNIvIErcWP
	glPQ55Wlan4sKC+IyutqfR3M2zak7WYEBAlgilqH1cFzrdOp/ImN29N6VAMShm84RALnNWrj0wH
	5RY0w==
X-Received: by 2002:a05:620a:19a3:b0:8ee:42cc:4d9c with SMTP id af79cd13be357-90f8ac08735mr658592985a.39.1778693092335;
        Wed, 13 May 2026 10:24:52 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83bbf5sm13598685a.28.2026.05.13.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNDKE-00000003dZu-0jxL;
	Wed, 13 May 2026 14:24:50 -0300
Date: Wed, 13 May 2026 14:24:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260513172450.GR7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agSKQrSIhizCXKwx@google.com>

On Wed, May 13, 2026 at 02:27:14PM +0000, Mostafa Saleh wrote:

> > +		/*
> > +		 * if platform supports memory encryption,
> > +		 * restricted mem pool is decrypted by default
> > +		 */
> > +		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> > +			mem->unencrypted = true;
> > +			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> > +					     rmem->size >> PAGE_SHIFT);
> > +		} else {
> > +			mem->unencrypted = false;
> > +		}
>
> This breaks pKVM as it doesn’t set CC_ATTR_MEM_ENCRYPT, so all virtio
> traffic now fails.

How will pKVM signal what kind of memory the DMA needs then?

Does it use set_memory_decrypted()? How can it use
set_memory_decrypted() without offering CC_ATTR_MEM_ENCRYPT ?

> Also, by design, some drivers are clueless about bouncing, so

Oh? What does this mean? We take quite a dim view of drivers mis-using
the DMA API..

> I believe that the pool should have a way to control it’s property
> (encrypted or decrypted) and that takes priority over whatever
> attributes comes from allocation.

We should get here because dma_capable() fails, and then swiotlb needs
to return something that makes dma_capable() succeed. Yes, it should
return details about the thing it decided, but it shouldn't have been
pre-created with some idea how to make dma_capable() work.

If dma_capable() can fail, then swiotlb should know exactly what to do
to fix it.

If pkvm wants to use the hacky scheme where you force a swiotlb pool
configuration during arch init with force swiotlb that's a somewhat
different flow and, sure the forced pool should force do whatever it
is forced to.

But lets try to keep them seperated in the discussion..

> And that brings us to the same point whether it’s better to return
> the memory along with it’s state or we pass the requested state.
> I think for other cases it’s fine for the device/DMA-API to dictate
> the attrs, but not in restricted-dma case, the firmware just knows better.

The memory type must be returned back at some level so downstream
things can do the right transformation of the phys_addr_t.

One of the aspirational CC things that should work is a T=1 device
tries to DMA from a decrypted page, finds the address is above the dma
limit of the device, so it bounces it with SWIOTLB to an encrypted low
address page and then the DMA API internal flow switiches from working
with decrypted to encrypted phys_addr_t.

If we can make that work then maybe the flows are designed correctly.

Jason
