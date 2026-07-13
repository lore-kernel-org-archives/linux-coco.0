Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8324357D12
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971753; cv=none; b=LEQMj8Osi3xw1BG/WRFHVDK7nRjBN9TCGXk11C0goBXx7WdqqJ8XRCYGAsQ9oifIXCT9znm+qoe65T/1mPCInQw+KWKqZyyQBdPkM3xwB5gfJudqu6sIf1fB1AUkQaREmD4nkkt4poia0SPzIDfsh9fFCQxdyJf/pMEpn7n/ISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971753; c=relaxed/simple;
	bh=LrC9TUnnqFTfebiht7I286OGjyOyXGf0/ejqHXWR6G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSeEszY0cwaCLPVccED0+uAtNlp0yAavhoJnmToBtBl8HYWiWc+7ruTnoL4YmKHOFw3/c8k6V2gehnCMk3lRRaLLl6/ZIEUAhIITAq4JaVXAmKcjlFVtlWR5akhvvtqtcBg0lNzrewqR9TFONId/wBY0QnEYnqpongRIDF4NMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G3RP5VuB; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G3RP5VuB"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c15bf5000so20794701cf.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971751; x=1784576551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BBsjNZJ46p61GVJyRNvRKNhKTJyhEwUbX6XNXZgDe0=;
        b=G3RP5VuBQ27M3n1U0W3gt4792g2SVAS7zeaPdqW4hDfcuY46cz6vAGw7DYiLKroN27
         jVLjaPRDRudzbHmpq9ofuoSi3poLN+ZmLg0R0vnnv0ip3cxqfiOHIZ7nkPROfMDww2GQ
         iV/53JwWMW5gDzPhaCqT5AMcWWnGgnnucxmlys+S2PTrQZmL+IjLBoHF36/i9WFTemy9
         Kjh0yvPLjmW1rb63HxdWQNvKYSrByJU9+T13YvSRpvIa5E3UtxmKd1rANhJjTQj20y9o
         zYcKApEMG2xl2vMw43FpSJr7A8UaOj1G8DoyoNO6lx6S4uqtR40JzmzY/VQ9AxRvLrXE
         8QBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971751; x=1784576551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BBsjNZJ46p61GVJyRNvRKNhKTJyhEwUbX6XNXZgDe0=;
        b=W3uWoNuoslfygpI0c0+u4lN7DMxqvBWWatVEpagDixisqkO9DncnJjAUmd2sF1gc2A
         nX9LgsrXb7gqaMw5u/jVzEKGZeji8jPFovQFE4eh1uFx7oFbR0+gJrrrf8Jci+sQmnh4
         Hwa7tNKLNJ+lBmUkZIptwA+tZgeAKT0Ao2K/S7mEEZKz4qqNWhYvFfcPhjDSmekpqlT5
         MDpI90vbN4+FCDF8babtjPQ6sdhZaZ/HuVDnLAK4fSwOOdd00F4Z34mT0H1Y+dYO3J4Q
         AJJuCeGxq86nvscybFwp78QDI4TdLG9oA4pTxcppD0jSMMZgp57WTAAz5nQY5fnb0gpS
         bMAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1JJClFmalC6RLMaQoAN1Et9tVBNGDN4fkf84ASDO0tL3Ar7g9zAdJUkrBS0OJpCZcIAk0NjT4Cn/+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Xe8h9JzDfeBwAMXgz6+LluonqtAi2yRpnwglEj3TOB5U9VCr
	36/sEsoAo7G3UNUkV/kgUEqnY486yWDMsVpT8OIETXrl2NNnYFfEE+WbzPOlX8eMSEQ=
X-Gm-Gg: AfdE7cmZlgSm5tM5DipLtur9WU23oD+hUM1lZRl3WORrjFRtDxM/qLZUnhZHbCh8cTv
	86eCMJftoQTOtjIVEHgN02cw+WV57YsvH4r/7lviTuwb+TI8S0+5tm+EQ/Hm8vg6VrNvinIMLQ6
	ZlqpN7rCHJwBT3eRUK4jyhoMnMovBakQj4F3LkwsXAu9wqQpDKmwDZOIDqtg/cA42Eo6VggPba9
	S0WXGyLISbJY5S5rQpBIlfiFYPgIWUOPt8ni4QLQNjGxNtm6x9UakQ5dJsrZJjnUlkW5pmYGduV
	ciFFG7XSsdc3vXJTQZDaX+irtS6Cv4vyy1B2A809GzUNn1OmnGs8yvhjznGano6PkWJ5JJE4R4m
	0jAM2To3nALDoTYZ5+sTrz1UcWd5ppWz34djUAlFGYoN4baXX6jmVE6KEb0w+
X-Received: by 2002:ac8:7d53:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51cbf0b836emr108931441cf.19.1783971750625;
        Mon, 13 Jul 2026 12:42:30 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm138277776d6.21.2026.07.13.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:42:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMXt-0000000E6oU-2oJ5;
	Mon, 13 Jul 2026 16:42:29 -0300
Date: Mon, 13 Jul 2026 16:42:29 -0300
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v7 22/22] swiotlb: remove unused SWIOTLB_FORCE flag
Message-ID: <20260713194229.GB3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-23-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-23-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:26AM +0530, Aneesh Kumar K.V (Arm) wrote:
> SWIOTLB_FORCE has no remaining in-tree users. Forced bouncing is now
> controlled through the swiotlb=force command line option via
> swiotlb_force_bounce.
> 
> Remove the unused flag and simplify the force_bounce initialization.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h | 3 +--
>  kernel/dma/swiotlb.c    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
