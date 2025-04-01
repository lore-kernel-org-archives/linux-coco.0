Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758431BEF77
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 05:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487069; cv=none; b=CKYcsIvSX672tQcU3znd8cUFxUWqzlHaI6jBJOC2m6GBIPQEpMF371n4NG6Igm/tNXqTHXpgUTmHCwVL/ObJZJ0VLgcM6MujWv4EUAugBDQ1m8UhE8Zc2bCfR1nBoWdXzQpLLA1Oanor9h2N5NMtBX/el9TgtmrJswuUNMLIT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487069; c=relaxed/simple;
	bh=Tg8NE179pIoKTkYxqXdaqoZpP1MRgabt/Ct3QXaY8tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+90LDkxcgDQs4ysLCDxfO1NhL9qDWqY61clTpLMtkIjzzcwl3mEckBndpqz4YdWm6Cxi7mareTByRkLHkkBcW/o2ljKyx3bTPZWNOPu/xIO38oaYGm0YiZwX7wW41KsB58VgA1vKRw/gmGwXOtX+6y/pL/EMUOxNEKpkPrV1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RJgA7hCL; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RJgA7hCL"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so821529566b.1
        for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743487066; x=1744091866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lccw6A9vzMJ6BKh7gXq9qnm3AIfT4fRlC/uJQrdTuVc=;
        b=RJgA7hCLWmygyfbdd9kPbNpQ8IMV83pywD6260BZNZ6MPJo/XwoU2rjptXMEClaIOM
         h4Wjc7kZbKgOWAADcLrSU6LGYtFG3iAh/IMlgIVdYQHV5AaMBJdP2n/3ExtEMYZL0L4U
         1ubJMgte0+nbBgxgj2ia0jepAdZCJDDZF6m+nhjsfsfwo6YDpv3lYYuoTVVFZ/zKgXQW
         EJ6vw5iPJYWRg/H4S1P986n9emOwuvzWJ65W7ydsFIRNkHuhHMkWX2+87Cn3a0HJ6so0
         Gi7U28l5npXiFg4EA5JEgwGEYrFEhLDrimGv+obgDxVRjeAPj632HFVh1usGsR6ZLU3N
         8hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743487066; x=1744091866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lccw6A9vzMJ6BKh7gXq9qnm3AIfT4fRlC/uJQrdTuVc=;
        b=ZnU7TJ4XKRlZh5m6bZG7kWIyolLqFK6R0a3WrgYY/r2BbFLIojP47quzR0PrH8RwuE
         G/EtJqSAtN9wZPo2NLJdja8mnRsGzzEUKblNVolcYLP+dkSoW0wQXqv8xOqM6gcvBRmc
         XD4n2zkdO+HOuQS2y5/6Ve/OAWwC6uaKjUN1L5Qpj1OZnlH3vB9TbE8hq7/qcN8nOXXz
         uF7/v5vxj3eKnE2d3t+zSqK4si2CHVJfVvThHNuvs8T19xbJv6JvKK3NrpL4h4sw0sXJ
         sY7pRuf3Zt0VyXb2gPp3jX43yNoLmyraafgsaAAUovIIlViR3f4YuOe4IoZYmU8KWpXh
         RJIw==
X-Forwarded-Encrypted: i=1; AJvYcCWUIer1dyMsas1IXdbAVMcQcHWR7oaID6+klKWTJ2vKviwkcSj9Pn4pgbrwnQn5ah78uSuqFNaWHB7O@lists.linux.dev
X-Gm-Message-State: AOJu0YzWYOdppI8xxW/9FFR/BaPCdbV/cyC3sr8zVu2SoJ86asFTkp1A
	Q1Rt0sgIbO1Y+Ed3IUjs0TPWElNt4Aa37g0n8v2GeVQhHWby3xGlFUnGtx9l4AU=
X-Gm-Gg: ASbGncsnNCe+ijFjxSGyZgUXZOvOJXWjwXjHNxIIYD5weScu6mgeXaUD/42QxRrSYjy
	DkjYprOMGHlNHggSyorVrcX8CHYAJ2GW9WDrurDyBKK1aGxchHqJTJwAWBdKe4HRvdenBc8FGwM
	PvZBsE5zdAqCfllFSYt0OyxSi3nUpy9gSUrRS56PnKN4YIqky8zYQilpyGCkKVqtAZTW73tl4K0
	6j7VmtiWbPVbtK+LaTiKmwmbch6oCbZCiqPSEE5aX+Xuhs0y/cTajQLXdZWOeUBBUiF1vfkqLAx
	PDvWafFMpjgn0GTBgAACJPZvKb9NLdAWucAPJNxeIRwZZEOcVw==
X-Google-Smtp-Source: AGHT+IEvjpcJpp5uC9FTtLHiwqjKE2oXvU4sQc9FlSK9mFcbcVYySdPLAbEWl4XwZWiv4tvHpzpGlQ==
X-Received: by 2002:a17:907:c920:b0:ac3:bbc8:ecab with SMTP id a640c23a62f3a-ac738a151e3mr799397666b.11.1743487065692;
        Mon, 31 Mar 2025 22:57:45 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b21fsm720158866b.71.2025.03.31.22.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 22:57:45 -0700 (PDT)
Message-ID: <7ed9418b-db12-4678-bf7a-634daf66282d@suse.com>
Date: Tue, 1 Apr 2025 08:57:44 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ioremap: Maintain consistent IORES_MAP_ENCRYPTED for
 BIOS data
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: x86@kernel.org, Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>, stable@vger.kernel.org,
 linux-coco@lists.linux.dev
References: <174346288005.2166708.14425674491111625620.stgit@dwillia2-xfh.jf.intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <174346288005.2166708.14425674491111625620.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1.04.25 г. 2:14 ч., Dan Williams wrote:
> Nikolay reports [1] that accessing BIOS data (first 1MB of the physical
> address space) via /dev/mem results in an SEPT violation.
> 
> The cause is ioremap() (via xlate_dev_mem_ptr()) establishing an
> unencrypted mapping where the kernel had established an encrypted
> mapping previously.
> 
> Teach __ioremap_check_other() that this address space shall always be
> mapped as encrypted as historically it is memory resident data, not MMIO
> with side-effects.
> 
> Cc: <x86@kernel.org>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Nikolay Borisov <nik.borisov@suse.com>
> Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
> Tested-by: Nikolay Borisov <nik.borisov@suse.com>
> Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

> ---
>   arch/x86/mm/ioremap.c |    4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 42c90b420773..9e81286a631e 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -122,6 +122,10 @@ static void __ioremap_check_other(resource_size_t addr, struct ioremap_desc *des
>   		return;
>   	}
>   
> +	/* Ensure BIOS data (see devmem_is_allowed()) is consistently mapped */
> +	if (PHYS_PFN(addr) < 256)
> +		desc->flags |= IORES_MAP_ENCRYPTED;

Side question: Is it guaranteed that this region will be mapped with 4k 
pages and not some larger size? I.e should the 256 constant be dependent 
on the current page size?

> +
>   	if (!IS_ENABLED(CONFIG_EFI))
>   		return;
>   
> 

