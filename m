Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758471C758
	for <linux-coco@lists.linux.dev>; Fri,  2 Jun 2023 16:10:34 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2FA171EC0333;
	Fri,  2 Jun 2023 18:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685722232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=eE2uQGqPGpuKbamI8enlt7v5GbxB8kYffAGXDWpEyes=;
	b=Rq/hMqByw649WSqiBvHpZIOpoM+dTMMsZLQ3HqEnMsszV4zGGBIqbJn0hfttibA2vSNB5q
	Du73ZbTLCXoIi2Sklvw/wXFZArPCuVLZI1ALxp3aZm2rATShj6gswT2iVTzLEeQ3K3RY/+
	EUQUxW+WzmjfM1W36ZdvHEUOr41oqRQ=
Date: Fri, 2 Jun 2023 18:10:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
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
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [PATCHv13 4/9] x86/boot/compressed: Handle unaccepted memory
Message-ID: <20230602161031.GFZHoUd4R9JEQjOrAK@fat_crate.local>
References: <20230601182543.19036-1-kirill.shutemov@linux.intel.com>
 <20230601182543.19036-5-kirill.shutemov@linux.intel.com>
 <20230602140641.GKZHn3caQpYveKxFgU@fat_crate.local>
 <20230602153644.cbdicj2cc6p6goh3@box.shutemov.name>
 <CAMj1kXGXoMPMF_Xv6Lk-sMx2Bp6aa2gTgit5o7OeZU1UsNMqyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXGXoMPMF_Xv6Lk-sMx2Bp6aa2gTgit5o7OeZU1UsNMqyA@mail.gmail.com>

On Fri, Jun 02, 2023 at 05:59:16PM +0200, Ard Biesheuvel wrote:
> The problem is that on x86, there is buggy vendor/OEM EFI code that
> registers for internal events that trigger when SetVirtualAddressMap()
> is called, and assume that at that point, EfiBootServicesData memory
> regions have not been touched by the loader yet, which is probably
> true if you are booting Windows.
> 
> So on x86, the kernel proper also preserves these regions until after
> it calls SetVirtualAddressMap() (efi_free_boot_services() in
> arch/x86/platform/efi/quirks.c)
> 
> So for the same reason, this code needs to disregard those regions as well.

I'd like for us to have this explanation in the comment since it is
being touched anyway.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
