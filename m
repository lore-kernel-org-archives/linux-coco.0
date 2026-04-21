Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343BF3446CC
	for <linux-coco@lists.linux.dev>; Tue, 21 Apr 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772421; cv=none; b=FugEtd0Adxtu9vxYEngQz+JF0qOhDstiJpC1SRg8QSbezj3g9ewlkmbS/lSeu4fRVGDGScooiwqQOomoQDfHnPRgNbs224CmJymls/Vz+I6XFWlYs4QhbRHdABuBXvW4KNXBb+DGN9+psUEn2oHt4uekgC9L7erG9W7WnorgP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772421; c=relaxed/simple;
	bh=h9F+/Z/1756ADDD/jis6XaIQCCXn61Uy3k1fVDVehXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOvizLkEwUn/hqs1b34OgqMJmoIbhHa/aDWF371vk/Gwd2+l2YPooe5If5meIAGhSg1THRgAEu2FpIeOpg2ZMSmJ6n8uIiHAUBfBB+20dTpKbQvwQ7jd3y+3LTw5o57mH/u9orINbFmHKduZCEbYKuT/YGUuOy35bbNVk4GqHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=hcDnkGre; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="hcDnkGre"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so5227895e9.0
        for <linux-coco@lists.linux.dev>; Tue, 21 Apr 2026 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1776772415; x=1777377215; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qNffUEYXS7MvbYQg9u+kJhedqyXiIXCWwUXLFzfDV6w=;
        b=hcDnkGre4hYc0hlg+rfVZIesnqdmg5royG2YzOeZ3cwMBisB7XtqmTQrXUQ3h/yYfO
         AK9Ot2vsdZtZXJpnIYUSFOeGnNYw+WKRRBHAwzHrGGGElNhHDySWT29zDL0T+AXJbWvu
         0kHtbMleH41HBRkpynDMfrsFyRS3Wfe6sOjZ2Rh03pzvtUk6FEgkB+dNijwzRKMEp+t/
         xirLQBqrqRCmcdgjgjcltgUxGqbjlnFqGsWYnH1PWtY7PmQ1hxZkT/HGq2hCI5XRcgPz
         /q88tEgIARAkdYOunV8X3rYQpzInSGoweenHAJVjriMnr87SM+fXKmIEbJSQMkpa7a/M
         FjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776772415; x=1777377215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNffUEYXS7MvbYQg9u+kJhedqyXiIXCWwUXLFzfDV6w=;
        b=anIROFuk/ty/2/qOtiLSMTIT618MSXMO3v9Iff1HOBQSa2YNLx0z6nwZmRmUUHeReW
         hAOy5XT3INZ4gjFZUMsWeRj5NtaV1bH9TpZ4bgj7W7P87/6Ac4l5pP/3PxBCGJ6OB+Dj
         B9D6k5tFZrROJn8kYVDk/kRBSSvrnwkm/h4uC4GKZAlhxqIukAy7einuigxSB3M8yBY9
         qlj0lFSFHtGMOuEXAScybSlvNAHDbGpgm6a8aqfrA+9ExZawWXDGutgNeY2qG9i9mjE3
         yCnJnKYV/6x20DjwC7MHsFLTDabEiV3EUyQDTiLeoGVZGSBry/GcbWYx39xU3w8GaSA7
         Wdng==
X-Forwarded-Encrypted: i=1; AFNElJ9vqXPT9zqfkmYFLBS56ZZUyqK0fX+VSY8iinq+19ygz+MgwvvatJj22atCwt5ujsz7MLIHWeKdEKDd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+zLXSxN5PU6Ad8n3X8ExK/1zYPXuEt8AiT8dy9I/uNMBvcG5h
	VR6SG4MWEEDlZ5YSSU34gLh7QN0s1YhTYgSzeaY1Ifb8Lq0klkgTu8fvGtDqKRIIAEI=
X-Gm-Gg: AeBDiev04H24jAOqH8GKeih00K8EVMFtkUFc2UXKIcz0xOMS9saxkXjEl9XdQVbIGRp
	efpt1czLxVP8kcXH59DOUXZkC02K/cO09TZwaRqXrJP+U/+/4BnBrlu22de9FEyff0N+5QU+pfu
	fBBVqD01rHcrm10fH/GBmK1jebsihJGiLrow4qutZG5iHbMa9e3wboqPkpiT2vdeNx78oc9UX1I
	WUgVzQqoo5h1iblJMGMFsnmIOA2el4o+d9Tzg0eOGCPZJdjrQpcFWZ+EsJQEpg4/fwXdTiy/Kgw
	j6YaKgAKTQjp/8n/59N8dgZ5wypi5aee3jbv9uSM35Ydg22u5TkgFWDWQZdfwrxqqGT1tSxr/El
	To+lpGV9qZXdk81qZp5iBFaIQ/2suELCAW/w64gLf2saZmlNWUiIpnUr4wHs5D8xO2CEOUP4917
	NEf9FaeETZ8JfGi5AT+xMijtQU6hOw7KkJTMNQgWDkyf6yZHMycGr47Exr
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr196331065e9.26.1776772415404;
        Tue, 21 Apr 2026 04:53:35 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489e124f6c7sm34968855e9.29.2026.04.21.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:53:34 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:53:31 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5awly0d504.fsf@kernel.org>

Tue, Apr 21, 2026 at 11:42:03AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Mon, Apr 20, 2026 at 08:34:06AM +0200, aneesh.kumar@kernel.org wrote:
>>>Jiri Pirko <jiri@resnulli.us> writes:
>>>
>>>> From: Jiri Pirko <jiri@nvidia.com>
>>>>
>>>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>>>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>>>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>>>> shared memory on behalf of the device.
>>>>
>>>> When a caller has already arranged for the memory to be shared
>>>> via set_memory_decrypted(), the DMA API needs to know so it can map
>>>> directly using the unencrypted physical address rather than bounce
>>>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>>>> DMA_ATTR_CC_SHARED for this purpose. Like the MMIO case, only the
>>>> caller knows what kind of memory it has and must inform the DMA API
>>>> for it to work correctly.
>>>>
>>>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>>>> ---
>>>> v4->v5:
>>>> - rebased on top od dma-mapping-for-next
>>>> - s/decrypted/shared/
>>>> v3->v4:
>>>> - added some sanity checks to dma_map_phys and dma_unmap_phys
>>>> - enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
>>>> v1->v2:
>>>> - rebased on top of recent dma-mapping-fixes
>>>> ---
>>>>  include/linux/dma-mapping.h | 10 ++++++++++
>>>>  include/trace/events/dma.h  |  3 ++-
>>>>  kernel/dma/direct.h         | 14 +++++++++++---
>>>>  kernel/dma/mapping.c        | 13 +++++++++++--
>>>>  4 files changed, 34 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>>>> index 677c51ab7510..db8ab24a54f4 100644
>>>> --- a/include/linux/dma-mapping.h
>>>> +++ b/include/linux/dma-mapping.h
>>>> @@ -92,6 +92,16 @@
>>>>   * flushing.
>>>>   */
>>>>  #define DMA_ATTR_REQUIRE_COHERENT	(1UL << 12)
>>>> +/*
>>>> + * DMA_ATTR_CC_SHARED: Indicates the DMA mapping is shared (decrypted) for
>>>> + * confidential computing guests. For normal system memory the caller must have
>>>> + * called set_memory_decrypted(), and pgprot_decrypted must be used when
>>>> + * creating CPU PTEs for the mapping. The same shared semantic may be passed
>>>> + * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
>>>> + * DMA_ATTR_MMIO to indicate shared MMIO. Unless DMA_ATTR_MMIO is provided
>>>> + * a struct page is required.
>>>> + */
>>>> +#define DMA_ATTR_CC_SHARED	(1UL << 13)
>>>>  
>>>>  /*
>>>>   * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>>>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>>>> index 63597b004424..31c9ddf72c9d 100644
>>>> --- a/include/trace/events/dma.h
>>>> +++ b/include/trace/events/dma.h
>>>> @@ -34,7 +34,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>>>  		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>>>>  		{ DMA_ATTR_MMIO, "MMIO" }, \
>>>>  		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
>>>> -		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" })
>>>> +		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
>>>> +		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
>>>>  
>>>>  DECLARE_EVENT_CLASS(dma_map,
>>>>  	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
>>>> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
>>>> index b86ff65496fc..7140c208c123 100644
>>>> --- a/kernel/dma/direct.h
>>>> +++ b/kernel/dma/direct.h
>>>> @@ -89,16 +89,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>>>>  	dma_addr_t dma_addr;
>>>>  
>>>>  	if (is_swiotlb_force_bounce(dev)) {
>>>> -		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>>>> -			return DMA_MAPPING_ERROR;
>>>> +		if (!(attrs & DMA_ATTR_CC_SHARED)) {
>>>> +			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>>>> +				return DMA_MAPPING_ERROR;
>>>>  
>>>> -		return swiotlb_map(dev, phys, size, dir, attrs);
>>>> +			return swiotlb_map(dev, phys, size, dir, attrs);
>>>> +		}
>>>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>>>> +		return DMA_MAPPING_ERROR;
>>>>  	}
>>>>
>>>
>>>What is this check for? If we are requesting a DMA mapping with
>>>DMA_ATTR_CC_SHARED, shouldn’t it be allowed? If not, how would we reach
>>
>> This is defensive. Only allows to map with DMA_ATTR_CC_SHARED set to
>> dev dev that does not support CC natively. This can be of course lifted,
>> if you have a case.
>>
>>
>>>the conditional below where we convert the physical address to a DMA
>>>address using phys_to_dma_unencrypted()?. Also, how is this supposed to
>>>interact with is_swiotlb_force_bounce()?”
>>
>> You reach there when is_swiotlb_force_bounce(dev) is true and
>> DMA_ATTR_CC_SHARED is set. What am I missing?
>>
>
>So a swiotlb_force_bounce will not use swiotlb bouncing if
>DMA_ATTR_CC_SHARED is set ? 

Correct. Bouncing does not make sense in this case, as shared memory is
already being mapped.


>
>>
>>
>>>
>>>>  
>>>>  	if (attrs & DMA_ATTR_MMIO) {
>>>>  		dma_addr = phys;
>>>>  		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>>>  			goto err_overflow;
>>>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>>>> +		dma_addr = phys_to_dma_unencrypted(dev, phys);
>>>> +		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>>> +			goto err_overflow;
>>>>  	} else {
>>>>  		dma_addr = phys_to_dma(dev, phys);
>>>>  		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
>>>
>
>-aneesh
