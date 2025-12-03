Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234C306B2E
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785982; cv=none; b=GlL0KMOx4ujww8loJbqwLe6LFNsnBhXgpbKYE7MbuGR1E0cxNs4ZtKKTfhK0iMN2PuNBBoIMilwSD5KHngU9xuB/+P0iYDZOTq7lkhReKzxVuXRknVQGpabNng+Rrsbn4m0/V9eIsWgvRmw0XMDNO97z1XOVvlv3oCqz/EMUqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785982; c=relaxed/simple;
	bh=YHEQjDaNAyN/sLTlveLQN+NwtzxBummzcQvo1oG/bS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdD2LAp3iibCaUvt+A9MwzPDBMl4BmPLCo+UV7ucyL9VcHQlZA9Q6uEAiL6XJi2CqtEq10wsDBVMr2pQWwL7yVsMU2bk35NFLb4JgrZ1LeK2o+lt+atNmDUC+99ejGeNbK+BNo3kaJ7BesH2drJNA52/3zA3WNOjBONfyd0yNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=WkRp+sk0; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="WkRp+sk0"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso9974585a.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1764785980; x=1765390780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvxsSNOGWdrE9akcNg/jRgoHeSCakoDs4XiZtxVygNw=;
        b=WkRp+sk0V6K2g6J06YpzgYHQS0S0g3zJHgefgFD2xiYTYYgG0RPLkw1Yw9TUcNUoXT
         U5UB/MAj1XMiXiGvAQazzlsxoPWwYk98XlhLanGYjuDRLrrgzqp60jsxeQmFK8GZpcdn
         9sQf4esXQAyv9wBBYDt6zTpxs/KVCaum4T/pfMogyDHZNEyLOjT/671f0l1va4nU6DAo
         IHyajn6O9qdDr3xmnr5WLnAXXKIloJ+cYw53tTHwolcipgFaSjWUkgjWgsPamGJCYOsm
         YSOTlF7I7hsj/GZ2tQ45raNnvHn+D34O8byAOYlXv3b2hXTDZpXwF+sEu63hIu5txqew
         xKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785980; x=1765390780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvxsSNOGWdrE9akcNg/jRgoHeSCakoDs4XiZtxVygNw=;
        b=CycHSsYApockiHYe3xlRwQTZXPNM1Oh7D806quUKhK4Y8X921QemhsXv29pxZ0IQ5q
         Cj54yuOPX5Gh937FoIozTSnGnd31KeJM7q6R3pFi3DqydWbf/GAEOG+HohqeJqUNqOja
         o075AIRsXqqve7HVhEIgjMaKWqAXZEGbr/X/H2DPn1VORF7Dh2VvPyNhmZAhPCbqtay9
         rj6s3WmlZgWAc9B3NyhHnmCMJluN01McCRrqp7Rz/BYFPtlHMuKobUdvjS9PSBfDgoyR
         O2sV7AA/NaZiuBHdwIPQSzWOr/aZjmTgpehlRrIHSRfI6U868gMHirwZ+kIXMaezoJVA
         oBdg==
X-Forwarded-Encrypted: i=1; AJvYcCUsCfXs0/ZCqERONyyQDPhytha1vyQzou3FX5/NtXuNTor8WTloptEw/Fn8fL0xYYnKO6kkAKTvxYZh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy8kQUOkphJiV8yQqAoKbwJYTMbea1E6SdIqhDMTHr+W3L4ZGg
	sg14pUaZ3Y1QQfFTSf9HX7gGCTn6P4/Ru6QKxRxTpygEMkyoyFkGy+zEo0Ywn9jspbc=
X-Gm-Gg: ASbGnctPuiIjULOWaTFhUySjqD3ZcknmgnWJbJCVvPDizrDi7SFwlgTljUJexUoZgem
	lUuJSfyBr97OXV2MMrFKBYKwpZ6XLyZrm0IxUOSa1+Sn0lcHahy91NcFviHk/5S3jc0dJywmwc2
	KmdFyIbF9JKoalN1F0gpiedMfVKkqG8jFv32UoK57StkxHA8VlnKrgzgre6hdqGSSYM2fYVs1mc
	qJm2Ivr1sCOKbf+fMO4NejYYok1RQGqmQr1cGIVA5yTEPGfrhE52qnCTw1mhLuvBbR4YOBK2ppP
	wz4SXBb+mxQln83cUpLfd24OMI5XWFgFwWwnfza3bXRc2yU6OHjBiMbX4Yu8kmVcWtFIy0SQvVl
	nLlg5pFWyINIYd1sB19H8+JmJbkqtDsiCUYPJjtRgAsDRdBA8Vi188ikU7sXQoynGo+WOL4OszN
	M/OHSAyStWaw==
X-Google-Smtp-Source: AGHT+IExlNX5MNBC3OYudvJIv4VEFspzEKTWEJsupXZUlcjDYuuJpB+YCUht9jfc5WZuK1q3vHl8NA==
X-Received: by 2002:a05:620a:c4e:b0:8b2:ed3b:e642 with SMTP id af79cd13be357-8b615f82cbcmr63003185a.34.1764785979729;
        Wed, 03 Dec 2025 10:19:39 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a5377sm1334780185a.14.2025.12.03.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:19:39 -0800 (PST)
Date: Wed, 3 Dec 2025 13:19:34 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	kas@kernel.org, dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com, muchun.song@linux.dev,
	osalvador@suse.de, david@redhat.com, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: [PATCH v4] page_alloc: allow migration of smaller hugepages
 during contig_alloc
Message-ID: <20251203181934.GB478168@cmpxchg.org>
References: <20251203063004.185182-1-gourry@gourry.net>
 <20251203173209.GA478168@cmpxchg.org>
 <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>

On Wed, Dec 03, 2025 at 12:53:12PM -0500, Gregory Price wrote:
> On Wed, Dec 03, 2025 at 12:32:09PM -0500, Johannes Weiner wrote:
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
>                 pfn = ALIGN(zone->zone_start_pfn, nr_pages);
>                 while (zone_spans_last_pfn(zone, pfn, nr_pages)) {
>                         if (pfn_range_valid_contig(zone, pfn, nr_pages)) {
> 
>                                 spin_unlock_irqrestore(&zone->lock, flags);
>                                 ret = __alloc_contig_pages(pfn, nr_pages,
>                                                         gfp_mask);
>                                 spin_lock_irqsave(&zone->lock, flags);
> 
>                         }
>                         pfn += nr_pages;
>                 }
>                 spin_unlock_irqrestore(&zone->lock, flags);
>         }
> 
> and then
> 
> __alloc_contig_pages
> 	ret = start_isolate_page_range(start, end, mode);
> 
> This is called without pre-checking the range for unmovable pages.
> 
> Seems dangerous to remove without significant data.

Fair enough. It just caught my eye that the page allocator is running
all the same checks as page isolation itself.

I agree that a quick up front check is useful before updating hundreds
of page blocks, then failing and unrolling on the last one. Arguably
that should just be part of the isolation code, though, not a random
callsite. But that move is better done in a separate patch.
