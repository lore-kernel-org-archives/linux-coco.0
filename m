Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6B173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 00:38:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296911183"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="296911183"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 17:38:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="415424790"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 17:38:55 -0700
Date: Tue, 20 Jul 2021 17:38:54 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Erdem Aktas <erdemaktas@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <20210721003854.GD535804@tassilo.jf.intel.com>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
 <CAAYXXYxfpc8ix2dWzsPJ8Ew-fHROKm+WYLemjD1U8cTqzy6BHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAYXXYxfpc8ix2dWzsPJ8Ew-fHROKm+WYLemjD1U8cTqzy6BHQ@mail.gmail.com>

> > > >> Also in general i don't think it will really happen, at least
> > > initially.
> > > >> All the shared buffers we use are allocated and never freed. So such a
> > > >> problem could be deferred.
> > >
> > > Does it not depend on kernel configs? Currently, there is a valid
> > > control path in dma_alloc_coherent which might alloc and free shared
> > > pages.
> >
> > If the device filter is active it won't.
> >
> 
> If I am not missing something, I do not see that the device filter
> checks for CONFIG_DMA_COHERENT_POOL and if it is not enabled,
> dma_alloc_coherent will allocate a regular memory, convert it to
> shared and convert it back to private when it is freed.

What I meant is that the only devices that will be supported (mainly
virtio) initially don't ever free coherent memory
And the device filter enforces that.

Now we probably want to support freeing anyways just to be able to run
without device filter, but it definitely doesn't have to be fast
or efficient. If there's a problem with it it would be a quite reasonable
implementation to keep it in a pool.

-Andi
