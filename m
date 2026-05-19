Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91B348C70
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197957; cv=none; b=lohvOKSRQ40D7S0Zmn0XsGYK/Zoqj8BUPICRtV2LV0pgI9AZtqWjgr5kMBv9NWIlffEZst4/LnjkAV+QpAXseuvsNPhGRki3RvGOfm2l0cXOg1orC5PTSx1PFEWV2Jr1XQ+Ff52BR4NLVyVLrCtVSwaQJ6qWh5RQsz8FK87ubFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197957; c=relaxed/simple;
	bh=pRQYtCnb87pUz8VrW1rjYy01bwyg5a1R8WEHmalGJNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn2Gxl7e0SLLtIkrJnKsZ+h36oWsd3XZWoXmKkWp/PuLf7AaKFWyFQ3hUeCie/jE5Gjw4EW0+UsgQclGIC00+i0M3/MByVtjHSR/9BRHUYPQ1O5IGZvfPuOwT9AHkmYYvFuPCnX9ldCSiuuNjUKpOmF3B267+SrqJ8/1IjZ5ePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=a0rlJe5K; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="a0rlJe5K"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5165195c8b0so43177841cf.0
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779197955; x=1779802755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2jBYQyB5cOJsBc04yDDPLVV700aJQU8UB+xEqw7DWQ=;
        b=a0rlJe5KxmeP2RSwbm0TqChNKSCfa2/LLVBns4A7fRRGpcQIjTU3XayEF3vunj68RJ
         tQusSr7yOcIYUWZltQ+yyeHXZ8Ea5F17lTkJvER+xUR24FVM/lmdkqi9OrklPoDISiDS
         kLOZQTtLazpwhP1SsnRNMT/RWFfrs2zCryUf0zvmIyBTq2oKSOw1Y8rhklkfJne6z7JC
         5dYf7zo5CpA3KvS21XkHNM0uilXG/SRatzGNoJ4mjcgeyDB5w5X+4IdkWpdXsgZ63xUH
         iUeViRNj77QtJ8yzX1DktIABoTdh+YADCsvFZeKB/Lj7hMnq/jphkeXTLpdO7xlYY6d1
         vu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197955; x=1779802755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2jBYQyB5cOJsBc04yDDPLVV700aJQU8UB+xEqw7DWQ=;
        b=NjHiG2x8HxKfbBH+qboIeXYLa+ph9D/00U4N645KgeZYkZGY4DXc8JQolJSbc7PXdL
         Po66wAVeylWSms3LE18CQNOU7VJuZISWM4CNYdvx2YVUXSLRiFOubUYo/2JrR9FGwc86
         meiqbP+fRAbwKpS/aw167WbKnJnzktsY4GTUcA/TthDD5Cn8vsbhGtnUIHiczvI5P+1S
         6AVIhhG/Bc3ynkszB0O4a0UOtOrwfgaaFZZCV/ins6Gcczr2H2aFNDb8IF6DsEyOZgsR
         G7c8cTxtAB+NGh3TxQjx+I8WiRK3DKvPaP17fni+3QSh03j70TdKGBhFx1ulTw+kYYFj
         13RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xLtITLpF4KeiEhFA7XH4hwAbW5ZZ7SgWcrDjuc0kSdA7zWJgPCaoVUXknqdJxLYoxyYs1LLMoxxBb@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbo5AJ1u6XmS8v7Cd9dl/IejQTtUDbMVCJTXxR9v3X7L54RkQF
	hac7IySCMsyu36tGa8+CroXgyUu8BdKCu91aVxSYlU6j/KrjdzSlGr9NiRb2U4PzxdY=
X-Gm-Gg: Acq92OH1NFl/O8aznTmUydQdfx/6XZ6vVK1/Wa/aobeDYnTAAV6JhpmJBQjHN6tnIIP
	4N5eT4TCYBtisNKKSZQAyPXRFuiw95RL3fETiZF6eGiLhsF9mOAF199lUhKP3TPsgFeOlaWPsw7
	19at5+Fh9/X/U0N2v25qpyWIhO+1HkpIEej2qPiD0N9uaqdLwoDi0rlQQY3wzgKRbt7cu+wy841
	qyTFYG3CRgXUYC45LbRlb2tYbn79UP94o5YAg95jsbgVgqknORaDr0kt6CWh8EX1LE0VWx7RcXG
	jXScnDBj1WU5ikCRJf7dxA0ZOEADONA80PNPMoqbzlG55eFbdPDNb1Nn7e1Gu8GglGGPNCs26Ie
	XbCIjcELmes6y0kIvhwALGFsLGRD8Dn3QfFvuTXOiGUhGZ/RtH2y/zp4JfLgOAjEnlfbLOUlAnP
	VILhIkmPXkmFMdgl9B9/lX7C7aJM2AQWh9bkLijC5M+1NGjPvBXzTjYP/4paybEF5k1o236V/a0
	txAjQ==
X-Received: by 2002:a05:622a:50f:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-5165a03ee67mr270655651cf.17.1779197954757;
        Tue, 19 May 2026 06:39:14 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm152289551cf.15.2026.05.19.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:39:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPKfB-0000000Evg5-382Z;
	Tue, 19 May 2026 10:39:13 -0300
Date: Tue, 19 May 2026 10:39:13 -0300
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
Message-ID: <20260519133913.GB7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
 <agW2lzJI-20DyJVe@google.com>
 <20260514123529.GZ7702@ziepe.ca>
 <agXfm3mS_M3fvRrN@google.com>
 <20260515225113.GN7702@ziepe.ca>
 <agxETC1rXBUSkWYg@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxETC1rXBUSkWYg@google.com>

On Tue, May 19, 2026 at 11:06:52AM +0000, Mostafa Saleh wrote:

> > > One other interesting case for device-passthrough is non-coherent
> > > devices which then require private pools for bouncing.
> > 
> > Why does shared/private matter for bouncing? Why do you need to bounce
> > at all? Do cmo's not work in pkvm guests?
> 
> At the moment, in iommu_dma_map_phys(), if a non coherent device
> tries to map an unaligned address or size it will be bounced.

Sure, that's fine.

> In pKVM, dma-iommu is used for assigned devices which operate on
> private memory, so bouncing that through the SWIOTLB would leak
> information from the guest as the SWIOTLB is decrypted.

Yes, a device that can do private access should not be using a shared
SWIOTLB, that should be part of the selection logic inside the SWIOTLB
stuff..

Jason
