Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF016EBEF
	for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716979679; cv=none; b=cM9FLgB7sX18hBEJKju+z4iTMLMlUgxIm0gPbUfIvKcI/6CuOlXkFjIl6Z4mcnopQHczz/HaRht8Xb+vOfgxmU2F9t4kxxTwpPRExAXqTGVQYwiNPrOX8NZbMlX0VTSFPhS1IXbnA1pegcewVAC/FmFS0Idcuxoa/K2LF/b5W6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716979679; c=relaxed/simple;
	bh=biTHQy47V8Q8BKCW+K43IFMoQQNOJzPVouRP8f6euts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gC3SHSNSlBl45v/LnT0Cf9olCxDNE2Mmj4aDYvDt1Sy31y5opPTtupMhLuK6Oo++tXbKUDPg/tsl5JKIi1E7722+lOiHJwdn+3H320V8emPmVQJwIbr4t0y49fe1ZcRPjgoscKMXfgMqR364rsYPgtxKKVtGWs4DOrWMZUYX+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZcZTQ9Po; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZcZTQ9Po"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b4fcbf078so358057e87.0
        for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716979674; x=1717584474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwTOdZ/RFlQPDVFnmQ6lMLq54IcHFFkkOCYIgsO+Y4g=;
        b=ZcZTQ9Po1MkD3rqNEohIaMVq1pImBWWCE7auGzbbExlnoMsxAHMkfXiCmfiwlmdgNB
         ztabuZgmOJqkiwOQB11v/DE4csWWFOKQZhd51VSt4Qt66G9ppHgcg0Tw+Kw3SwniugLS
         WQbeYJQOaQawwyJDcl0oYMghNogdB0fBLfkVMJ8X40TNyYIrB5wouPaCGkjIIGOOvXqq
         J7YoSjNz66mpPQbrGScGWwUHSmddgzV1pEmgKk/iiCseif2QFjcDpouR6UOUIZuk8tJM
         cDWBY4J+qPyV1nJAm/WKTl0l8HmQt2TkO85LNle9scFcMhs0hAJ/BUJ1L/RZwFg6wi2s
         oQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716979674; x=1717584474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwTOdZ/RFlQPDVFnmQ6lMLq54IcHFFkkOCYIgsO+Y4g=;
        b=aCmOIbCktW8TAgtXaKtIgL7kAm2VtJCuQokiyG0L3YLEBlFib3s2U9FtrCwBvKEJTa
         B8JNMbyqg6Dl63N8SWVEnSXzbtlmd1pk9aZ28ELzh9Q1LV4GQFVPC75duA0PsDgdQVd7
         T5iUBjC+VilPbUJEAHyzpVVDwFDrZIbdOJYryMqVWBwNYhBBroerqtNJY4taaakThJVH
         LzYupBiTiRDtfFw27wQgLU44a/sVBdV+ZhRVKzy6vi3sCeOR3ura6JV6Zi/eMQaQBnts
         IhfnIntOctBXr4eXO+UTdBR3wulRb8wciASFyUPimblYh0YYMi6/QounMj+jo54o5FKZ
         4MnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwj9LlOTrhXVBTJ7trZF7OoVsxrHYa9TnViZFKdS/Qj3uTLxFSeGYd7xlAQFWiQ7lESQNPXrkFZTD6WX2AYKLlsLAWOMDl3cZfwA==
X-Gm-Message-State: AOJu0Yzawa9T+Hd8cZiqbfN/cTP2o6nwsftLj0sKbYWmub0hutSArk8e
	uDurm5y2NLD56FWv5ZTMLupSrrLzGIz3yroRJ1Lf/lwspEYLaSgJKn5vdLVu370=
X-Google-Smtp-Source: AGHT+IEDNLfaKkjwilk2wM/7emdtUCiwRFG5fAyoCeXjb78CBxx0+9sY3lJLnzVD08O5h0N8LkpWdA==
X-Received: by 2002:a05:6512:4c4:b0:52a:fdcb:6652 with SMTP id 2adb3069b0e04-52afdcb66efmr721019e87.68.1716979673442;
        Wed, 29 May 2024 03:47:53 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:5de0:ca17:8dd8:7313:d6fd? ([2a10:bac0:b000:5de0:ca17:8dd8:7313:d6fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108970b4esm176411645e9.14.2024.05.29.03.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 03:47:53 -0700 (PDT)
Message-ID: <1e1d1aea-7346-4022-9f5f-402d171adfda@suse.com>
Date: Wed, 29 May 2024 13:47:50 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv11 05/19] x86/relocate_kernel: Use named labels for less
 confusion
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, kexec@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <20240528095522.509667-6-kirill.shutemov@linux.intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240528095522.509667-6-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.05.24 г. 12:55 ч., Kirill A. Shutemov wrote:
> From: Borislav Petkov <bp@alien8.de>
> 
> That identity_mapped() functions was loving that "1" label to the point
> of completely confusing its readers.
> 
> Use named labels in each place for clarity.
> 
> No functional changes.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>   arch/x86/kernel/relocate_kernel_64.S | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
> index 56cab1bb25f5..085eef5c3904 100644
> --- a/arch/x86/kernel/relocate_kernel_64.S
> +++ b/arch/x86/kernel/relocate_kernel_64.S
> @@ -148,9 +148,10 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>   	 */
>   	movl	$X86_CR4_PAE, %eax
>   	testq	$X86_CR4_LA57, %r13
> -	jz	1f
> +	jz	.Lno_la57
>   	orl	$X86_CR4_LA57, %eax
> -1:
> +.Lno_la57:
> +
>   	movq	%rax, %cr4
>   
>   	jmp 1f

That jmp 1f becomes redundant now as it simply jumps 1 line below.

> @@ -165,9 +166,9 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>   	 * used by kexec. Flush the caches before copying the kernel.
>   	 */
>   	testq	%r12, %r12
> -	jz 1f
> +	jz .Lsme_off
>   	wbinvd
> -1:
> +.Lsme_off:
>   
>   	movq	%rcx, %r11
>   	call	swap_pages
> @@ -187,7 +188,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>   	 */
>   
>   	testq	%r11, %r11
> -	jnz 1f
> +	jnz .Lrelocate
>   	xorl	%eax, %eax
>   	xorl	%ebx, %ebx
>   	xorl    %ecx, %ecx
> @@ -208,7 +209,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>   	ret
>   	int3
>   
> -1:
> +.Lrelocate:
>   	popq	%rdx
>   	leaq	PAGE_SIZE(%r10), %rsp
>   	ANNOTATE_RETPOLINE_SAFE
