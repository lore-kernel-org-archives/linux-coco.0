Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC20A818
	for <linux-coco@lists.linux.dev>; Fri, 19 Jan 2024 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705625739; cv=none; b=L6FqiZpzQywljAuyuPDRktD50V3EM0fu6LEffvhAqMuvjxokWuMeK9hKMDdOh+n+yVgRHbgM+7nPx+Fv8PfYYj/PxD0xukJAKBPh54XyDrYfAJTWInco5YEr5OapDev4asux7Uw4V5/YtKVP6h8Ca164V7l0kGSPByEC44dPDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705625739; c=relaxed/simple;
	bh=aIJvYfmi6HJlaanfsGfkyB5yItcPr3SfQ5xVggiChrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ua75UgGcUhz+yclEM5pUakECezg0eKMY3hr4AeDiEIACLBl17M1o0oN6wL9j5v4WgUZKkKHXm3gOfsx9xmus7OTjmqU2ZuDMEXIDNOrVg1momOB/gRMv1zUqgP0NzB6uZhMzkRiDnstKy4mRtuqeAlHdr1PsNRQjlopxxmpsPTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NoTgxeyW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NoTgxeyW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337d5aa5ef6so138191f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 18 Jan 2024 16:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705625735; x=1706230535; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zp8xmya7ffNONLsIkwl+dwEuPGDnVZOPk1TpK+AOkSg=;
        b=NoTgxeyW0E6lj+0y59f7SHd/leLnGQKvTJTB7itjCnBJQ99WBGdFiJhzm/i9KZANLn
         bEtqy6s70XU+mWMgVwlyv6o/MfdcW0XdvGl4aetc0UiLzXS8YL0uaOziEjcG4YcqC5Ax
         RhHR3hssdB3OXWnCEMtLUEtZQbncnY8QMgL4rtc7LgXIH7ahEIRen1muby+3VuksVZrk
         ZYirMx0Zo2ec5fVjlXHVTaQ2IZbhIR4uEHpqDwpRH5YXvJOhE8XzGCp6MDBBFw9qZUED
         BpAinR25P1LNIt9kYlZW5OwkQ1G0Wq2zjf+5XMa0Mr4psRdOBsc3ce7BbWaAH/CtNCvz
         9n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705625735; x=1706230535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp8xmya7ffNONLsIkwl+dwEuPGDnVZOPk1TpK+AOkSg=;
        b=FPY+4G4PEkF361zb9mFpRaTjrZ5QCTqcYyybjsCMbRI1Qr7hVv8u54aRXasJlZRqJN
         2Lc3T8T3jIu4msZmkH/D/k7ldDi4qAbXcdrLWChkRjCAVEvlFvPu3EBS6BvrEY+ocgmZ
         bxuWwwq1GwrsPMXOoGs79TSGGGELBayYfTYWlyPkwjv7sgNWTrRcjaRXNuF4jnJlHgsJ
         yfveb9UAyxIZ+CDbCGE/nukhtwmlf4AuZwPxh9Xw097D5NViBIoDgaI2QckoQuv/74F/
         W+Puih1j8dkTYlDhppVzcoJe+YgOgzQmKPX/m64Ig2UwZ2156T3XN4qhIQ5uJerRRIZJ
         WTWA==
X-Gm-Message-State: AOJu0Yxmv0hYYD20Ld1AAdMq4AlQTRQ3MMjPMngwrPL67RePpq/3y7Wu
	AyJiHqOYyXxbaTzh6hEwXELTk6c26r48/AgBXrNsIAttp0y51hT8RLGPy8LgZlM=
X-Google-Smtp-Source: AGHT+IEEtt9IXe34jmW2SWZlwSiC3ZqX9bmzujyx2QT1Z1XZwHpyNCAKSldgcj5KlfGZ3ySBlDK1xA==
X-Received: by 2002:adf:b319:0:b0:337:c91d:e816 with SMTP id j25-20020adfb319000000b00337c91de816mr1089220wrd.1.1705625734915;
        Thu, 18 Jan 2024 16:55:34 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7589:26fc:cf3:a5b9:2475? ([2a10:bac0:b000:7589:26fc:cf3:a5b9:2475])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d5341000000b003378e67fd2asm5183061wrv.86.2024.01.18.16.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 16:55:34 -0800 (PST)
Message-ID: <bd363091-22a6-4203-a7ec-b0ec4abfaf98@suse.com>
Date: Fri, 19 Jan 2024 02:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/virt/tdx: Disable KEXEC in the presence of TDX
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
References: <20240118160118.1899299-1-nik.borisov@suse.com>
 <e75addd3a8af6ef0243999f933df528e975d5ca3.camel@intel.com>
 <fc731bd3-4232-4906-9f78-448a96e3eb5b@suse.com>
 <7695034c0c7bf91532fb5cbd05d9a4b8cb77e70f.camel@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <7695034c0c7bf91532fb5cbd05d9a4b8cb77e70f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.01.24 г. 2:52 ч., Huang, Kai wrote:
> On Fri, 2024-01-19 at 02:49 +0200, Nikolay Borisov wrote:
>> [Adding Kirill as he has a series in flight about KEXEC]
>>
>> On 18.01.24 г. 23:31 ч., Huang, Kai wrote:
>>> On Thu, 2024-01-18 at 18:01 +0200, Nikolay Borisov wrote:
>>>> TDX doesn't currently support kexec so disable the latter when TDX
>>>> is detected at boot time. If kexec must absolutely be supported then
>>>> TDX can be disabled from the bios.
>>>>
>>>> Making this decision at run time rather than as a compile time option
>>>> allows distribution kernels to have both enabled and delegate to the
>>>> user whether they want to use TDX/Kexec.
>>>>
>>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>>
>>> Hi Nikolay,
>>>
>>> Thanks for the patch.
>>>
>>> I am working in progress on patches to make kexec() work with TDX.  I plan to
>>> send them out soon (e.g., next week), but I think perhaps your patch is
>>> reasonable before that is merged.
>>
>> I thought Kirill's series rectifies this ?
>>
> 
> No that's for TDX guest.

Well in this case shouldn't INTEL_TDX_GUEST also be gated on KEXEC_CORE 
being inoperable either via Kconfig option or via a similar approach to 
this one (if it's accepted)?
