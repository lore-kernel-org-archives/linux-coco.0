Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD3199E80
	for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738102097; cv=none; b=sAlZQRqfnrxiWipq5uZ9ZYntxDzkAvWAIbo2EFrtU0u0GCtQwyCAP9/9+Q0gyoR/Koy6qcqyXZFLvKUG5NwvY/xQOaIyLfmaGDMwg3agTlCQIsDdmIFtt12xLdNPqe0gxrgsKCGDUyGzGlqH6YK5aL4YE/VSqWBGODiqdgCwFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738102097; c=relaxed/simple;
	bh=iWDsG9iy344m0wT6tqTEC/1oN+/T35FszjAubTWDLPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VL0Xwl0jYeXJyNxPoQALCTBZx3jb3sz5RmZixF86pHfI5FjHONbYjWMQGlCZV2Uky4VgtW5cHH3B42lv39o5XbN/dOetIDD6/oqooz42REufGaBmBHXi7UIRIroz6TaNgeQHi0HHEkV/WH4fPn3S+L02wYDjV36WMRbYPYpsolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfZ9Pcbd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfZ9Pcbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738102095; x=1769638095;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iWDsG9iy344m0wT6tqTEC/1oN+/T35FszjAubTWDLPI=;
  b=OfZ9PcbdI9WPos3AAJT3iAZBWVWKkXNZejErWEqr7i3oo8OcR1xFEcVf
   dBRRoNU6ZZTwqwBP3BXZQUYcq99nl6x9qcnHSPtgP5UWYEPTDH3VzgsGX
   gmvBHItSTy0EOS1VucYy9BYirDFVvJxiMpFnOqe4zHckIQv+x0FGYO7vG
   mP+OcfsmkKYTVKW74D/hNENzBKfSdHI/jzHXPeki1kPax8t/npeDzlStd
   /eUAxgmQOzImxCj5iLALnQvBFRAvFETv9vK1NQsXjgdsWx/WjysTtMssw
   CSjuPmyu8s3t8cQI9RZ0Dz/sZks6MbLdpS/orRbq89dFRtoAlJEjz0lih
   A==;
X-CSE-ConnectionGUID: o7d6MNLYTZWBvML2JFgGWA==
X-CSE-MsgGUID: NueERHbYSAqINyA5DvZQMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38512301"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38512301"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 14:08:15 -0800
X-CSE-ConnectionGUID: 87E8zXR2RUaZNt58BW9Etw==
X-CSE-MsgGUID: gU+yM5wPQFG5bCzfkBF6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="113893048"
Received: from eamartin-mobl1.amr.corp.intel.com (HELO [10.125.108.44]) ([10.125.108.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 14:08:12 -0800
Message-ID: <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com>
Date: Tue, 28 Jan 2025 14:08:12 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
To: Vishal Annapurve <vannapurve@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com,
 ackerleytng@google.com, jxgao@google.com, sagis@google.com,
 oupton@google.com, pgonda@google.com, kirill@shutemov.name,
 dave.hansen@linux.intel.com, linux-coco@lists.linux.dev,
 chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
References: <20250128213652.1880545-1-vannapurve@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250128213652.1880545-1-vannapurve@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/25 13:36, Vishal Annapurve wrote:
> Direct HLT instruction execution causes #VEs for TDX VMs which is routed
> to hypervisor via tdvmcall. This process renders HLT instruction
> execution inatomic, so any preceeding instructions like STI/MOV SS will
> end up enabling interrupts before the HLT instruction is routed to the
> hypervisor. This creates scenarios where interrupts could land during
> HLT instruction emulation without aborting halt operation leading to
> idefinite halt wait times.

Could you please break out the spell checker before posting v2? There
are a couple problems in that paragraph.

> x86_idle is already upgraded to invoke tdx_safe_halt to avoid such

Please add parenthesis to functions() to make it more clear what you are
referring to.

> scenarios, but it didn't cover pvnative_safe_halt which can be invoked
> using raw_safe_halt from call sites like acpi_safe_halt (acpi_pm
> subsystem). This patch upgrades the safe_halt executions to use
> tdx_safe_halt.

No "this patch", please.

> To avoid future call sites which cause HLT instruction emulation with
> irqs enabled, add a warn and fail the HLT instruction emulation.

This seems like a bug fix. Shouldn't it have a cc:stable@ and a Fixes: tag?

Do you have any thoughts on why nobody has hit this up to now? Are TDX
users not enabling PARAVIRT_XXL? Not using ACPI?

> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 0d9b090b4880..98b5f317596d 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -14,6 +14,7 @@
>  #include <asm/ia32.h>
>  #include <asm/insn.h>
>  #include <asm/insn-eval.h>
> +#include <asm/paravirt_types.h>
>  #include <asm/pgtable.h>
>  #include <asm/set_memory.h>
>  #include <asm/traps.h>
> @@ -380,6 +381,11 @@ static int handle_halt(struct ve_info *ve)
>  {
>  	const bool irq_disabled = irqs_disabled();
>  
> +	if (!irq_disabled) {
> +		WARN(1, "HLT instruction emulation unsafe with irqs enabled\n");
> +		return -EIO;
> +	}

Yeah, this warning is a good idea. But probably best left as a
WARN_ONCE() so it doesn't spew too badly.

> @@ -1083,6 +1089,15 @@ void __init tdx_early_init(void)
>  	x86_platform.guest.enc_kexec_begin	     = tdx_kexec_begin;
>  	x86_platform.guest.enc_kexec_finish	     = tdx_kexec_finish;
>  
> +#ifdef CONFIG_PARAVIRT_XXL
> +	/*
> +	 * halt instruction execution is not atomic for TDX VMs as it generates
> +	 * #VEs, so otherwise "safe" halt invocations which cause interrupts to
> +	 * get enabled right after halt instruction don't work for TDX VMs.
> +	 */
> +	pv_ops.irq.safe_halt = tdx_safe_halt;
> +#endif
The basic bug here was that there was a path to a hlt instruction that
folks didn't realize. This patch fixes the basic bug and gives us a nice
warning if there are additional paths that weren't imagined.

But it doesn't really help us audit the code to make it clear that TDX
guest kernel's _can't_ screw up hlt again the same way.  This, for
instance would make it pretty clear:

static __always_inline void native_safe_halt(void)
{
	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
		tdx_safe_halt();
        mds_idle_clear_cpu_buffers();
        asm volatile("sti; hlt": : :"memory");
}

There are reasons we wouldn't want to do that exactly, but I'd much
prefer something that is harder to screw up than the proposal above.
Anybody have any better ideas?
