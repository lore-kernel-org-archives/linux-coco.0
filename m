Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48315330316
	for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764246564; cv=none; b=vCE1r+VY+nNBhACHcXSleIWbO2HdA9UjDJ+weFOL5adSINQJc3OidN6XkH6dlBAd2Koa/JapxEW3Du0pNmGsmWEQkWn4dJF0p9cI/559soUbxx6tKqfpHBoyyvp+NnHSH/OD94EAV6W8y4cLfzQJ4lERo0ed2d9e2LL6mW3KYos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764246564; c=relaxed/simple;
	bh=qZuhn1rLJjPc3t64A5Xpga/APOcya6KDzZXmZf4hOnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKZKZFtyRN8OTuPqDmSr+7Bh/v4q2oiXmILAsnX/9wgjOghcmyjnz9kUIppQQqmHdd/gC+lDNUn5JYxctLy6VGsYymbnrHZTxxbTOxQgogE3ukqPtTRzzuvVOp/qJ2aNELtZfMU7lyQvReXX4YDOSDPXgWBHmOz1ZjdTMaZEz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TQ3weJiP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TQ3weJiP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7355f6ef12so162864566b.3
        for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 04:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764246560; x=1764851360; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8zf1U+CqBxK/jTrmu59oEfBqh4L03oEpoMkaUk8LBVA=;
        b=TQ3weJiPyhfIj+5tARUNs8nhStjuninnIOr+QBAKrqT3z7cmRhpYf7PLQ9/Qa7MBTE
         mKNxrh6SIf2miithAn2tonMZjo5UJYsCv0ZvUj8P1qwhsgA5uWE2/JpMkbbsC9uC4nys
         w9m3gOEqp5sD3xEj5/0tlawwzMuYLWma4pDVcseRB3lyzoUuDJdHPdH6GcG39BWIKX8i
         s/hz0C2Thwk8FgMPihC6xTCxSHFbPaEhpPxaqoJTY/m3Pnj2EJq6Ca9ReJLZDPQDeDta
         HBs0/EjANrkviH0XNaLsa2oJdI3A3QAqL7/PFbllq0OLvVHKswf0KMMgPWpAJcBMtCpG
         gQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246560; x=1764851360;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zf1U+CqBxK/jTrmu59oEfBqh4L03oEpoMkaUk8LBVA=;
        b=jaSZAn3u4A8YU2TAr8ZPTd22bVMCj8XGB4fF9dKiW55iyF5dQ8iuq+FeNcJJ9yRpRj
         ZzQtITOhYZAO7HgStgEM9Tya9/gAS81fsaMFvwWZ75LuLKSoM105GmJh66p+LMPsYjil
         593bF5TdIUi8g9C1UACQZw2KF5mlMwGXcbpX/bgrnqjKVx2+1r81qKIu7hQyNnDrykHh
         lSXrAkGjoLjg532TXbKngWW4oUYPkVlfYlbte9RYTteyeV4G5QJMGRIA04BLMXBitY9A
         NzSWQq/C68bjVrkPjt1+3ZD/9H1rOX+6NLOtouJA+RAayGKs/vW1RgTdfxYiQuKgiOv8
         4LGA==
X-Forwarded-Encrypted: i=1; AJvYcCWICpgEpAscMeZOaS5Ii+/wndqY6ZF6w28Bn76NYEkVoQOFRNSoP0deDn7VOV7Hl1EkokAbkU1bvxli@lists.linux.dev
X-Gm-Message-State: AOJu0YwYjSqUTjSqkdRSG+57r7lL9qYQ7tyukhdp+sxYFh+g+bk+4ut7
	BJLudBwmAcKBrBWgDvJCkUyBrBWpIWM55xyHQtHho8Kv25OTYz/UZzZskV9Dp+Ume1w=
X-Gm-Gg: ASbGncuUQ5s4GgRQSI6QkaFyFn2CI3saHmFLtvJC0smfhm9m8zl0zMmj+JkqEt89juJ
	K0X3x66APuenbaTPfozM4i3YrrQckbzjetKhqK5hOv1UBFlax6k6FeCHLhFx0P3XfHcbVjXrL51
	OOwo7dsWl+QkzVVuL0Fn9NMMOcp1jkdi1gs+Et6qo1q4qq0B42eSZqVne+VRckn7k3hTPjcb18o
	fE//nX+x3s95ntgQ1hdH8+5WrcNwus9yMB4scKgl/e84VSOJ0ltIqPj4F92r+/Nir0SGfJ88ZgR
	e70TNN58VU3WV57Xdnn23ZHiMvGXmb8YhX6ZtQXpqkDpmylV+9vz4eVvgFqpmBRPwmZGLl5jymF
	zx7W+fRb7q3pFTKTa4Y5Bg7UxWps+r2xegzZn2YK4ypZdeloVA3YYtxcd5p69qPZ94PjjSx18mn
	t/l9DJlzAqnBSWY8ighlMRP1qzUi4oYPSy34lj
X-Google-Smtp-Source: AGHT+IE4jTBvIXdCMwVRDER7mBrPFQptoe7cfyGJxb6sfHfAWsuExMvUsKNASoizJRNZNz7UDJg/TQ==
X-Received: by 2002:a17:907:97cc:b0:b73:9e51:7f with SMTP id a640c23a62f3a-b7671565480mr2374818566b.22.1764246560361;
        Thu, 27 Nov 2025 04:29:20 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.216.236])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d31sm158025866b.9.2025.11.27.04.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:29:19 -0800 (PST)
Message-ID: <21115e18-c68d-492d-9fd4-400452bd64c7@suse.com>
Date: Thu, 27 Nov 2025 14:29:18 +0200
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
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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

That paragraph is rather hard to parse. KVM will need to hand 4k pages 
to whom? The tdx init code? Also the last sentence with the 2 "backing" 
words is hard to parse. Does it say that the 4k pages that KVM need to 
pass must be backed by DPAMT pages i.e like a chicken and egg problem?

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

<snip>


> +
> +/* Serializes adding/removing PAMT memory */
> +static DEFINE_SPINLOCK(pamt_lock);
> +
> +/* Bump PAMT refcount for the given page and allocate PAMT memory if needed */
> +int tdx_pamt_get(struct page *page)
> +{
> +	u64 pamt_pa_array[MAX_TDX_ARG_SIZE(rdx)];
> +	atomic_t *pamt_refcount;
> +	u64 tdx_status;
> +	int ret;
> +
> +	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> +		return 0;
> +
> +	ret = alloc_pamt_array(pamt_pa_array);
> +	if (ret)
> +		goto out_free;
> +
> +	pamt_refcount = tdx_find_pamt_refcount(page_to_pfn(page));
> +
> +	scoped_guard(spinlock, &pamt_lock) {
> +		/*
> +		 * If the pamt page is already added (i.e. refcount >= 1),
> +		 * then just increment the refcount.
> +		 */
> +		if (atomic_read(pamt_refcount)) {
> +			atomic_inc(pamt_refcount);
> +			goto out_free;
> +		}

Replace this pair of read/inc with a single call to atomic_inc_not_zero()

> +
> +		/* Try to add the pamt page and take the refcount 0->1. */
> +
> +		tdx_status = tdh_phymem_pamt_add(page, pamt_pa_array);
> +		if (!IS_TDX_SUCCESS(tdx_status)) {
> +			pr_err("TDH_PHYMEM_PAMT_ADD failed: %#llx\n", tdx_status);
> +			goto out_free;
> +		}
> +
> +		atomic_inc(pamt_refcount);
> +	}
> +
> +	return ret;
> +out_free:
> +	/*
> +	 * pamt_pa_array is populated or zeroed up to tdx_dpamt_entry_pages()
> +	 * above. free_pamt_array() can handle either case.
> +	 */
> +	free_pamt_array(pamt_pa_array);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tdx_pamt_get);
> +
> +/*
> + * Drop PAMT refcount for the given page and free PAMT memory if it is no
> + * longer needed.
> + */
> +void tdx_pamt_put(struct page *page)
> +{
> +	u64 pamt_pa_array[MAX_TDX_ARG_SIZE(rdx)];
> +	atomic_t *pamt_refcount;
> +	u64 tdx_status;
> +
> +	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> +		return;
> +
> +	pamt_refcount = tdx_find_pamt_refcount(page_to_pfn(page));
> +
> +	scoped_guard(spinlock, &pamt_lock) {
> +		/*
> +		 * If the there are more than 1 references on the pamt page,
> +		 * don't remove it yet. Just decrement the refcount.
> +		 */
> +		if (atomic_read(pamt_refcount) > 1) {
> +			atomic_dec(pamt_refcount);
> +			return;
> +		}

nit: Could be replaced with : atomic_add_unless(pamt_refcount, -1, 1);

Probably it would have been better to simply use atomic64_dec_and_test 
and if it returns true do the phymem_pamt_remove, but I suspect you 
can't do it because in case it fails you don't want to decrement the 
last refcount, though that could be remedied by an extra atomic_int in 
the failure path. I guess it might be worth simplifying since the extra 
inc will only be needed in exceptional cases (we don't expect failure ot 
be the usual path) and freeing is not a fast path.

> +
> +		/* Try to remove the pamt page and take the refcount 1->0. */
> +
> +		tdx_status = tdh_phymem_pamt_remove(page, pamt_pa_array);
> +		if (!IS_TDX_SUCCESS(tdx_status)) {
> +			pr_err("TDH_PHYMEM_PAMT_REMOVE failed: %#llx\n", tdx_status);
> +
> +			/*
> +			 * Don't free pamt_pa_array as it could hold garbage
> +			 * when tdh_phymem_pamt_remove() fails.
> +			 */
> +			return;
> +		}
> +
> +		atomic_dec(pamt_refcount);
> +	}
> +
> +	/*
> +	 * pamt_pa_array is populated up to tdx_dpamt_entry_pages() by the TDX
> +	 * module with pages, or remains zero inited. free_pamt_array() can
> +	 * handle either case. Just pass it unconditionally.
> +	 */
> +	free_pamt_array(pamt_pa_array);
> +}
> +EXPORT_SYMBOL_GPL(tdx_pamt_put);

<snip>
