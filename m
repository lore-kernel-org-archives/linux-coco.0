Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BA2512C8
	for <linux-coco@lists.linux.dev>; Mon,  6 Apr 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506849; cv=pass; b=Ze5C4k6Ial01Lwf2niwLnZyoyWjA8j04eJiRuNkXm9V21FxMOQkO7cc9GiVCNBAaY364YuMs0zMYX2uc/nIZNOkycs1FGvVdnocvgqDeZOyIS602hGM328yeo4p1YpNuXXLkMWB5R+JDKLmyZkHfxz9xme/d2WFqINl77t83cys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506849; c=relaxed/simple;
	bh=Io1U+2H98QfGuSNNSPp+Om8lrtZl2OSidEXkxdnTsLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im40s0VTQCmhHOj/fxqwrvh4RNxbMAZuLGs6L58Uvq3qG3RB+8vDQv7DDe7gDwUF8LEczv/EXyxSAzlmbfywkAzujq0buZP8XJPLnww6qJBcYrQzHAUasKYXsxE0x60mFEIRKsPly0eMuRyG4f0rV9Y7vZiMD3BnNZ0vW5oYjrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHNWpX/I; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHNWpX/I"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so199785e9.1
        for <linux-coco@lists.linux.dev>; Mon, 06 Apr 2026 13:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775506846; cv=none;
        d=google.com; s=arc-20240605;
        b=aQ67YleB8iCI7mi92t06aD39WNcHyAPEjCVMXw5c+cK4BG0xWkpH7K9mYnq9aGnVX/
         n9InjVfLvJuaF17Q6tESvH4vHSKVi44wQlvk49w81StjvOkPc8AY41p66JQn5YVDI7H+
         zIVnj9tR9kbKWJXBHsn/tcIar3QQcqjB9f+FnDCjWDxFp77uDKrMbA5sFY8urG3YKs6F
         sidq4/ArBlXheDxtTpPEGF+k5OETFe3yYC/3OlOBUp0eRwQ5WWQEK3SP+Sn6SpWYXJgC
         HYNtHMRcmZDYy/aIB0H5J0/mL5P6a/YfSspXZWqcfI/PaNiYoxv7Ek92cEEs7oavoP0x
         MTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        fh=S+j0792Ky4fLXYw8LXKPRqQYSCf6DjvoQu/Mkv+bGGg=;
        b=QBnP2VefgsAUXJZe0TqcqDuv2pajJe9LCK53KcFEwnUyX6vlI9HYBXO25LhNmkTADa
         SUr0m8r4Vg0LR8WrfKm1kMFIhmoGLyL6S+4jTi3f79fZ6jHWZV0bXNfjHibUNQCe1iIO
         K7qTMnzste5N0Gws3ysrVvM0cS8uTMAr5g8XBW4K43ze4hNj74gKWb6g6KcHSNTFG8zp
         1nrj3CXyzEsEpvb6OL6cLr0/gg/TpGQBvQ6Hg65BZl2KtLbDrbgzoaQrO2Gxs8EF2Te5
         ZIKAtcPfmqGiqyj+ep6uWo5CY9MOFt52JwLKS2YqcJbwM3pJfrB11R8mb4ufz2JIaGzu
         rqrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775506846; x=1776111646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        b=WHNWpX/II57I/OHGOky863sAzLjJHU1C7hjGlvVqP50IQpsrBUWdIKXUKSS/2vCb3P
         i6oXUGczBjHLIRFG+zE/sdyj2xXNu00aJg27DA2DV8AXyDIZ1Ud5+SbOeLEgmYx43xk4
         r8sx1ul68sa2Vuj749zi6bJeYY53Yz0svIsMvFQogpqMjgzHyi9pAB6uPejw5PpCv8RL
         ynq5uPUejdPgIZlDZN5nbc7ko2gIVDp5eSSq9d92iwLEnzs9/7tT3VZ8JB/WUYb2DqCw
         rLJJVbX8q4pJhvd4KOeP9cjAZDVIhzkkjNzNHk3u/kOV1FRbCg27oh30SUbGUM2IUs8W
         5iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506846; x=1776111646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAq+hiOQoaI832cP+7lQvu5renHjvWZOnK9BIt/n8bg=;
        b=hCFGFlujILQe5tSkxlJqgkcYWnBww0DEA+YguBHEPgY6x/WzX+6WgW3IAx2KdEse6M
         yemHpxOzROLiwts+ZybxtGC+aFKuJcV6WU2LYhFdYymHoEXM0xAVoSha+b6wh27MqNWG
         71RvzjGn4PFSZ/s74Q19h2xpbBuyJOpd2D3wDyzHWz/Uecm7z9OVRYvt17Zmy0JybzjH
         84VN6RyYC73wW72AYmydzNG1P4haun/80Xbln1JbifMuopWJVZ3qJb9mDCMmkOuSHGo0
         SxpfF3+pzVemhFd6aE8n+KN0l0FNULdZcLQpNdRiM0W3gHXu7sKfy0dNhpOGcrZvS4th
         M4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUEqAB2dV4bzPt7pAn3bnyuAmzcRcFcedOr0EQsi46YSyYEyCF3JwrdImSoUN8L15TaQCT8GHx572CW@lists.linux.dev
X-Gm-Message-State: AOJu0YyZK+T4TStKkFYCkanfxPh4hbJ6Tt1V8ntL6gDYFsmPlZWARnjg
	qkAV3qT8Jg84f7QH0FdtqKxR5/3bdca2QR8kKWscNGh3xsfOagT7pLhvr5qRp2Y2Pf2lU5zIAbW
	RSAb6v8fU48iJjutPz3V3rysunVhbIDev3t9MjRia
X-Gm-Gg: AeBDievwmsuXYRSsG7fjftROKx536sQNL/uBo7ssc/9fMzW1jjboCb4QnDHHPrh+6ei
	lYtPwQOYQ1YUX3FQEw2cPWO2gG/RoQNhznIT5m0KNMqWOmOTDpPZfxOc/QI4yOjXqBXvm3N/MTA
	D3kUksLvGv+mxlDJXPTt6fGfnAGpy2ZHLz2njYo8yG7eGeMa9YfFoTx+jsIUv1qIea/wbtAStNH
	i6oAqCpfqqT9enxi1qbMpvcfMFkkIUvRhFzp6B7xEF5WvRfiojmWATTP0Zg3NaICXVOGWcSpEwT
	W7sJQb99RZpjSQ/Md0Sbc19XkxUp3XtgBp+qbw==
X-Received: by 2002:a05:600c:6b19:b0:477:86fd:fb47 with SMTP id
 5b1f17b1804b1-4889a458061mr2963095e9.8.1775506845674; Mon, 06 Apr 2026
 13:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402141103.598495-1-jiri@resnulli.us>
In-Reply-To: <20260402141103.598495-1-jiri@resnulli.us>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 6 Apr 2026 13:20:33 -0700
X-Gm-Features: AQROBzBphM-pvVrX6rS78TlEjxwdox4kg-mNa-24N1cUfIDHIUevXFcYB-smPLY
Message-ID: <CABdmKX3N70j8ZZs5DNhx6fhRi=Aa_+2xY1JHcW+uDoaV2+Sngw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: system: document system_cc_shared heap
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 7:11=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Document the system_cc_shared dma-buf heap that was introduced
> recently. Describe its purpose, availability conditions and
> relation to confidential computing VMs.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 05445c83b79a..591732393e7d 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -16,6 +16,14 @@ following heaps:
>
>   - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s.
>
> + - The ``system_cc_shared`` heap allocates virtually contiguous, cacheab=
le,
> +   buffers using shared (decrypted) memory. It is only present on
> +   confidential computing (CoCo) VMs where memory encryption is active
> +   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
> +   bit cleared, making them accessible for device DMA without TDISP
> +   support. On non-CoCo VMs configurations, this heap is

"non-CoCo VM configurations"

> +   not registered.

Doesn't seem like you need to wrap this line.

with that: Reviewed-by: T.J.Mercier <tjmercier@google.com>

> +
>   - The ``default_cma_region`` heap allocates physically contiguous,
>     cacheable, buffers. Only present if a CMA region is present. Such a
>     region is usually created either through the kernel commandline

Each paragraph starting with '-' confused me for a second there. Those
aren't part of the diff. :)
