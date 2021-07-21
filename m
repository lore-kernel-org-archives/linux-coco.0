Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806F173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:23:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9097B610F7;
	Wed, 21 Jul 2021 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626862988;
	bh=Wb597ASYs1DZYLZWGbZMlny2FEpE9Alkatv9sjs/NOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m319YrnVagHucetjsbElEITvwcLKdCSfufuK0V023/6UAMPKVPY9jiZAZY+EA8ItA
	 3EZ2+0slJfmALSoHPpCNygBXNzCUlh/FXu86jzuiP7+8iLKLkct/kk9/NX0TD2YOxY
	 6mRJQbkSOOSrm3bcB1P2jMihi7MuXt6IkBeFiTUY/EYoMBDxKJYyO03pKGidm+XkkM
	 edXlP5/TwbetOIv06NXnswM/I+VyxN9KbT72n4C0YvZFLwLOsdXGsWgErfXJ93a7NZ
	 g/h9nnNZvV8b0eAq4sgUxPemiQo0csosdt1gE2j/Et0jjwrtQC0C5iVG39bac8LbCg
	 etXfsyIbhcyCQ==
Date: Wed, 21 Jul 2021 13:22:56 +0300
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
Message-ID: <YPf1gNs1OoyS6dUt@kernel.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <YPfm0VvLx8DcNjDh@kernel.org>
 <20210721100206.mfldptiwiothowpz@box>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721100206.mfldptiwiothowpz@box>

On Wed, Jul 21, 2021 at 01:02:06PM +0300, Kirill A. Shutemov wrote:
> On Wed, Jul 21, 2021 at 12:20:17PM +0300, Mike Rapoport wrote:
> > On Tue, Jul 20, 2021 at 08:30:04PM +0300, Kirill A. Shutemov wrote:
> > > On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> > > > Hi,
> > > > 
> > > > I'd like to get some movement again into the discussion around how to
> > > > implement runtime memory validation for confidential guests and wrote up
> > > > some thoughts on it.
> > > > Below are the results in form of a proposal I put together. Please let
> > > > me know your thoughts on it and whether it fits everyones requirements.
> > > 
> > > Thanks for bringing it up. I'm working on the topic for Intel TDX. See
> > > comments below.
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > 	Joerg
> > > > 
> > > > Proposal for Runtime Memory Validation in Secure Guests on x86
> > > > ==============================================================
> > 
> > [ snip ]
> > 
> > > > 	8. When memory is returned to the memblock or page allocators,
> > > > 	   it is _not_ invalidated. In fact, all memory which is freed
> > > > 	   need to be valid. If it was marked invalid in the meantime
> > > > 	   (e.g. if it the memory was used for DMA buffers), the code
> > > > 	   owning the memory needs to validate it again before freeing
> > > > 	   it.
> > > > 
> > > > 	   The benefit of doing memory validation at allocation time is
> > > > 	   that it keeps the exception handler for invalid memory
> > > > 	   simple, because no exceptions of this kind are expected under
> > > > 	   normal operation.
> > > 
> > > During early boot I treat unaccepted memory as a usable RAM. It only
> > > requires special treatment on memblock_reserve(), which used for early
> > > memory allocation: unaccepted usable RAM has to be accepted, before
> > > reserving.
> > 
> > memblock_reserve() is not always used for early allocations and some of the
> > early allocations on x86 don't use memblock at all.
> 
> Do you mean any codepath in particular?

I don't have examples handy, but in general there are calls to
e820__range_update() that make memory !RAM and it never gets into memblock.
On the other side, memblock_reserve() can be called to reserve memory owned
y firmware that may be already accepted.

> > Hooking
> > validation/acceptance to memblock_reserve() should be fine for PoC but I
> > suspect there will be caveats for production.
> 
> That's why I do PoC. Will see. So far so good. Maybe it will be visible
> with smaller pre-accepted memory size.

Maybe some of my concerns only apply to systems with BIOSes weirder than
usual and for VMs all would be fine. 
I'd suggest to experiment with "memmap=" to manually assign various e820
types to memory chunks to see if there are any strange effects.
 
> > > For fine-grained accepting/validation tracking I use PageOffline() flags
> > > (it's encoded into mapcount): before adding an unaccepted page to free
> > > list I set the PageOffline() to indicate that the page has to be accepted
> > > before returning from the page allocator. Currently, we never have
> > > PageOffline() set for pages on free lists, so we won't have confusion with
> > > ballooning or memory hotplug.
> > >
> > > I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> > > MAX_ORDER). It is reasonable compromise on speed/latency.
> > 
> > Keeping fine grained accepting/validation information in the memory map
> > means it cannot be reused across reboots/kexec and there should be an
> > additional data structure to carry this information. It could be the same
> > structure that is used by firmware to inform kernel about usable memory,
> > just it needs to live after boot and get updates about new (in)validations.
> > Doing those in 2M/4M chunks will help to prevent this structure from
> > exploding.
> 
> Yeah, we would need to reconstruct the EFI map somehow. Or we can give
> most of memory back to the host and accept/validate the memory again after
> reboot/kexec. I donno.
> 
> > BTW, as Dave mentioned, the deferred struct page init can also take care of
> > the validation.
> 
> That was my first thought too and I tried it just to realize that it is
> not what we want. If we would accept page on page struct init it means we
> would make host allocate all memory assigned to the guest on boot even if
> guest actually use small portion of it.

Yep, you are right.
 
> Also deferred page init only allows to scale validation across multiple
> CPUs, but doesn't allow to get to userspace before we done with it. See
> wait_for_completion(&pgdat_init_all_done_comp).

True.

-- 
Sincerely yours,
Mike.
