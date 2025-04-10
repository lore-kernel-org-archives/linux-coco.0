Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8785283CB7
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286642; cv=none; b=kC6+nz2CRYFRydhMNHY8mG5ntxQTHJfLkdXLDtSEacOceJPsAdluHldgvH4N4SyrUOt03cmNvaeghxKFF42WS7IvkZR2lsuiHxyriFU+uSTjDJTONzJEYavIyImJYRTFS1MsIZ3u06h8g0Z1RytQmgREgJfGbXoLrUK6b9cuuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286642; c=relaxed/simple;
	bh=2rKQOrZgq4bh52HyTtYfIYZVB6+q1tu60FqPvUtWFWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUIwzoAvfxaOEV50w6zZ9pkizmHw9YTnGOvxiQhJGpUok0cLFmE8G1CZ50e0IrxXv67n0J4Rf5RqK3Z0pnUW5GFI8BReGAzbTWZ8CI11ODDzhgmjDnWUQbc6nw67x5D9S1a8IGM+ZKJifIdG6UlpuvzGn+TushgCLRBBN1aLv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cXln3uSR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cXln3uSR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so6604625e9.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744286638; x=1744891438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx/Ybo7LdyOCqv1boGDu+6oI0L/OmkkZhwa1mFKLDhY=;
        b=cXln3uSRheRQbnG35C0AhEnHom3qR/BQ7c+kOs8gSO314qD24SJps5U6pL+jZx0miO
         sKXGRAh03Rwrc0Sv7NqrtQXt6Zg1ezYxQ9GO+TzkGOzvYSiuLRSv4FeIwtk5BDsNIQiD
         c3hEWOgvcQbNIbzt1c1KuH/zjMyaSXCvX77mhCY4xT18iZHIf8OEmR+ZuaH+snl2Y1LD
         T9cIvs7Ut2HrCJwHh23Q2HmbMJI2LDop4mLEXw1OQoa7yh4lt2QxWtTrJxJ3DbwT96MO
         WCPHbgeOrtcsfG5KjgCO1SbmWwT5YpYOeTwAugvU6P2nqRhA6wOVC6rS1kX5GkMHEqOm
         Rt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286638; x=1744891438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fx/Ybo7LdyOCqv1boGDu+6oI0L/OmkkZhwa1mFKLDhY=;
        b=h5uTygdd3rvdV3M4aHzYa+YBVkcdb4xpQaaQyNWFddwog3vbWBinzqc4jswxPUCuJu
         i3DTPZFeRdw1KvQ7uE2K0HrSVEIGW60oGVsYu2sYDICu2xcd1+yu2U6qgIz37URZNr9/
         P+YNFh4uucgMLSApPiFB0LRHO8LaZIJwf6QDI0iFZ788lKcLslUK1xLcr0UXeq27N2pQ
         OjmasKKdBP7wbG1gf/kIulIrLopER2gsBLllR5Fk0ycB10HpAC/QjxYiO42ZUYXq5aBt
         GNOH7dL2Y44hf65pCEs3MNlctRkt6gTybBnqgXrVGXEmUjD3DCRkNsmKBexRj84+tz+0
         ViJA==
X-Forwarded-Encrypted: i=1; AJvYcCV02nU2rmE6c4lSHW5MYvLn8ElwvjqqTj/O3pL4lp1QMsUfUbhQO62pPpWl4K6DK26M0RwS1wnY6whK@lists.linux.dev
X-Gm-Message-State: AOJu0YwGM7xMN4RSQYr3hm+8YwrGBy2xCekLfsXnGcS47m2/hA+aMy3Y
	PIUpl9n5arnXPug8iyC372cFnuOaj614QubWWmhuo6E4ncWdCcoYIXePg79etMQ=
X-Gm-Gg: ASbGncuHEH0FAqxsnvxkkZBSfXiIzJjsFWuGyXiWNet4x/aqmFb4EHbBOuuScZxjTxh
	j4AzVawkOdT2Z+Kp2a1dH9ovygCOSRXrlG1AxxM1K9XDlTx7pdqNRMbO9XlcueqHATPkZ3qcgwA
	eMaRZmvjMd6QZxBufsZo3DkkhV5czN6UpEFL8Q8Cx+jke+i2fWR3xWGbOy8ZGkFnZpKpFHXWb1C
	Sj40bCJnWh7mhgcQTTZGcH9hoBjH6D7kRU314ygbOKc1CtBUZd0HV3KGn9RX+/Huwaek/Ma7wwo
	kWwLIWjjAdir6rSOxFTS4Cg1BvdogMa67X1GM8dOyVUhRQ==
X-Google-Smtp-Source: AGHT+IFxc33QNHSIBImw7u1RGHZDKv5pTNAQK488JtJg7nkRpcgvBbjytiqZf/ooOj08I+afBEYtMQ==
X-Received: by 2002:a05:600c:3ba2:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43f2d96cdbamr22762165e9.22.1744286637984;
        Thu, 10 Apr 2025 05:03:57 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5b08sm50799475e9.33.2025.04.10.05.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:03:57 -0700 (PDT)
Message-ID: <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
Date: Thu, 10 Apr 2025 15:03:55 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for
 SEV-SNP guests
To: Dan Williams <dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kevin Loughlin <kevinloughlin@google.com>, Michal Hocko <mhocko@suse.com>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9.04.25 г. 21:39 ч., Dan Williams wrote:
> Kees Cook wrote:
>> On Tue, Apr 08, 2025 at 04:55:08PM -0700, Dan Williams wrote:
>>> Dave Hansen wrote:
>>>> On 4/8/25 06:43, Tom Lendacky wrote:
>>>>>> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV
>>>>>> guests?
>>>>> Not sure why we would suddenly not allow that.
>>>>
>>>> Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
>>>> Disallowing access to the individually troublesome regions can fix
>>>> _part_ of the problem. But suddenly blocking access is guaranteed to fix
>>>> *ALL* the problems forever.
>>>
>>> ...or at least solicits practical use cases for why the kernel needs to
>>> poke holes in the policy.
>>>
>>>> Or, maybe we just start returning 0's for all reads and throw away all
>>>> writes. That is probably less likely to break userspace that doesn't
>>>> know what it's doing in the first place.
>>>
>>> Yes, and a bulk of the regression risk has already been pipe-cleaned by
>>> KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
>>> many scenarios.
>>>
>>> Here is an updated patch that includes some consideration for mapping
>>> zeros for known legacy compatibility use cases.
> [..]
>>> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
>>> index bfa444a7dbb0..c8679ae1bc8b 100644
>>> --- a/arch/x86/mm/init.c
>>> +++ b/arch/x86/mm/init.c
>>> @@ -867,6 +867,8 @@ void __init poking_init(void)
>>>    */
>>>   int devmem_is_allowed(unsigned long pagenr)
>>>   {
>>> +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
>>> +
>>>   	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
>>>   				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
>>>   			!= REGION_DISJOINT) {
>>> @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
>>>   	 * restricted resource under CONFIG_STRICT_DEVMEM.
>>>   	 */
>>>   	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
>>> -		/* Low 1MB bypasses iomem restrictions. */
>>> -		if (pagenr < 256)
>>> +		/*
>>> +		 * Low 1MB bypasses iomem restrictions unless the
>>> +		 * platform says "no", in which case map zeroes
>>> +		 */
>>> +		if (pagenr < 256) {
>>> +			if (!platform_allowed)
>>> +				return 2;
>>>   			return 1;
>>> +		}
>>>   
>>>   		return 0;
>>>   	}
>>>   
>>> -	return 1;
>>> +	return platform_allowed;
>>>   }
>>>   
>>>   void free_init_pages(const char *what, unsigned long begin, unsigned long end)
>>
>> I am reminded of this discussion:
>> https://lore.kernel.org/all/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com/
>>
>> As in, mmap will bypass this restriction, so if you really want the low
>> 1MiB to be unreadable, a solution for mmap is still needed...
> 
> Glad you remembered that!
> 
> This needs a self-test to verify the assumptions here. I can circle back
> next week or so take a look at turning this into a bigger series. If
> someone has cycles to take this on before that I would not say no to
> some help.


Can't we simply treat return value of 2 for range_is_allowed the same 
way as if 0 was returned in mmap_mem and simply fail the call with -EPERM?

