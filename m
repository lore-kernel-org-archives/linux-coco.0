Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E69C340401
	for <linux-coco@lists.linux.dev>; Fri, 12 Jun 2026 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286579; cv=none; b=dz8xKYF6LcrZOInai1AJg9PfmqXHQZYW4D3WKOj10fEx4BvqoCpN3SMD0dA3AbSVra062Op9dIrsynvgOpV9w3QeBF0O98tXxiBmlU3qRV9syCM8QXd3++yvWQtMIAEPNZT8LIB+nTkLgcnztp/snWVUASBE0r1sPl6IpMGB+/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286579; c=relaxed/simple;
	bh=S1PIlzk8vGChQ04VWrfS3SSCm8k5SS5ze78gg8eQ4iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c67nR8kYUakEuIdqcnwztEsO2xa7a6XWtAcEY/zfY5lUiZ59rDlVpO2Ct2YeXrdwrcBr0ieLVFWnjax5sxmdlgn7c4nCyhEFlSCqNIowLA3u7UgKTvcQS/p8UlWr7zsXqgAhcBStrbph2z3kg5263KRoBkxwmqA85bt5/Wx1w5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uy6OGp6s; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uy6OGp6s"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 560E322EA;
	Fri, 12 Jun 2026 10:49:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6EC83FAA1;
	Fri, 12 Jun 2026 10:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781286577; bh=S1PIlzk8vGChQ04VWrfS3SSCm8k5SS5ze78gg8eQ4iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uy6OGp6sf2LANX/v1lPC+CjkVElax8HpROBJYsFdfEoQTcjHKYfpSsAZQW2I6/mnk
	 DuOxFOY9rbNiWlQyd6WPeyxZ4VqSaZES7REmNf2Q/oY5ujJ866IrsEpHGDO70h32qg
	 qSDwXZW+ZgwGbxDT6BgaVVARLOeURjr7wyfjFyKM=
Date: Fri, 12 Jun 2026 18:49:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <aixGqCqKkQeDfUST@arm.com>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
 <aibhnnDFQTHWMEFe@arm.com>
 <20260611114954.GC1066031@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611114954.GC1066031@ziepe.ca>

On Thu, Jun 11, 2026 at 08:49:54AM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 08, 2026 at 04:37:02PM +0100, Catalin Marinas wrote:
> > > +/**
> > > + * vzalloc_decrypted - allocate zeroed virtually contiguous decrypted memory
> > > + * @size:    allocation size
> > > + *
> > > + * Like vmalloc_decrypted(), but the memory is set to zero.
> > > + *
> > > + * Return: pointer to the allocated memory or %NULL on error
> > > + */
> > > +void *vzalloc_decrypted_noprof(unsigned long size)
> > > +{
> > > +	void *addr;
> > > +
> > > +	addr = __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
> > > +					   GFP_KERNEL,
> > > +					   pgprot_decrypted(PAGE_KERNEL),
> > > +					   VM_DECRYPTED, NUMA_NO_NODE,
> > > +					   __builtin_return_address(0));
> > > +	if (addr)
> > > +		memset(addr, 0, size);
> > 
> > Talking to Suzuki, the small window between set_memory_decrypted() and
> > memset() potentially exposing stale data is safe, at least for Arm CCA
> > as the memory would be scrubbed (there are other places in the kernel
> > where we do something similar). I assume that's also the case for other
> > architectures, although not sure what pKVM does.
> 
> It seems like a poor practice though, this should probably be
> re-organized to use __GFP_ZERO so things are ordered sensibly.

__GFP_ZERO doesn't work if the intermediate set_memory_decrypted()
mangles the data (e.g. changes encryption keys) and it no longer reads
as zeros.

> But what is the purpose of this? I guess some hyperv thing - but
> shouldn't we have a more structured way to "DMA map" things for the
> hypervisor instead of stuff like this? Why can't you use
> dma_alloc_coherent() which actually gives you an address that is
> sensible to pass to the hypervisor?

IIRC netvsc_init_buf() uses vzalloc() to allocate some memory and that
buffer ends up in set_memory_decrypted() via vmbus_establish_gpadl().
arm64 does not support changing the decrypted/shared attributed of
vmalloc mappings and I don't think we should add it. Better to just
allocate it properly upfront.

We might be able to use the DMA API but we won't get something like
vmalloc() - physically non-contiguous. I think dma_alloc_noncontiguous()
just falls back to dma_direct_alloc_pages() in the absence of an iommu.

-- 
Catalin
