Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50C145B11
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970523; cv=none; b=LA0OpWNeCttazIoRDRDh0+CGBwkKa4iNT1igV3KnbwHf4l2MnlQDap1E+DiSDP5frrGzeriZadf+G/4Kew4ilVvNWNShf8fvDlMZgM2Q+3V+/S30mYathaeg/vFhK1Mgp/MtA6IG8K62rW0U+xaoalU44GHWlHyogLvYS5eANOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970523; c=relaxed/simple;
	bh=2S23cLlbDaDZPWx0WS3KxZy0gp3jtCk2pWDFCTO6yTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbFMV1IomrR5CZEvx0TaySbSHZkW7OnumlspLEJOofbhtrtek4o108JNIXD53k1fIEjwGBQAF279uYTLac9bvceDw4KXL6zWZAKhSbH6RdPqQVrLLNJcqYDY/ZFV2ZmAiKNW2dFyRiVFo3ajXKQw4Fb5omoOeNibP8PKupqmIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VOJFOU7a; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VOJFOU7a"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-920f33347f5so225974685a.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970519; x=1784575319; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kt1NNWVp5vzCd+THxZiV4tdGJLfhiT0ZXPz0TueqWMw=;
        b=VOJFOU7aLZ6tDRUeOALotmNj4PbOc9hbulAL96iFnuoIRntsmbEE8Rd30N2dpZJRTr
         +zDgY/DTmuWpTpF9PIy+SCTauBK0d6C69uc/N3M3bsvqDu8dDoF5A9qnwpwuobGdBiTi
         +LyOZ7fuq4QSf5U6dJ7cQNxpLbRGAVOYayaQmbq+iFY/XBoziVjOXKtc8Wh+HCClAlUf
         2woHRIAyB9jXk7keHOKIC5LPdQssY1reR0+y5KWWE4Yns5io42PhPoh23iGwgh/kAuzy
         +qWESQh9Wm2RCSi9mocEBgroD4oKOEp9rwF+s54PLBSo30nD7Sw+LSluNA5F6xBMlqkt
         NQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970519; x=1784575319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kt1NNWVp5vzCd+THxZiV4tdGJLfhiT0ZXPz0TueqWMw=;
        b=niNdJJy16mmoUiVgSjK4xO6qZtTsQYsdRfLwppKZDrHazvMF09GEjAMU3zEyCn+1jr
         xxflkSBCKyZVUb3ofY+umfWiKYBcWTruQo1b4ft2FXAZnLW7zuHIrEnWB75L0DA3Q5h6
         MbhyCzD/bw2ptok/gu/NctvtMbGSUODfcEwqtl6nQVB9NQgoIAZPvFWZMyQeqYZ95W2i
         /+0CfApdOZ6LUpft4XySXFjzlF6Z6jqhJC1IKDr5d4LNyy0YGMWV+cGk//Txxa6nVDgi
         IZbPMwkAa4XUa0t0tJVa+CjIbqiHrPDLsnqmVTYSmTl0TFagUdxNpg4wcVGcCpjwegEA
         D6xg==
X-Forwarded-Encrypted: i=1; AHgh+RpyXZJ0dvLGgRDHm8AXTSdx4dyXU+TlmTJhB7DLGCSL/NwFaMh8CYxdkKPNk4slyfRO1BRz3Jf6Hz7/@lists.linux.dev
X-Gm-Message-State: AOJu0Yygysx4LfzInflDwgxzXYlFu/SmXARnB4sg64qo4riwDTaUZPno
	c1Udt83hehvwqayF1ZukV+2XuK4Ljl77er29Upt46fdOxVgni8egVav2oRpw06WomBc=
X-Gm-Gg: AfdE7cmqaN7QrMf6Bb4q79ebsepGpn2E8Tlkq+Z/o+FAiazyMA5f/jN3uZSs9W+/Gd4
	H/Z+sKPROJjnGKqC9lFG880rtIWsMBVxgXzgGN7E1CK8iDY6NBpiEcs6v5PqlFC+UZDTsYM7F+N
	lQAZwfHC0LC6e4aaRMrzhH4uB6L6GShR8MvwDPUFi6H8gRsJmeTqhlS2lXcCzKmGXpGsS+aD2/m
	RE6abkcJUSYSc1JfBUFtiWyHIj59r5UkaVH+BXO+sBs7M2hpRwmHZ9FA5dtVwOQxAVux0MYA269
	IAgEECTxq9Rn2BAyeQqqLI25/4Aee99jOL+q7pueF+a1GoGPcCnBj6jvbkUEpktEBERK7DxoWJB
	OCMxl1unYrxTr4O7PVdT37Ub4GY8kArQabny1GcJp8nhWb/c4XOVOom6rwcYSUODSA1j3vA0=
X-Received: by 2002:a05:620a:44cf:b0:92b:6805:eae0 with SMTP id af79cd13be357-92ef2c0c787mr987778485a.61.1783970519182;
        Mon, 13 Jul 2026 12:21:59 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf7ab2sm1122922585a.30.2026.07.13.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:21:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjME1-0000000E53O-3cBb;
	Mon, 13 Jul 2026 16:21:57 -0300
Date: Mon, 13 Jul 2026 16:21:57 -0300
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
Subject: Re: [PATCH v7 10/22] dma-direct: use __DMA_ATTR_ALLOC_CC_SHARED in
 alloc/free paths
Message-ID: <20260713192157.GQ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-11-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-11-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:14AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Propagate force_dma_unencrypted() into __DMA_ATTR_ALLOC_CC_SHARED in the
> dma-direct allocation path and use the attribute to drive the related
> decisions.
> 
> This updates dma_direct_alloc(), dma_direct_free(), and
> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c  | 42 +++++++++++++++++++++++++++++++++---------
>  kernel/dma/mapping.c |  9 +++++++++
>  2 files changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 0cbf2b0835c4..98e47e0b332d 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -192,16 +192,22 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> -	bool mark_mem_decrypt = true;
> +	bool mark_mem_decrypt = false;
>  	struct page *page;
>  	void *ret;
>  
> +	if (force_dma_unencrypted(dev))
> +		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;

After going through what was left of force_dma_unencrypted() once the
series was fully applied you might consider something like

  dma_update_attrs(dev, &attrs);

To remove the frequently duplicated code

It is fine like this too

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
