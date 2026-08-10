Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380F3CB551
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367302; cv=none; b=K/hRC6VQ9f0JX6UQzIPOTKE0KJWMl35luilm2cu7osCQnICsAQQk6qlOuINoOp24PSCzAJ7ALGe1QJfqkj+oqKXI//g5Q1C6+R4QTIlXj2TWs7jhp79UC9QTKvwcY3zdCB1FJOoK0IB/uEnQCI9w/jIld5T/0bbXU9YbEUA42Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367302; c=relaxed/simple;
	bh=fYoOLYp8STPeqtUEMMg1V9r97/aMbQKiFeOjtdj7QMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSVsmFoJXFEgeLCpRZ1mgJwga19sQPj5c3QbPtgeFneSJc+EGVTeZeaQZKsoxF7viRNvILNCUUFQwiF89zTgKOYPTuziwCccBqerpVJFFhqYg6HLgTQfkghI7nkfhQhFrboiqaui9/2Bhp42gVqqhHo5wlhVT1Ll6voUZOXujFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PjsVk64H; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PjsVk64H"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c1372f84dso11757531cf.2
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786367299; x=1786972099; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTDI6EKrZhHzu91ABEa/3hYoH7aGPcaJaVd/MJRw0Ok=;
        b=PjsVk64HrxP8Eb7lIQhNl/HbADqZ4xL/SqQsi29NgHoFCO92FMMPYyTvEF66FHOTbP
         dkZ7j/jFl4L/bq5sAXr02sIH+0UdGtl1lGN9XZsgQaXMXkZ70IBH8yVrAFgQhEZyDPli
         ZJWkh3qbOvL8gSV31fUFL4sdFMUkptKE/A55np/R05gejYyk1FPTY9u9OyfjXnTxe7ig
         rhh9Rjm8qi2O7BvA88O890gn2duOmKrARVODG90bXgO5luj7K92BSX1yQehcx8i1HOEM
         jG5vx2jr93KaM8Gi2tQ2ddHj6yG5u8aDn/cxKiDUigNjy0wdbkdH11mc8F6tqUzm3+kd
         xpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367299; x=1786972099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTDI6EKrZhHzu91ABEa/3hYoH7aGPcaJaVd/MJRw0Ok=;
        b=Ry2VW1fdmKj7lOcxlExds2aFi4LtHRY+JvFTQT+sm00A59pZAECtiwBvNyoDwu2L8u
         b+CjcI97/Ea7fmQpxDRsIMwkK3NimqRILk50IcfBP8OJj5vKCiKJRRXZCl2a1g90iN1y
         dvSt0f+15jzTCUhfYb3GvPlpvko6oA/A+6Sa+R33Ru3zBOlTsYqgzL8a2MnqiDBwokrP
         6TZvFxye6s22sPA0Vs7BA3bQIqCtqY1XbmdMdB4WidXs1f0ivFvbs6OaKzW6iJomMu2K
         j21N4UUyz3W/4AQNIe4+XexWgEK/CEsLED4U6k++HHA0eYBo3czJGOBHAXuxS+XdckRR
         x/PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcvRlQ8J7muldoW0mWIzibszS+3MA1IcjsTy/cNdCpm8AU069bj1LCnA1B6yQnA/kFdp+kPGmkSVG4@lists.linux.dev
X-Gm-Message-State: AOJu0YwfneJeCncdxvtkwTzFAbkpjdzneEcYCDM8fW/ITmoj6aJyC071
	DrLpRWBXzKUvx3kt7ue5vQRN6lc98rfEeOuEk2UILULGlOwdyMRvrrKYB9mG0Tgj9Qo=
X-Gm-Gg: AR+sD12eBadrNM/GlH/qfzM66/0iLkpi3ei/++yNOEOX2tLMoB4r7lslQ7lHUk+tKgx
	95CeC1C7M4AzRA7nZBtSmhEgFcc9T5eNmGGWTWlkWEhymEiWMQ/wjsGdhMQb7xaZWF9//0u3OA/
	wT2ffU62DJIS3sLlyhGKenp77lFTjLwvSxLpPYuNJ7Kgk5s1sPzmtHTL539GyIA87XLyQkkJcWL
	d719mT0MzHNbH3xxxi3Hxx311iXI/wkPEXaszZnt0aF/jNxqEg7uTZR6UdSZTsoCmH8mrMOZKK5
	HpH2WYbAdlkFdTkjGfbgu4Xy/PPXIsDdq8+EhwT1yTyYeqGZFSG+Qy0ZMR1kzuWMm7HFIKjaHI0
	GPPJOBofxxfJiJMzNGL9PGOij2lPKvq/Wqp93NYOT7urxSNihSQ0J6iB0B/RQiFPEV7MiSas6/1
	uMEK4AW0hDkKL7MgjUkSf4G83lSwUMZhW/4zu0PQ==
X-Received: by 2002:ac8:574f:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52d20961711mr224570371cf.15.1786367299519;
        Mon, 10 Aug 2026 06:08:19 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d163c1aefsm70838551cf.12.2026.08.10.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:08:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wtPjm-000000022LS-0EaO;
	Mon, 10 Aug 2026 10:08:18 -0300
Date: Mon, 10 Aug 2026 10:08:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20260810130818.GN200537@ziepe.ca>
References: <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
 <CGME20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df@eucas1p1.samsung.com>
 <20260807182017.GH200537@ziepe.ca>
 <7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
 <yq5av79iiard.fsf@kernel.org>
 <anml6lLRERm1Iv-_@willie-the-truck>
 <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
 <anm6K2umtx4iKnyZ@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anm6K2umtx4iKnyZ@willie-the-truck>

On Mon, Aug 10, 2026 at 12:46:51PM +0100, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 01:37:11PM +0200, Marek Szyprowski wrote:
> > On 10.08.2026 12:20, Will Deacon wrote:
> > > On Mon, Aug 10, 2026 at 02:59:42PM +0530, Aneesh Kumar K.V wrote:
> > >> Marek Szyprowski <m.szyprowski@samsung.com> writes:
> > >>
> > >>> On 07.08.2026 20:20, Jason Gunthorpe wrote:
> > >>>> On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:
> > >>>>> But the whole thing is best effort anyway, the kernel picks
> > >>>>> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> > >>>>> how many devices or how much DMA they do.
> > >>>>> SWIOTLB memory is wasted if unused so we should be careful around
> > >>>>> that as it would be the other way around and users would have to
> > >>>>> decrease it manually.
> > >>>> Yeah, it is why the arch code shouldn't really be sizing it directly,
> > >>>> it should be done in common code and, yes, we are probably going to
> > >>>> have to do something alot smarter to have the common code better
> > >>>> auto-tune this for the CC case..
> > >>> What about the $subject patch? I assume that it is still needed to
> > >>>
> > >>> restore the behavior that was altered by the "[PATCH v8 00/23]
> > >>>
> > >>> dma-mapping: Track shared DMA state through direct, pool and swiotlb
> > >>>
> > >>> paths?" patchset?
> > >>>
> > >> I would request that we pick this patch to fix the regression described
> > >> in https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/.
> > > I really don't think we need it. CCA hardware isn't exactly widespread
> > > and the KVM host side patches don't appear close to being merged.
> > 
> > Does this mean that the branch for-next/coco [1] won't go to v7.3-rc1?

Let's not make progress on guest support contingent on KVM CCA host
side patches please. I expect the CSPs will have VM instance types
available based on CCA within quarters, and Linux as a Guest should
work in those environments regardless of what KVM is doing. I don't
really expect full KVM support for years, frankly, the patchset is
massive. Even Intel and AMD don't have full KVM support yet.

People already have CCA capable HW, are already testing this stuff and
the closer upstream can get to being workable as a guest without a
mountain of OOT patches the better.

I agree the thing is not ideal, but it was merged to ARM like this a
long time ago, this patch is just fixing a small oopsie (was it a
merge conflict?) to put it back. I don't the objection.

Jason
