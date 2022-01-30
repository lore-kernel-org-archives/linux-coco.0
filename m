Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918732C82
	for <linux-coco@lists.linux.dev>; Sun, 30 Jan 2022 08:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C3C340E4;
	Sun, 30 Jan 2022 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643532005;
	bh=mMLK/fB0QMJ3MNzMIxpx0yDzHoVKivXV5668cDA+aKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWG5SwoxI7Lf6y7IDW7qjyM/D+k3pdtHe7MbUgpd9ERfe11UZABkDQInZxHmNpvD0
	 /nwRiVpcr9IjnencMEaf52ZBhwYE6Lyh2BuBzT/lWeMH9Od0RIBbuI0IWLMSY7HdKr
	 hMQJPOJrvFFPdxYTPO5yv8PzM5dmN2eQgdOf88rSqBS63mnC68I3xBoHd0SjbjZWmd
	 pv6DGaXc8zPCDxJABgEUKKSt8Giv59OqfWGbsmkwrs6/ginQl3brxAS03lls3T4uT3
	 PydWZiUMzjueAS/pEs8SyaYrTw7R8TBj3B4chZjdl+sRoS03HmWdb+AajmyoZk0NVq
	 6j7AKTMxbH1xg==
Date: Sun, 30 Jan 2022 10:39:52 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 5/7] x86/mm: Reserve unaccepted memory bitmap
Message-ID: <YfZO2JTIGf3aK/IC@kernel.org>
References: <20220128205906.27503-1-kirill.shutemov@linux.intel.com>
 <20220128205906.27503-6-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128205906.27503-6-kirill.shutemov@linux.intel.com>

On Fri, Jan 28, 2022 at 11:59:04PM +0300, Kirill A. Shutemov wrote:
> A given page of memory can only be accepted once.  The kernel has a need
> to accept memory both in the early decompression stage and during normal
> runtime.
> 
> Use a bitmap to communicate the acceptance state of each page between
> the decompression stage and normal runtime.  This eliminates the
> possibility of attempting to double-accept a page.
> 
> Allocate the bitmap during decompression stage and hand it over to the
> main kernel image via boot_params.

These two paragraphs imply that you add bitmap allocation to the
decompression in this patch. Besides, AFAIU the actual allocation happens
before the decompression in EFI stub. How about slightly rephrasing:

---8<---
A bitmap used to communicate the acceptance state of each page between the
decompression stage and normal runtime.  This eliminates the possibility of
attempting to double-accept a page.

The bitmap is allocated in EFI stub, decompression stage updates the state
of pages used for the kernel and initrd and hands the bitmap over to the
main kernel image via boot_params.
---8<---
 
> In the runtime kernel, reserve the bitmap's memory to ensure nothing
> overwrites it.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/x86/kernel/e820.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index bc0657f0deed..3905bd1ca41d 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -1297,6 +1297,16 @@ void __init e820__memblock_setup(void)
>  	int i;
>  	u64 end;
>  
> +	/* Mark unaccepted memory bitmap reserved */
> +	if (boot_params.unaccepted_memory) {
> +		unsigned long size;
> +
> +		/* One bit per 2MB */
> +		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> +				    PMD_SIZE * BITS_PER_BYTE);
> +		memblock_reserve(boot_params.unaccepted_memory, size);
> +	}
> +
>  	/*
>  	 * The bootstrap memblock region count maximum is 128 entries
>  	 * (INIT_MEMBLOCK_REGIONS), but EFI might pass us more E820 entries
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.
