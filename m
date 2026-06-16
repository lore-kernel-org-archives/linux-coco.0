Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128B83A5E91
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633865; cv=none; b=nZdMBN7c8pH8GegbwM1xF03j1snMAb9sdCMoPF8QN9a8dzaIXDT+/Z+eNe601iWvEf6lPoBF4kSThWuSWRzA9AGJ/txh66PTZ2dyEumwCR6Pn0WJQoes4S+E9s6Dq/uO5swY5QR+H1vJEkMT/gDwBTUZDc680SZxVP69ALLbxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633865; c=relaxed/simple;
	bh=K2IjKo4Wn3O01fRwrLGrTisY260F8ix0pXcab0mJkzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBI3MPDbCBox1NMlBxfblzfGJyS2XaBGtMdQuC7YM5t3C4YC+wTTaRTMkCkJWV5myOHW0yRGu85r5lFiZBiG0RAvBb2ZYI5D0O5eTF4dBDJQu2+yDyNhR5QMu/IRVvuRW/xS8NtlbVcnN5zFK52nxEt2gxkzstA9UvC/m+qXHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pg/JNMRr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Pg/JNMRr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A4944507;
	Tue, 16 Jun 2026 11:17:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7A63F905;
	Tue, 16 Jun 2026 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781633861; bh=K2IjKo4Wn3O01fRwrLGrTisY260F8ix0pXcab0mJkzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg/JNMRruttP4uU2EfyTL6OzWBb0QGQPaB/o+z2ZnXsM0rK3NsYvRM0YpSnQvlfhU
	 S2iN3nhz5q8lT9uIhr8k0juyGOp/N82uBPy1aDqJmc1+9X1m5j8/gFL6/w1+vxp73K
	 hQK2hyrT8f5ie1L+K2o8m49Ph+5gArucV+q47T7g=
Date: Tue, 16 Jun 2026 19:17:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@infradead.org>,
	Kameron Carr <kameroncarr@linux.microsoft.com>,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <ajGTPelKLhgFqh7F@arm.com>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
 <20260611114954.GC1066031@ziepe.ca>
 <aixGqCqKkQeDfUST@arm.com>
 <20260612181807.GP1066031@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612181807.GP1066031@ziepe.ca>

On Fri, Jun 12, 2026 at 03:18:07PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 12, 2026 at 06:49:28PM +0100, Catalin Marinas wrote:
> > On Thu, Jun 11, 2026 at 08:49:54AM -0300, Jason Gunthorpe wrote:
> > > On Mon, Jun 08, 2026 at 04:37:02PM +0100, Catalin Marinas wrote:
> > > > > +/**
> > > > > + * vzalloc_decrypted - allocate zeroed virtually contiguous decrypted memory
> > > > > + * @size:    allocation size
> > > > > + *
> > > > > + * Like vmalloc_decrypted(), but the memory is set to zero.
> > > > > + *
> > > > > + * Return: pointer to the allocated memory or %NULL on error
> > > > > + */
> > > > > +void *vzalloc_decrypted_noprof(unsigned long size)
> > > > > +{
> > > > > +	void *addr;
> > > > > +
> > > > > +	addr = __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
> > > > > +					   GFP_KERNEL,
> > > > > +					   pgprot_decrypted(PAGE_KERNEL),
> > > > > +					   VM_DECRYPTED, NUMA_NO_NODE,
> > > > > +					   __builtin_return_address(0));
> > > > > +	if (addr)
> > > > > +		memset(addr, 0, size);
[...]
> > > But what is the purpose of this? I guess some hyperv thing - but
> > > shouldn't we have a more structured way to "DMA map" things for the
> > > hypervisor instead of stuff like this? Why can't you use
> > > dma_alloc_coherent() which actually gives you an address that is
> > > sensible to pass to the hypervisor?
> > 
> > IIRC netvsc_init_buf() uses vzalloc() to allocate some memory and that
> > buffer ends up in set_memory_decrypted() via vmbus_establish_gpadl().
> > arm64 does not support changing the decrypted/shared attributed of
> > vmalloc mappings and I don't think we should add it. Better to just
> > allocate it properly upfront.
> 
> Sure
>  
> > We might be able to use the DMA API but we won't get something like
> > vmalloc() - physically non-contiguous. 
> 
> The entry point is dma_alloc_noncontiguous() and you get a scatterlist
> back.

Yes but not scattered pages unless there's an iommu behind. Anyway,
that's an implementation detail, something like
dma_alloc_noncontiguous_vmap() could allocate scattered pages as a
fallback.

> > I think dma_alloc_noncontiguous() just falls back to
> > dma_direct_alloc_pages() in the absence of an iommu.
> 
> In all cases you get a scatterlist with a CPU list and a DMA
> list. iommu gives a smaller DMA list.
> 
> If you want a vmap then you can feed that CPU page list from the sgl
> into vmap().
> 
> A dma_alloc_noncontiguous_vmap() helper would not be hard to make, and
> IMHO, would make alot more sense for hyperv to treat the memory access
> from the hypervisor as "DMA" instead of trying to re-invent the DMA
> API.. :\
> 
> HCH was already saying we should not be allowing drivers to use
> set_memory_decrypted() at all, and hyperv is the biggest non-core user
> right now...

That's a good aim longer term. I'm not familiar with hyper-v but I think
it needs a mix of private or shared allocations depending on whether a
paravisor is present. That's handled by the vmbus code and the
information is encoded in the vmbus_channel objects.

Currently, something like netvsc_init_buf() just does a vzalloc() and
passes it down to vmbus_establish_gpadl() which knows how to interpret
the channel encryption status. I assume with the vzalloc_decrypted()
API, that info needs to be interpreted at the netvsc_init_buf() level to
know which allocation to call.

If we move towards a dma_alloc_noncontiguous_vmap() API we need vmbus to
encode the encryption requirement in the hv_device::device somehow so
that force_dma_unencrypted() knows what do return. We have the
DMA_ATTR_CC_SHARED but that's not interpreted on the DMA alloc path, so
there's a bit more work needed on the DMA API I think (not sure whether
Aneesh's series covers any of this).

-- 
Catalin
