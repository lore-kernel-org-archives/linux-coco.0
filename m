Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98F145B11
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970557; cv=none; b=okuykbHmvt6iTFPRGjro+zSYvLLvSbKrS4KO0OuV23tM/PSZYzE5SJzOvdQaNhaTwXOguh8OpH2d38wroi4htZfnOdxmzBVwa925U6pBj8JUKxVKBtf6xMVq4tdCdmFKj9ZDKNGwSWTrszb1kGeLvD779eKQ/lOuQE23dDKdEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970557; c=relaxed/simple;
	bh=KcyjZz0/U3mbq57knc0VdAahTqdco+ieDuECz56azZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKMB33/1FTwY/nTgHU4QlIbY7NwFLliRDd1Hplk4Cl0TM5wvaJfd9WQIBKZzeRTwuMmzvNtBBqMCk3slzudxhFpwP7uGWgdUA/giu/upLUbXQEn+XDh17IJcD+CameIo5A4qgRxR81q8UI0gnPyqy4Om/jNj32S1qruzdAk1hjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TVL9VKDI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TVL9VKDI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f18d92172aso3298466d6.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970555; x=1784575355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTUChJSUQ7qBnpi6xNUNbqkdyOGkeoHtaVMHI6/gjvI=;
        b=TVL9VKDILFXliP2PaafX+9FpAYmyH1rr1Ab0wzTcR1RN2fLPcPg3JAQqVwwyGafAID
         NanEm2avl5YYFVeVpe35XaixKgI5eQZ0r/hO620ve8P81RrCravauHsKcSkjOXqvLqb6
         f35MMvFvKQCGUKx/iUt/GD/BOVKA21jFixkpgXUBxqST2qpZO27BgkRIMP2dmMKXcZWe
         IlNYDXxfXAKTF6nl9WPz5m4536x1I91rA7uUIkPOkGd77CAQWrcxx4DjMgYoqCG1bpT8
         5tU+BlAjfPHdvVxeoRf0eJ+KDHsXR54Qjj5xNl90E6RjCzN3tgB/p+c5d9PXsdSX16Kz
         wj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970555; x=1784575355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTUChJSUQ7qBnpi6xNUNbqkdyOGkeoHtaVMHI6/gjvI=;
        b=siJ4XE0TE8pMqPWSExDJnT8JQH47JXjzcntrPbfmT6BV7mIB20LvL6isdzXnMCOjRB
         SqLqD8GKK8UbJacvxphBE/Wq9w/5BWIpzS1LJ8VJNDPYyjwreHQRFhdvVPr/n0PzCEFM
         nRnHcwXO87DRQX41KxmqsUdEnvRM7TceZFhXTRfUuaryvQb84ujamdcYHj5hVnS+Hjl4
         mzVTTwxAro3eCzi3ys8TU0lk3GKurwKl/yqMaM0eYluDsmMHWT4r/VMQrpAkQf5EiWHv
         GJORLXSEGDQn1QPJfXTK8cJeOK7qsew0rfnYNb1jLIFpJc6nlZoNCAOMcELXEHTUeerS
         EedA==
X-Forwarded-Encrypted: i=1; AHgh+RqjH7KnkVc/EqTqiVdIJ8f/X7Hdmmo3CgcZdOpaRhaLAUg2q1YwDki/IIMqe4Ob7ma126WeghlmUjdD@lists.linux.dev
X-Gm-Message-State: AOJu0YxU1kWvDtMmz3+JAZeLWjqJ85OXVqF4yK65QqufWhAt6kqhGPiV
	GX3QxAhv4cvh+iQQwXIWEJiUy1+B7KiuBRI5aYXZ9ohiL1i8JaY7g/789qIuxfh7Q+M=
X-Gm-Gg: AfdE7clX2xrE3RTBPtS7fCj7JdfwPafoO0p+Dqb2DLtWI5VkY6MHorGJO3xGKrHoXtv
	5Qhue5gqIzo3UuxY4ovbpHXYt0L26shifQ4E4iCzKW6hZrEKEAElZsPXoMOWlewyH8VHv+iC4pE
	rpRkgzvYBh471Ks6qYDWbN1bq5ruGUKrqswm+7DtHghpkq9c0RHC5WqoAEKytblBtZHqIwBBD9W
	i/ppABzoroO3D4rbWcMJPrtfZDwnU63BHvGakJMgmkex0whH2u/1Q91B2saMYwqWibECpqNr73h
	7yV5Uje6bzNYsQDtwOCrq2zeBmYZcpYgUkOWQRzX3wjCjWDvw0wHKe9X8HvIynVkiIJ6mnXQoVy
	U+0IRQ6k6hMwPhKHKxBdTrWafy5fvyoX5urU0fHRr39h8ZvrL8vysNQZKK8fFUTKVZDCXvBc=
X-Received: by 2002:ad4:5caf:0:b0:8f1:2607:ad86 with SMTP id 6a1803df08f44-90400b8b562mr134619656d6.4.1783970554874;
        Mon, 13 Jul 2026 12:22:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50df5e2sm138736336d6.4.2026.07.13.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:22:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMEb-0000000E54I-3Zkq;
	Mon, 13 Jul 2026 16:22:33 -0300
Date: Mon, 13 Jul 2026 16:22:33 -0300
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
Subject: Re: [PATCH v7 12/22] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <20260713192233.GR3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-13-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-13-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:16AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 
> No functional change in this patch.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
