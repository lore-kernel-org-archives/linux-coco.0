Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636132471C
	for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232765; cv=none; b=LnQxcK/b6EOssFjZtTF14jlmsU3XvOJcPJXXVsq9xsFzSsKw7RpjHkC9WTmRxGjNiex3yqRZzTewrw5Yue342cj31qFQdR+rvWio150PZqIKqrG02w9ufsExR1twD501rrNooPAbacYkflCNX6JHHMqW++OmwJSxvLIZfucwHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232765; c=relaxed/simple;
	bh=tObj2LHuljmIcxFFHH4asCagS9fMV5T0gj9a/YvMcIM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NT4yWCzqa1MZL0px2c8gec9Hc6XE4bOFXsLX009IJemWz3RBMj7UsIO6BHxbFfDQE+vWMuedVwYdVFjo5d0V89TGIpxyK6TCIqjcZYOD7lE1IhILLn4mnf3UI1hm4QltZ1otGhSpVkAw5mbFfFfxhh5/aiFk5RU0p/M59o3zrDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKnamLi1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKnamLi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764232763; x=1795768763;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=tObj2LHuljmIcxFFHH4asCagS9fMV5T0gj9a/YvMcIM=;
  b=DKnamLi1z9jg9FChNf1uUzjFWTarZvvCODjxhF9c7P+7++1WLXx3gP1A
   5hpegF9urwbnpxRcVthqlGHJEOCtkXY2S8Wm1kk9pUhnwwOA7Z36ULkmt
   +MSUmodpSlB9oxbF3I/P02WxnZ9ubmouyX6R6Snsw+e7nXg7nHDYUxaaZ
   UE/3ba4Mn+Lw8Yad6Y6UqEkR4lW37YPPfOBOwTLn+kEhZhAd+oYXvdkjb
   PPyBPw3G79YcnDwVePGGMG6jHbEiF5L5yaozUvxlnyn7H/vX4jSrID5j6
   XpJ5X0Po06JOVLRxiqUMgK4Z8oyv/7ZBQxByhxa+J3SBWGbgrjNudOGQ7
   w==;
X-CSE-ConnectionGUID: M9gRc53SQ/iqpQfX+08bcA==
X-CSE-MsgGUID: n/G8pnP/Rf+ZfwcZsyHTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65283135"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65283135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:39:23 -0800
X-CSE-ConnectionGUID: dMIb7Gd6TrCLslpg66A4hw==
X-CSE-MsgGUID: PCFmAxCaRCeMKHcPzHu+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193986921"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:39:18 -0800
Message-ID: <ace280a8-e8cf-4eeb-a924-f88ec1f4ac67@linux.intel.com>
Date: Thu, 27 Nov 2025 16:39:16 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] x86/virt/seamldr: Allocate and populate a module
 update request
From: Binbin Wu <binbin.wu@linux.intel.com>
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
 <20251001025442.427697-12-chao.gao@intel.com>
 <a8073390-b952-43a1-8e63-18c2a10bb721@linux.intel.com>
Content-Language: en-US
In-Reply-To: <a8073390-b952-43a1-8e63-18c2a10bb721@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/27/2025 4:30 PM, Binbin Wu wrote:
> 
> 
> On 10/1/2025 10:52 AM, Chao Gao wrote:
> [...]
>> +
>> +/* Allocate and populate a seamldr_params */
>> +static struct seamldr_params *alloc_seamldr_params(const void *module, int module_size,
>> +                           const void *sig, int sig_size)
>> +{
>> +    struct seamldr_params *params;
>> +    const u8 *ptr;
>> +    int i;
>> +
>> +    BUILD_BUG_ON(sizeof(struct seamldr_params) != SZ_4K);
>> +    if (module_size > SEAMLDR_MAX_NR_MODULE_4KB_PAGES * SZ_4K)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    if (!IS_ALIGNED(module_size, SZ_4K) || !IS_ALIGNED(sig_size, SZ_4K) ||
>> +        !IS_ALIGNED((unsigned long)module, SZ_4K) ||
>> +        !IS_ALIGNED((unsigned long)sig, SZ_4K))
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    /* seamldr_params accepts one 4KB-page for sigstruct */
>> +    if (sig_size != SZ_4K)
> According to the link [2] you provided above, it seems that the layout of
> tdx_blob as following:
> tdx_blob
> |- u16      version
> |- u16      checksum
> |- u32      offset_of_module  --------------------------------------|
> |- u8       signature[8]  |
> |- u32      len                                     8KB + (N * 4KB) |
> |- u32      resv1 |
> |- u64      resv2[509]  |
> |- u8       data[]  |
>              |- _u64 sigstruct[256]   //2KB sigstruct  |
>              |- _u64 reserved2[256]  |
>              |- _u64 reserved3[N*512] //4KB aligned, optional, N >=0  |
>              |- _u8  module[]  //<-----------------------------|

Sorry about the mess.

tdx_blob
|- u16      version
|- u16      checksum
|- u32      offset_of_module   --------------------------------------|
|- u8       signature[8]                                             |
|- u32      len                                     8KB + (N * 4KB)  |
|- u32      resv1                                                    |
|- u64      resv2[509]                                               |
|- u8       data[]                                                   |
             |- _u64 sigstruct[256]   //2KB sigstruct                 |
             |- _u64 reserved2[256]                                   |
             |- _u64 reserved3[N*512] //4KB aligned, optional, N >=0  |
             |- _u8  module[]         //<-----------------------------|

> 
> If N is not 0 for reserved3, then the sig_size passed will not be 4KB.
> 
> 
