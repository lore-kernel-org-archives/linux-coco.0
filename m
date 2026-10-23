Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723547;
	b=Iri0wd5L8MxxfcnFHtoOCzsY9Wj/s2GYr5iQg2KrObj8c8XNwXZILrr/vbJK7CXOvdvl
	 EXIFjji22CQhuZfa0PUX8FkGURee+DYlZLzHCPUTTNV9d3I/1UVFm3y6t3VQWk8WqBsEg
	 UkFVVfc8CJklCKPy7vNXjvTGBSWPc+dsEhIldvW8sr3Uk3O4sIpTfWkmpYhSN0qczH4Jk
	 uXMvW9az2cVvXQt+w0BfTQT5eyGGU65D2zCKgKifWZnJzOUiI9cbFZT4AcxrxMMGy92sh
	 7o/HodHZ42lJTlgfYmU5cLrFL8JomcVdcC4bxN+jZUbOiURQ5aq1F7hB5qs6+O8sPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QSbS3s0vmDtq+T3Ris/Xf76yrlxgn/mTSDmsPGYjJJU=;
	b=M53F66UmWXomKzABVCQHPup8TIjjmVdgOvyEl+W15KaGESpSMG8IXoC/bFr4nvF7xk0i
	 32+GWarlM5iwvquyg7DVUO9fVxaHYdBrVTQrPBBcXFiNM4CKVKnahb7LWJKE5lOj/sdAl
	 d/rb/7xlKUYiy6W1MIZgMRCGLdvLw/OdR32drLN4uc+IRuCRe3q7Kksa9qdjLoJPj3N+t
	 MZlGR3Z0BBMMugfhVs6obIOVUhkmy97H1+jmwnuSL6LDjrS5h9p5WIU3pv9U80HkuTFAG
	 jLCPPU+p7mzU08gZj6RDuhUFNCXcYK2OkQcci+BDu1PKK4Jw7DOnB2DSA7mVhOJ8Ciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3doUzOn;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4D606A31B
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 02:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3doUzOn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792723547; x=1824259547;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zmkBsDwszqSEBhgi3KZjoMeJUUy5VTgt01umdHORaNU=;
  b=N3doUzOnYw8bVGzWZUtzVufrUGAAJRnxNRLq77QuQOlA5CWC8zN24DfF
   ssYGjnuBS4aZ6RsdHQXUzH5vsupniXbXRAo75YG3sqp+Zw1TucII9Tzh/
   5oOdA+VaqLDQJQl1u788567SrooHMNwTQS8+ZTbgC3iCE+3Tciq6c6wuO
   gNnji2dUskp5yxxaD76SKBCAENOhgqJpQJnpvHoIOPPzABNL5bqdHBjrJ
   Rui0r7wwv+PTnQ4raoGH6ca0dhBuBn5Tsjo4b8g81o22UyL2K9/NTDf9h
   u9qbshaf9y6OFL9qIsMhfN/5ui9WfKP7VYr6PdOIO8KaI4wRgQR4+KEAj
   g==;
X-CSE-ConnectionGUID: 19Lvvg7bRJ22t8Oh5/9GXQ==
X-CSE-MsgGUID: CZ6lJkEOSgemzcx/wGSvhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1373270"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1373270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:45:46 -0700
X-CSE-ConnectionGUID: yOIqoanVSuKuCQvl/YIgtQ==
X-CSE-MsgGUID: Fr4VtujwSpCPNHwEXiYtdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3612327"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.245.162]) ([10.124.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:45:40 -0700
Message-ID: <4e1d5d94-9956-4cc1-af5f-1311461ab233@linux.intel.com>
Date: Fri, 23 Oct 2026 10:45:37 +0800
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
Subject: Re: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Changyuan Lyu <changyuanl@google.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
 <20261022210134.612848-3-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20261022210134.612848-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> From: Changyuan Lyu <changyuanl@google.com>
> 
> Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
> structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed,
> otherwise KVM could confuse userspace and induce a configuration error.
> This also ensures consistency with the CPUID entries returned by
> KVM_GET_SUPPORTED_CPUID.
> 
> WARN if KVM and the TDX Module don't align on which functions have
> significant indices, e.g. to help ensure the kernel is updated when the
> TDX Module learns about new CPUID leaves, and vice versa.
> 
> Opportunistically add a comment to call out that zeroing the index when it
> isn't significant is ABI that userspace relies on, e.g. QEMU looks for '0'
> instead of checking KVM_CPUID_FLAG_SIGNIFCANT_INDEX.
> 
> Fixes: 61bb28279623 ("KVM: TDX: Get system-wide info about TDX module on initialization")
> Cc: stable@vger.kernel.org
> Cc: Binbin Wu <binbin.wu@linux.intel.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> [sean: keep the WARN, don't key off KVM_TDX_CPUID_NO_SUBLEAF, add comment]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 271c2f94b8dd..37d088f6f7a8 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2,6 +2,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/cpu.h>
>  #include <asm/cpufeature.h>
> +#include <asm/cpuid/api.h>
>  #include <asm/fpu/xcr.h>
>  #include <linux/misc_cgroup.h>
>  #include <linux/mmu_context.h>
> @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
>  
>  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
>  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> +	entry->flags = 0;
>  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
>  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
>  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
>  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
>  
> -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> +
> +	/*
> +	 * Explicitly zero the index when it's not significant, even though it
> +	 * _should_ be meaningless.  Userspace relies on the index being zero
> +	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
> +	 */
> +	if (cpuid_function_is_indexed(entry->function))

If the information about whether the entry is indexed mismatched, i.e. the
warning above fired, should we use the information from the TDX module as the
standard?

> +		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> +	else
>  		entry->index = 0;
>  
>  	/*

