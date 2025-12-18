Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4403343D76
	for <linux-coco@lists.linux.dev>; Thu, 18 Dec 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072498; cv=none; b=bmbC7hWQhypALyr/uugiv64W37XAyMLqG5IqCOY6Lo1ruUD8NpaBcbX4muEJ4jyz6byx7lCRr1dmxpWwOfPrNQNS0QR5mPpxPyuSYeMNXhyaVJtgnpgrUAHVUc1jJ6Lzv0ql/XK1myGpOyTHu9nI/XvBlmqdSwi9r5hdAZYNwYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072498; c=relaxed/simple;
	bh=WYLcN2wl0LS5LgTp5AyMZfZDw4IIHPSyhnOh9jSB950=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojkR8tTCp1EJ4jtWzVYRE5p/gaDeR8AzPCoBx2/X1TIY1CKboUCH8lM2xAYMve8j7tlLHFu9pusxAvC4pFYtnWIAJKmvkVZLDXvhXq4fusfdn64CgxwuXo31/zPHh5l1mviHOjUtTzWkftcxqkQwUjXR0DqOJuN7G8uwe2W2E48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=c8+iuF9w; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="c8+iuF9w"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88059c28da1so7088976d6.2
        for <linux-coco@lists.linux.dev>; Thu, 18 Dec 2025 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766072484; x=1766677284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQYFHEK9Tm8YWqymq5JN++Nt0lXCgB+FVI1O7lCYYs8=;
        b=c8+iuF9wIlFAnQ7NZJJ3MnuJjojOEvCQj/AsLUPavUzRIkMlEnFbBhgzVSAPtTyDDO
         OQz6lUBlaLI5K03Y0ux2nP4bhQZxPQraMnO1O9wfWFVjZXgjNwcATs/nVQevZJw6jU+0
         ICVz6uQQ0TcaD8EcgF2zxIWOy6QG99/ZS5kQVafnMFjnTW4QTq6vtCwo/FYWP5xrFkpG
         Fp2HwRQC2Ugoi6RtqMXpBkPgFCYqIHOsZJYCA/NGRJLYcaCx/s1b8JCdZgg6lTYUjyLO
         HblUVw2O1mQol1aLivhY6wk5dAoSS9ac9c4g8qrGSxw/eZXlUNtg/XXvRY85mHw8IytM
         5Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072484; x=1766677284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQYFHEK9Tm8YWqymq5JN++Nt0lXCgB+FVI1O7lCYYs8=;
        b=rskBb1/MEURgMakueYbn52ILt5x3F2ay635YvS9rVoXHoqzJU6ilWB9iFPzPeVZAHC
         XUl6+AaLqNzP4en/+CS/1fU7nFcUHMEkKeY3N2Lf+57MSI80PYXnhi49k7HL0plnCHrH
         u7n5aQalfZHSqyA5hiIML4OYlMgn9cC7gSmHS185pEdd6KABjEYrtoBYM1zlarzo4of7
         RSOehAgmRxBuA1Kf8Hd5LvQLk3AbGVM2KCq1ZvPZ0Is02gdQ8N+vdnF/gDzo2jzWIGgY
         ThyE0BcU44gRuyRmcp1OjkmTOFbTnAhE7k13Pmk4Z2w6ibhEqOyIRISfrdIEbUlIyGhw
         sh6g==
X-Forwarded-Encrypted: i=1; AJvYcCUw9SkXiYJ6l+4/7AnTL4rUcnfrQCjZpnyXbIfq8pgo96hzXxw3OQi9cVoW1PEuJpinPf1M8r7zpuFO@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0tebB/eqDZA4sX6njEeRbYpnHsvdecaxQnbCNRvFW4DbPDbpo
	4dofJT8Rq5Kfc9Gvy5z6obJXJdhgFfSYgWMgvy/kVWbqpU6MJLmzrE06veYX7Y//nM4=
X-Gm-Gg: AY/fxX7jmEP8kphZuA5v9T+IvE4f05vJbaG5ub97UcsZoQvcR7Ro5STz4i3CoxafSIB
	5+/yXrLp+BBanZnAD7zdS6KXiq6/01CO3usQ3gVmkbVQJdz2OgmKqi220RtMOvCoMNOCpKzl6+M
	0lvCEwqXZth4fKdK5z5IxMu+buetBC/woJ03jKhIRW2jP0hdjTJIzFL/yXNkBC/w8WK+5DCPEGn
	0Hle0ts4EoTJlu2SPAOXaQ1Y/ANXKjWm35cm4VHc4Vfpu/8e6sPnw+LZB3wywRwgn5VhIsKM9I/
	QtfoVoOXQVo6sOL5ALzcacV37m9RQYlWGJgaLDmw2vxZ9ReisiNJ4UpzXWnKwVkbtK3lUZGTL26
	bFvjVxuqQzmBx2RsHvTmHju+W6/aHAeIFvi2n6bWWhH9xPRBvnHUfGRxGZ9u8QEvctWRoSSN+3j
	bsp3JavQS76IgJv3lcTI1+zweV0aInmfkfR2QqUAW4TDdlwVGlZNoQ6B51y3XL6IfE7ZYs2w==
X-Google-Smtp-Source: AGHT+IEhf6FIJBZ7lZJmuG8C+UcVaOo2SfADiXXl3E8f8W7HlPmfbAUOtA3YMxUDzV/Kzt4JsHqtvA==
X-Received: by 2002:a05:6214:c2e:b0:888:8047:e514 with SMTP id 6a1803df08f44-88d81278a7bmr1222226d6.5.1766072484119;
        Thu, 18 Dec 2025 07:41:24 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c6089a329sm20455596d6.33.2025.12.18.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:41:23 -0800 (PST)
Date: Thu, 18 Dec 2025 10:40:46 -0500
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Frank van der Linden <fvdl@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	kas@kernel.org, dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com, muchun.song@linux.dev,
	osalvador@suse.de, x86@kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: [PATCH v4] page_alloc: allow migration of smaller hugepages
 during contig_alloc
Message-ID: <aUQgfgWPq4ppMw9r@gourry-fedora-PF4VCD3F>
References: <20251203063004.185182-1-gourry@gourry.net>
 <20251203173209.GA478168@cmpxchg.org>
 <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
 <CAPTztWar1KqLyUOknkf0XVnO9JOBbMxov6pHZjEm4Ou0wtSJTA@mail.gmail.com>
 <b5a925c5-523e-41e1-a3ce-0bb51ce0e995@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a925c5-523e-41e1-a3ce-0bb51ce0e995@kernel.org>

On Wed, Dec 03, 2025 at 08:43:29PM +0100, David Hildenbrand (Red Hat) wrote:
> > Yeah, the function itself makes sense: "check if this is actually a
> > contiguous range available within this zone, so no holes and/or
> > reserved pages".
> > 
> > The PageHuge() check seems a bit out of place there, if you just
> > removed it altogether you'd get the same results, right? The isolation
> > code will deal with it. But sure, it does potentially avoid doing some
> > unnecessary work.

In separate discussion with Johannes, he also noted that this allocation
code is the right place to do this check - as you might want to move a
1GB page if you're trying to reserve a specific region of memory.

So this much I'm confident in now.  But going back to Mel's comment:

> 
> commit 4d73ba5fa710fe7d432e0b271e6fecd252aef66e
> Author: Mel Gorman <mgorman@techsingularity.net>
> Date:   Fri Apr 14 15:14:29 2023 +0100
> 
>     mm: page_alloc: skip regions with hugetlbfs pages when allocating 1G pages
>     A bug was reported by Yuanxi Liu where allocating 1G pages at runtime is
>     taking an excessive amount of time for large amounts of memory.  Further
>     testing allocating huge pages that the cost is linear i.e.  if allocating
>     1G pages in batches of 10 then the time to allocate nr_hugepages from
>     10->20->30->etc increases linearly even though 10 pages are allocated at
>     each step.  Profiles indicated that much of the time is spent checking the
>     validity within already existing huge pages and then attempting a
>     migration that fails after isolating the range, draining pages and a whole
>     lot of other useless work.
>     Commit eb14d4eefdc4 ("mm,page_alloc: drop unnecessary checks from
>     pfn_range_valid_contig") removed two checks, one which ignored huge pages
>     for contiguous allocations as huge pages can sometimes migrate.  While
>     there may be value on migrating a 2M page to satisfy a 1G allocation, it's
>     potentially expensive if the 1G allocation fails and it's pointless to try
>     moving a 1G page for a new 1G allocation or scan the tail pages for valid
>     PFNs.
>     Reintroduce the PageHuge check and assume any contiguous region with
>     hugetlbfs pages is unsuitable for a new 1G allocation.
> 

Mel is pointing out that allowing 2MB region scans can cause 1GB page
allocation to take a very long time - specifically if no 2MB pages are
available as migration targets.

Joshua's test demonstrates at least that if the pages are reserved, the
migration code will move those reservations around accordingly. Now that
I look at it, it's unclear whether he tested if this still works when
those pages are actually reserved AND allocated.

I would presume we would end up in the position Mel describes (where
migrations fail and allocation takes a long time).  That does seem
problematic unless we can reserve a new 2MB page outside the current
region and destroy the old one.

This at least would not cause a recursive call into this code as only
the gigantic page reservation interface hits this code.


So I'm at a bit of an impasse. I understand the performance issue here,
but being able to reliably allocate gigantic pages when a ton of 2MB
pages are already being used is also really nice.

Maybe we could do a first-pass / second-pass attempt where we filter on
PageHuge() on the first go, and then filter on (PageHuge() < alloc_size)
on the second go?

~Gregory
