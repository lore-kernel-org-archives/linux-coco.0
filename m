Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9162627EC
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213678; cv=none; b=qbiH+5BdXCFVCjYJkJQxk+RDqIhm6qC9XslLj0IQ2f9CP3HZjelvBDX2TUeromgsT3V9oYVvi7nML0yfgcPD5KGTbT2G0FLs/YPZtjoCspi2AXcgLPtqsrg2Db3WuToMdyit176C8qiwAqnbOqVZG/jh0fRsNDo9QlTRthR8kQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213678; c=relaxed/simple;
	bh=jCABnoSlxxQFUAs31j2dDgPFt6TkJT+wt4+DPGFWvNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlWo3RrWwbzoNeRNcttVdr+P2zdp7R9HlhkQYbCO2vS8OkKN5kkE1MXpstjaZOQZ4RJVGWCyrOlkBZkHuZsUrAr6d2bYGJMdPZPXeSLqiOy9JjiCvN3V/g1cJFEShLclTSCH+sgmAnDPkrm5hMw2xxnNs1kE81srTt24BZahJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZG835430; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZG835430"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso13094143a12.2
        for <linux-coco@lists.linux.dev>; Wed, 09 Apr 2025 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744213674; x=1744818474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9MrfmGdx/admoRpqYzf488HmvpMXteQ9lPzY9ZRZc=;
        b=ZG835430vRHEFRke5szlXEk/hca/1lZG0FiCmnzfqistCKvG3fveGLpwGWUHydx2U0
         sC7Km8+rgmxAWDCuMdnP3arxjVWnBZju1YVrUxHagZZqE9gyGAKXKqYwZIpukGj/0qZl
         MeAC8w79/WLTbGXl8BmUkZc9J7ynXMlT8e5y4co24akADoExz62xTl69i4SyfY6rU6RP
         67LqirvsSdwNoTzu6YmHpns0J22+0S2lYdWCQPnUw6M4WDT2GU/KV57kGpzVfuGguiqf
         ARnq3uOwabT4j5QS4W3PVB0ugGdK+bjk+ZxYvCgMN6xZs7PnmpzDBS70lUCM2oX0LzxD
         PPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213674; x=1744818474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9MrfmGdx/admoRpqYzf488HmvpMXteQ9lPzY9ZRZc=;
        b=wKGodw0r68Gw2Qk3lKpZsQO6kDZq0G15i+bJoCfafXh4ZKHXc8hsavTtHT2L/9AeBF
         Ppaimajkr9+3C1T81eTHzHwaPXihw0BBSqHcI5EKbC344DkfUavhdkV5DUPV6X04QRdr
         p5SQ7e4C9r8zArS2NwdaNgx2Ja5QTmfHOVb6oTr9AhXOIMtqdZenHkEG6UW2bnY8xsCe
         OjhcL1f9FfkJ/iBI8u1Tah8Nrp+k5m0iW4EwCaTFivEKSHJqwBxmQl0YWDvc2zdgg6es
         pE9NMhsl+pFgrJcm9zGHx2sZXDPKdHFGmmwPMoqjJEFKR2yKaQFgv4aXRtNDvgm/6hFn
         tKog==
X-Forwarded-Encrypted: i=1; AJvYcCXb4Uh2+6XBlzjQ3lB9WH5VRMcVvIa8HvDAw48DazEx4WRQ10xJlJFB1tmloNktXPE85p0GqL/YPzhW@lists.linux.dev
X-Gm-Message-State: AOJu0YziJVcVz6lZGgc8dJj6Rj1UqGLxVSHKLLcyORLK6JHRhycCXuK+
	Imi9zrC9U6DLwAPFnf/lPdDYUwkw/p3g9u0xbMcV9uWYScdYWswVfxslQ67cSNY=
X-Gm-Gg: ASbGncu+vyon+KdkWDWPy8mHA604TA7W8VGB9FwzARM5IhLvAPDp7M3f3C/JHP/gKRV
	zbUoL+4ukmnlJySk6dX6f/1viQb89BiDaHoaccqCcGG+9+GmByP7xiaBhS3neta9Lz0s+6PPZGk
	cIlMftR/mcae6A9kC25kp6CaFc7rJwAc+ZL/HMg+EOzS6dYIQaIM1IhgA1IMhnlWIiRrQuWNVbS
	/ohenoYKuj6O3A4N/vdrNwpVkMf7bTNLiTN8d3l0V3DNJrzchfRI+UsEp2ehwZJXqFKV2DQ5Gdo
	1xfy3pt3nbalZM4Pkdu4udIEuKK8Vm67LZEJwvaWyXe1wg==
X-Google-Smtp-Source: AGHT+IHo0do0fKxRZomTsqBtbKndZIYZugYhxWasrmrbi70luUu4m++JfZsaxZzQDLqrDx2E46ZGJA==
X-Received: by 2002:a17:907:2cc4:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-aca9d73ab50mr270802066b.59.1744213674410;
        Wed, 09 Apr 2025 08:47:54 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7317sm114172666b.177.2025.04.09.08.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:47:54 -0700 (PDT)
Message-ID: <00b29ba9-e886-4464-be39-731789cef72b@suse.com>
Date: Wed, 9 Apr 2025 18:47:52 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Dan Williams <dan.j.williams@intel.com>, Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, serge@hallyn.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com,
 linux-coco@lists.linux.dev
References: <20250321102422.640271-1-nik.borisov@suse.com>
 <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
 <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9.04.25 г. 18:45 ч., Dan Williams wrote:
> Paul Moore wrote:
>> On Fri, Mar 21, 2025 at 6:24 AM Nikolay Borisov <nik.borisov@suse.com> wrote:
>>>
>>> This simple change allows usecases where someone might want to  lock only specific
>>> feature at a finer granularity than integrity/confidentiality levels allows.
>>> The first likely user of this is the CoCo subsystem where certain features will be
>>> disabled.
>>>
>>> Nikolay Borisov (2):
>>>    lockdown: Switch implementation to using bitmap
>>>    lockdown/kunit: Introduce kunit tests
>>
>> Hi Nikolay,
>>
>> Thanks for the patches!  With the merge window opening in a few days,
>> it is too late to consider this for the upcoming merge window so
>> realistically this patchset is two weeks out and I'm hopeful we'll
>> have a dedicated Lockdown maintainer by then so I'm going to defer the
>> ultimate decision on acceptance to them.
> 
> The patches in this thread proposed to selectively disable /dev/mem
> independent of all the other lockdown mitigations. That goal can be
> achieved with more precision with this proposed patch:
> 
> http://lore.kernel.org/67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch


True, however I think increasing the granularity of the lockdown 
subsystem merits its own discussion, notwithstanding COCO use case.
