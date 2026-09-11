Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73A47F788
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131703; cv=none; b=uagb8yDA2EPO0VsQ8gVei58VOlAJqQfvJ2qyBmaJbTwD2WceC5i1wnNu1KlKlJ7sgu1aoDYlt+yVRymfigfhi0zkuo3xMoGu7WJY0cw+tCSmDS4+NtnrCMMclVFS9WYuszMZXdShg6DhemlJPp++UNwMyMeOvOYTAStxtRUIS3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131703; c=relaxed/simple;
	bh=HbEwk4RG1Dqvs/8RTvEgpEb0EQ67O0h3JsoDrm2W1Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+L7TUI6GBqBPJRQazry0s4hEGbuUXhAhyAvqm0jRft/qfxwNvfY9heJ2//tiPP8s/scBc7Wgq0xiw1CZuF/G9I4hRKIdRJEhUJ3kEpZafVQHly2JJTcSk4lv/zy5kniFUPhwO+z++///nnU0B1MU/nLdTDdA9s+y5RSgCb2+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrwqQYc0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrwqQYc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789131700; x=1820667700;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HbEwk4RG1Dqvs/8RTvEgpEb0EQ67O0h3JsoDrm2W1Uc=;
  b=QrwqQYc0bigUAQdiVjClT7VN1thwKHOnJHyi84SqJBpdUcyyTXgaEwF3
   i/9q6HDj3qnI3iQcWH2DQnPEJ7moQbuUewNQLf4qzrstOgQ3bcBxSw+rJ
   utJtHOKgXWnoSKt1H8s7KGgq3KB/ul6FueK5SzQn2uxlmjuV0VVbnEq1h
   NSmDgzdWxSZ0LpfiOqBMdyx4zy23hxdcBYT/iMaCdybExChPnGFeUmEbD
   N3UUvsEKZE1RLKjiXC0OoNsIEWxl7/JAmZfm0cx+uhpNTR1vdr4s0AWyk
   HgwLrv1GbpRxORWc7KvgPRryu5PuEPK5CRfCbhTzDSTBF83zglkwFh8vd
   g==;
X-CSE-ConnectionGUID: 7g/EpN+xTeKucp4VaRsPgg==
X-CSE-MsgGUID: OYPK80VbSoaLhZzzkHZGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89804655"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89804655"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:01:33 -0700
X-CSE-ConnectionGUID: j9qrzVa9QqyUSKpy4xmg4Q==
X-CSE-MsgGUID: SuIenNbQRjWylDETkdB+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="192836"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.119]) ([10.124.240.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:01:31 -0700
Message-ID: <bd287f7d-bd80-43d1-8a52-343242233b2a@intel.com>
Date: Fri, 11 Sep 2026 21:01:27 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Harden exports
To: Nikolay Borisov <nik.borisov@suse.com>, dave.hansen@linux.intel.com
Cc: x86@kernel.org, rick.p.edgecombe@intel.com, seanjc@google.com,
 linux-coco@lists.linux.dev, binbin.wu@linux.intel.com,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 "Fang, Peter" <peter.fang@intel.com>
References: <20260911113150.1022344-2-nik.borisov@suse.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260911113150.1022344-2-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+ Peter,

On 9/11/2026 7:31 PM, Nikolay Borisov wrote:
> tdx_* function aren't supposed to be used by the kernel at large, rather
> they are mostly used by KVM and a very small number of them are exposed
> via the tdx-guest/tdx-host drivers. Reflect this fact in their
> EXPORT_SYMBOL* declarations.

we found this and discussed it in [1]. It was left to Peter's todo list.
Glad to see you do it earlier.

[1] https://lore.kernel.org/all/cdb43316-6535-4f11-9fb0-abdf2adf4568@intel.com/

> Reported-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index f904a636d449..3055a76c0dfd 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -64,7 +64,7 @@ long tdx_kvm_hypercall(unsigned int nr, unsigned long p1, unsigned long p2,
>  
>  	return __tdx_hypercall(&args);
>  }
> -EXPORT_SYMBOL_GPL(tdx_kvm_hypercall);
> +EXPORT_SYMBOL_FOR_KVM(tdx_kvm_hypercall);

tdx_kvm_hypecall() is used by kvm_hypercall{0,1,2,3,4}, which are not used by
KVM modules, but used by guest kernel code when running as a KVM guest.

It seems the reason we need to export is kvm_arch_ptp_init() calls
kvm_hypercall2() and kvm_arch_ptp_init() can be called by guest-side PTP module.

>  #endif
>  
>  /*
> @@ -139,7 +139,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
> +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_get_report0, "tdx-guest");
>  
>  /**
>   * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
> @@ -175,7 +175,7 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
> +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-guest");
>  
>  /**
>   * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
> @@ -196,7 +196,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
>  	/* Since buf is a shared memory, set the shared (decrypted) bits */
>  	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size, 0, 0);
>  }
> -EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
> +EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
>  
>  static void __noreturn tdx_panic(const char *msg)
>  {

