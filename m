Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202064;
	b=GcEVmOLu7/yGOM7XOVMtaamE7rkbQx0+a7ofHcYITrhVKE3ArC+C5fbHJ5Fteoyz91De
	 S3xSyTvokGN+8h5T5au5mPim6ElI4LzxBuWhob6ie3SUPT/yFf6ANtmqsymS/9bSsi0h6
	 Yr+9u42fdz+CGZUPYDiclPiBeO4boyGxS8TaEsNNgpn3BYxXrfLfMX9R/y3QemAPPNOCG
	 m48qurybyxtSkNGOqJSim5bgv70pTkUF5CHLpebpx7EemCBfSfbvuZW6quyqz6F9RVaKM
	 WileD6itUs3WHJvZNpcbpcpile1dWAfEnWrOztQr3mhQ8rw5ZwccMHaZuwqr+xURzRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
	b=d26wK7+Oly4afYdAHxT8Pb+WN2PJFIWT9lWYVfUftoJ7OypHxPi79yM1mGBlW/MB1Qux
	 wu1TIW03ruDrxRNBTcCSoqV2pj+fCxnkXH3IgWAhRZlICbyL+SYTESWBgn+m8JFWx3UFS
	 +cgxK1JtZZcpxGfNRSI6IkDq4bw6gJ/ZVXlKE0QyhYP9kNwtVl2xbpd4cOHs/J2h0wy7Y
	 rwDs8o1d3JACWzjNw9vKZka1QRqfHg3XRKa8LjJDzHoqquQ2DJYlqMa0QZbSFYd9P51PB
	 PjCrZj7DB8m4W90NCzjqEnaHcqJgOQQfhpFi7A1yCIEsZL5mFeki6ZHY5qzc2RVs4uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="U5x6y/I+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E810E606A336
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 15:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E810E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U5x6y/I+
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c413dea9ca6so189548766b.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 08:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202062; cv=none;
        d=google.com; s=arc-20260327;
        b=QMBITWl8XBXrW8wocLGUCOe88rL1yzwe17UXPRc7oyHLxuHZ/RskuAK1Nx4bRy5R5W
         qvg80YCfjb3LGmszORcf11UvYki/LYGUg3kZVDlwDa7eWv5ENJSnAzRc6Wdnz5sTyXpw
         nDZN94cGbNGGTy45y2XguMKmGkf6NZnXdE6Hd9CfhWUy8HERovmPvG+O2p+VhozSJ+J9
         4yqHwoay/6UmJT4FH8aoVctIYArH1LdzrTVYiFowD4kCx/uI1fP/uNk31HXGZ08+w8pa
         /1LVkJhlUvfb8RHOQCWXpbGUOT3GfdCOxbtW/LszYXsonwVvUBDqS13UWXtvtgnsHw17
         SEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        fh=XoQlAXlMWSvBZm60+jwyFYHT2alfx0D94SERaGOScL0=;
        b=PTuxRk3To0jpGLnPFeL6PD5FhIncAFmht2cde7WgKf1GLTt4etlsNiLOIHaQ+eDLtT
         9E6DsOTO1DU5HQJ8b4vkGfOLcpwbYn9APjZJA7rSrNFtXwY0UZhBbE3XgAUdnrPYBOhj
         anDOSpcUSGpvyPN2pLp2mO58cy9IEJsNDzT/aEud48e39pTkM7K/p1zuUF6k6YLIPrXX
         xdJ58zoF1WLwyowzYJf9ltqw4oOCmACuKQpEZmIzId8sfKp7Jz4e7TXQ3xkDke2sBpYk
         A/9jJ73Gp3LQsb8tsULN04keyYZWNcMagXmJxLZQNtW1SAzonPQetJ33I39wN080h5Zc
         E2/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793202062; x=1793806862; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        b=U5x6y/I+SgkzclrFCXcxeYDhV6SGSF1EUL4CkO5cve20y6k3MDKYIMxzwlYSe3ddDV
         u2KorleDKwhacC+dD6kEyMZAllE5LrZ4wJJeaik3Os5z3mT8yPFNuDm4u6zHFwcPuYEk
         BFn6SM89CJHSIklLxD2lphwatCH2kLlMlU2fU0yM1mtb0SQAFBhKmU4leOKkG7sByU3R
         vgY899KEOevA2cp0dVqwLBdrpedRx1hIHZuxIKOop5ir0Hhz3FMii2sXYjs43J9s4g3N
         C1ay5ax7I68Fy2bSKdFnmCXXViZNM411YnPTDZ84CF8koCvDgyq/IinO+rcs9jXQH7f4
         eAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202062; x=1793806862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        b=RbRKGd3YqB+MFvRTjde87dC90WXo9Dk+AdtOZXZ++08890H7bCRF/07+mkE7/x6wvB
         dMSuFrHk1Tkivi03I6Gu8YtPs3lRuJohVkJv45h9FdBuqAKGnvUoXkeucPeZOCFYm5TZ
         /rWAuJEr+2LKAJVUleQ3y8laPmdPFSqmx9sgBj+RJnvOoHTZ+ZNHWYhEHX6jAQ6cCsP3
         1P2TfNaFndNQBBIWeWNNZzVm7c5kIVFs6kWP3pDcodK6a539Fdn/NrYYPSwSHMO2Y7FY
         cJEXYxc1r2dMa2yjWxwYdk+qhPVBbii9fnY7bcY4lTmTn7mIKAoO1dSx2YHlF2sPOnGk
         j+PA==
X-Forwarded-Encrypted: i=1; AKwUvBxT9xELxvKpKvlaxgvTO5zbuAfqP0d1c9EtcV5qvVZwnjFzZGrn6zlJBj57iZnc7fjq+pS3Sccvsrt6@lists.linux.dev
X-Gm-Message-State: AFq9FYIq7yFvurDHKIrhqXinVwG6SpC1b7Mbw9PJCMJfYrUszBmTuDP5
	rIWjSm6iesa58Oz5Ed/vv31GSafwsxMU8JsunnyEpd9lRyFM7pR8Q1oOJ7iDzBcHs6kH6sriL+j
	5OQD3JzmJAjR9p27V15mw3B0Uf4j1nUAzV4k4yZ0O
X-Gm-Gg: AYBFou2HlzOeiEGLKJ1+5nXfNcqkZUFkc6At+93hklvrKE4Py+wv+fXnv8JLsnaswhX
	6U+uQlSLDJ7F2ugWi4iQ+VQKvvBDu3Z+DesN7hQCr1B5tDTvnLsZ0komunfYfCgHIWeMax61/FQ
	/XbkP6cF9GR15RuTN1sIOjMhL1Ywim5bESnA9l/oPPvL2ISw/TAFtKwNU+KvBjUKCAvXr7nQFcw
	ohdP0LW/g9fyaiD2I9n1sD8afg5st+9W6V6A+A7pw9TD2oQElCeiFS0J9TTZ51PxGGVsoOJhG6s
	vOtB7AIPdHs0OsKHogrvJT5b11ZD6H7V2azPgpShxKk/P2P1snzYluCv4J3gAFI0esWf46wH8ly
	1eGTBpAhQu7hcsVbleyZX3uTic8w+q6cmniJFJG82OjmNhFp3CUdvgovNsrvqfdfQYA==
X-Received: by 2002:a17:907:3ccb:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c49bdf82147mr200595566b.39.1793202061724; Wed, 28 Oct 2026
 08:41:01 -0700 (PDT)
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
 <20261027025616.1632690-11-kevinloughlin@google.com> <2976bc2d-2642-4448-9c1f-ec13e67e45d5@kernel.org>
In-Reply-To: <2976bc2d-2642-4448-9c1f-ec13e67e45d5@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:40:47 -0700
X-Gm-Features: AclHuK9oWsApJE-SwbWIqUTDRpRi_a-FG1r_BRCTB7JJ3QabTlKp_kjVIFg_bKo
Message-ID: <CAGdbjmLXhPkutP3yCNYghP_tkvHm2Sa+6aBHF1+9abaai-4bAw@mail.gmail.com>
Subject: Re: [PATCH 10/13] virtio_balloon: add higher-order page inflation
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

On Wed, Oct 28, 2026 at 1:59=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 03:56, Kevin Loughlin wrote:
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
> Sorry, not happening. There is no migration support for these (large) thi=
ngs,
> and there likely won't be any time soon.
>
> NAK

Yeah, you're right. Another great reason to abandon the
inflate/deflate aspect of this series beyond what Michael pointed out.
I will follow up on the cover letter RE: how doing so might provide a
path forward for the CoCo free page reporting by simplifying things.
