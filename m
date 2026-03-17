Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0758E38F658
	for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735989; cv=none; b=DXtYcbmQJAq2txfrvkw7xCuFCEl16qG2P3beGoob/aAY1+JNyMZfymq0GelNKKyVCPNvQJvoRjeqQTvV1HopvdFGAlOBMdi2omGwwbSl4gDrG+oyA+3CIoLuqlMenIu/L8Hd7N6qqarSZQhrNU/67l9bqtXP9ZxOe/yH89AdE3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735989; c=relaxed/simple;
	bh=0irRjcsn/6mH9qY9dx/psDtVRnHKTVG73clSDMUFvDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7zB18AqD8XLrMG35G6oSRP0PIzFH1mbaFeUE+K+IXFarsbWQs0oDzK7S2Qnzb62ivZs4Kce+nxXcD+uPxr+n4HrHwzfD7d05xn9R2b+BH86es0ZcJsTwuCBOZ2dO50HJLuZwURNuHMUNrMcSAv7+eIvBIYLbVD1n8WLY/MphDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ZevpSKfk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ZevpSKfk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48541edecf9so59315875e9.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773735985; x=1774340785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xf2CUvi8YSfRB4MbEru11u5aBtMS7TuUP2oF3ZpZ3ic=;
        b=ZevpSKfkbSucEkhAPiJDMMKQUzlzzlzNm/BQgkQhVUGTf50uVNk9Bo2+kTCHhULfdn
         yzUxxlqDwHUwNKVe1VDSZCCctORLkrXzSAlVuWfKBSyJAAgw1Sy+hZXqKt9Z1sb+MnLi
         R2/Caj/miQ7jPbEnur4Zn+k4Ck1mhWuP0GdfiY+pNGUJA/OVZH2TsHJ9HpBuEhjScZNJ
         wbmQrvK1Ualt8bb+HfCfEifGX3rGiHjDzTZnzwuahO5Kq6QS26vgAgQZmViZhcqRoLkl
         Uf8NUNdwX68vqBflCggnvQ+u9TXWLEk02WrKEFxY1ZCpwqa80h4S10Jqg2wn6MpKx4Rd
         yPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735985; x=1774340785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xf2CUvi8YSfRB4MbEru11u5aBtMS7TuUP2oF3ZpZ3ic=;
        b=pfsdgXGpfSWJyVxlyDvyfn2aje6l63bM+ZtLLvTSMDPcnwHBvnPwOM7a0IKfbbR5iC
         GDiTq+E2u6mj0IKOCFA1XxerldB87vyLtVOe+OBzntBXhNvOgdRw/pzOR7QkE6OnjHMO
         KuPZS/yVBf/EkyaSRfjel6IHUX5oH5M3P3IAqqsxhZTQrMjUm4fsWhEbBu8xXZf4uEye
         jFMC4aLiZ4YsQ3xLBxQZCFlRGrYo+Cfo4hh6opc8QQDhx8+5wzqTUM7GHyojsDV4w1Ds
         aqfBgH4bsw9N5LUTqEx35ykTuuDzVR28cxcrLQ0pJ4S0sLW4MTT1/rgsi1uaEgQHL5nl
         D9lw==
X-Forwarded-Encrypted: i=1; AJvYcCXpvct64HarmASGZ3rE778cG9gPU7wxHJxsIr1KcCGOsLl1RMXdC71fDyo7ArXkR82QyAiPxX5pYWnW@lists.linux.dev
X-Gm-Message-State: AOJu0YywIt0k0KryQbho7ZWcshYzxtDzh0liqZKh1BnEYc2Rrf7jw3/G
	NryASvpMRzrOeUit2x41V4wufsL4qLLKm/BjcqrLrf2g+n2LuC29zIRUZ8YZl54JBpE=
X-Gm-Gg: ATEYQzxeZ3LSPHYdMxTRlBv7CGA+VXHqPecEvENQMFQZLZEH9xf1SnlPNZlsurTDu0v
	UNYcZt+y6tpLun5TdpZwpX46ZvAtpYOdZ/i/roQ2UDzYm3PDKGxQEKkO+1JGwotBPXTmsuqJJI2
	xG/dbvxqP32BSQHVbuMYKcyjC2g3uuh3WA51EI5H9pZtmD5sWu1nX9WiNJo2mA1HGfm/7I8HNDj
	EbWNbnYPNcuP2Z6suRWuk0mqL+UYQdxGZXNRBJ6h+2//tdZRgI/k3Nfh5HBMxkRiiWJh4Z5YsDg
	0KecUo4OIK6zUmFHl3AMgyJR8NiGuOJzkFcHxPWN8Kqb1LP15nKnh1aHwAU2gGSkkellMujZZ0e
	omZmeyXYrD72TfmUWBXl5BFVhepj/tRnS5ADzsTitzYkXZ84TgiahEmNOJWAoyaw22SyndmfUdd
	qwGthW+b5Y4E6Ul3MWH8spLvVt2yUz4jd4QImshZeXedM=
X-Received: by 2002:a05:600c:c8f:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-48556710c02mr263331735e9.33.1773735985061;
        Tue, 17 Mar 2026 01:26:25 -0700 (PDT)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:81f8:c391:4972:647b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea97e8esm52842845e9.5.2026.03.17.01.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:26:24 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:26:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, jgg@ziepe.ca, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for
 pre-decrypted memory
Message-ID: <lufy3ppgiy7637iravgzabajj67chmqvg22qc3fd2yqe2p33ws@b54vibhehth2>
References: <20260316125857.617836-1-jiri@resnulli.us>
 <20260316125857.617836-2-jiri@resnulli.us>
 <15fcfa5e-c4b9-4b56-8f84-20dd5f66d643@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15fcfa5e-c4b9-4b56-8f84-20dd5f66d643@arm.com>

Mon, Mar 16, 2026 at 07:25:55PM +0100, robin.murphy@arm.com wrote:
>On 2026-03-16 12:58 pm, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>> decrypted memory on behalf of the device.
>> 
>> When a caller has already arranged for the memory to be decrypted
>> via set_memory_decrypted(), the DMA API needs to know so it can map
>> directly using the unencrypted physical address rather than bounce
>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
>> caller knows what kind of memory it has and must inform the DMA API
>> for it to work correctly.
>
>Echoing Jason's point, if the intent of this is to indicate shared memory,
>please call it DMA_ATTR_CC_SHARED. Yes, some of the existing APIs are badly
>named because they conflated intent with implementation details; that is no
>reason to keep wilfully making the same mistake.
>
>At least with Arm CCA, the architecture enforces *confidentiality* pretty
>much orthogonally to encryption - if your threat model excludes physical
>attacks against DRAM, you can still have Realms isolated from each other (and
>of course other execution states) without even implementing the memory
>encryption feature; conversely if you do have it, then even all the
>shared/host memory may still be physically encrypted, it just has its own
>context (key) distinct from the Realm ones. Similarly, while it's not a
>"true" CoCo environment, pKVM has a similar notion of shared vs. private
>which can benefit from piggy-backing off much of the CoCo infrastructure in
>places like the DMA layer, but has nothing whatsoever to do with actual
>encryption.
>
>Furthermore, "shared" is just shorter and more readable, even before I invoke
>the previous discussion of why it should be "unencrypted" rather than
>"decrypted" anyway ;)

Okay, fair points. I'll rename it to shared for "v5". Thanks!


>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v3->v4:
>> - added some sanity checks to dma_map_phys and dma_unmap_phys
>> - enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>   include/linux/dma-mapping.h | 10 ++++++++++
>>   include/trace/events/dma.h  |  3 ++-
>>   kernel/dma/direct.h         | 14 +++++++++++---
>>   kernel/dma/mapping.c        | 13 +++++++++++--
>>   4 files changed, 34 insertions(+), 6 deletions(-)
>> 
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 29973baa0581..476964d2b22f 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -85,6 +85,16 @@
>>    * a cacheline must have this attribute for this to be considered safe.
>>    */
>>   #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
>> +/*
>> + * DMA_ATTR_CC_DECRYPTED: Indicates the DMA mapping is decrypted (shared) for
>> + * confidential computing guests. For normal system memory the caller must have
>> + * called set_memory_decrypted(), and pgprot_decrypted must be used when
>> + * creating CPU PTEs for the mapping. The same decrypted semantic may be passed
>> + * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
>
>That being "the vIOMMU" that you said doesn't exist, and which is explicitly
>not supported?...

Yeah, I wanted to draw the full picture. I can put a not like "(when it
is going to be introduced)" or something like that to be clear.


>
>> + * DMA_ATTR_MMIO to indicate decrypted MMIO. Unless DMA_ATTR_MMIO is provided
>> + * a struct page is required.
>> + */
>> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>>   /*
>>    * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>> index 33e99e792f1a..b8082d5177c4 100644
>> --- a/include/trace/events/dma.h
>> +++ b/include/trace/events/dma.h
>> @@ -32,7 +32,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>   		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
>>   		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
>>   		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>> -		{ DMA_ATTR_MMIO, "MMIO" })
>> +		{ DMA_ATTR_MMIO, "MMIO" }, \
>> +		{ DMA_ATTR_CC_DECRYPTED, "CC_DECRYPTED" })
>>   DECLARE_EVENT_CLASS(dma_map,
>>   	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
>> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
>> index e89f175e9c2d..c047a9d0fda3 100644
>> --- a/kernel/dma/direct.h
>> +++ b/kernel/dma/direct.h
>> @@ -84,16 +84,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>>   	dma_addr_t dma_addr;
>>   	if (is_swiotlb_force_bounce(dev)) {
>> -		if (attrs & DMA_ATTR_MMIO)
>> -			return DMA_MAPPING_ERROR;
>> +		if (!(attrs & DMA_ATTR_CC_DECRYPTED)) {
>> +			if (attrs & DMA_ATTR_MMIO)
>> +				return DMA_MAPPING_ERROR;
>> -		return swiotlb_map(dev, phys, size, dir, attrs);
>> +			return swiotlb_map(dev, phys, size, dir, attrs);
>> +		}
>> +	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
>> +		return DMA_MAPPING_ERROR;
>>   	}
>>   	if (attrs & DMA_ATTR_MMIO) {
>>   		dma_addr = phys;
>>   		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>   			goto err_overflow;
>> +	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
>> +		dma_addr = phys_to_dma_unencrypted(dev, phys);
>> +		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>> +			goto err_overflow;
>>   	} else {
>>   		dma_addr = phys_to_dma(dev, phys);
>>   		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
>> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
>> index 3928a509c44c..abb0c88b188b 100644
>> --- a/kernel/dma/mapping.c
>> +++ b/kernel/dma/mapping.c
>> @@ -157,6 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>>   {
>>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>>   	bool is_mmio = attrs & DMA_ATTR_MMIO;
>> +	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
>>   	dma_addr_t addr = DMA_MAPPING_ERROR;
>>   	BUG_ON(!valid_dma_direction(dir));
>> @@ -165,8 +166,11 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>>   		return DMA_MAPPING_ERROR;
>>   	if (dma_map_direct(dev, ops) ||
>> -	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
>> +	    (!is_mmio && !is_cc_decrypted &&
>> +	     arch_dma_map_phys_direct(dev, phys + size)))
>>   		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
>> +	else if (is_cc_decrypted)
>> +		return DMA_MAPPING_ERROR;
>>   	else if (use_dma_iommu(dev))
>
>...although, why *shouldn't* this be allowed with a vIOMMU? (Especially given
>that a vIOMMU for untrusted devices can be emulated by the host VMM without
>the CoCo hypervisor having to care at all - again, at least on Arm and other
>architectures where IOMMUs are regular driver model devices)

Well, when iommu path is able to consume the attr, this restriction
should be lifted. This is basically a sanity check for the
dma_map_phys() caller.


>
>>   		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
>>   	else if (ops->map_phys)
>
>Or indeed any other non-direct ops? Obviously all the legacy architectures
>like Alpha are never going to see this or care, but I could imagine Xen and
>possibly PowerPC might.

Same here.


>
>Thanks,
>Robin.
>
>> @@ -203,11 +207,16 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
>>   {
>>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>>   	bool is_mmio = attrs & DMA_ATTR_MMIO;
>> +	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
>>   	BUG_ON(!valid_dma_direction(dir));
>> +
>>   	if (dma_map_direct(dev, ops) ||
>> -	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
>> +	    (!is_mmio && !is_cc_decrypted &&
>> +	     arch_dma_unmap_phys_direct(dev, addr + size)))
>>   		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
>> +	else if (is_cc_decrypted)
>> +		return;
>>   	else if (use_dma_iommu(dev))
>>   		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
>>   	else if (ops->unmap_phys)
>
