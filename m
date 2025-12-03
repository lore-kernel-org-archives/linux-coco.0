Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD98E307AC5
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792599; cv=none; b=QA69GA85iqjIlLiKBWk5IkCrBC3OrKrZ55+0EkwtFTMuZM0AKaHSML5g31FoilC1KTZpusuD8buhAP0198Nb9zC1frwReg+Q6lBeZ+Bahi80pX3AKIfR5ZnLwr3B7aqXeEetVfY3/tQIkrBfQa1NKTeE5fqqqgRUbQePhV8vZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792599; c=relaxed/simple;
	bh=57wWmRPUBcL0Yfd+9Ki/fopXu/DJLG+lZGJy/kPJKhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNUD6/Yv8mS5YsGUsvXlrozzqEL7mnuEL4rBz/kTGISfVqC2XcF19BF/sirWkk6zqStCGtum0mmcLa6vNaAR5bdODdE8VWS8DI0DUN0uyscpPjcQYPhLRow1nZ1IfiPXiDeYUVUBA1pJaPYwSDkjauoHkVnueULYKBBS33DWrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=r53euf+t; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="r53euf+t"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee257e56aaso1978411cf.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764792595; x=1765397395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dM9kmvuGcf01lAd6S+2H7PL5yiWV5TtpfoTgVCJUhlU=;
        b=r53euf+tTowj7G2ZrdH72qVCH2h+RX6O13RmEiryApxf6PtuWk+AgYJNxs+3TFP6TZ
         YDhxcAxfrlg1ObINuylaxDxdvwN5eYNzWW1I7gfal4KAxpRsVdMHOoEAvwKOoOPU4ZvZ
         2Pz7JCliKMFP9Hus7lju+YSJU24+2De+4xsDXDHWmoOwZBLX8I6pR+82iMkM3iGk/1XQ
         vKlPDmLmqfiS1u5mlO3Kq2UEzBWz2vEkaJMddKi3rcM4o6CfErFyLjW4eF4dfHzY8wZA
         oxb/LqMdL+sMdRJjoNPAcWPo1yEsqjguJ4pbpLcON52XLl3b0CYWT+G5QDYHtR5LV6DN
         fZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764792595; x=1765397395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM9kmvuGcf01lAd6S+2H7PL5yiWV5TtpfoTgVCJUhlU=;
        b=DjEDNZCviOKvQTsI+GwXcfn4u+HI6ApEGU5+yg+++tJ7KL3EvbppLUd9GJwSM58vkO
         CMaMKOhVP0e26RK6QeT1vhb1eTV5PXAS3DGSiAV/Rxbse20AkolgnPXVxzlNu7O4B87Y
         1MXWpwpTC8DH2cLfSK/OH/iBMPkzHMrUUYuQDUkk1QjUijk8YLHEcrp8RqexQZthb0Oj
         8EuCpACC42HtUa1iuMCTAKsM/Ck8Nv4kfv0ZbGGCJeujM7n+TtRoIJjBGammpUjPA8bN
         e3IIfOHjck95PGtfzPOWCzSlty2c3zarSm8h0NHpvpRn9V9b9cFC8xmBuqYsSB+/RlwA
         r9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxucHLs4cSEQI8X3EOMtRuwLAVX8T+YzHr01WTNoh/Pu141dPCYY3ZwcFcDJzSjBxH+5wlsQersMY2@lists.linux.dev
X-Gm-Message-State: AOJu0YzmobdqZUo91wyFrhdfUIU2zJQag5eyvZuJFGdsG/k1ihT/5n1H
	Ecb7l4VmhvR7VZH9e7x404bSX0YCiThtF1mkf1emTiaRmpjcDPRLmAWDli8oawlG+Lo=
X-Gm-Gg: ASbGncvNzs2QVvqcUCcRzA5GBqfT+tA2PRj6IFrcdjEvCtIhXoHuRcpL5+RgXMULAWk
	j9n5JInRdrcyCOoz+bgD9HcUlrgp5cSPuua1Bsinz8FAQQ2wh7Zp87pUxP46y4n8RQhnCAkFSIr
	cA4gVcMRafWIXovtQIQFPwtuSEppxDbu5Wg8rXtr5atZNttMswHe09FYKc17/3Pd4OvCNfMQQMp
	0mgDn5bcInjfcTVzUtLD5ClbrVLvwfeANd2VXop15aeczeYoHwqHfR0BB1XeEA8fc8X8dddJ2Vl
	sRLCwddyo3gQqJTE4+svULVE04+J6d3LWxy38kC+Zv5LuLyFEr6A3GTlS4c2gJ473wAPg4Gz/CM
	pC9vtcW/wrFVvF4eNS/vI0bicgSHqzWg73LoxussMjQ38lPXptSS5RY6wMs1QOMcr9M3fv6kxZ5
	IXma7dcniY37RXWe07BJQi6iEudI9W5pSp3qMQ4aa7RM2bjGxRRbTNOmhAbbgCz+YQBFbB5w==
X-Google-Smtp-Source: AGHT+IFswzoLbYyAnTaGWHaVOhoPJRdayisLZnLjNLq2Lu7DRCXUfj9vN9FAKPL4xYFJA51ycMkLVg==
X-Received: by 2002:ac8:574c:0:b0:4e6:df3e:2abe with SMTP id d75a77b69052e-4f023085a27mr12255981cf.9.1764792595536;
        Wed, 03 Dec 2025 12:09:55 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b8fcbesm133694426d6.54.2025.12.03.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:09:54 -0800 (PST)
Date: Wed, 3 Dec 2025 15:09:53 -0500
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
Message-ID: <aTCZEcJqcgGv8Zir@gourry-fedora-PF4VCD3F>
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
> On 12/3/25 19:01, Frank van der Linden wrote:
> > 
> > The PageHuge() check seems a bit out of place there, if you just
> > removed it altogether you'd get the same results, right? The isolation
> > code will deal with it. But sure, it does potentially avoid doing some
> > unnecessary work.
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

Worth noting that because this check really only applies to gigantic
page *reservation* (not faulting), this isn't necessarily incurred in a
time critical path.  So, maybe i'm biased here, the reliability increase
feels like a win even if the operation can take a very long time under
memory pressure scenarios (which seems like an outliar anyway).

~Gregory
