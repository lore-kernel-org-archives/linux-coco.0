Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA142365A1A
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775104904; cv=pass; b=iDisnj816DeBevINbJ8v6QeCM5nW7DELSEZx0HxxfsKHmOsbjXnEdNGx8EYlnGbNDnu0lFhE1h05EoGk54z0UXlVT3hAHUCWiH9N0qIeLg5mFW7Ru462ENM6YZw5zox8HAYvgHsZhxSw24hB+molnLkBwXYsBGZUSTpaj6Z4qgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775104904; c=relaxed/simple;
	bh=8M0uK/dY9UfmR0xcTfEk17ugbKg+8eIoSDrEidIpkIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMAx5Oo9YZ2EOQWYr0vWvb/2hKu2yak71lwtaXlsbjF3A/cALNPnulg+3CdCcb+aPu5Y816Nv+YxtlpiavOlP6iJL2/zgzauTtMdIoihWbXpvpZvN5B5xKkAmdJGT7jADBXvs06NSs072TUsvKkWrIdbxSeFnGKS5JCKrCOu4eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAkA1lFS; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAkA1lFS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b980b35534eso275405566b.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Apr 2026 21:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775104901; cv=none;
        d=google.com; s=arc-20240605;
        b=SFCxTnFfS2+ARvGPK3jBwug1LmgY4XV2XgkDaWn8toQdqty8uE0MejxFnsu0LWf74F
         hqgFWQ3yuHWySvrJhAgDWlVfnpsqj+N7CMfXS2Yvuwv+gzq3CwHIP4vI2UG8TxD1Glc8
         hOIa+EW+kmGFtFM7vNeu9IRTX7B0VqFpiqFNYr6v1Vm6Wv1GLwhI0s0/YG4HqqzNl6ru
         fezoXCZ8MTjVcxP7ipcTtS/2McIsP4vTxDZVE7oHo6EQB+mYLBsGRJ9vPCxcWzR5/KUV
         7kHuXhjhgYRbiN4FBs9HNL/ovx5Zw71S32dHJJpsc497X3dpkC+pBotjREyM40p937GZ
         9nmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        fh=OrZy0hDaymL+b/tSLwraLQI9cfBRpiieLv17K5SH9Y4=;
        b=WbwhYNK0P1AQxdnQCxX6WXspgtL8CYmTfuNVEJnYHHKkjWQ4xas9Iintn00m7LcBcu
         KnIqrgxV2F1zaHLTcVWJHdXMTB16n5AAvVGpapoC8pGnJLWNHua+3pvdPbk2FJe0Pn7v
         GmC95sVexrHYE3oYIe6W0S2i+/Kf+HSau86fJMiQXkH39+zVPK4NqzhOqP93uMtOrr87
         chEx/A+W3gffA3ltNq4E+/90zqBfOig5QIAGQGJEa0HjMbTNbFFPgH0HJdyzESq1r99v
         ld/wQl5FUJeMHPGSTRgCWUSQPgkL6Iqcdq3lLB4La2tRdZcQLrCD3iM1xEqZqARFmcmT
         HYlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775104901; x=1775709701; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        b=bAkA1lFSIdqefpMgJ8gLEiUfxvU+W0yJECb/eEtUaCSEH2+HJQwKOBvhWVf0sf6WeV
         SLfp9mAMV5HxbbLogy+3rwwalVM7JZ2cPfYG770STZFnwrBP36gZP006xFN6ffHtLEb+
         rNwsOXUEJdgu+i3tMRWGeXLchFW3emmhdJI60fcsWoixF1erS5u3tl5vJKcX+DG8RG/A
         nr87VhPryhj0T4c5cgKCyWJ6t0hSW6NKy0AQe2xGeKKI9/cuHfVGfmgK8ZLtK3fLdrXJ
         Yv7C4n6raODhKNgJM2VNgDnzn8WC9/R35bYinncMBkzaP1T/uLz2O74KyvLZAQHzlGqT
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775104901; x=1775709701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        b=IZ5ETLRiYQ5pQ29lAsgje5qsI87OXCmlNvEt2/nS9qaPfeseUsyaNnj3lCjIaooTg9
         Z4f9teCes+xpZrOHrqMc5E7iMXn9M7AxqhAEiWuG877Evz+xHROZigrSLLMG0Czbm8qp
         g82o0YlMlg27r2KFiOQ/EczQVzY0tl7/CNPQpmtytpP+TcZR/OsZX0dljKSp2CLWitxS
         Nd/OKlhm2aV/A+rELiPZUgak3bkBigd/yA9fCu4+ZGE1Zh6GJBNj2yYr+qzwIROD4ZqU
         dyRPSTuxDx/+dWCXxAUcbRxN04J1Waiem78y79RfHTFWSGRN9+0DyvWITIZbkXtVS/h8
         6VnA==
X-Forwarded-Encrypted: i=1; AJvYcCWhCRt6P3vqnkLB2SPodTDIzhCInyu+3iEdfzFbKnMNtd5fDeUXsDS1TVnRco45I2K1mCuIqXl2upWK@lists.linux.dev
X-Gm-Message-State: AOJu0YyMjqKHIckHZWkvD155DlSeVJXwsVu59y4TPP5rIw3ykb1Rd0Q0
	j/WrDntfk6jFXI7HCN8UKw2Lef7xIbruTK4/l8KenWH0OIiM+iNSxRWLP1uKMGbkBITM6XpOYmo
	CMTXtc3i5YGltgG+W4BwkNFp9HRNapkn5KJt0nkQxQw==
X-Gm-Gg: ATEYQzwUyKcyVhHnW0iRXuVdVVnQcA57Q3EHQ1qm1bFJKyPerCWt22+yvbyL0x5w4Xt
	+/4N4cjsQGrEXKR9BFfpKXrxqqAsiYM2CLy5C4BkUDnpQPH5Fth9fyaY0XX2YgrGrOGzdR/Q7yu
	shix+uZrcrjkO+H/NRxoVU/llU43T6BFJdivxcSRuHt7ACU3ssiIxs1tIlgopiVyVsrx6VUahw2
	U7SSnVMuTr7b+JM4JBaybFAVC9C0srNHkcYRz5w7c3CFA+Zn9t9mFevRBbn04Qv/74t5LNm9HZi
	CvB3cqzFSvbwc8lVaiJDhB4+jMeg69Awv1vdJ+c=
X-Received: by 2002:a17:907:8694:b0:b93:8275:795a with SMTP id
 a640c23a62f3a-b9c46fedc2cmr44691666b.15.1775104901064; Wed, 01 Apr 2026
 21:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325192352.437608-1-jiri@resnulli.us>
In-Reply-To: <20260325192352.437608-1-jiri@resnulli.us>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 2 Apr 2026 10:11:29 +0530
X-Gm-Features: AQROBzCoqOVd8w8IT8q-wzhadg7W4rdnhn-HGLlu-Tm0fuk9WqMGP5WDrs9ZghY
Message-ID: <CAO_48GEUXpcFBiyJAMgTcGPSq56-mZ0qnO3FrFRM2LoGd8W6HA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Jiri,

On Thu, 26 Mar 2026 at 00:53, Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> run with private/encrypted memory which creates a challenge
> for devices that do not support DMA to it (no TDISP support).
>
> For kernel-only DMA operations, swiotlb bounce buffering provides a
> transparent solution by copying data through shared memory.
> However, the only way to get this memory into userspace is via the DMA
> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> the use of the memory to a single DMA device, and is incompatible with
> pin_user_pages().
>
> These limitations are particularly problematic for the RDMA subsystem
> which makes heavy use of pin_user_pages() and expects flexible memory
> usage between many different DMA devices.
>
> This patch series enables userspace to explicitly request shared
> (decrypted) memory allocations from new dma-buf system_cc_shared heap.
> Userspace can mmap this memory and pass the dma-buf fd to other
> existing importers such as RDMA or DRM devices to access the
> memory. The DMA API is improved to allow the dma heap exporter to DMA
> map the shared memory to each importing device.

Thank you for the patch series, it looks good to me.

Marek, if you are ok, please could you take it through your tree, with my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Best,
Sumit.
>
> Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d
>
> Jiri Pirko (2):
>   dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
>   dma-buf: heaps: system: add system_cc_shared heap for explicitly
>     shared memory
>
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  include/linux/dma-mapping.h         |  10 +++
>  include/trace/events/dma.h          |   3 +-
>  kernel/dma/direct.h                 |  14 +++-
>  kernel/dma/mapping.c                |  13 +++-
>  5 files changed, 132 insertions(+), 11 deletions(-)
>
> --
> 2.51.1
>
