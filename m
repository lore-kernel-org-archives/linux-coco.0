Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F21C32B126
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032007; cv=none; b=TW7XYgFfNh2CSH5z3Pl7ilwV8iuLiZyiHwhjXuISJX8A/2kqValtIaGFx5gEPxXTLkbiKinoSFTKgkczmNF2OBnfHWqCAupXGpzQtfUdiZDeSWbt9hJcNujlCu0SBCUPsfkXeY6akfD12CMM05wa9tdjP/oD1M+/Lu9vkQpEe7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032007; c=relaxed/simple;
	bh=EyC6N0xAwYeQ07+jukS70K/lUL1qxajRoHTimoin/A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooKvJkT8qXlhNMmKUlvagiBBWDcaKkKkNM4XfXrwGubkPUk/WU8mK4HSZBVVzrD8RXvdVwxHNonq1Zt529gU2vQWK4/Au7st/32O421+G9O0IMf6qC7YL83dnwx78w9Q75B+9KKcvgC0ZKaeL+YEPVFS1OLWxZz9AwYEl2qXrBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=L0yA85kH; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="L0yA85kH"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8eefd4a8057so8635196d6.0
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784032000; x=1784636800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuDF+BU2wT5tVoACVa1l/BwLN4UR/axOeynKCGX6Iio=;
        b=L0yA85kHQF8+wkjsigpzExY4sdESVtijrkU3MU4WO/zUtiYbcb6mE2h9IIxVRY++BP
         3w/01FtRvxbseCKNxuxiS7gCdVIMUV82KEECbN8LpslqP/dw2Upku8Lg5EtxqGxJze+W
         dYad37BnH29imANUVOVQiVosB25zD3Tbug1xqfDHrDSHI8gSg7WoBN/Jkq2+PqTdVDFc
         QeLT5ECLisoWd/xmz/c2fnc6L+/4e+4Vw7WkLBsPduuZVoW95erELlzJm+zAhh5n+4mR
         tqBQlGVLUtN8A6mEN1zI/GkIXsKgSnQnUOMG7sx+TAR+AY/K2k4vEhuE9O0so2/mrC1E
         x+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032000; x=1784636800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuDF+BU2wT5tVoACVa1l/BwLN4UR/axOeynKCGX6Iio=;
        b=fpBJVXcQesa/EEoCwH5hu4SQ6NMTzAAt7bYDbyJldjOgxYPDUbZ37lMWH3EFLvtrGM
         HeYqUMPSzVMZfLJUGmfUNQTAsr6hmh8KWFqPPcGvI1UHMOHz2RVYv0WATz+Mg0M8sYHE
         0y5VGNWCmgpq3G/viXxS27+Mz9KkbbOPOvcPuHpDAkYdSviz2lxp1vg1t+xE7f+uKSCr
         by6GCrd2fW8y01qVVx8U6q5y6LVUa1EHYQuFZ/GQ/9KK3ZvrRMrrlcx/jSvTIwptyroy
         JlDSzqxv0R9U2XS8AUlC3Fl7yf9+6HUOB6hSJdViyQCO9xyZf9LIYA6FlCbNEUvt4Stc
         t4Xw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5QRjOVdqbbiHYD4aL0odjJJX6npawySXmfp35hcQo8fZlGn3iM35JWuhFI+QoyvpRlPQkTA/2qpyl@lists.linux.dev
X-Gm-Message-State: AOJu0YwSEZsORdCeuf8C7orEY2BDXaoe9Y+KnKJSYcB6fQb0bpilNPVz
	cXMEpIyTLx57YQ0VQ6v5dDkOi0hXp1C4/mCK0OnGJJuNZS+2/YCXk6x1XkFHBdnPyqc=
X-Gm-Gg: AfdE7clOuKgY23CeMttcAhrPbwgKCgJ7H6gPm2IioO73NdIOWGmgNCf6eUlrE5os+rF
	8xDK+a/u51pfqlLc5tHtqwvwDB06mjWBQGx/CQIfpTZHNvqpD3Lcsp8KMJS7fd+jW/oh9t7HRYG
	KwmJgFIdOnOHPI/o0tc0KPtxnZWvWjF8OwuAmECaTiN6z984LW/350vsS2kIWXD/Jy2N2XMcO0a
	jNasbuU1lIK9080EPdHrS1Wu441nmCCE5T1WQxHfY8z4PcrWTlh/Ks9izuFR7h4AsP0GEGu+yk3
	qCU6f3i8vrcKVilIpOY3RCGsA5wR+yF/ZQoO+Wsqo7+tU4mPexEqDPY7xaHPIJoXM8Ya+Zay0ep
	QwYmuoafe3GmOdbQsByNLwmgSRw2JsNoQle1EpLNX0ZuTyZOp84p1UKHnffsR
X-Received: by 2002:a05:6214:1cc6:b0:8e9:f5de:d629 with SMTP id 6a1803df08f44-9040423dcecmr141353846d6.56.1784032000167;
        Tue, 14 Jul 2026 05:26:40 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1ec84sm168106996d6.29.2026.07.14.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:26:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcDf-0000000FRvu-0Ugk;
	Tue, 14 Jul 2026 09:26:39 -0300
Date: Tue, 14 Jul 2026 09:26:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <20260714122639.GH3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
 <20260713184810.GM3133966@ziepe.ca>
 <yq5aqzl6mc00.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aqzl6mc00.fsf@kernel.org>

On Tue, Jul 14, 2026 at 09:57:43AM +0530, Aneesh Kumar K.V wrote:
> >
> > But I don't view this as that important, the CC hypervisor is probably
> > going to use the S2 page table to force cachable on all system memory
> > so the non-cached pgprot is a NOP, but the extra vmap is wasteful and
> > it is confusing.. So maybe a little fixme is all that is needed here.
> >
> 
> Something like?

Yeah

Jason
