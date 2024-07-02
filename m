Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665C364A0
	for <linux-coco@lists.linux.dev>; Tue,  2 Jul 2024 05:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719898190; cv=none; b=VeIeFjmZpOQoHT7BDmlCQ7lTNU7uU9GHP4pYw0B+zXa0zm4o+ZcJgvzs2Kn1i5S0N/COFVQiLKha6hU4uag3k9f+Ss/q3zcQGtVPnTgp+WZvTN7viLYBBS+BnWXI17P8iZDoUzblkYn6kaARiajsXWeOXKpYpx0LEA0OC60Zy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719898190; c=relaxed/simple;
	bh=VxUmiJf96Nnk75owUbMVNJQRo1e/6DgjlcUcCnu3RaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOQytzODUMR1CWQu7HzP33fvkQxDMv9q6pUBDvRl39JxR397vGeBaPxdN3y03CYuC0TWIv+Mk7uyfVLlWdbYSpGbwY4gjEIaDuZ3L7FqfWz/v7v2U5fIy7XGP/tNbqviQEKPnpdxOMiMmxJyGbMCVfD9WCwsmhZTjCuGFL1uKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ap+/GM2p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ap+/GM2p"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3626c29d3f0so1892861f8f.1
        for <linux-coco@lists.linux.dev>; Mon, 01 Jul 2024 22:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719898186; x=1720502986; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpqSb527f+PFINHEbqoKS8w2DyBKf5rsE1sD0dCz+Fg=;
        b=Ap+/GM2plC8hZM7Wfv0ZZEXR+ulEhGgJgGSIj9fAu2bUjMJyRJ8/eNSnlMQ+e1eiZH
         +QBtj/nvvEbqFfaUzfHjKd01G4UOARjds2lx/lc5RX0/OnTB0VKIde8FeOL4l9qDGVPx
         2NrHGy2g9rJcNev4H8JgAXMEnfQcBXQ++jy2sqE/0taIqi8VnJvtE7+CQjf/K1I/QXng
         5fj4zarSRCDYVFIZ8vtDK9606xtR0KSgA2SvBVhH50lMT1sIRwsb7BdIhGuq/KWuhQ6w
         drxKJ33QXR79p/TeCxSfqpaV3Uhqpn9UaVpWpiAd5mjDgVQg6mYW6k0X0RIHxCLC/pnK
         Mmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719898186; x=1720502986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpqSb527f+PFINHEbqoKS8w2DyBKf5rsE1sD0dCz+Fg=;
        b=i/ctBOB5irnVp4d1d+pR9TXCwdTVumF9+DYfwr60kb5aBB1SrGNFqEQK+K+nMZxd1T
         BMtjTDScOuJ1+cZhtcfSzeMw5a3QEuh7vmTdtHI1frVAcpU+FY0p6h4WLBoKdGCXhR9p
         a0MaY9lXNCh39meDbV/8kAb82YjzvGknRqgTUAbs5hJnkgXRASeMpZiUSS8b7LZRaSTV
         CRYn823xY15Dti+GEIF0TqWxIq7P0d6Mj/h4xAh9pReAZNywOWY8qGVxS0ttvV/V/yu/
         8ekWhm0hCZGvYlSdTJFibPJlmmrUK5JuKT80sguCVqyeqVkUG8z/QkaV/l+6kW29HpuZ
         EN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQmGQ7j3SY0+rWBP/o89lNrozbE1MNJpiTV3fCqdNeR/4B83SwSCtrlQccU5xHgyxFhOs/f4T911PBTLx3TlcyM0D5DWCXQsqHRw==
X-Gm-Message-State: AOJu0YyMbsOVH/otqD3e+lI2OAK9/nLlnI/Rty0kf6knXBV1EIV7IRfd
	hd+0jQ7UfNiUD3yZ+CEY3mHYv5tcuDWIMh5bpVdViwuYapAG0uL7oxpQ/S/bQjs=
X-Google-Smtp-Source: AGHT+IFC79EDVb+wzbCjhg3hi97sgP3c0sT3OIuusdDX97azxyjFmnfMof+llEl5T/+JESH0HkzzCg==
X-Received: by 2002:adf:e703:0:b0:367:3594:39ac with SMTP id ffacd0b85a97d-367756b75fdmr5795910f8f.16.1719898186492;
        Mon, 01 Jul 2024 22:29:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc4c9sm12030213f8f.86.2024.07.01.22.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 22:29:46 -0700 (PDT)
Message-ID: <89aa51c4-20e1-4284-9ab4-bb505f261bea@suse.com>
Date: Tue, 2 Jul 2024 07:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix lookup_address() to handle physical memory
 holes in direct mapping
To: "Kalra, Ashish" <ashish.kalra@amd.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "luto@kernel.org" <luto@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "x86@kernel.org" <x86@kernel.org>,
 "mhklinux@outlook.com" <mhklinux@outlook.com>, "Rodel, Jorg"
 <jroedel@suse.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <20240628205229.193800-1-Ashish.Kalra@amd.com>
 <2982a4f2-ea8f-4fa4-81ea-d73c00fc2ad0@suse.com>
 <5cf60d52-1682-4244-b892-688b22eaf4a1@amd.com>
 <8d970528-0e57-457f-ae00-862b4d320a2a@suse.com>
 <0dfcaae1-9ee7-47c5-b530-2062021155f0@amd.com>
 <25478bbd92a0dacb6d52d7ffd214374e151a9338.camel@intel.com>
 <306a9358-a452-4595-b1d0-8e38a53d9084@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <306a9358-a452-4595-b1d0-8e38a53d9084@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.24 21:39, Kalra, Ashish wrote:
> 
> On 7/1/2024 2:13 PM, Edgecombe, Rick P wrote:
>> On Mon, 2024-07-01 at 13:59 -0500, Kalra, Ashish wrote:
>>> Then what is the caller supposed to do in this case ?
>>>
>>> As the return from lookup_address() is non-NULL in this case, accessing it
>>> causes a fatal #PF.
>>>
>>> Is the caller supposed to add the check for a valid PTE using pte_none(*pte) ?
>> I did a quick look at the callers, and some do their own check for pte_none().
>> But some don't. Some also assume the return can't be NULL.
>>
>> Can you elaborate on your goal for this change? Just a cleanup?
> 
> Hit this issue while implementing and testing SNP guest kexec.
> 
> So trying to understand if need a generic fix for this issue or do i need to add my own check for pte_none() ?

Please add a check for pte_none() after calling lookup_address().


Juergen
