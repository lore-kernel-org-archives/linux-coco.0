Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4962118
	for <linux-coco@lists.linux.dev>; Wed,  4 May 2022 11:10:46 +0000 (UTC)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AA1C11EC0494;
	Wed,  4 May 2022 13:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1651662277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=YG9ijiDBBpz8dWED8Eb7RiBzcKWJo0pro/66Fp+n7FU=;
	b=Zxx8CbNHf3+6yJFdlPTyt0WK4FSrNOnzi2/spPsW3Xa7WqqktttpwmzqyBEcC15rJAMSSA
	3JgY+ilXt+e5IUnxjxLQ27R8+S2KtjtyVECC5Q6YiE/0kbnSt/p5sUiULygTNJ4lekbWoy
	Qlb0I3MGvqNOrm5O81aDmHkPWx/qfgI=
Date: Wed, 4 May 2022 13:04:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>,
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
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCHv5 07/12] x86/mm: Reserve unaccepted memory bitmap
Message-ID: <YnJdxAri0OmokZ+X@zn.tnic>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-8-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425033934.68551-8-kirill.shutemov@linux.intel.com>

On Mon, Apr 25, 2022 at 06:39:29AM +0300, Kirill A. Shutemov wrote:
> A given page of memory can only be accepted once. The kernel has a need

s/has a need to/has to/

> to accept memory both in the early decompression stage and during normal
> runtime.
> 
> A bitmap used to communicate the acceptance state of each page between the
	  ^
	  is

> decompression stage and normal runtime.
> 
> boot_params is used to communicate location of the bitmap through out

throughout

> the boot. The bitmap is allocated and initially populated in EFI stub.
> Decompression stage accepts pages required for kernel/initrd and mark

marks

> these pages accordingly in the bitmap. The main kernel picks up the
> bitmap from the same boot_params and uses it to determinate what has to

determine

> be accepted on allocation.
> 
> In the runtime kernel, reserve the bitmap's memory to ensure nothing
> overwrites it.
> 
> The size of bitmap is determinated with e820__end_of_ram_pfn() which

Unknown word [determinated] in commit message.
Suggestions: ['determinate', 'determined', 'terminated', 'determinant']

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
