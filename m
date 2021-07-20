Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26602168
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 11:50:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 835B0202D3;
	Tue, 20 Jul 2021 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626781839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2Cng5i3OUjv4oE3o0Cxd2ysYKFVEJhz28Z9hUv0Cgg=;
	b=dv5NLBcMhqkVq5L+OZWbu6xPfU7Pnhsn0ERp2q+7IMppmivU/Klww1o9yjo0CsPg7vATlD
	/IkCCBchP+LNtpjjUTNm7UK6f0Qt5KKHbpb258k8DKEJMzKehSBp+5LeaDEM5M8Jdh4Rtn
	ufUF4mqeqBb7INbD3C/xZ4adDqWXwL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626781839;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2Cng5i3OUjv4oE3o0Cxd2ysYKFVEJhz28Z9hUv0Cgg=;
	b=XwwLO0FmO3fYr+vtcsQgJeX6JpOh+brfu9TgeNuu9I0CWPkBTabrfPyA9K7L0V7x1Ur0ST
	WQoJPK+37VlKyWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B425513D6B;
	Tue, 20 Jul 2021 11:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JpiTKY649mCEWAAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 20 Jul 2021 11:50:38 +0000
Date: Tue, 20 Jul 2021 13:50:37 +0200
From: Joerg Roedel <jroedel@suse.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Andi Kleen <ak@linux.intel.com>, David Rientjes <rientjes@google.com>,
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
Message-ID: <YPa4jSZU4/VVGe9U@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <4e33d22e-330f-c5ba-bc15-08a3298598c5@linux.intel.com>
 <YPaPk19JwcwmwzqR@suse.de>
 <YPaYiW/TlrDydY6m@work-vm>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPaYiW/TlrDydY6m@work-vm>

On Tue, Jul 20, 2021 at 10:34:01AM +0100, Dr. David Alan Gilbert wrote:
>   Does the bitmap need to be page granulairty or can we work
> on bigger chunks?

I think page granularity is needed, because some regions shared with the
HV are only one page in size (the GHCBs in SEV-ES for example).

But in general it is worth to discuss whether validating memory in
bigger chunks than a page is beneficial wrt. to allocation latency vs.
required HV round-trips for validation.

Regards,

	Joerg

