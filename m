Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682833938F
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717439; cv=none; b=uZ24mIWyMlPtbPRbYKlP42YYi1H0LwtRUq0jCH+PvenXATwX3YDQz1lEBd3amg4H7z09Ks6exK9qNLfs589HkPLzTltciAJayPGdWyuUW3MK0ihPbNWxTJaBy3rSUcLhLsRD8KodKJjExixv50Y4QBzwDIiki4+QHkOhuwj2d1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717439; c=relaxed/simple;
	bh=cT26bkOTYpm3jtpcO4eFItyZdPCZz1fdM1MVN1Hdaxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrbDJ7Sotnde9xD4NQi2kANlsDtUW+g+XlndHDUrcY8Ov6McZo4yN1cS66KpQfRlxNPQI93YPMBtujea5i4283SGkZZJe/MCBfE6R5sWK8ZrL3B8prvKt5mdVlSk8M9hJhm5qaiWZVeJRURF6cFh9LTKUzFkM78/TPhMi9udGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ghq1OaZl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ghq1OaZl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso39873815e9.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784717435; x=1785322235; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zXZVyY5wvEWXnofFGkPYwR4wB5dvlpWTyOutOPfcI/8=;
        b=ghq1OaZl6woqpkM4K5m8hELYbeoOEZWAzawClftE3jwNE8Mw6CPTCghROSMqCuCT3h
         cwrMTACewrKsO0gjmuVqSBsAK+b9nXWr8f6WFtaTZoyr0BgDu4EBnQaCtyEdAeKU17B9
         oWXA8DKQtCdFMYoIPlzODP6ZEobXJzUTprwNj8NsJQhhsRGFr4QyMtfg1DInZEDfZNZY
         A7exNAa+wzvpDVwK+t2JyUtNcXES1BZoHezh8F9kO9izx2YJjes12cIK7+M3ExknUWv0
         kvogEOX7yw5uXktQ/onb234WN2hQKLQjBTjVWGmTOnGH+2tn5bNy910FPEr96xz/yN0B
         sK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717435; x=1785322235;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXZVyY5wvEWXnofFGkPYwR4wB5dvlpWTyOutOPfcI/8=;
        b=qAn44ykvKEnBBqqZBfwuQrZhbXMbboOzB+phlQSQ8NaKaSGZbS1U35WW0mVpFFDgsu
         MOMp4Yu9j+98paZczKqPycs7y5zo9BM2xY8z4uuoppqVXly9ixdDq844E8p21P94ac3P
         og9X5Srbrm4Acjdix34Tk+b9iKuTviEkmHuM1/8xXV2PSgk4ur2ooXKDA6IP4OzsiRyz
         xQNf3K58MvtQwMK/eHwweocmS5uqFj4c+haSJ9A2c2tmU1HoNYBrfASd4nMY8UTIUzj9
         23+LDozMQ4j5JFYMHGgJXyDgo2a1uIZ55G8GRROpwQbhLOuArbGfXF3MH81vjNPqZ4IH
         wfRA==
X-Forwarded-Encrypted: i=1; AHgh+RolNeKjWf/y4ySEwEKbbkhSvQHdwgIYJ1GiIiyFredDfxjYunOVKz/r4aLIUYIhZKQVWCQHbUt19LZP@lists.linux.dev
X-Gm-Message-State: AOJu0YzzcDvwiMzwX1d0uYYuLh3us9S+enB8NHCDXBamd+75XGElPjSt
	5RWqA8VnOSJo2gQjCayx4sdXVf6JcHIf4mHSqcmsl2lJ870uUB55LxcA3oUwHa1swO+f6240vQz
	dr289CGY=
X-Gm-Gg: AR+sD101Pq+PR5T+61SIuUFr0fOzuc36fmM2kHaoPtyd1d+xbXMrYISlNa1dMhpDup7
	H5bwQ9CpMeh+jkCv8APZ6CsWd8IqhGbw9nSQupPrC4GZkorwXk0nC8GWHQ79jL6a3BP4flW1GyJ
	KiosWuV/csG4TIVfNvwL4KQQjr/wPyv6lLyM86SAxPuH4YNzA80Nd7x/j6GocpEe3/gMeXYt6g1
	nCdXnXgPpY+115WC+eP6bmE4AtQi7YwBFasaqFrT4OZt/M6JOn8MaCqv9cQdw3tabgyez36SN8D
	6l9VY/vHJEFzbW2QkpRgnvsAWPe2szHWy8O8oyC/5DZfxardMx8+6WcByyG4RK7bLbWr9+anDeq
	Z0NQ9dn/2mTX6jsUMfkEK1EqzBX4OGc8zBfu3OE73Exqjl83qtw0EkMsCRwoVj9/l2DmgWLM30o
	7ZF9J4gLOuw5wzvv8=
X-Received: by 2002:a05:600c:4584:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-4954a50e970mr252767515e9.28.1784717434661;
        Wed, 22 Jul 2026 03:50:34 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm198765855e9.7.2026.07.22.03.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:50:34 -0700 (PDT)
Message-ID: <c16ef391-845a-40b1-a05c-245ddee6da51@suse.com>
Date: Wed, 22 Jul 2026 13:50:31 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org,
 chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com,
 tony.lindgren@linux.intel.com, binbin.wu@intel.com
Cc: Binbin Wu <binbin.wu@linux.intel.com>
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-8-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260718014500.2231262-8-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/18/26 04:44, Rick Edgecombe wrote:
> When handling an EPT violation, KVM holds a spinlock while manipulating
> the EPT. Before entering the spinlock it doesn't know how many EPT page
> tables will need to be installed or whether a huge page will be used. For
> this reason it allocates a worst case number of page tables that it might
> need as part of servicing the EPT violation.
> 
> Under Dynamic PAMT these pre-allocated pages will potentially need to have
> Dynamic PAMT backing pages installed for them. KVM already has helpers to
> manage topping up page caches before taking the MMU lock, but they cannot
> be passed from KVM to arch/x86 code.
> 
> The problem of how and when to install the Dynamic PAMT backing pages for
> the pages given to the TDX module during the fault path has had a lot of
> design attempts.
>   - Extracting KVM's MMU caches requires too much inlined code added to
>     headers.
>   - A few varieties of installing Dynamic PAMT backing when allocating the
>     S-EPT page tables. (see links)
>   - Using mempool_t to transfer the pages between KVM and arch/x86 doesn't
>     work because the component is designed more around maintaining a pool
>     of pages, rather than topping up a continually drained cache.
> 
> So don't do these as they all had various problems. Instead just create a
> small simple data structure to use for handing a pre-allocated list of
> pages between KVM and arch/x86 code. Model this on KVM's existing MMU
> memory caches.
> 
> Add a tdx_pamt_cache arg to tdx_pamt_get() so it can draw pages from a
> cache when needed. Not all Dynamic PAMT page installations will happen
> under spinlock, for example TD and vCPU scoped control pages. So have
> tdx_pamt_get() maintain the existing behavior of allocating from the page
> allocator when NULL is passed for the struct tdx_pamt_cache arg. This
> prevents excess allocations for cases where it can be avoided.
> 
> Export the new helpers for KVM.
> 
> AI was used under supervision to review code and workshop logs.
> 
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Link: https://lore.kernel.org/kvm/aXENNKjAKTM9UJNH@google.com/
> Link: https://lore.kernel.org/kvm/20260129011517.3545883-20-seanjc@google.com/
> Link: https://lore.kernel.org/kvm/aYW5CbUvZrLogsWF@yzhao56-desk.sh.intel.com/
> ---

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
