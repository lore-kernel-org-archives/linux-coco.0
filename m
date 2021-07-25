Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1694770
	for <linux-coco@lists.linux.dev>; Sun, 25 Jul 2021 18:28:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id h14so11275938lfv.7
        for <linux-coco@lists.linux.dev>; Sun, 25 Jul 2021 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qyHqvuwmWtFxfU5VJzSTOWMWhtfy+6ml7UH5e/tRUUo=;
        b=pqus7Qithoz2+u5GtmSFaYe5XjRSAaYyhuBCbvs+H4X5VdnNdBGeer13fL/3FPWeTa
         vLdgqvud+EOnTbPoEbwHrc3+1gPeOFM4tbqxoIZjaeIARdV1boS/NYqq8NXVqTh/gSv1
         b1poGyt2VVLMTkRKG590ys0srh8NAXoxZIy1HMHK8apxry/hO4/37H+ytgdvwgCa1sma
         3VdOaxuYZscmGm8JEGjDRIgExRovGkkS2PLkmfAosms9bcweRi1duZGWehWK17YQoH+E
         pm/T+G2+AmShVSdw77WjU/c1QjI5t9Gl2uXhejdsh/Ci5XVS4CUr61OB+bfQkLsMdTtW
         nhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qyHqvuwmWtFxfU5VJzSTOWMWhtfy+6ml7UH5e/tRUUo=;
        b=ryx4xQW8vqrgxhHsFCej8iZah8OymYws45H108Jf/L00mHRsTYGOYkk8viYnvn/trD
         baWTH1cNdcz168EDzqwcSiefnVa58ryYYA/9bRdubLHDiV5781KK4lB0kX9JCrHzPZw4
         v0RhJyYPHdj7fY+Kz5xeX5HoDh7u5pt2aWzq14v5eUdLLJVUizFY47Iac6WPR+ONzCCI
         hNDKA2b70t5D/EfSgwozoQtMJX/AcARGsXkb6pIIgMFvRwhCIENT914qdnu9fiwy49v9
         ZULFBtcEPVlv94H+rGmShMHzQWxq84nlnb+tjafJ0cJQqaC11NCoRaSpaN6toS7NODAj
         l/IQ==
X-Gm-Message-State: AOAM533ROuZyW9AKlz11OtSGw0ngww1MBHnqILQlc/Kcyz6qWgNKRvRx
	GIYaPKRzbJnHJFeoQU7Vp4avUA==
X-Google-Smtp-Source: ABdhPJwFTGl5oQUyNytuEY+IW71qAw3k8Ogr360DOfDKTzVYLslF2MQEey3yEM8aiAvaXreZfk01yA==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr9930701lfu.591.1627237710094;
        Sun, 25 Jul 2021 11:28:30 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id r23sm1375981lji.26.2021.07.25.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 11:28:28 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id B9DA410281B; Sun, 25 Jul 2021 21:28:28 +0300 (+03)
Date: Sun, 25 Jul 2021 21:28:28 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20210725182828.6o57hc6j72urwxkz@box.shutemov.name>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <YPre+9mTzPYp5Vt+@kernel.org>
 <20210723162959.uczshxmj2izxocw3@box.shutemov.name>
 <YP0r/fC0MlESX2IW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP0r/fC0MlESX2IW@kernel.org>

On Sun, Jul 25, 2021 at 12:16:45PM +0300, Mike Rapoport wrote:
> On Fri, Jul 23, 2021 at 07:29:59PM +0300, Kirill A. Shutemov wrote:
> > On Fri, Jul 23, 2021 at 06:23:39PM +0300, Mike Rapoport wrote:
> > > > @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
> > > >  		if (entry->type == E820_TYPE_SOFT_RESERVED)
> > > >  			memblock_reserve(entry->addr, entry->size);
> > > >  
> > > > -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> > > > +		if (entry->type != E820_TYPE_RAM &&
> > > > +		    entry->type != E820_TYPE_RESERVED_KERN &&
> > > > +		    entry->type != E820_TYPE_UNACCEPTED)
> > > >  			continue;
> > > 
> > > If I understand correctly, you assume that
> > > 
> > > * E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
> > >   firmware/booloader
> > > * E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
> > >   encryption
> > > 
> > > What happens with other types? Particularly E820_TYPE_ACPI and
> > > E820_TYPE_NVS that may reside in memory and might have been accepted by
> > > BIOS.
> > 
> > Any accessible memory that not marked as UNACCEPTED has to be accepted
> > before kernel gets control.
> 
> Hmm, that would mean that everything that runs before the kernel must
> maintain precise E820 map. If we use 2M chunk as basic unit for accepting
> memory, the firmware must also use the same basic unit. E.g. we can't have
> an ACPI table squeezed between E820_TYPE_UNACCEPTED.

No. See mark_unaccepted(). Any chunks that cannot be accepted with 2M, get
accepted upfront, so we will not need to track them.

(I've just realized that mark_unaccepted() is buggy if 'start' and 'end'
are in the same 2M. Will fix.)


> Using e820 table would also mean that bootloader must be able to modify
> e820 and it also must follow the 2M rule.
> 
> I think that using a dedicated data structure would be more robust than
> hooking into e820 table.

Maybe. We can construct the bitmap in the decompresser and translate
EFI_UNACCEPTED_MEMORY to E820_TYPE_RAM. I will look into this.

> > > > +		if (entry->type == E820_TYPE_UNACCEPTED)
> > > > +			mark_unaccepted(entry->addr, end);
> > > > +
> > > >  		memblock_add(entry->addr, entry->size);
> > > >  	}
> > > >  
> > > > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > > > index 72920af0b3c0..db9d1bcac9ed 100644
> > > > --- a/arch/x86/kernel/setup.c
> > > > +++ b/arch/x86/kernel/setup.c
> > > > @@ -944,6 +944,8 @@ void __init setup_arch(char **cmdline_p)
> > > >  	if (movable_node_is_enabled())
> > > >  		memblock_set_bottom_up(true);
> > > >  #endif
> > > > +	/* TODO: make conditional */
> > > > +	memblock_set_bottom_up(true);
> > >   
> > > If memory is accepted during memblock allocations this should not really
> > > matter.
> > > Bottom up would be preferable if we'd like to reuse as much of already
> > > accepted memory as possible before page allocator is up.
> > 
> > One of the main reason for this feature is to speed up boot time and
> > re-usinging preaccepted memory fits the goal.
> 
> Using bottom up also means that early allocations end up in DMA zones,
> which probably not a problem for VMs in general, but who knows what path
> through devices people would want to use...

Good point. Maybe we can drop it. Will see based on performance
evaluation.
>
> > > > --- a/mm/memblock.c
> > > > +++ b/mm/memblock.c
> > > > @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
> > > >  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
> > > >  		     &base, &end, (void *)_RET_IP_);
> > > >  
> > > > +	accept_pages(base, base + size);
> > > 
> > > Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
> > > can be called to reserve memory owned by firmware which not necessarily
> > > would be encrypted. Besides, memblock_reserve() may be called for absent
> > > memory, could be it'll confuse TDX/SEV?
> > 
> > Such memory will not be marked as unaccepted and accept_pages() will do
> > nothing.
> > 
> > > Ideally, the call to accept_pages() should live in
> > > memblock_alloc_range_nid(), but unfortunately there still stale
> > > memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.
> > 
> > memblock_reserve() is the root of memory allocation in the early boot and
> > it is natual place to do the trick. Unless we have a good reason to move
> > it somewhere I would keep it here.
> 
> I think it is better to accept memory that is actually allocated rather
> than marked as being used. It'll make it more robust against future changes
> in memblock_reserve() callers and in what is accept_pages() in your patch. 

I disagree.

If we move accept_pages() up to callers we will make less robust: any new
user of memblock_reserve() has to consider if accept_pages() is needed and
like would ignore it since it's not essential for any non-TDX/non-SEV use
case.

-- 
 Kirill A. Shutemov
