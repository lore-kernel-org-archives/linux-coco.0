Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09770
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 19:02:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 5C852296; Mon, 26 Jul 2021 21:02:46 +0200 (CEST)
Date: Mon, 26 Jul 2021 21:02:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Joerg Roedel <jroedel@suse.de>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <YP8G1EuMPk1U40kz@8bytes.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>

On Thu, Jul 22, 2021 at 05:46:13PM +0200, David Hildenbrand wrote:
> +1, this smells like an anti-patter. I'm absolutely not in favor of a
> bitmap, we have the sparse memory model for a reason.

Well, I doubt that TDX or SNP guests will be set up with a sparse memory
layout.

> Also, I am not convinced that kexec/kdump is actually easy to realize with
> the bitmap?

> Who will forward that bitmap?

The kernel decompressor will create it and forward it to the
decompressed kernel image. The running kernel will pass it on to
kexec'ed kernels for the lifetime of the system.

> Where will it reside?

In Linux kernel owned memory, location decided by the kernel
decompressor.

>Who says it's not corrupted?

If the hypervisor corrupts it we can notice it. The guest kernel can
corrupt it on its own, but that is true for all data in the guest, also
the memmap.

> Just take a look at how we don't even have access to memmap of the
> oldkernel in the newkernel -- and have to locate and decipher it in
> constantly-to-be-updated user space makedumpfile. Any time you'd
> change anything about the bitmap ("hey, let's use larger chunks",
> "hey, let's split it up") you'd break the old_kernel
> <-> new_kernel agreement.

Im not sure if makedumpfile needs to know about that bitmap. If we
mirror the same information into the memmap, then there is definitly no
need for it.

Regards,

	Jörg
