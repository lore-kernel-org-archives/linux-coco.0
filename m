Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EE3173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 08:44:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51A491FDDB;
	Tue, 20 Jul 2021 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1626770667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/G5U5Sb4o8EhDLHWJkUeTkmM/VUVhqDbp2YFTroPI8=;
	b=GSby3uLc2ePOTrDe7jA//saLrtUzZj1ltjbOX+7tezEGlF3UWXShY6xIXIwRlCw2bJr8Bu
	HI98h3KEJT2/tWil/qp4/Spju5BdmxtxcE7p3ABr03CEd9rZDlJl2V0mMpRqtXxj9Q4ItA
	azFs7aqt0Ij9bGwMGFV/nIlgB0Ii+yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1626770667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/G5U5Sb4o8EhDLHWJkUeTkmM/VUVhqDbp2YFTroPI8=;
	b=wPN0PJdsWQrwKQ4Yvymw7Fj9x+mPScluyjmma3r9eckBxMpiF8lJiGg+MXTTX/vPQzMW0+
	zlt/zMNERzwPUuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A93D13D66;
	Tue, 20 Jul 2021 08:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id u98FJOqM9mA/GQAAMHmgww
	(envelope-from <jroedel@suse.de>); Tue, 20 Jul 2021 08:44:26 +0000
Date: Tue, 20 Jul 2021 10:44:24 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Andy Lutomirski <luto@kernel.org>
Cc: David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
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
Message-ID: <YPaM6G4Wt/V6QZy+@suse.de>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>

On Mon, Jul 19, 2021 at 05:26:20PM -0700, Andy Lutomirski wrote:
> At the risk of asking a potentially silly question, would it be
> reasonable to treat non-validated memory as not-present for kernel
> purposes and hot-add it in a thread as it gets validated?  Or would this
> result in poor system behavior before enough memory is validated?
> Perhaps we should block instead of failing allocations if we want more
> memory than is currently validated?

That is basically the idea of pre-validating the first X GB of memory
(X==4 has been proposed) and validate the rest at runtime. I see two
problems with this:

	1) Pre-validating large amounts of memory takes a lot of time
	   (in the range of a few seconds). This is not suitable for all
	   workloads like, e.g., containers which want to boot in a few
	   hundred milliseconds.

	2) It limits the physical address range for KASLR placement,
	   factually reducing the randomness of where the kernel is
	   placed in physical memory.

With the proposal I sent here only enough memory for the boot-loader and
the kernel image is pre-validated, and when the decompressor takes over
it can place the kernel anywhere, even in yet unvalidated/unaccepted
memory.

Regards,

	Joerg
