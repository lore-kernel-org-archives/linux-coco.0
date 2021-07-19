Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422F70
	for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 15:02:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0097E222DE;
	Mon, 19 Jul 2021 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626706947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CAtd+F1AFlXiPR+iNBNVHro6B8Drb9QeQX8XzAz53h8=;
	b=nxJMaqyxAntBnjqxwQeODA3+lttOOrbDER1tNjhinahILmvau1pABk3Qo4eo9kApQW5vxg
	vtZjW2OkDtlZLIjBoMNQjis03mAF3yOettn7iT2iZhvPTJgxz/oR8MTsbS3AEro1oGE3yU
	ydFBiM+pbURvDoJp5/lQbglFCsrtgHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626706947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CAtd+F1AFlXiPR+iNBNVHro6B8Drb9QeQX8XzAz53h8=;
	b=AnqN+hBzRtpd22JJvGoRgfZYkzGihbE1PIcCA/QYm6pn/dY1gyQndNkQc5J7f9b7SUHTKB
	NzN1tcvXPMhoT1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D0DD13D39;
	Mon, 19 Jul 2021 15:02:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8aY9DQKU9WCdFwAAMHmgww
	(envelope-from <jroedel@suse.de>); Mon, 19 Jul 2021 15:02:26 +0000
Date: Mon, 19 Jul 2021 17:02:24 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <YPWUAInpncx+LPo6@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <YPV5H0A+HB/t6y+z@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPV5H0A+HB/t6y+z@casper.infradead.org>

On Mon, Jul 19, 2021 at 02:07:43PM +0100, Matthew Wilcox wrote:
> I think this proposal skips (intentionally?) something that s390 already
> implemented: the secure guest deliberately allowing the hypervisor to
> access certain pages for a period and then re-validating them.  I hope x86
> can use the same interface as s390 for this, or if not, the interface can
> be modified to be usable by all architectures.  See commit f28d43636d6f
> ("mm/gup/writeback: add callbacks for inaccessible pages").

Yeah, sharing memory with the Hypervisor is not the main scope of the
proposal. The requirement I put in step 8. about returning only
validated memory (which means it is not shared with the HV anymore) to
the memory allocator slightly touches this.

In general, on x86 the hypervisor can only write to eplicitly shared and
unencrypted regions of guest memory. The guest decides where those are
and is responsible for setting these areas up.

For x86 this happens mainly in the DMA-API backend and to some degree in
other code which sets up non-DMA shared data structures with the host
(like the code setting up the GHCBs for SEV-ES).

That said, I don't see an immediate use of the API introduced in the
patch above for x86.

Regards,

	Joerg
