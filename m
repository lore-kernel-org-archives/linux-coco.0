Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2D173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 09:25:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 494B922383;
	Wed, 21 Jul 2021 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626859527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t6qAAHS2nVzNXquSRRxozOjfoWN1S34yUdOkPJaKLrc=;
	b=h04N6ZKtKp7bQPZ/3ueEHYMQHB/VpDupHDAl0zv6eNM+YjHG9AWwqy0D/qA4uBwDdNztI5
	6MD9ZMkwh3D11qyu+Pxk/qO13+WaaJ7mvMy9DIbk7rxGquIICxFV+PR+hA4mLzrv0dAUS3
	bz5Taeu7pZx0o/Izt1Ae2pr+2tDgxH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626859527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t6qAAHS2nVzNXquSRRxozOjfoWN1S34yUdOkPJaKLrc=;
	b=czzYhhKqEZAfG/JI+/XW5hIlVnl6VN70Bh6SDhvPvaXDa3kJOfEPIcBw9KGQLbjCk21Q75
	fqARsylT/QTm0wCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87ADF13A66;
	Wed, 21 Jul 2021 09:25:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KpJ6Hgbo92D7IAAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 21 Jul 2021 09:25:26 +0000
Date: Wed, 21 Jul 2021 11:25:25 +0200
From: Joerg Roedel <jroedel@suse.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
Message-ID: <YPfoBZ+ezF2dN1d6@suse.de>
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

Hi Kirill,

On Tue, Jul 20, 2021 at 08:30:04PM +0300, Kirill A. Shutemov wrote:
> On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> We use EFI unaccepted memory type to pass this information between
> firmware and kernel. In my WIP patch I translate it to a new E820 memory
> type: E820_TYPE_UNACCEPTED.

Yeah, that is what I meant with a new E820 entry type.

> E820 can also be used during early boot for tracking what memory got
> accepted by kernel too.

Won't this get very fragmented? How do you handle overlaps with other
E820 regions?

> For now, I debug with 256MiB accepted by firmware. It allows to avoid
> dealing with decompression code at this stage of the project. I plan to
> lower the number later.

Yes, this can be experimented with, the proposal allows a custom amount
of memory to be pre-validated/accepted.

> I would argue for per-range, not per-page, tracking of accepted/validated
> memory for decompresser and early boot code, until page allocator is fully
> functional. I have reasonable success with this approach so far.

What do you mean by 'reasonable' success? Especially, how robust is that
against unrelated changes to the boot code? As with SEV-SNP, I guess
there will be no broad testing of unrelated kernel changes in a TDX
environment, so some robustness is key to keep things working.

> During early boot I treat unaccepted memory as a usable RAM. It only
> requires special treatment on memblock_reserve(), which used for early
> memory allocation: unaccepted usable RAM has to be accepted, before
> reserving.

What happens before memblock is active, say in the decompressor. Will
unaccepted memory be considered for KASLR placement?

> For fine-grained accepting/validation tracking I use PageOffline() flags
> (it's encoded into mapcount): before adding an unaccepted page to free
> list I set the PageOffline() to indicate that the page has to be accepted
> before returning from the page allocator. Currently, we never have
> PageOffline() set for pages on free lists, so we won't have confusion with
> ballooning or memory hotplug.

Okay, I think that could also easily break with unrelated memory
management changes, but should work for now in TDX.

> I try to keep pages accepted in 2M or 4M chunks (pageblock_order or
> MAX_ORDER). It is reasonable compromise on speed/latency.

Makes sense, SEV-SNP will likely do something similar.

> I'm not sure a bitmap is needed. I hope we can use E820 for early
> tracking. But let's see if it works.

We should find a solution which works for TDX and SNP, given that the
required changes are intrusive and that it is much easier to just
support one way to handle this.

That said, the Validation Bitmap has a clear benefit for SEV-SNP in that
it makes it trivial to support kexec/kdump scenarios. Further the
bitmap makes it trivial to transport the information through the whole
boot process. It also won't be big, SNP (and I think TDX too) would
be okay with one bit per 4k page, so the bitmap would need 32kb of
memory per GB of guest RAM.

And keeping the information separate from struct page will make the code
more robust against unrelated code changes.

Regards,

	Joerg
