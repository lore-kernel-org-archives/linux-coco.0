Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFA330663
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753944; cv=pass; b=IeA7SbrP6o21dC3crl59Dw8ac474+I/3OZo497obqAb09mnZxaO/fSa5al6wH6IrdIIYIejn3Pvz7DjdVRfqu5rklqzK6PVcaZJ9Zq7w2NrgO8NNttghkncDYtcxhRV3zhd9TOKpN/ERs/T0Zrxo02WdwgZsIc4Y1i5nHH5qe6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753944; c=relaxed/simple;
	bh=FjgzgAFhvlP8wZ+0kqVUcsibosrCr2odjKDIt5RjDY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQQnfVvuRZ8TJzTs4iwylbmBb2P8ztTvmE9+XI6pR+2gJj/3OKTG3qBcgShWoCh6fwenTIRY7RVb3o24zU2LNwBc6aNKNMAZTQZoEfbsdf7K97Zoc+cbU+J6JwXg6rDvzv87NV6G3ipGcQaoTlQKZLZEVT/fiW+tqOfuZtlNrlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqLr1BoK; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqLr1BoK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6594382a264so8385203a12.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 12:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770753941; cv=none;
        d=google.com; s=arc-20240605;
        b=IBvFwaGuZ/ckqglcmtO874dZeiumWtY5EPGzHAt37j7mAkDGQXxs8UPFvaJxrM+zYb
         KkIJ80HYiXoKNQj+UFbfiU6/4NOTIFyX09ohMDkODe9Iwr+Cttc6xDOwSShdbF73weDI
         JWZUxa8DG3hyXEE/NX1vYAAdEc/rWWZi1oxud6+cktRoumGDN20qeMOHhdH9eJpQq6/x
         OG7FoAeEVnFSs3OkKKv1Qaj7fAEHWPIqG9D/MmX5WYQEHEctMdMAhLat7D9CMVAqoiMr
         /5H/VqrSEdxzpvCrJTNCZ5rlgOYDf7I98OFThYBPC/63jTKyRso5jf3DhtNa5ItKs2ST
         E2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        fh=n16KIoX+QVajEuqK7mRsc4n1WYTgMiLQDapEo91YXZs=;
        b=HIX6RzVg4U8V0vyrwfGPfrqVTRgyUoBLrzRfx6SbHYnbnfpH577hQNJb9KRHVFTprd
         Te0v+crsfrciY5l7dUKXiACPJWz5WZt17BNzk2Ymi/4UAD62Cl2Ume5iXDcFXjfVZ0aX
         ldNYHqy0zd711RI1EwZO80wvTWgnPaJtVyZrfld3hqQCVq4pfUcYpGBP2MJSqmAlSwh/
         16ZRup/qhmY1AnHiYq3ecK9/jWxhrY6lMnMgeYRUUsb11q4n5LgCsMc5T1PJO8TnsnN+
         BFtwugDU12yhQ+OECe7lQPtetVDuI8p3bwtpGl3atIdMRd2481qo78sT5jZJy6xz01U6
         ogvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770753941; x=1771358741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        b=QqLr1BoKOhN2KxyeFfcTqEMIKhUfWgVlEEArXxpaEeHU0hmXYZD6nMfDIKrGuRM3Vx
         rbKiufW82yBb/4pKq7rfiu/pbPy4tgVvDcykTyr6RFCkAkI2ucScu1uQB0wR1GCBXIOV
         VeLlSqZwv6tGGPrrhNMSHXNYP+PjIerfyTWr282/gZpwGN7uYKsittPrfwWs+gtWQm0l
         wTw+hIQLpLBouQUr+79ykf81Pp8mNc2FH0J/CTKeq+Ul+aX1l0Yzfcr4kUQLAVqqY5BQ
         UBwYmUSmogI05+CqFlwsahxKq+zRv2X/Hq2yf5OPd1oMfgf9kWe+iJvZFdOWD/yot9Gj
         4OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770753941; x=1771358741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        b=Rv04Mufb2Y0UGvP41ZAZvUNEa9e3mco5ieRy5J0FsnZjZZj7qrwVEb+Wff4+0swNmu
         TckaGNBGPa6ubp7PhfownKt7gPKJgvGpR0KQmJBvg9mwFsATBn503i8RYhiy8+d99/LE
         PIrTCZQf0i4AOpe6iNToMLCvA6kBgARZektVKVy8z5op1bAMqj7FOWCcD9iLBtzjoTB8
         HOVNBlq9iPCe+jJulstNYGz6BE4b/X9Z2o5jqbA8VEmwLZR8pQhvykdfCZMzCAc4pXei
         dbk93il3FEyBm/N6M9r0y/btDGGBTtMwi8KomotDzTQ5dizG4Rqcxa3os+XcsH1mGl0a
         afww==
X-Forwarded-Encrypted: i=1; AJvYcCWlJS2lapyrpDHEtpDUPtF3AeOifH4XFbjgtoqgdz6OKtc4WznIyEIqOJxznpMnFCgF4XKioqwgYe3P@lists.linux.dev
X-Gm-Message-State: AOJu0YwUt+/gTZPsZxlKKMN1pDfP5zBDHgmUSzkzA5cJ1h1ErPF8pDbH
	YN7Ty6Ksg1f71Xj7H2xzEJtVQc/137DQKWhdr/ipvE2shg3sI0RolyaNjvXlzwr5/eaMU7/xAVf
	2saebTn6EGPFYuXT/P3Seou6owDUQfu9zx39WwIk=
X-Gm-Gg: AZuq6aIwrqaxeK5UTvjj4metodkCRw5syWrxQ4Uf6DfuOecr1GmgcyvEkBbb4rUxumZ
	nWwU1N+vKPzmv68ujjlmX4aDPyzvd8TEsFx3sSuBFquwSlVyp3hA5N0fCbQFRda4UnXjgGl+Icb
	tvTsvTztJJ9JWtwQ6Ij8kiRUmIH0G/l/16DODPVOS+0D3EF4GBRl0nQZ9wNC53FZJ/7rIaNfIWv
	UMFIWlUnvOUpkDOC18GNn0TKnHQc0RuuktqRg38Ef62teZlAE/VpXDgXu0pQrXlLQLgWHbxngPR
	ZkS5cdxK/YXPz8gUjrfDwcCVfShvNlU4vxYV
X-Received: by 2002:a17:907:720d:b0:b88:48ba:cd7 with SMTP id
 a640c23a62f3a-b8f6a8e0786mr22320766b.3.1770753940692; Tue, 10 Feb 2026
 12:05:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us> <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq> <20260210124819.GC12887@unreal>
In-Reply-To: <20260210124819.GC12887@unreal>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Feb 2026 12:05:28 -0800
X-Gm-Features: AZwV_Qgy-DNinnCzC9ZTU6U_Twqy09ClMg2rE0gJxLuPqw6IHh5sTKTnvXMZwaA
Message-ID: <CANDhNCoaYoe5Ckin9CnZT2LdQJ2K7amBSUS9GBDzbx_1=U9txw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 4:48=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
> On Tue, Feb 10, 2026 at 10:05:14AM +0100, Jiri Pirko wrote:
> > Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
> > >On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> w=
rote:
> > >>
> > >> From: Jiri Pirko <jiri@nvidia.com>
> > >>
> > >> Currently the flags, which are unused, are validated for all heaps.
> > >> Since the follow-up patch introduces a flag valid for only one of th=
e
> > >> heaps, allow to specify the valid flags per-heap.
> > >
> > >I'm not really in this space anymore, so take my feedback with a grain=
 of salt.
> > >
> > >While the heap allocate flags argument is unused, it was intended to
> > >be used for generic allocation flags that would apply to all or at
> > >least a wide majority of heaps.
> > >
> > >It was definitely not added to allow for per-heap or heap specific
> > >flags (as this patch tries to utilize it). That was the mess we had
> > >with ION driver that we were trying to avoid.
> > >
> > >The intent of dma-buf heaps is to try to abstract all the different
> > >device memory constraints so there only needs to be a [usage] ->
> > >[heap] mapping, and otherwise userland can be generalized so that it
> > >doesn't need to be re-written to work with different devices/memory
> > >types.  Adding heap-specific allocation flags prevents that
> > >generalization.
> > >
> > >So instead of adding heap specific flags, the general advice has been
> > >to add a separate heap name for the flag property.
> >
> > Right, my original idea was to add a separate heap. Then I spotted the
> > flags and seemed like a great fit. Was not aware or the history or
> > original intention. Would be probably good to document it for
> > future generations.
> >
> > So instead of flag, I will add heap named something
> > like "system_cc_decrypted" to implement this.
>
> It is problematic to expose a user=E2=80=91visible API that depends on a =
name.
> Such a design limits our ability to extend the functionality in the
> future, should new use cases arise.

Yes, how userland chooses a heap name is an open problem.

 The difficulty is that userland is the only thing that knows what
devices the buffer will be shared (and this knowledge may be
incomplete if userland passes a buffer between processes) with, so it
has to pick.  But the kernel doesn't give it a way to solve the
constraints of what memory types work with what devices. There have
been some proposals for device sysfs directories to have links to heap
types they support, but that also requires every driver to understand
every heap type. And then you get to the fact that performance is what
folks really want, not compatibility and that may require some system
specific knowledge to decide.

The working solution right now is to have the system provide a  [use]
-> [heap] mapping for a specific system.

I think of this as similar to the vfs and /etc/fstab. So /home/ might
be /dev/sdb1 on one device or dev/sda1 on another.  You need some
system specific configuration.

In Android, this mapping is done by Gralloc, so buffers are requested
for a use and then Gralloc decides which heap to allocated from.

Unfortunately there doesn't seem to be a similar standard convention
elsewhere.  And I'll admit even then the enumeration of uses/pipelines
in some general form is also difficult problem (and is somewhat more
bounded for Android).

thanks
-john
