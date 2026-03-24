Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF03A3E69
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377150; cv=pass; b=VqyLMPmypIMhhhbyR9QB74vCgvuS4Ad6szdrTkB3J6Ou1yo149hPdKbKH/1oK9YSwfHvbw8/5TXjrA9QUfpDO59X7uDw/UZ1AfjERcyRNrYUrYoXQX+dH53u24LHcvMmQPxvHaNvG1bXH5BrlZPGniG8Tl4Kl2cEv4jNqPbLcpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377150; c=relaxed/simple;
	bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRKBTI4AUPHVxOK4L4yRXKl2EE5A2sxBO89CPQwdETB5T3P0m+CtAuksJniRSOxJVLbQBYB+H6e8rWRjldtLOc1jiYj7FJ7ExYiZJYppYmtjcNSpbyIxdsyapFo5i/D6k0ABzJ71TiUz+FKJnz2JLvXcg3aM1Xs9K58r22o6uqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojdPX08b; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojdPX08b"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5091ed02c54so59051cf.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774377148; cv=none;
        d=google.com; s=arc-20240605;
        b=Ms+PJlkALuge8Ss4cNy7Dhe30MlBd9zH+G2Vq2mOW/TFMdsmJtHiFaICtjiE47RJGr
         eyVHO2kn0TTL0IQjgYK1iHwrYxljAPxZU+1wVeX79ey0Q9Sspa+2ZWUAj06WOE3HBu3Q
         nzonvNpXUk7RkEMtqx1tWCSVPyiueVTMMTyhJrHft8Z5dMJkOB/f8zgaCzzyj+rybsUj
         RCQgdOJMOqXRjluDdBKTqMstbk0sNUtdRRXyOf2xIjbQ3naZw+mvsuSUoLkQXWGifyS+
         YMI2l4AfkMManz2XY14PKIpgRfeq3grbgRKvkeCC7Uatr317rI9VoM3C8zvFanbdRzYd
         0aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        fh=cBUjJ4w5+cj76UXmIoTqNGfxQi9nSIADHufVqoMGmQE=;
        b=El1564xqzWiFPUuG8qk4ViMWZ5swTX1NCqvasV7a7zhvu2RSbRzs9ojx/aK+EDtntz
         iJaaV2wO10Q94mlsFFGq5uDNChEJ4P6gons6KBLaTp+1xZnDDVF3A00XnACd7CJLNRxu
         KzHThQmG8QXAg2ST4BLQHio73PaaADmW4OrI/dViyuIbGqAGAlHWDMGw0EBGdR0KWiWE
         ZZ1rgobN5bede80Q2pE4CcrHf4XEmF5AKeqKBwxOp8TGjtxWxSjsoWQM8r29Wa0ixyBe
         yUM8N3VSPSqM5dQ0GQa4Va803kPmkqHUZFHu8il6PfGNu5+PLLoZaFlodqtfPKA8VHMN
         /Lsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774377148; x=1774981948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        b=ojdPX08beXR96hNkwnFnQ2MMVb1dqzh5JK+NRHax00dA81SEYR358z1ws+fE1Yog9Y
         bQVjdFvol+Lr8zCaIKI8TFZwLrfFel/hNzdW2gg+f6aex7mkwsCb3ZMPPDqxehd3yBbU
         rJDIdlB0+Uwqm/Oo4h7RB+WEgZTFXDsuP1lBat48KHBv711+i8eq9Xz4Fbo6aot1A/nf
         m0cfHoAYKKy3XzKgEUmul0LajhN2lRWNcs3UCd2zl2IxUrkZhr60koNBUO8gHwZVFdJ6
         VrQLgCr9FVCoFNsHCiRsTg3MMbPQityCKusCXmCv1ynRFmjRdZg6HSRgrej+Hbna2GQB
         59Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377148; x=1774981948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=capQ/2P6O0wzFj3JGECHvmPV76dOzNCALYeUIxrihD8=;
        b=OXULHVM+2SXCdmDmt6B5hxkj5dr4vP0kTTMFxa6vkKY/D4OjvWv0yddO5JRWfFoUoQ
         26KHH6eZ5JsEmkOFPBNokIYsX284y77p7Mz9eS3Y5wqep1k71zYFlxpkmOJsIZ4Ej15C
         C7y068ntUvJv2vB7mGNqlbZ6BLgXWypLg91GhIFAuDc6AFJ0Uz5JFz7aLdJYh/aIayTh
         R46wpI4uOOJ36hWfRgGzZIQgOOMr955bROriOV10pxfNhXEpyxX+TWUZOax0QPLuVLGH
         Cswev60vnCt3HhlOE1kslwvOH5lCapZq9khbBE3/fk5PV+nNh8TXPN/yLoRdiJEFJVAg
         kMxA==
X-Forwarded-Encrypted: i=1; AJvYcCUZtA9PijV+QG85uhswv//NhhP5RkDe0WF0iJALegV0KbbMZlRvhgWEQ3qJIph7SO8AgwwHHS+N73rt@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn3wFMg/w+KWaELN8iSRdi/KMKtWpe6MVsGYIp00U74u4m8SFP
	emTnKbTwuBgKukE3auL6u7HilByjgXf+bx2gjGah9/NeZe3csnTGdLxYJrhcsYkb0Mua05eoBRZ
	9eLUjQCowyw0OfNaPDVd/SSWgakUSb46gwDUdmZjC
X-Gm-Gg: ATEYQzwmBOFhF5e7fmL2RWQW2sjVgNdkBNj58W/FVr8Kxygh5C+3MCmvqBCY3uvIWMb
	1TPAuPmqKHWXD1bbX3NC7jbmpeduUwrQBW0sxA5nYt3NWJpppWMGA/bPiUO8vMq/1lh4CqerRyK
	xhLZQuR7Cji5296TIHjDte7Wnv82wXQo+aWPvdx6aKPiwUqN/QRpECf+vFSpOrTmTJN7Lalnw92
	LdD7g34JCOM4+sVsLw3skxat1+vBv3UulMMLmBHiUasOTfcI9fc1iInV9NBu8jHUS9lAUp60B8X
	Be8TJW2GVKxOGpi6z+V7e6ZPGH9Jjmrzx1BlByQ=
X-Received: by 2002:a05:622a:a94a:20b0:509:14f0:bff2 with SMTP id
 d75a77b69052e-50b8221e273mr1541411cf.12.1774377147169; Tue, 24 Mar 2026
 11:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca> <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca> <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
 <20260324175717.GE8437@ziepe.ca>
In-Reply-To: <20260324175717.GE8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 18:32:16 +0000
X-Gm-Features: AQROBzDqJGwLGVWhhqLuGOrSUtCUROoHSgJZU7HhysiSVnX9qJjxIyI0nzG2rDw
Message-ID: <CAFgf54pB1pikjtx588khBAXDg4vHne+tJL6gBqF64buX0K93mQ@mail.gmail.com>
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

On Tue, Mar 24, 2026 at 5:57=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Mar 24, 2026 at 05:36:23PM +0000, Mostafa Saleh wrote:
> > But it's not about drivers in that case, it's about many places
> > (SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
> > ownership so in some cases they step on each other's toes, and I don't
> > think that will get simpler with yet another caller in this series
>
> I don't understand how this can be, ownership is clear. SWIOTLB owns
> the buffer, dma alloc coherent owns the buffer, user owns the
> buffer. There should be no other cases, and they don't step on each
> other unless the APIs are being used wrong.
>

Logically, that's the case, but the DMA-direct code currently loses
this information and assumes it can encrypt/decrypt any memory even
the SWIOTLB one.
That's what I am fixing in my series. When I respin, I can try to
introduce some more helpers around that to make it easier to integrate
new cases.

Thanks,
Mostafa

> > I am fine with the API design you mentioned, but I believe that it
> > needs clear documentation specifying who is responsible for
> > decryption. The code should provide wrappers checking for these cases
> > instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
> > everywhere in DMA-direct.
>
> Redoingt how dma-api works internally is some other project... It
> would be nice if swiotlb would sort of recursively DMA map using the
> new flag instead of open coding it but that is pretty minor.
>
> Jason
