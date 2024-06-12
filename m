Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7F16F287
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194229; cv=none; b=hVjh/WOXIvIm89Ko8YGfc3FU2KPZzoRqWmhJs79bo3/YItQwbn667U/sAjo0VIk0KQ0uM5xA2zo86OhKwDrKGOffeNiriZfxZ2ZJBSTt9nqhOJM9hS5zWGdqWxf30QoLeZMmBHiBzEJqgTVzLU42fuv3glPMge3QAziXdUsReJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194229; c=relaxed/simple;
	bh=nE4553TxyitFOBDLcCTTvnCeXYTTa0XYRR7Q8BQg9JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dn39RHjCPh+7ry6Z66BTEXpPha6LY3Q4rq0FoZIp0KsDSOl9LERieghSF5bZJh2TtSaS8qWRwE2w5oKH3TGJJi4qYUdXg/aneUIEcS/lGbCa0/u4fUCG7hZI1+aumJUikSm7z9XUndpTY6QRTFTaWIpAanV0/1fC26F0ByCOlS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WvpkSjus; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WvpkSjus"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so10437885e9.1
        for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718194224; x=1718799024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl1E6gKaYfsGolM4dsZnb6DX/G/+das4ShQn/qg2O/U=;
        b=WvpkSjusncrAGABNzG9EMFR4d4xPJTSNFcOUJ8iy5OVx0gDBtIp3th12qYKrrBrM7y
         xRunulBAorxBlvD7DmSPzx3mFa8DVyKjcR7+WE4HKnRmsCCzh7pcxRJ8tBGH7tpWWWF+
         S7ozHPQvs0Rc+7svrndJBrXIAcnREToAD+/LqC5kysAHSG4fW0pgCiY5soUJ6K9MaGVD
         kQJXehZOFWVVuEGvDA3mMNz748LvXWPNkmGhf4mvzWDs3A5snJrQi+t0pIlpUv1rLtA0
         /StWluOueprZH1vb4x4H4E4IrnvqscX9S3Z1rdgD41cyMN39zPg1WTYFQ9s1sGEbc60/
         rFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718194224; x=1718799024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl1E6gKaYfsGolM4dsZnb6DX/G/+das4ShQn/qg2O/U=;
        b=oZIgMX+Veb4xsr/eJ0Cyle+r055trc/IuP/s2L6Pc8riwAErQBrsp2mR8fC0p+eQ+q
         efjhItj/gYgF/QwlpoGbKB+9mKU0p+MmI9GEBn+aIue0jscdZvQBMvlfW2RmgKKEoKj3
         oseTTw0aLUvLzjFf4I0pIs/SVu4yze9w+aUAbq2Hdbbs2WTZlodmYNI7aPceAdxeHvYs
         n2bsXPEtRBzQAdwPxZfYCtNucEL2mrO6oESQQvaQ8Ab+KdSl3HuutbRuIWoaR19Ia532
         tq+Z9J6FS1qMHU9bT9uupovrqMsybwnR/1Il0LP8cd0mZI01FQml5VxR3ZKM2hAJc/L8
         jEGA==
X-Forwarded-Encrypted: i=1; AJvYcCXa9zhMihEW6VZj2OmBx+QSIPOqCoDCXknvtLBYQV4AgN+0q1UQsazHJadpv40UKeNfrkU7RExCsyLChZvqfub3PfHL6iwczLgLeQ==
X-Gm-Message-State: AOJu0Yx/nWespA6X3v1hJ070ZIM9dYbdnKldKdOYawCYkpqyLnJdI25W
	JE9NE5A5XNCFW6lx96mHXoGEYqI4jXDDIuluo7DmvEKEX4ydxPYXOGP7E7bsUYo=
X-Google-Smtp-Source: AGHT+IGGKvFvAX2vsyi3iCxH0IVdZ+RZyQGv87uHYkT/9vnp4Qg0weBEeK0OIcuDUpXL8dTTvAYelw==
X-Received: by 2002:a05:600c:3108:b0:421:7f23:8c5c with SMTP id 5b1f17b1804b1-422866c0c13mr16496455e9.28.1718194224388;
        Wed, 12 Jun 2024 05:10:24 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:7579:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7579:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0c8f5373sm13444819f8f.6.2024.06.12.05.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 05:10:24 -0700 (PDT)
Message-ID: <6eb5c1b2-64d2-42fd-81c9-97c1ae65713f@suse.com>
Date: Wed, 12 Jun 2024 15:10:21 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv11 05/19] x86/relocate_kernel: Use named labels for less
 confusion
To: "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, kexec@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <20240528095522.509667-6-kirill.shutemov@linux.intel.com>
 <1e1d1aea-7346-4022-9f5f-402d171adfda@suse.com>
 <5d7dca1e-5889-4440-b3a0-48610f11200e@zytor.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <5d7dca1e-5889-4440-b3a0-48610f11200e@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.06.24 г. 17:43 ч., H. Peter Anvin wrote:
> On 5/29/24 03:47, Nikolay Borisov wrote:
>>>
>>> diff --git a/arch/x86/kernel/relocate_kernel_64.S 
>>> b/arch/x86/kernel/relocate_kernel_64.S
>>> index 56cab1bb25f5..085eef5c3904 100644
>>> --- a/arch/x86/kernel/relocate_kernel_64.S
>>> +++ b/arch/x86/kernel/relocate_kernel_64.S
>>> @@ -148,9 +148,10 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>>>        */
>>>       movl    $X86_CR4_PAE, %eax
>>>       testq    $X86_CR4_LA57, %r13
>>> -    jz    1f
>>> +    jz    .Lno_la57
>>>       orl    $X86_CR4_LA57, %eax
>>> -1:
>>> +.Lno_la57:
>>> +
>>>       movq    %rax, %cr4
>>>       jmp 1f
>>
>> That jmp 1f becomes redundant now as it simply jumps 1 line below.
>>
> 
> Uh... am I the only person to notice that ALL that is needed here is:
> 
>      andl $(X86_CR4_PAE|X86_CR4_LA57), %r13d
>      movq %r13, %rax
> 
> ... since %r13 is dead afterwards, and PAE *will* have been set in %r13 
> already?
> 
> I don't believe that this specific jmp is actually needed -- there are 
> several more synchronizing jumps later -- but it doesn't hurt.
> 
> However, if the effort is for improving the readability, it might be 
> worthwhile to encapsulate the "jmp 1f; 1:" as a macro, e.g. "SYNC_CODE".


The preceding move to CR4 is itself a serializing instruction, no?

> 
>      -hpa
