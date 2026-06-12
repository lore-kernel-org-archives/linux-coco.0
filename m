Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA373655E6
	for <linux-coco@lists.linux.dev>; Fri, 12 Jun 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288291; cv=none; b=UejKSYwQ0vzmcxrMDerakvJ4u0M8IjthVWWX7tnBGpd49tuSUrd9Rk1GMMwlbqFezf+p8lAkklxSa08uDVsDB5ruMfL50fIyGMNP7B6z2qTLzPDTX/agXVuAr2Ma0Zx63CU3aOl9uotwNDK2/vlCpnascaJadMGrWGULQVfsHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288291; c=relaxed/simple;
	bh=OU0Mhx3ElwBHVBhJupwFS5bT4WtEfl13JomknDaA7lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgC6huwQiRMKw6yz/t1ht8yO3DD/UayZ/4QilDSYSvAGcGgPtNBzp6u8rguaVH3aezVwcOhOwwdxdtCCjXEfqmob8DAwqAHTMi6mBuIHlOLPf2YOVHh33m00+rYI4mMXB3JXDOnt7TIVwsJGdyP+btc8HDJ8pSVDtHnaqzKzhOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gXGSP005; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gXGSP005"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c28cd29891so711431137.1
        for <linux-coco@lists.linux.dev>; Fri, 12 Jun 2026 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781288289; x=1781893089; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+iqIpA7z+5uzNHU9YvroEcwha8urHL7cOeSZxwXaBPs=;
        b=gXGSP005lROdRIuWaBiB9dz9LTlOAWE87m33yjUUvIW2NKfmTtisSZcsCE9eQ0m55T
         r8WTycVoOudBzs6ybYC3c6e88V30tCk6F1ME8ZTlYjxd2dDBFVl5JEtFaavgjj8RirA0
         NptFYc9EIh45eXOhb/QnNzm3E00tX2P2NLLD4YHCn6iz0wROx2e6vLRc5ZLcMVWkKYjN
         oI/2KyMrWBjjOV8dQ8Io+6/o2u87OcSWhhz104J7zoyGv9etkctvv9+YRHnv6x8hX71s
         ViEogBY6+xR/bpvAHyPCvQT6cYw/c36yCGHGkyOkjI5oRVDqi49pvDlZzPuapzCCZa3g
         wtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288289; x=1781893089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iqIpA7z+5uzNHU9YvroEcwha8urHL7cOeSZxwXaBPs=;
        b=mVsd3xwFzLu6QE+1w4J3Lv+p/DuO7isnwSdgZLEep8rQTK5cHYfqSZ7o7ZPaa+e6Tp
         BO8cKE652JQddxuc/RCoB6MV8TixZbQ4NvENLTzRRF2w9rVOWiGU5HeR47J4sScECiO8
         qeG9U2dxuU+Zdxl9NMQ3qU0YFcnSKiQdgk7nc8SLTal9eh+lDl3t/GPHrL9u9n9LECqk
         1AVBTGjmZwyBZYH6TibZ/Tylp/iRH+ZH/y64kbx8dREWZcZCSIiQAXL4B98miZcMG+sR
         iyMBG0T3phm4ubkwIdo7THH3G5P7jbMw0I/jlGQwqJrAL8XxGoqRDV2+3i7uqJ8Y0YaZ
         P4DA==
X-Forwarded-Encrypted: i=1; AFNElJ8m4I6B71s7GyzkjXzwcUaf72lTLsbFw4ZI+LlWiItR5HreQZnTSV9TEkc55jBXZKvKhzUe8CMpszC8@lists.linux.dev
X-Gm-Message-State: AOJu0YyKRYjPt8folT4IXps7QtiTZSSFg5ff5pRmE1/0ki433hmBie90
	clZILZCC+L+y2k0/NurarVx8XiE/vIYLRQPBGJsmORmEru6BXbNm81EdsJsCKhFitrPWgwG6Qvc
	MOScD
X-Gm-Gg: Acq92OHmoyUEaB5MEocQ3u2WPbDw/Ac9ynE7S89z8kq/2DhAOjnrloxFgAQHOlZ9xmy
	B48xb/ktQ1ioaiRW9lRkQ+BH56eRPFQgnlGd9V+tzgksYX8DvdICBJ4AtLmQ2eJIRavgP6VH4+H
	EW+nIwKasBijZHEZpJlkuckPxJhrxEz5THK+SZkkCakDNngTgUuVhtTu+DURV6NhA3AaL7rNMC6
	dmDW2HA9KPDh9iTkl5yUIWExT5qdyCOqJ98FSlQWQP9BUjMTBvTIUfJO63KJrJi3y72e3Z1klk6
	t2GgywIQwfexnMkEqtWZuk+s+NNlauEuvzKt2v2miJlKrf0ppB1xfE6ptCIspF1wYVxTM27lP57
	C605F1jrFX7e5r/46ij69wMyBmkF+5/apFP/9JYt7mRPd2XnMPGx1EpjLsvPzAy3DHH8KeKZ1yi
	XM3+8+sp629YAEI1D+nQlsNdeBXlPBPv5rQ+nE1rmuvSoEIZPGFPuF6tgY667d6Y7HsVL3XhyNX
	qFyAA==
X-Received: by 2002:a05:6102:5a99:b0:6d5:91f0:21b4 with SMTP id ada2fe7eead31-71e88e0e755mr3085010137.29.1781288289001;
        Fri, 12 Jun 2026 11:18:09 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm282729185a.21.2026.06.12.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:18:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wY6SF-00000008EqU-36LA;
	Fri, 12 Jun 2026 15:18:07 -0300
Date: Fri, 12 Jun 2026 15:18:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <20260612181807.GP1066031@ziepe.ca>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
 <20260611114954.GC1066031@ziepe.ca>
 <aixGqCqKkQeDfUST@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aixGqCqKkQeDfUST@arm.com>

On Fri, Jun 12, 2026 at 06:49:28PM +0100, Catalin Marinas wrote:
> On Thu, Jun 11, 2026 at 08:49:54AM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 08, 2026 at 04:37:02PM +0100, Catalin Marinas wrote:
> > > > +/**
> > > > + * vzalloc_decrypted - allocate zeroed virtually contiguous decrypted memory
> > > > + * @size:    allocation size
> > > > + *
> > > > + * Like vmalloc_decrypted(), but the memory is set to zero.
> > > > + *
> > > > + * Return: pointer to the allocated memory or %NULL on error
> > > > + */
> > > > +void *vzalloc_decrypted_noprof(unsigned long size)
> > > > +{
> > > > +	void *addr;
> > > > +
> > > > +	addr = __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
> > > > +					   GFP_KERNEL,
> > > > +					   pgprot_decrypted(PAGE_KERNEL),
> > > > +					   VM_DECRYPTED, NUMA_NO_NODE,
> > > > +					   __builtin_return_address(0));
> > > > +	if (addr)
> > > > +		memset(addr, 0, size);
> > > 
> > > Talking to Suzuki, the small window between set_memory_decrypted() and
> > > memset() potentially exposing stale data is safe, at least for Arm CCA
> > > as the memory would be scrubbed (there are other places in the kernel
> > > where we do something similar). I assume that's also the case for other
> > > architectures, although not sure what pKVM does.
> > 
> > It seems like a poor practice though, this should probably be
> > re-organized to use __GFP_ZERO so things are ordered sensibly.
> 
> __GFP_ZERO doesn't work if the intermediate set_memory_decrypted()
> mangles the data (e.g. changes encryption keys) and it no longer reads
> as zeros.

I thought arches are either preserving the memory content or zeroing
it, you are saying some arch leaves it as garbage? I'd argue that's an
arch bug and they should clear it in their path.

Otherwise this sharp edge is not documented and we have many other
places getting it wrong, eg system_heap_allocate() doesn't re-zero the
memory after decrypting it.

> > But what is the purpose of this? I guess some hyperv thing - but
> > shouldn't we have a more structured way to "DMA map" things for the
> > hypervisor instead of stuff like this? Why can't you use
> > dma_alloc_coherent() which actually gives you an address that is
> > sensible to pass to the hypervisor?
> 
> IIRC netvsc_init_buf() uses vzalloc() to allocate some memory and that
> buffer ends up in set_memory_decrypted() via vmbus_establish_gpadl().
> arm64 does not support changing the decrypted/shared attributed of
> vmalloc mappings and I don't think we should add it. Better to just
> allocate it properly upfront.

Sure
 
> We might be able to use the DMA API but we won't get something like
> vmalloc() - physically non-contiguous. 

The entry point is dma_alloc_noncontiguous() and you get a scatterlist
back.

> I think dma_alloc_noncontiguous() just falls back to
> dma_direct_alloc_pages() in the absence of an iommu.

In all cases you get a scatterlist with a CPU list and a DMA
list. iommu gives a smaller DMA list.

If you want a vmap then you can feed that CPU page list from the sgl
into vmap().

A dma_alloc_noncontiguous_vmap() helper would not be hard to make, and
IMHO, would make alot more sense for hyperv to treat the memory access
from the hypervisor as "DMA" instead of trying to re-invent the DMA
API.. :\

HCH was already saying we should not be allowing drivers to use
set_memory_decrypted() at all, and hyperv is the biggest non-core user
right now...

Jason
