Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93CC348C5D
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572654; cv=none; b=mROyRK5FA/2ApyxyFDRU9y6PVQkVvLOnTsmAdAKEise1/JBgjIa9YETECMYI/71v0CBSwD92UeQE8SBU72cI+PR/OcyGvO4ozXaUIt5hTBtWr+vAvNFW0qJx+7gthFd2jqSkWD6dxX8JRbk3N/dO2/VPS4HqepCemWKafTO00UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572654; c=relaxed/simple;
	bh=KGk2946u4ZaRHtuH8RluIW/y9+1kJkLMkpB+5qdDnSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuAGJB2ZLP64gax+2/de/LoDBwO2vLMr9YzZvvzKNEsmiroahSGUblzc2noFYU5Xv47NzbfZSlzEsKxxB7nMlWr8sMRTotm/SWBPRJQbpjdsk+ZxK7TNy+Pu5N1ftJZPwz3gozXkAHJrwHVVKijoAU269rhg317scTm+RZnf7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6SjbJFS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6SjbJFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790572651; x=1822108651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KGk2946u4ZaRHtuH8RluIW/y9+1kJkLMkpB+5qdDnSA=;
  b=F6SjbJFSiyfl/7NVWuywdWWaJA2OB5E671H5t1IR2l86/TvFkTyp6Iob
   zbC87EL3eVNf3GUiKfDM76VPfuB0LGKvdufL5eGA1+7xhwLpAvUD7AIba
   ZPYbiRJIRlWlpyoRZzqR36JAycv/VVzXwLLjwuygC5m3GQYSe3AYiizKE
   YAMUNiRVlC+YiG8q6bTc8wOU186FQqgZBW8yfaJ5I5aUz69Qy7+AQAa9I
   MT2kUB4dqWG7W1EIHBknX+f1M1RZiE0987ZWsSWYqEwfc+OOo2r2e07SS
   srvOsS5tOxlfn7T1bX1h6etkNtGH+4EUqyicRofh1pWDo0fWGNfgAqBDc
   w==;
X-CSE-ConnectionGUID: JNYUsyvjQQeeHQ9PEDtqIg==
X-CSE-MsgGUID: qwaUXWQ+RIiOS6rNtYQuKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91124353"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="91124353"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 22:17:30 -0700
X-CSE-ConnectionGUID: ZlSBUJn2T4OBzcih6HJCkA==
X-CSE-MsgGUID: XQci3y0HTxOOekXAGCTqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="301222640"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.119]) ([10.124.240.119])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 22:17:27 -0700
Message-ID: <4993f86a-5085-46f3-a944-9dfbf1cc63c6@intel.com>
Date: Mon, 28 Sep 2026 13:17:25 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/tdx: Restrict attestation exports to the tdx-guest
 driver
To: Nikolay Borisov <nik.borisov@suse.com>, kas@kernel.org,
 rick.p.edgecombe@intel.com
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, x86@kernel.org,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
References: <20260925131808.2415177-1-nik.borisov@suse.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260925131808.2415177-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/25/2026 9:18 PM, Nikolay Borisov wrote:
> There are few remaining attestation related functions which are exported
> via EXPORT_SYMBOL_GPL, yet they are solely used by the 'tdx-guest'
> driver. Let's just limit their visibility by using the namespaced
> EXPORT_SYMBOL_FOR_MODULES.

Nit: Drop "Let's just" for tip maintainers.

> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>  arch/x86/coco/tdx/tdx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index f904a636d449..a38e44401840 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
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

