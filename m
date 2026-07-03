Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904E3EA66
	for <linux-coco@lists.linux.dev>; Fri,  3 Jul 2026 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036848; cv=none; b=G31jwZ8CQyeo5yF7Z/+SSRYrGFpq4ZnhwsX6t8H3KYFlZi8DzhkFXw7t0CFeNrvgwc97hNWQuh+uxr7JpiX1314UHkReNGpz/sQY2My3yoakXm2woLH0at2HSAb7giKjgtNv5N+85BGV/XiI7wcMQhVW83iFOh0+rMqzutvabCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036848; c=relaxed/simple;
	bh=4ZqX7AJlZYYIP4X9AHmVAF/9mvHXURkyy6Nl72zqswE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4i5Voi7CDXTgxJaSQTk/fm3/isnSbWgiuaumiO3k1s9W+z0sKCCYyihDjHubzqRFYBFalDIO5BDVRhsNoANR4UpbvPj46aKXgTmK1oQopUlDV16ygc+tGz5FxAd093kIzSrSfSb9ZVusxZkOSia5xJgB0dsAGfCxO2fzBBS0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlW+LJ7P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlW+LJ7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783036845; x=1814572845;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4ZqX7AJlZYYIP4X9AHmVAF/9mvHXURkyy6Nl72zqswE=;
  b=IlW+LJ7PT4A1SuulMD0UV/xwfEjkCQeujk8sBO+IRipZZnSnWt3i4iYr
   3XVI0t4lbQ6VM8BB74C2sMbvqI6hOtfAuDtAIICEcXbZV3s475VBUSxND
   MSRCtJt5JWTV0ZCYku7ZPJc+Pto4s8t1ODuy4R9sqWOxA+pS7n2W4msdF
   KxPgACDCctvxRyNShUQihGdcBP4bQZD1Dz3ZlLDA5hKWeRM5y/w4cH5Dm
   /4ToyDFQ5UjiQKApeoPLiCMvALIs+cV/SwPLGVYMwzH92t7ZOv2Ox6942
   /JrGr6FxlvJIwnVw5uiXygEI1/vtTh457q4M9A4cLMR/ppO2Tj2D+Df8B
   g==;
X-CSE-ConnectionGUID: mbPhwFLdTu2rrkI077ahkQ==
X-CSE-MsgGUID: UFGCjWqtSnWEjdrV3I0vOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83659354"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83659354"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:00:44 -0700
X-CSE-ConnectionGUID: 2h8jT0PWQF2ussXHNafE/A==
X-CSE-MsgGUID: VFYW9WDZSC28NrOnMS2g2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251913535"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.18]) ([10.124.240.18])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:00:42 -0700
Message-ID: <ede965a3-0fd6-46b4-906d-716bce163036@intel.com>
Date: Fri, 3 Jul 2026 08:00:38 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding support
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: kas@kernel.org, rick.p.edgecombe@intel.com, dave.hansen@intel.com,
 dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
 djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com
References: <20260702144614.59464-1-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260702144614.59464-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/2026 10:46 PM, Xu Yilun wrote:
> +/*
> + * SEAMCALL leaf:
> + *
> + * Bit 15:0	Leaf number
> + * Bit 23:16	Version number
> + */
> +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> +
> +static __always_inline u64 __seamcall_encode_fn(sc_func_t func, u64 fn,
> +						struct tdx_module_args *args)
> +{
> +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
> +
> +	return func(fn, args);
> +}
> +
>   static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>   						  struct tdx_module_args *args)
>   {
> @@ -39,7 +56,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>   	 */
>   	this_cpu_write(cache_state_incoherent, true);
>   
> -	return func(fn, args);
> +	return __seamcall_encode_fn(func, fn, args);
>   }

Can we drop the new wrapper? I don't see why we need it. The wrapper 
makes the code harder to read.


