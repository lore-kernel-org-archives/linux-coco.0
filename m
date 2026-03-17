Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377D286D72
	for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754628; cv=none; b=XnyMx4RZ1j8+tQP9QEwAk5pZ6tKAMnG0KWc+4XO6jeXIdRmq82y2q5EacG8QNTCvTHOJHcZk6YywWQLA/kX/+cxEHVGsXaYU7G3SX88QP4+S9byy4LMeTm41WXcqZ7A8qmSYEU6ml7L9UV8SywRDtLempsU+XfHgdIwc1ZiF538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754628; c=relaxed/simple;
	bh=iibvvbujQ5RRNUoZhe+z5X7/JBkY5cB6lsi4Yp5e/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI5GvJmytzHLQfVHA3uizySkIvp/JMYt9uOMmI9zMS4QWmEDkDmCAPLqYIOKS5AX6WRNlW5/tDG4rDSqyjpnjOdJwESoqLjAQvo9L8F1msv3NaiOiQdPWMDTHnrBe+iMIFhuMd5G+QHlOV/U6kUi5r+ilIo2BBr6ewc+W60THV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=RpM0/9s/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="RpM0/9s/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so62973015e9.3
        for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773754625; x=1774359425; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvyHox0ngaRcTYY5mmOslDzHoAOd+VMSoOGA/5ZJGB4=;
        b=RpM0/9s/wEZvbxIMg59jKFP5t2LParZSN/AhbIothVI5+/HztISgdmEnVW+CFlwJCw
         Ur2Dbek0Db+m+M+LBkSWHGWkY4LAkz7h1NyK9J+Pui/uhEjnbt7o8dPvxGzgeIE1UV1P
         Oo4bRSLg11faKjfLJ+bYvScPiSMIgdlpeOxiBUThjTMTfArNxs0ypRIGwtVlSNMlTk3Z
         J+QMqRm9ChnNhcbMCrFeegG/SN/ozWA2ghbl8+R/lBG0BPeNcdl9mKpmK0I6DwOgcq0u
         FiEcG7AOtelbejvU7qwCrZMGZViL1wMR82CT05+0vg5by2IVq2jNdh3v/3shfJ1s/NXu
         3+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754625; x=1774359425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvyHox0ngaRcTYY5mmOslDzHoAOd+VMSoOGA/5ZJGB4=;
        b=c92s+RvoQIpOzWTEehMqwwtNNpUfcYGBaaQhZuAyb2WaQZxF+KcGWWiUukb1JsUTn7
         Fbficlk9jpEU3MpsBRCHExR/YWBckQ7Hn0XCOdAH8OSMt4YW4gHydKotM15CaTiPaxkN
         S9JFx1HRBHyP84KlUys8RYzloqixklmogD+qqPBHKVKpqNls4VZAqdgtljwK1XL6hX1Y
         bJg3FM8RRQ9Rb5CdSseMJqy3a6JreP8dmUR3Mhi0YNOoPPNB4XOufSbgMSIGaqOFz1Eg
         3quXHRwiFveuq3019WyprPQl5RJj34W4hmZ6mFiAesk13Mb29WYaRgKAVw40DMjk7noC
         9Piw==
X-Forwarded-Encrypted: i=1; AJvYcCUVWWJHy+F6APejGU45gKgeZMuchNOhql101kS0rUuCEvfxSfNQXgUWSwnLqpIFyfcSRclNjOwfsqeS@lists.linux.dev
X-Gm-Message-State: AOJu0YxClzQw/XqMDeEg/JXGKgchDl7f0DK/y94PX5X7iWoa42sN8iyR
	+QidvOVLrSn93JwxkkkpqlT1laVzuzzEaUgoa/UQluKDTZnw5hdED7sMSoQKDeyUgoI=
X-Gm-Gg: ATEYQzwWWivsdVvRn0JjW7eLPap03oCtDvynWCFaAif/yACSQMWcOPQugnhWe3agist
	C9n235ZgWz0uh/RityibBjjTtvTplkXstit4yz1WUAK/Op/9zzCSr+iur7GtKQ2UKRW4MVQDqHk
	e7ja5ZESb36NzQbeA8VqMxLIgxsY899reCgBsr4SDeV7qao0/6lx3bzGG4036M6WZ7ZpVneAgF3
	E56IHSpFi6rB8pELH02rUBJcJcGHVxZAxW4ytqPQyQOV/UiPNlhTHti+gI8LHRx35ebZd6NL7Xd
	sig7FYbV0BOusvCjjkvuwghXhJLEZtgOiVkvlX1Orm0VFJ9KXCMGuWJhTvLoLaNWLHWUKfwi0fo
	M+U845g58rNKijjn6a4CBLbBySheVCH7vXeK49PLUQae+6U4lGgcwgVUSuJ9H4bdZGdtBlypeh6
	0mKepxK49fbVg66TK3IDkf0Iu9Y+F1MGU=
X-Received: by 2002:a05:600c:a011:b0:485:6cd3:f7ac with SMTP id 5b1f17b1804b1-4856ce33d33mr90044845e9.20.1773754625122;
        Tue, 17 Mar 2026 06:37:05 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaa3b66sm76702495e9.11.2026.03.17.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:37:04 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:37:02 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Mostafa Saleh <smostafa@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ablV_f_l7wD2m63E@google.com>

Tue, Mar 17, 2026 at 02:24:13PM +0100, smostafa@google.com wrote:
>Hi Jiri,
>
>On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
>> run with encrypted/protected memory which creates a challenge
>> for devices that do not support DMA to it (no TDISP support).
>> 
>> For kernel-only DMA operations, swiotlb bounce buffering provides a
>> transparent solution by copying data through decrypted memory.
>> However, the only way to get this memory into userspace is via the DMA
>> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
>> the use of the memory to a single DMA device, and is incompatible with
>> pin_user_pages().
>> 
>> These limitations are particularly problematic for the RDMA subsystem
>> which makes heavy use of pin_user_pages() and expects flexible memory
>> usage between many different DMA devices.
>> 
>> This patch series enables userspace to explicitly request decrypted
>> (shared) memory allocations from the dma-buf system heap.
>> Userspace can mmap this memory and pass the dma-buf fd to other
>> existing importers such as RDMA or DRM devices to access the
>> memory. The DMA API is improved to allow the dma heap exporter to DMA
>> map the shared memory to each importing device.
>
>I have been looking into a similar problem with restricted-dma[1] and
>the inability of the DMA API to recognize that a block of memory is
>already decrypted.
>
>However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
>well as dma-buf owns the memory, and is both responsible for the
>set_memory_decrypted() and passing the DMA attrs.
>
>On the other hand, for restricted-dma, the memory decryption is deep
>in the DMA direct memory allocation and the DMA API callers (for ex
>virtio drivers) are clueless about it and can’t pass any attrs.
>My proposal was specific to restricted-dma and won’t work for your case.
>
>I am wondering if the kernel should have a more solid, unified method
>for identifying already-decrypted memory instead. Perhaps we need a
>way for the DMA API to natively recognize the encryption state of a
>physical page (working alongside force_dma_unencrypted(dev)), rather
>than relying on caller-provided attributes?

I actually had it originally implemented probably in the similar way you
suggest. I had a bit in page/folio struct to indicate the
"shared/decrypted" state. However I was told that adding such bit is
basically a no-go. Isn't that right?


>
>[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/
>
>Thanks,
>Mostafa
>
>
>> 
>> Jiri Pirko (2):
>>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
>>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
>>     decrypted memory
>> 
>>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>>  include/linux/dma-mapping.h         |   6 ++
>>  include/trace/events/dma.h          |   3 +-
>>  kernel/dma/direct.h                 |  14 +++-
>>  4 files changed, 117 insertions(+), 9 deletions(-)
>> 
>> -- 
>> 2.51.1
>> 
