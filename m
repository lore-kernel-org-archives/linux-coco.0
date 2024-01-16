Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217711701
	for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qa84mwEF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e7983ebbbso15121445e9.0
        for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 00:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705392109; x=1705996909; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbsGWmQ361n86fqb5EvED9myRmOjNXMpdIrnq7x3pKk=;
        b=Qa84mwEFEWPIUxFlqX79R7x+iGxhFi4j2owE4a3hoLy2uisDeZDaoBokc5VnC4Z+Et
         wfM2hVz3MIfMjM0m3bLuaO7pdVWPD89VXqUW9Zn29g52K/gpPwTGSBgLnGcdcYMp437J
         sUKEXuW6MIdb1yTnjy15EtiLp8V5tiXYLIG5Tf7ZoT1PkzO2h8bqORERBx7c4BjZUIKa
         hLVrbvk3tUQOC0AaPckvi1roZCWXFEzkIR9CkZK7MVYGnWvrxGlXOhIpSNErGaN7C5dK
         fMXDFT0+vdkUs6d7Mpa+cIHCqn249/3AP4pIzTP0pDHzBMisymkd6RT/i+ij1bWyQFQp
         mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705392109; x=1705996909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbsGWmQ361n86fqb5EvED9myRmOjNXMpdIrnq7x3pKk=;
        b=svu/NxUREl9jHsSt2nq6b5D+IhsNL9bS3ck5OyjFksAnMQZyt9radePSlw2Spzi1WS
         SRPa0E4XuYA0D+FMrht4TiU/2rT90pvJcBZJSYmCStRhpE6pd7HMSbTY1wST+NcBmxho
         rnDrMDfV/KOWP88yzEHtgHGw6aV8JVP/iBhDz586YWEy2VM0WEEZsMvpmNvMlLiVHNEO
         oiKYV/oxQQ0iy7VCKD94lTOpkpgnifdMSKJ2P8kfaIzEIaYaVgMPRCw5Y6eYbTOugpYV
         OPFUsLVZR8B+L35+p1k/AYRGOnXcvWOsD9tVq6VlNTv+oTgY6zEwJ8/vY8T7F5896Z7K
         nhMw==
X-Gm-Message-State: AOJu0YwrzX6Txxi3zvzpIFs+hT0Kk/Re2p8Bh1AL3stP4MLc7yVq0AQN
	G9CmCkkrK9BLFiuhm8E+1REgbj5CkW9yvQ==
X-Google-Smtp-Source: AGHT+IHEVDR57nCdsQnrgKWaiuwI6BrlBa+3Gafle4OC07B48/FwRJh/R2OQX6PrvQsuocnkYYxPDw==
X-Received: by 2002:a05:600c:2050:b0:40e:49c4:43c7 with SMTP id p16-20020a05600c205000b0040e49c443c7mr3396133wmg.159.1705392109407;
        Tue, 16 Jan 2024 00:01:49 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:4197:afbd:4d31:1a09? ([2a10:bac0:b000:7588:4197:afbd:4d31:1a09])
        by smtp.gmail.com with ESMTPSA id j28-20020a05600c1c1c00b0040e6726befcsm14570130wms.10.2024.01.16.00.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 00:01:49 -0800 (PST)
Message-ID: <bad09d97-d99b-4231-a481-c14ed0f8d59d@suse.com>
Date: Tue, 16 Jan 2024 10:01:47 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 10/16] x86/tdx: Convert shared memory back to private on
 kexec
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231222235209.32143-1-kirill.shutemov@linux.intel.com>
 <20231222235209.32143-11-kirill.shutemov@linux.intel.com>
 <89e8722b-661b-4319-8018-06705b366c62@suse.com>
 <20240116072822.pvzseyqry56eqa4j@box.shutemov.name>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240116072822.pvzseyqry56eqa4j@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.01.24 г. 9:28 ч., Kirill A. Shutemov wrote:

<snip>

>>> @@ -41,6 +44,9 @@
>>>    static atomic_long_t nr_shared;
>>> +static atomic_t conversions_in_progress;
>>> +static bool conversion_allowed = true;
>>
>> Given the usage model of this variable, shouldn't it be simply accessed via
>> READ/WRITE_ONCE macros?
> 
> What do you see it changing?


Serving as documentation that you are accessing a shared variable 
without an explicit lock (unless I'm missing something). 
conversion_allowed can be read by multiple threads, no ? And it's 
written by a single thread?


> 

<snip>

>>> +static void tdx_kexec_stop_conversion(bool crash)
>>> +{
>>> +	/* Stop new private<->shared conversions */
>>> +	conversion_allowed = false;
>>
>> What's the logic behind this compiler barrier?
> 
> Disallow compiler to push the assignment past atomic_read() loop below.
> Not sure if anything else prevents such reorder without the barrier.
> 
> And I don't think WRITE_ONCE() will do the trick. It only prevents
> multiple writes, but doesn't prevent reorders agains accesses
> non-READ_ONCE()/WRITE_ONCE() accesses.
> 
>>> +	barrier();
>>> +
>>> +	/*
>>> +	 * Crash kernel reaches here with interrupts disabled: can't wait for
>>> +	 * conversions to finish.
>>> +	 *
>>> +	 * If race happened, just report and proceed.
>>> +	 */
>>> +	if (!crash) {
>>> +		unsigned long timeout;
>>> +
>>> +		/*
>>> +		 * Wait for in-flight conversions to complete.
>>> +		 *
>>> +		 * Do not wait more than 30 seconds.
>>> +		 */
>>> +		timeout = 30 * USEC_PER_SEC;
>>> +		while (atomic_read(&conversions_in_progress) && timeout--)
>>> +			udelay(1);
>>> +	}
>>> +
>>> +	if (atomic_read(&conversions_in_progress))
>>> +		pr_warn("Failed to finish shared<->private conversions\n");
>>> +}
>>> +
>>
>> <snip>
>>
>>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
>>> index c9503fe2d13a..3196ff20a29e 100644
>>> --- a/arch/x86/include/asm/x86_init.h
>>> +++ b/arch/x86/include/asm/x86_init.h
>>> @@ -154,6 +154,8 @@ struct x86_guest {
>>>    	int (*enc_status_change_finish)(unsigned long vaddr, int npages, bool enc);
>>>    	bool (*enc_tlb_flush_required)(bool enc);
>>>    	bool (*enc_cache_flush_required)(void);
>>> +	void (*enc_kexec_stop_conversion)(bool crash);
>>> +	void (*enc_kexec_unshare_mem)(void);
>>
>> These are only being initialized in the TDX case, but called in all cases
>> when CC_ATTR_GUEST_MEM_ENCRYPT is true, which includes AMD. So it would
>> cause a crash, no ? Shouldn't you also introduce noop handlers initialized
>> in the default x86_platform struct in arch/x86/kernel/x86_init.c ?
> 
> kexec on AMD will not work without them, I think. But noops makes sense
> anyway. Will fix.

I'm not disputing whether those are needed for AMD or not, that way I 
see it you make those callbacks mandatory in the case of 
CC_ATTR_GUEST_MEM_ENCRYPT being present, yet only implement them for 
TDX. So in the case of AMD they will be NULL and so AMD with kexec 
enabled (albeit erroneously) will crash, no ?

> 
