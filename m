Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDA34106A
	for <linux-coco@lists.linux.dev>; Tue, 13 Jan 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298793; cv=none; b=BByg7J87NlYKcU4zUEjLFzeyfXZIBDcVu4Y2qt7IxNRk2UwC00pl9YpLT4XVXt7xwP5Qg24zKU0hbbSiQvqT2kKNH5obOy0/fb9GWAVQWWuaAUcngUDHfErWLDLtXCVxMrNqF2ByO4sdpmJDFI5TRdCCRAwq3sqgjgkyaUA3OdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298793; c=relaxed/simple;
	bh=04MezNusJQTBrU1XFr5tiP9BPrergzKUpucwLQhG/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4o0HmKnP3wT3mO9WZeOLwWQ3p/jQjn9b9yfKye/PH6a32noDUPYg2N4iGDrWFej0xH+sODp7NAtGazSsF3zRN4gzmRr3eB8AUg+nIVB0ffFUfz87TEaNAUDM+9IM46cE7sRK+vHkW663LlNNotKUQ1GMlncxS+P9Pr/Dfocceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkwdLhVN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkwdLhVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298792; x=1799834792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=04MezNusJQTBrU1XFr5tiP9BPrergzKUpucwLQhG/Wc=;
  b=ZkwdLhVNKJx23jcrmS3T3dqzODz4u0dxG8qk7t3o39ZELswZb1lWzGKV
   mo0DjtZah4eVFEcd9nVYeX/cT9/5+WAttFksNgIhtIQTkPvySX1eSID3q
   FabSVCO1/xxjaOjgFJE4LvPBKgI9rnsd7mHGg5MtAw7agIKLfNsVFP1Or
   AKdg5tMkwIC20sGELXan9anrLjp0ujl5W9KSv9+TDJOBtd8iGxhHKYER5
   5Yzha7qk0WzkM0mWCwDplU4oi+cmVTJILZ2Dk0UcTeNlrHYbkzbkqVDD1
   98/UxpDWFVoBpfcqbdcJWteWE/QzqXBpEzmcg4mbdtItpnonXXSoRi5vV
   g==;
X-CSE-ConnectionGUID: NiAmxrZbRKqCkXcAa00+xQ==
X-CSE-MsgGUID: vwAKPiWET4y8rPQMtNOmCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69660399"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69660399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:06:31 -0800
X-CSE-ConnectionGUID: HudzoV61TSCPPuiAxMMTCw==
X-CSE-MsgGUID: YPpcImdJQwKsBE8M2MDPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204954261"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 02:06:27 -0800
Date: Tue, 13 Jan 2026 17:48:56 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
Message-ID: <aWYVCImRjhIogogF@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-5-chao.gao@intel.com>

> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index e872a411a359..7ad026618a23 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -32,6 +32,11 @@
>  #define TDX_SUCCESS		0ULL
>  #define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
>  
> +/* P-SEAMLDR SEAMCALL leaf function error codes */
> +#define SEAMLDR_RND_NO_ENTROPY	0x8000000000030001ULL
> +
> +#define SEAMLDR_SEAMCALL_MASK	_BITUL(63)

If we do want Patch #3 [*], I think no need to expose this bit in
public, define it in your newly added arch/x86/virt/vmx/tdx/seamcall.h

[*]: https://lore.kernel.org/all/20251001025442.427697-4-chao.gao@intel.com/

[...]

> +static inline bool sc_need_retry(u64 fn, u64 error_code)
> +{
> +	if (is_seamldr_call(fn))
> +		return error_code == SEAMLDR_RND_NO_ENTROPY;
> +	else
> +		return error_code == TDX_RND_NO_ENTROPY;
> +}
> +

Maybe we can remove this single-use wrapper and integrate it in
sc_retry?

>  static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>  			   struct tdx_module_args *args)
>  {

	u64 retry_code = TDX_RND_NO_ENTROPY;

	if (is_seamldr_call(fn))
		retry_code = SEAMLDR_RND_NO_ENTROPY;

> @@ -22,7 +35,7 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>  
>  	do {
>  		ret = func(fn, args);
> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
> +	} while (sc_need_retry(fn, ret) && --retry);

	} while (ret == retry_code && --retry);

Seems more straightforward to me.

>  
>  	return ret;
>  }
> @@ -48,6 +61,17 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
>  			args->r9, args->r10, args->r11);
>  }
>  
> +static inline void seamldr_err(u64 fn, u64 err, struct tdx_module_args *args)
> +{
> +	/*
> +	 * Get the actual leaf number. No need to print the bit used to
> +	 * differentiate between P-SEAMLDR and TDX module as the "P-SEAMLDR"
> +	 * string in the error message already provides that information.
> +	 */
> +	fn &= ~SEAMLDR_SEAMCALL_MASK;

Why we must strip the bit from leaf number? See from P-seamldr SPEC [*],
all leaf definitions are with this bit, same for your C code:

  +/* P-SEAMLDR SEAMCALL leaf function */
  +#define P_SEAMLDR_INFO			0x8000000000000000

So my feeling is, log readability reduces without this bit. We don't
have to make all developers understand this bit, just expose the whole
leaf as magic number.

[*] https://cdrdv2.intel.com/v1/dl/getContent/733584

> +	pr_err("P-SEAMLDR (%lld) failed: 0x%016llx\n", fn, err);

I see no problem we keep both "P-SEAMLDR" string & SEAMLDR bit printed.


And could we handle it the same as sc_retry(), something like:

 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
 {
-       pr_err("SEAMCALL (0x%016llx) failed: 0x%016llx\n", fn, err);
+       char *call = "SEAMCALL";
+
+       if (is_seamldr_call(fn))
+               call = "P-SEAMLDR";
+
+       pr_err("%s (0x%016llx) failed: 0x%016llx\n", call, fn, err);
 }

And the benifit is ...

> +}
> +
>  static __always_inline int sc_retry_prerr(sc_func_t func,
>  					  sc_err_func_t err_func,
>  					  u64 fn, struct tdx_module_args *args)
> @@ -76,4 +100,7 @@ static __always_inline int sc_retry_prerr(sc_func_t func,
>  #define seamcall_prerr_ret(__fn, __args)					\
>  	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
>  
> +#define seamldr_prerr(__fn, __args)						\
> +	sc_retry_prerr(__seamcall, seamldr_err, (__fn), (__args))

... we don't need this definition anymore, just use seamcall_prerr()
