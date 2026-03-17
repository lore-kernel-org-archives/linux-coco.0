Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF73CB2E0
	for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753861; cv=none; b=AKMYSPgMis/QDEP0REnH4EGPMuWbcvYxOd7PZtRodSw3VhJSr4OF25E5lgYiqNiXlFIQ/JVAqRO0WxPkFXGWgVh09f6lc3jLrIugnO+uWuWHJvk4CAdaHroLbRFpgY+MipLvc1tZxNzw4IyN+VZ02XmrRshLQAi0z9+H0mwpHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753861; c=relaxed/simple;
	bh=7Qt6Q9z2m0IUW39FJ0I96ZaoPjhs3eTkYaQNqdf8tjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ508sgGdhyZG6r7ktDXU3L+jiJ/K07WLHHn9Y327voecGEGwVX6TbKPJzR0ihoduw2JHDGvx6C1xD0mYamkoHLyghAYZm0ZgCTp10Ws2EVQWotWMcz9CAcA/Xozm5pS2tCsTcX2YIAxXC0CNuUWUxlWv/xVeNFYvQUAMCG65uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gTfQxOvE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gTfQxOvE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so59005e9.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Mar 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773753858; x=1774358658; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zWZeNHlOMbvwVmHsivYMTEHjYjPNUndT05044cKL2Xs=;
        b=gTfQxOvEvNftmap9EHiCM71pnIKQz0oa6z7eB68gDA1TKkdZUeEBQnJ+CziT1yHu+i
         ekyaGJiM0uimteEFFNNzJ8dmE2WwJzeSWqkZIKIwZgIuAJoUPQVyeFaozArhyCgoE/8G
         w+ZVVsNw8k1qWyOea44OMJkHlTa3/+9AKpgIS0LZlhWi4Jkr15rm9g0Qcl2nE/l82ZUX
         3GauVE2dw6ZJ6BBjm06zsVsem4a0WVvY6JaRMlE6A//+KddXs7CYd92P4uaVS5KCfL8Q
         TiEcADjRfHKy/mKqT/BLYPbmYCqYtmoD1D06OYuoe/06b0SBSxriyMYBAVTY7eLRFtbQ
         crEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753858; x=1774358658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWZeNHlOMbvwVmHsivYMTEHjYjPNUndT05044cKL2Xs=;
        b=qwwbaW8FbksuEWY4mfhU1DswzklWEgZp0GF7VTO8V8UFLlhtfKuPZv9VCq5OpW+ip0
         dBaexeNm2wkRsKzCQOGQQGouph94pS341G+xulaUR9Z7zLGUT3LXC8rzj1/5e/TYm06b
         aNXLrDdG8/Vol50xDi4tr1hFomok4MyPAtK0PHzAgh9wGafE3+amh3PnMjLryRdgK+VZ
         Y/TSllZScUbdEFH7ibeQTCNuJSfhkxz1TKnXuNkVioNfVtcTVqZIzYNY+EevcYycyEsk
         QbebGbOQhXqPwdGgsKJ9VMRKOGnlCUxUvxajNOF7vAQXT3/ZzGbvrx+aaxGvH3NuMkSt
         mYDA==
X-Forwarded-Encrypted: i=1; AJvYcCXezF5YisLIi6WzWJzpNmKMM376VpWlYUaJpGXV8gUK1dMW+W5A14uIPlm4yivRY9PqcUlHyFDlqqaH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1q2l4Rryk6n38yhebIaTLvRMXU2gXVI5uXKL9ALLDdWqEGCno
	jIwXzmNPKtdhuHPmAM+Qxw5FFT+Vd6RFK3ND40LfqXDjqVeJ/Blfxvb0Tov5Sh3WzA==
X-Gm-Gg: ATEYQzxBXcB7gB9uk9K9m/Avzr4OxfZ+mt1A5nVmvGjjZDXRwkaFmr63rQdeeByBruQ
	sVFSUYfL/qrXdCVcuEWxPQxwh0jrX8jwcuWJoIyavZdYkXNk/bYxExGD4/tNpJ1yeEvjN0FS6Pu
	r5TIoJsfyPcox5MtMbkfapzzN+pOC/+EgVip+q5c7rab6dq0OCAKE9q+wAo7i+UGGAERljSvYuT
	HxBYMf/hltz0jN7t/EDzkzBnU4R8+hMHbw3Yc32prKDtyGUY/ZiciwW8GrhCGkseIjtPHJAdTxl
	UvOD+bSXNuIM/kNwzeu64PpQ9qbLFhwC3bZY+y+lkbbXNgrgPyJopnccPLfjbmQkJL7PurQ/8ur
	LjA3vW8RNq7CZeJQBdfGwRB6fS7KJqk5FBpIMbqu5KmcKvrNzWv++rCKhNSdY3Fx/otuVqedzaZ
	CetovnecEoJkSEtN9KtNcyPOFGeb0hlPApoCI5J5NlGj3a8Zhq5xjRFaGl
X-Received: by 2002:a05:600c:4e45:b0:485:b6e4:9808 with SMTP id 5b1f17b1804b1-485b6e49f7bmr773775e9.1.1773753857226;
        Tue, 17 Mar 2026 06:24:17 -0700 (PDT)
Received: from google.com (54.95.38.34.bc.googleusercontent.com. [34.38.95.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm58975315e9.10.2026.03.17.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:24:16 -0700 (PDT)
Date: Tue, 17 Mar 2026 13:24:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <ablV_f_l7wD2m63E@google.com>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>

Hi Jiri,

On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> run with encrypted/protected memory which creates a challenge
> for devices that do not support DMA to it (no TDISP support).
> 
> For kernel-only DMA operations, swiotlb bounce buffering provides a
> transparent solution by copying data through decrypted memory.
> However, the only way to get this memory into userspace is via the DMA
> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> the use of the memory to a single DMA device, and is incompatible with
> pin_user_pages().
> 
> These limitations are particularly problematic for the RDMA subsystem
> which makes heavy use of pin_user_pages() and expects flexible memory
> usage between many different DMA devices.
> 
> This patch series enables userspace to explicitly request decrypted
> (shared) memory allocations from the dma-buf system heap.
> Userspace can mmap this memory and pass the dma-buf fd to other
> existing importers such as RDMA or DRM devices to access the
> memory. The DMA API is improved to allow the dma heap exporter to DMA
> map the shared memory to each importing device.

I have been looking into a similar problem with restricted-dma[1] and
the inability of the DMA API to recognize that a block of memory is
already decrypted.

However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
well as dma-buf owns the memory, and is both responsible for the
set_memory_decrypted() and passing the DMA attrs.

On the other hand, for restricted-dma, the memory decryption is deep
in the DMA direct memory allocation and the DMA API callers (for ex
virtio drivers) are clueless about it and can’t pass any attrs.
My proposal was specific to restricted-dma and won’t work for your case.

I am wondering if the kernel should have a more solid, unified method
for identifying already-decrypted memory instead. Perhaps we need a
way for the DMA API to natively recognize the encryption state of a
physical page (working alongside force_dma_unencrypted(dev)), rather
than relying on caller-provided attributes?

[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/

Thanks,
Mostafa


> 
> Jiri Pirko (2):
>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
>     decrypted memory
> 
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  include/linux/dma-mapping.h         |   6 ++
>  include/trace/events/dma.h          |   3 +-
>  kernel/dma/direct.h                 |  14 +++-
>  4 files changed, 117 insertions(+), 9 deletions(-)
> 
> -- 
> 2.51.1
> 
