Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E587A346FA0
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931698; cv=none; b=JhkZYqbuPZuUfbtsFLjaefL36q5JYudbhlKoCFkJpEhZ91UYlkLMcYc3/dCrRvap2ps2K3OjeRQP8cGSjSeItrn3JpW8/FMrsUqp9DfRn+ftsvcjO75mD+di6hEKq61fh7S8hvypfI2znDzM52oUwDUxoy8lP0K5QZ1C7qE7MQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931698; c=relaxed/simple;
	bh=3CkIAY2zgjDsS1u7AFhV2JtGAbVvbQ/yIpO8LAhi9JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXdUWwW3l7V9wXxGKmc+X/l6MJhTTCZWOqBS4mgKBbwYd5ZAvzrgcVsaCZS2sqIlVpkpGVnlTs2nCHhGhZQgJX3F7NFQZsbo+6icrBIaFVNv5tujoz+ZFQ5m7N+iLaEt9OYx0i1xcj2WekDl2tPibhlIwH2zaGQTqThWxR+eyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Sx7wd7Bp; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Sx7wd7Bp"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so47268146d6.1
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768931696; x=1769536496; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8qAE5sNEY+vMBcgIGavaDhVYcx1nfMvjPQrHoPpTHaw=;
        b=Sx7wd7BpAnmqvnuLhwdkXx3Zv2I2PJSPmz+gnRudP46Zypj+78Xe8dyMXxOwXC+Qje
         lOjXkZ+rL46NdcodZlw5dVlNWv53HVqvMfVG4NKLLb/bZCavFfdTUmd7ntdNw3x5DgPI
         XgT/gFhzSYa+Q79pwwpn+Wpn2/s80HDeD9u/KwDIj5v0/ZJOxmV4bdvzWy8Uqye4RkBx
         mDvtFOUv7VCXRCd7wihSt2loNf7snZPFLOes0+fdgYaINmnvGGuVcUon1S5uqWvMwNGs
         w0cqkJvzXORyLLZqa22A+9ktwZFdErr7UrdOe2BlZdr25pc4OxL1g6F03zN41r3geaPR
         uUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931696; x=1769536496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qAE5sNEY+vMBcgIGavaDhVYcx1nfMvjPQrHoPpTHaw=;
        b=Qs+iJMITPr8TIZ+C/SxSmWJhZzpJiVIA2phP1E4SFBAAREQRrrYkDVX74cjSJqQM+c
         JsU/wjIO2VKtxkSBOIyEHnuA6Fe5It4ewNB6X1/itQRRi15bNKgvGBs0dfuCDDKuKI0V
         SzlvfCiGwMHR5kE2umA2bmstxEr8IwlzmuoajsLWn5nsN9+xyoFG9nPMKo61J2NYti4R
         tHeVuPMhC/X3PhuoqRAWOqTDNEJeCjULP3PABPd+4/kikE3C0C3TDtWJiZrfsNgBIDK+
         UtJM5yQTSGqWswCUAbVR7I6e+qlvJ34s8JsdDxtj9NXD5lBjCG4+qhTssoo2A0B8iaYt
         bUlw==
X-Forwarded-Encrypted: i=1; AJvYcCWxqA8AtX+pGZxohW4AFtLXbmhhoF5KBGTL/wBBql9iTH5pC3Whm3ArxkpOjcsyAX2DzWiwb0pTdlDF@lists.linux.dev
X-Gm-Message-State: AOJu0YxssxMWdp2oULArScoRXF0FIgEi4ytHcOZ6FCm3I7jF6MJvUcPB
	u605CLjShemaNEINwqml1/s3oFIy3oLSwF2r5fIq4qsUq4CF5qwREbVgOlkDuTZL3KTDXnVo33P
	Ie8l/
X-Gm-Gg: AZuq6aJ1gW5iuv5jMbbH/zja6Oz+7UdSzuoCldnVXsHX23jzCjJZY5ZgcJ5RyHRH5Jh
	4vvc16i7hayM1wyJRhBPfSA4ootEOsQE5oW/CeHgshkhJrUYCSXQQacivXWDUfazbSdNKRQ7Fft
	QbgeTq1YcVX4d0yWeBjuZQ324hZBtlurrce8phJdXSI0pDu/HZlEAlSFxSLomxYOfFGADbjjFAW
	No50GSzFNERqaZ23+0bm1Ceb95K3cwDLISacGoPRkjJ+dyQwq4ein/+MY7sHMtm7FIAB6yyNeyG
	l8xi3bhAF6yBGQM8rtXWZopV43k5KxpFmDCiPZiVbze3JVgHP2aRr6JTVx2bjRGo67jYinCxZco
	EVWQ73PP6kCqMTLmNgIeGQOHGFoeHzWp/pUCerpK3way2ksZ+tINy7NVK7uzGl1LYz0+ozKX4nq
	xOAcgc7jttIUzjoDN3pCP3eUoBQyYOzjID951B+e9v8FCQIjVDD/wiV5hkHh2w7lhdbC8=
X-Received: by 2002:a05:6214:491:b0:888:586a:cd89 with SMTP id 6a1803df08f44-8942ddadc32mr222578076d6.34.1768931695638;
        Tue, 20 Jan 2026 09:54:55 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7250a60sm1078459185a.31.2026.01.20.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:54:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viFwM-00000005aRG-2tYc;
	Tue, 20 Jan 2026 13:54:54 -0400
Date: Tue, 20 Jan 2026 13:54:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	steven.price@arm.com, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] dma-direct: Validate DMA mask against canonical DMA
 addresses
Message-ID: <20260120175454.GA1325733@ziepe.ca>
References: <20260120064255.179425-1-aneesh.kumar@kernel.org>
 <2a0b6d1b-875a-4075-8fc9-a8534afc9168@arm.com>
 <yq5atswgjrkp.fsf@kernel.org>
 <0da8b73c-5bec-44c3-9902-221a11142c34@arm.com>
 <20260120151127.GP961572@ziepe.ca>
 <a89e8fcc-29f0-4a6a-85f8-ca8ca41c53ce@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89e8fcc-29f0-4a6a-85f8-ca8ca41c53ce@arm.com>

On Tue, Jan 20, 2026 at 05:11:27PM +0000, Robin Murphy wrote:
> > But you could make an argument that a trusted device won't DMA to
> > shared memory, ie it would SWIOTLB to private memory if that is
> > required.
> 
> I don't think we can assume that any arbitrary trusted device is *never*
> going to want to access shared memory in the Realm IPA space,

Well, I can say it isn't supported with the DMA API we have today, so
that's not *never* but at least for the present moment assuming that
only private addresses are used with DMA would be consistent with the
overall kernel capability.

Certainly I think we have use cases for mixing traffic, and someone
here is looking at what it would take to extend things to actually
make it possible to reach into arbitrary shared memory with the DMA
API..

>  and while it might technically be possible for a private SWIOTLB
> buffer to handle that, we currently only have infrastructure that
> assumes the opposite (i.e. that SWIOTLB buffers are shared for
> bouncing untrusted DMA to/from private memory). 

We also don't support T=1 devices with the current kernel either, and
the required behavior is exactly what a normal non-CC kernel does
today. Basically, SWIOTLB should not be allocating or using shared
memory with a T=1 device at all, and I think that is a important thing
to have in the code for security.

Anyhow, I'm just saying either you keep the limit as we have now or if
the limit is relaxed for T=1 then it would make sense to fixup SWIOTLB
to do traditional bouncing to avoid high (shared) addresses.

> Thus for now, saying we can only promise to support DMA if the
> device can access the whole IPA space itself is accurate.

Right, that is where things are right now, and I don't think we should
move away from those code limitations unless there are mitigations
like bouncing..

> > Otherwise these two limitations will exclude huge numbers of real
> > devices from working with ARM CCA at all.
> 
> Pretty sure the dependency on TDISP wins in that regard ;)

You can use existing T=0 devices without TDISP

And bolting a TDISP capable PCI IP onto a device with an addressing
limit probably isn't going to fix the addressing limit. :(

> However, assuming that Realms and RMMs might eventually come up with their
> own attestation mechanisms for on-chip non-PCIe devices (and such devices
> continue to have crippled DMA capabilities) 

The fabric isn't the only issue here, and even "PCIe" appearing
devices don't necessarily run over real-PCIe and may have limited
fabrics.

There are enough important devices out there that have internal
limitations, like registers and data structures that just cannot store
the full 64 bit address space. HW folks have a big $$ incentive
to take shortcuts like this..

> then the fact is still that DA requires an SMMU for S2, so at worst
> there should always be the possibility for an RMM to offer S1 SMMU
> support to the Realm, we're just not there yet.

Having a S1 would help a T=1 device, but it doesn't do anything for
the T=0 devices.

The other answer is to expect the VMM to limit the IPA size so that
the IO devices can reach the full address space.

Jason
