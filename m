Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79512CDB8
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725123; cv=none; b=B8hLBXaE3j9DfLMK7aUu/G/YCsDnWSUDYZO/eXsBUPb007OrVkGjQsMA+G3TqbpBQbLnjwMVLy9ptQO43MVErfxELp9N5RUJoNAudOMKiWT6aNaTBHcUAQVhTfo/LpEKLpHU4tpawzmlH35n2avFwKMcakzrOQmSq2kAjKfsD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725123; c=relaxed/simple;
	bh=hk8mRlX4mjnPvVPM8IAfoswnHXcKo4FOa+HNypkGML8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPDD01sSBZWATZh3WD6qN9hcSn+HQQJfdcUQC6Ktq0RhVssiEnMT7eqxgJ1S8fR4KbM0Lg7np8ke2ORAiEEvcSrlwmyIN5UaiN9eksqg940PD0ywRZi1coLkhmxmqSkYRKIMVBPlXXWPIx3nUUX+xSMqEj6MI8aRWDM8wJjDmJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ceWcn8h4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ceWcn8h4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40ef6f10b56so878515e9.2
        for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706725118; x=1707329918; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzRwm4UO/Zj0dihFsSdw0bNikw8vpG8Qlhm2KtzCh+Q=;
        b=ceWcn8h4vKuEuB2eQClRtJ0pajlk/mmDA/ekJpY6btGEaLiua1jCzKgmktIoSm/QQw
         R9nM7ret6IDZcWQ94bQzm3J82N07hYgsr8claH0lVAxoPXKrhBOQzimi7qB/+y6Ts60s
         ZIYIGGJdcAuaCkV8/ppb8PBucA72XZTgjR8fd7bOI8J1JyX4VhoDCXFzKmLbUK5NUIp2
         kdYg6XkPrCLEotIS1psycHmTsZi3ia3ngEiz8FA0n3x2yGKUdXhPdeNtucK1rdOH1qsx
         QYzfrQRUgczHsfMcGoU8LwJO4wRWbcHlZslXdfoop5K57CReonRQ4VHd+3UvwP5OsgfW
         ebEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725118; x=1707329918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzRwm4UO/Zj0dihFsSdw0bNikw8vpG8Qlhm2KtzCh+Q=;
        b=lL8A9hlQEfUiaAnstHyW/bwV8hO49VSHsPY+fQlcNPqXGbBLMwU99Rqq3qkyM5kGyz
         ftCxhNkx2tnloGpprvr8QixOPZnJby2xbSbMoqLt5AF5Gly9BmLmnUp52ELFTC/8d/Ln
         RtxRUh/HeQ05y7iMgj5iwfMO22zLUK/Ys7SYJdBCGb7ok8h4DM5dJiQwy00H7JTgyOkS
         JMoyCx4Jhu+3L5yN5Oa+MKHallGiPofAZggnOV15cRpTgyNPKiX9p6RtnC+hGTtQ/jh2
         e/VlyTs3akIHsVJAE3K5Cbic4Vxx1HmDVcOLPu6tG6g4T+SKiP2mS+ip87SIkbWBIAmk
         RW4w==
X-Gm-Message-State: AOJu0Yy9bF/CrtYcrI+3ONBPob2j5C1ucPmx3q1xqQA/thAXHiZZqsJc
	xeCZO4P6qyu/PswQQBF0AH01rq0ivJVQ7IJpoCBGsy3rTRBEHJiAvs4wf3ojQu0=
X-Google-Smtp-Source: AGHT+IFlerNnTYUOTUSapaoI+UDDATLttB4os/ksQnnOUNF1jVTF7nOlnLuNJ3pWMAKicLCCZU0ziw==
X-Received: by 2002:a05:600c:3515:b0:40f:b770:fa42 with SMTP id h21-20020a05600c351500b0040fb770fa42mr479403wmq.33.1706725118189;
        Wed, 31 Jan 2024 10:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVy1xn9w5DxLe2K+iu60xYij8fws7n3OrrO5b1XIV8mMgc0hV2O6rkXLBEFaUrY64Tk+TT+COagoLLI+tfKB8pEigoWdhKKJz+c3IMPt5+CRblFEKnWoQumRf/m04rfk4L3LhacC3+t+si5eVDGAM2jHpOKhk1gaYmOTICme63UcNneUMnQmEy1N9YFeODLaXA6JKztRMVGaBDzADAIF8eB74BIFwg+Xo51kVDYJ567G1lLwdlQj55didzP5lN1Ee4OWga2kw==
Received: from ?IPV6:2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f? ([2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b0040fb03f803esm2264032wmq.24.2024.01.31.10.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 10:18:38 -0800 (PST)
Message-ID: <8655c3b5-84a7-42c7-8f2d-8ea32308fe5d@suse.com>
Date: Wed, 31 Jan 2024 20:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, linux-coco@lists.linux.dev
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dan.j.williams@intel.com,
 dionnaglaze@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e3078be1-397a-4927-966a-acea5561eec8@suse.com>
 <464ff551-5909-42e4-b544-5c68ff86c76c@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <464ff551-5909-42e4-b544-5c68ff86c76c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31.01.24 г. 17:27 ч., Dave Hansen wrote:
> On 1/30/24 23:28, Nikolay Borisov wrote:
>> On 24.01.24 г. 11:38 ч., Nikolay Borisov wrote:
>>> IOCTL based interface was the natural choice for interacting with the
>>> quote generation machine at a time when there wasn't anything better.
>>> Fortunately, now we have a vendor-agnostic, configfs-based one which
>>> obviates the need to have the IOCTL-based interface.
>>>
>>> Gate the relevant code behind a Kconfig option, clearly marking it as
>>> deprecated as well as introduce a runtime warning.
>>>
>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>
>> Ping?
> 
> There is no clear consensus from this changelog, nor the tags about this
> approach.  It would be much appreciated if you could make this changelog
> more freestanding and  make it clear that this approach is acceptable to
> both the authors and users of the code you are modifying.


So how about something along the lines of:

IOCTL based interface was the natural choice for interacting with the
quote generation machine at a time when there wasn't anything better. In 
its current form it's only usable for local attestation but that use 
case is also going to be switched to the config-tsm interface. In 
preparation for this introduce a Kconfig option which allows the user to 
choose to disable the legacy code.

This strikes a balance between starting the deprecation process, yet not 
prevent existing users to continue using the code.


---------------------------------------

And the next version of the patch won't have the runtime warning.
