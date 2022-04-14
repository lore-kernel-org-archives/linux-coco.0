Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8F7A
	for <linux-coco@lists.linux.dev>; Thu, 14 Apr 2022 15:55:24 +0000 (UTC)
Received: from zn.tnic (p2e55d808.dip0.t-ipconnect.de [46.85.216.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 759C11EC05DE;
	Thu, 14 Apr 2022 17:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1649951713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=BnxseTuJTt1+13p8Bbf/z4p5KH4GXzkEM2LCA1Q+mSA=;
	b=ixFitl7wM62yP+tsOhRPxZgD1GGIJbFmMnv4ijIg0DwOt7uNBbOiVF/p3MS/LJIVEGBucc
	4pk4WW3iNkwnJkqFQRuoBJCBSvipRW7EeUgE0xnTA+AkwB6Djac1YLUlxLGZVj/8HRPOrC
	lZInPgtYZWtEqj2EdCfyVGijnb0AN+U=
Date: Thu, 14 Apr 2022 17:55:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
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
	Dario Faggioli <dfaggioli@suse.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 3/8] efi/x86: Implement support for unaccepted memory
Message-ID: <YlhD4fajtABnLNvw@zn.tnic>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-4-kirill.shutemov@linux.intel.com>
 <c4b987d5-00d3-40ea-4c20-bf82b7512dec@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4b987d5-00d3-40ea-4c20-bf82b7512dec@intel.com>

On Fri, Apr 08, 2022 at 10:26:14AM -0700, Dave Hansen wrote:
> > +	/*
> > +	 * Accept small regions that might not be able to be represented
> > +	 * in the bitmap:
> > +	 */
> > +	if (end - start < 2 * PMD_SIZE) {
> > +		__accept_memory(start, end);
> > +		return;
> > +	}
> 
> This is not my first time looking at this code and I still had to think
> about this a bit.  That's not good.  That pathological case here is
> actually something like this:
> 
> | 4k | 2044k + 2044k | 4k |
> ^ 0x0 	     ^ 2MB	  ^ 4MB
> 
> Where we have a 2MB-aligned 4k accepted area, a 4088k unaccepted area,
> then another 4k accepted area.  That will not result in any bits being
> set in the accepted memory bitmap because no 2MB region is fully accepted.

I could use that ascii art very well in a comment above it instead of
having to paint it in my mind each time.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
