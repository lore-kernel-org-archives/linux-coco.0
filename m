Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BE3B9613
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060982; cv=none; b=slI8Ajh3m7FsMoiF+SycwTM/KKdJf6Gzv3eMZ9ceCL3HzaBBmEk++qPhHt4DVzw7s8wWWm11yd6eYcKbNyo91iRkr/maoPuozy5EHSrSXSpFN+miF0QgrhQN9d8O5QND+YCcYQSXbgky5oMhNeHSnHH8jBevmUPejfyNq77uXAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060982; c=relaxed/simple;
	bh=QNehHtcV/U+882/EtROWCyMzcCT5AwE/vkXUl7ZCaNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aU/gWwmWrM8SrI4iT/Ku3ojT77eW+JRgWWprgL/4VGmmDSJWZOL+s5qd22eucsNTr99phcB7vFMUDRV3LKxPwtBGQvSzwtI8YVzkw7qp/HEQG772wM9cb4Jtx9lpmaLXTzvH5Bmvix/Xno0+WglUfkYHTgihMbrjM6gmGoQC9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UUFhb8KG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UUFhb8KG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853bcdefd3so550195e9.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773060979; x=1773665779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
        b=UUFhb8KGgbjsamgrjnA2aGrcZoxBHOBjx89zlFLjaaozX7/5fzICojuRQ+aKfY9KSk
         ZidZSJ+aHtng1ICglhlGZXZ70EK8f1eouCfughQrEWFd008lQ4IJSG0I880LV9aNefik
         uIsAlCTCsoEUHLADjr/p00aHkA2x/WfbwowzK1Mp8k1eHjBinlc2CbnKmNGAX+bbvfKL
         u9t1N7yuxFIj6klB6VN5C32V42jkyAEFIMARlQQtljqodfwxDPmbSZkwzxwOd/+eYUpS
         zmxJ9PTV7I+oMeSwMOFHXroVlc0gGelqAQvAirf3lLYw2vgfsgME6HZt4IbTjRo7rsDD
         VWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060979; x=1773665779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
        b=qR1hp4wtOn6QuCQzC6XjYK5xO+XiSMKycVk8GG3KTWV3ROCAYx/yMJeil4RjzOZoJy
         FCVicxczb3oRC9czAn1LfSo0LZRf4yH7tSZ0GufWuzCMcSZ9UjyCAEYbrLywVbe9F/qW
         1HIr6i55fm43cWc+7y1NoZ6c22QEdNk7Ye1cqhN4vYtTd6f8P1GXbUSq/B+Yv1JpUcxh
         WJs670/1ygdQVCGfcKEPOdTsMH8kTfgmXbGIqoUmDaI+h7Nejc6jbq0H+dKokHEJulDS
         ecNkk1k1SnyOrSYTM+Lh1ct01oMGK2uw2KL76Z5GY7vp0HPvDJXV0h2bb1ZfKkRNHIv4
         IdHA==
X-Forwarded-Encrypted: i=1; AJvYcCUaXkE+6uke2n4kyKrnYVqHK5D25ar+mcStURXNL5f4oA39ey181NEkrAvQJLnPCdsNeSO+dqUrKzG7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi+zNsNG3vFMGXC+GcRlvbJsRVCZfGB4/GZZLhjjKh0tbiR8+L
	kPRwzg3VAlqp/BoWYBcYGIUTdw1exouSN8jQfi/COxpnggttHkWUqcUgNC4t+ZpWP4g=
X-Gm-Gg: ATEYQzw6CzumXEcsgkFHSzNVnj69/nLSp+OoBSsGikAyUBa4y6qbnmoEEJGs+02Hc45
	xkcU7pnlIg3eH67nxPsKvFDnTN62fEs7E3rWSMdeyHiBg3Fww5wU3XQMILJHDJtjwSumXNWw0ro
	i8YpExEIDN++G/GyPKgs7NjSrZFOG3cHONNN5cOTC3Ej07EMLcSlxdUV95fKuuuJZfDL0nY7R9Z
	Zzh75+cdvt/kqWgVhENKFVU+jONqVpdMDPM2ZUx6w/sW6nPidfz1nZOMyIzYK+9CMqq3H2zQcoh
	Xei9PMTqpd1ZUib4mJhyookXef3q40YtAQddvLAne1RM04cfjsgaZbiHv+jhMjryoTI5N9PieKQ
	ggTRRAdP8cZ+a9FoXYDnuYCk1K6OAeSehLIXCi2WmY0l45vBmkAg7+vAsOFqx8YYmPrXQ3KWeGK
	tgDtaNg0IDnxlgfHh2gkGHCdsZa1YLQFqbxHEtE+cSpEvWqzJp5nGu0GXD0LTXIqzjtR4Idac/o
	IlRa95mQI1cR2Oim0RRoUYmzcY=
X-Received: by 2002:a05:600c:871a:b0:485:3bc7:a224 with SMTP id 5b1f17b1804b1-4853bc7b582mr27768635e9.6.1773060979410;
        Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm26118577f8f.28.2026.03.09.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Date: Mon, 9 Mar 2026 13:56:10 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309135610.1f81d2df@mordecai>
In-Reply-To: <20260305123641.164164-2-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
	<20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Mar 2026 13:36:40 +0100
Jiri Pirko <jiri@resnulli.us> wrote:

> From: Jiri Pirko <jiri@nvidia.com>
> 
> Current CC designs don't place a vIOMMU in front of untrusted devices.
> Instead, the DMA API forces all untrusted device DMA through swiotlb
> bounce buffers (is_swiotlb_force_bounce()) which copies data into
> decrypted memory on behalf of the device.
> 
> When a caller has already arranged for the memory to be decrypted
> via set_memory_decrypted(), the DMA API needs to know so it can map
> directly using the unencrypted physical address rather than bounce
> buffering. Following the pattern of DMA_ATTR_MMIO, add
> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
> caller knows what kind of memory it has and must inform the DMA API
> for it to work correctly.
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
> v1->v2:
> - rebased on top of recent dma-mapping-fixes
> ---
>  include/linux/dma-mapping.h |  6 ++++++
>  include/trace/events/dma.h  |  3 ++-
>  kernel/dma/direct.h         | 14 +++++++++++---
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 29973baa0581..ae3d85e494ec 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -85,6 +85,12 @@
>   * a cacheline must have this attribute for this to be considered safe.
>   */
>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
> +/*
> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> + * (shared) for confidential computing guests. The caller must have
> + * called set_memory_decrypted(). A struct page is required.
> + */
> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)

I don't want to start a bikeshedding discussion, so if everyone else
likes this name, let's keep it. But maybe the "_CC" (meaning
Confidential Comptuing) is not necessary. IIUC it's the same concept as
set_page_encrypted(), set_page_decrypted(), which does not refer to
CoCo either.

Just my two cents
Petr T
