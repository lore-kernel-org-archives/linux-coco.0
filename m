Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BCD72
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 18:39:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="214694390"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="214694390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 11:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="506299459"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2021 11:39:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 417E7F9; Tue, 10 Aug 2021 21:39:38 +0300 (EEST)
Date: Tue, 10 Aug 2021 21:39:38 +0300
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
Message-ID: <20210810183938.hdlqjhqj5kl4z3wp@black.fi.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <4b80289a-07a4-bf92-9946-b0a8afb27326@intel.com>
 <20210810151548.4exag5uj73bummsr@black.fi.intel.com>
 <82b8836f-a467-e5ff-08f3-704a85b9faa0@intel.com>
 <20210810173124.vzxpluaepdfe5aum@black.fi.intel.com>
 <51d9168c-ac14-0907-79b3-5d4dd46f92d6@intel.com>
 <20210810175144.uqlddcicyrweqb4j@black.fi.intel.com>
 <615ac2fc-8add-2dc4-22fa-e82d1bb745e1@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <615ac2fc-8add-2dc4-22fa-e82d1bb745e1@intel.com>

On Tue, Aug 10, 2021 at 11:19:30AM -0700, Dave Hansen wrote:
> On 8/10/21 10:51 AM, Kirill A. Shutemov wrote:
> > On Tue, Aug 10, 2021 at 10:36:21AM -0700, Dave Hansen wrote:
> >>> The difference is going to be substantially lower once we get it optimized
> >>> properly.
> >> What does this mean?  Is this future work in the kernel or somewhere in
> >> the TDX hardware/firmware which will speed things up?
> > Kernel has to be changed to accept memory in 2M and 1G chunks where
> > possible. The interface exists and described in spec, but not yet used in
> > guest kernel.
> 
> From a quick scan of the spec, I only see:
> 
> > 7.9.3. Page Acceptance by the Guest TD: TDG.MEM.PAGE.ACCEPT ... The guest
> > TD can accept a dynamically added 4KB page using TDG.MEM.PAGE.ACCEPT
> > with the page GPA as an input.
> Is there some other 2M/1G page-acceptance call that I'm missing?

I referred to GHCI[1], section 2.4.7. RDX=0 is 4k, RDX=1 is 2M and
RDX=2 is 1G.

Public specs have mismatches. I hope it will get sorted out soon. :/

[1] https://software.intel.com/content/dam/develop/external/us/en/documents/intel-tdx-guest-hypervisor-communication-interface.pdf

> > It would cut hypercall overhead dramatically. It makes upfront memory
> > accept more bearable and lowers latency of lazy memory accept. So I expect
> > the gap being not 20x, but like 3-5x (which is still huge).
> 
> It would be nice to be able to judge the benefits of this series based
> on the final form.  I guess we'll take what we can get, though.
> 
> Either way, I'd still like to see some *actual* numbers for at least one
> configuration:
> 
> 	With this series applied, userspace starts to run at X seconds
> 	after kernel boot.  Without this series, userspace runs at Y
> 	seconds.

Getting absolute numbers in public for unreleased product is tricky.
I hoped to get away with ratios or percentage of difference. 

-- 
 Kirill A. Shutemov
