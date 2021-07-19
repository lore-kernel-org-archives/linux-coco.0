Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365172
	for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ke5E2r71K5re74O8KD3NV6mcHn9J3BbG/GsMoE2tFNo=; b=vNRyorIWQt8Tm2eJNTedXLDqDs
	8HAGRbpf7uyqD9miJT/RM/AdmydXZFqLNVBA3J6euBwAtf7ieN8u3HFC+OSvQc3Pu7m6x6dGLL9MA
	UsvotpTW63iz7obRRKfta8lVbu2qjvFGkH21pjiKGEiZP4dXOgLiFybi3F1P4YomuWEx6CTlsk6sz
	z+Ih/0qeawZL815B/sdJg4L+loEyhRmUQsLQPlmazkLI3H8jdW7MCZd6zqijjr9mTSBPgPCBpLu9I
	qBdV3eI8I9ZQcUCAZElB5QwG9FwWYsW/3Cl3GrqrqO9jK+ZaMI28gja4REF+RxKXjUh42UcTDXOx7
	Y8pl/zJQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Szn-006s7P-K7; Mon, 19 Jul 2021 13:08:14 +0000
Date: Mon, 19 Jul 2021 14:07:43 +0100
From: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <YPV5H0A+HB/t6y+z@casper.infradead.org>
References: <YPV27hDPZUoVsIZt@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPV27hDPZUoVsIZt@suse.de>

On Mon, Jul 19, 2021 at 02:58:22PM +0200, Joerg Roedel wrote:
> I'd like to get some movement again into the discussion around how to
> implement runtime memory validation for confidential guests and wrote up
> some thoughts on it.
> Below are the results in form of a proposal I put together. Please let
> me know your thoughts on it and whether it fits everyones requirements.

I think this proposal skips (intentionally?) something that s390 already
implemented: the secure guest deliberately allowing the hypervisor to
access certain pages for a period and then re-validating them.  I hope x86
can use the same interface as s390 for this, or if not, the interface can
be modified to be usable by all architectures.  See commit f28d43636d6f
("mm/gup/writeback: add callbacks for inaccessible pages").
