Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB91DE2C3
	for <linux-coco@lists.linux.dev>; Fri, 28 Mar 2025 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159106; cv=none; b=OdlsNgAOStym8wK05xiQ6+POkc8BHcj72rxy33XBVjfJSHjfUVR6cR4DbQvtPbM2DEDMSyiWQZ3kUJ+GcKGfKRpWhO36WsacTFhmLyQWZUFLlCXdS7PAvOcxjQZohe07aiKINls35CWDjtbwPrPxoBOU51KiPoZQpgt8Rta52Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159106; c=relaxed/simple;
	bh=HbA7tMOi1Feho6qYy2tg+QgB3PPhFWttRgsDiLAQsAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVX+raNlJlpVK+UmyW8C/i0xYtRYqp/PncGJBihtR9XHbNf+L2PycLE/5TrdyO9xr7dnZLH7T3PUeNp/sa3lKjhN8zZ4NQRl/TDS2YF4v81GyjBysC+HNWiJWA8gpZTSo9JS/0ybXIaXzVE+1VkC/K2Ytrhb/T2f1IJD70cvnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XyX66qP+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XyX66qP+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac41514a734so329939466b.2
        for <linux-coco@lists.linux.dev>; Fri, 28 Mar 2025 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743159102; x=1743763902; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQVoBzYq7Puhz7ziaLimw8gEX/xy907ffqXtK8mC8IY=;
        b=XyX66qP+umCuZeC1G6GeyMOsevwj/ehhrJ0S0EHIZP4y3Ac1ktvFy4z7diepJSSsKP
         9i6gUVfV9jI4PXv+jktOeq11P18r7OOAYpgDtew4a1NASBPZ4KZkCd0+fTkDFcYcPqxp
         X6N8AMLRcetOMzu9ZmSYfo56to3dj+Exw7r3uWbrNQoFEpBEbSdSQPhrWxx+36VBFbCC
         rprk3IWzlXIRy9gVaHotNNkGCLSZb7r1OyVL0xDonYrNmVBd51b7mCtaeAqQjkynx/nE
         N72S09NgLPAXpQ1Y3DUedqCjXkifLsGEN9f0H0J3C952SLI1x5a70y5GexhjKn7M4Kyd
         nbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159102; x=1743763902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQVoBzYq7Puhz7ziaLimw8gEX/xy907ffqXtK8mC8IY=;
        b=FmUrD005D4iWY6WiHRyt8xM8cUheIDZyq6BHVk48fNln2aCRBeHXeHLJ0ciIwP+UWh
         JUdWg3dhsDDMtEhnegTPxijwBqljTvepN1J5ghga2XZZPE4xd066ktoqTlgzcrL56XhW
         D5YcmJSqeqt6bNcjEJb9ieP9ZyA/A6GwecoGaJPG7M75FH++YHiMrlC3gFINmr5Z/gXf
         NKDsefddvpsD5MaLerGMpJoZ3LMxdywIZ/YCG7EdrWr4pAACn2qaZKRxE/MTumFY1BIo
         bHJbdqgQ/EJxyBUQJRzAu1x80R+Idy6FjB4EHC3O//PCsHg6aav2cVck6jM78X3SVedY
         AayA==
X-Forwarded-Encrypted: i=1; AJvYcCUUU1uaLOu/dlhjydQ5Uf7TDujamsn4aCbE79LMwfu8pXbg34FNn/6V6KIssasygPrTFBx/hqaHclo+@lists.linux.dev
X-Gm-Message-State: AOJu0YzWwo35wbKAKNmakqJz23NxHZvZDDvxYsvIlWj1Qa8t7+gDAaAg
	s1xP7sOddFhIadHIXnc7Tv5pZ88YW9dms5rQyE1/SorVO6JFqjr3D0bp8py05Zg=
X-Gm-Gg: ASbGnctx+XtOc1tHP+7VJXzle3Jj7zNpSf7/liBZpvgaKJo6lI1wYw0GJ8IA5DUs3x9
	AjPLAOz16K8aJa1QewoN826Pcl7r3/S7rBPIUYIaZGWj5Jmeq7J286uei78dG9TdowPkFhj1yIe
	Bx87BTz/5bqljncU/0lSzP4unqfs1sD50mK+oFUdjX0YbfWtoZLcRi9f9ZQQDgXVXrFzqtIR11S
	2SgjHQm8fDmBt1PZGBe4D3FnZ1Aign4Sfmct52ZOZ1Wr4eN8401Qyo0d9x3V+C9SGXi0UF4PhhW
	aWGkzewIjwrxLSm1dV48MeIp6PCNLK1aHurhuUaxwh2C97ETNw==
X-Google-Smtp-Source: AGHT+IFL4jqPAqUnZ7HDp7n5d8sxsztzpjD+EXPGZF738ZKWCkWtSM+MMvDEWhIygYJX8/2agEkClw==
X-Received: by 2002:a17:906:c148:b0:ac3:47b1:d210 with SMTP id a640c23a62f3a-ac6fb10a79amr784650266b.39.1743159101716;
        Fri, 28 Mar 2025 03:51:41 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba88sm143453866b.16.2025.03.28.03.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:51:41 -0700 (PDT)
Message-ID: <90b3e063-9587-40a9-90e6-1ad792c4a175@suse.com>
Date: Fri, 28 Mar 2025 12:51:40 +0200
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
 <327a23d5-d5c4-4227-aafb-9d4ddd90289e@suse.com>
 <67e2f315af42e_50a3294d4@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <67e2f315af42e_50a3294d4@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25.03.25 г. 20:16 ч., Dan Williams wrote:
> Nikolay Borisov wrote:
> [..]
>>> It seems unfortunate that the kernel is allowing conflicting mappings of
>>> the same pfn. Is this not just a track_pfn_remap() bug report? In other
>>> words, whatever established the conflicting private mapping failed to do
>>> a memtype_reserve() with the encryption setting such that
>>> track_pfn_remap() could find it and enforce a consistent mapping.
>>
>> I'm not an expert into this, but looking at the code it seems
>> memtype_reserve deals with the memory type w.r.t PAT/MTRR i.e the
>> cacheability of the memory, not whether the mapping is consistent w.r.t
>> to other, arbitrary attributes.
> 
> Right, but the observation is that "something" decides to map that first
> page of memory as private and then xlate_dev_mem_ptr() fails to maintain
> consistent mapping.
> 
> So memtype_reserve() is indeed an awkward place to carry this
> information and overkill for this particular bug.
> 
> However, something like the following is more appropriate than saying
> /dev/mem is outright forbidden for guests.
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 38ff7791a9c7..4a7a5fc83039 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -122,6 +122,10 @@ static void __ioremap_check_other(resource_size_t addr, struct ioremap_desc *des
>                  return;
>          }
>   
> +       /* Ensure BIOS data (see devmem_is_allowed()) is consistently mapped */
> +       if (PHYS_PFN(addr) < 256)
> +               desc->flags |= IORES_MAP_ENCRYPTED;
> +
>          if (!IS_ENABLED(CONFIG_EFI))
>                  return;
>   
> ...because if the guest image wants to trust root why enforce piecemeal
> lockdown semantics?


This fixes the issue as now the remapped address and the direct mapping 
are identical.

Tested-by: Nikolay Borisov <nik.borisov@suse.com>

Would you care to send a proper patch ?




