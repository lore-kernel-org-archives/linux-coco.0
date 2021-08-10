Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390370
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 17:32:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="236964867"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="236964867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 10:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="570859629"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2021 10:31:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 2147AF9; Tue, 10 Aug 2021 20:31:24 +0300 (EEST)
Date: Tue, 10 Aug 2021 20:31:24 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] x86: Impplement support for unaccepted memory
Message-ID: <20210810173124.vzxpluaepdfe5aum@black.fi.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <4b80289a-07a4-bf92-9946-b0a8afb27326@intel.com>
 <20210810151548.4exag5uj73bummsr@black.fi.intel.com>
 <82b8836f-a467-e5ff-08f3-704a85b9faa0@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82b8836f-a467-e5ff-08f3-704a85b9faa0@intel.com>

On Tue, Aug 10, 2021 at 08:51:01AM -0700, Dave Hansen wrote:
> In other words, I buy the boot speed argument.  But, I don't buy the
> "this saves memory long term" argument at all.

Okay, that's a fair enough. I guess there's *some* workloads that may
have memory footprint reduced, but I agree it's minority.

> >> I had expected this series, but I also expected it to be connected to
> >> CONFIG_DEFERRED_STRUCT_PAGE_INIT somehow.  Could you explain a bit how
> >> this problem is different and demands a totally orthogonal solution?
> >>
> >> For instance, what prevents us from declaring: "Memory is accepted at
> >> the time that its 'struct page' is initialized" ?  Then, we use all the
> >> infrastructure we already have for DEFERRED_STRUCT_PAGE_INIT.
> > 
> > That was my first thought too and I tried it just to realize that it is
> > not what we want. If we would accept page on page struct init it means we
> > would make host allocate all memory assigned to the guest on boot even if
> > guest actually use small portion of it.
> > 
> > Also deferred page init only allows to scale memory accept across multiple
> > CPUs, but doesn't allow to get to userspace before we done with it. See
> > wait_for_completion(&pgdat_init_all_done_comp).
> 
> That's good information.  It's a refinement of the "I want to boot
> faster" requirement.  What you want is not just going _faster_, but
> being able to run userspace before full acceptance has completed.
> 
> Would you be able to quantify how fast TDX page acceptance is?  Are we
> talking about MB/s, GB/s, TB/s?  This series is rather bereft of numbers
> for a feature which making a performance claim.
> 
> Let's say we have a 128GB VM.  How much does faster does this approach
> reach userspace than if all memory was accepted up front?  How much
> memory _could_ have been accepted at the point userspace starts running?

Acceptance code is not optimized yet: we accept memory in 4k chunk which
is very slow because hypercall overhead dominates the picture.

As of now, kernel boot time of 1 VCPU and 64TiB VM with upfront memory
accept is >20 times slower than with this lazy memory accept approach.

The difference is going to be substantially lower once we get it optimized
properly.

-- 
 Kirill A. Shutemov
