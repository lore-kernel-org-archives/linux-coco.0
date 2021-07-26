Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F2168
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 11:53:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id r23so7821178lji.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 04:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vYlzhApG1lZQ/gnTh42UXFIupnAeWKz6aw0gN53pkcc=;
        b=hn+ScUdg3vfDtThEsaLo7Of5BXBvbT9fFqvNQlKVbX7cfebwwQi1dbyugYe1DczLfY
         PSxb0LAK08HFeW9RAo4Sr+AoTsNzo5NMKn8uWVjc55665Q2xLiGih51LHrdFr7x5pirI
         CeYrCRB6LNU0Cw0c+t8F0hLrlYhlSdkJtYZIxJAeTHf6MRsanah7vYIykutIJTDq1qIl
         M2uYAXgzdk8seyVzMnAsQyngQwQThjFWuc79o/B2vxcuW3iwkeCgM3w9B35quwfYtoNr
         e9Cn/NBclR2dhIiKHBc3LbOgqgXnbWdHWA9SedDwInxiyHgRR9Fs5cl4X/j8IFexMluf
         9zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vYlzhApG1lZQ/gnTh42UXFIupnAeWKz6aw0gN53pkcc=;
        b=aSOUxUw+9KyfgDRhsRqwBHXVmUivfCJl5n9J51rjUwegiH4M5greVtk6nhYMiMMBbs
         NiLWz6Cvd3W+K+XFk5g5Tb4pITuo6ErTKVVj+DcojB2RjIbUMr3jbxND9vuhXpMXJ4G3
         4Q7JOMbI4vjIsg36J66wRaG7Bkid8KdEbGfnHc99wW3ozTmJeWihlgRy4k848cM257eR
         4E+6SBk1lW6ga605Zuoy3i3w0Ey8Lg+5cTxbkimlBYn6lFbBo38S0UD/LmrC3lpzKCdT
         zYLphN52TqjI9/0Hivbw50ruEnqbqsw+lqDo1XObwLl39nqlOYiGPah/xp6ZKqW2H2l+
         7nog==
X-Gm-Message-State: AOAM531e3ZXbHzVxe7tbihCEAtsnnpAjWJ7DDE+ALPP1Z/s0PZdgGzAf
	klXl5B7Dfn1YWx2ZHA/Cx3rLPg==
X-Google-Smtp-Source: ABdhPJzUwV0Sh5MgJfeQ2GrQXOev9va9O0MV/a0eFQclBUkkbFEc8d2vgvF3JA/YlFir5biv2t86IA==
X-Received: by 2002:a2e:a414:: with SMTP id p20mr9720880ljn.207.1627300386019;
        Mon, 26 Jul 2021 04:53:06 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id b24sm1908104lfp.26.2021.07.26.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 04:53:05 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id DF5FE102960; Mon, 26 Jul 2021 14:53:04 +0300 (+03)
Date: Mon, 26 Jul 2021 14:53:04 +0300
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
Message-ID: <20210726115304.yiq2ovhg4qhbbuas@box.shutemov.name>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <YPre+9mTzPYp5Vt+@kernel.org>
 <20210723162959.uczshxmj2izxocw3@box.shutemov.name>
 <YP0r/fC0MlESX2IW@kernel.org>
 <20210725182828.6o57hc6j72urwxkz@box.shutemov.name>
 <YP6HrBIjToDDOVxa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP6HrBIjToDDOVxa@kernel.org>

On Mon, Jul 26, 2021 at 01:00:12PM +0300, Mike Rapoport wrote:
> On Sun, Jul 25, 2021 at 09:28:28PM +0300, Kirill A. Shutemov wrote:
> > On Sun, Jul 25, 2021 at 12:16:45PM +0300, Mike Rapoport wrote:
> > > On Fri, Jul 23, 2021 at 07:29:59PM +0300, Kirill A. Shutemov wrote:
> > > > On Fri, Jul 23, 2021 at 06:23:39PM +0300, Mike Rapoport wrote:
> > > > > > @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
> > > > > >  		if (entry->type == E820_TYPE_SOFT_RESERVED)
> > > > > >  			memblock_reserve(entry->addr, entry->size);
> > > > > >  
> > > > > > -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> > > > > > +		if (entry->type != E820_TYPE_RAM &&
> > > > > > +		    entry->type != E820_TYPE_RESERVED_KERN &&
> > > > > > +		    entry->type != E820_TYPE_UNACCEPTED)
> > > > > >  			continue;
> > > > > 
> > > > > If I understand correctly, you assume that
> > > > > 
> > > > > * E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
> > > > >   firmware/booloader
> > > > > * E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
> > > > >   encryption
> > > > > 
> > > > > What happens with other types? Particularly E820_TYPE_ACPI and
> > > > > E820_TYPE_NVS that may reside in memory and might have been accepted by
> > > > > BIOS.
> > > > 
> > > > Any accessible memory that not marked as UNACCEPTED has to be accepted
> > > > before kernel gets control.
> > > 
> > > Hmm, that would mean that everything that runs before the kernel must
> > > maintain precise E820 map. If we use 2M chunk as basic unit for accepting
> > > memory, the firmware must also use the same basic unit. E.g. we can't have
> > > an ACPI table squeezed between E820_TYPE_UNACCEPTED.
> > 
> > No. See mark_unaccepted(). Any chunks that cannot be accepted with 2M, get
> > accepted upfront, so we will not need to track them.
> 
> What will happen with the following E820 table:
> 
> 0x400000 - 0x401000 - ACPI (accepted by BIOS)
> 0x401000 - 0x408000 - UNACCEPTED
> 0x408000 - 0x409000 - ACPI (accepted by BIOS)

We will accept the on consructing the bitmap and don't mark as unaccepted
in the bitmap.

> > (I've just realized that mark_unaccepted() is buggy if 'start' and 'end'
> > are in the same 2M. Will fix.)
> > 
>  
> > > > > > --- a/mm/memblock.c
> > > > > > +++ b/mm/memblock.c
> > > > > > @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
> > > > > >  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
> > > > > >  		     &base, &end, (void *)_RET_IP_);
> > > > > >  
> > > > > > +	accept_pages(base, base + size);
> > > > > 
> > > > > Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
> > > > > can be called to reserve memory owned by firmware which not necessarily
> > > > > would be encrypted. Besides, memblock_reserve() may be called for absent
> > > > > memory, could be it'll confuse TDX/SEV?
> > > > 
> > > > Such memory will not be marked as unaccepted and accept_pages() will do
> > > > nothing.
> > > > 
> > > > > Ideally, the call to accept_pages() should live in
> > > > > memblock_alloc_range_nid(), but unfortunately there still stale
> > > > > memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.
> > > > 
> > > > memblock_reserve() is the root of memory allocation in the early boot and
> > > > it is natual place to do the trick. Unless we have a good reason to move
> > > > it somewhere I would keep it here.
> >
> > > I think it is better to accept memory that is actually allocated rather
> > > than marked as being used. It'll make it more robust against future changes
> > > in memblock_reserve() callers and in what is accept_pages() in your patch. 
> > 
> > I disagree.
> > 
> > If we move accept_pages() up to callers we will make less robust: any new
> > user of memblock_reserve() has to consider if accept_pages() is needed and
> > like would ignore it since it's not essential for any non-TDX/non-SEV use
> > case.
> 
> I do not suggest to move accept_pages() to all the callers of
> memblock_reserve(). I suggest to replace memblock_find_in_range() +
> memblock_reserve() pairs with an appropriate memblock_alloc call, make
> memblock_find_in_range() static and put accept_pages() there.
> 
> This essentially makes memblock_find_in_range() the root of early memory
> *allocations* while memblock_reserve() would be only used to mark the
> memory that is already used before the allocations can start.
> 
> Then we only deal with acceptance of the memory kernel actually allocates.

Okay, fair enough. I'll look into this.

-- 
 Kirill A. Shutemov
