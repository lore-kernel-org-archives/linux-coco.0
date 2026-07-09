Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CA3769FD
	for <linux-coco@lists.linux.dev>; Thu,  9 Jul 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592168; cv=none; b=sO22FXMMt0SnZdShAaID1MQyPaKBvDVVC+JkG/dL0hpMVYErp/r0HV4LbMCPrd+rMgHAHqDatxneI0K8MKjg7mji9kfYNqk1URGxucKwPbBjePKBMSfQQQMDj/9Yk0WjZrMTc+DYp/EZ68SUOMd6JFCuWCgYhLP8R8VU+juozOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592168; c=relaxed/simple;
	bh=yaMplWwoZEcFISJLPfTBAVrABKGjsyR1ahqTx+wGCEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpUCYyS4palPBLemgkElSvK7lGFvZZryMVxF3QR353H0SSJED6klHnBEkuj1MXI2eaGdx+L7B/t6oaRJYQyTTn5P+eGnHTP13Hu0Dz2+8DCpGvIa4Rg6CyqgyXwnxy4L4YuXX8aTWDuf2BWjyKWPV7biRwqui+mxVoaydqdLByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn3K20mT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn3K20mT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783592165; x=1815128165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yaMplWwoZEcFISJLPfTBAVrABKGjsyR1ahqTx+wGCEg=;
  b=Vn3K20mTm52WGxoI3r5RlT7CeZ+PFQwCjeKzgPpD6z1ZsYfNHtabcHAH
   WLB3KWyKUqefLFbk+wU+Qgy/bTaexPTVre0y8ojwbmlgFFGarH1ljM+xB
   n+7goQy9LxE/ZM2Fav+Ny4auvaBYQ1fI0V7P5JwU8Kl1xD4ODTo0kS+kD
   EVZuyYbxztqVXZwc4JJnfrS+2hGkSa7ijpPrdLUz8DU9OWThBINpOgGia
   ZMYTUqfgak/jq2CrCOLH0mUNtI54Jd69Rc/Q0+UFLmfkKigOeRbLES4//
   iYpkLgqO1JP50/9J1HSSXabaftFKahI+G3cDzWcDRSJ1o/KwTljjTIrkG
   g==;
X-CSE-ConnectionGUID: WsISzMpJTqKb8hLJcGQdNQ==
X-CSE-MsgGUID: J8eVMo4ASQWTMOjHKOUPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84126430"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84126430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:16:04 -0700
X-CSE-ConnectionGUID: m+UwPFgkTH2yG4psmTivNA==
X-CSE-MsgGUID: QQQ4QfFuRgeidQYZOjTxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250142236"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 03:16:01 -0700
Date: Thu, 9 Jul 2026 18:16:00 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
	yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org,
	linux-coco@lists.linux.dev, peter.fang@intel.com,
	xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <ak904BeCalwiC1q0@yilunxu-OptiPlex-7050>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>

On Wed, Jul 08, 2026 at 11:03:14AM -0700, Dave Hansen wrote:
> On 7/8/26 10:03, Xu Yilun wrote:
> > +/*
> > + * SEAMCALL leaf:
> > + *
> > + * Bit 15:0	Leaf number
> > + * Bit 23:16	Version number
> > + */
> > +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> > +
> >  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  						  struct tdx_module_args *args)
> >  {
> > @@ -39,6 +48,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  	 */
> >  	this_cpu_write(cache_state_incoherent, true);
> >  
> > +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
> >  	return func(fn, args);
> >  }
> 
> This is really looking fragmented and inconsistent.
> 
> What if someone *does* set the version bits in 'fn'? Also, if the "leaf

Then these bits would be ignored. FIELD_MODIFY() would overwrite the
version bits with the value in args->version.

> number" is just 16 bits, why is it a u64 in the API?

Because the "leaf number" is actually "bit 15:0 + bit 63". Seamldr calls
also use this path. And their leaf definitions include bit 63, such as:

  /* P-SEAMLDR SEAMCALL leaf function */
  #define P_SEAMLDR_INFO                0x8000000000000000
  #define P_SEAMLDR_INSTALL             0x8000000000000001

Sorry I only moved existing "SEAMCALL leaf" comments here, but the full
definition in TDX module SPEC is:

  Bit 15:0      Leaf number
  Bit 23:16     Version number
  Bit 24        Interrupt mode /* Setting 1 causes irq-resume loop forever when irq disabled, Linux always sets 0 */
  Bit 62:25     Reserved, must be 0
  Bit 63        Invoke *P-SEAMLDR* calls

> 
> Additionally, look at this:
> 
> > /*
> >  * Used in __tdcall*() to gather the input/output registers' values of the
> >  * TDCALL instruction when requesting services from the TDX module. This is a
> >  * software only structure and not part of the TDX module/VMM ABI
> >  */
> > struct tdx_module_args {
> 
> "version" doesn't fit this comment, does it? It's not a register.

OK, I think I can add a sentence to the comment a bit:

  ...when requesting service from the TDX module. The 'version' is an exception,
  it is encoded in rax along with the Leaf number. This is a software...

[...]

> If we add a new argument to 'tdx_module_args' it seems like the most
> consistent thing to do would be to extend the assembly to marshal it too.
> 
> We already have:
> 
>         /* Move Leaf ID to RAX */
>         mov %rdi, %rax
> 
> and it wouldn't be rocket science to add two instructions to get
> ->version in to place:
> 
> 	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
> 	movzbl	TDX_MODULE_version(%rsi), %eax
> 	shl	$16, %eax
> 	/* Leaf number arg -> RAX[15:0]; Preserve [23:16]. */
> 	mov	%di, %ax

If we want to keep seamldr call work as is, we can't lose bit 63:

	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
	movzbl	TDX_MODULE_version(%rsi), %eax
	shl	$16, %eax
	/* Leaf number arg -> RCX[63] and RCX[15:0]. Zero rest of RCX */
	mov	%rdi, %rcx
	movabs	$0x800000000000ffff, %rdx
	and	%rdx, %rcx
	/* Combine Leaf number and version -> RAX */
	or	%rcx, %rax


Or, I prefer more to assert that the Leaf numbers only touch bit 63 & bit [15:0]
in C code, this catches buggy bits rather than ignore them, and simplifies
assembly code:

@@ -58,6 +58,8 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
        int retry = RDRAND_RETRY_LOOPS;
        u64 ret;

+       BUILD_BUG_ON(fn & ~0x800000000000ffffULL); /* TODO: proper Macros */

then:

	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
        movzbl  TDX_MODULE_version(%rsi), %eax
        shl     $16, %eax
	/* Combine Leaf ID and ABI version to RAX, they don't overlap */
        or      %rdi, %rax
