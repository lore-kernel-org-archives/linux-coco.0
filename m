Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8900770
	for <linux-coco@lists.linux.dev>; Sun, 25 Jul 2021 09:16:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6EEC60E09;
	Sun, 25 Jul 2021 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627204615;
	bh=nJYuQzVsR6JGdUkH21WXr9c+Wtt1EQAEMbRJZVgHUkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFclnTBw32xWDxMXUYhMzu/34CBvAo2TBLvRS5C82fAqmVb01UFZOlGe3tzDe5Fkn
	 Eq/oTGW1nU3MSeTxY+qN9uIZ3Y+Vl/2EdID5q/BLMwIJLi/ytXJ2m1rwRcuqn12hFq
	 5Yo6Ze5VjDhc0/ywnT8pxX0epG3um0HKEITf8zjCUzKUwH7mZxd5rpRyBFnwTpS13J
	 XwFTrG1Gp4VBFVVtA36nF2cUVe8aJ89kGvlme7IccFIwj9mB6xFWX5wQvEgf9r8+Z8
	 5jUbzZJeQu6A1oXVwwU5qcdIe+btXbUNfa4uaPUNtBewzBJArezsDAgsjRGs4XiYso
	 6k+PQWSpcR+Cg==
Date: Sun, 25 Jul 2021 12:16:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YP0r/fC0MlESX2IW@kernel.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <YPre+9mTzPYp5Vt+@kernel.org>
 <20210723162959.uczshxmj2izxocw3@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723162959.uczshxmj2izxocw3@box.shutemov.name>

On Fri, Jul 23, 2021 at 07:29:59PM +0300, Kirill A. Shutemov wrote:
> On Fri, Jul 23, 2021 at 06:23:39PM +0300, Mike Rapoport wrote:
> > > @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
> > >  		if (entry->type == E820_TYPE_SOFT_RESERVED)
> > >  			memblock_reserve(entry->addr, entry->size);
> > >  
> > > -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> > > +		if (entry->type != E820_TYPE_RAM &&
> > > +		    entry->type != E820_TYPE_RESERVED_KERN &&
> > > +		    entry->type != E820_TYPE_UNACCEPTED)
> > >  			continue;
> > 
> > If I understand correctly, you assume that
> > 
> > * E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
> >   firmware/booloader
> > * E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
> >   encryption
> > 
> > What happens with other types? Particularly E820_TYPE_ACPI and
> > E820_TYPE_NVS that may reside in memory and might have been accepted by
> > BIOS.
> 
> Any accessible memory that not marked as UNACCEPTED has to be accepted
> before kernel gets control.

Hmm, that would mean that everything that runs before the kernel must
maintain precise E820 map. If we use 2M chunk as basic unit for accepting
memory, the firmware must also use the same basic unit. E.g. we can't have
an ACPI table squeezed between E820_TYPE_UNACCEPTED.

Using e820 table would also mean that bootloader must be able to modify
e820 and it also must follow the 2M rule.

I think that using a dedicated data structure would be more robust than
hooking into e820 table.

> > > +		if (entry->type == E820_TYPE_UNACCEPTED)
> > > +			mark_unaccepted(entry->addr, end);
> > > +
> > >  		memblock_add(entry->addr, entry->size);
> > >  	}
> > >  
> > > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > > index 72920af0b3c0..db9d1bcac9ed 100644
> > > --- a/arch/x86/kernel/setup.c
> > > +++ b/arch/x86/kernel/setup.c
> > > @@ -944,6 +944,8 @@ void __init setup_arch(char **cmdline_p)
> > >  	if (movable_node_is_enabled())
> > >  		memblock_set_bottom_up(true);
> > >  #endif
> > > +	/* TODO: make conditional */
> > > +	memblock_set_bottom_up(true);
> >   
> > If memory is accepted during memblock allocations this should not really
> > matter.
> > Bottom up would be preferable if we'd like to reuse as much of already
> > accepted memory as possible before page allocator is up.
> 
> One of the main reason for this feature is to speed up boot time and
> re-usinging preaccepted memory fits the goal.

Using bottom up also means that early allocations end up in DMA zones,
which probably not a problem for VMs in general, but who knows what path
through devices people would want to use...
 
> > > --- a/mm/memblock.c
> > > +++ b/mm/memblock.c
> > > @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
> > >  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
> > >  		     &base, &end, (void *)_RET_IP_);
> > >  
> > > +	accept_pages(base, base + size);
> > 
> > Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
> > can be called to reserve memory owned by firmware which not necessarily
> > would be encrypted. Besides, memblock_reserve() may be called for absent
> > memory, could be it'll confuse TDX/SEV?
> 
> Such memory will not be marked as unaccepted and accept_pages() will do
> nothing.
> 
> > Ideally, the call to accept_pages() should live in
> > memblock_alloc_range_nid(), but unfortunately there still stale
> > memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.
> 
> memblock_reserve() is the root of memory allocation in the early boot and
> it is natual place to do the trick. Unless we have a good reason to move
> it somewhere I would keep it here.

I think it is better to accept memory that is actually allocated rather
than marked as being used. It'll make it more robust against future changes
in memblock_reserve() callers and in what is accept_pages() in your patch. 

-- 
Sincerely yours,
Mike.
