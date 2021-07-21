Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5566173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 09:20:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9200360231;
	Wed, 21 Jul 2021 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626859228;
	bh=GkynGoumT9wcm/sQsNIj2d0Z1J0oFLaY3PRxaTyQI/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZntQxYoO+PBiYIKN4O3Gpx5Za8TNKgL9JVVM7XxngldwunyMdZNrCPFP938PiR48
	 Gu8fH9SgDgtYtLSJFOL1xQs6uDz/6WAf49v9rSwhWZpL6CQz1JkUOR6kUY0rCdi6O9
	 sVC8IB4/FSQdoGxi9gyT/KP3IgeRN0rp+Fl/4fVsTlOGa9tWyalmKJrA9J7/jmsfYM
	 rf0jSPnGM+vrDsWFLDx2fqDfR33AOt/sLKzWtC60pN915956mgiBIHKStG1eYxEHRp
	 llXHu64l47YOavbdGaMDszOUTOBbmsfgi4K+YjK1SJbgPovlStEA9P9tIpGn1FcQZR
	 hDjA57rJ52QeA==
Date: Wed, 21 Jul 2021 12:20:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YPfm0VvLx8DcNjDh@kernel.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>

On Tue, Jul 20, 2021 at 08:30:04PM +0300, Kirill A. Shutemov wrote:
> On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> > Hi,
> > 
> > I'd like to get some movement again into the discussion around how to
> > implement runtime memory validation for confidential guests and wrote up
> > some thoughts on it.
> > Below are the results in form of a proposal I put together. Please let
> > me know your thoughts on it and whether it fits everyones requirements.
> 
> Thanks for bringing it up. I'm working on the topic for Intel TDX. See
> comments below.
> 
> > 
> > Thanks,
> > 
> > 	Joerg
> > 
> > Proposal for Runtime Memory Validation in Secure Guests on x86
> > ==============================================================

[ snip ]

> > 	8. When memory is returned to the memblock or page allocators,
> > 	   it is _not_ invalidated. In fact, all memory which is freed
> > 	   need to be valid. If it was marked invalid in the meantime
> > 	   (e.g. if it the memory was used for DMA buffers), the code
> > 	   owning the memory needs to validate it again before freeing
> > 	   it.
> > 
> > 	   The benefit of doing memory validation at allocation time is
> > 	   that it keeps the exception handler for invalid memory
> > 	   simple, because no exceptions of this kind are expected under
> > 	   normal operation.
> 
> During early boot I treat unaccepted memory as a usable RAM. It only
> requires special treatment on memblock_reserve(), which used for early
> memory allocation: unaccepted usable RAM has to be accepted, before
> reserving.

memblock_reserve() is not always used for early allocations and some of the
early allocations on x86 don't use memblock at all. Hooking
validation/acceptance to memblock_reserve() should be fine for PoC but I
suspect there will be caveats for production.
 
> For fine-grained accepting/validation tracking I use PageOffline() flags
> (it's encoded into mapcount): before adding an unaccepted page to free
> list I set the PageOffline() to indicate that the page has to be accepted
> before returning from the page allocator. Currently, we never have
> PageOffline() set for pages on free lists, so we won't have confusion with
> ballooning or memory hotplug.
>
> I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> MAX_ORDER). It is reasonable compromise on speed/latency.

Keeping fine grained accepting/validation information in the memory map
means it cannot be reused across reboots/kexec and there should be an
additional data structure to carry this information. It could be the same
structure that is used by firmware to inform kernel about usable memory,
just it needs to live after boot and get updates about new (in)validations.
Doing those in 2M/4M chunks will help to prevent this structure from
exploding.

BTW, as Dave mentioned, the deferred struct page init can also take care of
the validation.

-- 
Sincerely yours,
Mike.
