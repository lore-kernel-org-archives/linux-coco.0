Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803FF2737E0
	for <linux-coco@lists.linux.dev>; Fri, 17 Jul 2026 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262689; cv=none; b=WvNnqnRq5VWQhKO6oJ2b7Oj/I/JRDDS1qGNaOkpiLyURVDJU1DMC9R2rOVe2aKsf1PoG/iHJJk/jfijnXNvMuqjofXZT4jyqY0vVo9FwDAU/waAjj2iBAeH+c2wRVuax7WQS6zIMpiissvhqrFK3Ql5ZT/Z15Ewxent1T3PHCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262689; c=relaxed/simple;
	bh=0TLxB5Uj8bAgOHnXxOgTWLORrSvsV9BvJ+lzpm8vud8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFwyn03Gtx5nIf5jp2osXtg9uMjfbRfRilVqfEAi4aq0Lzw08YXafyExCGtkafmLq2YLUc3qJ9IbI+asaI2iMVfTpWjJnH+pEbyYDGK0t+tg4oyxb4TxjzYJtpteCcZZvhv2Ew+WsCmRapDcCKP7oQ1q0VvKEOqCFo2W699g22g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFZJZyYo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFZJZyYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784262687; x=1815798687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TLxB5Uj8bAgOHnXxOgTWLORrSvsV9BvJ+lzpm8vud8=;
  b=mFZJZyYoStYJDOBHY7cMFxxatKKZVSqXa3GcUt8OV6uz0y8CyBhsNgaK
   7prhOH0N9vawDVXbGqCNI2E6oa71815o7190TUoFDwyjs3eN2YY3P1wVZ
   Z8XhRFc6FLR9RVRx9A/TvXJAinPYzUasJD9ak5HqfYu/6TONOK5YeCqlA
   f34KVQYyTuFp+zybWwZH44bZfTqLCaEJaC3r2/JWxQcSzwVitLiOxpnYz
   Tn4EfDV9RV7bpB/U8JjXwuKWHCFeqvkmOboyXv+dPbCc6r8iiwUNg3V1W
   syX4rtUtz0QMgJZzMHwLd3w+r4vPsVKRvqaWwARX0lvIHuWULPAuKUia5
   A==;
X-CSE-ConnectionGUID: G+miPnPJTq6zQHc8jcFziA==
X-CSE-MsgGUID: oSSUN0+FSCiX9ydi+IotQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95288206"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="95288206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 21:31:27 -0700
X-CSE-ConnectionGUID: 0gumDkw+RbyjZboTDGJKpA==
X-CSE-MsgGUID: XOJ1CMBgT/anIvaDLWctJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="279981130"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2026 21:31:24 -0700
Date: Fri, 17 Jul 2026 12:31:23 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
	djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com,
	xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <almwGwoUzoA96XnG@yilunxu-OptiPlex-7050>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
 <alEXflESyo6ndDTY@thinkstation>
 <f8ef7a94-7824-4d1f-899a-60a0fbd2e2f7@intel.com>
 <alSxrcseFHNrttoy@thinkstation>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSxrcseFHNrttoy@thinkstation>

> > struct tdx_module_args {
> >         union {
> >                 u64 rax;
> >                 struct {
> >                         u16 function_nr;
> >                         u8  version
> >                         u8  padding0;
> >                         u32 flags;
> >                 };
> >         };
> >         u64 rcx;
> >         u64 rdx;
> > 	...
> > }
> 
> This union doesn't match the ABI it is supposed to represent.
> 
> RAX is:
> 
>   15:0	Leaf number
>   23:16	Version number
>   24	INTERRUPT_MODE
>   62:25	Reserved
>   63	P-SEAMLDR select
> 
> In your layout INTERRUPT_MODE ends up somewhere in padding0 and the
> P-SEAMLDR bit is BIT(31) of 'flags'. Nothing lines up with the spec.
> 
> To describe the format properly the struct would need bitfields, and we
> generally discourage bitfields for ABI-defined layouts. Without

I agree that to describe each part of RAX clearly we need bitfields, and
bitfields is not good for args.rax.  So args.rax is not generally good
to me, worse than a separate u64.

> bitfields it degrades into masks and shifts on a u64 -- which is
> exactly what composing 'fn' with a macro is. The union doesn't add
> anything on top of that, it only hides where the bits are.

[..]

> > The truth of the matter is that 'fn' *IS* the RAX from the TDX ABI.
> > We're carrying it around the kernel in that format, and it just doesn't
> > work very well.
> > 
> > The alternative is to carry the logical pieces of RAX around the kernel
> > and them assemble RAX out of them in one (or very few) places. *Not* to
> > build RAX in the TDX module ABI early far from the TDX module ABI layer
> > itself.
> 
> I don't see what delaying the assembly buys us.
> 
> The SEAMCALL helper is where we decide what we want from the call: the
> leaf, the version, the operands. Nothing below it adds information --
> sc_retry() and __seamcall_dirty_cache() only retry on entropy failure
> and track cache state. There is no layer further down that is in a
> better position to compose RAX than the helper itself.
> 
> And it is not "far from the TDX module ABI layer". The tdh_*() helpers
> are the C representation of the ABI functions. They are the ABI layer.

I wanna advance the progress, so if I have to choose I sort of like
*args.version*, or even args.interrupt_mode in future. True this does
not exactly match the registers' layout of TDX module ABI, but I also
don't see big problems. Using fn instead of args.rax at the first place
already shows we don't have to be too strictly aligned to ABI. We are
defining SW APIs.

To me the args.version scheme clearly defines 3 components that we want
from SW POV:

	the leaf	fn
	the version	args.version
	the operands	args.rcx	
			...
			args.r15

The TDX module SPEC tells us each value of these components, we simply
fill them in. No extra bit-or.

> 
> We also don't carry the pieces "around the kernel" today. The
> composition already happens in exactly one place -- a macro next to the
> leaf defines. Call sites don't open-code shifts.
> 
> That said, I'm okay with RAX living in the struct as a plain u64
> instead of a separate 'fn' argument, if you prefer the structure to
> carry all the registers. But its composition should stay early, in the
> helper, where the decisions about the call are made:
> 
> 	args.rax = TDH_VP_INIT | SEAMCALL_LEAF_VER(1);

This is the scheme that is most aligned with ABI layout. But I assume we
don't really see it worth the massive code churn, is it?
