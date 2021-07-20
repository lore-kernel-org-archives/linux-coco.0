Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658DB173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 08:55:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E77E91FDD2;
	Tue, 20 Jul 2021 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626771349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0sf2lL/WSs0Z3IMfWxBFv2FOoeHVxjrvZYcbibsEAXQ=;
	b=rjEefgeuR84ltJ8ZXtBzBHuUMW0ncRDF92aPilfGqIaO6ZNFt5O5GCnlMtYjaFpn9JB9sl
	YcRee1g2tejFK9F/DoyVPaSnHJCULeyy6RD+IM79YdoFVI5mXi+wVw5bCMio1t5XYoZrop
	c6OS3lQqXrt5cm29xsP4/nJsCXorxls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626771349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0sf2lL/WSs0Z3IMfWxBFv2FOoeHVxjrvZYcbibsEAXQ=;
	b=LOMuJq16P+MuFRZQjqwu2B50n2ABUXIzppapWj5frmewT6BrAfiNEr0X2ZZxOrKro3Ubal
	sl55ZuZJVndRK5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B35513D5E;
	Tue, 20 Jul 2021 08:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id K/SiDJWP9mCiHQAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 20 Jul 2021 08:55:49 +0000
Date: Tue, 20 Jul 2021 10:55:47 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Andi Kleen <ak@linux.intel.com>
Cc: David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <YPaPk19JwcwmwzqR@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <4e33d22e-330f-c5ba-bc15-08a3298598c5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e33d22e-330f-c5ba-bc15-08a3298598c5@linux.intel.com>

On Mon, Jul 19, 2021 at 01:39:48PM -0700, Andi Kleen wrote:
> It's actually not just the first X. As I understand there is a proposal for
> a new UEFI memory type, that will allow the firmware (and anyone else) to
> declare memory regions as accepted in a fine grained manner.

Yes, but relying on this means we 1) introduce a dependency to UEFI into
booting confidential guests and 2) the decompressor stub in the kernel
needs to parse UEFI tables. None of this is a good idea for several
reasons.

> I don't think it's that bad. If we know what has been validated already
> using the memory map, then it's straight forward to check what is a valid
> validation request and what is not. Anything that's in a BIOS reserved
> region or in a region already marked as validated must be already validated
> and and can be rejected (or rather panic'ed). So I don't see the need to
> pass a fine grained validation bitmap around. Of course the kernel needs to
> maintain something (likely not a bitmap, but rather some form of page flag)
> on its own, but it doesn't need to be visible in any outside interfaces.

Using page flags means that the information about what is already
validated/accepted needs to be carried in another form until the
struct-page array is initialized. A lot can happen until then, and every
modification in the code that runs before carries the risk of breaking
TDX and SNP guests.

The Validation Bitmap on the other side is set up on the first boot and
kept alive for the rest of the guests life-time (even over kexec/kdump)
and will be updated by the allocators in use. This is a much more robust
solution than carrying the information in some other way forward until
the page array is there.

I must admit that I was also voting for a page-flag in the past, but the
benefits for robustness, supporting kexec/kdump, and the boot process in
general made me re-visit this opinion.

> There's one exception to this, which is the previous memory view in crash
> kernels. But that's an relatively obscure case and there might be other
> solutions for this.

Kexec and kdump are not obscure cases, those are real-world requirements
for TDX and SNP guests.

> I'm not sure about AMD, but in TDX we're certainly have no need to reaccept
> after something was shared.

Re-validation is needed on AMD, if I am not mistaken AMD hardware even
enforces that shared memory is mapped unencrypted and private memory
encrypted.

Regards,

	Joerg
