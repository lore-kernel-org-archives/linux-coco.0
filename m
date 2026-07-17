Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42236BCED
	for <linux-coco@lists.linux.dev>; Fri, 17 Jul 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276504; cv=none; b=DuTJXAXjwYMnZK4xZbyZtRIb4z04mMSRET6ZP9D1fT1W3Gq1BYG0QxKUhGob4wnp8MRzyMyJYmL0izHiQnqHGe1G9R5R/++jhsNgsVhO8gyxRbiSSZYDaC0W7v7/alQO3RqOh9N10sPScvWqbM0CeVK2ABwZGzBGhvzq/fGJLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276504; c=relaxed/simple;
	bh=ko2IpB7k5VtX4Ia0XfhP526K/ENSynoKNayhQ5TZV04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vt+SwgQr150FaecM12rC7Sf0N13ssSYnWRm1GLntpY3/hmgEKylbicqq6NE0ycCgKYsGgb8/mQk+sZhWq5ybyJtzxcSuCVz5ibVwsp1hejB0IsILsy1PXbb7gy3oDH6PnLjRErYqZ3JcskSbo9jLHYzaYBx9KVG83QYv895b3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zwr51Ka6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zwr51Ka6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so53665315e9.1
        for <linux-coco@lists.linux.dev>; Fri, 17 Jul 2026 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784276498; x=1784881298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sWlQ/W1d9IqfRrCuPk3DtcbakJ4wBcrfCI2PS1jWQYQ=;
        b=Zwr51Ka64lwpr3TQHgOiejLGqV2vNrRK+yaYGVOAHB4YbW8ZLDYpE9BpF2iqyXfVhl
         SqVx+VyO8gKea7y0BSZCA/Jc45WB76E2S6rnBKQlQ+rw/+/l23BMw/x9sV0st+RZPsoU
         ThsAXUnhT/zwC68HimgKBcsSd3vh1SrJmlmKgnYGLpGbP9y8PhPySCl180UCK+rz0aR2
         SLqdnmVHyVIsyROTPU+8QgmiTeE+z+kEYDqEx9USIXT4DWgNFwtvjH6nDdvPA7eg6qLh
         J8W8lZG0KyVbiK3it+mwm1wmGrk+Vx5oPlT6GvEAvB0xVrEj/AIn88Hbnehs4TQjlQgz
         +62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276498; x=1784881298;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWlQ/W1d9IqfRrCuPk3DtcbakJ4wBcrfCI2PS1jWQYQ=;
        b=l7myMwOjCAMD8LtsLaOyJJQLsllhqKiF3c/sgGRTbMlkK/5hkwR4uOh9KkUqdPutUG
         8C+2YutewqwTDLYY49HtBaBxJlBq6DdmlwMyaiQh+g8PzvFK6rIA8maY/qTJpKWNJR0d
         Z1dkAeYFrOIl36VFP8AarZZt9i85rui9bAEh007nuLMShgV5KU2+qMN/4ZI/WE/igEyA
         7FGbLNZ+GyH3vrtWm7V2N8GiROh7Dw1IBrdNUyLYrQXGx/4kY7HUrDvL3FJrRAyV7EoF
         qr9cj49yyFDDulGhiJKz4Z7irOHFY57Wwkn2Tz0NRZk5z94FuoFPTpTvSVri+g1vCat1
         QOtA==
X-Forwarded-Encrypted: i=1; AHgh+RouyzsccNo0sqZw03gJztUO7lbtYQO29AxNvt75LaqV/Suya36iyPJZqPkL4uzMtSEiaOiYZw0Auu67@lists.linux.dev
X-Gm-Message-State: AOJu0YxoDoMPGjh6xvRXlz7Hlyx7ch7Z6jDR/Y73T3yCcOCXpKpZZbU0
	aCFqQHdwnG9t3Of1LEn3wH3rixRcnvs7ZTwlC3ZhCs9q/bmqwVv3hasU+VCT3hoxkrM=
X-Gm-Gg: AfdE7cn3omF0W4IKn26yPEws4y0718YSne/JdLZIRJaZlc8yi+kLc394/evcQ9mBznw
	iDljFkBfGKHf5dTv8J36MvvrWtzqsgZn05y+PT9b3jViZq+wHoppP+UImd2ZmmUraqqaGpNDD/Z
	K6iXyb+CAkrvHRNiv5mvzGERDJeKlpdaM2r5SBAfwGhNow7Pni3PNj2C4PMAJz9PXjvh9aN6mXL
	SM5ZbzCa30QJ83lH+cChkYQoZmbhdULRkRti77SbkqHwYJMxIukbfbHrbeQ51WvY9hUxGYGmOWQ
	hxsczIjaQDixtm7EPplnES4CGRNEGATq09FcSCcN+LQGZyhdu+IVecN4lAP7L786gCtsGPpIGde
	KhQ+QD3kLXgR9nKOVUmBwlYetyo5TxNvjEd5ZvlmSTLKTJPoTiRr/pizYPdScfpfoasC4ehfKAR
	7xEFZqqiMcvyoN674=
X-Received: by 2002:a05:600c:4797:b0:493:e3ea:b23f with SMTP id 5b1f17b1804b1-4954a3dcc43mr10543465e9.10.1784276497679;
        Fri, 17 Jul 2026 01:21:37 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c9c929sm27709095e9.12.2026.07.17.01.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:21:37 -0700 (PDT)
Message-ID: <90685b93-e13e-4509-98f3-4509381d4981@suse.com>
Date: Fri, 17 Jul 2026 11:21:34 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com,
 dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
 djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com,
 xiaoyao.li@intel.com
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
 <alEXflESyo6ndDTY@thinkstation>
 <f8ef7a94-7824-4d1f-899a-60a0fbd2e2f7@intel.com>
 <alSxrcseFHNrttoy@thinkstation> <almwGwoUzoA96XnG@yilunxu-OptiPlex-7050>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <almwGwoUzoA96XnG@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/17/26 07:31, Xu Yilun wrote:
>>> struct tdx_module_args {
>>>          union {
>>>                  u64 rax;
>>>                  struct {
>>>                          u16 function_nr;
>>>                          u8  version
>>>                          u8  padding0;
>>>                          u32 flags;
>>>                  };
>>>          };
>>>          u64 rcx;
>>>          u64 rdx;
>>> 	...
>>> }
>>
>> This union doesn't match the ABI it is supposed to represent.
>>
>> RAX is:
>>
>>    15:0	Leaf number
>>    23:16	Version number
>>    24	INTERRUPT_MODE
>>    62:25	Reserved
>>    63	P-SEAMLDR select
>>
>> In your layout INTERRUPT_MODE ends up somewhere in padding0 and the
>> P-SEAMLDR bit is BIT(31) of 'flags'. Nothing lines up with the spec.
>>
>> To describe the format properly the struct would need bitfields, and we
>> generally discourage bitfields for ABI-defined layouts. Without
> 
> I agree that to describe each part of RAX clearly we need bitfields, and
> bitfields is not good for args.rax.  So args.rax is not generally good
> to me, worse than a separate u64.
> 
>> bitfields it degrades into masks and shifts on a u64 -- which is
>> exactly what composing 'fn' with a macro is. The union doesn't add
>> anything on top of that, it only hides where the bits are.
> 
> [..]
> 
>>> The truth of the matter is that 'fn' *IS* the RAX from the TDX ABI.
>>> We're carrying it around the kernel in that format, and it just doesn't
>>> work very well.
>>>
>>> The alternative is to carry the logical pieces of RAX around the kernel
>>> and them assemble RAX out of them in one (or very few) places. *Not* to
>>> build RAX in the TDX module ABI early far from the TDX module ABI layer
>>> itself.
>>
>> I don't see what delaying the assembly buys us.
>>
>> The SEAMCALL helper is where we decide what we want from the call: the
>> leaf, the version, the operands. Nothing below it adds information --
>> sc_retry() and __seamcall_dirty_cache() only retry on entropy failure
>> and track cache state. There is no layer further down that is in a
>> better position to compose RAX than the helper itself.
>>
>> And it is not "far from the TDX module ABI layer". The tdh_*() helpers
>> are the C representation of the ABI functions. They are the ABI layer.
> 
> I wanna advance the progress, so if I have to choose I sort of like
> *args.version*, or even args.interrupt_mode in future. True this does
> not exactly match the registers' layout of TDX module ABI, but I also
> don't see big problems. Using fn instead of args.rax at the first place
> already shows we don't have to be too strictly aligned to ABI. We are
> defining SW APIs.
> 
> To me the args.version scheme clearly defines 3 components that we want
> from SW POV:
> 
> 	the leaf	fn
> 	the version	args.version
> 	the operands	args.rcx	
> 			...
> 			args.r15
> 
> The TDX module SPEC tells us each value of these components, we simply
> fill them in. No extra bit-or.

Just my .2 cent FWIW:

At the end of the day the layout of args is the software API that is 
presented to the rest of the system, the ABI is a low level detail 
handled in TDX_MODULE_CALL. Let's bury all the ugly handling in the asm 
and present a simpler interface to the rest of the kernel

Exposing a raw representation of RAX is somewhat cumbersome because of 
the reasons already listed so "converting" that to 3 variables in the 
structure seems same to me.


<snip>
