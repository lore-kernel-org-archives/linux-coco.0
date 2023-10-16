Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01537CA9
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 21:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP5ZNE8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697492388; x=1729028388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ULxm3ALCvLWzeStCPJp9aHPIk/h52vXh0JSPle2l5F8=;
  b=cP5ZNE8HMI0kVC4yfkg2Y8VXkEwO1g13g6SxYTSZcaJvZUHr8SMOAqaM
   3e4pjW5Bv/+MeuhPKD5HGPt/UO9gmVirZOqQy4lcbNx5dADhIAhLBMF+h
   9oImozbFVKtyEl97a5UbaADh0w34hHr673Hg4oDMdSnDCf49w3J3AbezV
   BYlZbpB0DAIZpMnbg0fUMMTOWWvoU95htngBFxrOyRGOITRLsVBa8vBjC
   wCfxdl3UTkEVciZne3MfNaG7zUnvxgBe6w11vqCuPIA1sbc8RuSBX3DLv
   Jokif8T5BV1fa6HeoIGVyz+O/X3aIv6FE90o20lD3aKpS4IJFr7khANfC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382863475"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="382863475"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749425295"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="749425295"
Received: from ranaelna-mobl.amr.corp.intel.com (HELO box.shutemov.name) ([10.251.208.247])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:39:35 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id DE88C10A1F3; Tue, 17 Oct 2023 00:39:32 +0300 (+03)
Date: Tue, 17 Oct 2023 00:39:32 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com, tim.gardner@canonical.com,
	philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com,
	x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org, Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel
 memory acceptance
Message-ID: <20231016213932.6cscnn6tsnzsnvmf@box.shutemov.name>
References: <20231016163122.12855-1-kirill.shutemov@linux.intel.com>
 <ZS15HZqK4hu5NjSh@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS15HZqK4hu5NjSh@casper.infradead.org>

On Mon, Oct 16, 2023 at 06:55:41PM +0100, Matthew Wilcox wrote:
> On Mon, Oct 16, 2023 at 07:31:22PM +0300, Kirill A. Shutemov wrote:
> >   v2:
> >    - Fix deadlock (Vlastimil);
> >    - Fix comments (Vlastimil);
> >    - s/cond_resched()/cpu_relax()/ -- cond_resched() cannot be called
> >      from atomic context;
> 
> Isn't there an implicit cpu_relax() while we're spinning?  Does this
> really accomplish anything?

You are right. It is useless. I will drop it in v3.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
