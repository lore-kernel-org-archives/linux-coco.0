Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0D34040E
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207084; cv=none; b=Glxk3yWJKhTwIo11q57Nkz0/JUE0I1PIUH5KC6wkSeaZAwxtI5zYqd1feBwFQFz2UQEs7HAoW4P20/0JTQyfpgM1d9SEAjGEtY3fAftcw1gcK4tzdytES6rlXqYwhA4Jiyyde6uVLCY3fN3MLAPex8+74BH0GVLlAM2b2B2IW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207084; c=relaxed/simple;
	bh=Hz7s4YAFSInfsBqTFwj3w4O7Cn5r1Vqd8t9F59UC66Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqNbI7rSHHgw7g415Sb0nX3p1X7aWnPcrC0EkZqyP/OQ4d/7LFc53EyE6iXa0xqxphWGkWgpzmCkFpL2abD5zEIcZXj3QcFaeaDGL4nmRpYfHbY6Y/4WRM3+0SbYLG07AnJw8WcuL//jMokjFO4yWOgMewUTUkMB8tZdtyepoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Db1m3CKY; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Db1m3CKY"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso3971545d50.1
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779207082; x=1779811882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UcSuL4+fBcC8SeCa+tlTSs00pii8MZZ+rCZs+NXP3JM=;
        b=Db1m3CKYbkEs5UGFqOoboRI0EQSnv4eNQ2FHsknbjXYjFUBVBgQYm3nA6tj1YJsp4U
         thFVpj6Ix2lJ25Hezs2fyoKaFVDZ0IbLTWGpnjtie/iquspXdecBkP3ogImL+WO9nTht
         36cKqA32YrJ4jTWekbf1a/1ISsL2XHUCG7QS1H569p3sjpBS58zuAwPv6nk2/I0/mdbE
         6U86TZhUrDwwoEJKB6/KnpuIZ1pWz3bsh/tc6i9SVprT0oqP5HkyH8oW5VrO7PEpyLY3
         pCF4KHTf+b/bsVx5c9sVcFqjf2H3EZznKUI5SxByfqrGWSF25JvZJFI8pZ2/kdYNjiN3
         KBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207082; x=1779811882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcSuL4+fBcC8SeCa+tlTSs00pii8MZZ+rCZs+NXP3JM=;
        b=MGVTK322e3OzBWtL8/zDBkYg9LYqUQKoqbcnNOOAMcSBBveuTpPfYzueJ40ARx1h8S
         yIuobqCbr7NvkXuKGgySH/+DefpVXuNzYHKJFWsScS+bqZJhbIOKJy6ltP9FkciZJ4v+
         CIJqEpYpHW6c3bVDVq1grdA2557/DaxypSvPynd8oMwWD5taQGJ9TwVjm9jtMwRPMc1f
         O+Ymr3aROAd3EyGN78dc2OvHtnCD2SsUt0R9F1hGQURtLb/KNFoFO9ZFUf0eDIa3Or9x
         KAotsfVox1wDr0LUdF8gx7AXh/z/hOuexPe53JfXIuIsZqHRqN8KPlhozaB50YPpZ9XN
         IXGw==
X-Forwarded-Encrypted: i=1; AFNElJ9SGbGp26eMCYy13Qljt5uZPyscqDub5cxmP+IAoe07JpyVicv7f8fjr4X3DgZ0Hur7bPopIrP5+9TW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxepl6mHI6WzQf1NizC93lEzEgyeIlizP5yIXb/ObJlE9Os3w7N
	NkxnqBFV42+OOV5A+iur17imaGEDd8KKn/0ph3B9EdXD90QBdWlTJ9WkbAJuxdMFqiLdfHF9geh
	4WxKh
X-Gm-Gg: Acq92OGxJ4vMYs9XhPebckXlLRIaMNghUaM4UppWxpJwtl3KQGunzvrqV4DqpULo1T1
	9IydTddkUewYivCVCKJJ8KpxGW80WMw88xfD3M2XZlM1cyHSE8iW1Dy2wiWXA9t4J8VGT1Fmp7t
	aFQAlMM+MYs9GRBfD9RGDFwdWXazFLdfEbafdNyEecTtBKYYgr5iNzkHROA08b398jHWRdsGfVt
	hbp6YntUm3mNeQ17JC5gETVP6RnN3lRFarH1xCVMvaTk+Eij5Pyf+7aZLTn+n5n6NIsOD1XfIDj
	MxpmRVn7/nJHlUGVFr+1obuOWU5eneY6+UJnaO2kfUVPuWTcVICG5iYXWWMp2GqBJkhRvYkkXBa
	plRsfmpErIDm5eFVHyErghdrPeuh8oU6DzE4KVL/yNOVpsJQYVFMG81F/95D9Hml6lbBx7SbO6O
	IS3IdrnbkkYFsbz4Nen+LrvEoIf91ku7Qi0YhVMZ7tuNmC+t1W7Rz+Hd3/kVNiRTpilT0/7uter
	lFiYQ==
X-Received: by 2002:a05:690e:148b:b0:65e:18a4:3021 with SMTP id 956f58d0204a3-65e22839e72mr21408719d50.52.1779207081601;
        Tue, 19 May 2026 09:11:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36086a61sm95500586d6.4.2026.05.19.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:11:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPN2O-0000000FGo6-1YPM;
	Tue, 19 May 2026 13:11:20 -0300
Date: Tue, 19 May 2026 13:11:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20260519161120.GO7702@ziepe.ca>
References: <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
 <20260519152741.GM7702@ziepe.ca>
 <yq5a8q9fs7ud.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q9fs7ud.fsf@kernel.org>

On Tue, May 19, 2026 at 09:35:30PM +0530, Aneesh Kumar K.V wrote:
> Yes, that also resulted in simpler and cleaner code.
> 
> swiotlb_tbl_map_single
> 	/*
> 	 * If the physical address is encrypted but the device requires
> 	 * decrypted DMA, use a decrypted io_tlb_mem and update the
> 	 * attributes so the caller knows that a decrypted io_tlb_mem
> 	 * was used.
> 	 */
> 	if (!(*attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> 		*attrs |= DMA_ATTR_CC_SHARED;
> 
> 	if (mem->unencrypted != !!(*attrs & DMA_ATTR_CC_SHARED))
> 		return (phys_addr_t)DMA_MAPPING_ERROR;

Yeah, exactly that is so much clearer now that the mem->unecrypted is
tied directly.

That logic is reversed though, the incoming ATTR_CC doesn't matter for
swiotlb, that is just the source of the memcpy.

/* swiotlb pool is incorrect for this device */
if (mem->unencrypted != force_dma_unencrypted(dev))
    return (phys_addr_t)DMA_MAPPING_ERROR;

/* Force attrs to match the kind of memory in the pool */
if (mem->unencrypted)
     *attrs |= DMA_ATTR_CC_SHARED;
else
     *attrs &= ~DMA_ATTR_CC_SHARED;


Attrs should be forced to whatever memory swiotlb selected.

Jason
