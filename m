Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21630408014
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204465; cv=none; b=BLzFQq093aogMfou4zaTzg9VK3k3JVw0pMnMOD1yJD66hGcferBs8qI17uV11t6oMsnS3FpeuUh8C6GaiHNRqAIKeg5f+ZIj+g7eKsP3+AfNUTkVEoQZO5xlc88IDei+B9r4Lj28xq2IpGDbr9FDRi09M6xElpsaoH4Bwp/AmnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204465; c=relaxed/simple;
	bh=uW4Yk0igRBmfLaBkig6+ozw+XI5e0m0/JIVGZ2INarE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpO9ZScOuQSuLwkr77Iuv5VnrD3BURYsiXa9DFF9dGjto/ClvOyLafqFiXCtHYYOMxwzYvU/tL4c4tiVaNXAs4kFHWMLGmjgoKxc3xSGqffBgKo9ijNGlS73A003Xy3EXGY8aelTcky+2QmYtT0fqzbnyi7bhpMmCW9157yVClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ewDS4UPq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ewDS4UPq"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-90d13fa59e8so384834785a.2
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779204463; x=1779809263; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kt+hX5KDw0Kh9RBmOyjzabH+WBL9dObDUAkuMZR7Klg=;
        b=ewDS4UPqLuAkKDvpdMv78yHUZSMMPt4qyIg2941bTPu81ULvSFjQGyB029B0iH9ock
         lmUaGbou3PxMuHQiCNWjAf7d+Jd/xTn1HytIvJtBSwMgGXRnPVrRodl5l+heuzO5tqAP
         ZBEGA8ZUhWHwA0WMgpf6v1aTsYUIYQ6kamPcJHMTjK6w7+ypBctYf8GYd3zaXshJK//R
         LvDw/MWU9JIIEMOkWcfpx7RZtow5Iz/0ies4F8AJW1Jlk6AVvy+xYzKfRkK6+LwACDOV
         0TP5vbEvAdQRTt8JyMF/vtu7HJjtbbEX1M8he+9iCp9qlwieyFTNQYbkO4ppX8FObq+Q
         pr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204463; x=1779809263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt+hX5KDw0Kh9RBmOyjzabH+WBL9dObDUAkuMZR7Klg=;
        b=EDJJcy+o2rCzY8CCTDtrvk3NLzNsy2ZvcGC7jb3tQ5oIEm2/y1597ayBfz1iytZWNX
         ToeuunKakAThmZ1EoUIN7uFsTHKatmhipO01u0NUdfdHTfTwbbIiacpdqz0gNEpECF31
         hFvQuavo5NXlAW1NWoGiKAl+KUqC3Vf6j315UkAcCqzQ9iF3UYOSVjmGDtHN5zf6YUcb
         qcFRR5NgwSfOuHS6g2f5bb3tboAUoU7oKzNJyGHeVm9vh1mcgxJEYdYVDnn9gLN0w2e1
         w6tmGr2M4KHQlie8ZrSgx+iRNZDmzc7Gmnw4wgLBUj5s85IdtccQG5Zd8dZk9Vnmfybg
         DMdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kQSmGbW8GhvOlpmf18jJqSrItkQI2bfFtGK6/2+ZgAQipLkSyd+wtICjtqKPC/ylZusIt6JHbKNCY@lists.linux.dev
X-Gm-Message-State: AOJu0YxtHAJoHPnZM/UnyPdFZslYhVLvWurIvWuTEuGyJh3E5uRAj3An
	mfIb2IIbNcUW4Kt9lteCL/y2gfKBVzyY8OdySvre7WV2ALIXkmOCMNSkBAgvb7357bs=
X-Gm-Gg: Acq92OF+QVHzJDhf2W8OT/5maschQyN3J7thAGSRP9aT16es0DBtmR5mAno7ZdnkDrW
	yEhuzQp34cyzp4X7ZNVv/458l7f1QT0bsp3eLjPUhfuYJ2Y2mPgHof1CB0tDOUYbv23HAIAtdpA
	R3e/KPBGN8EwSknLh1bP3Ip11qVm7CcfTZPwUauRKFC4SjC0HBsyJvbJ8y8RUPpwhiDQZMLXsOn
	dhtxy+ElXaJiPu37elqguzNT1uJdLii/EufZmYAiJ5Rp76dCT6goJPqGQ6QTFrZjJHN6eZOnwC+
	1ZicwlVFM22PNOMnmquQuOsd5wc0+yTpVY3FKkuOYZgL4pvNPYe9A73W+cpHtgOtgzJVbdAYu5o
	mF1M3egxez1OAmeg+jTJ7Bkkxc9pl70GopWnx8U3OTLB+llaKKoKx8tFQqltztYNmM69AIHIVD7
	cwSqtZsz/+fo/hkF3oPTytbQv+R6Nwj/JRU+tl4VyWj+LigTVl2LLsUjnRN1OSd9Xva6L7SExKC
	ZVP3L9eJgspm5Ml
X-Received: by 2002:a05:620a:45a5:b0:912:671b:d098 with SMTP id af79cd13be357-912671bd4e8mr2727065785a.51.1779204462879;
        Tue, 19 May 2026 08:27:42 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba943761sm1881906785a.11.2026.05.19.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:27:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPMM9-0000000FCKQ-2JCd;
	Tue, 19 May 2026 12:27:41 -0300
Date: Tue, 19 May 2026 12:27:41 -0300
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
Message-ID: <20260519152741.GM7702@ziepe.ca>
References: <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjebsaid.fsf@kernel.org>

On Tue, May 19, 2026 at 08:37:54PM +0530, Aneesh Kumar K.V wrote:

> if we get force_dma_unencrypted(dev) correct, we won't need the above.
> 
> for dma_direct_alloc and dma_direct_alloc_pages() we have
> 
> 	if (force_dma_unencrypted(dev))
> 		attrs |= DMA_ATTR_CC_SHARED;
> 
> 
> for dma_direct_map_phys(), if we have swiotlb bouncing forced,
> 
> swiotlb_tbl_map_single():
> 
> 	if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))
> 		require_decrypted = true;

IMHO I really do prefer the DMA_ATTR_CC_SHARED flows closer to the
thing that did the decryption. While the above is possibly sound it is
very obtuse to be guessing what kind of memory swiotlb decided to
return..

Can we pass a pointer to the attrs into the swiotlb stuff and it can
update it based on the kind of memory it has allocated?

Jason
