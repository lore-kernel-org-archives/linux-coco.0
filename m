Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474642C82
	for <linux-coco@lists.linux.dev>; Sat, 15 Jan 2022 18:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82A1C36AE5;
	Sat, 15 Jan 2022 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642272457;
	bh=PxfF8TCrDJEZRPlh4OejGOyk1YzIClKiOQC3iEvEi4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgOYeZ6YDGtDusiSwXekCP9ueSZ7jXs1HhzPRrtIPaIq7pXn8YdDIJ1VKicOJY59Y
	 5N5tWjCjuwvqXhZyaiUaueostvvaikTSyS1iEsT6jUJpN9eoVmgd3DnsXm69dr5DPB
	 OUabH8whMSW8Wju1x05nG7aR8TmOFJPiw3SplQq4oHDY3oSLLRfKD13cBM9PlFsdAI
	 2wNt03PV9gEjZonlMlFQjHVJrgH8ybrkhyJD5jzNFaBQAM6R/lcFlrGjXGmkBOLtvp
	 OEOed0ocnBp2fDWFhtwgh16/a/qa71tL2W0zZAV0bbPOf716SZctUw0ZdXhH8baHC2
	 ob4k+0VXJqTig==
Date: Sat, 15 Jan 2022 20:46:57 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 5/7] x86/mm: Reserve unaccepted memory bitmap
Message-ID: <YeMWoTpHoJRRhnoN@kernel.org>
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-6-kirill.shutemov@linux.intel.com>
 <3a361a1d-0e14-8884-c5bb-90aeb87e38ef@intel.com>
 <20220112194302.cyxhjypsptr4mtix@box.shutemov.name>
 <a4b5707f-0f0b-57a8-ccdb-d89f66210b52@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4b5707f-0f0b-57a8-ccdb-d89f66210b52@intel.com>

On Wed, Jan 12, 2022 at 11:53:42AM -0800, Dave Hansen wrote:
> On 1/12/22 11:43 AM, Kirill A. Shutemov wrote:
> > On Tue, Jan 11, 2022 at 11:10:40AM -0800, Dave Hansen wrote:
> >> On 1/11/22 03:33, Kirill A. Shutemov wrote:
> >>
> >>> +	/* Mark unaccepted memory bitmap reserved */
> >>> +	if (boot_params.unaccepted_memory) {
> >>> +		unsigned long size;
> >>> +
> >>> +		/* One bit per 2MB */
> >>> +		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> >>> +				    PMD_SIZE * BITS_PER_BYTE);
> >>> +		memblock_reserve(boot_params.unaccepted_memory, size);
> >>> +	}
> >>
> >> Is it OK that the size of the bitmap is inferred from
> >> e820__end_of_ram_pfn()?  Is this OK in the presence of mem= and other things
> >> that muck with the e820?
> > 
> > Good question. I think we are fine. If kernel is not able to allocate
> > memory from a part of physical address space we don't need the bitmap for
> > it either.
> 
> That's a good point.  If the e820 range does a one-way shrink it's
> probably fine.  The only problem would be if the bitmap had space for
> for stuff past e820__end_of_ram_pfn() *and* it later needed to be accepted.

It's unlikely, but e820 can grow because of EFI and because of memmap=.
To be completely on the safe side, the unaccepted bitmap should be reserved
after parse_early_param() and efi_memblock_x86_reserve_range().

Since we anyway do not have memblock allocations before
e820__memblock_setup(), the simplest thing would be to put the reservation
first thing in e820__memblock_setup().

-- 
Sincerely yours,
Mike.
