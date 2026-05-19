Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85E3409639
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197355; cv=none; b=VqZrgMbvMiA0sKT1j1XiKKEo3HpGxH2S1krNZQAG2dsM7pqKJUMSIQj1V9G8xgyoMVDUkiJlAL6YvISsrQTe3w/qJr8/7pEcqQzqb38IZIYlkyEMOVXrYyCwG4f2oEoJGO/UlA+pxw05GANfS6rPSVwFq+OyyH70/Q989WM+HeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197355; c=relaxed/simple;
	bh=dbxAh3jWVdvQ1+R108C1f7Lp/JMDaW8ElH0OVbL5tww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx4WVPnjpEg7jcsUPdtQMFD8k2Gu/jRTRcAb1QKZfZMX/aDoz4hUTAPb1Wpyxh7WZpTBrdZp/6LE7iriHEcvIGFQ3CXJnKNJKVq0Z5MIA+o/cRHDI6YrxFt5OddqpqCulUGIXwOPMhxqvGtEgmdfRrhPlHvyEO1d34TU2VFRALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SFzzMERM; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SFzzMERM"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso55238066d6.1
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779197353; x=1779802153; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LrtAP8Eaa/f2vd8w85VzyR8xqf5rOlnG9+YArbfK2NQ=;
        b=SFzzMERM3mkjP1aLWtGSysWk9HYRb2IH8eS+B+m27pSiqj9tqQ8B2iUuZP7PBZquFy
         jdve4QlTlEnN8S48yqgyyRkrzNFR2rzKbdTb7/SmaPQyoPcKg+mFiiso6cHn2enrcANz
         y4LtpH0gLActH6id519ZCCqvM9q6nO3zCAdu4LUDVQ8zev8pY8pjCGv5qaXx3ozicVFL
         8oAmKADcYK9Js1GPgtIfAPUpGSci3NLA9IdErKKBjqLqvKGoCJjTLi7QSF3TZTrPBMN1
         gjEWBvVv9fZdHGo/LAVNuWbvP8rIegp6jfOBaZL4J0Cz9T8ufhiXdiqhphTMuGm9pCk0
         XPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197353; x=1779802153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LrtAP8Eaa/f2vd8w85VzyR8xqf5rOlnG9+YArbfK2NQ=;
        b=JaJFG5s7WwhPIYFmy/pN2xir+Y7/PcB3ACvakyk4Ow3q76MSaBRabMGT1sfbU/88FB
         Z8BeGaxP1zIWKbmUJixMBYwtiHkTol9LYvnisnYAbvnmBdEY/iqs1QJhvrnc23ivoDQf
         18ZTNdnu7hyyMSNZUm/Vo/TlaoI4tUUEqPobdPe/Ma1Iw/HMYhGtiLm4pjn5pF6pbvYA
         /DkoOunITP0N+saCZ9L9LnaCRMybnMuHBaP7Ucsr9ZsjU1/zsgzPZRxG6SiqUoBpVJbF
         LNlApKQhDA7NR2+CYtMYlcmdpS5iEAeXYwZPn1NUWAlGpZlSs1JwqRFAZWN2yIWrQtFw
         MRWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BcUS3d6Ml1UFwo2MllENjWus9wCUJZE5+xnvLAakTaQygmBEK74d/tX5C5qVrRQheKWvuDIGcOxzl@lists.linux.dev
X-Gm-Message-State: AOJu0YzMFYZhOKjdN2+D5/ipjps6WhDXlIFiXRl9rXdVUFdfcivlFeeX
	LcE9w102wbwMNhXjAn7kNiPrGZOKHulq6mdRU6ylZStHXvbqS06fWfR6yY/x+xST27SgR/Vfgd6
	O76ib
X-Gm-Gg: Acq92OEY7KQCkf6fldxH1DWeP4znFDeHeKrMtKOT+1G7+uuHV7EjvvyjkA6O0k/EpNV
	JvPYxnV7nkEXnFyS+DuY9KRK63lQAItOuU14wYbN1bumgGA9JxyjdbwRFrwcFz27AlFvsn1hHwh
	Rd6/wIlIgT762uMD+YfZmUWsNhnXH+o/D9JN/PaxIq/muA93pCbZoHxiCfK6BjqTGJ07c80uC8q
	YkKcNDdYFo8X4UXImxlnZXQxwjVK+hO5Zy9ZAlIjay46mK3hcG9q9a+eRdGU6jg/JHsbjvpFAhX
	cjG3AwjbvINCZUDpAneKkqQvsUfxydQ9u7gic2fa2aVcZnUTuA3yPY+UHdnkHvxkFYre+FQUHLW
	vJ6jtQbtYi2Z8l8bBBXWKFS780RmA/W3qHJpFBk9+oC07kEOrpyzoQx/bYTax3yhbVrYKTJTyeE
	CjbqCuHfUUTL4ahckdsUpOV0WR+cYPmhiUl00J4hP9ESLm6n9MROs7t3twAnMn3NR8YRF+R6xgt
	5p+S5xzp2Z5cLOK
X-Received: by 2002:ad4:5ca9:0:b0:8c2:7cc5:b5d5 with SMTP id 6a1803df08f44-8c8fda1ccb0mr344078466d6.17.1779197352561;
        Tue, 19 May 2026 06:29:12 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360979c2sm90678436d6.18.2026.05.19.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:29:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPKVT-0000000EubB-2Vp2;
	Tue, 19 May 2026 10:29:11 -0300
Date: Tue, 19 May 2026 10:29:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
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
Message-ID: <20260519132911.GA7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agxDxdxynp4KEovA@google.com>

On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > >> 
> > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > >> that we can use it in the conditional above.
> > >
> > > I have this patch, with that I can boot with your series unmodified,
> > > but I will need to do more testing.
> > >
> > 
> > Thanks, I can add this to the series once you complete the required testing.
> > 
> 
> I am still running more tests, but looking more into it. Setting
> force_dma_unencrypted() to true for pKVM guests is wrong, as the
> guest shouldn’t try to decrypt arbitrary memory as it can include
> sensitive information (for example in case of virtio sub-page
> allocation) and should strictly rely on the restricted-dma-pool
> for that.

??

Where does force_dma_unencrypted() cause arbitary memory passed into
the DMA API to be decrypted? That should never happen???

Jason
