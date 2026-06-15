Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0983E5A10
	for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525383; cv=none; b=CnouwOf6vqfGz0ZOFRXfG7U9D6w/sG/GSWgukm+w95AiokuzKcgyrPMNnca+juVBX8F8ieYxgngx10b/x47EhDOCSPi5ts+7Al8P30tsaFtnoTRdElzikgCxM0mK9MdiSD8LF0yYHXwskleyk1zU1gq4Q4YZUC07wodwPsFKuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525383; c=relaxed/simple;
	bh=NhOb8NqBxbG/Cu+c+JkZK43xUZGy405b0MyExjd14Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGy9URC1XyQDr3ZaNVt5ha3DIOMqXsY0JJhuYwlBgQc5I5dVob9D67typOK9WAyTryjhj3O6ROsR5GfYk5NAChHY3wRIo3ZhjuM5VgkwDAnM+eurmpI3wFQk0KxJeTxgc1RBu7xRtePGbWofE7IAtHyu46UviN37tpq9sUISV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=pBQ0fkuP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="pBQ0fkuP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9df31840so26587576d6.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781525381; x=1782130181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOdMIsFz2F8FrAy6a0jOSLjcHU/RXuOpv1/VNxSWE8o=;
        b=pBQ0fkuPuLZI7xK57+5g0uqsHW2hpAfG3GMpMXSNb+ThBDQVo9cZV1Y5y5sKvBmw1U
         7vWyIvq5aaum4JAJr0YC9gvfM76Pbpignm0+ietBWlq3SmHcfbBTIRB8sAPYRZkAgS9i
         zY9UVK6OOOanMZpfwqhYW4loSNpZK6XCQw8s5DShO8tnhPa3MunQ4Adw//qm3XVI6e5U
         ax9ZV/26aUV588QGakycf8moGjZXSmK2b2tl/LHvJLtHfPkXgGzVW6pFfrYzc1uiH3UG
         lLX75lJMq0qm3IS+h+MoZ8O35eKREz+0YMVarm2JpdOXeECFNt2OSKy4MjWuawg5Gb8g
         lyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525381; x=1782130181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOdMIsFz2F8FrAy6a0jOSLjcHU/RXuOpv1/VNxSWE8o=;
        b=UO+UGeUoNmpnB0H0df6hWLUjqMyfmE0pYaYeaDNAuhplOZlIe/91VNqxUMWGVxPp/+
         jUh/1EBuYzGGt0OyfyE05JDgMvKry24uPA6jc19XLioofY12oSrPq0zBP0FpT1kNF/GY
         mFzIpA617+S2LvKsuUY3z36txqjIBFKCkm0TJFFxHGw/8zlyH6c+W8IQIVcRckP5JXtW
         dCdRvWyLoferZIzJDV529exBmRh1qcjZ57fj0o4ZSNVApm1Fj/y0L/goPXPlqLtvykEI
         ox8ujP8h5qDjsaz9HzJpgD7tZqDpwupxmNAm7vrF1O8ohvU50l+RAZVblrOOsuVbkNlE
         SuTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ea2mgRx81FA+PZgnK0OGo8cwHcjmRMcFFtjgudeNvS1TTgq8SvJadNKcnoJdro/OjB3WJQAP1fXxf@lists.linux.dev
X-Gm-Message-State: AOJu0YxC7+5gRIDNxfM1hbzT09ZS/GuB0B/2CwdFz2H8aSMJNgRosUZs
	H2LMbbQPQAdOThV4LMOzdAGwUQIO0WNNuMqgEuVGoIFbgCQyLboyHWL0fH8rqAeDfMc=
X-Gm-Gg: Acq92OFrprE9V/LsQUm0CGxSwmxB4hZFVuj8ofuGu1AWP9ZpjDGKoWXBIqcmRw8Y3c5
	Tk2MVR0p+rWiUUEDztmKO2oxLLI5jhDflGlBqb72NG3KHIA/BuJjbaURsNjeskxqM7nPkWITElq
	ZWgkdAIR2Ic+BhbkkojZwrgHgxtDlX2TgC53+99W66Gqa56K6ogbGQnzAm6fFg7nCVCqKbjVU2Y
	c4KsY3AVthm8fx5g7g0Ec0bhdStCizC0hf5Wbqv3/Mw3qmrP4EHRHKOWCrH64ouAJiU2wPUOQD3
	pzzbAb6B1eZVcR1hWZJJCi/aLc+UUNqbVq0h5Vrj8xucq+srmhGjXm7gw64BjoSv2D6toDr/2UZ
	bNRqDws/EWcSyFfAMRwEFaBUfDV+athE1kQhdpe/992RJ7zUPARCJJt3B9OfWLOmbSr/AawjUtq
	NZfUgkGdYB1wxcxOzZB5j7w4Dsd/WVM+6XNh56uIzjBcnOQa9+SZRRLMH+KSU6Pz+u4XgZjCaFU
	CYmcw==
X-Received: by 2002:a05:620a:bce:b0:915:8f08:5fa7 with SMTP id af79cd13be357-9161bf92252mr2134995585a.52.1781525380729;
        Mon, 15 Jun 2026 05:09:40 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f05fe7sm1176650485a.12.2026.06.15.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:09:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZ68I-0000000DLwG-2JkO;
	Mon, 15 Jun 2026 09:09:38 -0300
Date: Mon, 15 Jun 2026 09:09:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Kameron Carr <kameroncarr@linux.microsoft.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"urezki@gmail.com" <urezki@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <20260615120938.GR1066031@ziepe.ca>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
 <20260611114954.GC1066031@ziepe.ca>
 <aixGqCqKkQeDfUST@arm.com>
 <20260612181807.GP1066031@ziepe.ca>
 <SN6PR02MB4157EC032AD55D182FBC1318D4182@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157EC032AD55D182FBC1318D4182@SN6PR02MB4157.namprd02.prod.outlook.com>

On Fri, Jun 12, 2026 at 07:06:00PM +0000, Michael Kelley wrote:

> > I thought arches are either preserving the memory content or zeroing
> > it, you are saying some arch leaves it as garbage? I'd argue that's an
> > arch bug and they should clear it in their path.
> 
> AMD SEV-SNP leaves the memory contents as garbage after an encryption
> or decryption state change. On the flip side, my understanding has been
> that TDX zeroes the memory (or at least has an option to do so) after
> such a state change, though a couple of AI chats say TDX also leaves
> garbage. To be sure, I'd have to run an experiment to check in a TDX
> guest on Hyper-V.

So there are many bugs then if the pre-zero is lost and you have to
zero it again. Even swiotlb doesn't reliably zero it's pools in the
right order under these rules, though alloc coherent does get it
right at least.

IMHO this is too sketchy to be usable and optimizing for AMD is not
the right call, IMHO.

> > Otherwise this sharp edge is not documented and we have many other
> > places getting it wrong, eg system_heap_allocate() doesn't re-zero the
> > memory after decrypting it.
> 
> In the Hyper-V code that uses set_memory_decrypted()/encrypted(),
> there's always an explicit call to set the memory to zero afterwards.

Good for it, maybe next time improve the APIs :(

Even more compelling that hyper-v should be using the dma api..

Jason
