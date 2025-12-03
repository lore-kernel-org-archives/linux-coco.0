Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F321E342524
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783140; cv=none; b=Qs28zUvMO8m2215sbkh8Cz35hpLWxOijuZsztb4yTPJOB7zCNPGvQB72+Rgo/c09x1WXC/6P4NK7ogHD4o7MgQdEw4lfKZsyoSme/8wyo0h0n9W68VdixPsYtioGSTz14AwlnELyVD7haIo2eNhVT8TbCP8VPrPg1leK0ITb8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783140; c=relaxed/simple;
	bh=N7OKcRPraIwwOO+e5acnIG0+6lKUBkn3zohe7EwnngU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjgtX362i1q9QSnOis7s3sXDakIBM9ZySFNiTa4Ge0z1qDzGYHAXDu4rEBMSnnrL00TmHwmb6FvcPxCudtjUGYWYmokZZDX0s0E85bcgfu5Ql0oisq8GjOkt+aa7OBN6y4QM8epXkj1CB5HKeAhkhuIf9Qzd62ACcWTWE/AZM/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=TK0pGZui; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="TK0pGZui"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee2014c228so172801cf.2
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1764783136; x=1765387936; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXfrLUBUUNxWrlXQZfRVAlemBKM14MYadMSOQJLP4KM=;
        b=TK0pGZui6DYhJGPl07IwPqD3qLwP2o/yOlIT4PooWAgfQ1oK/PsMHfq/zmKmofsCTa
         bFNnO0AGelNpKF4W3SKHqAGrmkdvR7j9UyaWLXN2s6XK9ta3KYk5186EXkqRB6d01j1i
         7Wsaz0pJPhyO0bAdW4+HddTidyIRkdCYueRcyThZv5jzeTwhor9aEXif8qQN5UkSRsAT
         y19lDADYPuVtGaLflQg/KF9mbf+wS5/V0ThyRLKlnuFvx7utc9hNfu+K0Vz0/PKvked6
         RlRA4dv6i0xCGVAYSpXMUj/A/DvDx3arbYusstJyrGPKyyU3MdZOe7y2bnRcsd0qQQFo
         mENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783136; x=1765387936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXfrLUBUUNxWrlXQZfRVAlemBKM14MYadMSOQJLP4KM=;
        b=EN85w/BntubjvyxhaP7q195qxsvvcNMO5R4cvQQpS2WfYVRaBHxaFstUaFQLwEClHt
         rofun/dqVeo/yCRBZxtNnri+ejpWLgL4L0xIuC+XYDSVfhX2w8+ZtFoX2XPgNGPosB0u
         +QcWImuV8fvPEElXKC8hVqjh5IeOUKztVbiyJbv5eJKOqHxvzMq55egidh4NYQLkotjq
         5zYOTjwmDFfzNdz/BPpckVutQ87EBya4tc5szKgDD3xykeEDvie/cKjE+AQ5jCmZZYQ2
         2AklgNWEGii8Lw/s8oFog5vRirk6gthM2K193yPnzE0jsceedPndmEbuDRqMhoB09WdO
         KAmw==
X-Forwarded-Encrypted: i=1; AJvYcCXJGflJ21RQlDKf0rKI0numcJjmXltluyXmMM32DiID4+YPUDlDo0bFFVmmE8f2xvzztg2Y0+oyJbGK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2qxigLrvBAKBngEZ8Udlf9EEq52LI3hUKDmwg1bCXAXCzX9Qw
	7GO9jJriW2L3g4v9Km2GEDh7bb271GQYW68kgA61qC98/KXo5J2F5LfykQCREbBvPuc=
X-Gm-Gg: ASbGnct+4/Uohx2rNcdNaUQFq/fC6mhbIm2BfFNtPfIXko2eRzAfyjHZddPrK5Jv19N
	vs4kRB/s5SprSJ9Id6foDs4EHcRGFRLm88KUh9/2Vs/4A6u+xAhsbKjGWQBHE6XvAHIpOhGgk8S
	q/gTbTSsm29cJb6cycD5wyZ3BvxRookU+/skBKhjXbq7OwW5WWKvo9Whrr3E/K4NSvIjb/SbSDU
	tsvjRwdYqfBMI/YKYAQmeCM6II+KO5jfKHMOSXQ9t55OrTjHCWbdKRC1eOcgudebVS3tujjHv5w
	zpgEO/kVFkUkI/P4K2bNvyb3t3hEhMAgLEZ9sfwjskvZ425R1dOYPUIPSlviXsaY+XUi9Xt+R1Y
	TwS8PqpD4ar3IAWkh6fSBA+xKJLPi+YS/AkfZ/xjm2VhL5jSZ7ipHSTXlEWCSyF/1MHI8yTEtXf
	foyxlKCFnXtw==
X-Google-Smtp-Source: AGHT+IHjhRSsYojqPIH4nCotrtO7/FPORpmU3S+uq1yOdc4D+I4pkxVbp8jOs/i2z+ku8NQQIlusKQ==
X-Received: by 2002:a05:622a:1489:b0:4ed:a744:adc with SMTP id d75a77b69052e-4f01757f2e8mr38710771cf.10.1764783135284;
        Wed, 03 Dec 2025 09:32:15 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd341f2f8sm115763391cf.22.2025.12.03.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:32:14 -0800 (PST)
Date: Wed, 3 Dec 2025 12:32:09 -0500
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
Message-ID: <20251203173209.GA478168@cmpxchg.org>
References: <20251203063004.185182-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203063004.185182-1-gourry@gourry.net>

On Wed, Dec 03, 2025 at 01:30:04AM -0500, Gregory Price wrote:
> We presently skip regions with hugepages entirely when trying to do
> contiguous page allocation.  This will cause otherwise-movable
> 2MB HugeTLB pages to be considered unmovable, and will make 1GB
> hugepages more difficult to allocate on systems utilizing both.
> 
> Instead, if hugepage migration is enabled, consider regions with
> hugepages smaller than the target contiguous allocation request
> as valid targets for allocation.
> 
> isolate_migrate_pages_block() has similar logic, and the hugetlb code
> does a migratable check in folio_isolate_hugetlb() during isolation.
> So the code servicing the subsequent allocaiton and migration already
> supports this exact use case (it's just unreachable).
> 
> To test, allocate a bunch of 2MB HugeTLB pages (in this case 48GB)
> and then attempt to allocate some 1G HugeTLB pages (in this case 4GB)
> (Scale to your machine's memory capacity).
> 
> echo 24576 > .../hugepages-2048kB/nr_hugepages
> echo 4 > .../hugepages-1048576kB/nr_hugepages
> 
> Prior to this patch, the 1GB page allocation can fail if no contiguous
> 1GB pages remain.  After this patch, the kernel will try to move 2MB
> pages and successfully allocate the 1GB pages (assuming overall
> sufficient memory is available).
> 
> folio_alloc_gigantic() is the primary user of alloc_contig_pages(),
> other users are debug or init-time allocations and largely unaffected.
> - ppc/memtrace is a debugfs interface
> - x86/tdx memory allocation occurs once on module-init
> - kfence/core happens once on module (late) init
> - THP uses it in debug_vm_pgtable_alloc_huge_page at __init time
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/linux-mm/6fe3562d-49b2-4975-aa86-e139c535ad00@redhat.com/
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: David Rientjes <rientjes@google.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/page_alloc.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 95d8b812efd0..8ca3273f734a 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7069,8 +7069,27 @@ static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
>  		if (PageReserved(page))
>  			return false;
>  
> -		if (PageHuge(page))
> -			return false;
> +		/*
> +		 * Only consider ranges containing hugepages if those pages are
> +		 * smaller than the requested contiguous region.  e.g.:
> +		 *     Move 2MB pages to free up a 1GB range.

This one makes sense to me.

> +		 *     Don't move 1GB pages to free up a 2MB range.

This one I might be missing something. We don't use cma for 2M pages,
so I don't see how we can end up in this path for 2M allocations.

The reason I'm bringing this up is because this function overall looks
kind of unnecessary. Page isolation checks all of these conditions
already, and arbitrates huge pages on hugepage_migration_supported() -
which seems to be the semantics you also desire here.

Would it make sense to just remove pfn_range_valid_contig()?
