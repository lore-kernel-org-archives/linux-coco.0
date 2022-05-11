Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390A317C4
	for <linux-coco@lists.linux.dev>; Wed, 11 May 2022 09:13:07 +0000 (UTC)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 408B51EC053F;
	Wed, 11 May 2022 11:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1652260381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Rl96LlwUayMVLB9Ox0K7EFk+HS7SAZNt7K1olPYN8Qo=;
	b=Duquyg3rKjp+y7ODQUAjIdw8MyLoXi0PtGqN9Uvp4Q6iFjDWDtrtKTTdeGNAvniLJ9Yglw
	25CwXIBrlMwP35/M1L3iIu0onVeccf45hNzVh0tgHL+95xHX3ecuBTMkr6TQyNcv+z2bui
	rRAljZNtex98qUrJvHyAQ1/s7zMfbAk=
Date: Wed, 11 May 2022 11:13:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 10/12] x86/tdx: Unaccepted memory support
Message-ID: <Ynt+JCu9TP0FetUg@zn.tnic>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-11-kirill.shutemov@linux.intel.com>
 <YnOjJB8h3ZUR9sLX@zn.tnic>
 <20220506204423.gu6jrb53kmuxze5r@box.shutemov.name>
 <20220511011906.el4m54fns7ilh7fr@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511011906.el4m54fns7ilh7fr@box.shutemov.name>

On Wed, May 11, 2022 at 04:19:06AM +0300, Kirill A. Shutemov wrote:
> JFYI, I've reworked it as
> 
> 		accepted = try_accept_one(start, len, PG_LEVEL_1G);
> 		if (!accepted)
> 			accepted = try_accept_one(start, len, PG_LEVEL_2M);
> 		if (!accepted)
> 			accepted = try_accept_one(start, len, PG_LEVEL_4K);
> 		if (!accepted)
> 			return false;
> 		start += accepted;

s/accepted/accpt_size/

and then it is perfectly clear what that variable contains.

But it seems you're preparing a new version so I'll continue looking at
there.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
