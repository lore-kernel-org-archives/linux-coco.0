Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793202008;
	b=pQ7v/cvgQxAl3P9nULC2RT/VR7SU7i05hBafNjoGHqjAfpIfQz6aaNXiafxaDrwTQTPa
	 bvDRJfhoisrdI7HUAE/fXrpJkIMugT1W+WpH/YHaAycNHrkvIfZIwXPhJHz85VZdFZmhU
	 LNFJDCX2P8uBhS7+9U2gRMFG+RVWsspokjQdPwgPBYBYivEVkAPgQkhrfIFCWKHwsaBHL
	 lkBRmUmq7HJcDi15yt1cs/3RtSK/L8nxYXutyACRaM0EVYjUrn8CrAMpKAsuYcM8wiGYd
	 iPwTu9kU4TD2+WhbXdKyEZr3Y9qtMvu5iogtfN/TSREjTPMQex2xxOpb4G2F0+v/qqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
	b=QVOZ7kh3MKsrYgY+LYKzK9iCZwwIxMe0h+vRK2aFtEpCw9wOIPbF4JbgH2M+TidU0Gin
	 6zsfgpma0Fk1xr8seiEqkhVwTpasoSbF0BAAUFudo/tVThkbn/pHV8QroNqEg2n+x0YKi
	 l6S8qe3aEL84PgH/NmbuMBVkqI4+XUH3IOiFBh3KWLYJA0hiRFBx8Q8VqVqEtLrLBMK+A
	 AVW1zhfM8Dr0af4LwT6zSgU41Ibesve/EtmtLDs3Qso59xV1y1TT6vOoQvcv85c14/DCH
	 0FFvgOmmOfyvfD8eOEnlp1cYYD07b/CowobMIR35THTOe8WabO83dcU3j+K3QoRNadw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B+Uj2jxJ;
	arc=fail smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D59606A322
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 15:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D59606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B+Uj2jxJ
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c450ab1483cso172267966b.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 08:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202006; cv=none;
        d=google.com; s=arc-20260327;
        b=d42TqFVQ+wbKoi8rjc3Ooh0DbP9CzO/8eNE+O8ezqjfPiyAzKvRAtmHITzddSjYsXn
         zTWqPDPLoIfy+lwCsFz2QuJQQiSaJYlfW8+GCFJcOiXy+m764DvODwJX+8j1R0TzfOX0
         BMfVyGLRSQuVh+uq+Mywg26oa8cRBm99+U1GmhXk9Sscabk/ZNGOYsGCx65OpI5+I591
         BfKtXrKiUipJRWEoHQmrOYuuLXRUSydjpN21sP/nc3syeufAEIOInqMVmiTTuwrwyFco
         eT6ObL/hwqbzUtcGtdRKeXEEQUTZQItmPT9Z5aD5d7R84Fr7JJMqBoOMnQTYHJskAaJy
         o0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        fh=mr1PoyoLJEou919VcwufQO5ocsB3OJE9t6jW79rvzTM=;
        b=GvDew6LqwnLaGr/F84v8RPnczCE7pkMJI16m/z5B09C0fZFMnBu+R8Pjqx5GZg/zI6
         IVd/8b6wuFtZyqA/9lRRz5Q7iBagyQ9GMtj1IGvVYzeNJqFMsXYkEXoHpJr3ALQs6GOX
         P7IRonoJNEBtVL+XJiMA+7m0KThEJEnc/3ErE8bkwR3uKE7ikJKycOQvUj3An50AVJF9
         29NkULE/mlTMZbFTX9r0qTn/yHzXRz7NFsG+7XyXAnyZR/gXalJ9kOtSMZh1wZHoqwRk
         RNadFNGWUt/kNl6wZvws07WfSfz6rw6DeGOdJIPVLYCssXjTlD6VknVJ17CvR77PsmS0
         OvBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793202006; x=1793806806; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        b=B+Uj2jxJSJ8CknYYFVI0jCysTuf3YExrOhBc+gN4vatjrQDJqil9Mq7z41jeqSPSlD
         9ha20TMB160wRmDuP1V12/jKxr8aV8B9sHL95eoikwOdhZ4h4YjGwFXD1S7S2nz/7Nys
         3JVaPkPGn8WZvjq1vqz1gDcSjihMfzqabRjNmO4qo0D8C13n4qIy+s96SGTIDmZtkvDr
         NiAsjyKkKLweOxDFNCDoMG95XxU5Vam+ZVacRKMEd04Zfrc6ofsD31wUB4ZLzWEMO60T
         VTNb3z1+5TW8Va7QF0MVo0Jwlmg+hRv/kW0d399K8ubZdJbmNpcx6IaQiOTySL9GUhRU
         HwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202006; x=1793806806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L3UJe+6XjER+KzlgRD/7xotzxSyGvuQzLO/yjOCn+Q=;
        b=pnuDcAUlZ38p17Z5d0ieZrgKzj7wAjnbKzfAgRqTS9m8tVnJkZy0SiRfOhW3vzbxnQ
         bHEVacPyeufexeKEnoKEPdnaw8obkYIgBeCE0AVvSyLHIgGKJUE8XFPd32hsaNQYuluq
         KJK+b2Oxqq6L7sAoM6Z/2dvUfRdCVhE85aIwfxix+ADqpU8pl+yrc4uYvhKkAK/vH+Dp
         idiQJQA4apxJajYjUME4nmUEAT5x1jZ2XohjQqVbVN3sDNpiA8qio7g8HPtVa5xX/bHS
         rnsk3rsqVnkO38Oh8lkJrShZsXodEZqnAvhsGnngE6MOOYZjCZ8JcUZ5xws81VviFExe
         GB7g==
X-Forwarded-Encrypted: i=1; AKwUvBzccRKVvKXPezbFuO1ZbaRjtGNFyJVKor1F/ORKJjaIHuMEJlbr+4ru387GHlUzZcLYV0n2VOKAyJak@lists.linux.dev
X-Gm-Message-State: AFq9FYILJ/5TpwCLGNIZDjZYvsEtGCeYGOb2nzVQtHfyElfMelh4G2T4
	DVkUvuuGdrLpJszIhwKQbNL7+lQhKbNjFxW06zknouwVYqDXNkvkOeDxtyCbJm0F51QOMtDJYbQ
	VzQuQpFbo+rpHG9zJxCGKGQ7+OGrH8oH6VfhAyJBt
X-Gm-Gg: AYBFou0v/OzNfjXNd8R736dBqxILTY5tF3oK0DXxgIgIjo9q01U5M5GlP+BoZZS+BBE
	fTYgZSDFQ/73O5hZrVinnlbgKFGskN0wiAPid0WzrjqBiC6EOBDYrW1z6WAFoFG3MjhuC1RbSMv
	MU+vDeCj6EpwbGcSJbR5ZTJB+BSCwdm6un5oPuKHCtL1ypJgJcsbmYr7rUQtPG69HI/h4rsfRNi
	AxQZueGduIborTqh+flWEq0TtcHHEAdHw71uxCnSCDLhyNBYooJt1vaReNuUFMwkE4Y2tYNrTXy
	BjFA35OJucaqZmz1g4wbUsvnBiVH6vCh+Y8h7FuEDYwk/8zCJ4JoKwPE6hLhncFMvrvyxahJmEQ
	2seeYXB9NSI3DVX7JaVIiIzIc1K52TjQlQo540oICcCmIqaeZIWqOQR2SBIM77bWFfw==
X-Received: by 2002:a17:906:9f86:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c49bdfecbf3mr243566066b.30.1793202005586; Wed, 28 Oct 2026
 08:40:05 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027025616.1632690-11-kevinloughlin@google.com> <20261027052057-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027052057-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:39:50 -0700
X-Gm-Features: AclHuK_MLzRdQo76ylDi6PC5wwAQyJcXzBectQ_iPw892kOlvxApU7OSZmy7jAE
Message-ID: <CAGdbjmJjBp4WPqkWs0KNLpH2ve+Q+y26yOg1PO4TJHwKfu1uZw@mail.gmail.com>
Subject: Re: [PATCH 10/13] virtio_balloon: add higher-order page inflation
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:35=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 02:56:13AM +0000, Kevin Loughlin wrote:
> > In confidential computing guests requiring page state transitions,
> > unaccepted memory tracking operates at the EFI unaccepted memory unit
> > granularity (typically 2MB / order 9 on x86). Inflating the balloon
> > with 4KB pages would prevent unaccepting the backing 2MB unit.
> >
> > Inflate balloon pages at unaccepted_memory_order() when
> > virtballoon_cc_needs_state_transition() is true, while retaining
> > order-0 allocations for non-CoCo guests and CoCo guests that do not
> > use unaccepted memory transitions. When a higher-order balloon page
> > spans more 4KB balloon PFNs than VIRTIO_BALLOON_ARRAY_PFNS_MAX (256),
> > transmit its PFNs to the host in VIRTIO_BALLOON_ARRAY_PFNS_MAX chunks.
> >
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
>
> I'm not too happy that this rides on the legacy PFN thing
> which is after all limited to 44 bit addresses.
>
> And given it is passing around 2MB chunks, then one 16 byte descriptor
> covering all of 2MB would actually be more efficient than 512 4-byte
> PFNs.

Agreed. I debated initially doing this in a single descriptor but was
trying to avoid also needing VMM changes.

Regardless, after reading yours and David's comments, I honestly think
it's better to just drop the legacy inflate/deflate and only include
the free page reporting functionality if we end up adding some form of
CoCo ballooning support. Beyond being inefficient-at-best here and
potentially making fragmentation worse as you noted in another
comment, the legacy inflate/deflate path is the biggest source of
bloat in the mm/ side of changes for this series.

> > ---
> >  drivers/virtio/virtio_balloon.c | 87 ++++++++++++++++++++++++++-------
> >  include/linux/balloon.h         |  1 +
> >  mm/balloon.c                    | 67 +++++++++++++++++++------
> >  3 files changed, 121 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_ba=
lloon.c
> > index 11f74848fdc4..d162c162b496 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -182,6 +182,13 @@ static void balloon_ack(struct virtqueue *vq)
> >       wake_up(&vb->acked);
> >  }
> >
> > +static inline bool virtballoon_cc_needs_state_transition(void)
> > +{
> > +     return IS_ENABLED(CONFIG_UNACCEPTED_MEMORY) &&
> > +            cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > +            has_unaccepted_memory();
> > +}
> > +
> >  static void tell_host(struct virtio_balloon *vb, struct virtqueue *vq)
> >  {
> >       struct scatterlist sg;
>
>
> Put all this, and preferred order, etc etc in kernel core somewhere,
> and expose some sensible APIs that devices can use.

Good call, will do.
