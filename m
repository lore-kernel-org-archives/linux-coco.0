Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527D173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:25:34 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id t20so2382307ljd.2
        for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kie/urE5nx66pvhPwWJ6T3paQR9EnJexO1ZP+ZKXMvU=;
        b=UKu4TjZkooEj6xBeuKNUqG+Hg7EMTK6phxhF6kj6m3BsAk3ju+KgnTcecNnDjnthL1
         YxwURZtTjUEeYcQMDfe/m8+ErLFBqJuhN0Iy5ajHCUC3sWALZMiuf0nuFKok2f+sQ1Dq
         fc0CK0PDRX+En3OsOQE/GlwQoI5w04ScpJx4nTDEm7lkYjaA3vnJ+kbRc0kGEDTo4bvA
         S2d+otPlQFML807l91B8qsx1GsjlcQgARpTdOvdut11MpYpOZKPE2PrYmMKnZSYCL0LZ
         nyQB70/BOyoNbYP6IOF7eV+QjFZ5kMORq573BloAfsD9zsgh0q2B/41bxMGazSuLUJw1
         d2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kie/urE5nx66pvhPwWJ6T3paQR9EnJexO1ZP+ZKXMvU=;
        b=NZEEpKBxY8wGa7mxVCU8sAM1LdOQ64Q3NDYmmCLzJosyzXgKWJZCJ7g8lBZunHosN2
         d6fO8Jcm96CAcmvU2ntJkHUAoNExCr2R0PEXmd7ohcGwpVBOguIqBMxKtkN+3yHiQOUW
         mi8xey7SIvfkYAGVxv0f1d0ZLOHZztWwCXuPpDWTjxUPKXYPfVsPymeKAjOBQkDKL7pW
         WOl1ZGJs4/34P/v7mFxh0UUbIZcq8meXnrqKuFLGbKhr/rmucKTVQvrQ7ko+wnP7j/eN
         1GfobdQgw9XCIz3pegz/luz9VIurUDWgREx6+ujfBonnLorsDCh3hMzEgbCjLGLfdDRM
         X+4Q==
X-Gm-Message-State: AOAM5330G76XVYXvL0Z9a0Ek7+VTczGaeZ9ynlmPyDaD+7s04Qwdcdq/
	KC0LaBO3OHGf/xO0FhjLaQjYgQ==
X-Google-Smtp-Source: ABdhPJy0uiUGoQ0STqsv0iCi3yztbn3e/eWxYlftVeSb5gn2Qe562YoOVcbfAyEtwve0a7riseB1gA==
X-Received: by 2002:a2e:6c15:: with SMTP id h21mr30419875ljc.321.1626863132247;
        Wed, 21 Jul 2021 03:25:32 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id u24sm1714402lfc.162.2021.07.21.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 03:25:31 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id E7F9D1029B9; Wed, 21 Jul 2021 13:25:36 +0300 (+03)
Date: Wed, 21 Jul 2021 13:25:36 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Joerg Roedel <jroedel@suse.de>
Cc: David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <20210721102536.aaaamqd5cdvbvce2@box>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <YPfoBZ+ezF2dN1d6@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPfoBZ+ezF2dN1d6@suse.de>

On Wed, Jul 21, 2021 at 11:25:25AM +0200, Joerg Roedel wrote:
> Hi Kirill,
> 
> On Tue, Jul 20, 2021 at 08:30:04PM +0300, Kirill A. Shutemov wrote:
> > On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> > We use EFI unaccepted memory type to pass this information between
> > firmware and kernel. In my WIP patch I translate it to a new E820 memory
> > type: E820_TYPE_UNACCEPTED.
> 
> Yeah, that is what I meant with a new E820 entry type.
> 
> > E820 can also be used during early boot for tracking what memory got
> > accepted by kernel too.
> 
> Won't this get very fragmented? How do you handle overlaps with other
> E820 regions?

I modify E820 as needed:

	e820__range_update(start, end, E820_TYPE_UNACCEPTED, E820_TYPE_RAM);

I also ask memblock for bottom-up allocation as it helps with using
per-accepted pages first and reduces fragmentation:

	memblock_set_bottom_up(true);

> > For now, I debug with 256MiB accepted by firmware. It allows to avoid
> > dealing with decompression code at this stage of the project. I plan to
> > lower the number later.
> 
> Yes, this can be experimented with, the proposal allows a custom amount
> of memory to be pre-validated/accepted.
> 
> > I would argue for per-range, not per-page, tracking of accepted/validated
> > memory for decompresser and early boot code, until page allocator is fully
> > functional. I have reasonable success with this approach so far.
> 
> What do you mean by 'reasonable' success?

It appears to work fine with 256MiB of pre-accepted memory, but more
testing is required.

> Especially, how robust is that against unrelated changes to the boot
> code? As with SEV-SNP, I guess there will be no broad testing of
> unrelated kernel changes in a TDX environment, so some robustness is key
> to keep things working.

Hard to say. Let me get the prototype functional first. It's easier to
discuss with code on hands.

> > During early boot I treat unaccepted memory as a usable RAM. It only
> > requires special treatment on memblock_reserve(), which used for early
> > memory allocation: unaccepted usable RAM has to be accepted, before
> > reserving.
> 
> What happens before memblock is active, say in the decompressor. Will
> unaccepted memory be considered for KASLR placement?

I tried to postpone thinking about decompresser as long as possible :P

I guess we need pass down information about memory accepted in
decompresser to the main kernel so it can record in E820. I think it will
a single range.

> > For fine-grained accepting/validation tracking I use PageOffline() flags
> > (it's encoded into mapcount): before adding an unaccepted page to free
> > list I set the PageOffline() to indicate that the page has to be accepted
> > before returning from the page allocator. Currently, we never have
> > PageOffline() set for pages on free lists, so we won't have confusion with
> > ballooning or memory hotplug.
> 
> Okay, I think that could also easily break with unrelated memory
> management changes, but should work for now in TDX.
> 
> > I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> > MAX_ORDER). It is reasonable compromise on speed/latency.
> 
> Makes sense, SEV-SNP will likely do something similar.
> 
> > I'm not sure a bitmap is needed. I hope we can use E820 for early
> > tracking. But let's see if it works.
> 
> We should find a solution which works for TDX and SNP, given that the
> required changes are intrusive and that it is much easier to just
> support one way to handle this.
> 
> That said, the Validation Bitmap has a clear benefit for SEV-SNP in that
> it makes it trivial to support kexec/kdump scenarios. Further the
> bitmap makes it trivial to transport the information through the whole
> boot process. It also won't be big, SNP (and I think TDX too) would
> be okay with one bit per 4k page, so the bitmap would need 32kb of
> memory per GB of guest RAM.

Yes, the bitmap is small, but it going to be rather hot structure. It has
to be consulted on every page allocation, right?

How to do plan to make bitmap scalable? What the locking rules around it?

> And keeping the information separate from struct page will make the code
> more robust against unrelated code changes.

-- 
 Kirill A. Shutemov
