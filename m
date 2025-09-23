Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEDD22A813
	for <linux-coco@lists.linux.dev>; Tue, 23 Sep 2025 05:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758606566; cv=none; b=bqz5ceUEM0hi1YhtOryZMCqUhP4Bs3WHCzZBgqL84aynKfzmikcKXiNphNrmdmdl081L6aqJ17bM7h/YT1jhojsH5z0AMbZVUbLL/RGf8YpjNxdWNxl5VXM2egfsAIqY+ml6OXxCk/jXQwfXUgkjrbgFuTM8bawXIEuBpbJWMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758606566; c=relaxed/simple;
	bh=9KhHhKpIuAcrrNcmvN9l1vjy6d5T0ju3oNA6kv8u3Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvPVVhBuTTYHiRHKXga/1PB8sT2ItGE12ye5vE4xp0U759IW2WOhy5vTyaJlO6S0awaYt+Dp2KnzaKy2mG5jxhWP3euCR8KJpJGQG/RTLF9T/vH5rJcukCMeCELsAaiILv+Nqe+Aqv95UZJ68JOhaKKYjGbSKPR6ltjh0j25B48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEDLQ3tw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEDLQ3tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758606566; x=1790142566;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9KhHhKpIuAcrrNcmvN9l1vjy6d5T0ju3oNA6kv8u3Wo=;
  b=LEDLQ3twLM0A8G4iFz4sEb0EPKwzI+37NjYzDKLKpdSM6iIakiTN4Gxy
   tffEFXynPYhBxvB4AN5bXWq7enpA9wfEnvv+pSAhsE5vu52rhF7L8RJQv
   peWprMSO9x09ohDq6qLJlMUhRRzNf+uqCYhGBmO6++zdgYP9Jf085mX3n
   jIw3mF0FUm2cdM9MJ9gqOPCGWkNmN2orRB56p4lirkPYse0GP64Pp0Kf2
   KN9p6gFKshT0W910HJQLZBKnuir8tfa7tBxPHSZ6B4oiSBIXqEu+QEocM
   9O/rZc13ZYt6Ese/w3Gs4gkAoCbrrJWQMAQBh7EcfAhxzzrCduC38PN+y
   w==;
X-CSE-ConnectionGUID: LGZ84Ly+S/CeO4tp3mNxgg==
X-CSE-MsgGUID: Rz6uFVK7TJy0U4/X2IOvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60766053"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60766053"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 22:49:25 -0700
X-CSE-ConnectionGUID: YDt2itetQvejjsKkPHBLtg==
X-CSE-MsgGUID: 9GicGyx7R6yDu7xj6bStzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175961800"
Received: from unknown (HELO [10.238.0.107]) ([10.238.0.107])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 22:49:21 -0700
Message-ID: <76019bfc-cd06-4a03-9e1e-721cf63637c4@linux.intel.com>
Date: Tue, 23 Sep 2025 13:49:18 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/tdx: Move all TDX error defines into
 <asm/shared/tdx_errno.h>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: kas@kernel.org, bp@alien8.de, chao.gao@intel.com,
 dave.hansen@linux.intel.com, isaku.yamahata@intel.com, kai.huang@intel.com,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@linutronix.de, x86@kernel.org, yan.y.zhao@intel.com,
 vannapurve@google.com, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
 <20250918232224.2202592-2-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20250918232224.2202592-2-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/2025 7:22 AM, Rick Edgecombe wrote:
[...]
> +/*
> + * SW-defined error codes.
> + *
> + * Bits 47:40 == 0xFF indicate Reserved status code class that never used by
> + * TDX module.
> + */
> +#define TDX_ERROR			_BITULL(63)
> +#define TDX_NON_RECOVERABLE		_BITULL(62)

TDX_ERROR and TDX_NON_RECOVERABLE are defined in TDX spec as the classes of TDX
Interface Functions Completion Status.

For clarity, is it better to move the two before the "SW-defined error codes"
comment?

> +#define TDX_SW_ERROR			(TDX_ERROR | GENMASK_ULL(47, 40))
> +#define TDX_SEAMCALL_VMFAILINVALID	(TDX_SW_ERROR | _ULL(0xFFFF0000))
> +
> +#define TDX_SEAMCALL_GP			(TDX_SW_ERROR | X86_TRAP_GP)
> +#define TDX_SEAMCALL_UD			(TDX_SW_ERROR | X86_TRAP_UD)
> +
>   /*
>    * TDX module operand ID, appears in 31:0 part of error code as
>    * detail information
> @@ -37,4 +52,4 @@
>   #define TDX_OPERAND_ID_SEPT			0x92
>   #define TDX_OPERAND_ID_TD_EPOCH			0xa9
>   
> -#endif /* __KVM_X86_TDX_ERRNO_H */
> +#endif /* _X86_SHARED_TDX_ERRNO_H */
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 7ddef3a69866..0e795e7c0b22 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -12,26 +12,6 @@
>   #include <asm/trapnr.h>
>   #include <asm/shared/tdx.h>
>   
> -/*
> - * SW-defined error codes.
> - *
> - * Bits 47:40 == 0xFF indicate Reserved status code class that never used by
> - * TDX module.
> - */
> -#define TDX_ERROR			_BITUL(63)
> -#define TDX_NON_RECOVERABLE		_BITUL(62)
> -#define TDX_SW_ERROR			(TDX_ERROR | GENMASK_ULL(47, 40))
> -#define TDX_SEAMCALL_VMFAILINVALID	(TDX_SW_ERROR | _UL(0xFFFF0000))
> -
> -#define TDX_SEAMCALL_GP			(TDX_SW_ERROR | X86_TRAP_GP)
> -#define TDX_SEAMCALL_UD			(TDX_SW_ERROR | X86_TRAP_UD)
> -
> -/*
> - * TDX module SEAMCALL leaf function error codes
> - */
> -#define TDX_SUCCESS		0ULL
> -#define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
> -
>   #ifndef __ASSEMBLER__
>   
>   #include <uapi/asm/mce.h>
> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
> index ca39a9391db1..f4e609a745ee 100644
> --- a/arch/x86/kvm/vmx/tdx.h
> +++ b/arch/x86/kvm/vmx/tdx.h
> @@ -3,7 +3,6 @@
>   #define __KVM_X86_VMX_TDX_H
>   
>   #include "tdx_arch.h"
> -#include "tdx_errno.h"
>   
>   #ifdef CONFIG_KVM_INTEL_TDX
>   #include "common.h"

