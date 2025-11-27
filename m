Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF94332ED6
	for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259899; cv=none; b=pxHRv1SCEi/CmC7Sc9e39bUGllAziWAjcPgCnmO0X8kLFTzFFkwvPgX8tZrw2ATk4mQr2gbFKhf3MJBgyVU0Q29+5Oo6wauIolXD5//aDbkmwpgs3NV/Z+bx7edQvAEgnw7FWZOtXu8MKq547+dVGQf8xJBZNDKXU5ztWqg2o2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259899; c=relaxed/simple;
	bh=MJ4rqQgau14A2GNiwCzZwSFFLHe6P5CDTsAJ0/FXis0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A028cc5jUmrEQf0nP9r10u+/YTuLmZJ5HgrJ9KFqv9ecDomWBl2c+/NwtOO6AkfkD/UhvLPRWYKnKUmtzEfy6+Wo10zZm1/9hDMhR7eiFa8HZeavkQNegBNOSOCaKv3ZxZyGtLjvp62hAkHJz50FTakoh9WSKO0bH6l7dVySoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QHtSA4Sd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QHtSA4Sd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7697e8b01aso206037266b.2
        for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 08:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764259895; x=1764864695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzemBJW1osQalkO+T8GZ13cKlH8q5XyKXblLIjbauF4=;
        b=QHtSA4SdrfsCeOU+wiIYCCjlklarNqg/goIURicLpbT/MVjPIXToHUrpt+QA9vQbBi
         PUSWO6GUOeSO3cg2vljvrxCaX5F/HJPbCSBF8QFBukwmeo7WdcE3HaPOpg5q9mI0BuY1
         OIg+R+ZKS1o4dGZz1psW0KMMmhSQ15q839tOUT3N09yDVc1c5w9Cx1rGxeG+P98zoTIc
         S+dvtXn5mHhga1xl9rbGZJAtPiluD/WqIefdPpxX+17Z//b+jGSP6PZa4/7vmerouk/Z
         wgc3hdACtaoY5OI7pk4U+wyqRIP3MbwRW4nBoFI0TYYqXfWK7r5aENIJFwQwFXM8hy5W
         JmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259895; x=1764864695;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzemBJW1osQalkO+T8GZ13cKlH8q5XyKXblLIjbauF4=;
        b=b2YaUF8dbI2NhvxdRNV8bUibHKEUxup+Xj6n0i00fBqYic8HzS9Ycru8qLANWot/Vg
         cnetYNa4wN2KH2rJE8sg9WTQegfYClylxOKJgdpAwug5dqHbq+wlM6Sya46fwJW5NaWn
         hLl7finjqvKVHkXQEa1hpKuesvTLyqWvsHaUj3cWmFWqv4OxruI+PsVja2MiN7ISYouD
         fAt3G0gsEKKBSF9wDh5WlGWgJub267HP3fBSdhc88H5HIU+jehoVSgemJTkwsffyDZAx
         euO/lJRW4v1J+vdZz4+E0UdIDCzXIszsoEGdasfVORn8bBhnRGlNLaBnx/oBURTIhiEJ
         cvGw==
X-Forwarded-Encrypted: i=1; AJvYcCVSV5DO/b68iaJiAwHSKBWNaa1H1QM8FNXtqfjA7yV1j9W0iS8/WDbYlccO2r1qjEHdsUDEJn8rlBRd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2eV6288HbUHMHZlQ2//3Hn0a9/3jhRKlg7LczERl+gwqSB5I8
	3qr2hjh/HwXr3JED/8qs4YjtZlIpdLBb0MtGpJrnGEsVxTf6gcMZS1csEDduJ5abBGE=
X-Gm-Gg: ASbGncvi5LcXbwouQNptxECj4ogfEqtWZSMwTmxZ1k5nrDw1JLFHJ+iI9LXTnSgXVpB
	Yrwr0ZMqOjZHKSNYIBKFQ/OkpYPY2fNDF5anTnvnRUorGpkRfgEnypoGv0GrusRN4fQYPBfLAzl
	dLN9nl9nwOX2ZsKOhWX6ocHPKtdIr1OUszVrc5iKcjXxGF5EEQHOHf1+QE8oc/pxCALaHicDnyp
	xPHV/UlsTS7b8Jd2b3uKQk1KbrbeOT7OgBk/qzPb32WUjSGoBP8AGxdJnWLFmW7Esc66ff5VyIg
	v2yfqzdSi5ixdcdjfx0f/VGXcsKLk+zb2QzMUItxzq2xcvYwtf7zhPN7nFxJPeWE2KDr2H4Bm74
	TjMWEepac3bBBmB46bsnLmbGbkAuw5ZAnnHZ0zLskpTBKCyy3rAAgpV9SMMh1iws4MKTE6zvwVS
	GHw+TJu24S17t1A2EucJU7zMTE/ooe0nOoM891
X-Google-Smtp-Source: AGHT+IFVKIc00EFllzvfwR4nUxEDZwZVD0eJ0W3g0s9RFWiaJQKHCrRGU6lSsCmQ8EAeI4RFacx1xQ==
X-Received: by 2002:a17:907:97d6:b0:b73:8f33:eed3 with SMTP id a640c23a62f3a-b76715afc72mr2708779866b.26.1764259894746;
        Thu, 27 Nov 2025 08:11:34 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.216.236])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm197788266b.29.2025.11.27.08.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:11:34 -0800 (PST)
Message-ID: <dde56556-7611-4adf-9015-5bdf1a016786@suse.com>
Date: Thu, 27 Nov 2025 18:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] x86/virt/tdx: Add tdx_alloc/free_page() helpers
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 chao.gao@intel.com, dave.hansen@intel.com, isaku.yamahata@intel.com,
 kai.huang@intel.com, kas@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@linutronix.de,
 vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com,
 xiaoyao.li@intel.com, binbin.wu@intel.com
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-8-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20251121005125.417831-8-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21.11.25 г. 2:51 ч., Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Add helpers to use when allocating or preparing pages that need DPAMT
> backing. Make them handle races internally for the case of multiple
> callers trying operate on the same 2MB range simultaneously.
> 
> While the TDX initialization code in arch/x86 uses pages with 2MB
> alignment, KVM will need to hand 4KB pages for it to use. Under DPAMT,
> these pages will need DPAMT backing 4KB backing.
> 
> Add tdx_alloc_page() and tdx_free_page() to handle both page allocation
> and DPAMT installation. Make them behave like normal alloc/free functions
> where allocation can fail in the case of no memory, but free (with any
> necessary DPAMT release) always succeeds. Do this so they can support the
> existing TDX flows that require cleanups to succeed. Also create
> tdx_pamt_put()/tdx_pamt_get() to handle installing DPAMT 4KB backing for
> pages that are already allocated (such as external page tables, or S-EPT
> pages).
> 
> Allocate the pages as GFP_KERNEL_ACCOUNT based on that the allocations
> will be easily user triggerable.
> 
> Since the source of these pages is the page allocator, multiple TDs could
> each get 4KB pages that are covered by the same 2MB range. When this
> happens only one page pair needs to be installed to cover the 2MB range.
> Similarly, when one page is freed, the DPAMT backing cannot be freed until
> all TDX pages in the range are no longer in use. Have the helpers manage
> these races internally.
> 
> So the requirements are that:
> 
> 1. Free path cannot fail (i.e. no TDX module BUSY errors).
> 2. Allocation paths need to handle finding that DPAMT backing is already
>     installed, and only return an error in the case of no memory, not in the
>     case of losing races with other’s trying to operate on the same DPAMT
>     range.
> 3. Free paths cannot fail, and also need to clean up the DPAMT backing
>     when the last page in the 2MB range is no longer needed by TDX.
> 
> Previous changes allocated refcounts to be used to track how many 4KB
> pages are in use by TDX for each 2MB region. So update those inside the
> helpers and use them to decide when to actually install the DPAMT backing
> pages.
> 
> tdx_pamt_put() needs to guarantee the DPAMT is installed before returning
> so that racing threads don’t tell the TDX module to operate on the page
> before it’s installed. Take a lock while adjusting the refcount and doing
> the actual TDH.PHYMEM.PAMT.ADD/REMOVE to make sure these happen
> atomically. The lock is heavyweight, but will be optimized in future
> changes. Just do the simple solution before any complex improvements.
> 
> TDH.PHYMEM.PAMT.ADD/REMOVE take exclusive locks at the granularity each
> 2MB range. A simultaneous attempt to operate on the same 2MB region would
> result in a BUSY error code returned from the SEAMCALL. Since the
> invocation of SEAMCALLs are behind a lock, this won’t conflict.
> 
> Besides the contention between TDH.PHYMEM.PAMT.ADD/REMOVE, many other
> SEAMCALLs take the same 2MB granularity locks as shared. This means any
> attempt to operate on the page by the TDX module while simultaneously
> doing PAMT.ADD/REMOVE will result in a BUSY error. This should not happen,
> as the PAMT pages always has to be installed before giving the pages to
> the TDX module anyway.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [Add feedback, update log]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> v4:
>   - Update tdx_find_pamt_refcount() calls to pass PFN and rely on
>     internal PMD bucket calculations. Based on changes in previous patch.
>   - Pull calculation TDX DPAMT 2MB range arg into helper.
>   - Fix alloc_pamt_array() doesn't zero array on allocation failure (Yan)
>   - Move "prealloc" comment to future patch. (Kai)
>   - Use union for dpamt page array. (Dave)
>   - Use sizeof(*args_array) everywhere instead of sizeof(u64) in some
>     places. (Dave)
>   - Fix refcount inc/dec cases. (Xiaoyao)
>   - Rearrange error handling in tdx_pamt_get()/tdx_pamt_put() to remove
>     some indented lines.
>   - Make alloc_pamt_array() use GFP_KERNEL_ACCOUNT like the pre-fault
>     path does later.
> 
> v3:
>   - Fix hard to follow iteration over struct members.
>   - Simplify the code by removing the intermediate lists of pages.
>   - Clear PAMT pages before freeing. (Adrian)
>   - Rename tdx_nr_pamt_pages(). (Dave)
>   - Add comments some comments, but thought the simpler code needed
>     less. So not as much as seem to be requested. (Dave)
>   - Fix asymmetry in which level of the add/remove helpers global lock is
>     held.
>   - Split out optimization.
>   - Write log.
>   - Flatten call hierarchies and adjust errors accordingly.
> ---
>   arch/x86/include/asm/shared/tdx.h |   7 +
>   arch/x86/include/asm/tdx.h        |   8 +-
>   arch/x86/virt/vmx/tdx/tdx.c       | 258 ++++++++++++++++++++++++++++++
>   arch/x86/virt/vmx/tdx/tdx.h       |   2 +
>   4 files changed, 274 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index 6a1646fc2b2f..cc2f251cb791 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -145,6 +145,13 @@ struct tdx_module_args {
>   	u64 rsi;
>   };
>   
> +struct tdx_module_array_args {
> +	union {
> +		struct tdx_module_args args;
> +		u64 args_array[sizeof(struct tdx_module_args) / sizeof(u64)];
> +	};
> +};
> +
>   /* Used to communicate with the TDX module */
>   u64 __tdcall(u64 fn, struct tdx_module_args *args);
>   u64 __tdcall_ret(u64 fn, struct tdx_module_args *args);
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index cf51ccd16194..914213123d94 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -135,11 +135,17 @@ static inline bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
>   	return false; /* To be enabled when kernel is ready */
>   }
>   
> +void tdx_quirk_reset_page(struct page *page);
> +
>   int tdx_guest_keyid_alloc(void);
>   u32 tdx_get_nr_guest_keyids(void);
>   void tdx_guest_keyid_free(unsigned int keyid);
>   
> -void tdx_quirk_reset_page(struct page *page);
> +int tdx_pamt_get(struct page *page);
> +void tdx_pamt_put(struct page *page);
> +
> +struct page *tdx_alloc_page(void);
> +void tdx_free_page(struct page *page);
>   
>   struct tdx_td {
>   	/* TD root structure: */
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index edf9182ed86d..745b308785d6 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -2009,6 +2009,264 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
>   }
>   EXPORT_SYMBOL_GPL(tdh_phymem_page_wbinvd_hkid);
>   
> +/* Number PAMT pages to be provided to TDX module per 2M region of PA */
> +static int tdx_dpamt_entry_pages(void)
> +{
> +	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> +		return 0;
> +
> +	return tdx_sysinfo.tdmr.pamt_4k_entry_size * PTRS_PER_PTE / PAGE_SIZE;
> +}

Isn't this guaranteed to return 2 always as per the ABI? Can't the 
allocation of the 2 pages be moved closer to where it's used - in 
tdh_phymem_pamt_add which will simplify things a bit?

<snip>
