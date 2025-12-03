Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D53254B1
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784899; cv=none; b=JRljZ+uAHatd0xxa9K+YwpBtCpMVMRzN2zphtyOcOcR7PzCdfkw+ep0fpIX2KHwWCqhfeIttrk3p9ypyaWiDkLbwd4buJSsVr6zkWH6H9K4OqKFw11RS4F6hXuVYPgEqmPtW2/VxSmPZCa/VcdL9KdHZLx/bUmAl8pn74tahuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784899; c=relaxed/simple;
	bh=7gZgN4hUIvhIVsPl0mwoLPCQC2w0HuG8muQomyUiL8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn0gQ/SCwpth3FbyhTGVOkYaTDgmbl1AHnXEx0tappaGUYTt1sIwdDRItjQl82zYx5mwqNd0ujMZMyG2uvOIXutoIzViwR1QoVZnKgFUD4ipuAu5BJQFwBUE7Qqgt2ytOrrPW1fcxP5rPKNtAdaxKHkgPCyVXkSUx4jzpXy7jFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vACQkDQ+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vACQkDQ+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so396a12.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764784895; x=1765389695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ4P8LC+51Vcj7CKWx2AULySwQLuwp7ItbWzoUGLq3c=;
        b=vACQkDQ+AwmoSZq2o8495xn4HgUlhF8UPY/POvTuwtJvO8D8dkKsue78YqrNOVzWHp
         AH3I1DGI6sH6RN8KuXFdK9VYOKwvaT+Ue9vVTZFtqtvG021sqiJ1PuNzSllKTXrlCSYI
         GMp7/D/uhE8d8tw4sUpJAHryYjrx79u0pY5Ko2H9tNy1c8BUcCuW6F3159449IG0Paz/
         8FLdGeBAqpENLskOsowbonmT9aQtXko6j93hlQueETGZmtW2/nsbXpv5AueWMfjAdQxk
         kjow0szEYfcT+we6F7e6p6dkE5d5hkY6A/xMK2hKXcNtOmvImLP79pNm6pY6x+LeBERD
         SQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784895; x=1765389695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQ4P8LC+51Vcj7CKWx2AULySwQLuwp7ItbWzoUGLq3c=;
        b=VBg0/OQfI38Tkya1FuGWQ/NLwIGQ46ckZv+d8vJKPiPdhuvN7Azj8jaDgBnbIPeiF5
         rNWiWmhXysKpGmm+aSI7Ck9/G8x2k8/5hTyFFdxGP7/D6JOOtr66TiZlRestJx4G4SHv
         nfOt0ts3gdkvgUlnrqbHmaOgaRFKTNvYcPk2YZvYuxngTUSZfw2mge7UF/4cuGwm6jC2
         Qq8kaj/J08u6/qB2YwluJDFCwdGy5QX+7o+U22SYInO27V0NEH4JVSB50XvR9qXYUzrR
         9YyIqEBYQkHh/2FykcfXTMSirUVdC7isP9yY/kTeYO6TWosz48HqYPcoahP/bYdvhN6D
         4faQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjmu0n/ENjg5k+Nq8THqOrCYtoKHHeCs4fzNScp002g8bSfeVo7r2b+MWhJ1fv/aaBbwd+2RKFQ2oF@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhq4x7hxkjw9643W9yXhsn6ndgg8XxDW5d7k24MA0xj6qcWibU
	eD+uiUucZPE7MYmi5zaDKOWkWGFjy0UBQRAVKSo5pgcZSMPeA1XFnM89i+UW4nBEoKHUqbVHToj
	NyDbnRL4UU/J8stmvzg0kiOmfCNL6XJd2li8s+lbm
X-Gm-Gg: ASbGncvUZlqBToRk8VuCSYz6S1NSlzsNrVZ8FOvGIdR9TlN3In0erPuyZCK9bbKi9rM
	76BhWySo+6/VAoXObhQ6HVIetWlBktUQh0fU+hBc1CiVjK+71CkB1bRk2T6lwyaeaNmADrAyfCo
	2xCQSJ9frK87CcqlBdwo2+cM/0cdOJIEImxGragMyLwV+Ci0xHSSjlC0FH1qQBJpyUV8klYfWlI
	pwA8NClUBVK1sATtcKR3lCyK4rJRNpbWc7JomPWx/pa7O3HWOi+I4q4TVjLeObqxkWVM80b
X-Google-Smtp-Source: AGHT+IEq5GU7JSJAD9NSFFTRdVafRqGeePEnDnbLwoGqXLyw0X5hyqRrQVNf0XDjg2zuGyBpzHfDgCdEQ6erVOBfoCw=
X-Received: by 2002:aa7:c057:0:b0:643:6975:5381 with SMTP id
 4fb4d7f45d1cf-6479f73071bmr21488a12.15.1764784894352; Wed, 03 Dec 2025
 10:01:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203063004.185182-1-gourry@gourry.net> <20251203173209.GA478168@cmpxchg.org>
 <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
In-Reply-To: <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 3 Dec 2025 10:01:20 -0800
X-Gm-Features: AWmQ_bm9jnHUGZVMHvCiQBBD_zjOFaR4rqaOnzbPbdd4tEkA041SCnA3fwsyYVM
Message-ID: <CAPTztWar1KqLyUOknkf0XVnO9JOBbMxov6pHZjEm4Ou0wtSJTA@mail.gmail.com>
Subject: Re: [PATCH v4] page_alloc: allow migration of smaller hugepages
 during contig_alloc
To: Gregory Price <gourry@gourry.net>
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com, 
	kas@kernel.org, dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, 
	muchun.song@linux.dev, osalvador@suse.de, david@redhat.com, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Wei Yang <richard.weiyang@gmail.com>, David Rientjes <rientjes@google.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 9:53=E2=80=AFAM Gregory Price <gourry@gourry.net> wr=
ote:
>
> On Wed, Dec 03, 2025 at 12:32:09PM -0500, Johannes Weiner wrote:
> > On Wed, Dec 03, 2025 at 01:30:04AM -0500, Gregory Price wrote:
> > > -           if (PageHuge(page))
> > > -                   return false;
> > > +           /*
> > > +            * Only consider ranges containing hugepages if those pag=
es are
> > > +            * smaller than the requested contiguous region.  e.g.:
> > > +            *     Move 2MB pages to free up a 1GB range.
> >
> > This one makes sense to me.
> >
> > > +            *     Don't move 1GB pages to free up a 2MB range.
> >
> > This one I might be missing something. We don't use cma for 2M pages,
> > so I don't see how we can end up in this path for 2M allocations.
> >
>
> I used 2MB as an example, but the other users (listed in the changelog)
> would run into these as well.  The contiguous order size seemed
> different between each of the 4 users (memtrace, tx, kfence, thp debug).
>
> > The reason I'm bringing this up is because this function overall looks
> > kind of unnecessary. Page isolation checks all of these conditions
> > already, and arbitrates huge pages on hugepage_migration_supported() -
> > which seems to be the semantics you also desire here.
> >
> > Would it make sense to just remove pfn_range_valid_contig()?
>
> This seems like a pretty clear optimization that was added at some point
> to prevent incurring the cost of starting to isolate 512MB of pages and
> then having to go undo it because it ran into a single huge page.
>
>         for_each_zone_zonelist_nodemask(zone, z, zonelist,
>                                         gfp_zone(gfp_mask), nodemask) {
>
>                 spin_lock_irqsave(&zone->lock, flags);
>                 pfn =3D ALIGN(zone->zone_start_pfn, nr_pages);
>                 while (zone_spans_last_pfn(zone, pfn, nr_pages)) {
>                         if (pfn_range_valid_contig(zone, pfn, nr_pages)) =
{
>
>                                 spin_unlock_irqrestore(&zone->lock, flags=
);
>                                 ret =3D __alloc_contig_pages(pfn, nr_page=
s,
>                                                         gfp_mask);
>                                 spin_lock_irqsave(&zone->lock, flags);
>
>                         }
>                         pfn +=3D nr_pages;
>                 }
>                 spin_unlock_irqrestore(&zone->lock, flags);
>         }
>
> and then
>
> __alloc_contig_pages
>         ret =3D start_isolate_page_range(start, end, mode);
>
> This is called without pre-checking the range for unmovable pages.
>
> Seems dangerous to remove without significant data.
>
> ~Gregory

Yeah, the function itself makes sense: "check if this is actually a
contiguous range available within this zone, so no holes and/or
reserved pages".

The PageHuge() check seems a bit out of place there, if you just
removed it altogether you'd get the same results, right? The isolation
code will deal with it. But sure, it does potentially avoid doing some
unnecessary work.

- Frank
