Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99FA4C10F0
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848030; cv=none; b=Av/5Okbr2pSB4eMQgq2w+NVrtWKz6GssAe5FJvHdbDoPDA32L8bctUA32PAHUUoiRQB2bGxVDA6QRhpFOgpFkBqgjDZaG8vTp7zWheW7TtUyZu2f8vZo69+EmZdOftkUBE3behFze+Gey+HHy8sOt0XI/PmE/T1Kvb1u0ShRX6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848030; c=relaxed/simple;
	bh=/QIsZj5ZknEUJbqRrL7io4YJRt6LKVatf9W0JsU0gc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvuHrHsH4RUPUjcr0hLYwRseWBj8VYhi6QYao03v9IDeJSSTLGarCRQ2hW0Ded+jxu+j64wDefkWaiz2S2g7EOXJ2ZBDWvEHfNZ+DztVqjFOXpVOu03OyyAivOcydDjgAD6ZuPJBfDHm6FDQ1nvjNMAtqH/Ir7Y28TVZSlEJbgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C3YuSdKb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C3YuSdKb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9271F497;
	Thu,  1 Oct 2026 02:47:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 369363F86F;
	Thu,  1 Oct 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790848028; bh=/QIsZj5ZknEUJbqRrL7io4YJRt6LKVatf9W0JsU0gc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3YuSdKbRNRrJeKGiTX+MeAWFYw1nMoNgLQPuFYsOKCffatmtgLArZDDicLEn5IVN
	 QdfadJ+CTSkMVLbzp8x6wGpUaXAex+pC4OdZCR998yLM9QY0S0Of+W+nz/hvtSi8a0
	 Y4FJRvpIK78QwNVq7zTFGk0de+v9hV5E84NrS3R8=
Date: Thu, 1 Oct 2026 10:47:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	linux-kernel@vger.kernel.org, steven.price@arm.com,
	gshan@redhat.com, aneesh.kumar@kernel.org, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, mark.rutland@arm.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <ar4rYdrDAp_uveXv@arm.com>
References: <20260930164930.1388438-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930164930.1388438-1-suzuki.poulose@arm.com>

On Wed, Sep 30, 2026 at 05:49:30PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> If the host attempts to access granules that have been delegated to RMM
> (for use as an RMM object or Realm Data), these accesses will be caught
> and will trigger a Granule Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by:
> 
>  * Userspace having access to a page which has been delegated. We don't allow
>    mapping a delegated page (which may have Realm VM private data) to EL0.
>    But if we do encounter this, trigger a SIGBUS to allow debugging
> 
>  * A kernel mode access is even more serious, except for the cases where :
>    - Benign overreads e.g. load_unaligned_zeropad(), we should be able to fix
>      this up.
>    - A kdump kernel trying to access delegated page (donated by the primary
>      kernel). We do not support this yet, but can be added in the later series.
> 
> There is ongoing work to unmap the guest_memfd backed private pages
> from the linear map. We would additionally need to unmap the other
> delegated pages too. For now handle the GPF and only fixing up kernel mode
> accesses via kernel VA (which would cover both the legitimate cases above)
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>  * Only fixup accesses via kernel VA
> Changes since v17:
>  * Pass untagged address to die_kernel_fault() - Sashiko
>  * Explicitly check !user_mode() for fixups - Catalin
>  * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
> Changes since v16:
>  * Update the commit description to indicate why we try to fixup GPFs
> Changes since v10:
>  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> Changes since v2:
>  * Include missing "Granule Protection Fault at level -1"
> ---
>  arch/arm64/mm/fault.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 75c3e463df2ef..ded9288a5dd2f 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -914,6 +914,29 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	return 0;
>  }
>  
> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	const struct fault_info *inf = esr_to_fault_info(esr);
> +	unsigned long addr = untagged_addr(far);
> +
> +	die_kernel_fault(inf->name, addr, esr, regs);
> +	return 0;
> +}
> +
> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	/*
> +	 * Userspace must not have a delegated page mapped in. If the kernel
> +	 * is made to access it, then we have a serious problem.
> +	 * Only fixup if the access came via kernel VA. e.g., load_unaligned_zeropad()
> +	 */
> +	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
> +	    !is_ttbr0_addr(untagged_addr(far)) && fixup_exception(regs, esr))
> +		return 0;
> +
> +	return 1;
> +}

The logic looks fine to me, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Whether we want to unmap the delegated pages eventually (and not just
guest_memfd), given that we get a synchronous fault architecturally, I'm
not yet convinced it's worth it (it fragments the linear map).

-- 
Catalin
