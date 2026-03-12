Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE838C2A5
	for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306225; cv=none; b=u48HEAW3BGTCkScrHjdQIG0rZRVIkuZxVfgRHHVAs+MLypIqGgVDLN4i29rcE4k7E3M0rN1UJDGLaiIl06eoP7C80sTMT0jhP/VeRh4aZliH6DZxUh7w6/9PN/CgFU03ltGr6yp2N8ID3emeBZdxgctXovlowcUmnMGs/Sn93tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306225; c=relaxed/simple;
	bh=LdyzC1pgxXTGxkwgodIu0tKumfCfu9AUZ2hCUMAE1os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTqsfJP/hv3K1zM3LkXEFPXMnM7dRMGtcx7UX/fEWpfG2VQXaNrwnPDep4NFAw1Uy6xLEwO0QFov+5SD0E2VvpVAaooigyiMpQOq7QlWGWpQawyCPgRFW2eDyyGz7E6dkBuQcv27dEDVg+Iw1m3ammdQ5xJvVWGU8D4oisCR/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nxPsMFMj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nxPsMFMj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c56e822eso806273f8f.2
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773306220; x=1773911020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFPtayDDhz8Xf/M05gyckNDjnYEg9BLk1Cs40ltYFF0=;
        b=nxPsMFMjRLnKvTT8oQsJACDG5lAw+6DqZ//Tic2bfQ952yq2HaC5bVuie7NYbOhXaE
         ySxszGL9qojHGT5yXZen149vHGnNuST7ioIOCNpySh0buyTI4QJaBlBAZpQW183NzgeX
         0ivWIqXyqt1kYJ+p3liGQi8QC204OLIsJfeF0n9BHV69CApafYohIHEdhLffIeqXGnp2
         1UTo0uh6d+Ns05TsuHA2gwo9SLjohbgsFjToI6vlakZ2f/MzOCNPLayqdjzdxHK7syu3
         4VCmlry+n+332tVqNIfhoxNOYYldD/xwxmL1dVNGXDc2L82Pb8IJrM5lgkYUvD+NmWxA
         gcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773306220; x=1773911020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFPtayDDhz8Xf/M05gyckNDjnYEg9BLk1Cs40ltYFF0=;
        b=d0jzCnoQsDS/1MqLMsaZzYQv/poBQ2734hujmnKiAeRPabZYATOE2wmwjMOdU/bGJf
         HyDpqe+idIDtdFY+/k4tdACwtIxilgRiwdajzwClPdtf86UM4AYHDfqvqhyNk5OpkkW4
         9vZMXaEQQ1gNiMvLIUCrB87jYHfq8dbfDKPcXzi231iVVok300Yo9aUbcRgrCbuGKUMj
         vUQfqk2RM26j+HHmVUAvgMRkmnUHjRgvSwChVRnyGpT4KN6izcY1d3FSE/dWY9FP/YcR
         B8pAsIRlFyQ6PcUIWTBVDXQSRGbv5zHnwAYUdgU+OOZpbJcuAl+654iNAPeTxFl2s4NH
         /crg==
X-Forwarded-Encrypted: i=1; AJvYcCVlHtCdXL0SylDX7p7fTxp32Hpx9ZPzesjyDIFg6nmV+3u58D5eA+zCnncKqaHyUhsC9VEVTYQ+eix/@lists.linux.dev
X-Gm-Message-State: AOJu0YyveKJsxUQwaK4bAlD9jHac+Ex3q569vv8hUJD80vG6PhqdaORV
	W/BkcQb+CjFUQJoDZGi4iMOhi3/cVbNF3eAIX6wrjRqIjQYbHYOop0b1vmcS5kA8Rqg=
X-Gm-Gg: ATEYQzwFIwxy4ZUMkgUS8G/qsw8GcW6Xoo3rqt2rA6CpQUDlw6D+q3UWaa152ingCjk
	MSYBef0KqwvxFBJ+TRlLymPmnFBX3UtfkvW2wt5WZW2jlaCz8CeeuX7ReOpQ4VNZMbCmUsu7wAn
	44q4D0TeOI0lx4EUnjNShFFeFgQfeEihNcIbntX1NXDP9fSQek7ANKnsPiNlfakxk+bNt76oDeo
	g52A0qt38ZwxT/ofPzoaMkbdwJBeKH3E1KxHl6jVKDUe/PmzYEcMt7ag0HkkBsVp5d7+EdZbKgE
	+lrBZxcnrXjBbuRPjWby+S27jbkqoHl14D+6tN+soyGn883KJTJTVKWV7gGidlqfsAARgkGzGLk
	3sGLe1Njp7mCpcAEJVe9PolwNk7ZnHfk4ul4MQ26j+CgKh3E+DjePd8JA5l3oAjRx70x9wdmyRt
	XSEDHboljiU9Eq3Sf88sFxjDHclPV+JxI=
X-Received: by 2002:a05:6000:24c4:b0:439:b3ff:9abb with SMTP id ffacd0b85a97d-439f8224fc0mr10284840f8f.57.1773306220321;
        Thu, 12 Mar 2026 02:03:40 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm6366764f8f.4.2026.03.12.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:03:39 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:03:37 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
 <20260312003408.GA1469476@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312003408.GA1469476@ziepe.ca>

Thu, Mar 12, 2026 at 01:34:08AM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 06:51:21PM +0100, Jiri Pirko wrote:
>> Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
>> >On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
>> >> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
>> >> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
>> >> > 
>> >> > > > +/*
>> >> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> >> > > > + * (shared) for confidential computing guests. The caller must have
>> >> > > > + * called set_memory_decrypted(). A struct page is required.
>> >> > > > + */
>> >> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>> >> > > 
>> >> > > While adding the new attribute is fine, I would expect additional checks in
>> >> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
>> >> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>> >> > > that we are taking the direct path only.
>> >> > 
>> >> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
>> >> > TVM) should be using that combination.
>> >> 
>> >> So this sentence "A struct page is required" from the comment above is
>> >> not accurate.
>> >
>> >It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
>> >page is required"
>> >
>> >We need to audit if that works properly, IIRC it does, but I don't
>> >remember.. Jiri?
>> 
>> How can you do set_memory_decrypted if you don't have page/folio ?
>
>Alot of device MMIO is decrypted by nature and can't be encrypted, so
>you'd have to use both flags. eg in VFIO we'd want to do this.

Why both flags? Why MMIO flag is not enough? You still want to hit
"if (attrs & DMA_ATTR_MMIO) {" path, don't you?

I mean, CC_DECRYPTED says the memory to be mapped was explicitly
decrypted before the call. MMIO was not explicitly decrypted, it is
decrypted by definition. For me that does not fit the CC_DECRYPTED
semantics.

What am I missing?
