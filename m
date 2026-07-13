Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB832FA2C
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965381; cv=none; b=WAKupDcEFaSj2NGhZSuA8pD/klFphOjqorN6OZPKZbUN1iNeHT8wJmR/0LNPkAY3W4meswSEywhC2q0rIKLHkBZ8I1uLxc56nXBJIac4t5k9dx5L0U7oFOVcKDc6EO86gjBhCMt3wAeyAjvoVAdyDIhNdrlSiMCk018PcqDcHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965381; c=relaxed/simple;
	bh=HZlJhE5yEawTWMpR2br1LMTc0/ct1LglVKv1a4251Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQnHij0lYPrQkVlUVZrU/0ZTngXE+zys3LJrJ358MZfdVAt8bkr4iln9457LVtMu5Nhod/PktbFcq85Vuzf296oItHjlsAzbdKR2oHTKgaeaUIpxMLaLnG74UcRST6wF4YbZiC/Yxm6O8a+jndy4I7HLRWvZgQX8bj7B7/B93v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YpR3gwcW; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YpR3gwcW"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfb91795eso28148841cf.1
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965378; x=1784570178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/wrHcKHA68TkDcKIgsJLD5FCo0DNb4FA5MINQ+2Q20=;
        b=YpR3gwcWQezB27WCdQydDZQyxBU/HWb1TPYwRX0tlOjlHVzIiNPyGArUKd0DOpqqqS
         qQwDLJUg+12uSIG8lduD91EsGPqcx8PA+dGqxK5V/Q37Ng4HwdEKQ+7FANkuARo6/CIz
         CtPaP/fRGe4FLV0KwjrIP8DoTSfXPiRs8s3eWOugOo3QUinmFfk8p5UnM6zK59Fjpyff
         oW+Mq1NISoRIWcA64Ywc7myY99RbXkwVnjD4178dMxRSiS8j3gF63AKCxUruH6r6wPWm
         iOxmcMVhaUQ1fFSvIQ5UMzDW9QbYXgWEt3xuelg8n4me8fBkddQ9V1+Qm61wolbVsFzT
         hIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965378; x=1784570178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/wrHcKHA68TkDcKIgsJLD5FCo0DNb4FA5MINQ+2Q20=;
        b=tBOCYasjWd+cF+pkoyiVvK5TarrH08WZ/Q8+KuzdYTmLPM7zTylMzVaECFp1bc9hFk
         olly3xaBQF0okW6EO9uktKOZx9gQV2EkuyHtMim07ogNFG6BLEQgiRprEEbrVLJ5blV8
         Bj4R+Z4FdcBhLtfmYQaJEsyp+Zh8zrrZ34XMXvQ+KfkkuE2SI5Zc8u3AvPZTJyw7EnTr
         AtG89yPLj5HTZsnC1K3uy8WXWxRhjLkoAzo82AeFO18sPDhhhyere8BTSSY93lXgjxBc
         lXgCq+PmoTbpMLEJVf1CzmpIosHewU1ikl9FGfKK+clKkdzP6naKik06g8SvV3Igi+VN
         6w7A==
X-Forwarded-Encrypted: i=1; AHgh+Rpfq3ueQDC33nIh73yK4f+k++uS0BaxixpwErPJas43/dE+U3cJyjQcvB7Jp7y7OqL8Jqy4d/7HGHXH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+boD2oi4ni7ne/swIrK2DJQ+nlKbMHlC1kMIevK2PEaWodxjt
	Ra9BfAcM1hpGN860aFjL9c6hlntZ0oF5VWKbftdbFSD5o/V1wAeDjswtNYjmvqBZ16A=
X-Gm-Gg: AfdE7cnayMkUo0TF/LuGUljH9Xw8tauHJjNlBOrc3ZefPv1rWg/i0azFlngonTMxYHc
	nqEY6WmGyEGXypS1U/OghLxad+ty+71aYmzz3H1JsPpcng2r7LD/wLKZGkBoYiRkxl9M306pQbo
	9Qb9tvGwlwX1eEZqUEdB1LTARPvsKoOVWzV90hbn0ETXHWW75gunUmu4QdiEsDE2C9jgGUE0+9d
	SFPfvhHt4wQEXLvAxhM56GLY58/i4H2dBkZQIflSgfw0fHvcv9CQ5KxLP2VZDKRFGCVlMqBTpsc
	isXqdjYnUsQ3bBKmEcc1Rj2PJzdTv6XBnzOFG8ttxUEBfstOVK2yC7cZz7K+FDMeUTv+YatgteE
	faUHkt1xkWcbTNpE8N9HjgF24jOFrl/LtG2jCwbXQglMfYB8hr9xhYr2adNf4
X-Received: by 2002:ac8:584d:0:b0:51a:8945:3141 with SMTP id d75a77b69052e-51cbf1faa3dmr98217881cf.55.1783965378189;
        Mon, 13 Jul 2026 10:56:18 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm91065131cf.22.2026.07.13.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:56:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKt6-0000000Dx9V-2ddz;
	Mon, 13 Jul 2026 14:56:16 -0300
Date: Mon, 13 Jul 2026 14:56:16 -0300
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
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260713175616.GJ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-12-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> -static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
> +static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
>  			      gfp_t gfp)
>  {
>  	unsigned int order;
> @@ -114,14 +120,17 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (ret) {
> -		leak_pages = true;
> -		goto remove_mapping;
> +	if (dma_pool->cc_shared) {
> +		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> +					   1 << order);
> +		if (ret) {
> +			leak_pages = true;
> +			goto remove_mapping;
> +		}
>  	}
> -	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
> -				pool_size, NUMA_NO_NODE);
> +
> +	ret = gen_pool_add_virt(dma_pool->pool, (unsigned long)addr,
> +				page_to_phys(page), pool_size, NUMA_NO_NODE);
>  	if (ret)
>  		goto encrypt_mapping;
>  
> @@ -129,12 +138,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	return 0;
>  
>  encrypt_mapping:
> -	ret = set_memory_encrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (WARN_ON_ONCE(ret)) {
> -		/* Decrypt succeeded but encrypt failed, purposely leak */
> +	if (dma_pool->cc_shared &&
> +	    set_memory_encrypted((unsigned long)page_to_virt(page), 1 << order))
>  		leak_pages = true;
> -	}
> +

Was it intentional to remove the WARN_ON and comment ?

Jason
