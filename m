Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF125D919
	for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742810365; cv=none; b=WNQ/fVzyAaPD7K3wAEQEsSikXf+ZNUJOrdfOkVQ2y0lmvXYZp09UfDxuZMGJYZIF+kxal8UKfZnzcSaYKCjf7gSXVMpx8Qj33ZwpjScB1+WxLLz+DZUJUOMNhembuXIn2mz+/z5eWPYk0hDRk4ctOHBU0HiYfYuyO8/bZ2N2VpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742810365; c=relaxed/simple;
	bh=vWTVDvcU0o4L768ZMZZd6FAcvB7K627DBPFsUxxwneQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMmp1yobUqqkWaYB5MmxRntJ3zbl80rc6j6fCGtCqW+mjTBjxJuOTE4pMsx6a32052DjJWFhD+IkIyWdtisuhSnrjqi4Bqiqkxtyxhjg7SesAfRDEI1gB7GlVLU2Ddzy0oSH3SYHhZQakVkClJmX+TcIWj2CvGIfKKI/7r1ZOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nllof3Ja; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nllof3Ja"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d45a148so3351620f8f.3
        for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742810361; x=1743415161; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0x1szqNluXRdFHlnkhxeTJTRaNEPeNMvCPbIRkxMkzc=;
        b=Nllof3Jae+zlGSDM9DX10MMX82zUKe5lk/EqJrS6Ehj6nWTXAeT9QffDM4hRo0IxRh
         dCro5nJFV95broUBoQdjWde44uCkVtp4Yh7oMymvD+tMZJMIafBauS19yd0YHVR6jECP
         eKLQ5ykvQ6jOSO3UhInin45vTUdz5YwsOX8xa5/6fJpX3SiYRPWaQyDQhETGMsu8+4Yb
         3qCzi08ezgaMEwCMDyErq0gkwYavc1UUFG5sbgZi1mmciZFctx+aRV0DHFyhJf7CdE7c
         0bN7pxg/kFcervRlFdJHIIVn54FI2d95qKVSXMkfGEIqWcARRX9elB3I7JT1m0snzhi6
         kDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810361; x=1743415161;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0x1szqNluXRdFHlnkhxeTJTRaNEPeNMvCPbIRkxMkzc=;
        b=NQl1vNQgXE0VD+cJzxlH249Jn1djBUSKV3m85XHA917PBgxlpXGa87Yhw31JNOCnVe
         9km94LQLrVIUAQN9R2aHXdNFX8nvnzU4aWBemq0agsTyuRzBvGHTbIBeGFE5JBYaUAxf
         MgPrExRSv/XLI765JTOVtTAE01IyJCMWLKnJPYis/d7jgFerUda8iGZUbo/bGymaNzjL
         Cs2GZi/njJOUACuoZCpATprpwnZv6rIm/fb3HSiYzuPPSBueb6J3pGpKkOXd2OeyHgkS
         BDCykbtustXzgOWCPL8873J/hiFE+wAPe3tyflSoPyxgwkV8h05dAjrvzab1A7gMWuvY
         0s/w==
X-Forwarded-Encrypted: i=1; AJvYcCVE9JVV1mQrQrOY7UzFscvTu7Rq5ntqjhlZnRrirohq2iDmHYgLzl/65WbM0PKjXwRewypWLKSSPdRy@lists.linux.dev
X-Gm-Message-State: AOJu0YxuLcQl51kQZbFVt/+UZgmlttaBHPfHCaHh0OFmzJTKRxP87D0R
	x8fxwg+zYIJiA3CNRS4fz0upaRaY9ZpmSsxdLsqFnoOWQsuzZW5AasOW7LrdjCM=
X-Gm-Gg: ASbGncuFKPxx2FTCDSIvdTWJhUMQUr3C31sEHoseCZMxXQttZpqTfhLpSG5uR16YFZT
	ZhH8zMyaWL0U8vph4O/rFVHEP5cWVHH1voV6xnP+vqVh9tp+upEJX9Ri6pcTQnhb4GjUYRZEVyX
	3MviJKvsnHeYKFdkk9i3PZ6oGDDBL9n7vYdhR3/uskfWHzckxdb6H2U7U3CWqXkXN5V1O16wijx
	LaVHHRnwzntYBbUPWO0pnhvClic1ZsDACdGYuvZ8Y6vn6knVN9nPvai0AQfOZ6V+gngJtUjdIXD
	ecexcryHlHH/qpgbgPkUwLBWTk1EP/W6JgV1NOOY9u/18xViVGDeMTh4d9hfKcy0jKJGDPj/WAP
	fTu5Wdis=
X-Google-Smtp-Source: AGHT+IEZBXb8In+hm/mlMuQwYUbtYes821tRtjpaqkfz/8npTdiwCyS93ktKfkIKoFtyGe+iN/UeKQ==
X-Received: by 2002:a05:6000:1867:b0:399:728f:4673 with SMTP id ffacd0b85a97d-3997f91bc81mr12810206f8f.33.1742810361176;
        Mon, 24 Mar 2025 02:59:21 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.139.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm116116715e9.5.2025.03.24.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 02:59:20 -0700 (PDT)
Message-ID: <327a23d5-d5c4-4227-aafb-9d4ddd90289e@suse.com>
Date: Mon, 24 Mar 2025 11:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <67d9c447ddcfd_11987294c6@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67d9c447ddcfd_11987294c6@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.03.25 г. 21:06 ч., Dan Williams wrote:
> Nikolay Borisov wrote:
>> If a piece of memory is read from /dev/mem that falls outside of the
>> System Ram region i.e bios data region the kernel creates a shared
>> mapping via xlate_dev_mem_ptr() (this behavior was introduced by
>> 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()"). This results
>> in a region having both a shared and a private mapping.
>>
>> Subsequent accesses to this region via the private mapping induce a
>> SEPT violation and a crash of the VMM. In this particular case the
>> scenario was a userspace process reading something from the bios data
>> area at address 0x497 which creates a shared mapping, and a followup
>> reboot accessing __va(0x472) which access pfn 0 via the private mapping
>> causing mayhem.
>>
>> Fix this by simply forbidding access to /dev/mem when running as an TDX
>> guest.
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
>>
>> Sending this now to hopefully spur up discussion as to how to handle the described
>> scenario. This was hit on the GCP cloud and was causing their hypervisor to crash.
>>
>> I guess the most pressing question is what will be the most sensible approach to
>> eliminate such situations happening in the future:
>>
>> 1. Should we forbid getting a descriptor to /dev/mem (this patch)
>> 2. Skip creating /dev/mem altogether3
>> 3. Possibly tinker with internals of ioremap to ensure that no memory which is
>> backed by kvm memslots is remapped as shared.
> 
> It seems unfortunate that the kernel is allowing conflicting mappings of
> the same pfn. Is this not just a track_pfn_remap() bug report? In other
> words, whatever established the conflicting private mapping failed to do
> a memtype_reserve() with the encryption setting such that
> track_pfn_remap() could find it and enforce a consistent mapping.

I'm not an expert into this, but looking at the code it seems 
memtype_reserve deals with the memory type w.r.t PAT/MTRR i.e the 
cacheability of the memory, not whether the mapping is consistent w.r.t 
to other, arbitrary attributes.

> 
> Otherwise, kernel_lockdown also disables useful mechanisms like debugfs,
> and feels like it does not solve the underlying problem. Not all
> ioremap() callers in the kernel are aware of a potential
> ioremap_encrypted() dependendency.
> 
>> 4. Eliminate the access to 0x472 from the x86 reboot path, after all we don't
>> really have a proper bios at that address.
>> 5. Something else ?

