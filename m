Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7A30E0DF
	for <linux-coco@lists.linux.dev>; Wed, 26 Nov 2025 03:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128419; cv=none; b=Rzfxpdk3UpHcDsYvAXWrahXoAI42pSHjZ/Q2LopwwBSjqfG98CZLtBkstbARnQ20UKPSkVgzpZjzz54MbhnQb08sTtBdtAP7Tkts/8JVvMqSIKng0FJR2w6YNaHpc6CQt97Z9c7qCF9flV2x5V9m0INOQw9btYs9vUnrExU2CZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128419; c=relaxed/simple;
	bh=iqMBiX/DmfD2KOEXJhdqHuzpwV6wNnt0XgEPDRSsiJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=au25HZAq3a1IMYGCM9piHKD9aDKQAf0bKOaNQFiIcsmEebVwOrvojsCJQi9FHarrYm8UnpfdAfvL9Dc3wUxsku+vRuSE4DjAWMConX3t6zrtv+pqMI9wO6Jn/HDfZztQP7ypaUYcBqTjS3Gy9qjUleV09IXIWIJ5H+lHO/CZiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AD8cydCL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AD8cydCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764128417; x=1795664417;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=iqMBiX/DmfD2KOEXJhdqHuzpwV6wNnt0XgEPDRSsiJA=;
  b=AD8cydCLdsvDhi1Hj+Am+8ZwrLQT6U0Y7Klry5yqVAC/q+r6FdkUBzok
   tQhddz2nLrJH8381RjLD5evOnaX649A7oaV5JjT4+X2+Abb0YSqjbhqN3
   S9Pys0KTmJKZVn6FcnW7kxmi6YSmypeMTgvX1ptP//t/RnKtMMBYehDCP
   +hbu0ysvc6ycXLyViW5x5Bu/+xVeEdLD2YPIpjbI7EVseGV8mRtAucJ4S
   jMLoqqAESw4dM3XTbSB4xCV9MozPc9IVzpB3xlW+o1LWPj1dGzX2Q7N5x
   kfH4HTJAgXRsINQ8zP1ucBpDNx+TtswhV7DGj69blyroBcYyPfEzIaXns
   g==;
X-CSE-ConnectionGUID: kB1/uSesQ3i2JUP3EkJFUA==
X-CSE-MsgGUID: awIjarYaRXKv5DQ18s9lrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70020329"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="70020329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 19:40:16 -0800
X-CSE-ConnectionGUID: 5Cva7xLWSUqTLtlhE/FMGA==
X-CSE-MsgGUID: vZ+8rnnVSC+PJF4vbEqcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="216171794"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 19:40:12 -0800
Message-ID: <7a6f5b4e-ad7b-4ad0-95fd-e1698f9b4e06@linux.intel.com>
Date: Wed, 26 Nov 2025 11:40:09 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] x86/virt/tdx: Add helpers to allow for
 pre-allocating pages
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-13-rick.p.edgecombe@intel.com>
Content-Language: en-US
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com,
 isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@linutronix.de, vannapurve@google.com,
 x86@kernel.org, yan.y.zhao@intel.com, xiaoyao.li@intel.com,
 binbin.wu@intel.com
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251121005125.417831-13-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/21/2025 8:51 AM, Rick Edgecombe wrote:
> In the KVM fault path page, tables and private pages need to be
"In the KVM fault path page, tables ..." should be
"In the KVM fault path, page tables ..."

> installed under a spin lock. This means that the operations around
> installing PAMT pages for them will not be able to allocate pages.
>
[...]
> @@ -141,7 +142,46 @@ int tdx_guest_keyid_alloc(void);
>   u32 tdx_get_nr_guest_keyids(void);
>   void tdx_guest_keyid_free(unsigned int keyid);
>   
> -int tdx_pamt_get(struct page *page);
> +int tdx_dpamt_entry_pages(void);
> +
> +/*
> + * Simple structure for pre-allocating Dynamic
> + * PAMT pages outside of locks.

It's not just for Dynamic PAMT pages, but also external page table pages.

> + */
> +struct tdx_prealloc {
> +	struct list_head page_list;
> +	int cnt;
> +};
> +
> +static inline struct page *get_tdx_prealloc_page(struct tdx_prealloc *prealloc)
> +{
> +	struct page *page;
> +
> +	page = list_first_entry_or_null(&prealloc->page_list, struct page, lru);
> +	if (page) {
> +		list_del(&page->lru);
> +		prealloc->cnt--;
> +	}
> +
> +	return page;
> +}
> +
> +static inline int topup_tdx_prealloc_page(struct tdx_prealloc *prealloc, unsigned int min_size)
> +{
> +	while (prealloc->cnt < min_size) {
> +		struct page *page = alloc_page(GFP_KERNEL_ACCOUNT);
> +
> +		if (!page)
> +			return -ENOMEM;
> +
> +		list_add(&page->lru, &prealloc->page_list);
> +		prealloc->cnt++;
> +	}
> +
> +	return 0;
> +}
> +
> +int tdx_pamt_get(struct page *page, struct tdx_prealloc *prealloc);
>   void tdx_pamt_put(struct page *page);
>   
>   struct page *tdx_alloc_page(void);
> @@ -219,6 +259,7 @@ static inline int tdx_enable(void)  { return -ENODEV; }
>   static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
>   static inline const char *tdx_dump_mce_info(struct mce *m) { return NULL; }
>   static inline const struct tdx_sys_info *tdx_get_sysinfo(void) { return NULL; }
> +static inline int tdx_dpamt_entry_pages(void) { return 0; }
>   #endif	/* CONFIG_INTEL_TDX_HOST */
>   
>   #ifdef CONFIG_KEXEC_CORE
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 260bb0e6eb44..61a058a8f159 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1644,23 +1644,34 @@ static int tdx_mem_page_add(struct kvm *kvm, gfn_t gfn, enum pg_level level,
>   
>   static void *tdx_alloc_external_fault_cache(struct kvm_vcpu *vcpu)
>   {
> -	struct vcpu_tdx *tdx = to_tdx(vcpu);
> +	struct page *page = get_tdx_prealloc_page(&to_tdx(vcpu)->prealloc);
>   
> -	return kvm_mmu_memory_cache_alloc(&tdx->mmu_external_spt_cache);
> +	if (WARN_ON_ONCE(!page))
> +		return (void *)__get_free_page(GFP_ATOMIC | __GFP_ACCOUNT);

kvm_mmu_memory_cache_alloc() calls BUG_ON() if the atomic allocation failed.
Do we want to follow?

> +
> +	return page_address(page);
>   }
>   
>   static int tdx_topup_external_fault_cache(struct kvm_vcpu *vcpu, unsigned int cnt)
>   {
> -	struct vcpu_tdx *tdx = to_tdx(vcpu);
> +	struct tdx_prealloc *prealloc = &to_tdx(vcpu)->prealloc;
> +	int min_fault_cache_size;
>   
> -	return kvm_mmu_topup_memory_cache(&tdx->mmu_external_spt_cache, cnt);
> +	/* External page tables */
> +	min_fault_cache_size = cnt;
> +	/* Dynamic PAMT pages (if enabled) */
> +	min_fault_cache_size += tdx_dpamt_entry_pages() * PT64_ROOT_MAX_LEVEL;

Is the value PT64_ROOT_MAX_LEVEL intended, since dynamic PAMT pages are only
needed for 4KB level?

> +
> +	return topup_tdx_prealloc_page(prealloc, min_fault_cache_size);
>   }
>   
>
[...]
