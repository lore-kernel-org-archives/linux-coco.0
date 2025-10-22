Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225F30F53E
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130096; cv=none; b=jxTOqLzZ/xRwWicydHHlcU/1JrQrQ9U9AsnUIeR8cuDvC0Ae5fH6dTDIM54kWOnum6LrVN2cstXl2Kc6hmMLixf6rLU40FjY2a6BOShrxTYWRseqLlVqy3ohyPdXnKd9llCKUgkjiYT0ZyM4JtzapAzqXhyhCYEgkMVmXueS8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130096; c=relaxed/simple;
	bh=QVaJ07LTWMVghF+ia3nYJLGnzon0sjQ1UwiCWbh8BuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlpHNvcAUbxnU7GN2YHnN6ZYJxxyIXj4uPXQToT2HtsvHeafn+OdRr9H2OI62Y+VbLhuCUF7hwhQAyYU+i9jEVrNyUdSTYISrXHRLKbZBhZ1wjXQw8y8yXRZuyysD7V+SyBKld1R/2EjdrmBLj8SECz/NExXGofQGtaq/wuPtqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FkpJA/nL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FkpJA/nL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3d50882cc2so1279574266b.2
        for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761130093; x=1761734893; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wyTDatvmudvaVCVObanXr6yqY9BZUOWSF/UQDAPRESw=;
        b=FkpJA/nL8OibMaA75D9Xw0nL7Vo0OpFBCJNY4cC7QvQpUOFDm3bwOAL012W1k5MHUN
         1zkRDJVXBF4sLTcrL7QL3zWwOVDxD1dciVA+zOmHJdKZpRrvdTNiz0wgAMqjr31HRUcG
         qxg2Y5NSJa2Q0mUKciB/h84tmTjqrCgTcFaD0hWCGtpUBut8MX1zij0pES7ci3CgPP8d
         E3YVlgITg+COZ8PrB8z5TF5Ee4dEZwfFCdJcTFf2oImrgET3h0o6WRwChcXoDWcxtaY2
         X7qLDvN5mLglgUrxNXZNR/K8eqi1f2SEVREUGzYceSjmsRhQNCMxiAEIHQSfjxz3GW0K
         lkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130093; x=1761734893;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyTDatvmudvaVCVObanXr6yqY9BZUOWSF/UQDAPRESw=;
        b=X/CRsWKimUE9qFM+obdyjuZrLAz7HmkxQe/Cxeyz1gJDsapLWC4DQFqncqo+NyKamq
         iqfZN3kirXpAPx5D33qUTBAl0LZQ12kOBmZpfyCsWfUEJF4eW4A80E7E2J/JSnR369bC
         MbZwjhKbryRm+jSEwS7ue1dWl4o8kSHiBUeO9aIDI3f49qlUfujD4yuNibHxxqkul67q
         YsvdDRFNiYuIhoBgLUCFk/tm1sAFTkx+QFtUG2Xg2Tqv8JtbK5o2UELMtvaUz8xzlUFH
         TNKtC/HnmiqQhgs4zeyqyKAmGlu24IE4VhdOlSVhyvY6tA6g3Sm8xWvbuIzi7fwCMEBl
         gXBg==
X-Forwarded-Encrypted: i=1; AJvYcCWD40pB63pZlefijC7q6yQg7C9iK34eyBOLnJZwxKxGUfyDh2VBmOLVTVq252m9oC1Ns4fifPpMDCjH@lists.linux.dev
X-Gm-Message-State: AOJu0YyhgfP5AUHelStr+/7O10e8UatjxfZ5WH8pud0eq0xuzhaGNO0q
	PIQVWPxSX5naTfcpbti1K419pW81pq/703Xuh9CRWHAGwqnNeBfOlkGcbe2USQVQSyk=
X-Gm-Gg: ASbGncspSpinxbVzI81o3u6Y4SIZRTrrKmq0mSFskjZAmjFFU6QQ0WNdyQHBnX+3s/P
	O5JUg0/1jfH9/p7yyRl+bO1OkKhpKFf5Mb5AClu3Q/CCe2VETjnr7QOns8RkboUwtceCl/sMOKR
	N3lGX3CzHc2ZWdoW4eGomyDchdytVbTxyPMOgcFH5Ov5zubivbjVWUx84/y9FY5AqGxQZyraz5s
	wWzZdzJ8gGAFmlvLlAFXkFSrjTt52d/Dz7gHQf4OptltQlI+FIJUkjM9pBm4OHiv8i4F8fsuh4T
	cYCL6ZYdDHe61cb+1Q0KMtJZpbbAeZn6a5Oe9rf/9gNtX1tGYFe/Ovd7LSJ7SmtaaFbX6sWoHsg
	vHpiRGGFinocrwGBwa+DoVlFir7tIQJOIsHwdtSMI8dp2xngYnoI+V1X6fE3akpyxh/gsouS60n
	r1ZScJzQURBhwqTswJr5JucGcqOvk=
X-Google-Smtp-Source: AGHT+IH02Pv2zF35pb195hrYqGX0vI8fSkdkSVmQqfLyjsp9OlEpZ6RU5SxP5aIaXgeTgN5Oe+XIGQ==
X-Received: by 2002:a17:907:a909:b0:b40:b54d:e666 with SMTP id a640c23a62f3a-b647235eeb8mr2634543466b.16.1761130092650;
        Wed, 22 Oct 2025 03:48:12 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d37348ec0sm96539266b.77.2025.10.22.03.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:48:12 -0700 (PDT)
Message-ID: <5e560948-8a71-4b07-8e1a-ed3debdd5540@suse.com>
Date: Wed, 22 Oct 2025 13:48:11 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
References: <20251022093644.320207-1-nik.borisov@suse.com>
 <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
 <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>
 <20251022103031.GX3419281@noisy.programming.kicks-ass.net>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20251022103031.GX3419281@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/25 13:30, Peter Zijlstra wrote:
> On Wed, Oct 22, 2025 at 01:21:25PM +0300, Nikolay Borisov wrote:
>>
>>
>> On 10/22/25 13:14, Huang, Kai wrote:
>>> On Wed, 2025-10-22 at 12:36 +0300, Nikolay Borisov wrote:
>>>> _seamcall/_ret/_saved_ret can be the target of indirect calls via
>>>> sc_retry_prerr/__seamcall_dirty_cache so on machines with CET enabled
>>>> such call chains result in a  splat and a BUG():
>>>>
>>>
>>> [...]
>>>
>>>>
>>>> Fix it by adding an ENBDR in TDX_MODULE_CALL macro to cover all
>>>> cases.
>>>>
>>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>>> ---
>>>>
>>>> The kernel this was observed is a SLE, however it contains the current upstream
>>>> TDX patches. And looking at the usptream code the problem persists there as well.
>>>
>>> Does your kernel contain commit 0b3bc018e86af ("x86/virt/tdx: Avoid
>>> indirect calls to TDX assembly functions")?
>>>
>>> Some history about this commit:
>>>
>>> I firstly found __seamcall*() could be indirect calls in some randconfig
>>> when building the kernel, and tried to resolve it by (effectively) adding
>>> ENDBR:
>>>
>>> https://lore.kernel.org/lkml/20250604003848.13154-1-kai.huang@intel.com/
>>>
>>> Peter suggested that we could use __always_inline to keep compiler from
>>> generating indirect calls (which resulted in the above commit):
>>>
>>> https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/
>>>
>>> I never met __tdcall*() could be indirect calls, though.
>>
>> Well, adding __always_inline to sc_retry means it will be inlined, but
>> inside the body of the function you do have:
>>
>> __seamcall_dirty_cache (which is also always inlined) but in it you have:
>> return func(fn, args);
>>
>> So you still have this indirect call, no ?
> 
> If you do always-inline, the function argument can be constant
> propagated, and thus func will be a known function and not result in an
> indirect call.
> 
> That is:
> 
> void foo(void);
> 
> __always_inline void bar(void (*func)(void))
> {
> 	func();
> }
> 
> void ponies(void)
> {
> 	bar(&foo);
> }
> 
> The compiler is clever enough to see that is a direct call of foo.

Thanks, I verified this, turns out we are using an earlier version of 
10df8607bf1a ("x86/virt/tdx: Mark memory cache state incoherent when 
making SEAMCALL")

Which contains do_seamcall instead of __seamcall_dirty_cache and that 
do_seamcall is missing always_inline so likely it's not being inlined.


Apologies for the noise in this case...


Though the fact that this __always_inline interacts with CET is somewhat 
subtle and not very evident from the changelogs.

