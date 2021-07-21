Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C222FB0
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:02:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g22so2394767lfu.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MiQvc2L4nWsOsT8WGwoykJFvMgwXVPW9/HnWKa+est0=;
        b=aTJK2fXS52O17YRbhxVV2w5b+pncDOm6pIgVXt8jr9xU1jFz5kLqvwMUzFhTSfZmnv
         H46yHtq9R8o4tXjrc3iPd0K6TqtuIWGx9HTr/Q30m0e+nZjRYXOWP9/p1aGvjLFDv3f/
         57w79iXds/E7L3a38b3kuRLxLhST6WfcZVneLb/cl34N5nQSCmRc7RwW5yGv5Q4t82Ts
         JsGgLGy6qdV/dDVZauRNaTCxLF7XKJmtX52IdDeGUXmYQKDFrXr2lk0dzP+frlivBbKk
         NMH0aS/zF9dxmyU/nQgC1rkObQra+hIE2tdUyCxyGybkxLSq3AxDcaULquLO8AkAn9UQ
         g4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MiQvc2L4nWsOsT8WGwoykJFvMgwXVPW9/HnWKa+est0=;
        b=mVsG9U6QSYnPFTlxCGbOzqICZ729yz94e0aVK8JDxlWvlmwQNjVJnY04dZUs1QMM9P
         gtg7IP3ngvDdxwrTVkWGzZgpP4v6uBHs4tC+BefZ5kvS6CmaOTJGo+cGXkgCP5l11ojF
         gUjCG2B9cVkvFUmFr+6cmAsBzZTRQFHwlHO7lvGUXI34QT8dsrCbswgP2iQBoqPvbNUQ
         +q7qhlUdjIc7c/URrvlBkr1ckFqAIqQu+4SosBUx5OZKatnC4Sr7rod3BfOUhLuHFHzA
         B7g+jqLIWQ1aVPJXznq6Gb7O3+3vTCwoAvGhf53YPysmm8Y4/1Oc3upJAvda4Wyh5q9k
         Q/FQ==
X-Gm-Message-State: AOAM532YBgL0x/jkJFhTcG0Uspor8JRZBT+oYGpQzQmuzvk8Zqo41u46
	wmj2AT06CvX46/OPDLwN86TRYQ==
X-Google-Smtp-Source: ABdhPJzzAHu/iJcjc4hbXc4sBbAEmv71knVK9aDXNomPYl/cPJMCqArm444ZFwclMVIayKqEO8UKKA==
X-Received: by 2002:a05:6512:512:: with SMTP id o18mr24382404lfb.452.1626861722315;
        Wed, 21 Jul 2021 03:02:02 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id h1sm1711629lfk.187.2021.07.21.03.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 03:02:01 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id D80E21029B9; Wed, 21 Jul 2021 13:02:06 +0300 (+03)
Date: Wed, 21 Jul 2021 13:02:06 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20210721100206.mfldptiwiothowpz@box>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <YPfm0VvLx8DcNjDh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPfm0VvLx8DcNjDh@kernel.org>

On Wed, Jul 21, 2021 at 12:20:17PM +0300, Mike Rapoport wrote:
> On Tue, Jul 20, 2021 at 08:30:04PM +0300, Kirill A. Shutemov wrote:
> > On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> > > Hi,
> > > 
> > > I'd like to get some movement again into the discussion around how to
> > > implement runtime memory validation for confidential guests and wrote up
> > > some thoughts on it.
> > > Below are the results in form of a proposal I put together. Please let
> > > me know your thoughts on it and whether it fits everyones requirements.
> > 
> > Thanks for bringing it up. I'm working on the topic for Intel TDX. See
> > comments below.
> > 
> > > 
> > > Thanks,
> > > 
> > > 	Joerg
> > > 
> > > Proposal for Runtime Memory Validation in Secure Guests on x86
> > > ==============================================================
> 
> [ snip ]
> 
> > > 	8. When memory is returned to the memblock or page allocators,
> > > 	   it is _not_ invalidated. In fact, all memory which is freed
> > > 	   need to be valid. If it was marked invalid in the meantime
> > > 	   (e.g. if it the memory was used for DMA buffers), the code
> > > 	   owning the memory needs to validate it again before freeing
> > > 	   it.
> > > 
> > > 	   The benefit of doing memory validation at allocation time is
> > > 	   that it keeps the exception handler for invalid memory
> > > 	   simple, because no exceptions of this kind are expected under
> > > 	   normal operation.
> > 
> > During early boot I treat unaccepted memory as a usable RAM. It only
> > requires special treatment on memblock_reserve(), which used for early
> > memory allocation: unaccepted usable RAM has to be accepted, before
> > reserving.
> 
> memblock_reserve() is not always used for early allocations and some of the
> early allocations on x86 don't use memblock at all.

Do you mean any codepath in particular?

> Hooking
> validation/acceptance to memblock_reserve() should be fine for PoC but I
> suspect there will be caveats for production.

That's why I do PoC. Will see. So far so good. Maybe it will be visible
with smaller pre-accepted memory size.

> > For fine-grained accepting/validation tracking I use PageOffline() flags
> > (it's encoded into mapcount): before adding an unaccepted page to free
> > list I set the PageOffline() to indicate that the page has to be accepted
> > before returning from the page allocator. Currently, we never have
> > PageOffline() set for pages on free lists, so we won't have confusion with
> > ballooning or memory hotplug.
> >
> > I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> > MAX_ORDER). It is reasonable compromise on speed/latency.
> 
> Keeping fine grained accepting/validation information in the memory map
> means it cannot be reused across reboots/kexec and there should be an
> additional data structure to carry this information. It could be the same
> structure that is used by firmware to inform kernel about usable memory,
> just it needs to live after boot and get updates about new (in)validations.
> Doing those in 2M/4M chunks will help to prevent this structure from
> exploding.

Yeah, we would need to reconstruct the EFI map somehow. Or we can give
most of memory back to the host and accept/validate the memory again after
reboot/kexec. I donno.

> BTW, as Dave mentioned, the deferred struct page init can also take care of
> the validation.

That was my first thought too and I tried it just to realize that it is
not what we want. If we would accept page on page struct init it means we
would make host allocate all memory assigned to the guest on boot even if
guest actually use small portion of it.

Also deferred page init only allows to scale validation across multiple
CPUs, but doesn't allow to get to userspace before we done with it. See
wait_for_completion(&pgdat_init_all_done_comp).

-- 
 Kirill A. Shutemov
