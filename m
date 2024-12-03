Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36D1F131A
	for <linux-coco@lists.linux.dev>; Tue,  3 Dec 2024 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246921; cv=none; b=MOl/g2WaS8kXsejPnaOkjuVhXk2m0aHd1XNcbL5dakEL1F6JZmIZ6GMmA1Xji889BSFZENIUVjRbL2hr/hrTlXXCGaLYOzzZvIasxOS9vp5ABBM54EpxiYU7yDZVIMLcIa3KTPGSMEgGEFwEpTmJwLmvVIcWEBmnbvURXvIwv2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246921; c=relaxed/simple;
	bh=/gTNyCXQU03C39326vEnqkA1N6Vo2JlTmY89Tz79xhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUu9ukvJd7mwSESR4KV3NZABifWk+Qth06Ar2kXsh1Oqk62FiulGYIDN8y7KXgvg4v3hOoN+sw28M9iS1xWY8y0xpwYQyCEHg91YxE++9qmRdsPXKSnZbHRXn9wiZAwFzqnGR0TPCVHX4ZXZ+d7PZhXeNlGAUEH7CXXJMzYMVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EBHhjBZ8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EBHhjBZ8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso51137285e9.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Dec 2024 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733246918; x=1733851718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wZBUj9SMqVIY6pqeS7vZcLy9CSGD7zkKQLE0TkTYaXo=;
        b=EBHhjBZ8TBqodSpdx7IND8+QzF7agQHZJYycBu6e3SwKYqnl/6v/5pFOIwDGPGTzek
         4qxw3o0Nds86SYxjtBgNs+60DH4Ht2LRPIHZxNrizH008n3rQFnUihGoU5FeUORDZiME
         U8ogbkUhWqcl0WaGJ4FjpGIcI9ehveZskljYrMyC8MS4U4VHNOiKL+4UkWeBgAIsEB8B
         Z+KYkTYMTnUj9T6G5jvU9FxtsrkbKPuC1ghcl/hPWqTieIMwm15IpCMDbKemtXfNWeCo
         sGwEdULYg+45CGk1FMybPfiKzD8P9TSYdLOulId4wLRnHM6Ms+/MY34mP4hdRNlFh1wf
         CJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246918; x=1733851718;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZBUj9SMqVIY6pqeS7vZcLy9CSGD7zkKQLE0TkTYaXo=;
        b=aETCbGwSJVCr8I5LEVIXUmwrxbmz1TbV9ln8Uy9y/Bi/0/nQGcV4p63ZTjok+addLl
         NOYYyAcFEJHrbh8svljagTdeBhJrsJZT6wupbL0CvD0/2gJZaMGC1w/5NwKKc+vsOmUC
         nT3xKo967GnVnwo0Uzk6At9WQIC4sW+whZn9kgF3+AI9vFNcrWxvRIMXvgsAAbcDzkPx
         W73xpWI9eV2UQ9LtJ1qC8/ExiOjfthyQzAD/aNkpa6qBJWsaFkViG7gF+8N6ES7dn7zV
         DgMqgHQp2EdV41NNaK7l/kH7OziHvSPULiyMMBWkYUymuMMffkTWI3QfKhMohso3Q5Oz
         hZ/A==
X-Gm-Message-State: AOJu0YxPnDwZv+N+BFFRP6ERcQ+H9o8p7XBlV1B3x/NTQ5W7uWFGRERJ
	BiGFBW/LD/V6A6nYVhNI2OHskaWQtIZmYSsybsT/v9JRrwI2xwcjhq/AiJciNdg=
X-Gm-Gg: ASbGncsmZfVz5vdBeccfjqtbNUQJD5ZbWIVdmi+cYtyglfZB6NdeyEyRqf6WOC0V0wG
	MV2YQTGz4x/O6RR5AuEGOkTVKLzb4VeAjfJ+k7r2Eocft49MlrUcq4kXlaVJbSY+3IWfah4oL0W
	b8TE4ysSXhd7l0bqmtQFEHzSNaJpOTxzf2dLhtvNN4PQelrTZKhulk451sekDLXc3tBVwn0doFW
	IZ00tWRKHr0p1nb9Gz2OA3UO0HM+fPLVQzYDEG/mzvv0X9tLua0gYr92K1+WmrdBvHiMtvIUN0=
X-Google-Smtp-Source: AGHT+IGPNn94J2dpQ5kh5lIK6FeDE5RanphaqK7PW7F/ltFApM1dfvj99MJkhyaY+6+eyweaw/QpUA==
X-Received: by 2002:a05:600c:5125:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-434d09bf79fmr29233945e9.11.1733246917749;
        Tue, 03 Dec 2024 09:28:37 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.217.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7691b0sm227956775e9.17.2024.12.03.09.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 09:28:37 -0800 (PST)
Message-ID: <4c92909e-cb0f-4917-834c-3425284db808@suse.com>
Date: Tue, 3 Dec 2024 19:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Enable #VE reduction feature
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241202072431.447380-1-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20241202072431.447380-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.12.24 г. 9:24 ч., Kirill A. Shutemov wrote:
> Originally, #VE was defined as the TDX behavior in order to support
> paravirtualization of x86 features that can’t be virtualized by the TDX
> module. The intention is that if guest software wishes to use such a
> feature, it implements some logic to support this. This logic resides in
> the #VE exception handler it may work in cooperation with the host VMM.
> 
> Theoretically, the guest TD’s #VE handler was supposed to act as a "TDX
> enlightenment agent" inside the TD. However, in practice, the #VE
> handler is simplistic:
> 
>    - #VE on CPUID is handled by returning all-0 to the code which
>      executed CPUID. In many cases, an all-0 value is not the correct
>      value, and may cause improper operation.
> 
>    - #VE on RDMSR is handled by requesting the MSR value from the host
>      VMM. This is prone to security issues since the host VMM is
>      untrusted. It may also be functionally incorrect in case the
>      expected operation is to paravirtualize some CPU functionality.
> 
> Newer TDX module provides REDUCE_VE feature. When enabled, it
> drastically cuts cases when guests receives #VE on MSR and CPUID
> accesses. Behaviour of a specific MSR or CPUID leaf/sub-leaf is defined
> in the TDX spec.
> 
> Enable REDUCE_VE. It brings TDX guest behaviour less odd, bring it
> closer to an architectural.
> 
> Note that enabling of the feature doesn't eliminate need in #VE handler
> for CPUID and MSR accesses. Some MSRs still generate #VE (notably
> APIC-related) and kernel needs CPUID #VE handler to ask VMM for leafs in
> hypervisor range.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>


<snip>
