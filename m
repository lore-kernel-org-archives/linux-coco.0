Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345B9347537
	for <linux-coco@lists.linux.dev>; Mon,  8 Jun 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933029; cv=none; b=H3e/jU0yTqtTnaJJUB7TIecWIJgZLaagOsQ1uzmsvRqglEkPYUAPF+gQ4eABpG2xUYF3hgDHmky2NfA5K0HwN1RVryMGAqsgcHOcNOdssyDQuvj6kwAyHN/f9D4OhoAQrBfOdZaImzg4k7pggItSMCn9lxeCnDD+QGezq4bvjvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933029; c=relaxed/simple;
	bh=Xu4EpoEVeMBr4+03yHgtOAgELj7OjAwLMfxBTH0IrbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzgCHfwcjqDtva97hZe/y1+JLAuHM2zFSYimEnHR0jLyJRLXxkDLUMsKxscR4nBeZurcKb4LXwS4WyC5y0WJv7OQYdXMB9RMCiiEMwLZ6F8M8vI6wjKqQrnA36iuyJXxQqkaU/w/nAL7dPfY48IGuba61q21MqZrBBspgp/O7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d0/nWOEC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d0/nWOEC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20D11E2F;
	Mon,  8 Jun 2026 08:37:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FB4D3FD80;
	Mon,  8 Jun 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780933026; bh=Xu4EpoEVeMBr4+03yHgtOAgELj7OjAwLMfxBTH0IrbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0/nWOECo2S/dhvr4nKDtkYkcWA+bUJVSZOhi0EsXdPJnQVMRplE1SOJFOTNAklR/
	 glKbWqMaGn/PnX4OeU7HHLIB9M755vR8t/aaCVQ8pVwpM/NRo4T2NuYK4y+yzqR1fg
	 O6He95z1esL+nbujmVR7gD/POR01aJyU++Dtg9wc=
Date: Mon, 8 Jun 2026 16:37:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org, mhklinux@outlook.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [RFC PATCH] mm/vmalloc: add vmalloc_decrypted() and
 vzalloc_decrypted()
Message-ID: <aibhnnDFQTHWMEFe@arm.com>
References: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521205834.1012925-1-kameroncarr@linux.microsoft.com>

+ linux-coco, Suzuki (for the arm64 behaviour)

On Thu, May 21, 2026 at 01:58:34PM -0700, Kameron Carr wrote:
> In confidential computing environments (arm64 CCA, x86 SEV/TDX), guest
> memory is encrypted by default and must be explicitly transitioned to a
> decrypted/shared state for host-visible access.  Calling
> set_memory_decrypted() on a vmalloc address is not supported, and not
> recommended as it would be inefficient to decrypt the pages after they
> have been mapped.
> 
> Add vmalloc_decrypted() and vzalloc_decrypted() which decrypt pages on
> the linear map before creating the vmalloc mapping via vmap(), so
> physical pages are never mapped with conflicting encryption attributes
> across aliases.  A new VM_DECRYPTED flag marks these allocations so that
> vfree() automatically re-encrypts pages before returning them to the
> page allocator.
> 
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/linux-arm-kernel/ZmNJdSxSz-sYpVgI@arm.com/
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  include/linux/vmalloc.h |   7 ++
>  mm/vmalloc.c            | 163 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+)

There are a few Sashiko comments worth reviewing:

https://sashiko.dev/#/patchset/20260521205834.1012925-1-kameroncarr@linux.microsoft.com

[...]
> +/*
> + * Re-encrypt the linear-map alias of all pages backing a VM_DECRYPTED area.
> + * Best-effort: on per-block failure the loop continues so as many pages as
> + * possible are returned to the encrypted state.  Pages that fail to
> + * transition are left out of area->pages and leaked.
> + */
> +static int vm_pages_encrypt(struct vm_struct *area)
> +{
> +	unsigned int nr = 1U << vm_area_page_order(area);
> +	unsigned int i;
> +	unsigned int leaked;
> +	int ret = 0;
> +
> +	for (i = 0; i < area->nr_pages; i += nr) {
> +		int err = __vm_pages_enc_dec(area, i, nr, true);
> +
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	leaked = vm_compact_leaked_pages(area);
> +	if (leaked)
> +		pr_warn("vmalloc: re-encryption failed, leaked %u pages\n",
> +			leaked);
> +	return ret;
> +}
> +
> +/*
> + * Decrypt the linear-map alias of all pages backing a VM_DECRYPTED area.
> + * On failure, the already-decrypted prefix is rolled back to encrypted.
> + * Pages that fail either the initial decrypt or the rollback re-encrypt are
> + * left out of area->pages and leaked.
> + */
> +static int vm_pages_decrypt(struct vm_struct *area)
> +{
> +	unsigned int nr = 1U << vm_area_page_order(area);
> +	unsigned int i;
> +	unsigned int leaked;
> +	int ret = 0;
> +
> +	for (i = 0; i < area->nr_pages; i += nr) {
> +		ret = __vm_pages_enc_dec(area, i, nr, false);
> +		if (ret)
> +			goto rollback;
> +	}
> +	return 0;
> +
> +rollback:
> +	while (i) {
> +		i -= nr;
> +		__vm_pages_enc_dec(area, i, nr, true);
> +	}
> +
> +	leaked = vm_compact_leaked_pages(area);
> +	if (leaked)
> +		pr_warn("vmalloc: decryption failed, leaked %u pages\n",
> +			leaked);
> +	return ret;
> +}
> +
>  /**
>   * vfree - Release memory allocated by vmalloc()
>   * @addr:  Memory base address
> @@ -3457,6 +3554,9 @@ void vfree(const void *addr)
>  		return;
>  	}
>  
> +	if (unlikely(vm->flags & VM_DECRYPTED))
> +		vm_pages_encrypt(vm);

I think we still have the vmalloc aliases at this point as we lazily
reclaim them. We should call vm_unmap_aliases() before
vm_pages_encrypt(). It matches the x86 __set_memory_enc_pgtable() as
well with the explicit call to vm_unmap_aliases().

The vrealloc() path may have some issues as well but I haven't looked in
detail. Not sure it actually re-allocs decrypted pages. The simplest is
to reject vrealloc() for such vms until we have a use-case.

> +/**
> + * vzalloc_decrypted - allocate zeroed virtually contiguous decrypted memory
> + * @size:    allocation size
> + *
> + * Like vmalloc_decrypted(), but the memory is set to zero.
> + *
> + * Return: pointer to the allocated memory or %NULL on error
> + */
> +void *vzalloc_decrypted_noprof(unsigned long size)
> +{
> +	void *addr;
> +
> +	addr = __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
> +					   GFP_KERNEL,
> +					   pgprot_decrypted(PAGE_KERNEL),
> +					   VM_DECRYPTED, NUMA_NO_NODE,
> +					   __builtin_return_address(0));
> +	if (addr)
> +		memset(addr, 0, size);

Talking to Suzuki, the small window between set_memory_decrypted() and
memset() potentially exposing stale data is safe, at least for Arm CCA
as the memory would be scrubbed (there are other places in the kernel
where we do something similar). I assume that's also the case for other
architectures, although not sure what pKVM does.

-- 
Catalin
