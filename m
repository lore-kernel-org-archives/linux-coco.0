Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382C10A1E
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 01:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769564053; cv=none; b=qRJ52ZuB1OKjqcRd409f3ZLlBDrD3u4rNETd4Tadr2/gVwdiifBkzaeCAjQ0CKVkdSHha6ETKRdXw0es+x6OEaHf5QOCickbbFCg+EPsteUqyf/OPZGrJVv2EYUdX6gL1IHHGio96+Gnp+l985pEae/Cgl44qsFT7W+5wt8jB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769564053; c=relaxed/simple;
	bh=aAYPh5TPK/vfiT78Squ9pWrx3KTzRn+qCmkivAFewNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZRJnJNqQLd5W575f6oHP1JuCZ8TGMXsnaAFOemydYsAk/Apq5BBIIJmCYw30dCYDxpyMEAH3FlXSF8FEJxOQOzC4E/eDcM+WcH2AsmPjyNylVfxdgMTetnP/h7IpVejBS4mcHBeRgC3cmUPao7zT3vvGEg/H/o6frMOKew2FXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0/voP2e; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0/voP2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769564052; x=1801100052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aAYPh5TPK/vfiT78Squ9pWrx3KTzRn+qCmkivAFewNA=;
  b=J0/voP2egxwUOGHaczsVUmXdZKHtErw2hqHaRnsbuxzJvJlhxB6yjZ1M
   QdfN01DJXghdKnUDohklLQTaZkXq7L0KlggrBuS/nYAE7JVBbcd2XEqsl
   9N9+jenTjwCdZpyu0wANfr0V0WuUO434HohUBHjBClJxToMul8Of5ou53
   i5AUuYE0f5Z7oRASQnZA7C0f4BQMGf7Xeth4+32hwfNedtIHLJlvn1OXF
   Qb/xbs3ZmX8VzWMRF1pjINaygWEorcBKqxHT6O7fBtPK0SZnTaRYD0ASr
   NJ6iVd9e/DSOU2nmv9h3LAPrebOM+QQR7jTiFUuzPWtK6AJVbVt9X4N70
   Q==;
X-CSE-ConnectionGUID: Kvb/A0wmSOGj5SEt9z8nkg==
X-CSE-MsgGUID: oZbuvHSaR2mkVaqTbdio7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70826647"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70826647"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:34:10 -0800
X-CSE-ConnectionGUID: EkU0K+txS1q0+J8xpptafw==
X-CSE-MsgGUID: 71fFB8RpRjWU3AbpcnA3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208024708"
Received: from unknown (HELO [10.238.1.231]) ([10.238.1.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:34:05 -0800
Message-ID: <35fa8047-7506-4a78-b493-732160c3d25c@linux.intel.com>
Date: Wed, 28 Jan 2026 09:34:03 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/26] x86/virt/tdx: Use %# prefix for hex values in
 SEAMCALL error messages
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
 ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
 yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
 paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
 seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
 dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-3-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260123145645.90444-3-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/2026 10:55 PM, Chao Gao wrote:
> "%#" format specifier automatically adds the "0x" prefix and has one less
> character than "0x%".
> 
> For conciseness, replace "0x%" with "%#" when printing hexadecimal values
> in SEAMCALL error messages.
> 
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
> "0x%" is also used to print TDMR ranges. I didn't convert them to reduce
> code churn, but if they should be converted for consistency, I'm happy
> to do that.

Generally, is there any preference for coding in Linux kernel about
"0x%" VS. "%#"? Or developers just make their own choices?


> 
> v2: new
> ---
>  arch/x86/virt/vmx/tdx/tdx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index dbc7cb08ca53..2218bb42af40 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -63,16 +63,16 @@ typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
>  
>  static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
>  {
> -	pr_err("SEAMCALL (%llu) failed: 0x%016llx\n", fn, err);
> +	pr_err("SEAMCALL (%llu) failed: %#016llx\n", fn, err);
>  }
>  
>  static inline void seamcall_err_ret(u64 fn, u64 err,
>  				    struct tdx_module_args *args)
>  {
>  	seamcall_err(fn, err, args);
> -	pr_err("RCX 0x%016llx RDX 0x%016llx R08 0x%016llx\n",
> +	pr_err("RCX %#016llx RDX %#016llx R08 %#016llx\n",
>  			args->rcx, args->rdx, args->r8);
> -	pr_err("R09 0x%016llx R10 0x%016llx R11 0x%016llx\n",
> +	pr_err("R09 %#016llx R10 %#016llx R11 %#016llx\n",
>  			args->r9, args->r10, args->r11);
>  }
>  

