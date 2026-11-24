Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534578;
	b=UdATkxG0WHvlUYHhvYD+2mrBa427EfxEwpKCUcG4tCe2+hKuui+QdI8b5lZSz1p+6sei
	 Raf4HWIB+PTgUA1dB4Bp2tvqDU/qIbs5uzApr0wHC+XOIdZeAG8YoBQ5c6DC8424+GqAr
	 zZCFEKRCl04qGf9zEiS179fF8+u0rN4K7aXfngCIIu9IO32WdLgrDfGJxALDuexn7y13t
	 6ADIABAVM+qe+sQZES4KutzqF7Tnp4jdDyAMFjlXRMbxYTHWJRBglA+oJVYt65031J5iI
	 aoZfdpzHd5J9rxM/zVtTLhAFxaeG7LKx80ObWJ+ze32MAQJmEsAvCG1oEpRg5dwYzCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
	b=Rap9MrpdZY1SEb2THMleB29n3veyTKEhPDRqogRItfsSHsfcrj4bpA4Sgy9l/ZEELHzx
	 pI0I4UVwhEKa0SCjVHsgMS9DTkSrcWs0+qVJtExUVlhyc3Uv7g5KifVcwY7brilw4dO5g
	 Njew/WN9FA3fYeBInRkf3uYbQZr0WzQaU0Bbqn4yv7qKOvpgnTERCEqT3IKoAqvJu9vIj
	 DcAMK3znbn3Hz94DV9HcYe8cmSFgX3N3wF/MOJIl6/D4Ab80+xvlTpHkrqtPYWk8uOb+Y
	 kFw7aghB2Oef6xWIGX2uMW4We6V3ewmfvEyjgAStX94jLFsZVg6X6kRdiQOv0CpTDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=icW55hv6;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B5B606A329
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 15:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B5B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=icW55hv6
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921276742e3so43278966d6.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 07:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795534577; x=1796139377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
        b=icW55hv6Oyz0/hRGNdZ/6vl9MyrOn2rTLqQyx4h9OHl89URqjdSysTsF6tpaMZJzKi
         TTG91uoZlxJQzko+c+4H+KYjLqZDuQ9TcsQp2Ouq3Nylg7g9LQRmO6WcJsfaW1R04v2h
         B0CMbB7pv0w8N1cld6m04Uxgvfvi47MwC4Zzn4IgSH9ah+TMmK8NhBvGPZiVrzR6sxMI
         O2tzim6+gv8yHLgQ4hSEaNtwgawLG1pgVy7w/8tcWVRsoYAdxdkVALd0MVj5uBavLlUW
         UOcOR3NF+dpXGIzrKs/8erDFZzyJQv11SEglRtl5GgNY2ynnG60gHm7gl02ricExBQ2d
         d1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534577; x=1796139377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pztq+Cm1+ZAP57GA6CuWEqPVZxEOeq25+Hlck3k+Nv8=;
        b=DsPQb1MIx0cRaYUGHfWRJnu7QGJEd6a3pyUetkwyPIbz+Ji+8bfbH/s4vzUA1tK+3m
         GGFErIPPuF5ZJhKnfa4TnBwamh4fjGJdKqk16SMyvueFbmzTACTqkRF59Qif4ll4w4/W
         Zn6CLJyR7iGK8VnE61W+/5k/7QWrrtVczv5wAj5E1U38OcR6Lrl/ONBHKMByPkD4x6fM
         dqVqrWwA6iOW/Z2sKI9UOzIo0rL8bpwP7ggKwwBhIIbmP12V9OiR67vmb/zjBiVMMBZ8
         POijYbhwklJJC84RtItLdzBjuLoKLik1/xUyvx/bwBOa9PwPmfI3nBKEkYk7Nv5A91bX
         qtQg==
X-Forwarded-Encrypted: i=1; AL+hErGHQrQz3cYVFwGy2y1slmPN1AJz0G2NGMvcAazxv1wTwlQmFsO8pDjm7bW4C8wf35MJyA+AIpr/UMtz@lists.linux.dev
X-Gm-Message-State: APuU4Z/DV9oWRIQokQHwrrPm8MOT6lkQvc3ucU/2iwZCOozklHvEqDhl
	eQvKn0aEuw+aSOLZOLUvKeweSO7CrX5xLPupyuGiLWagSylaRZTR8mn6HO+5Rp4eOao=
X-Gm-Gg: AZFdTZeYESJ6ZHiKsVkvxB+ZRdaVweABSB0qD7LAXgq9EM8o0ohTDilU2XiwscLDwvP
	C4278X5vqHUorFqCSbAJdjWtImuWIpIV25Kn/uf2CJ09jI4FTZAzXPRgRzzkJ45A/GC55dGJUqs
	0wkNrmj/AWd8S/LhLl4GaFM2sTYU0VXEgDE+FQOZQC2o7O7Kt5dGZX/p7/ur0iO9opMDesItXiZ
	40CRJV+PhOMFMlaT+X64qacG/Ulg4E06Zpz2XpKdK4bbZ9MW1hPl/lLWHDDz89ZJumeXOJvjJbH
	0xfAuWfIw2vyiGa21QrQaBl/wAE6wGcgn0ASpycMsM8XEeHPBBskZAgKzzne5UVCxRlrvii5+DG
	cm8h9LoP9+vjiw8eqzbzw+xNjdG5D3Oa6woC5ON/mMTMY3MHETbPQdomk/lUSMGa2oCosJHQK3A
	+TQ1zelSbfpG/STxnsCz2nfWgwAPfJ066Aq91tcGchEwxDfyjdmBa3LZRHIG48Cq5XkuOEtKy8j
	rrs7H+FGI0oQpYHJJJrOSC8cZh5qYWs8hEgjwyCAza3+3REyCGPh/+84taAsVSQL8IMmCAEm7sl
	wgA99Q==
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id af79cd13be357-949bab3d3bemr2564224485a.81.1795534576594;
        Tue, 24 Nov 2026 07:36:16 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm1073980385a.41.2026.11.24.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:36:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVsZ5-00000000WyP-1TgI;
	Tue, 24 Nov 2026 11:36:15 -0400
Date: Tue, 24 Nov 2026 11:36:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shukai Ni <shukai.ni@kuleuven.be>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	linux-coco@lists.linux.dev, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] swiotlb: clear read bounce buffers on confidential guests
Message-ID: <20261124153615.GA114530@ziepe.ca>
References: <CGME20261123205317eucas1p2f96032281e0f5e9f17acc7ec343acced@eucas1p2.samsung.com>
 <20261123205302.1034348-1-shukai.ni@kuleuven.be>
 <42415609-c784-45d4-a79d-ef3cc5e6c3ef@samsung.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42415609-c784-45d4-a79d-ef3cc5e6c3ef@samsung.com>

On Tue, Nov 24, 2026 at 04:17:20PM +0100, Marek Szyprowski wrote:
> Hi!
> 
> CCed Jason and Aneesh.
> 
> On 23.11.2026 21:53, Shukai Ni wrote:
> > On confidential guests (AMD SEV, Intel TDX) all device DMA is bounced
> > through swiotlb, whose pool is shared with and readable by the untrusted
> > host. swiotlb_tbl_map_single() copies the destination buffer's current
> > contents into the bounce buffer at map time even for DMA_FROM_DEVICE. For
> > a reused read buffer that still holds private data, the host can read
> > that data from the bounce buffer before the device overwrites it.
> >
> > For DMA_FROM_DEVICE into a host-shared pool, zero the bounce buffer
> > instead. Zeroing rather than skipping the copy keeps a short read from
> > returning a previous transfer's data.
> >
> > Fixes: ddbd89deb7d3 ("swiotlb: fix info leak with DMA_FROM_DEVICE")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> > Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> > Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>
> 
> 
> I'm not sure if DMA-mapping or SWIOTLB is the right place for such fixups.
> 
> Drivers should be aware that doing DMA from unsecure device to the given
> secure page might reveal its content to the host or other parties and
> prepare for that (like zeroing that page).

I think given the semantics we have to support partial write we don't
have a choice but to continue them as it is the DMA API.

The driver would have to opt out of partial write support somehow to
trigger this, and in that case it is more of an optimization and
shouldn't be linked to CC.

I'm curious if there is a real issue here with a definitive issue on a
driver or it is just speculation?

Jason
