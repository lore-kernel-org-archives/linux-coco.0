Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1C47013A
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707167; cv=none; b=qt3jOqhy9IZoF4fJflnUJsRsAi5/12Wh9nL0Ntv0OlGzh5LsUTFqIUsD0nOjhYxtaSh6i+Z77I+nrVLQlzGurEqgbM4dbHHL0l2wR+wYPwtvYH7513fU9+5IA4GkWAXq86ju4W4X35NmY6xmRsJFGYe9rJzXa6K160DL5nS3fBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707167; c=relaxed/simple;
	bh=L1ZlHTw+wfSWt/JfEcI4TxNzRMBbmHZ7QGPCEnXC6/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAWjJBIM5KYd4+6/xuqocvsn0QYvSNruVyDJZ5c1JPgGPGk5LrjnHxhO1WXhnn7w43B/9FPG1tiLClXx3mZVanwE+Rk7rRgQjrU0giGZG0Agyx2ioSUExn/4t1uh5tiRjxihsvhDHxrA77GCT7hYZ56kj4IGs6KBqj7I4kRBmak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BEEoH2gh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BEEoH2gh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so25168085e9.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784707164; x=1785311964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iq0O2sSgzi6ReiR/HqVVmK6buuu0zFra1jDt9JKJi0A=;
        b=BEEoH2ghiIMHf8BwMlux87pJh/Xlz6piDWyyYGH5Qd5HgoNu1b+EiJuVxofU3ayZsZ
         F4MpHhkLUgMUNJrslXgMfDXaextLD+ykHLqBhF5KesO3pu+l7Mjln487J42A8G0fXcSq
         9KeI1ZGz3RpT4wZHFYcjcVTlBPRtPcqS0kZOrGfQkIMdfS5KOJdZNR5iZgCUtjOnhdYv
         m3a+scZUDrXcGwboPfhIhR4yEOEEzNpvtrtdnM3PNBnk1ELBM3+dhrjlfQVs1RZSqJFM
         auLUMwft7kiEXu+1OSvFmpRxCoIAptx+dL93YEPVzecOnMEYTZw+nLouRTLG6n6u77FP
         TNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707164; x=1785311964;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iq0O2sSgzi6ReiR/HqVVmK6buuu0zFra1jDt9JKJi0A=;
        b=bvmB9dLV9exCb/l23+6ba+r3BF0QY8oaAjLwE9GLS/totvfsXjrKIeZnRYgk4UHLAg
         GKt1taxI06miXLOQd8U7pnlvYmvj9W3hLR7qnS0GrtEh0Bz5fpI3fLjEIE71z6kGfpAw
         XzqWlfH6hRJXbton1ATDWK8XuXmfmF7saH0JE0xuXdGnJ3Fs7gJY9X/YbaTTPSxMSiIZ
         R2kDBKaO91anYVcKauSm487xsMrmlM5QIynAcxduiZIsb7ToGZXtr9r7hR+cBwWMe1mN
         /fNnrHiHJ1tqHXRZ1MKRoXjJntx2tSD0es7d2tboI8fXFVG4SZOPpsY81b605KzQ76kO
         9O9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp5mpc8pXVW6sTmgVIdrBuCL5tFqkR+io4nmjOeO4KaWBwTy8HKgdP9y+awZ2fxnAP4apR5WuFT8z/L@lists.linux.dev
X-Gm-Message-State: AOJu0YzV+cZLobvRJ+ZvgtssZeRP6QB9scORDPDEfezs8Ab+PsZ1pnvw
	+SwZPXkmKYDhmMCzL+GfG98+rAwfeYTJfraZqCPD0hcNo2WJW9HIm1K/C0RPL+8JoZI=
X-Gm-Gg: AR+sD13U6PY+2iFUnDOZ+exkDDwX5e6pHYqVnWeWAIh6s/ECac/xIw9K1PbZURBBUUb
	iHuddyC8i0/sOyFInwgd9dC8IhhGcuPBGS8BhmQ4mOBKr3XOLhyyK1IWxuMOWDaqb1wXvFPzXVU
	VZxEEZGM8mgRSlQ4G2jhhoKJnZEQc25eZA6POpsER5wQaIxoyMzRYiey96K6QEcp5KBEi5PCUno
	lMP6qspcEqPjCbdJpIkS1MMYZIldV5bKLMnLjZQaV2Qg+p6i3sHUBQwyiQXsudeRO3+TVJnqnrE
	HAX/jZ8ZZyEflmgm7LRAtZJSm42lADUNCR47Dhh8il0Bts+uPuizgPnJdE/SJTHkMPE6I55duet
	GukRgCRksg06GB8znC5rPhwP7VAi8PSaDwMa+y9PSVeYReCIzu13r0rMirAbYnZL+Pf0o5K2LSE
	i532MFK4qEaFBtkZc=
X-Received: by 2002:a05:600c:8010:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4956a519015mr28908465e9.16.1784707163859;
        Wed, 22 Jul 2026 00:59:23 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a6354a3sm79090575e9.10.2026.07.22.00.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:59:23 -0700 (PDT)
Message-ID: <9c7c170a-6438-454c-b96e-24aae0c27c9a@suse.com>
Date: Wed, 22 Jul 2026 10:59:21 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org,
 chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com,
 tony.lindgren@linux.intel.com, binbin.wu@intel.com
Cc: Binbin Wu <binbin.wu@linux.intel.com>
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/18/26 04:44, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Use control page helpers for allocating and freeing TD control structures,
> such that these operations can work for Dynamic PAMT.
> 
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installed
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
> 
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
> 
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around these
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
> 
> No functional change intended when Dynamic PAMT is not in use.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com> 

Reviewed-by: Nikolay Borisov < nik.borisov@suse.com>
