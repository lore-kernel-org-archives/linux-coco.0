Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA447606D
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116900; cv=none; b=CsnGRDm3Anf+O72uDafAF7VkPUxNdQtoc5GnQJcvr6xwv5bEVMZPqjP2ryV/t+G3J3s3reSu/qFyKjCi7uNFru8DnghV2n9f30i+LLxTFSh/X55QRrM83afoq1ipoahglVrYhsH0Dg47oybEF8XlIA18ObOL9etmV4PIdFRnmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116900; c=relaxed/simple;
	bh=7a7AysVuynNFe1lOeN952FQuu+x6NVHG3FmBrbLqGgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFa4ySmSQnBK94xvmsaoD+rshfZ4sdqiegujqKZI93xM3rs3TXRlD3ZTcD/kpdHJQvgIufVN38B++yeZcIkrPLqYg2OxyzYDX0lNN5HoNV+pTwuXt9u1xUUWROmNsx+9VUWrqm7JvX8l5f/2D5Hm77vQKf7KgOUenlqH0zTtxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SKfHPEq2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SKfHPEq2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69fec8b4638so13956a12.0
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786116897; x=1786721697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Az5wp+kAsSbtOjG5rv8pQmucG2yE4e6DGCCgwM57rEM=;
        b=SKfHPEq2yfg6R+ejgn+BfxknOE1lQl5WhKDitPGgDiL1DWchH+CK7rvzQkzIJdUsnc
         yHHI4h6M18YowmROwqv+zWwKwILwkC2igrblII8Jk546BgXGVuhS1Bg3Ab8AQmUcsx5I
         eLXZlBetM7oj+pxA6liHdvL1/q7ERZjEeCSaLO2l/NwB7ikrY209XUXQt4jQTKroFrU1
         qGm4TDi4KvGNJr7MzIzwNrBuZK/Hzu/4xi/IVvcJybLFrdE8z2ZXZwyQmUof959RJgIW
         CxCTYqWfj2mK3HmwvdcBEUj1UC5+z+wgqpbNdqPsYQXuQ8fY5nynEk9fPYQDb5vEQerg
         FpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116897; x=1786721697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az5wp+kAsSbtOjG5rv8pQmucG2yE4e6DGCCgwM57rEM=;
        b=D9yeYPhO9A2RXJEl/37ThHdCwe3L9TDRvjRrSvheOD+48L3Sq99qQxCzlWmkUv04T2
         u7N3W3gVRDU3teSYcLA+XqFHqC/ZTL1NvowgS1VynTp4Ut0vNleZ02hIpmT58u2ITpCS
         s6lu0hBXryN8RNElQk8Wu0vKITGhZlyUch5QoOPFUSOZmbMH1Ww/dbxpBHgFmLJqIXCA
         QoKw+hp4Hor5qhFdNMYSX/RUiCofZ3EYz9TiMDkA7cE0HCsMfn568cNjmM1yQn5zd0m0
         X/L2gp9J8n4GTOgpgWbD/zZ9t4eyPNTdUvBIthQmtrqqGhEA9RE5Uyt2pAIc9VNLp0dX
         ub7w==
X-Forwarded-Encrypted: i=1; AHgh+RrnyaCcoGmvpRXoWSmId1aKW3luJwklixg5+QMj0hz7JW5FskQ5GvKUAoYPwzvjgiYS4PK56YOBRBt+@lists.linux.dev
X-Gm-Message-State: AOJu0YwFWKhjym73zB6nzE5tkacwlxQkSXu4WbIyGgHfcEA6gLQq59M1
	16RnJyKiCrrLDVpjASjwVxjpLkPz3AX0RHNQq7e6fgbBXmkHcgyWrBBEezdrY3atHA==
X-Gm-Gg: AR+sD107xHWsbcS2/7jF0lgdz+sIOBCjXQgEtGnHTZR5xBeSpF130BG3e79SDVt4bc9
	93Hw2oWellnmZI07oqkWM7pidg+1KRn/L49OmDXsQ8nfoIdAFQCVnJHyfTsATyilW/+Sb23SkeZ
	LClcTGNo+wKNuMdRsJ7ortgGK3RdT3vtYiTORLRMXYnnBzhXDNnzM+rucK99bxeGd8dUdu/oLu8
	xFFyT0H04l2+wTM8N/xVkx18q0mZOQkxzBgy+3j7UXg9tMdRv2WIMpbKilGUUjRRYR1RUKk2TrD
	WTZcm/Eh7WJJ7Kal2fDqtL/wFAytBnWYV2v65uQSKfUZxOTEhN9xlODVAzNKYXsSyt8Gb2OYvdt
	LScfe4vNXPNSQy7sUR9sFvR5sRXnHrEdwh9kONNYgXLuV+/RrjB1tY0AFv59wxOOyJifkBjH94X
	7+tWxZsqPe462wSAGxCcuXBr6+KdSMED0RIFaM6mhxVY+XGIEjG0Vj8D5eO3VstGjGJEGsay/55
	Hd9XHQsoNxVu7GGGupfJ4uL5ie2fg==
X-Received: by 2002:a05:6402:65a:b0:6a1:f088:9486 with SMTP id 4fb4d7f45d1cf-6a1f088972amr16113a12.4.1786116896722;
        Fri, 07 Aug 2026 08:34:56 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7d48f8dsm708475a12.17.2026.08.07.08.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:34:55 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:34:47 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <anX7F7dnKOtAOIIe@google.com>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807135810.GA200537@ziepe.ca>

On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> 
> > > I was under the impression that there is a possibility of using swiotlb
> > > instead of restricted-dma-pool with pKVM.
> > 
> > Yes, that patch enables swiotlb as a possibility for protected guests
> > but with your patch we avoid shrinking the swiotlb buffer even when
> > restricted dma pools are being used and that's a waste of memory.
> 
> I also thought we switched pkvm to use CC-like swiotlb as part of the
> alignment in this rework? Mostafa ?

Yes, now protected VMs can use the SWIOTLB for bouncing. However for
Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.

However, I do not think we should over engineer this in the code,
swiotlb can be set from the cmdline and now through Kconfig also.

Thanks,
Mostafa

> 
> > > If that is not the case, then we could change:
> > > 
> > > !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > > 
> > > to
> > > 
> > > !is_realm_world() &&
> > 
> > Perhaps, or you could just pass the swiotlb= option if the defaults don't
> > work for you. Can you give more details about the slots exhaustion you're
> > seeing under CCA?
> 
> We see badness with swiotlb too, it basically doesn't work out of the
> box if you have to use it 100% for real devices. It easily runs out
> of memory.
> 
> Auto tuning to higher levels makes sense to me, but I'd rather the
> core code handled adjusting its size to the estimated need, not arch
> code.
> 
> Jason
