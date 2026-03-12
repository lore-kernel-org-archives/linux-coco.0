Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1081E1C02
	for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322034; cv=none; b=mxeQAZsvWFn6jcz8erKo4NwTIheYQrBy+9Hw6dx08n87z8gY6nRr51emoT2OoD5ogmBo6ZnFVcBSY73XWF3jifbcTH1DxmJd6DkiRFu5jwPuFVH6Udba4HooBkVu7gATS29BOFghFiHRpNA52OtxdnKvciG2bp0xWCnrtBXpN4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322034; c=relaxed/simple;
	bh=gpA8yPsxWr0YYMreEtPtRRIeMQAt8l2vEE7xAShAnkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuQ7HmoquoM9nbvmc9BiyebWudIV79u2YNBwojH+BhzGuA5e/CWn8smCluJ7EbQX70UfGY/0brn+Sapf8ZkkrQdkbRsSurZ1YHsHu93JUHytKkerhNT4o61dhztQYWvINAhd0G9ssZi/FRD1//8pIghIP6f7dBeKIHXt9tPBizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=o3L/llHp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="o3L/llHp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so1265330f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773322030; x=1773926830; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9eBBP4AujN/dlLV9JaVbLVwoGymEEzkiKrZGnylO0o=;
        b=o3L/llHp/eWrKjA5sIdT4n7la7Jk9gxSzgcCfNLubQrLNsW4zN6rwb2wB+f5zhMlZU
         YhBLbgRFgHJk3S81UWzAi3Zi/+ZezqhwHjpPyB1ctiNbRPFwxk7+xUaxtUilsVlkBPjc
         yqEzRybbq6RZa8x77ZmvREG/JUV4y4FiCtAJ0lKsm8lC4Qb5DLorrW8Ag+c+58YUrw98
         SzQn4caZ+ehTbBp+VKhj2n8eDQovREim8CESxPgpm2KO6U6CNJW3whHgjIcmAmPqKVrG
         grQXFjFdJDpIaXF5rr/rWFoidr9oWm+Ts3I5VHnT+XhuiJ1VCh30+2Ib9RDGx8F4Muum
         0u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322030; x=1773926830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9eBBP4AujN/dlLV9JaVbLVwoGymEEzkiKrZGnylO0o=;
        b=veM926MaX1keyBbYAUr0PVbeaf5bN0xzEcxGjodswm1OoxOvawvP/M+QT22verDa7H
         Gt7L/rcSI2I9GEVh7lIcO0gkdukABBmcMsSuPON54sy3jmWsclB7IegSNlwcpBKV/j5U
         wBnHF0Wqbq5vDRFALYS9o3COzyEUX3YV9MXdVtMCgzp3Ydi38Ee29DM+u8wMuXVu1QNM
         +GAdam+a4reMs4nF+j2jG8h+0D7rRW4P3JJpuCDHxyuFZ8a0xuD+OlIaaEONFN8OH6GW
         PDLIg1IvA8kRLiDXu2srv4Lr1FhU7iRoEscb83NtUCnBMFyex/AUQsuAf6Y/dzelg0aI
         dehg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9XlnvUVgR8NunXEjrmbkr48ee+khQ7N2VPcFgZt/ncHqwkerOiI2kmeNmfG+iOSC580rwyNTkeBF@lists.linux.dev
X-Gm-Message-State: AOJu0YyP4WsdSwiRycvna5PicbHjVe/v09cH/S970/Ct3cuebR4P06gy
	YgL+xRAyfF5kIqvifVE0cjn+3FvctlT+Jlb8QaVI0wlVu/+6t8prbK+29/8fLePrVyY=
X-Gm-Gg: ATEYQzyMMr5e1v7zJf4KXT2rBNOxoyxoPTH1CecX5xY/uOm8Yxpvai9tbYu9lkvEd9i
	I85eST4e9ic70sL5ADY64Fyx5LJOamFyB2d4xiIPw1SviXnE20R9DN6DwHsmugD3go1atlqyQ1f
	NhBUMnIByImbBs9bFGDCHtf1ToqVuhpeFu8jSkVZHKAv7QpKR6JJxN9PutVAT8CA1MqSloBpXjZ
	nA+UN5fBEFSJVhAutGuEtR4bGvHDYiUEGPidu+RXKIulc5zGrPdQNcB2CDBrVUnzPzzFLhbVb9J
	VxtFy59Mvzp08ueNYQE2yHltBryirCDgVdzkUgx0kHW0u2LGQD9jPSUyJEDnTpi+dN72/akmWD0
	sBMW0qQlswZ7ztb0U5B/xdPmPDnvm4C77PfY9sQtdKafD5213e2h4sSZ/hRb2io5aXUneY6PBBz
	v4bOXXv7uwkE16iB495n2ra1fN3viqn9w=
X-Received: by 2002:a5d:5d0b:0:b0:439:f5ba:8c2e with SMTP id ffacd0b85a97d-439f81c6390mr11949569f8f.18.1773322030015;
        Thu, 12 Mar 2026 06:27:10 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186d5sm7889290f8f.28.2026.03.12.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:27:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:27:06 +0100
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
Message-ID: <qhu6ahugrw7ehxubssin4amdvsdqeuezjm3vdja5xpcykyjij7@kcg3fojxysqw>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
 <20260312003408.GA1469476@ziepe.ca>
 <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
 <20260312120606.GC1469476@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312120606.GC1469476@ziepe.ca>

Thu, Mar 12, 2026 at 01:06:06PM +0100, jgg@ziepe.ca wrote:
>On Thu, Mar 12, 2026 at 10:03:37AM +0100, Jiri Pirko wrote:
>> >Alot of device MMIO is decrypted by nature and can't be encrypted, so
>> >you'd have to use both flags. eg in VFIO we'd want to do this.
>> 
>> Why both flags? Why MMIO flag is not enough? You still want to hit
>> "if (attrs & DMA_ATTR_MMIO) {" path, don't you?
>
>Because we will eventually have both decrypted and encrypted MMIO.
>
>> I mean, CC_DECRYPTED says the memory to be mapped was explicitly
>> decrypted before the call. MMIO was not explicitly decrypted, it is
>> decrypted by definition. For me that does not fit the CC_DECRYPTED
>> semantics.
>
>I would say CC_DECRYPTED means that pgprot_decrypted must be used to
>form a PTE, and !CC_DECRYPTED means that pgprot_encrypted() was used
>
>This flag should someday flow down into the vIOMMU driver and set the
>corresponding C bit the IOPTE (for AMD) exactly as the pgprot does.
>
>Less about set_memory_encrypted as that is only for DRAM.

Okay, that makes sense. Thanks!

