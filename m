Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50A3E5EC1
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373797; cv=pass; b=Ad2PlPWxf2isFwVqgvg5zmyzjJyLGPn1NAFouo95//7hNYTVrFDGiKiqUywnZWQBBg2cpupYJ02EIsK8RwiWpk4qzzcvC1DOCrZwPVvIZcd5cwD0wJaJ1y9862h3frteDNWZ4OF/MAVrNGnR9A6I2qzqkwAybp6vex2i+qPVc4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373797; c=relaxed/simple;
	bh=QKH3FIlHUJB8Q1byrwVmEses+K6AxcmCpK6mo9PTNmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okj0d0uzW+ZRfjK0rcOcpuccAB5kcapJwqiKcfAxSjebTaRyiWUfKBwNc56X/KjZb7oL25MFMQzDtNf4SrB+YbbcxDMg99qldUPj24C/YcNtgBp22TkxQ3uQgaDWPb2W4+v51m5lcMyA76V4dnQ2BkwcOBbOZZX7qbPxWJxLkiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYjK2GX+; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYjK2GX+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509069a7a7fso42041cf.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 10:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774373795; cv=none;
        d=google.com; s=arc-20240605;
        b=bU9ushIPq38iN81jyzCxrre0t6mmtNRaDHewweqR2yK+TfSkv02Ve9waqZC64RyjHY
         x2wFrKIKp8fKXyaaSVYYPRQmqR6L3TfVJCrCVTXbbOsJp2dguPdeLZfsbwY9V3zd/L5Z
         lXE96t7DnbtI9ybbri5KgRpHqBDv7zpTb19yCxiTE452sidEwVtly15CMDRKThIqxsQw
         M8CMO9x/+aHxfanoordQYBGs5+24k0ud/pH/GeOgmZKYN32luPsIcbWviuFsBWsyFuWG
         intPRMuI/JNWPNneHqMDfO5Spl9Yt78pZVW6VXU/pd66P2i2uszzVLTDvp64XQxdObua
         cILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        fh=/tzr9ImKv/v1GyJvQOaiGAlSM/1PU3B6dDjcD5nxwnU=;
        b=cQ9XERzrTj45+NxQtLKPcqyfQTkAONGd0z0Xp7g4ghkDB5unom/PwVsGkr8UW9IRxw
         46VLW2NV2a48JIE3jy4fbc3BnJzOfL0nS97S6on4yHJGwBwg1+VUxlOl3IeSo57qOGtN
         0kq6bV44iCSi3m8kOL1wIRsq7cY2RBIuGaVJUHBgpNMgxRuUhog8CRUrwuMc5WYOzrm9
         W5gn8x3u0lvyOaqHf5IedgUONI6oe9ugB/oRhhqfazzRNf0GRUeot8gj5wktp/BuxSrf
         2m8/1YYf+Pk6JP5tEFaTkWlqrC7hH9MtIfw6kmlX5B6cDlTH3H5u5WcLnarFAJ/kzKDH
         y91g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774373795; x=1774978595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        b=GYjK2GX+LXIlRx4zjtv6IPyBkm6DbjHr1Aevwm/sUV7EEtg7fhxginGiR99OFAc16G
         9TqmWvj/6CupkmMmjXQwlLfmE23b001Kwyftn2d8n8TE/c/uSZFX3UZya9YHSt5EGHcm
         YnwVIbn4GNZUjWXQoORVw1eHMQIkLdZ8Dxge6C1p1+Xe+plLrcj2QQrz3VJgBk/Tus4y
         U5boXrsm64PAwKNv/QfIL1NHgunXroI6J5BOuzjGewO85jG2cuUWjz1FpekpezlaWbeP
         Tafh0Y6bJ+cK/OWuwVcQxzEIjFFeZ94Ju0iTxDOpuLqbf+EQMGP1Csw7xSjrbKdNHLaD
         feSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373795; x=1774978595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7cRZZnHlvElmV5E4d+ARimoSvXKMR3JQuoEi7NRgdM=;
        b=qXmpWOJPtux3fQ0QPe5eriiQRkSgPDtnyBf0pTGOpu3aXM+fqg/d4OOUvjHRu/kNui
         USZTLnqqxOA2veNv1lKyqkwE4UXh9wHhpcp/oll5tFpf27EaGybv1jCu5cwjGxN8Sjda
         zLkTe/M4xuRLGLAZVuqaHx6mdV/wG6rAuG9FFshmY3yvSXOtjUFsdsBmtx/AaVfvSiBV
         S515ClI2trS9m6bHB65H7hlhIGvV7TzvRgtJQlG40sE5RdSrgBu8kxOLzg6GpustiSiK
         x4ZDOy14aQzPaTodOq4LY//jw26vuHDEzjv+tDIm1ghSDTSXvlo5NzR+23yvv13e/lUZ
         M06Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo/ofjADvhnWdhew+M7VPY6Gk8peQUhZcwfDhEDH+AsBjvWVlm5FEzHDVeqtS95vQ+HPZuIEYCT2ce@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9SnTwP2jtwkCKv16Afa3/z7NVX7Mn4/l5QbfD1qQRek2yqg+S
	NWm7FYtj3MGN8RDs133kouHxiFTgcEm15mH3s/gkB2MmQ46pTQsPitvcRtC0W8XErGqwMCbqkd+
	MMRGjkyyp+JlT4hmG17E99qiEqNry9J5C/ATtwQz0
X-Gm-Gg: ATEYQzz+iQcq7c1L9GA+wGCslRxQgsZgZJWSgn+4G9YvSQl9N8hMSnughhtuAqsz3wh
	TbdXCcNKZ5v6H2xwW3MGIkLSDGVjlcW4bN4PYXTLMXqyrQBlQnI7GhjbTPQBO4Dj4SXRyLD8roO
	6FwkM1f6Q35xAzRco28nNR25PfmcjLAjz58SVOgEmUV5C2pMSa6gaylYOi0N9D6TPurN/1HyHZQ
	XLoptclstbdwk1ZEKGdSuPc++EOwL1P0xtwqKZKcBoqMtQz8M91zTjiskLRuMovExxMM+/IQJbu
	4aiC3fRbBmyogSZ30eAO2SpPfuV6RdEwXLd4f6g=
X-Received: by 2002:ac8:5a41:0:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-50b823fa2ddmr354431cf.15.1774373794536; Tue, 24 Mar 2026
 10:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca> <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca>
In-Reply-To: <20260324122416.GD8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 17:36:23 +0000
X-Gm-Features: AaiRm51PAsNGUjv3vtee5YHklYnd6tfPfqFJtrYrMATN4cWFgoB-kqA4e1zQENQ
Message-ID: <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
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

On Tue, Mar 24, 2026 at 12:24=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Tue, Mar 24, 2026 at 12:14:36PM +0000, Mostafa Saleh wrote:
> > On Tue, Mar 24, 2026 at 12:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca>=
 wrote:
> > >
> > > On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:
> > >
> > > > On the other hand, for restricted-dma, the memory decryption is dee=
p
> > > > in the DMA direct memory allocation and the DMA API callers (for ex
> > > > virtio drivers) are clueless about it and can=E2=80=99t pass any at=
trs.
> > > > My proposal was specific to restricted-dma and won=E2=80=99t work f=
or your case.
> > >
> > > How is this any different from CC?
> > >
> > > If the device cannot dma to "encrypted" memory, whatever that means
> > > for you, then the DMA API:
> > >  - Makes dma alloc coherent return "decrypted" memory, and the built
> > >    in mapping of coherent memory knows about this
> > >  - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory
> > >
> > > There is no need for something like virtio drivers to be aware of
> > > any of this.
> > >
> > > On the other hand if the driver deliberately allocates decrypted
> > > memory without using DMA API alloc coherent then it knows it did it
> > > and can pass the flag to map it.
> > >
> >
> > The problem is that the DMA API currently gets confused by this; it
> > can end up double decrypting the memory or using the wrong functions
> > as mentioned in [1]
>
> I fully belive there are bugs, but the API design is sound. If you use
> the coherent allocations from the DMA API then it knows decryption has
> happened when it generates a dma_addr_t and there should be no issue.
>
> Now, if drivers are using the DMA API wrong, like trying to double map
> coherent allocations then they are broken. I also would not be
> surprised to find cases like this.
>

But it's not about drivers in that case, it's about many places
(SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
ownership so in some cases they step on each other's toes, and I don't
think that will get simpler with yet another caller in this series

I am fine with the API design you mentioned, but I believe that it
needs clear documentation specifying who is responsible for
decryption. The code should provide wrappers checking for these cases
instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
everywhere in DMA-direct.

Thanks,
Mostafa

> Jason
