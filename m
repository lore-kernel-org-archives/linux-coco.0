Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9033291F
	for <linux-coco@lists.linux.dev>; Tue,  7 Jul 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441135; cv=none; b=p5lEvPFrT8LJhRQQI2gbTyU6CVCb6nYrY9S/bdWkaZ9eJ5ag7zF8zYAulFfqEhQQq2qjTZpYuF3BUwpJLt/PFLvb2TFa/D23VibtvQZjf0SL17qlqTsCi9Nt4lWgUYKPLoAbyrpL/QjjubaUU54BWF89mKf2RioHJsGZQA9xMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441135; c=relaxed/simple;
	bh=pp2jqm+94t9wgegsuJOqIBSbWPCKOcnFrqUpvqiqcP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+HGeIEC0Pjb46dvsJ5b242a6piC5papa+/6Clx/fEyXruIOSnYWuNJg+K8ArtvM3zKmT7cJF0ypht+sYL5yispYtQU1BZYrECFz4oWcypc22zN8EvO0/4P+nfDe1181g3aJisYBk078ifEP6T4sIHdSSUUDszgvSo5ygPVAluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc9zFBJ7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc9zFBJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783441132; x=1814977132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pp2jqm+94t9wgegsuJOqIBSbWPCKOcnFrqUpvqiqcP4=;
  b=bc9zFBJ7vg4BGaPuCj3KcDkus8TOGv3f3dHAegKAdvBQ3W25cHISLc3C
   BEpAJon/asL7rYkqS0NMfHTLMWJtkvp4aQ5cMgPJKWOgygb5Lu61SahMI
   L4x6BNoV/CtwNa+cHcBFLyVyhq0t3MzPsQzUlhde/MLNc2+y5p4lOgSxI
   pgXVLGrp+5blaN1DVEZ+PymUKFj3jbQeigHfN6fDi3n1CfAur8Rne9jK8
   iIHEavaoROtgWJFjjWOyzO9vndtGcep2sSvkYKbss+XwKiwy31CrCWl2R
   OH8oonP2VAga6AcE74SQJXdhGAYLGwv88RA/nM6lx9Qb+XZi5xoZ/Ohak
   A==;
X-CSE-ConnectionGUID: 3sIQo+YbQpuFNys2fy9nDw==
X-CSE-MsgGUID: jPpgf2kBRjqRjj0CAX3DTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95608871"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95608871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:18:52 -0700
X-CSE-ConnectionGUID: tYIcAL8nSuSkSm0ZEgD1jw==
X-CSE-MsgGUID: Y42paeZWSZa+0QOyd/LhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251372214"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2026 09:18:51 -0700
Date: Wed, 8 Jul 2026 00:18:49 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "Gao, Chao" <chao.gao@intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"djbw@kernel.org" <djbw@kernel.org>,
	"Fang, Peter" <peter.fang@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding support
Message-ID: <ak0m6Yw2n+JQHj1H@yilunxu-OptiPlex-7050>
References: <20260702144614.59464-1-yilun.xu@linux.intel.com>
 <7d3eba7a5442cf3e84fe3658ae53337a183290b1.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d3eba7a5442cf3e84fe3658ae53337a183290b1.camel@intel.com>

On Mon, Jul 06, 2026 at 09:44:29PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-07-02 at 22:46 +0800, Xu Yilun wrote:
> > TDX uses the SEAMCALL instruction to invoke various TDX module
> > functions. Just like the syscall, a SEAMCALL specifies the operation
> > using a function number and parameters. Moreover, TDX also uses SEAMCALL
> > versions to extend the functionalities of existing SEAMCALLs while
> > keeping backward compatibility. Unlike syscall versions that assign
> > brand new numbers, TDX segments the function number into a basic
> > function number field and a version field. Together, they encode the new
> > function number.
> 
> So isn't this pretty much like numbered seamcalls, except there is a special
> format for generating seamcall2, seamcall3, etc? In the end you just use a
> different number for a different version of the call. So it's just like
> syscalls, except there is a pattern in the specific number for calls of the same
> family.

OK. I will refactored this paragraph:

  SEAMCALL invokes TDX module functions using a function number and
  parameters. To extend the functionalities of existing SEAMCALLs while
  keeping backward compatibility, TDX adds more numbered SEAMCALLs of the
  same family. This is just like syscalls, except that TDX defines a
  specific function number encoding pattern for the same family: a base
  function number and a version together encode the full function number.

> 
> > 
> > An existing SEAMCALL (TDH.VP.INIT) helper is already using the version
>                                     ^ maybe swap the order of these two?
> > field. However, having the caller pack the version into the function
>           ^Can drop this?
> > number open-codes the ABI layout, making the SEAMCALL helper definition
> > obscure and error prone.
> 
> Do we need the second part of the sentence?
> 
> > 
> > Add a version field in struct tdx_module_args, so that most existing
> > SEAMCALL helpers get a default "version == 0" behavior without code
> > churn, while callers requiring extended functionalities can specify the
> > version descriptively.
> > 
> > As an internal implementation detail,
> 
> ^ Is this needed to make it clear?

I think these are also about "make every word count", I'll drop all
3 places above.

> 
> >  encode the
> > tdx_module_args.version in the function number before calling into
> > assembly code.
> > 
> > Two alternative schemes were considered:
> > 
> > 1. Define versioned macros like TDH_VP_INIT_V0, TDH_VP_INIT_V1, etc.
> >    However, this breaks naming consistency unless all existing stable
> >    function macros are changed to TDH_XXX_V0.
> > 
> > 2. Add an explicit 'version' parameter to the base seamcall() API. This
> >    unnecessarily forces all stable SEAMCALL helpers to pass a
> >    meaningless '0' argument. Additionally, the magic '0' or '1' values
> >    at caller sites are not descriptive.
> > 
> 
> Dave was recently saying something to the effect of "make every word count". I
> think we could lose some filler words.

OK. I'll delete these adverbs.

> 
> > Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> 
> How about a link to the thread where this was suggested.
> 
> > ---
> >  arch/x86/include/asm/shared/tdx.h         |  2 ++
> >  arch/x86/virt/vmx/tdx/seamcall_internal.h | 19 ++++++++++++++++++-
> >  arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
> >  arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
> >  4 files changed, 23 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> > index f20e91d7ac35..b9aac2de233a 100644
> > --- a/arch/x86/include/asm/shared/tdx.h
> > +++ b/arch/x86/include/asm/shared/tdx.h
> > @@ -143,6 +143,8 @@ struct tdx_module_args {
> >  	u64 rbx;
> >  	u64 rdi;
> >  	u64 rsi;
> > +	/* ABI version, encoded in rax */
> > +	u8  version;
> >  };
> >  
> >  /* Used to communicate with the TDX module */
> > diff --git a/arch/x86/virt/vmx/tdx/seamcall_internal.h b/arch/x86/virt/vmx/tdx/seamcall_internal.h
> > index be5f446467df..7002e41cddad 100644
> > --- a/arch/x86/virt/vmx/tdx/seamcall_internal.h
> > +++ b/arch/x86/virt/vmx/tdx/seamcall_internal.h
> > @@ -11,6 +11,7 @@
> >  #ifndef _X86_VIRT_SEAMCALL_INTERNAL_H
> >  #define _X86_VIRT_SEAMCALL_INTERNAL_H
> >  
> > +#include <linux/bitfield.h>
> >  #include <linux/printk.h>
> >  #include <linux/types.h>
> >  #include <asm/archrandom.h>
> > @@ -23,6 +24,22 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
> >  
> >  typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
> >  
> > +/*
> > + * SEAMCALL leaf:
> > + *
> > + * Bit 15:0	Leaf number
> > + * Bit 23:16	Version number
> > + */
> > +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> 
> The annoying thing is that the path touched here is also used for seamldr calls
> now, which afaict has no concept of version. Underscoring how much of a mess the
> wrapper stack is.

OK, I'll drop the wrapper.

> 
> > +
> > +static __always_inline u64 __seamcall_encode_fn(sc_func_t func, u64 fn,
> > +						struct tdx_module_args *args)
> > +{
> 
> I have the same question as Xiaoyao. We have so many wrappers already.
> 
> > +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
> > +
> > +	return func(fn, args);
> > +}
> > +
> >  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  						  struct tdx_module_args *args)
> >  {
> > @@ -39,7 +56,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  	 */
> >  	this_cpu_write(cache_state_incoherent, true);
> >  
> > -	return func(fn, args);
> > +	return __seamcall_encode_fn(func, fn, args);
> >  }
