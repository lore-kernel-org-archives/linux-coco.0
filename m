Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E69367B81
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700392; cv=none; b=qYb6PNHGZ05FTbzxEjkK/eVw8uNeK9dzMpgHitWlWSS1cMTe6d/KKNVIsgckIDHVOTnMRMAIfz8J+lVxfUhy92syO2hSHuf8dRsq0sldaNX+jgzxy2WdI0ww/Il2cVP6fvSsgigrLOlRIk+PEdneULQS7ZlpObOOfsRGVcTTLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700392; c=relaxed/simple;
	bh=ZcNef127/m6SyCOm4THElfckuZegJcazDJQV119TKbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h396Ur5rEQzkOJ5bG1OvifxXoJ2M6mBSiry4HkS1sXLfMAj1UkGVotrZ6IO0hwWxlGFpY7wTxR+7iyxCi+71OKVbO1usnYdCUchd7q7bAYoZ7G2W6GUkggNcEJhofXxfbT/sFUHUg2FqRao9DhO/cGIzMN4jEMFXTS7nLXUkmcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=moMI3tqd; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="moMI3tqd"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efbafa1bacso7701266d6.1
        for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783700388; x=1784305188; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wu7pGf03sdcW+GKZ7Iww7/tPEwPDkL98YpGrOpuCsUc=;
        b=moMI3tqdZfdin9SAkVjP5M2A8NaC/2t6HiY4gxyTX/Rp3CMfxeDcKCeVKsJBo26JNj
         xNawpUfn/sKJVdo6wzSnC2fw7tEpajstjW8QSZK2mVXkIhGgEzx8wdVZFRWXkKuoN6mH
         8Gha77bciaKkPG4UpaUpY3kJ416eFH3tmcjEJgu28wGy58Z2pK2oZt6I0+8o8cFCVX7v
         GhxjaE2RXWKpj1Rt2of842QFJrKV95Ylbeqk1nBJEPI+YNMA9PlXjXeIptCc5DL/VA4S
         WZ9CVfL2asOtkP5bppe9wB5aX3OA79cLI5gFK8DtKqPQW2HW+ltbF258lV1voZphfl2b
         ckhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700388; x=1784305188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wu7pGf03sdcW+GKZ7Iww7/tPEwPDkL98YpGrOpuCsUc=;
        b=arh9CWYdu8/PPA5DwSpLXnkifBOLdPhYe4RMqltMqgD1Hf5+jtM9l5P9oXqr6E+qZ8
         9unBHjzU6UxK6vjR8C2ShTqAni5LNyIOPYaIYXOEpXgPgrOyPbM98oTi5qc8ufWJMzCJ
         22+zTTaD6ykpv5BdDAHKJSBJHviVOuuHAeTHQAmMAkXFOaAhdF4zorJyRmPc2HbTDYaR
         AoE3yl2OWz5GQ0LCCy0+GZsT1GVf4UwyKBBA8GhVrCj1iyDLe/2RWkm1QvxVe5xkHZvM
         5Wsu23fqpeY8iQTryvYFumFsmWExNfOMHzwkCLFQiWdtEHx6GvJNjOi581Z4pHaMgayD
         NVRA==
X-Forwarded-Encrypted: i=1; AHgh+RoPVhMEDbVKGuF0HSLSlyO4HzP7uEF5MkUKd/IsCw3qvpOCNukgcg+R1Bh8j+KlvyMaHLTPst2YvzCo@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg1aB3DPPi4XZuB0Of4qSR221j2YhtSxT3yxECczuF8E4N2tOk
	AJ4OgXu3RUdrujZSE0ruy3pOFXIrvhvamSlBhhI/bx4np8kNCZwQoYYODjiOdwMITvA=
X-Gm-Gg: AfdE7ckKIo7m/wLaTcVI0fLD436CZtrZ1znSxn4VlhOKeOmx2u68tpfS+hvU2q76jvc
	9yahlY7RVAUcE4xQtsxgg6FnJYks+klQ/jRCpB7z0T+lUTJE1jMHRbLqaWI0gzhfLwV6kha6Naq
	+41g4qv/hdmvoItBK0ObmMIM7KsA+saGWzmpLWkV05eljqqtb54vAyuU0Y8fassmcvskPtXQQos
	urLmWKwCx5+M5yl5OrtkRbcIcVk/1lYug7+LXe2LHGgISPxTWspHSuQ4B0ZVCN07p/0mcbUGYZZ
	3PIfb+tXcHiXFLHrzIIR5fkcNbfHmFn2Fw8GAToXOlaJb6rELx5nCduCX/+P6r5NdT1ZEbda8Wo
	JqHX8QgRQl17uzmRlOe4FnpvT/uzS/+WCJqmla42D4iZcJqsO4ZPkgekZlUp+
X-Received: by 2002:ad4:5743:0:b0:8f4:870f:72bc with SMTP id 6a1803df08f44-8fec3cf5d44mr142091486d6.51.1783700387612;
        Fri, 10 Jul 2026 09:19:47 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56bf455sm44263206d6.13.2026.07.10.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:19:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiDx3-00000007We8-41pt;
	Fri, 10 Jul 2026 13:19:45 -0300
Date: Fri, 10 Jul 2026 13:19:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260710161945.GO118978@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
 <20260709181336.GM118978@ziepe.ca>
 <yq5ajyr3h106.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyr3h106.fsf@kernel.org>

On Fri, Jul 10, 2026 at 10:52:49AM +0530, Aneesh Kumar K.V wrote:
> >> > 	/*
> >> > 	 * For host memory encryption and device requiring unencrypted DMA,
> >> > 	 * MMIO memory is treated as shared by default.
> >> > 	 */
> >> > 	if (attrs & DMA_ATTR_MMIO) {
> >> > 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
> >> > 			attrs |= DMA_ATTR_CC_SHARED;
> >> > 	}
> >> 
> >> Yes, I think it does the trick, preserves the current semantics for AMD.
> >> I guess you could use a single 'if' for all checks (up to you).
> >
> > Please don't change it, MMIO P2P is broken on CC systems today and it
> > should stay broken. Passing DMA_ATTR_MMIO with DMA_ATTR_CC_SHARED is
> > an error that we need to correct in the drivers not make work in the
> > core code.
> >
> 
> But the above changes are intended to handle HOST_MEM_ENCRYPT. In v7, we
> had the following diff:

To follow how the rest of the decrypted/encrypted stuff works the MMIO
has to be flaged with CC_SHARED for HOST_MEM_ENCRYPT too, just like
the PTEs.

> @@ -88,37 +88,40 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  {
>  	dma_addr_t dma_addr;
>  
> +	/*
> +	 * For a device requiring unencrypted DMA, MMIO memory is treated
> +	 * as shared by default.
> +	 */
> +	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> +		attrs |= DMA_ATTR_CC_SHARED;

force_dma_unencrypted() says nothing about the properties of the
address passed in, this was nonsense :\

> As we discussed [1], that can come in a later patch. In the meantime, adding
> the HOST_MEM_ENCRYPT check preserves the previous behavior for SME.

It never worked. When we added ATTR_MMIO it started to have a chance
to work but prior to that it was always broken anyhow. I don't see
there is much merit in preserving the narrow window when we
inadvertantly had a half working ATTR_MMIO.

But if you really want to it should be
cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) *only* and get rid of the wrong
force_dma_unencrypted().

But IMHO, I'd rather this series treat ATTR_MMIO as private MMIO and
ATTR_MMIO|CC_SHARED as shared MMIO and that's the right and correct
thing for the DMA API.

Jason
