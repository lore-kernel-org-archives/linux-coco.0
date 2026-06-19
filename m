Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F933750CF
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871714; cv=none; b=KIRwOIwR3TmMPHvCmBrOL5x7KLW/knoI2koizEYrqjftzflPT5Fq/6zX76cxAfIXBbuATwrMfgzMydXUv1rSRnTUHdAEv8Mxlk9vr7UZNRSl/tB5Ytw7jxgI9VZICwTZ8dYAeK1CtBw2c4nr9NtY5knzVQVqqTBaHKczDJFbTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871714; c=relaxed/simple;
	bh=bExiT/WO2dhEcZ1qca0P3/dM95QJoJRN/ZwhIblcPaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq57jkaTC93u4QsqjueEHAvfYUbIiVBvx+EkO9UGV42LVTc8jDG4LJs1LxZ4ERllld6kGEVxQEXKvZHCvGluBRD8ct9upYcZ6WfZFrKbgrCd9/qq3JQ6RFvG0LfthxkvDDqS19FWWjUR2TYCPXYjfeQBHPzp3x//Wo2s4gYLNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EZYMjnRM; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EZYMjnRM"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-920d6e3963fso53493385a.3
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781871710; x=1782476510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9LPBfHeyyLdgfb3oWsJJs9sVnnCU9Plv3UTJaVJh/Q=;
        b=EZYMjnRMzkFnTl1a6nhEwDEgdxckm0rnT5aPKLaOXQWLKOPLMngfHiXbpuazGJZTLi
         bWgqIUNrKC4gaaVzTka8CH1FY13ncy9VqVZoQu3wNiylseP22Z0xt1j5s4du3C3tpBeF
         8tiBAuL6xXc6twzb9ExVZil6vm8dVKjFL7tde0dx+Y7ucyxCHb9t+R/4E98iN2Jk1YMb
         V8eDUmbfFVtJoZJfa/zFPpChmNf0axmef4MDnIslDPJBAQO68NVU1gxzjp34QGCrm8me
         rHR8q9cNfgWYO2cnpvj9jLJH4yLorZOewfbXwPiIyMKieOutvyETR9g+jYQomGQ21b2I
         gp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871710; x=1782476510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9LPBfHeyyLdgfb3oWsJJs9sVnnCU9Plv3UTJaVJh/Q=;
        b=fDoHnEiO0uWDzFIH4RD4/kIFHbc5QNtwT/5pMu5lbMB7T5d7VovLsQL5IGDTMrdQ9x
         65oJgM2SotnFMjWs7idsFvKNiV8Zz8cAv71+SeB4gGpZUakUY7S5K/iCZPSwbIvCoCN2
         VWlbO+u/Y1ebJXrKM1hzonsHFEIovcJTtIlbNUzPjtg8kbfn2YcDrLFp4VAkZESdd04J
         237NEHSU6z1WOCtbcRqKvgj9HyVO/bESWoX7lNME+w7QeelTlkkK7pOkB3FVzv7ex7AL
         U/NI7+FfW2TJdzVx/plG2+wXo6aQuzZ5LZMPKfam/xX/PAHI51kvcZUvec0haDUPq5LV
         aMPg==
X-Forwarded-Encrypted: i=1; AFNElJ+QtUfZmLjF3PzNONK97pwowpuWNEI+sT0ngAG3ns8pEMLek25Fww8wtETuK4P2Wg4GzWKqJ2NQnlbF@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9snexaf0bsofHVZJ+04Pg7CdMcJC+8BbzzIyckG+p04YcPg2M
	endQMHXYif61w5LTR6HvSdbZxRth/gJiFmrcLAr6EKmQeSmJWsV1UjTVgBbF8158CXk=
X-Gm-Gg: AfdE7cnaVkv0vDWRmYEWvMdKMHsmyrO3c30+cuzdQ42PiuZ0Cm8xFOehA4PXq5vIvGV
	anE9XSTgkvPzsydlbC8pt2nY86QEnf+o5+/ajmqJJhuUFFjCV1DoljsIQJ5QUnQnDEOS1EMAisL
	JrK0w4ACNi7hP+EHtC2v5I/zkO6EMTMeT06hyYcItoCYbfjjdTWFnc2mqvPL6qc/PVaMKX4SDnN
	/WHj9FBpGaleZNu22juJXQoGpL2qxLmBit6Cp8CowwFYEalFUnesR6mcNY2Ks/gdsjsPsBVtLdF
	YVg299Q4FUr5+DlHfHQ5KCES1xGsiuEiFmpoc0Uu1HsMQEaAHIbJrc91G17Q5431eT52iOsVpAd
	NfPbgBdqCdYi391INE/wayj3FMzUGeVWL1bFGqZ0s0Be3+V9kqiKeUqJAOY6zqBvc/K9y82h8bn
	cFt/Xpo5XP0d4sfxnlE3qkSQVsURA6PDzB2grA99W0A2vgZ3ahw7MkQerPlwsaJMhNGw5e+wxqL
	sun8A==
X-Received: by 2002:a05:620a:4413:b0:915:1359:fc5f with SMTP id af79cd13be357-9208f835f14mr474588385a.14.1781871709844;
        Fri, 19 Jun 2026 05:21:49 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a4966577sm218949585a.34.2026.06.19.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 05:21:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1waYEG-00000004U03-2Vgj;
	Fri, 19 Jun 2026 09:21:48 -0300
Date: Fri, 19 Jun 2026 09:21:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260619122148.GL231643@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6h6enhm.fsf@kernel.org>

On Fri, Jun 19, 2026 at 01:14:13PM +0100, Aneesh Kumar K.V wrote:
> > And this is more insane logic. The right fix is to allocate the
> > swiotlb bounce from the *encrypted* pools when running on the
> > hypervisor which requires undoing this abuse of force_dma_decrypted().
> >
> 
> Agreed. If the device can do encrypted DMA and requires bouncing, it
> should bounce through encrypted pools. We don't support encrypted pools
> now and that means, we mark the option ("mem_encrypt=on iommu=pt
> swiotlb=force") not supported for now? 

?? if you don't have a CC system then the swiotlb is "encrypted"
meaning ordinary struct page system memory.

The hypervisor should not be triggering any CC special stuff here, it
is not a CC guest.

Agree we don't need to worry about swiotlb=force with a trusted device
in the GUEST for now, but it should be something to fix eventually.

Jason
