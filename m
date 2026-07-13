Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EA3546F3
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970707; cv=none; b=FxfIeFenQw4Yv2pONYL8T+mL1+TBVgc5+sGF+Kh9c0oSrly3vQoPa1pIEvMYJ8lxQR7dRHeubujyyMiq3Bdb4nPaaf8tsAk5iVEYSYNv2TyjtFsITKRRp8+DUcc2Enk4Ma0rrlUwMQYNRxt83enj9IpE4e2p8K8HHg9S6C0l7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970707; c=relaxed/simple;
	bh=kHNC6GKxK3Oa0yY2t9YDWJJoMMfSAWNNMKsiuCwI/8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mD+uZ9H5UaNjIXlRdpASZA/QK9roERIiTAWpLNk5h8h9Sj+45ulSx5TfOHCAArNe/Or7IkcuvpMFGd0I+BZkpgeIM/ZpjDNevLpKgS5J1OVyAKe4S0/OKUM5iOQ1zfgb9d9wiwP6JlDVL+1i4f+PcEcuzzzrRyKwka9e/6rukvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZiVg53fH; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZiVg53fH"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8e5be46f663so1796526d6.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970705; x=1784575505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kWy2240zOoLDDzwtKisgk31mZ51kjxw8fZyoUW4j0E=;
        b=ZiVg53fHXSjavq+okHU+ibOJ2D/hyKV2vcZxw8OguOxLeG5dZdL3RPINoNmahG0WJ9
         M2qeDJ479v5mK0pjqLOQtYiXW/5fcQy0SPYE6g15aCicHckSM9230GQ7a3+qIE00jUC8
         YYwzWB0PzK9XORoJQy8PwDDNCaOrC5xAwrzRyFu7aXYqJfpLFKBJ+N5pUwA6NsMezvma
         Ilhi/lBGD2z7hhkgLsQj1b7AET7D7Li4kh72SYv/B3U2sVMsaKiJ6EO6KEPmel2fD3Vg
         3pCLy01r8XT4AcEeEhYcZ6rxV0/0gHgGKJWUsQxlnUkM4DW7lv1nQi/kYCjZBVkYR+cD
         T9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970705; x=1784575505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kWy2240zOoLDDzwtKisgk31mZ51kjxw8fZyoUW4j0E=;
        b=PBaMrByxuh+zdhOwartQUmrR7F8F7d0RPByxx3vCRUQoQP5d4t4lrHUzLUWYLxxXfz
         x7pfcW3DyZYeMXeL+Uj1nZZbZELzT8l7G0avofk1ELoAhao0kDXRxO3Ghlg324HV0LpR
         TQzfD1NOvojijdsj8YPFd6yifyXOIDtG1wt+yQwcoCB2b6ewfAZcnozhoSuAe/skh5me
         7FwtkGpDdgS+2NCRrJsvyZYnlIsTysQuM7EM/QxBKw+zkjZLBD97bKLOD3yXKtuEzAd2
         HtA7wUyDuWrxEcuHBp2aMo/FXdDYGgazowj+RyR1jIS8DeZWuDMS0mDg7pEBqoI+iKPg
         3Xmg==
X-Forwarded-Encrypted: i=1; AHgh+RoZ811voO3M7xsIrDAZYT0xg9GXPrbQytSB0ofvmjPSpOFARmyE3rXwolcWNSvlG0krKbvg/vajXKss@lists.linux.dev
X-Gm-Message-State: AOJu0YxlI0WAmiBVO5uZweEC5MMNk+DoLcj0j2URoV0kbv5d32K9v9Cw
	p/+9i0dCPGzDUmbdTKfClAxNIFr3XkGbYQ+zH279Z/OICG5py/3/AGozkLCDd7wD8Rw=
X-Gm-Gg: AfdE7clWzzkFmapACDM0Jg9qmqIHoCy196jhl4kbqI1zPakGpYMxdvkZmvroRTKANCt
	fwhtGWz4xh8IUc9MBBTdWp/A55VnItLTjv0DKQAKQlaAwxW3/GlZRnbBPxDKWQ1Sk3DnqORUYmR
	qxujR7eODstZ0qCHIpS5ErdooyTtIHF4KQIXKnM/EYwW75vIyTiT9h1QNmsrncnfoRnrm5YILBb
	xmb6EAILm3EmUGuh/pyNWYJQXWZZXGXt40sZlhD7Hmqt3lqbVM/Zk8YfbJ16l7PohlCnw3sSo6j
	i2qKK4fDHwKzRwMJCXNhJDRNgEyp3RK4LJVwBUxwJNGPkjKWZFsiC8LvaVnNlNvVpsFEGreVXYK
	TQ7r8SdMCaNRbNT2vXuVyUtBdYmTPi3nLgUKbn78Fr1gxMPH1bE7DhaqIR4By
X-Received: by 2002:a05:6214:2f8d:b0:8ef:76c:cb18 with SMTP id 6a1803df08f44-903fe450e81mr122377626d6.11.1783970703547;
        Mon, 13 Jul 2026 12:25:03 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1da1bsm137170026d6.30.2026.07.13.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:25:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMH0-0000000E5NW-1O3S;
	Mon, 13 Jul 2026 16:25:02 -0300
Date: Mon, 13 Jul 2026 16:25:02 -0300
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
Subject: Re: [PATCH v7 13/22] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260713192502.GS3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-14-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-14-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:17AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach swiotlb to distinguish between encrypted and decrypted bounce
> buffer pools, and make allocation and mapping paths select a pool whose
> state matches the requested DMA attributes.
> 
> Add a cc_shared flag to io_tlb_mem, initialize it for the default and
> restricted pools, and propagate __DMA_ATTR_ALLOC_CC_SHARED into swiotlb
> pool allocation. Reject swiotlb alloc/map requests when the selected pool
> does not match the required encrypted/decrypted state.
> 
> Also return DMA addresses with the matching phys_to_dma_{encrypted,
> unencrypted} helper so the DMA address encoding stays consistent with the
> chosen pool.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/dma-direct.h |  10 +++
>  include/linux/swiotlb.h    |  10 ++-
>  kernel/dma/direct.c        |  13 ++-
>  kernel/dma/swiotlb.c       | 177 ++++++++++++++++++++++++++++---------
>  4 files changed, 162 insertions(+), 48 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
