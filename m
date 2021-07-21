Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA20168
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:53:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA654224C5;
	Wed, 21 Jul 2021 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626864801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uC4JHriA0CBKe4OgSBxOhsq1bT7TDY8nMHdACrDqoE4=;
	b=ohxJ5jBG3DrGKxgJu6r7lhW82HIRfRoRgPqm4l8CQRg002ilYJdkoeZo40LxVco63FnReE
	wLPI3sDrzcxm75Ldov1mVAvVTb4bMgw2nIf03Oug8stPnfaaD4cCWvDHdcth5u+btYN0Wj
	xbpk6gc7LbapGM3SV0TP2b6XXCFoFEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626864801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uC4JHriA0CBKe4OgSBxOhsq1bT7TDY8nMHdACrDqoE4=;
	b=eFqtn9xtfWhXzLo8SrLHoPObf5H9/Sc1AG3+OsRL/0Fag5cRlYllSLedEZglPJrLaoZHgA
	AXIbUm4twKwh97BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33CCD13B37;
	Wed, 21 Jul 2021 10:53:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 88f5CqH892DIOgAAMHmgww
	(envelope-from <jroedel@suse.de>); Wed, 21 Jul 2021 10:53:21 +0000
Date: Wed, 21 Jul 2021 12:53:19 +0200
From: Joerg Roedel <jroedel@suse.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mike Rapoport <rppt@kernel.org>, David Rientjes <rientjes@google.com>,
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
Message-ID: <YPf8n9hdHmGe5AqV@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <YPfm0VvLx8DcNjDh@kernel.org>
 <20210721100206.mfldptiwiothowpz@box>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721100206.mfldptiwiothowpz@box>

On Wed, Jul 21, 2021 at 01:02:06PM +0300, Kirill A. Shutemov wrote:
> Yeah, we would need to reconstruct the EFI map somehow. Or we can give
> most of memory back to the host and accept/validate the memory again after
> reboot/kexec. I donno.

Invalidating all memory will also take a lot of time (in the range of
seconds). And the EFI map can get pretty large when there is enough
fragmentation. The easiest way to handle this is to just pass on an
up-to-date data structure.

Regards,

	Joerg
