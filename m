Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5732B9B4
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131453; cv=none; b=UqVrsF4NCoHJ4ueY/A2OiTlCbm6BYIX+d26fUYTFL9AxEIBjAEfBlNVY0tIvCHVHydBvfzHiV2e2rT7sMJmZKnxUIn9lj7ZsCtLt7RAauIrJQjfKgiu0Mbfb56UWYmg4GWDuEuPcHs7R2Q74eX6lb6g782lugnO0t2SkiKUnb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131453; c=relaxed/simple;
	bh=ljhSnypsFCqqaO/DTH/BFqcQQEiPoOJ0SnJu+aTdYR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch6sRer4mkg8u++PHtjyNRdmazLfjYp7x6SNBvM92keW0PsKggwVnLWe7IYSnxnyukZHw3Qbd2Rv6dG5wVgGPs9WPzWRJW873oqfZX+f1rm9SlKd4C8+xr7VBNCDggSDItDr7kTkPwGPV0eJ1Wu40fGqS+1vySzDN/k9ehxXXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E2n3PUQv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E2n3PUQv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso9689425a12.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761131449; x=1761736249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yIL7ROneozJ3x7sPrsTWHh3Gduk7bcCFsgDxt3n3XjM=;
        b=E2n3PUQvL7UPUHsBEuiDsvmxKXl7039p7d785RMSwrafao6U7iSi408v2elK4bnbIf
         jRlElYfxq56PlE3bhwvyeRjL6yQm8fayYHKGYvLpsAkllWEX129mHF1Ja4r18654gGxZ
         CDFz0rD2W/vN6QPNWgpI8E8r+M2KG0gLMzX4YZEB0tSjKiS/qBw5qwvoA0XMxbv1dRTe
         5UJkR4ntBG3ambsJo3J2dkxe0+g5Rw5N7RmcJvwE4/i6ogAIYDYwkFT+QwcTSLVQoKvN
         yiFMVx7tGzPjPew3QEhjeScs1efbMLSVdVXcyjgCw6smsQyEZmH2DE6A5x+HGj5+10Jf
         PvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131449; x=1761736249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIL7ROneozJ3x7sPrsTWHh3Gduk7bcCFsgDxt3n3XjM=;
        b=JlIZOZW5YqjFrYWS0peF8H1e1OSzNpLoq2Ox7OsFQ19rLMlEFMkkThT5HgjRsYFKDV
         QVuyJfri3cCoVNXOPsDGyPalsRmJuKTJgMJHwnG1dfmjZceM7ZRwCjJxUrDWdBwPDTsY
         ZkpdoXsXrbYR3xe29siy7tIK09H/cN/n9bC6ZgNivO8XeZyQzFd/YAvNbY93ZMph2/7b
         mhM8zhDla71veJnlFL6d/tUR0Rlh8uT8VOc8VkSJfbyKSb1t2EQoEkyQ9VpryaUt6gg0
         lwEe4dAdU6hcraUjEL9wMDJnSk3EVC1RZcLQJHNFM0dLrcfdS0N2tuOqxPtpsfo2APpE
         RIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU337EWKn/ilMaG0wrakaLnbhZp9G2WMHu1EcWnhW4XZ37LkC48d8qh+bTL7JWghBR0ZCcbe0bCE2e+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1SKJgIFhO3XSu1i8g3R2s5onV94iKvaC7xHvPy38nFk/6SpQ5
	YhPSQfT9EF/iizuQr1AnZs/1QBiCcdlFr9Fv4dNF1HiHZOdBDOoQTcrnPYwU2xr4y+I=
X-Gm-Gg: ASbGncvXBSIq4a13z7FIPyeizs7kZKPL765C7I6Pr10CRL5Na6EdmuvcyiNwKG/JDfl
	qLOvNz1D9e0MCMOEcCy3cZSxmRLU1wok0eHCmybMsx4AneyjWzBtd8450lNrX2fHk6/f5WRxOwW
	cp3ERcXCT+GADb0d2J8zC09O1bWQI6MPmgf5od6E14DyhxZqG4J9eWgYohhHCfHIa+vJMbPQ7zg
	ekGhoQgeGBd7Gn/6Tf4eDgjDAie5+2p+2/RM7z4t07BNVsTczf9bZthVySWmiOc7d9C0Cq47wGe
	hp5/9IhjKpyFvpxVAfJT/X7bQJVhOjjwvbXnMiUeKML24xnxrsgNssLvdw6gStB8K16IIwXWkq2
	R3ec/wVs9TTH/nBYvZ8iNoxhBgA9Sdbzqm/7zLzCM2jArfvAlS89njCqiDjpdFTYi2f7osWBjCL
	Udyhs1Gezq7rCy14vhTjPNI1i5ClU=
X-Google-Smtp-Source: AGHT+IGjLRzHUp9nFt59FQ+yfWKMczkH3X6fdnBY5nRpeAHtIIhEt6if3Gb24lGk8+s2s2pSWhTt3A==
X-Received: by 2002:a05:6402:1e95:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-63c1f64596dmr20359917a12.13.1761131449117;
        Wed, 22 Oct 2025 04:10:49 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54b8sm11869165a12.11.2025.10.22.04.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:10:47 -0700 (PDT)
Message-ID: <9d93a6a5-a431-4548-ac1c-0e1e5a214dc3@suse.com>
Date: Wed, 22 Oct 2025 14:10:45 +0300
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
 <5e560948-8a71-4b07-8e1a-ed3debdd5540@suse.com>
 <20251022105103.GZ3419281@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20251022105103.GZ3419281@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/25 13:51, Peter Zijlstra wrote:
> On Wed, Oct 22, 2025 at 01:48:11PM +0300, Nikolay Borisov wrote:
>>> The compiler is clever enough to see that is a direct call of foo.
>>
>> Thanks, I verified this, turns out we are using an earlier version of
>> 10df8607bf1a ("x86/virt/tdx: Mark memory cache state incoherent when making
>> SEAMCALL")
> 
> 0b3bc018e86a ("x86/virt/tdx: Avoid indirect calls to TDX assembly functions")

We have that, but as it turns out it's not sufficient, we need 
__seamcall_dirty_cache to also be __always_inline as it also has an 
indirect call in it.

> 
> 

