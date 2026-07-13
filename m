Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F134CFCF
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965437; cv=none; b=RlZL33lOXv0dL7a6RZuWU/9xjyobSGRryZ05YoPfHbmmGe+PpfCJl9vhnHBVHg4cZku6c0Us5TQLVWkp6E13+t55SQsLqh+vTuHlTb9qMl+G3TLhtuZoxulnBL7E8syAqGgZMXthJHQ/mAnDLRjLR3NwH2T2OYd8XK6PDR0WLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965437; c=relaxed/simple;
	bh=/p42+HpNsjMWY1GT2uoeKq2/f492YfHBxuTyaBrOVBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anl4wqmmAfp0rRNI67xNYprbz3WBNhmD5PGXLcELnled5ip07/6jiFGmfSEof43NuED+Ih3Zm45Vatqe7kFE7c3kanhVFew4k/zM9YmMFEWWpWI1cwMtMM16667gggZMxFhEkhK1ajJvSQMMFiL4SagpeGJp0eKBq480wwCuuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=I+Cuhhju; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="I+Cuhhju"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-902f92b8504so26291266d6.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965435; x=1784570235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YGHI47Uk7ivYjDw6pJp4pRueuEDSB7hHUc7Dm7encu0=;
        b=I+CuhhjuSut3ClHSlGiigjumBzWgdtf46YboWyMwZYEFaBkYhfLLKEmsub6rwrYDUg
         +NIsRGod6ULM3cqjeLhvTfHB2HJDF/EZNnoLOuEDaqU+ia+tonQoOQlmtxGpEGQoARsR
         Sfh5NZ3P0gjvKP3Lu8vnyJpkTV4hoUkRyERtLZq1OdOH8XQ22nPBHvMZwR4SnhmLc2QT
         SjgDEQb4FsGHZ5FMrhXbRIrO9lrK+PrHxnzRucJj2upZpFH7FVwqmo25TAbCap5lyu5R
         izyhgDyaXjUFkmaT+PBHYuieW2TeCn84GW4xgLoH50Lp6lI/snvl1A0ynX4890wOinDf
         S18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965435; x=1784570235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGHI47Uk7ivYjDw6pJp4pRueuEDSB7hHUc7Dm7encu0=;
        b=fxuqZSNtTrGdnw2KkGpr0k+kqluKRbB9zhachJVs4b6y88WaqLI9MgKwGdXlJP6KpH
         JmYIKd79YljlYo1hMy66NZT5m0eHO7VkrzmpWXyKtiO5cTBW4o9itHJvaIvT8ycNjuEG
         wma7mkScOq75znOXBFHHReD7RU1QB/CnJzxxQ7S1XHUm3Inz1RL2MESKS2evSgZpLFWR
         FqIAKJ4z+BI7kujT0AWLoJ4ri0c8wBPe2kKJ7l7n7m+ZhgxAqQVaYn8bRDqfRMw0qbnX
         SzKSqcHDEu7b2Ddv0cUoWMqPIx8dRRxsigCO9zwieKAUEuRTl3Xfyv4bCAzHsmxRGecO
         pj8g==
X-Forwarded-Encrypted: i=1; AHgh+RoUKatyMunnJK7Me4NRvo9JtDSIa7Odb3tDEqSGG14jxJrVbBCkwXbdbpjFhIIR65VPMtYwFBb8vZpz@lists.linux.dev
X-Gm-Message-State: AOJu0YwFGf77+LPMzgQeNvbc9msrPtasPh603kmVxUPaj/iGJlCtDGBc
	X71uT6rz9gufQqtYAO8ZTJ6wBiMkQuad/NuC/BBSgwgtqQmuAYhxwkhUqSIuny69dcs=
X-Gm-Gg: AfdE7cl068ZWdZh17XVw7pnP54z18GGOTmn0mDrtq70wSBlZR73mgXigrqZk4FDnGOR
	nMWjwh/JjNBm4b4jwVnVAqrRV7hAoItnbXGcyoSnY1/XRG4wXZcrfIjgMTiW6sH+qC4mS5YjwL2
	lX8lcORE8mcHiy6gLZQHfNycxIHCeLfl1QYblCLepT0hDjYZFMeCmQjs/OloxRslok3zgmEd8IS
	UdInuCS0zFSR7i5gJbW8xVdTxH07FQ5rbZ7vjmgi4B4WRmD6H1XJVDywI/qLmPU+A+FCxb38Ckm
	xzsalpYFiduzafUVhspZkqZS1n5zPuhcJJ0M7A36Ell5HM17J0SXA+GS5TbfoPThKwgwFe0xhfR
	KsUT9Rd0XzFuzIk0EOQ6wVUYDjPc8x+5GzzUF1UPyWaQ/iagKeu8W6wgS85vG
X-Received: by 2002:a05:6214:5012:b0:8ff:60cd:8174 with SMTP id 6a1803df08f44-904053d8c92mr120238636d6.60.1783965434905;
        Mon, 13 Jul 2026 10:57:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e082csm149305496d6.5.2026.07.13.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:57:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKu1-0000000DxAz-2t49;
	Mon, 13 Jul 2026 14:57:13 -0300
Date: Mon, 13 Jul 2026 14:57:13 -0300
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
Subject: Re: [PATCH v7 03/22] iommu/dma: Check atomic pool allocation result
 directly
Message-ID: <20260713175713.GK3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-4-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-4-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The non-blocking, non-coherent allocation path uses dma_alloc_from_pool(),
> which returns the allocated page and fills cpu_addr only on success.
> 
> Do not rely on cpu_addr to detect allocation failure in this path. Check
> the returned page directly before using it for the IOMMU mapping.
> 
> Fixes: 9420139f516d ("dma-pool: fix coherent pool allocations for IOMMU mappings")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
