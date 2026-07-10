Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2113B9931
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674108; cv=none; b=MKm0R1+Urz0rNi4frHj+A8Wm6QRNvThKq/SI3yCbbn3Fd1esdHa2R4rsdtzWKWpGQx293XqjsohfXiDD/qD6dgQZb1r2vYCgIEgNaOKtlvLUTnphEIbVEXwH7YTYrzT0mCPQmNdroJcARWJIuI9YvfM4Fj5x4l3AfKfurrdlBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674108; c=relaxed/simple;
	bh=0bjgd3+mvjM+SD6+WctCfW2sEDqMAJmseiFloV+zTTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWnkqI4GHq1Owxn6X1zoz6i/GUObVtBOB/oYlV3uDeMScc4M3bDsZTwmvuBtM3OWogkFTqWF4GYdwOZEgM21/wS/4ksBFje9MzblJMOL0LbdQjYjoRTbp3+ScGM+wxpJ9hYmtlEcN+mvA7lBaI1YX0P60CLmDWngXEkXg/2xJeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PBzWXrJp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PBzWXrJp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso3999525e9.2
        for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783674105; x=1784278905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GM/K7mEoxx2butYPcCAhdKcKE6yuKUATXnqo6Q9P4rU=;
        b=PBzWXrJpJqUHIwPKReYuWFIPERoExEMAa0Hx1z3JY5z7QoO1eDO4ziXvDgK2TB0Amy
         Uwf+gtMCHEYOn0XSvn3rwqGghqrvXq3ULW378yQEF4Ehtvk2Gni0VMUcORI/sxfrFGmV
         8+pG7wU9Kqhqb1SA4fTJtiFJ8Qif1z1f63t0F40yQihRNiCUgi8MCT5AOtdwfL1uRXJS
         YCh3dx++X8tzeSHUiiZfI8gddp3cBvYVzjYWVFLsghgsctN0jSKb8B7jp0wvJrVpWjdP
         CHepmeBICCKLQVp/1RvBGKBdI/0x4VApPToBJejjcwgIZRn7j3g0k5kxTcWnCIFWDl34
         blLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674105; x=1784278905;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GM/K7mEoxx2butYPcCAhdKcKE6yuKUATXnqo6Q9P4rU=;
        b=RmVvvHJWqwP5iDnOhXrWz6I0ZAecSavuQw9VqnZWNXwB11PjS/j6Pl8+b+W8X+Q6ht
         x/5b/vjB4tWSB+8HqbW/+ytecmV95BzEgg6/PBIJssTPF6pdJKAB1vG7IUN+FZvztMJX
         DYU4kQnW0aKUe/V1FrXKPwLFrLyiDCjL27R1DBX5ds4SbpEoaY85yVlEQ/d8E/1Wnkvo
         uf1y72C9ZM9QwtvXMrH5h+7Cs5skvY3hYciDx8RRDnrjP/rwn0M26owiVfLQbSZ5EMmX
         0XSvxJkR0U1CgRJKGKK9YyPX/FEy4DttPOVwVd9fexACGi1WGBoQxYSlvXHp79lzfENo
         84tw==
X-Forwarded-Encrypted: i=1; AHgh+RpKhH2iNZX9wcyA8gE/6u4zHFVsnoYlio8XIspBMNJRr4M0jami0XFq2shwumzM2SnsGOD0/pMbGuaL@lists.linux.dev
X-Gm-Message-State: AOJu0YxWHSTtp1P86ypf4khqSSVOxsA5NC6ZdIUNHRz2fG3ARoHC8D21
	8AjEwAAnGbty96Fily1u5Z3+eX8T55a00l1EAA0MC63uPSHElSb5CI8SBDMib29/mMA=
X-Gm-Gg: AfdE7cmRY4QFZeutGdQh4b6tjXpjVR4fvvoSjUHAJD+pb+Q+akzJDYQcbxVkS+g4j0h
	YaEz/NtSwhKR1oa57ZKQfxiYJC9v0XSWKGoF83BRkcQERLUcjMKjW6dL+IIQVYaOFr5IcRwIJZn
	ejKtHjehVE/Yr0lGaRf8wFrEx0L0ZXYVqZebyes9nug+5kSVfqBRQ0ZHsK5XNuHSxKXGk/ozW5Y
	GYPIjq2rRTJR+9viQekwak8sm/12Qfyf1+7slHJIlSQScv6Q+mddN2zTgL4m0i2Zr4Hpunsb0+4
	H2cNJF2mVrLbKGffvozTPkpoIHQrV8FzI2tAZn4T7E5fRpM8mR8XnwdQWR1FUZY6+0e2wkGOoTv
	62UlF+8vlh0aOka9Z4N38xvsjtSRbyLgMM3gbHQASUN+Ufr6jgkC6p5GrviNrsZwnOnQfONdTMJ
	sZk9+x8blaoYlNIxw=
X-Received: by 2002:a05:600c:1d25:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-493e79edbb0mr91113305e9.34.1783674104915;
        Fri, 10 Jul 2026 02:01:44 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm127156535e9.3.2026.07.10.02.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:01:44 -0700 (PDT)
Message-ID: <e6c0ecd4-c128-47c3-99ce-1d45113f6766@suse.com>
Date: Fri, 10 Jul 2026 12:01:41 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
To: Peter Fang <peter.fang@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "seanjc@google.com" <seanjc@google.com>, "djbw@kernel.org"
 <djbw@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
 <dave.hansen@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "Hunter, Adrian" <adrian.hunter@intel.com>, "kas@kernel.org"
 <kas@kernel.org>,
 "tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
 "Xu, Yilun" <yilun.xu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Mehta, Sohil" <sohil.mehta@intel.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "Maloor, Kishen" <kishen.maloor@intel.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-17-yilun.xu@linux.intel.com>
 <aj1tFuwZWdPGfUoG@google.com> <20260629100301.GA1743876@pedri>
 <akMQ3J6fK3DUBsPH@google.com>
 <23a9173f6e278ca7dfedce3374626c6ea3e1b47a.camel@intel.com>
 <6a445e4be6b12_3a3568100db@djbw-dev.notmuch> <akVNdxCzk-n4bgMv@google.com>
 <9df36c49e6be69dd9eece71f70a404a84b1563ab.camel@intel.com>
 <20260704054342.GB2169894@pedri>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260704054342.GB2169894@pedri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/4/26 08:43, Peter Fang wrote:
> On Wed, Jul 01, 2026 at 11:45:53AM -0700, Edgecombe, Rick P wrote:
>> On Wed, 2026-07-01 at 10:25 -0700, Sean Christopherson wrote:
>>>>> That is a good question. The answer is partly historical reasons, but I
>>>>> think the pros/cons don’t really move the needle too much.
>>>>>
>>>>> The main benefit of doing it with the host in the loop is that the guest
>>>>> side TDVMCALL quoting interface can stay the same. There is also a wrinkle
>>>>> in that there is a limited HW resource involved in the quoting,
>>>
>>> What is this magical resource?
>>
>> It's a HW crypto thing. I'll let Peter explain more.
> 
> It's called S3M (Secured Startup Services). There was once a public
> document about it, but it was removed for some reason. It basically

Are you referring to this: 
https://www.scribd.com/document/970439243/S3M-Intel-White-Paper ?

<snip>
