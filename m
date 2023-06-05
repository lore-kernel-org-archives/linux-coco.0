Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD6DDC0
	for <linux-coco@lists.linux.dev>; Mon,  5 Jun 2023 19:12:32 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 004511EC0103;
	Mon,  5 Jun 2023 21:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685992350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=wkzDpd9hOpiwQjw2/Ex7sDYVGxXjX/znZebMG4jB1O8=;
	b=jmTNaxQd3htRMqhJ0AjG4Lm+yacQbouvqEexD2tMv02YwWsX/T1O3a9NcGy3rKahA2+BMa
	SRaM0UvH59yD820PT2DO3g4QppSsBuWmNa3PnKyqXcBa6hCfxOuS8Ftdo3NH1x3+43bQl8
	YoCDJ8algs341iPV9EFN4C/wbYgRskw=
Date: Mon, 5 Jun 2023 21:12:25 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
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
	Dario Faggioli <dfaggioli@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com, tim.gardner@canonical.com,
	khalid.elmously@canonical.com, philip.cox@canonical.com,
	aarcange@redhat.com, peterx@redhat.com, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv13 5/9] efi: Add unaccepted memory support
Message-ID: <20230605191225.GCZH4zmbtkWWRG4lzf@fat_crate.local>
References: <20230601182543.19036-1-kirill.shutemov@linux.intel.com>
 <20230601182543.19036-6-kirill.shutemov@linux.intel.com>
 <20230605154333.GLZH4CpV3eXCCWCGxi@fat_crate.local>
 <20230605173303.k5yt535snxyk4ez3@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230605173303.k5yt535snxyk4ez3@box.shutemov.name>

On Mon, Jun 05, 2023 at 08:33:03PM +0300, Kirill A. Shutemov wrote:
> There's nothing to warn about. The range (or part of it) is not
> represented in the bitmap because it is not unaccepted.

Sorry but how am I supposed to know that?!

I've read the whole patchset up until now and all text talks like *all*
*memory* needs to be accepted and before that has happeend, it is
unaccepted.

So how about you explain that explicitly somewhere, perhaps in a comment
above accept_memory(), that the unaccepted range is not the whole memory
but only, well, what is unaccepted and the rest is implicitly accepted?

And I went and looked at the final result - we error() if we fail
accepting.

I guess that's the only action we can do anyway...

> Yes, it was discussed before. Here's context:
> 
> https://lore.kernel.org/all/Ynt8vDY78/YeXO99@zn.tnic

You should try those before you paste them - it says "Not found" because
of the '/' in the Message-ID and it needs to be escaped.

This works:

https://lore.kernel.org/all/Ynt8vDY78%2FYeXO99@zn.tnic/

Now I remember.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
