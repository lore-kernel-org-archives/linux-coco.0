Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0D11854
	for <linux-coco@lists.linux.dev>; Tue, 17 May 2022 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652810670; x=1684346670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mMyjDi4hwSid116h3PB/BgQEO9/8AhfI/qetQElWaiI=;
  b=cxzpsLlxAufLCs2DMdIc0XiNN9TItafssvE7JezaAOi/py7VEuIY+Xwy
   X8Q2Kw8bSe/aNM14W2jK3LGADh62jdhmHYyMENZsYBCTXRYhnUQ7MiAs/
   jBW9+Uvlq21m5S5Mx+YWaiP8ovYi9+TmhLeVtx3rj1DckDbKr9/XpaQ27
   l9WcU7aKcxFgmE8ZCp+jfDvCd889SUabNiaVhYeVz7puQn9n06F+iZ9HQ
   zQbTLswFyKViqWjaTWlePJIvm4iEracfkKlU9PfgNxuwLUgAGrcypJLFE
   RTmxH1/AoCRj+5R2nOUQkO8k6DvgcgXMgX18mE0ejqObf6oyUS0ZDcQw4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="334317207"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="334317207"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 11:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="700178885"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 17 May 2022 11:04:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id ADE56CE; Tue, 17 May 2022 21:04:19 +0300 (EEST)
Date: Tue, 17 May 2022 21:04:19 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, marcelo.cerri@canonical.com,
	tim.gardner@canonical.com, khalid.elmously@canonical.com,
	philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCHv6 02/15] mm: Add support for unaccepted memory
Message-ID: <20220517180419.ysqhiyrsa3jns53p@black.fi.intel.com>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-3-kirill.shutemov@linux.intel.com>
 <20220517104516.16fb0be5cb28153104b80654@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517104516.16fb0be5cb28153104b80654@linux-foundation.org>

On Tue, May 17, 2022 at 10:45:16AM -0700, Andrew Morton wrote:
> On Tue, 17 May 2022 18:34:31 +0300 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> 
> > UEFI Specification version 2.9 introduces the concept of memory
> > acceptance. Some Virtual Machine platforms, such as Intel TDX or AMD
> > SEV-SNP, require memory to be accepted before it can be used by the
> > guest. Accepting happens via a protocol specific to the Virtual Machine
> > platform.
> > 
> > ...
> >
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -928,6 +928,14 @@ static inline bool is_page_hwpoison(struct page *page)
> >  #define PG_offline	0x00000100
> >  #define PG_table	0x00000200
> >  #define PG_guard	0x00000400
> > +#define PG_unaccepted	0x00000800
> 
> "For pages that are never mapped to userspace (and aren't PageSlab),
> page_type may be used."
> 
> Is that true of these pages?

Yes. PG_unaccepted is never set for any allocated page. It is only set for
pages on free lists. It gets cleared in post_alloc_hook().

-- 
 Kirill A. Shutemov
