Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01D23B774B
	for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178599; cv=none; b=pZqf4zYQihVZi6agq4uvUXVS0Corr9/9JK5dYsA0QZNzhxJqBS2o2Ww1XEGoH3UYrNsjwec9cfJHVZLwZM0WKDmbeIEwHGrBbVTUoIkBX+G6Aq2PtL1qaYprfYdAqwepUqB95MJDaqKPKGQ2+YtNBRRmQzJbXeBOxwkNMPWS6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178599; c=relaxed/simple;
	bh=lecRcnS3vUJjK0l9Kw8UQNPdJUmzKu/EO7NFXV7ojG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnXZjrxS0h4rvv7JzwWCpF3oPLHcyrXSbUKRGSNtHkNW6TP06WVtP2S7Fs8m8bBwTUP70QBadSqmefOL5vXSY4kRoFNZfOn3JF9II2+Vqm3Yh0bTiKxgSlYloA5C7mILEVhyU5DOfaNy9SKMZU0PJPWjLdmDMu3/DMNyfGR1IbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EcJ8E8CD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EcJ8E8CD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9156b74006aso566648785a.0
        for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781178597; x=1781783397; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNgsH2tvtJn5m59hVAt9rmEgOo4VHkNi7fOm5lsoIhI=;
        b=EcJ8E8CDcovKPVqkSBSuV8kt4ypzVb8rxLxM0QkCH7EHYc6BSpdWqCGMeGLudnmy1q
         Gk44gy4UPKvhC6AdnzoLQgi3yrH7qnrsRltLUHDX0zBKkzSYu+6y9NXmrrNnLtcTNHsW
         oK05nE8tAN9CDPHef8H9Y2CY+Sq1U0Zfklu/hvbFklxUlLAdrdMWbR50woUZkitiUBT+
         PBRR+4i4RRoFzRjlmrIBaqqQ3ovFuEhgqgCfmxNwqi34wZEqKx8HkwYvYtSf492Xtgs9
         +nii34PidOFR7S9hKPT9PrB5gXj9SQ/ynlIIprfeWR7CnLeHmIVolEvURZ9YO7/9wCXg
         Bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178597; x=1781783397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNgsH2tvtJn5m59hVAt9rmEgOo4VHkNi7fOm5lsoIhI=;
        b=coeuE3uLFoiULuZVSuOh3hE8Hu8RUAVJhMXwF47/or33kdNWFrHj12UCAHfF7oaDht
         ktZnYFgfOgS9wVEY2bzeZUn2L5A0o+fTRWgcH08Iwob8Psw5zSZvBKAa8bdsqFGF7hNK
         YT/72WhlLNyQx3RkJftQNjahyQNn+UlPIHOeHN0EQs+++oWiBcHYjub4DkoALhx8lFeU
         XbyiSlnH7ydrt/BoWWw5uZ4LEu7Kf6IBZnNv4eHa3o3oVpPnWa7mkboiMA41mNOtMKxr
         2ZMEFeDRB+DOXAy3uHVa58j43zUO2maB6YvEUdNFTuvGgr/zpLhsfkYOuPGAcLZMCuFv
         EsTw==
X-Forwarded-Encrypted: i=1; AFNElJ9aD+iie7OAsxS1LNMm+2zZ2m6B+cEsx2gwj/n8YayX3C4HeL519Y2GidLeXIj40O4gzy5Je3XjWikr@lists.linux.dev
X-Gm-Message-State: AOJu0YwstukCZquJT3FnZUwQ35YVz0pYLuph3JhQMQ7zArmVmIhpwIii
	59uI/7eFWKSbBsp9t6ey/4Ys1a9kbzmWp/J5WbtSIooBqW7KAyFpD38/NaYd/f1s8jk=
X-Gm-Gg: Acq92OGLzaffMqebg/UKHZ5HatwuHJbZpxOzjiAgErOfdCmJFT1+NKt0MWwldmdJb5V
	q5ScC98hTk7rEjYh/yUdJUVSXssVKBToyvHiO8ZCouGpRcb/Yub+rQWQMeZLwVR/v1/aBvf3WH+
	f2BfNgpHpDBD5LrctxW3hA5LEXPEczcTEGgxd2gOtRwpuG27ThK2yC3+xzFOIvrL+sN9m7YHllU
	SgEP//izzkAget2IU2k3cNiaWk9dLPXSW/6q5GEWGsFXfnxDzd4IOFrHVqBLvkQ8tmckjhliEPJ
	dstUg54JldueW6PeCr2qAWI8WTlcHdb2TxkgqEpxIf3wDqryZxxmkUl862y6hlvyPU/32fXSKn9
	EYAiF7SGjzCTM5jTUCfPXWvNz3QE4o9xe8LmslxPAsnpKdex+DrQU5uOvmpLEUGYYG4Zf7p96In
	bfoTN7WCQUeWpkL6GrrQOqP+TQ/yn+phnYbpOastJLe7i1FduN6qeVjUgyo9TZHOz2W4JaavjEy
	H3RVDmMn2zPBPeNURH2LVONfYQ=
X-Received: by 2002:a05:620a:1a12:b0:915:87ad:d5b1 with SMTP id af79cd13be357-9160ab34661mr372192085a.15.1781178596642;
        Thu, 11 Jun 2026 04:49:56 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160acab48csm167602085a.16.2026.06.11.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:49:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wXdv0-00000005gTA-3lYL;
	Thu, 11 Jun 2026 08:49:54 -0300
Date: Thu, 11 Jun 2026 08:49:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <20260611114954.GC1066031@ziepe.ca>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibhnnDFQTHWMEFe@arm.com>

On Mon, Jun 08, 2026 at 04:37:02PM +0100, Catalin Marinas wrote:
> > +/**
> > + * vzalloc_decrypted - allocate zeroed virtually contiguous decrypted memory
> > + * @size:    allocation size
> > + *
> > + * Like vmalloc_decrypted(), but the memory is set to zero.
> > + *
> > + * Return: pointer to the allocated memory or %NULL on error
> > + */
> > +void *vzalloc_decrypted_noprof(unsigned long size)
> > +{
> > +	void *addr;
> > +
> > +	addr = __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
> > +					   GFP_KERNEL,
> > +					   pgprot_decrypted(PAGE_KERNEL),
> > +					   VM_DECRYPTED, NUMA_NO_NODE,
> > +					   __builtin_return_address(0));
> > +	if (addr)
> > +		memset(addr, 0, size);
> 
> Talking to Suzuki, the small window between set_memory_decrypted() and
> memset() potentially exposing stale data is safe, at least for Arm CCA
> as the memory would be scrubbed (there are other places in the kernel
> where we do something similar). I assume that's also the case for other
> architectures, although not sure what pKVM does.

It seems like a poor practice though, this should probably be
re-organized to use __GFP_ZERO so things are ordered sensibly.

But what is the purpose of this? I guess some hyperv thing - but
shouldn't we have a more structured way to "DMA map" things for the
hypervisor instead of stuff like this? Why can't you use
dma_alloc_coherent() which actually gives you an address that is
sensible to pass to the hypervisor?

Jason
