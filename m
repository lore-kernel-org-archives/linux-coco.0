Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000162;
	b=FNyrzmZWmHsrLLSyuU8ZH8867gdoiLq/4sYLxEN+ygt6YHuCko0B7rUesxylzPOVElvq
	 O8u6fJ/Zjn2Z6/XPMLIbHjN+11kd7grGlTZYOOBFIubaOHurhk8okt0M3C1FCmwdw+GxM
	 lqf6bYeQEpnQ8f15e6Y2uAbXKYZJu/DCp6P7ytQO9qOwwhyllU1jl93fijt3KsJRCxz+5
	 Ue7KcC1xPrnrIOT33uFDF1+mITiDPYRgl3OIei0ytcEMhtTklkg1i57L/ncMBjM2ydJmB
	 LXRh9NKfuCke4ROQ9dkbr//hmGDKoPo9QqT/WxkQVOEKHE8B4O6uqr9P4suqhR9PQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000162;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zs7HgxeycXvf74mTwMEQ+GYGSkd4DObHrwvm085tS4E=;
	b=MI+FDTmmDDRcC6y8H8a2/6Y8KP2i1HnryjkK4hr7WbLxR1aFVSBBTjQui8RxgTBil/Up
	 WcYxBJ2JUbEXBqJnX/LTMf1XgHl0uELAo/az9+g4t3bHHytf2Xw4qc8+jUUhujxEUDw1G
	 VXViaxhP1sqgQD/qrC8xR3hDMj273cRwxxjA47TRocWrqb6RZ3Up57dSpuru41dVOPdbl
	 7+2ncG737iKmOiorByaVGzWiuDL9Fhh6UlNYc2WVfRpaDJrfV2ctAhMMG1FQJM+xrGd8h
	 7U22jwyohF4atObdBGx19vgBJL4d1lf3NkMVcS7H+ZhVWR+mzSpXBQCwabVxtIHOchQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGm2uYxW;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B5606A31A
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGm2uYxW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793000161; x=1824536161;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UYY0BSciSInHmtk2fjYSheogyiRV6ATL2WZHwt53viU=;
  b=KGm2uYxWp7ZSOT5usykZz+NEvzvXM3QxPLdcDhmK3FcSV2FN+0ntacS0
   EUyN/gy4OgoVkEn24lGcKb7f4H06GAADelOvrGUbURQj5kKrvKeQ4oovk
   NGy8QZijx0egFjoTbPEslybGJoBOxfHRCrPl6PpdaHiWMA2iYvJ6MRWHQ
   KtNFMJO4AEXNDKOaTjGbgaG9grzGGr02SN9iogpGm+6wAEn2w1rjEheGI
   vnGxAVNCADxGxj3BAyOZ7VRrlpK0IJCifdQGhGZI5LBUKuJGiZ6Yb0smD
   ou+gDT4ve0onEUglh6ycQPJCjyt+Gs4S+vTeVGDQz/QZITt2yOdgnopG/
   w==;
X-CSE-ConnectionGUID: EoR4Ly9FRc22t9GFzXWsEA==
X-CSE-MsgGUID: yxNoSWM0TbmgErdqG7kNiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1688314"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1688314"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:36:00 -0700
X-CSE-ConnectionGUID: GB1ORDnOQ1Whs2XDw78p3A==
X-CSE-MsgGUID: 0M+58ZcUTX2kvzaxwh30Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4577583"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:35:54 -0700
Message-ID: <dee26117-4255-4e64-b335-e73776df3e2d@intel.com>
Date: Mon, 26 Oct 2026 15:35:50 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/15] x86/tdx: Add __tdcall_saved() helper
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-14-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-14-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> The TDX Connect ABI defines TDCALL leaves that use registers up to r15
> in struct tdx_module_args as input, without returning output arguments.
> 
> Add __tdcall_saved() for these leaves.

It's used by TDG.DMAR.ACCEPT in the next patch. And we need it because
TDG.DMAR.ACCEPT explicitly states that R8-R15 is reserved and must be 0.

It seems the first one having such requirement. Is it really necessary to keep
R8-R15 to be 0 for TDG.DMAR.ACCEPT? Can we ask the internal arch to see if
possible to fix the doc?

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/tdcall.S        | 17 +++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
> index 52d9786da308..1dca01909dee 100644
> --- a/arch/x86/coco/tdx/tdcall.S
> +++ b/arch/x86/coco/tdx/tdcall.S
> @@ -44,6 +44,23 @@ SYM_FUNC_START(__tdcall_ret)
>  	TDX_MODULE_CALL host=0 ret=1
>  SYM_FUNC_END(__tdcall_ret)
>  
> +/*
> + * __tdcall_saved() - Used by TDX guests to request services from the TDX
> + * module (does not include VMM services) using TDCALL instruction.
> + *
> + * __tdcall_saved() function ABI:
> + *
> + * @fn   (RDI)	- TDCALL Leaf ID, moved to RAX
> + * @args (RSI)	- struct tdx_module_args for input
> + *
> + * All registers in @args are used as input registers.
> + *
> + * Return status of TDCALL via RAX.
> + */
> +SYM_FUNC_START(__tdcall_saved)
> +	TDX_MODULE_CALL host=0 saved=1
> +SYM_FUNC_END(__tdcall_saved)
> +
>  /*
>   * __tdcall_saved_ret() - Used by TDX guests to request services from the
>   * TDX module (including VMM services) using TDCALL instruction, with
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index 72520f09ef3f..90f2842f4253 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -153,6 +153,7 @@ struct tdx_module_args {
>  /* Used to communicate with the TDX module */
>  u64 __tdcall(u64 fn, struct tdx_module_args *args);
>  u64 __tdcall_ret(u64 fn, struct tdx_module_args *args);
> +u64 __tdcall_saved(u64 fn, struct tdx_module_args *args);
>  u64 __tdcall_saved_ret(u64 fn, struct tdx_module_args *args);
>  
>  /* Used to request services from the VMM */

