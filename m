Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521E13A265
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558023; cv=none; b=U6wrBqK5wdNKdACDN20lny8IoCqfuLh2EEJPsHdngm9NnjzwT2SY2uMJiEeQ+nz17XB/xk1CJyrgJ2u+uRPEHlNioo+sTUxkEsrrsgHwGcNd3hoGVZCJVYDBriYjxpvEKMelRmyxGwtN77hCFDod6joUQig7LhblfLtrMfwD+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558023; c=relaxed/simple;
	bh=Z0vBXO/loqohfGa22HfiNkucHedKAaHavqhq7CkMCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM6LhWb2aJLfLZqbkW2LR7W+8rSsoOz7wdhgoVzOW8/A0hYaUJ7zCE4Oe+zYh/PsfO75hqrrnhxaxzWqzD4LNac1WceZWFpPfaZee1sHdAnl/8HMsVaMLuJtQDbKH3QDMQqEymaXLsAbqnxmNanD4mWXvnOZffMz5Qb8WpTjz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McYjZms6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McYjZms6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746558020; x=1778094020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z0vBXO/loqohfGa22HfiNkucHedKAaHavqhq7CkMCBY=;
  b=McYjZms6sOTTuojzeUCSDS3pAjI2h71TgfNQ8KGzv/wJssuj0jwNZaAC
   P/dubouB5/WrdViCrKTulrdbNDj+nmv5lQxppgtFeo5qtQzo+wsTAVhKV
   iiZtrlZ2R2bO8fBDq7V6y2zVMsK0Ad/hEkgCV/3ekGUv07fMhZAAXT11L
   LGxwaTGpxcbRkEyDcnOV8wqpLraTaIsVSG0jLnZEj0AIhPkgMC2c1B8vg
   BLmzQ1zZdtlRkuyJfI5JF2AWOAOejrQnfhg6ooRDyRMHkJDmQtKq7IOkx
   Fe1SSpjAsWUagGYfEsbRwPYmf6qt//UhCv3lcHGkxc2QlvFwR9bo267yO
   g==;
X-CSE-ConnectionGUID: S5MJaGzJQTCTttGSOqBJEg==
X-CSE-MsgGUID: miW8TogdQVGO5ufzRgq00A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52068987"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="52068987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:00:19 -0700
X-CSE-ConnectionGUID: lS+c777GTYeKcz2mU8LuKQ==
X-CSE-MsgGUID: lpzgMqx7StSWyfHIleru1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="159006784"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2025 12:00:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E6549172; Tue, 06 May 2025 22:00:12 +0300 (EEST)
Date: Tue, 6 May 2025 22:00:12 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
Message-ID: <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
 <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>

On Tue, May 06, 2025 at 10:18:21AM -0700, Alexei Starovoitov wrote:
> On Tue, May 6, 2025 at 4:25 AM Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > try_alloc_pages() will not attempt to allocate memory if the system has
> > *any* unaccepted memory. Memory is accepted as needed and can remain in
> > the system indefinitely, causing the interface to always fail.
> >
> > Rather than immediately giving up, attempt to use already accepted
> > memory on free lists.
> >
> > Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> > for ALLOC_TRYLOCK requests.
> >
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation")
> 
> Thanks for working on this, but the fixes tag is overkill.
> This limitation is not causing any issues in our setups.

Have you had chance to test it on any platform with unaccepted memory?
So far it is only Intel TDX and AMD SEV guests.

> Improving it is certainly better, of course.
> Acked-by: Alexei Starovoitov <ast@kernel.org>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
