Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D970
	for <linux-coco@lists.linux.dev>; Mon,  2 Aug 2021 10:19:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8E19B379; Mon,  2 Aug 2021 12:19:20 +0200 (CEST)
Date: Mon, 2 Aug 2021 12:19:15 +0200
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
Message-ID: <YQfGo2rVgW0wkLnv@8bytes.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>
 <YP8G1EuMPk1U40kz@8bytes.org>
 <023d2435-8cc7-dc44-6258-4135136ddfba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023d2435-8cc7-dc44-6258-4135136ddfba@redhat.com>

On Tue, Jul 27, 2021 at 11:34:47AM +0200, David Hildenbrand wrote:
> What makes you think that? I already heard people express desires for memory
> hot(un)plug, especially in the context of running containers inside
> encrypted VMs. And static bitmaps are naturally a bad choice for changing
> memory layouts.

In the worst case some memory in the bitmap is wasted when memory is
hot-unplugged. The amount depends on how much memory one bit covers, but
I don't see this as a show stopper.

> How will the second kernel figure out the location? Similar to how we pass
> the physical address of the vmcore header via the cmdline to the new kernel?

As I wrote in the initial proposal, the bitmap will be passed via
boot_params.

> Okay, owned by the old kernel, not initially mapped by new kernel in the
> identity mapping. Is there a prototype/code that implements that?

No, besides the prototype patch which Kirill sent around.
> Yes, but it does not affect the kdump kernel booting, only makedumpfile
> might bail out later when it detects a corruption.
> 
> I'm wondering, why exactly would a kdump kernel (not touching memory of the
> old kernel while booting up) need access to the bitmap? Just wondering, for
> ACPI tables and such? I can understand why makedumpfile would need that
> information when actually dumping memory of the old kernel, but it would
> have access to the memmap of the old kernel to obtain that information.

The kdump kernel needs the bitmap to detect when the Hypervisor is doing
something malicious, well, at least on its own memory. The kdump kernel
has full access to the previous kernels memory and could also be tricked
by the Hypervisor to reveal secrets.

> Mirroring is a good point. But I'd suggest using the bitmap only during
> early boot if really necessary and after syncing it to the bitmap, get rid
> of it. Sure, kexec is more challenging, but at least it's a clean design. We
> can always try expressing the state of validated memory in the e820 map we
> present to the kexec kernel.

It depends on how fragmented the validated/unvalidated regions will get
over time. I think currently it is not very fragmented, the biggest
shared regions are the .bss_decrypted section and the DMA bounce buffer.
But there are also a couple of page-size regions which need to be
shared. For kexec these regions can be validated again when tearing down
the APs, but for kdump it would be too fragile to do such extensive
stuff before jumping the the kdump kernel.

Regards,

	Joerg
