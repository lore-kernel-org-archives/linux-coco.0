Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8893321AB
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784397; cv=none; b=M82fvb2eNkxDKMbyabnAxiTwUoMNKaH4nWyrfufgSI9d5QnDI9b8hdMT33+UrCYhRJuAjkrloklRM8l7z+cTbYZZz70ZKgMjeud78LAH+hRdTQ5VaUskeRZEaCuy97nXaJvdxXpvy/PJ2u5IhHlF5JlZHy8VXdXF8JjvND9Yi8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784397; c=relaxed/simple;
	bh=69foOxwTqjTIJ5Q+eAFS5+Lr5Mwxq7uRbCD4aAWJzIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsskU28ozAHuZxfYY9Y3vU/hWjUgroeP+TdO1ZHZQnloPtwYl0lHHML++t4M5IzqyaMCARZFgTXeiJq08DYK84usKCmZkt+EIjUghtUKlBGyuvzc4gqm906ESz43l3/USucbj2/fVLQmUSTcg8nDefCF/q/zfw2KUlOCcibvlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uxURNFd4; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uxURNFd4"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4edf1be4434so383261cf.1
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764784394; x=1765389194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVJlOc8ND/Iyf2S5FSwKg8rOfnG5RDtAsn0WPd8mpfs=;
        b=uxURNFd4k1ds0hbz/AmGe5OoEqW6XKGQGp6xTP/OZZ2ZWkAbgI6kNj2H//vnYKLxwg
         42+ByEpBt+eyU/FCKUqJnpWfPj19Xn7+LnjzBOomav70n6bTiictav8zy1pO4aZ7wef6
         b0qbFXIYtQ7cnXa++/0olwBjKzMeh1sBDWYM7hXiwxEf6QNH1KIfwLF9v2OdYBgBACEb
         9Q40YGPYXaJctPRiiqz86dO3sYk4rNB6Uz4l3E5nvljinQwV8NDBON1+Wjfc9G9wKxU0
         suXxusJNlt/utG9fbf0WRw10LkrAqbrcg4ROakelQN/sG6RVqTRReDXN/8iZAxV18Jfw
         SYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784394; x=1765389194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVJlOc8ND/Iyf2S5FSwKg8rOfnG5RDtAsn0WPd8mpfs=;
        b=KbNM30linhjvltwpMxs2XrUUnLCOIsgl143PXmdNFldgVUal4GnF/xczZFQZ22H4Az
         zuPh+PdicAwlOzCPaLj8oHMsn+2hYNwOM6CMTAcRgXCbdph7MZiZQqyF4poPG3siS1Bl
         oGMsTEQhoylqaFkc2NAbezkQftbVU9dEyzkMQkb7TGy8H2p97Iut10OvXIB2VkYffPqa
         ipaGvpd05Gsrf/cjb40nslbAG7wGQ+69eLbNYK6ut1g5rZnrEZbUZ//stRel4GOh6yAW
         JxutvEEwqjKttlpoyI0/h75K7cRHMUY9tEaP9M4tdcjEuHfwxgN8gAe5DZp0+qhAlOe9
         CM7w==
X-Forwarded-Encrypted: i=1; AJvYcCVOzv8HZcDekOJjk55Exy4SkNWEINdEHOxuWNya1oBwiHyUXEOtEcJnIqPXn1Z3Bvb8R1KY1eXXma+w@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Zs6ZXCTkHGE/r2YZ/1kDk0UJZYVSEisya+4Yfo/luaTMk89x
	GXuKtg0KJ5N+5FNKIS9r98genueIYPZU7AdRD+0dPL2piAMfnMxL7paNotKlUFa/7eM=
X-Gm-Gg: ASbGnctl0fILvhJWDmmqx/z+svPhY7Wdv4Lkr3QnnPOQUFAgrxO+XGZQm8xcrZU9QI7
	OnoTnKm+HX5J5CKdxfkC3FeDEqTya/gjCS7FsNcjBgVtrBkxNibpMDbzvhOJkFXb0h2tZ7DyAx1
	aX7T16dnuJRpJNzTEs7eNsDMlP9Kw7Nbd+DXdt0gV9JPNWaPTwjj0PqpIYF90+h+CF7EBM+QMhu
	58OUEdKrYVbWHa34gwxLbhSyj7XuBbjeGVEOE3zznRL22j/s2h7/YRSbXn+cFmxKGK6DupF2G78
	peytYvlSp+E7FFDpHGqyY/PLWyQmvCMWnXtxI1ST0sQeYMDhp6s5XMzzUYzbhom0jAWgqseCvZ4
	8IR9p29czUz34TcRGKlKQ6rfvx49dP5FIG8IfKD8KiD3pHgbNDmND1NFXJoKW6aOQ9VSx4CcMkj
	bORzDWUlcz84+rLuZOqvgQIGMnQKCDbEkvi+QeBjrveP2BLbLbGRzjeh3aJv9BBJUmQ3QGuw==
X-Google-Smtp-Source: AGHT+IHHD5+Jl7GtUH8NhBzm6kCviK25Go8YNEW6lOEadSIHifkHTfsNCnR07LpsAcRGWeAu1C3aGA==
X-Received: by 2002:ac8:7f4a:0:b0:4ed:b6aa:ee26 with SMTP id d75a77b69052e-4f023ae1140mr209871cf.55.1764784394367;
        Wed, 03 Dec 2025 09:53:14 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd3444557sm118131171cf.30.2025.12.03.09.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:53:13 -0800 (PST)
Date: Wed, 3 Dec 2025 12:53:12 -0500
From: Gregory Price <gourry@gourry.net>
To: Johannes Weiner <hannes@cmpxchg.org>
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
Message-ID: <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
References: <20251203063004.185182-1-gourry@gourry.net>
 <20251203173209.GA478168@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203173209.GA478168@cmpxchg.org>

On Wed, Dec 03, 2025 at 12:32:09PM -0500, Johannes Weiner wrote:
> On Wed, Dec 03, 2025 at 01:30:04AM -0500, Gregory Price wrote:
> > -		if (PageHuge(page))
> > -			return false;
> > +		/*
> > +		 * Only consider ranges containing hugepages if those pages are
> > +		 * smaller than the requested contiguous region.  e.g.:
> > +		 *     Move 2MB pages to free up a 1GB range.
> 
> This one makes sense to me.
> 
> > +		 *     Don't move 1GB pages to free up a 2MB range.
> 
> This one I might be missing something. We don't use cma for 2M pages,
> so I don't see how we can end up in this path for 2M allocations.
> 

I used 2MB as an example, but the other users (listed in the changelog)
would run into these as well.  The contiguous order size seemed
different between each of the 4 users (memtrace, tx, kfence, thp debug).

> The reason I'm bringing this up is because this function overall looks
> kind of unnecessary. Page isolation checks all of these conditions
> already, and arbitrates huge pages on hugepage_migration_supported() -
> which seems to be the semantics you also desire here.
> 
> Would it make sense to just remove pfn_range_valid_contig()?

This seems like a pretty clear optimization that was added at some point
to prevent incurring the cost of starting to isolate 512MB of pages and
then having to go undo it because it ran into a single huge page.

        for_each_zone_zonelist_nodemask(zone, z, zonelist,
                                        gfp_zone(gfp_mask), nodemask) {

                spin_lock_irqsave(&zone->lock, flags);
                pfn = ALIGN(zone->zone_start_pfn, nr_pages);
                while (zone_spans_last_pfn(zone, pfn, nr_pages)) {
                        if (pfn_range_valid_contig(zone, pfn, nr_pages)) {

                                spin_unlock_irqrestore(&zone->lock, flags);
                                ret = __alloc_contig_pages(pfn, nr_pages,
                                                        gfp_mask);
                                spin_lock_irqsave(&zone->lock, flags);

                        }
                        pfn += nr_pages;
                }
                spin_unlock_irqrestore(&zone->lock, flags);
        }

and then

__alloc_contig_pages
	ret = start_isolate_page_range(start, end, mode);

This is called without pre-checking the range for unmovable pages.

Seems dangerous to remove without significant data.

~Gregory
