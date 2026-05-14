Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B63D8108
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745995; cv=pass; b=o9u8EFkqKl01x7Fbc57dyDu4FKdkAiLdxHgZ04xkTglYK3c2gNdsVU80HZy4syK+4vaPHK7JeGIE1XK9wJF25PavFZ7h6VzcN2Cv/eFZu7TcASjPf6lx506diVPd2wAW0JStY/0ZTTib9M5boWmEGKAXng7xKpVpt5kIYDs8HU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745995; c=relaxed/simple;
	bh=kULtJx0tmeW4GuTbqeswULlbN9hTWpiDyjj2wWWYuV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4T2/hjhnDe/XxQRi503QB8/bYg5C4msrmVdN7GzeGpJdgCo40YYeF1p/P4hlW+qEpJLrNU8dMPGtZAKpj1B4LUAq6bzkLDL3r6ybFGeGUDcxJOA6snHp1ic6q13OPz2oYiKhl2lph6GHj5Ze4RxvyW3HeiS8UuWZFZ3HNlgLXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qavM5TvW; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qavM5TvW"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d6b393d60so378981cf.0
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 01:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778745993; cv=none;
        d=google.com; s=arc-20240605;
        b=eK97RIAO4Qz/xHsr0WUA6k76U9Y49Ho8VCWZPYoUFFWBwTiHj+pZFEkSOkpmUC/myT
         F8WWDj0aeB+gqvzhJ8QSzqmxLgyZSHCOfwkdk8p0/FNvNDqd3EuGqabua33N3MgwI26K
         pajkqY1w3YyeGXDOyglwGcGqYJLocSp/8kFlw3Yg1Oob6VOmYbrNnscoZEm+0+Xse0zi
         uwbLAQqnIMtVqp2reDLvK1lrHF9WC/2gjNP3hQ7gKvmdSRVchpt2CrNc+97WgV2ddPO5
         eequKWZIMlXdjIxKLFy5xAR9ozlY4wuZRx7Jr8HeqZBVmSAewR0/XueGQneKfVh9TCd9
         6CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        fh=1qjppnGycuIKlV+xE8uPFUkEbftS/+oVoYlGZZ1PCCk=;
        b=gUA+tzdfvdmt4HPOKrkpKIm3WTrFLtcQqeO+3ptNOY3ypk4XMXiu0irYHIgKhCqE4z
         +meFyZ/XmhoDP7omZCJYj70oohgz4BZrxDWC/k014DPni6YZJRtBFpKgQekhRrH5841o
         ZJK9H4ZSdeNowA7Jdi5LDdad7P8AnTeiUwdXTCR3AWH/jNhVswPvwc8xKPHZGb1+WNqt
         aeURA9pIiets+ThoxoxZJB1QDD7iiPRndUieQ5Cb+/6+17NxunbZdOye0CfoPlqvCV1w
         doKChUvcU0wWifI2Y7E0KJbvb3N+GiEy/a7FKeW+hnQO7RRq1jZ1tzHvjSklo9Qs5MJY
         Tt2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778745993; x=1779350793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        b=qavM5TvWvaWdy7WubL1SCeyXCQPOwoHZIGQY6toa+71z/VqPwopBO/0YITyCam1hXb
         ua18FY5fRrK6rCPtQBzSTLVobAr+VoDpKpJnwX+u/pJ16IdZtGcXKb1Q7HxCL78HO28R
         C//md1vJg8qOt42Us0SQZAFInDd5WMSnOfnnBM2vVlrhXpYJ6qUNWhfPxq5GOpqgmCI6
         HQ9N5k2uy2xxsDvujGCexyeS7ksSk126E0kj5SVLAHkYDNmTxpdRSdQO5K5iPWkqzrA/
         TG+Ssf0gcndprHybuc0LXHhuPZL2K9TyUhiLPPVhSCrtzmUMkvqQfdLSSfGAsBeMvmM5
         NO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745993; x=1779350793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        b=Kgk3eItyyNwN+GlK0zGaOZDhz6JM5F6e8/9LVBzVfQypKcESGMrv1+bDPKUjaE0Icq
         x9WBWHpWsC/7/dLVyY7Zn49YZYPo8NagXsN8DWll1rlP4e0onbzFKCIBLOE710FNpfnb
         uwJ4RriWphIu57ph5f7Kw8mSdeEEdzG8HNMjjVAz0HbmU/FEGDOkg8kSKsUtinhsDNbW
         SaBRLeH8OPGN6CdPqJUyXvP0xX1szV2s3/O2aS+okYFXN4b2CxMxU3s8QKOJASKyW+3T
         s6ObOIH/Z8YJ4Q5sR3nmHoLJjQEiilxdsh17SVPqx4KaxAGIKEVP5V4RLdhIv/aSkBiG
         Oi2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/Y1YIRV7e/IBwQG3LJPgx5Fi64fAxLhbKS8UdM7TO8qzJZC37T1z10VKUJZNToivtxJUH2hWXwtTL@lists.linux.dev
X-Gm-Message-State: AOJu0YyxCI2tBNiJemQxZfK51yKh7upCXucuUJCCVAd5vcU9k3gONeFO
	re7Kl+6olrCD0yML6uJovvQy1um96NulN9+7XH9F1Zxe09jLnArkT2hRHCiex66WP810G8JXBhO
	1nQYyatdJKUotOEOv/oiEvL3nHVtkbCRKEjTcl5Yo
X-Gm-Gg: Acq92OFDf8qT7Cf9zY8PyN+4crPkjC4OeYRuSB6dzhXBU6VhnRbP3YAviqUpjKYhNLO
	qwyXS4SR/tWB00q+qxcwCUX0shZ5W1d7OKX0TrPCzzshRAoKRomikS4y7IPIz/ETRL9wzSWE50Q
	vz7lD2BdHUJRVF6e7p0xai2aO/0ybAYWKrP5fTnSmWrjaItuBa0r87qTHnjQMLhdEXikpr7cI2u
	mmtIcZJiDuJ8lRTSXR38mJPxUzzdmvd7FGk/jEbkBp/zFBrUNns7A1PefmfoIhwa818/Y9CGeN9
	XU4h8sHS+DSkw6Ir9pcjnwwxF2AJ51im3Zg7q1L4aDwKfZWx
X-Received: by 2002:a05:622a:9007:b0:50e:6360:96e with SMTP id
 d75a77b69052e-516420a4ecdmr12032231cf.0.1778745992401; Thu, 14 May 2026
 01:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-4-aneesh.kumar@kernel.org> <agSED6BdSXBhbDYI@google.com>
 <yq5abjeia315.fsf@kernel.org>
In-Reply-To: <yq5abjeia315.fsf@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 14 May 2026 09:06:19 +0100
X-Gm-Features: AVHnY4KFUT_Q3ProEjcPRlzXFAyPmNH0RBADajCyGfb0sF72QbGsmq65dFwn1XU
Message-ID: <CAFgf54qB0msUdKakDvh7hp0r5kokPV0vohBxUjkOz7sR1FZNuw@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] dma-pool: track decrypted atomic pools and
 select them via attrs
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 8:01=E2=80=AFAM Aneesh Kumar K.V
<aneesh.kumar@kernel.org> wrote:
>
> Mostafa Saleh <smostafa@google.com> writes:
>
> ...
>
> >>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> >> -            void **cpu_addr, gfp_t gfp,
> >> +            void **cpu_addr, gfp_t gfp, unsigned long attrs,
> >>              bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t=
))
> >>  {
> >> -    struct gen_pool *pool =3D NULL;
> >> +    struct dma_gen_pool *dma_pool =3D NULL;
> >>      struct page *page;
> >>      bool pool_found =3D false;
> >>
> >> -    while ((pool =3D dma_guess_pool(pool, gfp))) {
> >> +    while ((dma_pool =3D dma_guess_pool(dma_pool, gfp))) {
> >> +
> >> +            if (dma_pool->unencrypted !=3D !!(attrs & DMA_ATTR_CC_SHA=
RED))
> >> +                    continue;
> >> +
> >
> > nit: If we fail to find a matching pool, a slightly misleading message
> > is printed as pool_found =3D false
> >
>
> The message printed is
>
>         WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));
>
> That is correct, isn=E2=80=99t it? The kernel failed to find a pool with =
the
> correct encryption attribute. For example, the request was for an
> encrypted allocation from the pool, but no encrypted pool was available.
>

Sure, I=E2=80=99d prefer a clearer print in that case, especially since tha=
t=E2=80=99s new code:
=E2=80=9COnly {encrypted/decrypted} pool found for a {encrypted/decrypted} =
alloction=E2=80=9D

But no strong opinion.

Thanks,
Mostafa



> >
> >>              pool_found =3D true;
> >> -            page =3D __dma_alloc_from_pool(dev, size, pool, cpu_addr,
> >> +            page =3D __dma_alloc_from_pool(dev, size, dma_pool->pool,=
 cpu_addr,
> >>                                           phys_addr_ok);
> >>              if (page)
> >>                      return page;
> >> @@ -296,12 +345,14 @@ struct page *dma_alloc_from_pool(struct device *=
dev, size_t size,
>
> -aneesh
