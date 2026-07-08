Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83F26738C
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533799; cv=none; b=aRL+z3GAPyuKN/8mQrSNX4j4yFyFbeNXV1NDCxnYLTXbqdhNY2MWmvDmCIaxo8JPhua2/opaEO/HJpzOyhEvNX9QfvvkTv3Io4LZfx/Iu3KpE+NAcijnbLb0mqJdqp7nNOeS/DaerdDUFtLGi0bsnnI7JDdHwrPVepdcZnz2KIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533799; c=relaxed/simple;
	bh=1irXRh9/9+QcyOLYwJtP1qCtp0H+mi3I7OyE8a8+tP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPS1lNZrr7bmp5XcZCDlSW/bZiOZOUIN6jR04UlJ94RHaUnQs1GQ48Vx52vyeTEFDYjuUSILQr/pNxEG1fXDBCiv+wq+ggA0+Ovaou7Re41znLjHixVygpbonqrlv8R/8xMPoZeKFIhHQI9dOOEelKJo7Jb8oznZ60Wn6yDY9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQrveUZ4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQrveUZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783533798; x=1815069798;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1irXRh9/9+QcyOLYwJtP1qCtp0H+mi3I7OyE8a8+tP8=;
  b=iQrveUZ4JypTHalolVCGjJR4aPBRTwjtz6FueZMbJ8qcYDoqccq/GlO/
   vrttjwYGKh9ZrR2nqArbkdsSmQbDOZ2Y5TE4reSMwtIRVr8w07fk+Bog+
   HWZUJyhFHyIDZNhPXSBXsJ8nY4cqW06A0EoBLzDGKZccx4G4bbgdHJLHn
   DNXSkSaAdJqPNXLCq52T3TyFwvGZeYI/UI4cbD/eZAMSEGUgjs8gOTWEL
   Z9+9JFn7R/WLDko8x+ClegOJjH90HfGtuVMoz0FhzupW71pTOXgk7RDjT
   GSqfHTWCG4ml8BeZcEsj+ik5+gDUCQdFqDh+/gU0Sm6DAjf8txBGBd4nI
   w==;
X-CSE-ConnectionGUID: J+LwkN64SVmcyYZxB9Ic3A==
X-CSE-MsgGUID: ycDZJ6lxQ2m4oXHEZ08FzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83987191"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83987191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 11:03:18 -0700
X-CSE-ConnectionGUID: BX8lh7LISh+bz/J6tkm9uQ==
X-CSE-MsgGUID: 0LL/wBRdQQyqTVNdOC5+dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="256274130"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO [10.125.111.66]) ([10.125.111.66])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 11:03:17 -0700
Message-ID: <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
Date: Wed, 8 Jul 2026 11:03:14 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
 yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org,
 linux-coco@lists.linux.dev, peter.fang@intel.com, xiaoyao.li@intel.com
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260708170330.83850-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/26 10:03, Xu Yilun wrote:
> +/*
> + * SEAMCALL leaf:
> + *
> + * Bit 15:0	Leaf number
> + * Bit 23:16	Version number
> + */
> +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> +
>  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>  						  struct tdx_module_args *args)
>  {
> @@ -39,6 +48,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>  	 */
>  	this_cpu_write(cache_state_incoherent, true);
>  
> +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
>  	return func(fn, args);
>  }

This is really looking fragmented and inconsistent.

What if someone *does* set the version bits in 'fn'? Also, if the "leaf
number" is just 16 bits, why is it a u64 in the API?

Additionally, look at this:

> /*
>  * Used in __tdcall*() to gather the input/output registers' values of the
>  * TDCALL instruction when requesting services from the TDX module. This is a
>  * software only structure and not part of the TDX module/VMM ABI
>  */
> struct tdx_module_args {

"version" doesn't fit this comment, does it? It's not a register.

If "fn" is just the 16-bit leaf number it should be a u16 everywhere.
Then there's no worry about the version number leaking in there
somewhere. The type can't even _carry_ the version number.

As a general rule, I dislike doing things in assembly that can be done
in C. But, in this case, we have some pretty darn simple assembly doing
a pretty simple job: marshaling data out of 'tdx_module_args' and in to
registers.

If we add a new argument to 'tdx_module_args' it seems like the most
consistent thing to do would be to extend the assembly to marshal it too.

We already have:

        /* Move Leaf ID to RAX */
        mov %rdi, %rax

and it wouldn't be rocket science to add two instructions to get
->version in to place:

	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
	movzbl	TDX_MODULE_version(%rsi), %eax
	shl	$16, %eax
	/* Leaf number arg -> RAX[15:0]; Preserve [23:16]. */
	mov	%di, %ax

I don't *love* this. But, to be honest, I'd never even seen
FIELD_MODIFY() before.

Also, please double and triple check the assembly above. This does
depend pretty heavily on the rules around register naming and width, and
x86 is not exactly the most straightforward ISA in the world there.

I also wouldn't be shocked if there's a nicer way to do this that
someone else dreams up.
