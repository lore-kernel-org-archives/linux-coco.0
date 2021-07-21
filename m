Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34138168
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:48:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DD1D1FE93;
	Wed, 21 Jul 2021 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626864486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivoDCATO8dchNFC/pU/cVUC63xTPOe2w42wf+7yCads=;
	b=TqFM9aEuiienzBqG3F6jNgJo8KJRj1UAfnPcODBj/8NutyV7WZVbKdoFHUxz+jZv1XtMXt
	LF1hTdvI4uLbCvPhN3H45Kinsj41RVDAgVoIxohzcRtxi3Lk/Q7jnRjfiWCcsVbjvX/dJg
	M6myG5Aa/WLE7+tUcR1k8onC9rRDIdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626864486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivoDCATO8dchNFC/pU/cVUC63xTPOe2w42wf+7yCads=;
	b=FI4TYbOgSh8Y8SmM1sCarWFq5Y0nnX/e0Ea3OJHntATLpSzwNe9UirxMYkiLc7ebRsmUMX
	bBhoOLueX1ef/fAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B068513B37;
	Wed, 21 Jul 2021 10:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RzldKWX792CQOQAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 21 Jul 2021 10:48:05 +0000
Date: Wed, 21 Jul 2021 12:48:04 +0200
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
Message-ID: <YPf7ZDNdJL3qylrq@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <YPfoBZ+ezF2dN1d6@suse.de>
 <20210721102536.aaaamqd5cdvbvce2@box>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721102536.aaaamqd5cdvbvce2@box>

On Wed, Jul 21, 2021 at 01:25:36PM +0300, Kirill A. Shutemov wrote:
> On Wed, Jul 21, 2021 at 11:25:25AM +0200, Joerg Roedel wrote:

> I modify E820 as needed:
> 
> 	e820__range_update(start, end, E820_TYPE_UNACCEPTED, E820_TYPE_RAM);
> 
> I also ask memblock for bottom-up allocation as it helps with using
> per-accepted pages first and reduces fragmentation:
> 
> 	memblock_set_bottom_up(true);

This happens already in the decompressed kernel image. The decompressor
also needs to be able to validate memory and pass the information about
it on.

> I tried to postpone thinking about decompresser as long as possible :P
> 
> I guess we need pass down information about memory accepted in
> decompresser to the main kernel so it can record in E820. I think it will
> a single range.

This means modifying the E820 array in boot_params in the decompressor,
handling overlaps, splitting entries and all that.

> Yes, the bitmap is small, but it going to be rather hot structure. It has
> to be consulted on every page allocation, right?
> 
> How to do plan to make bitmap scalable? What the locking rules around it?

It is expected that the bitmap becomes read-mostly over time, so the
cache-lines can be shared. The access should be possible using only
atomic bit manipulation instructions when validation happens in the
memory allocators, because no one is trying to modify the same bits
concurrently.

Regards,

	Joerg
