Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F233F4D8
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UywmqRqX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fxvZNgF+It9/pkutyTdBwQ2drZbf8d9h7gItHyVyZtc=; b=UywmqRqXVi95xSI8PqvFWe4u1k
	Wxct0bmVsIzqbVqHIRow1Dv39c81o8Aw3R57nSINroRmme67pBE39wLzPEoIBW1w8GkpHoGa1GHQ3
	VcjF2ANQNyKIzBGqgpppAOdsA6GMmWW5jRSKIjeLzwaUL5YAHroY5o+n7yf4psX+UFP2kKbWX6dLc
	Ra/qER2vpnnWzDn3DLXaaNkKilQRvyq/tTKXrgLjDnV8ho677Gd8EbhwEh7kkGeDOQFfiyYxxIRI2
	SgEWk9gV0FBFju9II/84Bsf0T8uCgzD3NrBSXTtaRYr1HUMMLItbWzWm40hygwym22LIoJY6PaZ4N
	usMeJ3Xg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qsh8Y-00Bjm7-Nd; Tue, 17 Oct 2023 10:17:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 15DE030058D; Tue, 17 Oct 2023 12:17:18 +0200 (CEST)
Date: Tue, 17 Oct 2023 12:17:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com, tim.gardner@canonical.com,
	philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com,
	x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org, Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel
 memory acceptance
Message-ID: <20231017101717.GJ33217@noisy.programming.kicks-ass.net>
References: <20231016163122.12855-1-kirill.shutemov@linux.intel.com>
 <ZS15HZqK4hu5NjSh@casper.infradead.org>
 <20231016213932.6cscnn6tsnzsnvmf@box.shutemov.name>
 <CAMj1kXFc31N61=oQayLbnR+CrNT4=bfEisC3fwG4VNq2vJHV5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFc31N61=oQayLbnR+CrNT4=bfEisC3fwG4VNq2vJHV5w@mail.gmail.com>

On Tue, Oct 17, 2023 at 09:42:13AM +0200, Ard Biesheuvel wrote:

> One question I have is whether the sequence
> 
> spin_lock_irqsave(&unaccepted_memory_lock, flags);
> ...
> spin_unlock(&unaccepted_memory_lock);
> arch_accept_memory(phys_start, phys_end);
> spin_lock(&unaccepted_memory_lock);
> ...
> spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
> 
> is considered sound and is supported by all architectures?

Yes.
