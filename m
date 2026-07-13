Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99009437106
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951002; cv=none; b=Rjl4/i2Q/PuKqvw1nZClHie8RvAhSwNt1iYfdsLgWod+6UD7+yoZ/4TkLbqtEvlenJrFGfQHrrvAY56FMH1FzhFMBv1EX3FPLbgDFzfi7cqENuFjFqRy0YaTNXKWwyGCTGt5pnwoEEQIcMc6LLGWK7SHVvQkCmM/bjJQ9EVifZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951002; c=relaxed/simple;
	bh=9KihY4IsvKVp0Oht8qbc03FAQfSZWEfFvdyOwhTMNR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTywzvqRs7RNj6Mm25nMLAw2xqazAX1V9NT9Vm64Qvc3VLwNBbfzT74Ws96S+YviiK3HdICwRFW2+xbWknSIL0rf6SNKB9vZ7shUSFURZNSccGqd0S4E+lSRa9iwbXy3xsp9EJIKpGplXgUSgEByItz/R2rPok/adS35SJcfOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=eKsYPFfA; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eKsYPFfA"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so26953286d6.1
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783951000; x=1784555800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dThHBkWDs48b/2hz2YL35z2V9VnPq+MKY/40ZoZ5a/U=;
        b=eKsYPFfAbTFJ1vUVyx78LXhQHpeJIUe3yG7M/G0E8S0cjUBEaKzZs3g3v6Y8bENRCx
         xYI2vFLgYRMs8tiJbLrW0fJuFqmImRL0cRCWOtpG3V0S2d1DkJTmTTbzFsldpVGEMhO3
         iXPe+U7aL1hfhS2Gb6he0REB4ZPngFmo7SKpBOTF0D57myvPbBfK7k4ZkBIlbpQYF9Np
         MytDvKuaspmHcmiUa8hnTAh60ID8cVH7IwyCyJcMA9bSVwXwPllzTWuddmq0NKtQMff4
         o0Xipp+q7abBp5ss92jJh35RNRRNPfYxr47rWklI5HDPuqtZWxRp9ZjG63ApCIJUmC74
         O3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951000; x=1784555800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dThHBkWDs48b/2hz2YL35z2V9VnPq+MKY/40ZoZ5a/U=;
        b=N98keNrK3N1AjkdvgJNjbyI11fx66s0DAOxoE3St+lsyITqcvySvba1wLlgVaOXbp2
         GbYZbQYGSLnrvdPBSOBDgONBwTn+WMejBGU4KssySgENMmNON0SH1XGG7Y2K64DW+oIw
         /72t9hd+mtJCSL2ZAqtK/lTZ2gWTdrxfHSwSJT05iq7SSI1Q+0lqIE+4stc7O1BVFXuk
         QRPNtjT4R0L/6RZeyspigHivn9cSbCdYSoe3fkhspYimuX4li4PMteso0SkJCy2ldY9k
         6zHUhajHv9Ca1GD/PyvLvzlji0tSqAiaMcFJwXwBbH6951HNymsFeCdhVgBce060K1lM
         Gt4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5b5I3/A3yq1StYBHWaIhZiYJVq/ev1xegLlhieMQNhDP3MHOd1bo1G9wldEw6nDjj5mVpDvfDNvXD@lists.linux.dev
X-Gm-Message-State: AOJu0YzMci9QbODBWc7N/tj9E89yuFSU4cAdJR9ls4GduD5k8N2eROnH
	clpa0y2Mlfp33aOSAD6rc2hIamGhBJ26mDs2CkZpDY6ZuHVBzpJP7cG2QWgGStz5KHY=
X-Gm-Gg: AfdE7cmTXXL8nRu/U0YorazRTx6/JGgC8PGPCop6TiKgDGKwyQa+TFrS4aPCNDo5yxR
	7vzRgf/B4vpx3UhuBVNjMztwJu0fJSWka0YS6PVY6MiKFVs0zGfAZMvm/ZGpaBTMk7wnN4KhehT
	c2oKR8sgLrIIUeUF9csrhxmCw6XJ7mFH603zrK7+1e6iEXjMXIIHopebe52WquZU6RfHfeYeOIs
	KnR6jwm31Lkdgl8jkXRlBNVAQctdZbGdkGkhV7zTK30K8FEm8p3HMGbWULmhHAvm20kUGoluTU6
	hAodgGvfU4PKHDIopRIKuOaRtg2qUqkkbfTSM3sSrpuYOB6X0L0aJpiarKYaMRcn2F6mdcg7a31
	ljO52Ty2acPVBy6Gxx7ZOBKJ7KmYFe9Aq1ZOt4MfUtgjPzDe6YZ1ddXSPvq8z
X-Received: by 2002:a05:6214:da9:b0:8ee:756a:f1d3 with SMTP id 6a1803df08f44-903ffc638e5mr98221496d6.28.1783950999687;
        Mon, 13 Jul 2026 06:56:39 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd81f4bbdsm126704796d6.36.2026.07.13.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:56:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjH9C-0000000DL9o-26N7;
	Mon, 13 Jul 2026 10:56:38 -0300
Date: Mon, 13 Jul 2026 10:56:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260713135638.GB3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
 <20260709181336.GM118978@ziepe.ca>
 <yq5ajyr3h106.fsf@kernel.org>
 <20260710161945.GO118978@ziepe.ca>
 <yq5atsq6hdaa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsq6hdaa.fsf@kernel.org>

On Sat, Jul 11, 2026 at 12:39:49AM +0530, Aneesh Kumar K.V wrote:

> > But if you really want to it should be
> > cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) *only* and get rid of the wrong
> > force_dma_unencrypted().
> >
> 
> Ok, I will update the changes to so we preserve the previous behaviour
> for SME?
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		/*
> 		 * For host memory encryption treat MMIO memory as shared
> 		 */
> 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
> 			attrs |= DMA_ATTR_CC_SHARED;
> 	}

I'm OK with this, with the expectation we should aim to remove it when
fixing the callers.

> > But IMHO, I'd rather this series treat ATTR_MMIO as private MMIO and
> > ATTR_MMIO|CC_SHARED as shared MMIO and that's the right and correct
> > thing for the DMA API.
> >
> 
> If you think the rest of the series is ready for upstream, could you
> please ack it so it can be picked up for the next merge window? I'll
> repost v8, rebased on top of the pKVM topic branch.

Yeah

Jason
