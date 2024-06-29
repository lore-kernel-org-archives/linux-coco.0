Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A153C485
	for <linux-coco@lists.linux.dev>; Sat, 29 Jun 2024 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719656430; cv=none; b=VK+lAL5k0fBaPqUxtKs4rCqQbPeJOVjZfW4bmZbySAUe+zFW8NpH2BDc5G4muCwuLNklq/m/Pq+ofKPDjByR0kGwAC6S/DSIVrSvvFgU3Cho9m2RMu/VlPp+P3wpAqc26cSu+MqTtNa0nnsZP1c1nD15YzATuMWX/pj9mGyKwqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719656430; c=relaxed/simple;
	bh=/h+/KiD+8YcmKDbvUnLysSmi8xU0L8Gy+fezN8KWdh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwD5ZuVjXiuc3+A8w9+GgpjBpzIsBK4FzlZwN59GwwI96vq1awcpYzehULLrRHsaGseo/ktyRTX0W+QjFm7tgw/bS+tjyaqGYc5qySMaOnKjf4CabSeE/dLljkJVChViPwvJC75tqI4Zi12/yjx4geo6cQuCVVsqua3La2HnFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JUzTwIde; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JUzTwIde"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso858382f8f.2
        for <linux-coco@lists.linux.dev>; Sat, 29 Jun 2024 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719656425; x=1720261225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHfc2Ok8Ex6+h+gzfv5bxVHv1mLg7+fEtcCdnzYL8h4=;
        b=JUzTwIdeUSMsNOZKSPqI9YSJIuUa9pKHb3cfrMDVClVIHhD6oGWHnedsqmGh+wBXPn
         Zrrx1loPq6ouS9JM8PBlA80I7LuSoM9/bFIjUaDTHaNygayuCm44x6T8bi8+6lQzLwqL
         g0lPrFfisgy7imCBP5rHswN1oJiGbZkdIY8zoC1UFcYZFQdtPLzq5qrqhR46CZ8d6yKL
         IX5grBUwSWLpZxQDk+aLrefOJFW8hn6SDEsslzceZ4YCaqrOp9sZZR7rgwyepY71Xl4e
         ss1Mi+JLhjvxWk2pFzKY3gcvWayHyQdeMUFqt+WcXIyMPbi9NROKBB7K0uKDvGmEkHxa
         WPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719656425; x=1720261225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHfc2Ok8Ex6+h+gzfv5bxVHv1mLg7+fEtcCdnzYL8h4=;
        b=ZaExMuJ/KmIW2UVCbgDkmeC9tmW6wCQD4roo3BcPf1AEC0O8NozZuhkimYrg5ArgN4
         kuGSGg1OOqPx2MsGa5fj0kGxLn+5BqRzgNUr4WATjuHyjE8UP/FIV7QLHW3GOMJWI9UA
         5V3v0SN01FyOSgsAwIyMN00EMGAA2qUAAXYBb6wy1q6Rf+n6iRU3+Zk33g5wifHsn8zR
         WlF+PDpSCeWzbF2YrUHwKC/gAjT1jkc1ULnzixARjdusR6+GXgKlyppRR4AW8J7zO7lE
         ZdMMP0XoTJE3UQHEIfAUTqqsxj5Vs8aiIaAncsX5lTcRP8iap1wb8hDPFgFDgt5oerJ0
         0SRg==
X-Forwarded-Encrypted: i=1; AJvYcCUxgAvXSsZzBm7uVMJ4etE00f5YDou8aL4VkXRpLGkV5L8DCkpI99z8zQu+wvxm2RhvSR+rrvjohPekLVIZc6Ezg6eTWNPzvCSTQA==
X-Gm-Message-State: AOJu0Yw+Khr2LN10txbRH1yaCY8bn+TggvJVo4sHLhssBeYV9v54J4Mv
	4oz9w7P/ZccJ0xqtvFLTbd3Wny5psk5gwDqZM/rkpQbLKqeCb4n4lfT/NOEj7tU=
X-Google-Smtp-Source: AGHT+IHf8b56QVpki6o1vkILYZt5x1CAglvQFemSTn8n4t2wrS7SaYvjI6qxpUZwzm4Bwxfh47BlPw==
X-Received: by 2002:a5d:64e8:0:b0:362:9313:e535 with SMTP id ffacd0b85a97d-3677571b64bmr500999f8f.48.1719656425365;
        Sat, 29 Jun 2024 03:20:25 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd707sm4554373f8f.1.2024.06.29.03.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 03:20:25 -0700 (PDT)
Message-ID: <2982a4f2-ea8f-4fa4-81ea-d73c00fc2ad0@suse.com>
Date: Sat, 29 Jun 2024 12:20:23 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix lookup_address() to handle physical memory
 holes in direct mapping
To: Ashish Kalra <Ashish.Kalra@amd.com>, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de
Cc: x86@kernel.org, hpa@zytor.com, kirill.shutemov@linux.intel.com,
 rick.p.edgecombe@intel.com, mhklinux@outlook.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
 linux-coco@lists.linux.dev, jroedel@suse.de
References: <20240628205229.193800-1-Ashish.Kalra@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240628205229.193800-1-Ashish.Kalra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.06.24 22:52, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> lookup_address_in_pgd_attr() at pte level it is simply returning
> pte_offset_kernel() and there does not seem to be a check for
> returning NULL if pte_none().
> 
> Fix lookup_address_in_pgd_attr() to add check for pte_none()
> after pte_offset_kernel() and return NULL if it is true.

Please have a look at the comment above lookup_address(). You should not
break the documented behavior without verifying that no caller is relying
on the current behavior. If this is fine, please update the comment.


Juergen

> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>   arch/x86/mm/pat/set_memory.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 443a97e515c0..be8b5bf3bc3f 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -672,6 +672,7 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
>   	p4d_t *p4d;
>   	pud_t *pud;
>   	pmd_t *pmd;
> +	pte_t *pte;
>   
>   	*level = PG_LEVEL_256T;
>   	*nx = false;
> @@ -717,7 +718,11 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
>   	*nx |= pmd_flags(*pmd) & _PAGE_NX;
>   	*rw &= pmd_flags(*pmd) & _PAGE_RW;
>   
> -	return pte_offset_kernel(pmd, address);
> +	pte = pte_offset_kernel(pmd, address);
> +	if (pte_none(*pte))
> +		return NULL;
> +
> +	return pte;
>   }
>   
>   /*

