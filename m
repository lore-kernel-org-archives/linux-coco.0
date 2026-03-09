Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB393ACF08
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061299; cv=none; b=OxMGna498JXkmcwyTApmVVy3P+ti7JBfNHn8aIR1n10R2mbBgBsj0TbMt7BF8HN45vtbAQcjzy2TDzJZ14qyMMhVubpwVfH5HbnknYa6YLpKe1QjlLQQQSVQ21J/tp9HX3uMQHw+KhTMF9QK3CpMKEZ9419wmNqDP5lbC55Pd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061299; c=relaxed/simple;
	bh=PkTbINFVaFCLBX8INx4Y8qGhkNCUftkmgaPAZo5ZF/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppCQ50PGcFKrGNBZRhWwN6DRuU4/YnjtoOB+JU+6ufjmcbUwtAljrp6aOnOYFQd+7waNN1vp+KUHE44OOVNkY01ZBXZVoHbgV8kb2XgMmDjowU8ZCExeVeAoyYvBv5c4Vmz/wCqNTHHbv2dpMZIctZPK2Q/mzjiraj3knpr1La0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=CTRfsdag; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="CTRfsdag"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso106651965e9.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773061291; x=1773666091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
        b=CTRfsdagwrZdzf2+WtqGyPNe+WZuosYE2nC+RGRKNo3sbMXwMFyfUOt+Y8jBi6R/wx
         j9itqGB5wRy854e521SRKO5820OlZZtaKdtndptszWfJfduWLnPEKG2l0RV6899+Xa3/
         sU1xsC6eAE5K+pIP4cxCXTBVZWON9bhxowu7T5ophbidriHnkGln6vB8wNsa2ru9kLkf
         OXEzQLvmBvCCrM5r+zBLsgEldzKA9K9JY4uqT6AHFVKtu3VoGWpYdq8YgNj88nFMHAsH
         io4jqxGNqnbIdps42MGRHeCHipkZN3Pgq/U6CekTM5KLVOg0PZ1bVeionHeZ5KRDAQLx
         waYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773061291; x=1773666091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
        b=KOaLINVBgAgHMdnVdpHwbXwDKQIjAzl+3GVqSvt47kUeZXLbhXg/FUx1GoeHD7ZnRF
         3dgn8TsrwCCO5Ll2VciMqiInO1dZfaAm2F5KQEbODFaZHwfnGEvV0qQcpUUcSIWMRbnh
         5UO1pgvSiMj6gvnBaBDXgJIqCpnamchZyCSDlvy7TvKSO5C5ULMnD8PDiNbmIZbWxdbH
         EyuaiE0YNmutA6jQrWgfF6BRawhvaGHNiTaG5d5JKxGx9bBvwjCSPWub1yA8fxPIw5HI
         Y/scigpvq54UNQpRsUPf6Ycr/sDho5r9mnoak+uQXAfki5DOD5mBGmiho1CT5XywJUUR
         g75w==
X-Forwarded-Encrypted: i=1; AJvYcCU6AEqUYG697/mln3/akJPwbBqs9QOMqvcJU4gGUoAesUkb8sbSytsK5MTYwMXyPWfuAOclWmALyaBH@lists.linux.dev
X-Gm-Message-State: AOJu0YzHCRRzDOVqhRDvEHlY2Vixcu1jUDity8JdklwnqBe4ZN7+istC
	iKjxqFVF7JdcpYa4Ijdu9XZ8FKvhnunz7eP6BsMhNelYh06NaLU33ywW/xv0RURq6Xc=
X-Gm-Gg: ATEYQzz7yye+R3f8MzApuGDOnBNckgqGDt7qmCxuYcJfw3UmUlepaGh/sTjUSmxjE1d
	RSY3ZdhMW4r1AU0/Y5Su3wwnexw6xLlDT0YVbSjYsqvAM9ziQ8fLYaSj8o/tFdgN6KCXF6OHq6X
	tG+zZlJdBbxyw6pikdC+IBffFCMnaJzUX2FFhWC4YHWA0VW9O4qge6pfFzEHGcjfQkqULkWi2cn
	WzhuR5b/GR/9zxAp4UiK8v+yRJyPUXe2WlaT3HeH9lXepr5aJ/VEJewINYulhF1sy6c509W3i/V
	kxKBfxFyDCYx/6hkQed61xuXAssS3PJtJa+5JQ08VM+emobpCLPm9XrpcGRNVZNazFlIevcbgtT
	7Mb6N3Uel40WpuLmAsKg0P963zjDmwNSRz5o983/BKJJPMm1drnK8I9W6g0aY7Ul0DFvoz8GGlh
	EnjBWaA9iWPBYHDOdFarL0m5x60T6F7K9KBIvJDrqwwQ==
X-Received: by 2002:a05:600c:8218:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-4853692eaf6mr73833215e9.25.1773061290855;
        Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a498afbsm64496685e9.0.2026.03.09.06.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:01:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Tesarik <ptesarik@suse.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <byfhwrnq76ylztrjc67ia5tlzgpihh3ycv53je3jekkbqltcad@sslumibsz23v>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309135610.1f81d2df@mordecai>

Mon, Mar 09, 2026 at 01:56:10PM +0100, ptesarik@suse.com wrote:
>On Thu,  5 Mar 2026 13:36:40 +0100
>Jiri Pirko <jiri@resnulli.us> wrote:
>
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
>> 
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>  include/linux/dma-mapping.h |  6 ++++++
>>  include/trace/events/dma.h  |  3 ++-
>>  kernel/dma/direct.h         | 14 +++++++++++---
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 29973baa0581..ae3d85e494ec 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -85,6 +85,12 @@
>>   * a cacheline must have this attribute for this to be considered safe.
>>   */
>>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
>> +/*
>> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> + * (shared) for confidential computing guests. The caller must have
>> + * called set_memory_decrypted(). A struct page is required.
>> + */
>> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>
>I don't want to start a bikeshedding discussion, so if everyone else
>likes this name, let's keep it. But maybe the "_CC" (meaning
>Confidential Comptuing) is not necessary. IIUC it's the same concept as
>set_page_encrypted(), set_page_decrypted(), which does not refer to
>CoCo either.

Do I understand that correctly that you suggest DMA_ATTR_DECRYPTED ?
It's not uapi, so this is flexible for possible future renames.
