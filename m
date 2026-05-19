Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1263BCD21
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201471; cv=none; b=vDalUN2algclwOvFr2+ClJnnv3j389wfgg5fqF0+Jc5fJqR3MfXYldTwdFN9d1PCzRIfmFrwbZQTeBVCYZJ02iuVpdQyywkBD5ZwKzb8WIDMcnGqcJcLmiLP6DHXvk3Zc5TDQRLiOnAsGR792YW9aHn5iOOolL3bLCMBFonI6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201471; c=relaxed/simple;
	bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTUWlF4bOhm8Ra9pP91hZQZAUNrR3s+vKRvkO3jU/QWpoeSSx7Hq1Fl4Rkfp9pzRJuNcpPDElNQ06MzpUx6kC4ADUsyG1eB/iBZIvZXIfvJrDvhYbY3BRI/3ff262o956i+TSsRNJ8/gm8HX+ZTVQS43iCK2eYtlWxWvZDo83/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TidShZgg; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TidShZgg"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50faf8ed9c5so18442291cf.2
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779201469; x=1779806269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=;
        b=TidShZggqvjdep96YVbug7jBreMZhZg/O2tvcpDLFfKA+QrchDze2h/7EQYg1UUPEn
         Ryet4vnzIxC3mjsJc8JxUYwbsQ/xZTwL4wqtmLMY1AYAFq0KoxUQ4du6YhUWIf2Owug8
         IuyxGnY2/4IHWsolT9wsvoRAPTbqNL0yuQKgexu+TAx2cfjx6gU0KRBdZzdBniUOUcls
         svGqynswU2ThL384sUrSauavKl1fxf8v+0ye+lqDtyHbqz9uBG6AqD2lADks3JvB+usH
         riqBKaTRhOgJTs7JCz2L72/ITzimo0YqzXDnnagq+Fu4ewNnp+oRqLP8u1Eh9Uul9Yyz
         oynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201469; x=1779806269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=;
        b=ORYa3wZoNaPfG1gf6/w4NGoz75vtnboux0Y4urRUG/pvEJyp3B23HPuuqWDLn9nyhh
         mz4kkXV0cZU6tUAxVebiIOx3zMPCZTafmXQxiQ0Wo40mn1RKzcyskG/WJH9rNpbGnCvY
         OY6sS+iwi2T7zn3shNYqJJR+2NkwOxzp2asyTEGu2g4Yo/TO2quzw0M6VyNH2UDdkRUM
         exxhKpxLco1Usmn5cv+nzL6He0akwYjdWw5CI6WTuiOO9JQPjwzc3npAN1CwpMiXqN5p
         T4958WGu1Wk6+72xg6q7eCK64bVzJpVbhpNzAKom2sJGWPhyU62NLiMv9QTqWewCj3kU
         xNEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jakE7ekIECEltenr1tKr0RkT8C3nc5rVwW4T6fSmgPNXL+QUURgMrnj2d9XKEnOIv4Zr7pf5MJ9/y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/dnsMutFGAr1mkMOP3mcYr2XQW9wV1zWadK/H1oSsYBDswrCQ
	RjEw/8SKihuqZFMqcGEj6z8cSh9GCcMfdaHhgsY68PcJf1UnnhkJLWyK34gSsWKNgRc=
X-Gm-Gg: Acq92OGhtr0CVs/RoPhNewe0jIBPi1eDAS8YHs38WXKn3zoahw1O9uOgtCQ++rcLxP3
	lUEodK4CRy/w5Naz+47Evzzl/Dzdh5HJYUAuCFsxj9A889Yn0jb3kpfTRxLnxGBMptIGBsWO7jM
	kkPQvFAdZZ80Vd2dbD7C5ti9tqysWWsFhMSyi6ARdCKlNgVwKOsGoqmZajOfCu/CbT+8YbQc7Iy
	KS59w2owLc1ofUq2LmJf7fENYlK71crbkAftUWcG4XzHl8b9nLDnOeSay3BsekFUXL3HjJKqnYr
	4D8xUemgie+xABBFjhKVKUQopkLntKgOHZcS1AAeHpp2c8SvhgA6nyfBzndZ/WE0Th0Awdm8mP6
	Y0qTyrOXWADIReJIQcDv2SQuD1JQP5ITLolD7+Fjqk9DEQCdLruyjSmQBP/d2ouQdC9rlyIcU6b
	GUqX/ui/zJKWdjgY7Oa35+ab5ycdnf0FmiDhm4YL7NmQcZmFRlBjxL03P1yXZsAnW4DplN7CTBm
	hQEfCqUnKaCCiTf
X-Received: by 2002:ac8:584d:0:b0:50f:c26d:f31f with SMTP id d75a77b69052e-5165a046334mr283700431cf.19.1779201468969;
        Tue, 19 May 2026 07:37:48 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6856sm165713481cf.7.2026.05.19.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:37:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLZr-0000000F80e-38LO;
	Tue, 19 May 2026 11:37:47 -0300
Date: Tue, 19 May 2026 11:37:47 -0300
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
Message-ID: <20260519143747.GE7702@ziepe.ca>
References: <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <yq5ah5o3sdn3.fsf@kernel.org>
 <agxt7SFGT7OLMIah@google.com>
 <yq5aecj7sctv.fsf@kernel.org>
 <agxzanDBmIP54hUz@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxzanDBmIP54hUz@google.com>

On Tue, May 19, 2026 at 02:27:54PM +0000, Mostafa Saleh wrote:
> However, as I mentioned to Jason, I think with some tweaks to
> force_dma_unencrypted() we can make it work under pKVM for aligned
> memory which eliminates some of the bouncing.
> I am currently investigating that.

force_dma_unencrypted() literally means that memory passed into the
DMA API *without* DMA_ATTR_CC_SHARED cannot be DMA'd from.

It should not mean anything else. The DMA API should never decrypt
passed in memory. You always have to bounce.

Jason
