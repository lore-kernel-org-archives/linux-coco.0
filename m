Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231570
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 19:13:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 5701E296; Mon, 26 Jul 2021 21:13:18 +0200 (CEST)
Date: Mon, 26 Jul 2021 21:13:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
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
Message-ID: <YP8JTRvBnSLrJaYb@8bytes.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210722195130.beazbb5blvj3mruo@box>

Hi Kirill,

On Thu, Jul 22, 2021 at 10:51:30PM +0300, Kirill A. Shutemov wrote:
> Okay, below is my first take on the topic.

Thanks, I havn't looked deeply into the patch yet, but will do so
tomorrow and reply separatly.

> I ended up combing your idea with bitmap with PageOffline(): early boot
> code uses bitmap, but on page allocator init I mark unaccepted pages with
> PageOffline(). This way page allocator need to touch the bitmap only when
> it steps on PageOffline() which shouldn't be often once things settle
> after boot.

I still need to understand the benefit of having this information in the
memmap, but I also don't object to it. For AMD-SNP the bitmap needs to
stay around at least, unless there is another way to implement
kexec/kdump.

> One bit in the bitmap represents 2M region. Any unaligned chunks gets
> accepted when we construct the bitmap. This way one 4K page can represent
> 64 GiB of physical address space.

Yeah, a 2MB chunk size makes sense when it comes to how much we validate
at once. I think it will be good choice for AMD too. On the other side
there is a need for SNP to track shared pages on a 4k granularity. There
are a couple of shared (or at least not valid) pages (GHCB, #HV shared page,
VMSA page) per vCPU which are 4k in size. Oh, and then there is the
.bss_decrypted section, which is also not 2M aligend.

In case of kexec/kdump this information needs to be passed on to the
next kernel.

Regards,

	Jörg

