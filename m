Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D77301493
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078690; cv=none; b=U1BkCp0y4UFStHHeNkkTsogQxU9jxWQqRm9qeF2sAR2pNXdN7qLOo02KWTp67dqDgQM3Im+CUgZxA69my2Rs7XLtfOMyyAYBdbBxL64nOd80mtaBzP/ErxDTdB52F9Kh754plbEGVSCc9e7D2HSDHKxLA4rTln39WcoAV8+e9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078690; c=relaxed/simple;
	bh=3aAI8WLDhwMQMlGaUhMuyZUWlilFZJY6aa0zFeBAhhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmG2azgj1V1SPE9XqA3rrnOeNLXNnYPwJnYz/U0mTIV2qx8WKmx9kNDNmeZYVz3NuoRK9dhc3g+Kvsg7qo+xGWE6bIxXpfCOq0w1YzBLGNTVTxCDxV/XErwLLq5tkX9q6rZH71Jux7MlRqJ5QG+QfO4mWRaF14lJ+T5Drub1x2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kHgZ6TRy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kHgZ6TRy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48529c325f0so22160845e9.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773078685; x=1773683485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
        b=kHgZ6TRyDBXPzmJGXVC9t6Dk9vF74oAs0qr6bMl/2Dd1dunGcSwcWHYLnI5qEOcHs8
         Qn9ozXkI7J/upUX+729lm0jfiC3pCHvt2o7vZly7vOtssReOWdb046HOs5dvlN3sCi7b
         MHHMM232cetR7o7jZ12dOSWWf131zVfL8yZGOF5rJPPaXEQcVigjVuwWeivzF41AisQL
         HGdkpmYX31dFdzmhU+MW6n8Hu5/VPzgAM+8CQaOhtWBgMsFnRiKLNVQBj0Mm6v67uQjb
         /PRg7mDRXb13j68H8aW+VA9G5XBBICLySpjhtxaegzfTCJwiqHdEkn7xJ3HI2uXZwNr5
         B2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078685; x=1773683485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
        b=KN0LuecZ6P7Zi7mrhymVmqloR2ETaZTI2tKw2Sg4DqQ0CEcC023RyreSgwdQKhkpIm
         RmxgHGECzNcomO7kd1XZ87TKfqBSPqxFHdqTG1P5cj6cVlXUQT5ICDNAF1m5Q3+aJgfR
         Knb1NNA96qLheyqXF/GmFaB07g81jOJjVoiEMfZNHeYDtCGUdRBMhLnCODZ0P++ck3hD
         cyIkh8XrkeFhP9nt1h4as49H8JBLF48nH4T7KI2wGJLt1R6vrVk8zoC/p84L472mJUbP
         x9S6sbnw0aVxEO56iYkKf01BVcKpwH3NpEmQInvEuvNOybGXSbWOHXo6c7f9JfKdpGP5
         mFLA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2rkws/O3A/jOuDGLC8D96xmAC0jAGj66hparO+lOAVnrhZ69EhQlzNnIVXZfRzpOOq0tDocikcNk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/XpIkkL29p5hZhMv++IjaiV8HGuS3hTMn8UmzsRYLEtpy7mDo
	hkdvjg3XpcHfvIy08Cfn1HP51cA0mXpmde85Yftv1luxX2tr7Nap/Ttwz2+YBe8nG6Q=
X-Gm-Gg: ATEYQzxl7mc23DvNdrcfdazYse5ejTtMAJILBlIxSX53fqJM7o/agAB+Rvs074QftDM
	fIWIgUlraYojMVH+Prb3U0p3EUc8zCJUWW2F+YcQbU+bCZwssuzHifhbzKMdL7oBW8m88ozSg8M
	EM1giBg7moOy1G+QKaG+vbeMr+zGVRCOmJeIpqz/ubO6I8vQsIJEkQjs+oMbnhyXGtcjnoP5zb7
	9kgA4FKgGOHZ6TdkN27qRhRg9dHMn1v6TlZtpFSbGp+16aJ6Uo/ZjrgCkwF15STJnF+rfktlxil
	Z5DUCEfYRz9unplEvT4/Lx6jCeL6/blpyI/VjBWTrmzQmL/GlNDUnzBi77734ahjzHNe7Igqt9K
	Hvro4VshHPKKGPGjeeSGDp2Imeudvw7RTgnzj1VQgRC3PLfY9uVpRV61r6/Ha0yaGTHxIZg4s5j
	Qw7iUdiZLcYBDaOf7cDJE32MenwPA7YK0=
X-Received: by 2002:a05:600c:5250:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4852fe93587mr147475155e9.15.1773078684896;
        Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm28642353f8f.15.2026.03.09.10.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:51:21 +0100
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
Message-ID: <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309151857.GO1687929@ziepe.ca>

Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
>> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
>> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
>> > 
>> > > > +/*
>> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> > > > + * (shared) for confidential computing guests. The caller must have
>> > > > + * called set_memory_decrypted(). A struct page is required.
>> > > > + */
>> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>> > > 
>> > > While adding the new attribute is fine, I would expect additional checks in
>> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
>> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>> > > that we are taking the direct path only.
>> > 
>> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
>> > TVM) should be using that combination.
>> 
>> So this sentence "A struct page is required" from the comment above is
>> not accurate.
>
>It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
>page is required"
>
>We need to audit if that works properly, IIRC it does, but I don't
>remember.. Jiri?

How can you do set_memory_decrypted if you don't have page/folio ?

