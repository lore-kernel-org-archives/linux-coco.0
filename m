Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211180;
	b=fCij34E8WicnCIHckfYRPd3cw4zymgrjox+DsyLIvGIVrOXkC1sN5EpnOsRhkVLSS8Wl
	 fCU6h/AnuVoNoDSFPJqNU4PHgpGMoQVVZOvBj0Kuk8gJLB5mhHd5ReCAT79oTQUcMdU21
	 fq89Y42cLwt+Xj8DP6eOWkZT4cpWHfZ6BLG+hmhHY1tOUY7GN8FMeuKza8NtDtFA/SFxZ
	 fsqGwJS+88MMGZAvSHKkfY6h+i9GCZS8gWJGA2KceEBaZW3vZQMTg3UC1pm743MfZ9uko
	 o20FP/1eo9LPpI3rPP66XP5BoPT/PD+L8r6hN+n391aPSHuA0JEKywldlH7SDP71bfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
	b=o5QC165DnvIBtMwMebcoBZ0vSHIODRYUyP8Die6OzuQq1d3J+uNYCLs/BpSBFjoV93yJ
	 zPzWqYjz+L2/+2PhATfXiT6IyT29FGONI2zdHwkJhSdf1Ceb/FmRHjXeXE3Vf84QwRhLs
	 qxK6q3XUjElsk7PxWWnFQLwuWJt4Z17LK4e7w3wFOjdC4FyBcJ0jtyphWitF2qBmMr4/t
	 ifj2nCwZs27rr84spJn2fRqgf5lLB1ylwHdriW06JHeherj+o91d/HpreHBDzt3+9R4GR
	 0ZmAapgT1pPj3BI+KowpQxVxsEw3gYz6BiCETxCbT8hZhxb7SHT6E58sV7jR4+ueu8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b7YvA559;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209C606A325
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C209C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b7YvA559
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b10ac6ab7bso12136547b3.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 11:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211179; cv=none;
        d=google.com; s=arc-20260327;
        b=bYZE1q0+bIHCYx7gGQY9JLyMTfVZiWRj7cgEZIybz1bh1QLo2hAhCRW4rqOn4Y8Lg3
         trznnormxMvH2P2lW9a0ALpn4btqPDsWDTWWJeYNDkXrNFyOaF/SBzpxuH0+vRTx3e0k
         IVl9WipONFNF/k6Flqmzz56aqg41x/ocNBs8b7QvOFiSe6Txpy2NT5SEqe3VvUyjC2Nm
         Pq7bnkaZ7N7P/1epSETApzfB0o2oIr9UOtsm3wdxjptKBPZS5uJWCFG6QSPa2NvCXZQ3
         IKEVtoRYyDk4kPf+SptqlFaFNOy7pbPOyrMs2/TXs7ZYWA6Cll9TB/B55vFRAUFV/PzY
         RkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        fh=54TC9zbBCNzhwRkuvHVvnjpwD6LzspOWFrE2JdJJYg4=;
        b=stcs4KblmJbQlXmiONbWbuntYV/jffdmrutjBa/1cVeT9SEUUNJDOV5LVXpM/77gGC
         nrhcVWXhCpQXugmeUuRlSFb5aMef8Frd+8LkgiGsR9wZhSd9xg4GZPtZIj/x0iH7iyjK
         WxukFkIwZwHgS0MyUiWxEelh2ulcYvPKRqc+gMUV1FMvA0uavhmG9T0Sj1Oitp51PyMO
         aw2ass4/6DRnshFXW7TajyQX2KBpGLQpRs1Per5dicMF18o0e+pQj0VJgntYVSYyXw2E
         vMkuQl+eC0qlb8UyXscw5OYveEAs69Hy2wRQtSg1/c1a2l4V6vWmKxYSVmL8KlJAucTS
         Ivlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793211179; x=1793815979; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        b=b7YvA559LCEN/KAKghHyULmskdP43aPP/d1fdng57tH2S1w7rRWoFa/zEvHOODIDy8
         dRnxWji5L5uZqBUXc8hPhOX0H+2skvDsr3OTjc5KuHwRyRfezURhgVQzz3cywFWWG9tP
         ueCsF1LALVt1AywNpNGdWSovqn3LPX4NaJrz0x0ujwCIdUdKtcN7ygm7mhSxA2+K52Ke
         0Gz4EvndwJA1gWyGtMTdHrXGiO5dJwG8efAZ+15RK8Duz+41o5rTXaBvVp0cH9PYZZDx
         LHlLu/8S+M00AU+5EZsT63SuI0tt0TulKPnLbFRm00lFKJf06r/+0dfhGQTsz54N1TS1
         XqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211179; x=1793815979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARyFxRSvqAD+wB2pvv1XS401e8GE7i3ocZP4rplHOIw=;
        b=qr29ROVlGOm753dExicxS2caukLyLJgEutA7+csB4QCSQDQbBSEeJ1axYbHXvSAw8L
         dGFmjSXL/yKFqarGQ0zNAVXA1ZRUx1XRuldORC3kkoZz1P4VhYezqiMHF/Tr4jwzCKBh
         jpwvxmqn3vFVCi2m+KmhJFKtOvPB9RDy9jOse8Vl4ACvfWOSFKocVSBcysEMt6iINyqJ
         7lRq6me7+VYE31upKfht/Ptg3Xefk5hVlzjZnaE6jF4m4DoOHuTct9EVvZIUHr0VPGPv
         HoQRyYWQnUfi+CQGx4ITx21qJl3VKUln83CDfr0e92HtxUYsRjPZ1Pf25KoNY73+y0b/
         rCLA==
X-Forwarded-Encrypted: i=1; AKwUvBwK5ozwIEVW2apYafn/WUgIHzTugd7OTXmrAw+sAefzT+RTuL+lviNXxi+B56YSLVC9HrxI93bzvQA8@lists.linux.dev
X-Gm-Message-State: AFq9FYJKVeIWi00vbksMD843bZZoBXVjSCvF6gn0Cq0bbbjffkVXuo96
	/0q/QN033GruZobAnv6EaCI3gukg9OpQm6z1C5TOIzsJIFaQgdH/TswYRAjRH8FXJTfeWrhZcia
	G+MdU0XYl1Ps9ME6QmuBES9DLEvGcdvqOo8Ap8NJX
X-Gm-Gg: AYBFou3MhEoANmLmre5UTcJmxT3h/C4bLBo8Rk3D45mPb1H4X2I2gQ42H78oLZsJb41
	G97q0DvVfHlStiX49LQ9aDBcN3jFJ4EN18p9sphLM9k5DwE57lEW/V7n7NqIzj2AiwVvN6emUL0
	PrcSDCJDwEhizjbRU+8VoQYxpJfsd1rdVezBpg+V6r7UEzVds1yyILzuMc38HeEhKjOOX7Zv9F2
	oPkX9kE5e2I9GZ6UuCYvWWQFPkiBryWtoUyAYpiT3f/nn9AErIFXwR5SWSzm8BAkEXf/VTqhoou
	EyjVfpz3fBkxAvzeQbNQPONn4PuMf9NBk+lIWgnPcPI5RpT6rob/5C+z7oG2GTOXKGeU0wRFy2L
	WdevEpyDMgIi44sFpTEXWxdC7TnRtewsiwuzlQAhOL43NppSZbZGYwoDJC+LOeeeLODc=
X-Received: by 2002:a05:690c:f86:b0:8ab:436f:6e7b with SMTP id
 00721157ae682-8b1b5e93e9amr21228787b3.63.1793211178194; Wed, 28 Oct 2026
 11:12:58 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com> <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
In-Reply-To: <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 11:12:47 -0700
X-Gm-Features: AclHuK87kmeri51i0i8SscXVJiPFVq3oTJZMZ4FP6A_jqbPgcyRklPs7gnicX7s
Message-ID: <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
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

On Wed, Oct 28, 2026 at 2:01=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 03:56, Kevin Loughlin wrote:
> >
> [...]
>
> >  mm/page_alloc.c                               | 248 ++++++++++++-----
>
> This diff stat should give you a good indication why this series is not a=
cceptable.

Got it. I will keep that in mind going forward, especially if I end up
attempting a v2 that simplifies things.

On that note, I believe the majority of the bloat in mm/page_alloc.c
comes from...
1. supporting the legacy inflate/deflate option
2. introducing support for various page sizes to be unaccepted

(1) I can get rid of by dropping the inflate/deflate option, which I
think makes sense given free page reporting should be sufficient to
enable dynamic guest downsizing in cooperative scenarios.

(2) becomes simpler in part just by doing (1). For further
simplification, we could potentially restrict free page reporting for
CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
any order 2 MB and up. There's a trade-off here for reporting
effectiveness under fragmentation, but perhaps support for 4 MB only
(and its relative simplicity) could be acceptable? Especially since we
would then maintain the invariant that all pages on the unaccepted
list are MAX_PAGE_ORDER?

If I can sufficiently simplify the changes (especially in mm/), do you
potentially see a path forward purely for the free page reporting
aspect of this (dropping inflate/deflate)?

Thank you for taking the time to review, David!
