Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF01B63B7
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670600802; x=1702136802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q8N2XjMXM6I+jsDrrd5PF9tR+Xb8pSXqIisIGUSW73s=;
  b=CrC/mO40Z3gTzhoxcSXzFlwAmuX0dE6SN9rWcnpJIWo4sKOyiw2Q8h1N
   owXuZLGNrIvhdpIdV9gBMD3ZO0vuRezlUc+35Lx+Z3eWg75Iq5OqGMzRP
   FmgO8s+PgQAg4YyEH+fd5Xrk2TR+IU78J8UCfKPDUNHPxlnWvXoRJgTFK
   MjQuDaS/4qhA5g+AtlWXr212YCWFye0ZKOVcykbbZXKMfwkUYG8mv2nfV
   7am98SbySGIcRDRWG5m1DTjs/FbrKWed7NqB6CuQPTd5mSdsn/7wgACe5
   bEiqHvbOnWn3Jzwi2vbiPLmviGDDIHFhmz00vuK+z2XBmY0DELxBUO2HF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="297163538"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="297163538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 07:45:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="679964637"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="679964637"
Received: from rrode-mobl1.amr.corp.intel.com (HELO [10.251.24.37]) ([10.251.24.37])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 07:45:35 -0800
Message-ID: <acef3c81-635e-6753-577e-3905117823b9@linux.intel.com>
Date: Fri, 9 Dec 2022 07:45:34 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] x86/tdx: Relax SEPT_VE_DISABLE check for debug TD
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-4-kirill.shutemov@linux.intel.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20221209132524.20200-4-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/22 5:25 AM, Kirill A. Shutemov wrote:
> SEPT_VE_DISABLE check is required to keep the TD protected from VMM
> attacks, but it makes harder to debug guest kernel bugs. If guest
> touches unaccepted memory the TD will get terminated without any
> traces on what has happened.
> 
> Relax the SEPT_VE_DISABLE check to warning on debug TD and panic() in
> the #VE handler on EPT-violation on private memory. It will produce
> useful backtrace.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 8ad04d101270..0e47846ff8ff 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -38,6 +38,7 @@
>  #define VE_GET_PORT_NUM(e)	((e) >> 16)
>  #define VE_IS_IO_STRING(e)	((e) & BIT(4))
>  
> +#define ATTR_DEBUG		BIT(0)
>  #define ATTR_SEPT_VE_DISABLE	BIT(28)
>  
>  /* TDX Module call error codes */
> @@ -207,8 +208,15 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
>  	 * TD-private memory.  Only VMM-shared memory (MMIO) will #VE.
>  	 */
>  	td_attr = out.rdx;
> -	if (!(td_attr & ATTR_SEPT_VE_DISABLE))
> -		tdx_panic("TD misconfiguration: SEPT_VE_DISABLE attribute must be set.");
> +	if (!(td_attr & ATTR_SEPT_VE_DISABLE)) {
> +		const char *msg = "TD misconfiguration: SEPT_VE_DISABLE attribute must be set.";
> +
> +		/* Relax SEPT_VE_DISABLE check for debug TD. */
> +		if (td_attr & ATTR_DEBUG)
> +			pr_warn("%s\n", msg);
> +		else
> +			tdx_panic(msg);
> +	}
>  }
>  
>  /*
> @@ -682,6 +690,8 @@ static int virt_exception_kernel(struct pt_regs *regs, struct ve_info *ve)
>  	case EXIT_REASON_CPUID:
>  		return handle_cpuid(regs, ve);
>  	case EXIT_REASON_EPT_VIOLATION:
> +		if (ve->gpa != cc_mkdec(ve->gpa))
> +			panic("Unexpected EPT-violation on private memory.");

Why add this change part of TD debug check? Should this be a separate patch?

>  		return handle_mmio(regs, ve);
>  	case EXIT_REASON_IO_INSTRUCTION:
>  		return handle_io(regs, ve);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
