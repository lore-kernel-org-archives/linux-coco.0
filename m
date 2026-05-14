Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1B42189F
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773447; cv=none; b=IAOAr9mPkT2s4NIbZKlZT/gBvnlyvXQpU32Z3tyCSAJxjQLXZ5ccerPzbJfAThjMl/2+2gjUv2mxx2xIbYM2bDEwhH4pD1/PxGjk0ycTl6/HgmVJbND/p3sMBxtN8a6bOrGLj+5EYLLDAbgLce5KXJCFZdqmOKn528BYfTaaAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773447; c=relaxed/simple;
	bh=RPg0i4XM92mQzsrFW8OMk2e1DfkKszLgHmEy1kgrd5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WARa//j3YpSVJG/bNem5AjwSpXgYk14t8xj5sEBst5KbZtjFDjsLukmjqPxmr9Qj9VeiucEZ35A0E4OKzkbwbhK7CvQL0jnOSq16Ylip0K2MoDjjF0u9IIhDIltcECrETm/xv0wHCio+fM4GjNSjtXjut5TXqF408xrpuNPUNBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvvaN1BD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvvaN1BD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so116045e9.1
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778773444; x=1779378244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lh6aFT9PQ6X1PkDdo12UH9E/whRlrKT0Rk5qkvPCSq8=;
        b=MvvaN1BDry7eeApF7bwILe1kOBxDHsYasbyWOk8fXgTmUNRU3A+c6zlhDWIHRyk03X
         IN2hWxltuwI/RAhhYdH9UKVaIeF/RsuDcKqe3XqLKYQ9MgA+MAKMQunpHaR/hFN4ZfYT
         p9VaYLZ9WE5WpAx895Qibez6V3ekBEz7vpaQiamMPNmdmyo2+dKKYaOEPdfEVDdLKmv7
         dY8KoZJdOoH60Sjqh7dtjluFazTA0wXmHs7P/vjgjPs5pUCOPg1QE2ZL2pQB+CzokRxx
         a6uQxTYuJv9P7AKIYqChwAvgf8djDYC2WkxzJ4vcKORbj13zciMT6MwVnbeluiogFGdR
         21uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773444; x=1779378244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh6aFT9PQ6X1PkDdo12UH9E/whRlrKT0Rk5qkvPCSq8=;
        b=NSmFPC95d/k/VoMwAjto6bUQcEJIQhjyZQvCeXyl/Pyk+Q6MbKQD54UNcG8rGu6jmv
         mMYiCB0HLPGcVbRm8YebWLkWhiuBNWV074T9lPGzhj3Y9ZvPelfmqZflGILZ5oef6ne/
         n/RPGl9CY7TmFDOXEwS4FdNa3Laiowxb0G2MeUkI/K6ZQSoF3sP+Rwh/OKwSA+ft0mMy
         j+xDjxZH72DFpXzhd5eWLm6sgfewh5UK206cIIf/6jmW4vE82ipxyn6qUew1cQoe6fyf
         jaEYExFiIZRA0KQtaCyBKy9TwCVule87R4YueV7DXyYExpo0kDwv4Hr0vVyeMV4YxUNc
         J9Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9KLJC2GYily1jrvI5Hsi6aoYDrVYGZqGlXXJIc41lQ1O9FC4UkJEWfs4BLkdCH2SXu2HWEwlSsITSD@lists.linux.dev
X-Gm-Message-State: AOJu0YyTELfayjVFDClBj6U/tEVCXqLGCqA3HebqA0PRU6W/O+SBvGmz
	ovQZ/lRto2djCDWQukVmZb9FeomzbILW87QF/spG2w+hQFphd7/UR3b26y/pqOwupw==
X-Gm-Gg: Acq92OGX7X74zsW7h9p5+AzF11k9BXHFMMW2SSAFS0T8WrMPO6Nje4V8UPXpWcEsfr+
	dXdDGma1SpELs4xwPDa7Xa7JF5qQLpm6NfrIQlo7DF3lNHgVOfeFtfb0RIUnhQmiMO5HmEZqdub
	qXeMlgWsGBgNXLoTWz15jQTkmWBZ34jlTYT/Tsl6F+h6t3hUyMBI1b0ylUAbh7DIVOwe9A/HQIZ
	wSnwzl+mIiHPACmHB+JC34jO/mJnjSm84Q6HWApFkKwOyMUsDPTM7mJhzSPyYgFogNhWM3LjNyj
	7EkXrEgibftEyuim3PzhmGkv37Ouf83eGRPHiDtHwYZAXP+Ki0cBDgbDdDoMAas30aCB+3tOrP0
	FI34GPQzTwmJoShDtyB+SbShDx0szojPkTE2Y2O4s/Or5ZWOeo4JN+z/jtG7sae7whnrq9clU2B
	FLDe9Kko3AR/6AI4OJ/zT9UObaEsWs20RIlxwfe41ysFgU0Wkdv/+mPf4ef9br44POv0E=
X-Received: by 2002:a05:600c:c04b:10b0:48a:5d95:d33e with SMTP id 5b1f17b1804b1-48fd6e10247mr915845e9.6.1778773444106;
        Thu, 14 May 2026 08:44:04 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm7842670f8f.25.2026.05.14.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:44:03 -0700 (PDT)
Date: Thu, 14 May 2026 15:43:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <agXtv-Wsun82SRmf@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <20260514143733.GB7702@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514143733.GB7702@ziepe.ca>

On Thu, May 14, 2026 at 11:37:33AM -0300, Jason Gunthorpe wrote:
> On Thu, May 14, 2026 at 06:18:05PM +0530, Aneesh Kumar K.V wrote:
> > > There is no problem with non-protected guests as they don't use memory
> > > encryption, my initial thought was that th encrpyted/decrypted is
> > > per-pool property which is decided by FW (device-tree).
> > 
> > What I meant was that we need a generic way to identify a pKVM guest, so
> > that we can use it in the conditional above.
> 
> If I understood Mostafa's remarks I think different devices in the
> guest need shared/decrypted and some don't? Ie a virtio hypervisor
> device needs shared while a real PCI device doesn't? Is that right?

In upstream, device passthrough is not supported, but that case is
supported in Android and we plan to upstream it (it currently
depends on the SMMUv3 series first)

> 
> In CC terms that would be a mixture of T=0 and T=1 devices hardwired
> and signaled by firwmare..
> 
> Ideally we'd have a flow where if the arch precreates a swiotlb pool
> with special parameters this overrides all other decision making. Then
> this series is about making CC NOT use that flow... ??

Yes, I believe that will be needed, we do this at android by a per-pool
property added in the device tree.

Thanks,
Mostafa

> 
> Jason
