Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69613AA2F
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763711635; cv=none; b=OaGIVVi4wQxrR/Rd3OxJMR/COa8JLaESJGMHKo0/vARNVasU2ywy1kcB/M9NzSP6a0boGUcw/kmJvFuPDi0wDiHO7dxGD6W9okBtMA+M/qzZ9BM9xIMduMrHj9GHAPBihP8jHaMiyf7PDtU1nJgF+lJH+46e5R3eA+PvA170CAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763711635; c=relaxed/simple;
	bh=ws8vlINOwUn0WW3T2syZg99ahajDb3vlQunbcHB+4jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiC1foB+pejHTlmWyvz87PYwH2HsefCu9yxhhIEUqDF1iAHv9nDSOL/R0FpdVz6YeSpIps9g5Ypsn4Win50V/ljkuEE5Mo/eHt3f62QjH2OWhfgC+3r0bNJQAbcXIDDqD+2hGD5bmqdLUbyHCOdqKkAu7YIRf6MQ9BqhPwnhk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8PcgDX4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8PcgDX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763711634; x=1795247634;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ws8vlINOwUn0WW3T2syZg99ahajDb3vlQunbcHB+4jA=;
  b=D8PcgDX4u14JaRZOPZcWGdRoYk2EKTG6Up2+shpju9IbqIMLcYvRViXb
   BrNVoJNf+pkRgU9vfOdQmn3dlZdjjHjZ9nlU5a0C2eAnA/6GeahnRfbWl
   rup/Q3Rb/QBCw0VZCYL0gNBD5fcrTJBw2x39CkR0F/xZsei9Q+yQIofSh
   qkrS18Evh40glVW/apvJZ14mor+bf/bojWMoU7a7secwfNnAcZyQwQ7ex
   Y3Ygo8IjtgFRbwkRBEswuug4Bj3+uaESDqaR7J3JYyRh8+uiLBZiQp9Xo
   1KjezNwkGfng7EsLxFG3u9qMTTaaPqOk5jMK7lG8CSmbdJbd7fA8IoLvK
   g==;
X-CSE-ConnectionGUID: 2yHCP2EzTR22+uNiue2Rcw==
X-CSE-MsgGUID: QnWOa8XESnCt0W1hTPad5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69666913"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69666913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:53:53 -0800
X-CSE-ConnectionGUID: NAREq+E0THmm6zcY78iLzQ==
X-CSE-MsgGUID: 3sR6GW4TQfeve2bMcaXGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191875240"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.241.55]) ([10.124.241.55])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:53:48 -0800
Message-ID: <526f295a-326c-4999-8078-53fb758759ef@linux.intel.com>
Date: Fri, 21 Nov 2025 15:53:46 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-5-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:52 AM, Chao Gao wrote:
> P-SEAMLDR is another component alongside the TDX module within the
> protected SEAM range. P-SEAMLDR can update the TDX module at runtime.
> Software can talk with P-SEAMLDR via SEAMCALLs with the bit 63 of RAX
> (leaf number) set to 1 (a.k.a P-SEAMLDR SEAMCALLs).
>
> P-SEAMLDR SEAMCALLs differ from SEAMCALLs of the TDX module in terms of
> error codes and the handling of the current VMCS.
>
> In preparation for adding support for P-SEAMLDR SEAMCALLs, do the two
> following changes to SEAMCALL low-level helpers:
>
> 1) Tweak sc_retry() to retry on "lack of entropy" errors reported by
>     P-SEAMLDR because it uses a different error code.
>
> 2) Add seamldr_err() to log error messages on P-SEAMLDR SEAMCALL failures.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
> Add seamldr_prerr() as a macro to be consistent with existing code. If
> maintainers would like to switch these to static inline functions then I
> would be happy to add a new patch to convert existing macros to static
> inline functions and build on that.
>
> v2:
>   - use a macro rather than an inline function for seamldr_err() for
>     consistency.
> ---
>   arch/x86/include/asm/tdx.h       |  5 +++++
>   arch/x86/virt/vmx/tdx/seamcall.h | 29 ++++++++++++++++++++++++++++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index e872a411a359..7ad026618a23 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -32,6 +32,11 @@
>   #define TDX_SUCCESS		0ULL
>   #define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
>   
> +/* P-SEAMLDR SEAMCALL leaf function error codes */
> +#define SEAMLDR_RND_NO_ENTROPY	0x8000000000030001ULL
> +
> +#define SEAMLDR_SEAMCALL_MASK	_BITUL(63)
> +
>   #ifndef __ASSEMBLER__
>   
>   #include <uapi/asm/mce.h>
> diff --git a/arch/x86/virt/vmx/tdx/seamcall.h b/arch/x86/virt/vmx/tdx/seamcall.h
> index 71b6ffddfa40..3f462e58d68e 100644
> --- a/arch/x86/virt/vmx/tdx/seamcall.h
> +++ b/arch/x86/virt/vmx/tdx/seamcall.h
> @@ -14,6 +14,19 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
>   
>   typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
>   
> +static inline bool is_seamldr_call(u64 fn)
> +{
> +	return fn & SEAMLDR_SEAMCALL_MASK;
> +}
> +
> +static inline bool sc_need_retry(u64 fn, u64 error_code)
> +{
> +	if (is_seamldr_call(fn))

Comparing to TDX module seamcall, seamldr seamcall should be much less.
Maybe unlikely()?

> +		return error_code == SEAMLDR_RND_NO_ENTROPY;
> +	else
> +		return error_code == TDX_RND_NO_ENTROPY;
> +}
> +
>   static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>   			   struct tdx_module_args *args)
>   {
> @@ -22,7 +35,7 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>   
>   	do {
>   		ret = func(fn, args);
> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
> +	} while (sc_need_retry(fn, ret) && --retry);
>   
>   	return ret;
>   }
> @@ -48,6 +61,17 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
>   			args->r9, args->r10, args->r11);
>   }
>   
> +static inline void seamldr_err(u64 fn, u64 err, struct tdx_module_args *args)
> +{
> +	/*
> +	 * Get the actual leaf number. No need to print the bit used to
> +	 * differentiate between P-SEAMLDR and TDX module as the "P-SEAMLDR"
> +	 * string in the error message already provides that information.
> +	 */
> +	fn &= ~SEAMLDR_SEAMCALL_MASK;
> +	pr_err("P-SEAMLDR (%lld) failed: 0x%016llx\n", fn, err);

%lld -> %llu ?

And 0x% -> %# to align with seamcall_err().



> +}
> +
>   static __always_inline int sc_retry_prerr(sc_func_t func,
>   					  sc_err_func_t err_func,
>   					  u64 fn, struct tdx_module_args *args)
> @@ -76,4 +100,7 @@ static __always_inline int sc_retry_prerr(sc_func_t func,
>   #define seamcall_prerr_ret(__fn, __args)					\
>   	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
>   
> +#define seamldr_prerr(__fn, __args)						\
> +	sc_retry_prerr(__seamcall, seamldr_err, (__fn), (__args))
> +
>   #endif

