Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBCB3F65FC
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354493; cv=pass; b=AiHFwvEsZThkkAu8FSE/Ah4pSlQmAKBIlwZh84PXnjDowKNjk0YBE/Z0cF46Gj2mGk5v7mvs3D0YCxU359VaLof93seo63+VR2U5AGtkgjLVlG/k5XCqU8POyPgrGPUztFu3Xgh1dUMs0+4YryU2Ukwrb6QJipA/yyGIvwuictw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354493; c=relaxed/simple;
	bh=Bt0GjCbdHErDh2NSInWIxmaigd4B1HrIivlH1Nponi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZD1wL0VGZvp36sE1eQtRiKGQaIwAkJWXEpBzkRcm4lX49MySw0jXmoC+tVsb6LFfSfivOkX5nEApvO1jBzR2RmrbNf47EBZMli2K1DTxl+USsJnbsN1rbFC7Lk6QRKNTqT9DYA0UoYKVVVlQMLSO524JIF5Q/Yg8yC1nfDbQp9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vK976bhD; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vK976bhD"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5091ed02c54so395621cf.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 05:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774354488; cv=none;
        d=google.com; s=arc-20240605;
        b=JMgwPyugBGp7/6PvGjJ6lDc+G2tTq5oZPL9HfRu/tcGURCsmO3BL/+Dc9sSp5gV29X
         6C8v2vwV7LY4d+m7mxjUF+tddRYpNFsiY8BTfDHDgaVc2DIpUWJb5ghy8nCuWyCs2Lb1
         XVufNobFt9KK7Qpn2JuUj/VVMVmdQMakWYVzdmRPJgNXtI0nSq3hZuUC9jMEHtm7iw/I
         6a7RWtMI0gcFojDBkcIF8oSg3bWAsbYgkqMk7u8CscAdbMt58nxQZstBRPk/51raNs2M
         QxPoTpKpjn4pj9TWQKr/fqaalUUpyWlygu/xpahWDPUuW60dpZ8TvDNR+zn4CvKMn56G
         SkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        fh=fxG55DeUVMuvYtADorRGZFgMv+aV3+GmzSvGD6ZFqj8=;
        b=CrOaWB05z5zbbcunNsTHPGu7madq/OZDkuR33gI0WyRkwGxn3lQQZjQ+UbSyqU/y7f
         Q84EaDnC6j7S7BNZeDJsXGdqqDFk8hV+Zpy6D+zCK4E9tErAJM4HJ7wzQpQKM7Um/YAG
         CA7LOmxPpxRXBAYnRq7ocLyvt6YykCrNRF8K/lZ3JifkD9csieC2no7svqiLZAqdDcim
         bYlKvhbmpXUg311x+7AGnZbtVHA+Smqb44u3G0oFcJilKg7b7KM8eTpbEMb1S5nDL6fp
         Oms3kAZ9apscbaYyjhmQBZJfAes1gcO5Y5Leo0Am0RZHcD16LX81cQYsiI347mAMeKvD
         3Cpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774354488; x=1774959288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        b=vK976bhDMauajwDfgAFK/yaaPDbVh9iLIDldYjys1zoI5n7CuEKCiRaH2zKow6+QXg
         qgeXU7lsxgG2VEG/13rF/L+hSGXUi9o+JeUmuuRiurzarx2aG60/Dxn+IICmSmvGALSf
         4ACE7B6QLt/kPxf7tmInKpKFsEDUISermFtR6GxfvPs7rNUWmILg9GJ2OHoDCnyTjVq3
         dQ7V4AC8QrDfFRvGPxFy3TMW3a0quqaNpBN0+xBzGUmFBEzhJm9GZPqg9q7x/jbheVZx
         o68G9PfqIBL0RLs66JV/NijzAaWnXem8gHN0RVnjQezI6FCJIiF86zotSr4vigKQYH+2
         F/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354488; x=1774959288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        b=QXiXI9pxqiYrpTWAKSZgy9+uwxvcRDWs7lYm1GW65b2U4wfZ3QhkAtlHVH3ObrUDI6
         641bGrHCQhIVbhIqasBimeUXpnJO8MrO7IDFFItxvoSSXtyxnITHG0uXDPjNb9UqxdV3
         qjF6iVSkQam0UOhx1TgeEVguR8BwSCQsENQBsiX1EEkZKdETEPdhQFQ2jCDEH/ZKG9DC
         iSBKaw2lXK//9zdFG7w5iwWoi0LJwojhceDIO3wuypXRVEw8NmhvW1Bcz1eWgiJ9rzPT
         olJ9haso72bT864oYdoqPNZ8+dQKkIJTXKeyxug7nAXMANZwsCYHIdO/XZv6IFudGYKn
         61qw==
X-Forwarded-Encrypted: i=1; AJvYcCVMQuYBZ3NFl5465tYqVnLH1nlZuZXA4QuLHHusLBBL2buKSOocx/phxebtSvO1gDuJBPRqPXSnigxO@lists.linux.dev
X-Gm-Message-State: AOJu0YwOZxDXBXeQT7ac8JUI22vdwC88Is6YpLnhd/MQnqM97Wv8sv2C
	wt6zgBX4oHIHG+//YGkvuZWjyxtzdcs4F9voibPz+SvOcwZqnqbKDyMfGh6wLPU5zEHSKn//K68
	Y3fJRiSWbdgbI1ONMeFXBXsIuuls/g/pW42qwpKjp
X-Gm-Gg: ATEYQzx0qHmARxdifAG39CcqiR6IhpTEbkP/xVCjhT8VDb0wdU2rtUF9Y3Fq2RYrKuK
	m8RHCfIQGBF8r3sulmxoZ5s4+CtYQu1i/uyBOq0gMLJX9b6vpfm8g+PTG+rGm5ej/iPAGG8h6oy
	L5ZXg0LZaLWkhTQVjGDfEeWjFc+ByQbTuzUE+EfTBpIrvVZ0cnUiSmweS+DLTK1AECiqjIolgLu
	4c/PUSKI8q8I3218rgdyXT/YrZKb8JIxTH0dgNhr4ZsLvkUL2iwpTMeVWYZonSp2RYub/qzJVqF
	A5wommAdYu9yke1lxGy+NO+ppMXKeK0JLJLxU3if
X-Received: by 2002:a05:622a:514e:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50b6fbd1411mr15608601cf.8.1774354488033; Tue, 24 Mar 2026
 05:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca>
In-Reply-To: <20260324120057.GC8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 12:14:36 +0000
X-Gm-Features: AQROBzDTh0ODj4C3lU1UM-hZHPuBDyd64_bmAvFt0-7PB-OKq8PhbYOrLNqJZ2s
Message-ID: <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 12:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:
>
> > On the other hand, for restricted-dma, the memory decryption is deep
> > in the DMA direct memory allocation and the DMA API callers (for ex
> > virtio drivers) are clueless about it and can=E2=80=99t pass any attrs.
> > My proposal was specific to restricted-dma and won=E2=80=99t work for y=
our case.
>
> How is this any different from CC?
>
> If the device cannot dma to "encrypted" memory, whatever that means
> for you, then the DMA API:
>  - Makes dma alloc coherent return "decrypted" memory, and the built
>    in mapping of coherent memory knows about this
>  - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory
>
> There is no need for something like virtio drivers to be aware of
> any of this.
>
> On the other hand if the driver deliberately allocates decrypted
> memory without using DMA API alloc coherent then it knows it did it
> and can pass the flag to map it.
>

The problem is that the DMA API currently gets confused by this; it
can end up double decrypting the memory or using the wrong functions
as mentioned in [1]
In addition to the complexity it adds to the already complicated DMA
code. I don't have a strong opinion on how to solve this, but I
believe we need clear boundaries (and wrappers) for cases where memory
encryption is expected as it is starting to spill into the kernel.

[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com=
/

Thanks,
Mostafa


> > I am wondering if the kernel should have a more solid, unified method
> > for identifying already-decrypted memory instead. Perhaps we need a
> > way for the DMA API to natively recognize the encryption state of a
> > physical page (working alongside force_dma_unencrypted(dev)), rather
> > than relying on caller-provided attributes?
>
> Definately not, we do not want the DMA API inspecting things like
> this.
>
> Jason
