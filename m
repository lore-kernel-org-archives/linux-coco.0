Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478A870
	for <linux-coco@lists.linux.dev>; Fri, 23 Jul 2021 16:30:03 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id l17so2409814ljn.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Jul 2021 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dXQgyTXJsqiah7vHpQmXpgPxUDEXb2uiJiep4QJ23GQ=;
        b=fKvXt5EiWqrOM4ls4tg4E264uTkSLdtg6RCvpgx2joforvO5ArfN9sc7HzfS8GABBe
         qVFyxqGz+c2TYD5HUlr0YMrRmNA4PLtfKDkJUKBSS0usMGmYUj0Yikz96tH/gXFFfydc
         9WoAp3LoLTkxdNiykxoo4XLwpEgczpRA9qmA/jEb6ephHmvAJexsubxMOMC5i/eBRifL
         Nf1qDeCvoXJ69FYOq397Fs5rgJzKnrDnO2p4qtJMIa7Apc4WAb8SORdQSfeqwrA9L7ZO
         w5wNOq/A5ovAaR+lv1TplBXbQUIQOO8c1tJmddSFv/zzSwnDFhHI88C5R1ppVUGjLc3B
         qykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dXQgyTXJsqiah7vHpQmXpgPxUDEXb2uiJiep4QJ23GQ=;
        b=Hwr9pnZUs8nYVhZEdmDZaOub+AwmocCautmbnLlIOrG+Rk5wx+2QbBaRm/ASp/rMAL
         4iPVWv7XBI1GVOaphtTmooIko9b12ag8kU0lsrJ6iDLEbGdQ1+ojV1hoYrQV4yCQdDll
         echSIT2Y7tNC8Qwytu30El0yf7nyq4LO/aG1f3txoFkfdU6w9Hmm4rqU8eW4x2WnadDh
         WQQTNiG+4UeQ7AQSFo67c/et5KFI44jIpXXKgaw2z2mbPpErv/Tr6qjTpsC/lRGt8+i/
         g/OWkYCHuX8SpeCkMx8gRYQXS2RDWDNNeTqN5DZQ058tiFoTtZdRCWKx3yW+UelvBnBs
         xf1w==
X-Gm-Message-State: AOAM5301dzenQZmOQfBSsrmofJ57P/FdLpKf+pDY0NpXzaQo9vfDSCvE
	kRroGDs4PGuf8fLxyIhOY80wbg==
X-Google-Smtp-Source: ABdhPJwXWjxpnHRaY6MSBF6ZTckUkjUMR2LBd7leUi+mMN/8sp7OzVCGASWzq26PrJUwd5Mkg1SI6w==
X-Received: by 2002:a2e:3c0d:: with SMTP id j13mr3836053lja.414.1627057801304;
        Fri, 23 Jul 2021 09:30:01 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id m25sm2286194lfq.209.2021.07.23.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 09:30:00 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 292B4102674; Fri, 23 Jul 2021 19:29:59 +0300 (+03)
Date: Fri, 23 Jul 2021 19:29:59 +0300
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
Message-ID: <20210723162959.uczshxmj2izxocw3@box.shutemov.name>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <YPre+9mTzPYp5Vt+@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPre+9mTzPYp5Vt+@kernel.org>

On Fri, Jul 23, 2021 at 06:23:39PM +0300, Mike Rapoport wrote:
> > @@ -1318,9 +1327,14 @@ void __init e820__memblock_setup(void)
> >  		if (entry->type == E820_TYPE_SOFT_RESERVED)
> >  			memblock_reserve(entry->addr, entry->size);
> >  
> > -		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> > +		if (entry->type != E820_TYPE_RAM &&
> > +		    entry->type != E820_TYPE_RESERVED_KERN &&
> > +		    entry->type != E820_TYPE_UNACCEPTED)
> >  			continue;
> 
> If I understand correctly, you assume that
> 
> * E820_TYPE_RAM and E820_TYPE_RESERVED_KERN regions are already accepted by
>   firmware/booloader
> * E820_TYPE_UNACCEPTED would have been E820_SYSTEM_RAM if we'd disabled
>   encryption
> 
> What happens with other types? Particularly E820_TYPE_ACPI and
> E820_TYPE_NVS that may reside in memory and might have been accepted by
> BIOS.

Any accessible memory that not marked as UNACCEPTED has to be accepted
before kernel gets control.

> >  
> > +		if (entry->type == E820_TYPE_UNACCEPTED)
> > +			mark_unaccepted(entry->addr, end);
> > +
> >  		memblock_add(entry->addr, entry->size);
> >  	}
> >  
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index 72920af0b3c0..db9d1bcac9ed 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -944,6 +944,8 @@ void __init setup_arch(char **cmdline_p)
> >  	if (movable_node_is_enabled())
> >  		memblock_set_bottom_up(true);
> >  #endif
> > +	/* TODO: make conditional */
> > +	memblock_set_bottom_up(true);
>   
> If memory is accepted during memblock allocations this should not really
> matter.
> Bottom up would be preferable if we'd like to reuse as much of already
> accepted memory as possible before page allocator is up.

One of the main reason for this feature is to speed up boot time and
re-usinging preaccepted memory fits the goal.

> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -814,6 +814,7 @@ int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
> >  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
> >  		     &base, &end, (void *)_RET_IP_);
> >  
> > +	accept_pages(base, base + size);
> 
> Hmm, I'm not sure memblock_reserve() is the right place to accept pages. It
> can be called to reserve memory owned by firmware which not necessarily
> would be encrypted. Besides, memblock_reserve() may be called for absent
> memory, could be it'll confuse TDX/SEV?

Such memory will not be marked as unaccepted and accept_pages() will do
nothing.

> Ideally, the call to accept_pages() should live in
> memblock_alloc_range_nid(), but unfortunately there still stale
> memblock_find_in_range() + memblock_reserve() pairs in x86 setup code.

memblock_reserve() is the root of memory allocation in the early boot and
it is natual place to do the trick. Unless we have a good reason to move
it somewhere I would keep it here.

-- 
 Kirill A. Shutemov
