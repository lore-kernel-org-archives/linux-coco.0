Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793217008;
	b=I4ZLKCOlfqkiW7l7XZAwqtwtR+uIqjFE0BSBjCSDiag2nK+iRQPv6FZ91yi0gsGGK92c
	 mgzcuLZ6/lBK92WshLjtM2XUJHqMqWFBJRIG778fR6EBU+A6ZhCg0orrUIiKZADeIPDHN
	 Wi9MUvGSTBpq/xxcOki2L3ilGo2UWyTOERcAuqPooqs6hPHGw8z7Camy/EnoaGI18GDa4
	 2rT7AYLeSn2Dhu7qo5f0jwQh/7Dm/FzrdRQ+pTV1XM1dLht5jykttHtSSsrTVHtwTTMVK
	 rXIb1u3bulPZzk8hdeOrFjTb70Tfgr1yBeXJARpM63TzZt4JanNsWl54r/TttNlBbcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
	b=aTkpmNTr8VK1hd+VHP/eTG/l0SPu+CGKUBnrewICjjcO1ILXMqv++0mfz7nwA/edRzBa
	 4pLqosJJ2b0x/w5aLXkOPBmooF0fTKeThn+xc/WcCNM0ZEe9t6m5gq0PleAaoI1+L0qHB
	 EhQVMAm9+vo+Dfe5XQNQv0JjvBGI9uzSqG0z5VwnZnokehljneSXZVBvGGoJ3xibT9olM
	 sRZ05urFOu3teWQjLCyrqLNgZpLQoViMuUySFwrSVgC3416gTSt6ZvemHDRr73vDcHBCg
	 9liwgYEPk13Nq7lfi40U7jurBGJM5e2bZfxE1//REDIk/jqDUSJ1Gdfh8DKyep/8hyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cdg5VqqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECB606A338
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 19:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BECB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cdg5VqqM
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b10ac6ab7bso13116347b3.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 12:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217007; cv=none;
        d=google.com; s=arc-20260327;
        b=VtkJgMVsk9UjTdDj8L1Bv5XW45Os13FLA+O+hThC/otbdzBNcWRvOAUr6U0HJR/woY
         uu698UrWvTny4H+sPuBTCRi3CjaVzAv3F7noyrcXlqQDMWNvAbuPyJEuNd37Nx7DYP6S
         c8Y7KCT1wJpscPPWMss64ht476hy8ZjIT4bJWu+OOMSSZ4/0sow89B3srbjHv/hV6z8h
         xfmQ41FKJg1f+nsaDG4rqpi5/dPLP05hN9Ox2Od6UiXD0ebsCT1WxvkzZBFUHeb6/aIN
         ThIfU2DOi6/ZhLGg4orUmKA2Roxed6TtOyXaXZI1sNVHTX7sP+ewbn+HiSu0c/4y7HG+
         B/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        fh=iGefjRJ1wla4n2R/b6fRIVfXEt0Rs2WAt3XJjA24BKo=;
        b=PRDEEpc2UQafyg5x+mRL8qeMC2tVaAMJuN48jWyRyBeoMkYmImw/m+SEBC//ylbUmh
         LvlFXnJIevhb4CktxlxK4BBRE3EoCrSYIcb/Hoii1uP8G5xo4jakSB+Wq+WtvYtB0+65
         RK1UMtKJzw9s7tEcbRuNDJXdgZypB3T0tiIav/j6vfHy3FFwB9TgX2IoMOn8P49UIJ34
         NM4EdBA+mm6kEv1Nm/0lkEGa52D5AjAZcxwCAZRsxLJAWx2a7xPbzAcDZN9U6h0iezhb
         doxznn+iGZONKahHG4517wwUnrYrvKMcA7XpO62j3TZb0QyrGyzwqAKKjo4kL+2tlg7z
         V7Qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793217007; x=1793821807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        b=cdg5VqqMIZ+lfbMM6vtSaBKDNmHhjUKbEufYgVxDKukKbr+tGqqKM7gubnQDetoVfN
         M/Qw0kULnmQlVONE0He4jg/l0l+H9nxOmSImisjBUX3j+w9Unho5geH6+7XGar8TSUd/
         VtorIrB2oRF9pfUXv843lJ1tU3onep9UMpQMZNCCW87N8/xl+60lnzkmyecmOuKZkDba
         dY/ksmZwGsCL36X7KhkLtaoxbF1ccXHcG5x7BvtbHSaEeXTCqDDkkDbENtw3HzGQjCCn
         r6gdP3MlAOIgoQfqYZHbLpe8JwPjmSNPIAbXMSR00olF7lEZQrVqCYd6cCbN7+MmpWHy
         q19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217007; x=1793821807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        b=Xy1XcRwQhEiekmEsRiIkuQ9Fyz0kKBnZB0A+0h/vfCdHC6wJIxtw7hFDF3aFjJZadT
         +oDIJxXNVbUMyQ9uuNYnrDZPRmuQUH7AF5rNoRNx86t/ppd18Z0TRbV3YOc2M5P9tPx5
         KFWgLTKC8h+qtcu/z3wlxGZ6snBR0yJi9kKDNrTrtpDAnRMn4QpMbwCbsZFYwKuMFppF
         3XR4sQwf28zmzfSjo2gQv02pFslwS2yMfgCme4AEFg6pS2J+Z44VwgrgbWBQZVcGUtRK
         js/yKUBIvEMQZqLSYssFTPw9tfyYBRuXhdEaiZaq+I1QMF5aWXdc6BonsE7MeX2hEmu9
         pluA==
X-Forwarded-Encrypted: i=1; AKwUvBxbRboNgquMSp1I2jguPBWVMe4qJgzwgVGgHRTTWsLj3RphFdEWEh6X9BRfaHH4PYJsdnxWqmU/sRA1@lists.linux.dev
X-Gm-Message-State: AFq9FYLH5YzhfFurNH6VWNvctRhsaKjLi+g0hVTKIrggGYS+iScqta3P
	79Y8UJ+TpBXvunikZmRIpk8pDXSS7qwTHcV09OAKEvPBg+KVDhGeC/KTGpjWeMfPVixTBVq6525
	GS0DMxGqs39lBAPoEOIFczQ3c5XyNh7MUS032uazZ
X-Gm-Gg: AYBFou3BC1qu8z5n+RqT4+yU+Z8PIRbpDRXtOQyYtIiJvVdLCSYYq1Et9QGuEdPN3X0
	I9JYiNWy2aVO60E6fgOVchnJP140FaS+vndWyqKehTgZrVjdnyyuKaJ3IrHIpZ9SkTVJLRK+YBA
	+NIEfCIEPtad4CqsEU9Ze5Vhi0SFQE5Ykg27nrYfKDbyLDsYtgg/oTH0lm9ZYuSIFhpzXbM8CpA
	Mpe6zcc5iU7P7xx4J4nbJ++oyzt69S7Sp9NDIZzNGDYaa6/Ve/pxeVjhIJNDtSYcO0RP2malWOn
	n3sdDxEy3tyvEU1NemTsqrdpT68xkhGw6aqsb/zN5cxAXnNx4adVzK/DdJRtOxM/vcAREAhUs+4
	hp1ene/GMKdLvfQNT/ZlRFVzRIiQrBDNKjlWMaRLkPtBG5quC+svedUwG+pOwjgYzsA==
X-Received: by 2002:a05:690c:498f:b0:8b1:a485:dee1 with SMTP id
 00721157ae682-8b1b5e870f8mr20662047b3.62.1793217005584; Wed, 28 Oct 2026
 12:50:05 -0700 (PDT)
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
 <279a92da-772c-422b-8047-ad37dbae211f@kernel.org> <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
 <20261028145316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261028145316-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 12:49:53 -0700
X-Gm-Features: AclHuK-xGxvCvL4otBtvefj81uI5MhPmhwclIN6rdpDM6CRLGOUQBZrCbVhrSfI
Message-ID: <CAGdbjm+4Jqx8Xv3uvhgaaiThYuVT0vF6UGx83XUku04Q_PN+OA@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
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

On Wed, Oct 28, 2026 at 11:54=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Wed, Oct 28, 2026 at 11:12:47AM -0700, Kevin Loughlin wrote:
> > On Wed, Oct 28, 2026 at 2:01=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> > >
> > > On 10/27/26 03:56, Kevin Loughlin wrote:
> > > >
> > > [...]
> > >
> > > >  mm/page_alloc.c                               | 248 ++++++++++++--=
---
> > >
> > > This diff stat should give you a good indication why this series is n=
ot acceptable.
> >
> > Got it. I will keep that in mind going forward, especially if I end up
> > attempting a v2 that simplifies things.
> >
> > On that note, I believe the majority of the bloat in mm/page_alloc.c
> > comes from...
> > 1. supporting the legacy inflate/deflate option
> > 2. introducing support for various page sizes to be unaccepted
> >
> > (1) I can get rid of by dropping the inflate/deflate option, which I
> > think makes sense given free page reporting should be sufficient to
> > enable dynamic guest downsizing in cooperative scenarios.
> >
> > (2) becomes simpler in part just by doing (1). For further
> > simplification, we could potentially restrict free page reporting for
> > CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
> > any order 2 MB and up. There's a trade-off here for reporting
> > effectiveness under fragmentation, but perhaps support for 4 MB only
> > (and its relative simplicity) could be acceptable? Especially since we
> > would then maintain the invariant that all pages on the unaccepted
> > list are MAX_PAGE_ORDER?
>
> I'm not sure what is meant here.
> But if a lot of memory is free and it gets merged beyond MAX_PAGE_ORDER
> and then it's not reported, that's counterintuitive.

Sorry for the confusing phrasing on my part ("2 MB and up" vs. "4 MB only")=
.

MAX_PAGE_ORDER (order 10, 4 MB on x86_64) is the maximum order in the
buddy allocator, so free pages never merge beyond MAX_PAGE_ORDER.
Today, page reporting logic scans from page_reporting_order up though
MAX_PAGE_ORDER.

Accordingly, what I meant is:
- Currently, upstream mm/page_alloc.c assumes every block on
zone->unaccepted_pages is MAX_PAGE_ORDER (4 MB on x86_64).
- In v1, I set page_reporting_order to unaccepted_memory_order()
(order 9, 2 MB on x86_64) for CoCo guests, such that free page
reporting processes orders 9 and 10 (2 MB and 4 MB). However,
supporting 2 MB blocks on zone->unaccepted_pages required generalizing
mm/page_alloc.c to track variable-order unaccepted blocks (Patch 7),
not just MAX_PAGE_ORDER.
- If we instead set the CoCo reporting order to MAX_PAGE_ORDER, all
MAX_PAGE_ORDER free blocks are still reported, and we keep the
existing mm/page_alloc.c invariant that every entry on
zone->unaccepted_pages is MAX_PAGE_ORDER. The trade-off for this
simplified logic is that a standalone 2 MB free block whose buddy is
in use wouldn't be reported until its buddy is also freed, such that
they merge into a 4 MB block.
