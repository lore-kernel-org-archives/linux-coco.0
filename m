Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB9416CF9
	for <linux-coco@lists.linux.dev>; Tue,  9 Jun 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012680; cv=none; b=TpWXASuoVHRYKElnuY/0WTw8herzPbMuUDK39zXWI4yjscqz36/4dfaAFudJvEDTzsIZWSbcajswB2g9banfA5n2I6uwaFnyK1qbg7FdyYKXEP9Lzcs8ns2BlC+aF07rDV+08SXUk2Nj6K8qmkzvZT17PyzHRvA0jnUCyYTmszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012680; c=relaxed/simple;
	bh=De9dpWLqJDkTwPqqIvLBYIkFXDqvYTvryiNP3i+XxAA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQeqvRDUGf82BYtDfpAC83w4ekQ3cztLG3tKsnyr700t3wdvBesA+fnZwEhrKvfgnk26B3ImwnZv3dgO55hCkDDrqqW5AXJQL5GF9x0RQ/Pdp4Jv+LeXth2HkVVd1Ne5bCZzIqYoVlHvd5RIweYDzJqVkcUyTf22t+tkpG2Vl3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MVtSYkw6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MVtSYkw6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ee224f5fdso576537f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 09 Jun 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781012677; x=1781617477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l00W81UYsyqDsSVEFT5iHHagCSaGJS6VwfSu9rBGR+c=;
        b=MVtSYkw6Bti2PLxWtUzOt8QMCPfGEiHgd+SZFHmlDz22isaz5oRF/iX5F1W6QnWrfT
         NxrVtIBWPZbyJdB5/4NJzp6Ed9833sxBZxUSCP0s5/T9krX6IEihJcU3BlZ0plsaEgIX
         lf0Ol3cvkFET/nZDdcdpiOFqq6tA8GLuRgOX5n+wIl3F0gNuDYUf2s9KoX0sqxzR4Pec
         QktDNjBg+of5Lpq1eWlVj8aOFJsvISW9f4KUARUBr9Xwvc2rGVRx7e54AvNbDOnDHCcA
         ahI7y5nhc+3/3wiLHcKaBNIrwNn6bEddezOSCA/oFdBN4lA4duygoNc0r/beb41vLc0W
         PqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012677; x=1781617477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l00W81UYsyqDsSVEFT5iHHagCSaGJS6VwfSu9rBGR+c=;
        b=COA73VIH2JLeBcQd24lQJNsLEsK/GR2c/9Xo/jPSb0962o7g9OHzEJzzY37LhlsULb
         ic+SusMsMQKDxO/Uug7+Z8U+CG9SfcHC+1Ez/1arh2aBAeihxt09cFTc1ENS7m4g+QaD
         Coion5ZafCDUTuTwUmoWogHEmBKJFg0faLUfuwNNWRxu2o3OlN6WRov8uyI8fINuKWN0
         vGPpCyf6oaHIYrCfhQ6qG0q0QDO2mmU8Q9JWiGMy1esleGHvzCYDvGy0r3wOn7wed929
         c3xpR1AwYl0i96m7c0VOB0J+uJcNIGtU69v2uTBnteOWS7vUAjJXNhjPaTsMd9iXRx0m
         mkYg==
X-Forwarded-Encrypted: i=1; AFNElJ+5qUyJmhnXbmkLpnJh9gABqRrfMZd5kuZS/yuhD1+zYFkcYja2TZV2hFTJTVOwKa69pmzS7EK6RF/H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Zx0262bMhJpo9Kl+b+9pQcSwktjXID7mee+3vL2m3UQHylMN
	ERqCK6pss6s4adCeigsIiRfIIN3TvMVdtI1xSkD2uGtrHR1/YzDh6vpBrJCsbKESICw=
X-Gm-Gg: Acq92OH7y5yVG4uJiIm3OJBEdUIoyVw/yFdzQuA0ivRMTmrp5dkcjNwpA+O0xtyhspr
	pQ87kB8SKqjBRfp5qsmB8JygioKPJqg8R5cdPq2yeljOTEHY1NAKE0p1gXGiGWhJrqx8eE4gpjX
	ploGqGkz5Z5tlB3uebEAVEMHMv+mbYKa7Iu7OSYPnK7GDTMIGWD7Su52jd7EFH8XC7CMJ6CMCup
	fL/oaO/Pyv75gNQ/n4CVnoGfbrNyt6zYfhsQkjZrXRskAMGxZLYeZ48jj6ktTGXH30AfspEkp4J
	3kF7IootcLh0r5VHWVruqXOpd5S18HtZk1nGsaeps+FHmYFoJvkzLEwIuoPClIfIt4JvvxLliG1
	72R+gMWNzIc47ZcficLW5yQz3S9xQRwa5nAyFYoVdlO/NSQNX5FXdRmq+S88frjz6E1dbqwcitK
	T4h0izuh/5/tmAWR8p992ENuJZDqIM/dzofQ==
X-Received: by 2002:a05:6000:715:b0:441:1c35:4b79 with SMTP id ffacd0b85a97d-4603076f62bmr12393402f8f.8.1781012676663;
        Tue, 09 Jun 2026 06:44:36 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm66805957f8f.36.2026.06.09.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:44:36 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:44:34 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 20/20] swiotlb: remove unused SWIOTLB_FORCE flag
Message-ID: <20260609154434.13dba7b9@mordecai>
In-Reply-To: <20260604083959.1265923-21-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-21-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 14:09:59 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> SWIOTLB_FORCE has no remaining in-tree users. Forced bouncing is now
> controlled through the swiotlb=force command line option via
> swiotlb_force_bounce.
> 
> Remove the unused flag and simplify the force_bounce initialization.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h | 1 -
>  kernel/dma/swiotlb.c    | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 526f82e9da45..af88ca7182f4 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -15,7 +15,6 @@ struct page;
>  struct scatterlist;
>  
>  #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
> -#define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
>  #define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */

These constants are kernel-internal, so let's not leave a hole in the
bitmask... I mean, what about changing SWIOTLB_ANY to (1 << 1) after
you remove SWIOTLB_FORCE?

Other than that, LGTM.

I consider this whole series a big step towards saner handling of
encrypted/decrypted memory for DMA buffers. Thank you for your effort!

Petr T

>  
>  /*
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index e4bd8c9eaeda..81cc4928e949 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -400,8 +400,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  	if (swiotlb_force_disable)
>  		return;
>  
> -	io_tlb_default_mem.force_bounce =
> -		swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
> +	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
>  
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>  	if (!remap)

