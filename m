Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893D72
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 10:00:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB0B160184;
	Mon, 26 Jul 2021 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627293620;
	bh=z/OFuc9hc0xJiBcN463HSnCaBHTi/PJ/HREG5zJQeuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4vlRH7OuvJEfC1XgoOrQZ8fWBwFurzTnaIvEVVadV/1dJ5iSbybbBqUB+VdbXIhg
	 PKMoUGYns/daCfhutkIockJ2RpgBjGE3S6aWznerQ6D3JFHfcoEI1jxtUbcmiVAf4A
	 Zir+vR3t4jsi7nM++46IfrvK8eINSMpCQPK/FvOwjVLYqvHZJ0PsDB1tIS1J6r8PLe
	 bBEippDLVCYAVy5LRQGW9PJCZWnKhmhxdoUwWPsj2gQ0U1/oVmGp+yX1DgIv+I4Lxm
	 EbZANKQ+J9mxn4lpNiMZLk4Rq7fk22AtRxp8aVpmRvqKRcti/FE1Wo9rahj0UmmZ/+
	 pcS7dlwxfo2kg==
Date: Mon, 26 Jul 2021 13:00:12 +0300
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
Message-ID: <YP6HrBIjToDDOVxa@kernel.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <YPre+9mTzPYp5Vt+@kernel.org>
 <20210723162959.uczshxmj2izxocw3@box.shutemov.name>
 <YP0r/fC0MlESX2IW@kernel.org>
 <20210725182828.6o57hc6j72urwxkz@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725182828.6o57hc6j72urwxkz@box.shutemov.name>

On Sun, Jul 25, 2021 at 09:28:28PM +0300, Kirill A. Shutemov wrote:
> On Sun, Jul 25, 2021 at 12:16:45PM +0300, Mike Rapoport wrote:
> > On Fri, Jul 23, 2021 at 07:29:59PM +0300, Kirill A. Shutemov wrote:
> > > On Fri, Jul 23, 2021 at 06:23:39PM +0300, Mike Rapoport wrote:
> > > > > @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
> > > > >  		if (entry->type == E820_TYPE_SOFT_RESERVED)
> > > > >  			memblock_reserve(entry->addr, entry->size);
> > > > >  
> > > > > -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> > > > > +		if (entry->type != E820_TYPE_RAM &&
> > > > > +		    entry->type != E820_TYPE_RESERVED_KERN &&
> > > > > +		    entry->type != E820_TYPE_UNACCEPTED)
> > > > >  			continue;
> > > > 
> > > > If I understand correctly, you assume that
> > > > 
> > > > * E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
> > > >   firmware/booloader
> > > > * E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
> > > >   encryption
> > > > 
> > > > What happens with other types? Particularly E820_TYPE_ACPI and
> > > > E820_TYPE_NVS that may reside in memory and might have been accepted by
> > > > BIOS.
> > > 
> > > Any accessible memory that not marked as UNACCEPTED has to be accepted
> > > before kernel gets control.
> > 
> > Hmm, that would mean that everything that runs before the kernel must
> > maintain precise E820 map. If we use 2M chunk as basic unit for accepting
> > memory, the firmware must also use the same basic unit. E.g. we can't have
> > an ACPI table squeezed between E820_TYPE_UNACCEPTED.
> 
> No. See mark_unaccepted(). Any chunks that cannot be accepted with 2M, get
> accepted upfront, so we will not need to track them.

What will happen with the following E820 table:

0x400000 - 0x401000 - ACPI (accepted by BIOS)
0x401000 - 0x408000 - UNACCEPTED
0x408000 - 0x409000 - ACPI (accepted by BIOS)

> (I've just realized that mark_unaccepted() is buggy if 'start' and 'end'
> are in the same 2M. Will fix.)
> 
 
> > > > > --- a/mm/memblock.c
> > > > > +++ b/mm/memblock.c
> > > > > @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
> > > > >  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
> > > > >  		     &base, &end, (void *)_RET_IP_);
> > > > >  
> > > > > +	accept_pages(base, base + size);
> > > > 
> > > > Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
> > > > can be called to reserve memory owned by firmware which not necessarily
> > > > would be encrypted. Besides, memblock_reserve() may be called for absent
> > > > memory, could be it'll confuse TDX/SEV?
> > > 
> > > Such memory will not be marked as unaccepted and accept_pages() will do
> > > nothing.
> > > 
> > > > Ideally, the call to accept_pages() should live in
> > > > memblock_alloc_range_nid(), but unfortunately there still stale
> > > > memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.
> > > 
> > > memblock_reserve() is the root of memory allocation in the early boot and
> > > it is natual place to do the trick. Unless we have a good reason to move
> > > it somewhere I would keep it here.
>
> > I think it is better to accept memory that is actually allocated rather
> > than marked as being used. It'll make it more robust against future changes
> > in memblock_reserve() callers and in what is accept_pages() in your patch. 
> 
> I disagree.
> 
> If we move accept_pages() up to callers we will make less robust: any new
> user of memblock_reserve() has to consider if accept_pages() is needed and
> like would ignore it since it's not essential for any non-TDX/non-SEV use
> case.

I do not suggest to move accept_pages() to all the callers of
memblock_reserve(). I suggest to replace memblock_find_in_range() +
memblock_reserve() pairs with an appropriate memblock_alloc call, make
memblock_find_in_range() static and put accept_pages() there.

This essentially makes memblock_find_in_range() the root of early memory
*allocations* while memblock_reserve() would be only used to mark the
memory that is already used before the allocations can start.

Then we only deal with acceptance of the memory kernel actually allocates.

I can't think now of a concrete example of what may go wrong with calling
accept_pages() from memblock_reserve(), it's more of a gut feeling.

-- 
Sincerely yours,
Mike.
