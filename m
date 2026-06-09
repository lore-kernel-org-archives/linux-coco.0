Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3C33E377
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014555; cv=none; b=nxarnxuvmLbHe58zJfUROme7i4fTyxAbnKOwNx7goS2QNZ+FhAiBsfg3SttbVcE0ZIzJhABD38wP6+X4aklshfJIWd5+EifcQPOkhOcqBa5i3D0W6yXE4eNp0GOTZDJkRjvPGu/zvryRZuCmm3DFjMtdMUcF/cEQtSDYhMO/6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014555; c=relaxed/simple;
	bh=MmkUJTtuyXY3s/7sXM+BP/PzWFzsXVq+eKe6PElRRWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6F8EFIFd6MQyZWPx4Rb8wQK+xtsLhdG5um9qm3SOPmjOOTI8y8M5NJWlj19EfD6enl6T97W/6AmkevX0qdVGP9o1b4noXKWXoEij/2w7MnS5M1SXt/YtjGEYTX2xjY9omaZakrpb+2a9iGbLN/qrZGMdHTY0V2i4XPjhOCzUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=j9qpMZS8; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="j9qpMZS8"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9df31130so87736096d6.1
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781014552; x=1781619352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t/KVtkqwokTt2oNchcdf4xUUArUEApR4RsM4t4GGaI=;
        b=j9qpMZS8j/KCuGa3lelRnlmMEBJo5fsh5hMKticrERKZXPbieJnEvENgkoGBtiL40W
         FzkH0JhJlBNlVPBSwiCjSGZb+N4dkRVp8x5DgGquSUDfW69wu84lUS2UUTKB7Yiv1bE6
         cD64I+TPYxXWqkLclmlobVs+BoMvVwhexACxTYMxDB2u6oS2QCeJ01IYOYiuf2u5jEMO
         zi/u52bmk5musR+dm01wvlCqtSO6fj+QNzyw4i9cdzoWEZpwaFjKBJitwdo5B0jqqNP3
         THo4Ms3grAcFdOPE0VgvI/30c1i0Z+9Y9EtsELI0P3+hdAykADieYypuhK0Agn70MCAF
         HNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014552; x=1781619352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t/KVtkqwokTt2oNchcdf4xUUArUEApR4RsM4t4GGaI=;
        b=BTPY3rhGxXp4FAfRQNpXlnauZcHNBC5hAGvcNd+smpBA+EJM7yI48bvSE60kujarQW
         0Pa5ZJ+b5koYor7w6krwoGE3i1Pua/e8cV9rsp8g/ObbTwqZ20d1nlOzPpHlC6ibFP9d
         sc2iCBDBqgjZfLmPIPiS9vHuoJh6hqnySs5yhFOyCJHD0MFRKg1LtsWgUnhQcbpF8t9w
         zfKf22obGQocuNiXpZROFSpl+lzzyy4xE9pEldhfKzxuVc6dh17mvXhSuCWqS9r6jqoJ
         pCfKjfBdM+LIRO5sogxKPrpmC7wGaozEMbDE+Kab9zSPeewV1JRtT3Et4mft2PMeGKAp
         4iCA==
X-Forwarded-Encrypted: i=1; AFNElJ+IPrUh0oBPlgGn1er68C/ioIlVB64nszSGVhHBKYoKIgwF1P/h+XKaxNljy6fAeIe9ExEUxzEqvwY2@lists.linux.dev
X-Gm-Message-State: AOJu0YwKU3VtQH2/boiA8w0HDnY7UGlyLtaYKmKiD+2jT0ndhYlCFo8x
	zqTBdxjglCMXUcs9TiTPNsN1wZHNYhJiuy/PNyEdWuFUFCdW/SWYvFWSr5XH6Cs621k=
X-Gm-Gg: Acq92OFWXSUU73rZTVuUSDBiOVkmW8n1c3b9NtIQ5vdeRtMVUOGoiwcACKVU2rGm+vp
	9kIQHMrcJkKnf/hiYehNpU4PCDwzGCpwQDH18WT7OpVin79FfD2Ox9Q8H1xzVvGJvqKaWrneZAV
	xVb/ab8VAFn0ImHoo2m6HsjnscIRbfdX7r6qKhQOxPZPv30DL9jR+qtLfx1hAOL7s/wSdg/Q5b8
	YTMEHPSBAvieVWafvt2HAMkZA2fOEubhzEHgxY5nMjELiW/m8Tl10DL+4nTjCW9F+19i50P9jgA
	79HyeB2k2sk6umqoXp6rpxCJ9WRmpxzqfNtOvnAzcoZkNJtPVB3lVO4Woo+/UuFw7eZ0sOYQ3g5
	qGLJS0pCrqB7eSqdYGGEBRyXKUDGG3Y8pLjXX6b7jGxCgD4bFgfBov7gQlznPZ7OZpFgRtgbKpn
	qPWaFZuWn8jM0OXJ+ND+jxUE+3reJCMKEFeFKjxlSuZ80vV/ezHnun3J2gsFUaqWxRecF8NGkzF
	1UwjK2vtykqOPQd
X-Received: by 2002:a05:6214:626:b0:8ce:ba04:7bc2 with SMTP id 6a1803df08f44-8cee626f0eamr293032506d6.38.1781014535341;
        Tue, 09 Jun 2026 07:15:35 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm204702746d6.40.2026.06.09.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wWxEs-000000021xL-0mOX;
	Tue, 09 Jun 2026 11:15:34 -0300
Date: Tue, 9 Jun 2026 11:15:34 -0300
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 14/20] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <20260609141534.GJ2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-15-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083959.1265923-15-aneesh.kumar@kernel.org>

On Thu, Jun 04, 2026 at 02:09:53PM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -270,9 +270,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size,
> +					dma_handle, &cpu_addr,
> +					gfp, attrs);
> +		return page ? cpu_addr : NULL;
> +	}

You should probably put this at the start of the series so it can be
backported

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

To Petr's question I think this just shows nobody is really stressing
the PCI dma paths on CC VMs today.

	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);

For instance the places even calling dma_alloc_pages() don't look like
things people would use in a CC VM.

Jason
