Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209912;
	b=LLcEWKc/Rg4nAv7Le9Rz7e1k2bMhriEU3t+C82ZLOhAA/YORZoVx2+TnEzkeiZwd34Zz
	 y3UhU7z/PtTsv7latWTftoSejf7uSHczlLiAiBbS1824/WIcQJZmExF+8Mqy8fRsnYxuP
	 iEjB4DJ7x4NnmyOwe2BNLPPJ/pE6vKOQ2dvpp7XVN0gnoG1xrHs2/Vr0ucakxc0EM/26Z
	 HQ1KTl40zYk+Ubm3i3KoFDWfoz2dEnEZOnmD921o8YbQLMqXvEE8kbH8l4IBzlkS86THD
	 96xlVfmfrOMnaHE3YrOgFb2p1vjbiJi+Tz3AAi9+eykKJKP/3VMuXL8KEHPltUs36qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
	b=q5o0cSbYYIvcgnbOqVXcnwDvguRpDxNkRvQY4f4vzmT6UpBCB0jLPyij14rl1cerM0MH
	 5bv4QC0Zs5isBief92ch2kA7eybwy9N5Pwyy0eOFZFwaE3+vXzdbBOQRkC3v+h+8rIeoP
	 DR1zGjREB1BNecEShqMebWlpX/RXo+RFPbPj4FNzFz5rcHiu4TUlCSXdoVrSGlcjiUxBK
	 Vyo0D85CSXzKDN1pXRU7qGSub16gmTekZEOUviWVfTJTCX/GfWm7KrvlzjTNnw71bIcsZ
	 YvGovs50y4lZB/zbicMYwE4+eh5hFKf0efL299I2bHDaN336N8JJ0GLmc01fbwA+LLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FZiONIAZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503760A2602
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 17:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C503760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FZiONIAZ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b09e07e149so11630927b3.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 10:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793209911; cv=none;
        d=google.com; s=arc-20260327;
        b=mAHIToyqYg6DCjaqZKcY952dx0q9z74K2g58jNiEeS98YM63JpIlPDN6KczBD7R6Dp
         u9m6Qiu+vNtztESuhMai2q6CewhyyUIM8SQQmXDsPNLW8ct76/RkowCTzGVg7VufA2kk
         6JEmoIVVvf/qudDpkGu+ScFKra7C3EpmVS5JbgkihOawq4UBOQYXoVLZ+pzZ2v9IEbty
         TJXLkdfLrrDrW763nxLMxFiyt5sxMssDlB1aQ23tSKMTfV+hyf6U84lZkh9BlTqHxivE
         O5SRl6E+rubFM/ZnNK9XtPjZ1CJ0Z02sQYYEPDwemIBz/EiiRTFuoHclmGoHzuXsM83Q
         gOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        fh=W34+8rXcTZ9IdeyAZdxNPEyK0XGVpab48lhPS6f38xQ=;
        b=b9Eum99x/TviOU9pdZbij5B3zV0FKwd7ItYbQdPS5hgkqFl0suH+taby0nOwj07HYZ
         dPyz8vLL6499gM05OQgzx6o/cZUwiWy5w0Snaa6nGn252/qN7OP1UvAzjvNz0kwhVlkb
         Ho6qHfRjuUHlgF5RFkEzZLnLAZSYhbjbbpvTfqtQNvMljgracm3FSVGHg/I0ClE4pM1R
         36EKMQI55XxGBTh4buy/IOa14rMh4cQ9LxRnqCgB9QkOCXTVNC2vXjChzjl+AElMKVWT
         vnTmsTLBSAw3nOz08kMmZeiBTlVEVXXzELzaqMfPjDVtfsEQXQHzvUXC3eCm3UN0oIu5
         0lmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793209911; x=1793814711; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        b=FZiONIAZ4+fN7A/Asrz6IRtwKo57iXMqV5y2AGdZCoYNqDLv1ZDGddxJCF0W3ZbfFr
         QUL0DNEIwuRRGg0yKlfLq8YM6eUQjyTFGj7hbcEmyE2XgXkSVBBtIMepun7VwbVhNC9t
         dy9mThuenTmJUikN0sNIodpvMLinKxAlDJqvjRWblAVDbJsXdx2jwlLiRQk8MF9WfgZD
         nLjexp4HKbIpQ+9ujAocmoa2JudmC20dRMWO262jo/N5fxWXkoTJr0jzgku9S379j3Pr
         14pD8t8Zx6E2DdvRptlwDO2bTmpo9LM3WGCROPIYGlNBHct+1GoJf5/wXdMP9tBLPnyE
         4MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209911; x=1793814711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        b=Z2opKhV0SjDmB3aqjVfXR9oUo80J1gYCigxEJy1ayPLQXNNS7l3VdBXsqSjS38vqkT
         CSpL8jtvSXuB4S/6GbNZR0rFHgxjEG3ngVcc34IrRSI+n9Jq3Q9+3RBQX2k828atEydZ
         PRAWWBxlyJVNMlx7wjEVH0DyxizIiQei/WBH3vDk2tj9xkjzNx7wbEhcgwUQw+G3QdyQ
         u/75gCk63xZEH9BeS/nL8zqXqZCY+oUntONnjYuQpKv+oRcZVzLILabx6Yq1/shUZItv
         hI8zagHziNm3N3Iek3Vqey0YQwdAfpvIzuR7vltBnJR5/OS11Rcmehfc676waFhTeDpF
         YSww==
X-Forwarded-Encrypted: i=1; AKwUvByhaXYsa5f/0Nk44rRgOFHsjmB1Wft/8T9r9kDDjz78ft6gozdApyx1UZ29ewS0VaoEeO3hKmspat2W@lists.linux.dev
X-Gm-Message-State: AFq9FYKZ6iSzY+eXVfMW5JOWa3iAkHjMeVkp2BUddYaqTTiLqpzivxq7
	fC5f01Ot3z8L6O7Hh6GiNJf09dbMSDT+Lf+dTPP17SBeILxyrhQK4rEKKCpGt53a4LK5+mIHFvO
	dj6ifueITQRCB/Cs8ZmtRTHOL1e3h01IL/9UKoBjE
X-Gm-Gg: AYBFou0alDEWpE2c+IW7+BikOt6dlSZLobeQyB3smZ4YaQ9qYaP/axmYDhWGIgLRRz4
	uzW8/uoCtjVDEm2FHFdy2mHqiDCud1n4YMhh/Bxa9PmOvPj/qbY92mKhZljMidxHOQfHpX5y0TM
	DWzCZJA0VEJ79lMEX0JjcZn71naogkKIUtknF6LnL8tnFNmZGmauDwx5QaSmeOUhPMu+voBdJMx
	KtouLWWwJxiY7LXSYwbFcyUwvESa9846kwO5En5Le6miQNxHgMxSxynKUUUAzZVzNE5UI6hpNtH
	hcJEkEJVO1XD4MpCdyvQl83uvTCWyRy5TaIQhzsQO0T5Ft9gw6yZpsNBa9CjTnDBPcjOrdPheVx
	r3fxs1zxTlrA+e4BrTzWXgu35WOd9Gkm6fblfwS5NDpKKeldbDwvKRmVdHJ/koWuIUw==
X-Received: by 2002:a05:690c:c512:b0:89a:63da:fa8f with SMTP id
 00721157ae682-8b1b5d5b9a8mr19678387b3.74.1793209910194; Wed, 28 Oct 2026
 10:51:50 -0700 (PDT)
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
 <20261027051245-mutt-send-email-mst@kernel.org> <20261027163814-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027163814-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 10:51:39 -0700
X-Gm-Features: AclHuK9-u99s7D6HT09CfAyO9Ftn7vr_iH3z9UIt21N8WRT_BYsbqycnLIpHOb4
Message-ID: <CAGdbjm+f+b8bMBFMdqXavXx79NSnXzDFeJRUxZdEox_+dKV6tw@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
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

On Tue, Oct 27, 2026 at 1:39=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 06:29:35AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> > > This series enables virtio-balloon free page reporting and memory bal=
loon
> > > inflation/deflation in Confidential Computing (CoCo) guests, starting
> > > with architectural hooks implemented for AMD SEV variants, in order t=
o
> > > support dynamic CoCo guest resizing.
> > >
> > > Today, memory ballooning and free page reporting are essentially unus=
able
> > > in CoCo guests due to three main roadblocks:
> >
> >
> > For me, the bigger question is not whether we can, but whether we
> > should. Considerations I would like to see addressed:

Thanks for raising these. I will address all of them in more detail if
I send a v2, but here are a few shorter thoughts that I'd love your
input on. For brevity, I will ignore the inflate/deflate case for
CoCo, since I'm planning to drop that, and just focus on free page
reporting...

> > Security, e.g.: does knowing which memory is free leak information from
> > the guest? If no, why not?
> > Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.

I think the min order we'd support for CoCo free page reporting is 2
MB (and tbh we might do 4 MB only for reasons I will mention in my
reply to David's comments in a bit here). On that note, I 100% agree
there would be some new direct leakage of "which 2MB or 4 MB regions
are recently-freed or recently re-used inside the guest", which may
present some side channels to infer other information.

Some related channels are already open in CoCo and don't seem to be
signficantly worsened at first glance (ex: for
CONFIG_SHUTTLE_PAGE_ALLOCATOR, the hypervisor can already induce
faults on any GPA at 4 KB granularity). However, there is of course
strictly-more information leaked by adding CoCo free page reporting.
My hope is that the coarseness is a reasonable tradeoff for some
guests, but I will follow up in more detail.

Aside: now that I'm looking at it, I think some aspects of upstream
page shuffling logic might actually skip the unaccepted pages even
today, so perhaps we should change this regardless of this series. I
admittedly don't have as much context here right now.

> > correctness, e.g.:  Linux has init on free (and default on windows), if
> > initialized pages are dropped and host can not be trusted, they have to=
 be
> > re-initialized. Is this handled? I don't see it in code.
> >
> > Also, performance, e.g.: How much does this re-initialization cost?

I think the existing accept_page() logic (which would re-run if we
fault a reported page back in) is wired up to
free_pages_prepare_init(), so I didn't introduce anything new here.
However, I'll verify this and call it out either way if there's a v2
of this series.

> >
> > Management: it was simple with balloon off unconditionally.
> > Now we are in murkier waters with various features offering
> > various performance/security tradeoffs.
> > What if some guests want the tradeoffs but others don't?
> >
> > Documentation: for all of the above.

100% agreed. I lean towards an opt-in policy for CoCo free page
reporting (ex: via guest kernel command line, which could be attested
as part of guest boot as one way to verify the setting matches
expectations), but please let me know if you have other thoughts.

> And to give this a bit more perspective, I present:
>
> commit ab676b7d6fbf4b294bf198fb27ade5b0e865c7ce
> Author: Kiryl Shutsemau <kas@kernel.org>
> Date:   Mon Mar 9 23:11:12 2015 +0200
>
>     pagemap: do not leak physical addresses to non-privileged userspace
>
>     As pointed by recent post[1] on exploiting DRAM physical imperfection=
,
>     /proc/PID/pagemap exposes sensitive information which can be used to =
do
>     attacks.
 [...]
> Leaking phys addresses to unpriveleged entities might not be wise.

Yeah, while the host already controls GPA -> HPA mappings, the free
page reporting would indeed likely give finer-grained timing control
of what 2 MB or 4 MB GPA regions map to which HPAs. So yes, another
potential case for "let's only support this if CoCo guest opts-in."
WDYT?

Thank you for taking the time to review, Michael!
