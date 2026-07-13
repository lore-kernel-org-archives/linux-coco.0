Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBBB324B22
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935640; cv=none; b=RtCowX5nDKwsYQlvnmnPqDHKyCBzDGGpecbRvsoghkilSRXUKjZuueMfLpxiC68N+CiRGWdBqfi0MIcm3MGPnYRwvOh5YO9aHJ4/ItaWRPA4UIhq856Gch4ET14XojU7IM4vvRJHyTvuY1I7VtbUeUGs/xMbS/qXRH2iqCCbFzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935640; c=relaxed/simple;
	bh=fBgZkjBnNKIEFrTDZBZ6inmmutX/ZozeMBYG54sSB9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3+KF5Dy1CzyNNULuqwQFRoWVHXk/hyyxIx+kZJqsyrZaWOBe6J8shx3p7pmX3UdAIClhcS6Q1cnYPARE8HqnbZ22PHa4l/jIPWISeciKntinroHlQnC6qVo8nnURKShVlbFO3L3+iZuaGCjaMIXMbylqUxgq+dHbgAgzSLsfRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMZKvoxa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMZKvoxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C281F00A3A
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935639;
	bh=fa3umE0Tg8YJmh5QRe2oDrUblgDvy9dRV4M1NCmfCjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WMZKvoxaPJXPHAp6sg3wc4m1GGA0Cwa4f7u53QuWAE01XqfQtHWDyA3DXwKLS2oKx
	 XULNzwzUvdhn5V7/vzgfdj0IgnaHAhXnpK+AfGslYnGC2jbYHerskFYmxAZWXJe8eY
	 85rxeDmFGwZaQhLVvvqkyRpIqvpqQ+ghnwLqsUimJ3UFXtiAvcE90KSis8qYkjineW
	 pc8/DSTt/d851V/+wY6UBxE5NYjqQOhQerBfLj/DmVmh9gxFDjya/4/nUZQPYDrSMq
	 kxLT5pORLKNqAhHAqHhBKbydy3jB7TsLkMk4ALTqyr2vSTBZNslknnJfV2hvnk4q7+
	 IhqIUND+4IHUA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F0318F402E6;
	Mon, 13 Jul 2026 05:40:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 13 Jul 2026 05:40:37 -0400
X-ME-Sender: <xms:lbJUaguBHxzF9u7n9j1pX0tEyG2lk1cxDjaY-lEXLYJUtPykUxhXIQ>
    <xme:lbJUavJu2lpu0ddcCj_lAgjjNZwzNYCw1ZBONU1lzJHrcOJXjyssIF3FApqpMZz3r
    PLCOMR3941RaSW8-1APTJhJzmiBdHoyxfmweCvdHHWI2wGE6Xbh638>
X-ME-Received: <xmr:lbJUavNZxQ7EXYRxqq8GU39XK6yT3joyO0AOlqimHy0mbrjYrKW2unQENlL3KA>
X-ME-Proxy-Cause: dmFkZTFTvJMJ6cv62e0mSN+Y/mv7Xn73VBxVnjqYJ0S01pgGEGLAsssXRtUpPp4WloTjMy
    I2IcZkFtSdtueiXcRwG1j/8toO8vrnWH5/yhUoletYR924KAkF+IHg8URei47bxVHn+FTG
    cx9aGYfeKthdGAl0D7wfT4/0+M/5F0/fNrEBoxNLR8WMeYQKurLC6Qdn4G9TYNzPSx8iOi
    tk5OF841rBZzA4U2e/rRFCrsUv19UUZcvTHoBjYrpA8nJPrXxXYkUmn41Vc57VoaVxe4Yi
    P8SwO1IRaInBuyXuRNvIEL63EKPQ7rA24E3fqwS08UaEd4v66iwdXpZjo2xKh9Xa+ENSB0
    A77VqKYClLRaWHd4Pf03A+2aF0pW+Vhed/11FUwnKu5TLzgUZq2tBm5zlGOEnMWjX/gWP8
    vheVrfwc9qw8qkasBVwpxYYu81x8Ak7uV8eL43GhD3k8HKFFu10i/pfSb8+Fa9LJivjqNO
    UvKhVFdGgRKfDIRTfgJ1SlbnSHNA1STR8b3ODpkjjgrJKJsGJ7ldjnXNxjUxXAQbGZOtNX
    zcrzS/kN88mw4oO9+WOzqcyU3tD0bUGHWDWH+1rPB3he+kgJeB27kyGs6RzaECU69mFhuy
    /zukxTdGya4a4tJQloB/Lqc68/9LkcSXjDloXEIvGgI1jd01xeUvb+90Op4Q
X-ME-Proxy: <xmx:lbJUajCUSpgsClVeoVzGn3Kn7uWHn1UpifkEAImHTZzrOQaR57Lj8g>
    <xmx:lbJUanWVkBm5oZc-Xg8RgeZFfq6E-VfluDx1V7I4xMCr8iKrTX-QYQ>
    <xmx:lbJUavc_lSec4DdM2j1oFNHAjvIyyrqGjJaUmXPNNdlYWRCQQZuIVA>
    <xmx:lbJUagstkHI09ie3_a21betXz3LKqbsoBaqin3CtybJ4UgmtSMtjnw>
    <xmx:lbJUaujGr0fsqHz8HW4CoIO3Vrebz9qENavdLZmRt2-pJnUygiOMjpUq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 05:40:37 -0400 (EDT)
Date: Mon, 13 Jul 2026 10:40:36 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, 
	yilun.xu@intel.com, chao.gao@intel.com, djbw@kernel.org, linux-coco@lists.linux.dev, 
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alSxrcseFHNrttoy@thinkstation>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
 <alEXflESyo6ndDTY@thinkstation>
 <f8ef7a94-7824-4d1f-899a-60a0fbd2e2f7@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ef7a94-7824-4d1f-899a-60a0fbd2e2f7@intel.com>

On Fri, Jul 10, 2026 at 09:48:22AM -0700, Dave Hansen wrote:
> On 7/10/26 09:21, Kiryl Shutsemau wrote:
> > The version is not a register operand, it is part of the function
> > number.
> 
> I'm not sure why that's important.
> 
> Sure, the arg structure is all full registers now. But it's not even all
> the registers because RAX isn't there. So let's say we made the data
> structure smarter:
> 
> struct tdx_module_args {
>         union {
>                 u64 rax;
>                 struct {
>                         u16 function_nr;
>                         u8  version
>                         u8  padding0;
>                         u32 flags;
>                 };
>         };
>         u64 rcx;
>         u64 rdx;
> 	...
> }

This union doesn't match the ABI it is supposed to represent.

RAX is:

  15:0	Leaf number
  23:16	Version number
  24	INTERRUPT_MODE
  62:25	Reserved
  63	P-SEAMLDR select

In your layout INTERRUPT_MODE ends up somewhere in padding0 and the
P-SEAMLDR bit is BIT(31) of 'flags'. Nothing lines up with the spec.

To describe the format properly the struct would need bitfields, and we
generally discourage bitfields for ABI-defined layouts. Without
bitfields it degrades into masks and shifts on a u64 -- which is
exactly what composing 'fn' with a macro is. The union doesn't add
anything on top of that, it only hides where the bits are.

> 
> All of the:
> 
>         struct tdx_module_args args = {};
> 
> instances would default to version=0. It would take a one-liner to get
> bit 63 set:
> 
>  static int seamldr_call(u64 fn, struct tdx_module_args *args)
>  {
>  ...
> +	args->flags |= SEAMLDR_BIT;
>         guard(raw_spinlock)(&seamldr_lock);
>         return seamcall_prerr(fn, args);
>  }
> 
> The truth of the matter is that 'fn' *IS* the RAX from the TDX ABI.
> We're carrying it around the kernel in that format, and it just doesn't
> work very well.
> 
> The alternative is to carry the logical pieces of RAX around the kernel
> and them assemble RAX out of them in one (or very few) places. *Not* to
> build RAX in the TDX module ABI early far from the TDX module ABI layer
> itself.

I don't see what delaying the assembly buys us.

The SEAMCALL helper is where we decide what we want from the call: the
leaf, the version, the operands. Nothing below it adds information --
sc_retry() and __seamcall_dirty_cache() only retry on entropy failure
and track cache state. There is no layer further down that is in a
better position to compose RAX than the helper itself.

And it is not "far from the TDX module ABI layer". The tdh_*() helpers
are the C representation of the ABI functions. They are the ABI layer.

We also don't carry the pieces "around the kernel" today. The
composition already happens in exactly one place -- a macro next to the
leaf defines. Call sites don't open-code shifts.

That said, I'm okay with RAX living in the struct as a plain u64
instead of a separate 'fn' argument, if you prefer the structure to
carry all the registers. But its composition should stay early, in the
helper, where the decisions about the call are made:

	args.rax = TDH_VP_INIT | SEAMCALL_LEAF_VER(1);

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
