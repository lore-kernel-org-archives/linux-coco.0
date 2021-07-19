Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563C72
	for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 20:39:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190715217"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; 
   d="scan'208";a="190715217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 13:39:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; 
   d="scan'208";a="461741719"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.130.235]) ([10.212.130.235])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 13:39:49 -0700
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <4e33d22e-330f-c5ba-bc15-08a3298598c5@linux.intel.com>
Date: Mon, 19 Jul 2021 13:39:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPV27hDPZUoVsIZt@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


> 	III. Approach I. and II. can be combined. The firmware only
> 	     validates the first X MB/GB of guest memory and the rest is
> 	     validated on-demand.


It's actually not just the first X. As I understand there is a proposal 
for a new UEFI memory type, that will allow the firmware (and anyone 
else) to declare memory regions as accepted in a fine grained manner.


>
> For method II. and III. the guest needs to track which pages have
> already been validated to detect hypervisor attacks. This information
> needs to be carried through the whole boot process.

I don't think it's that bad. If we know what has been validated already 
using the memory map, then it's straight forward to check what is a 
valid validation request and what is not. Anything that's in a BIOS 
reserved region or in a region already marked as validated must be 
already validated and and can be rejected (or rather panic'ed). So I 
don't see the need to pass a fine grained validation bitmap around. Of 
course the kernel needs to maintain something (likely not a bitmap, but 
rather some form of page flag) on its own, but it doesn't need to be 
visible in any outside interfaces.

There's one exception to this, which is the previous memory view in 
crash kernels. But that's an relatively obscure case and there might be 
other solutions for this.


> Memory Validation through the Boot Process and in the Running System
> --------------------------------------------------------------------
>
> The memory is validated throughout the boot process as described below.
> These steps assume a firmware is present, but this proposal does not
> strictly require a firmware. The tasks done be the firmware can also be
> done by the hypervisor before starting the guest. The steps are:
>
> 	1. The firmware validates all memory which will not be owned by
> 	   the boot loader or the OS.
>
> 	2. The firmware also validates the first X MB of memory, just
> 	   enough to run a boot loader and to load the compressed Linux
> 	   kernel image. X is not expected to be very large, 64 or 128
> 	   MB should be enough. This pre-validation should not cause
> 	   significant delays in the boot process.
>
> 	3. The validated memory is marked E820-Usable in struct
> 	   boot_params for the Linux decompressor. The rest of the
> 	   memory is also passed to Linux via new special E820 entries
> 	   which mark the memory as Usable-but-Invalid.
>
> 	4. When the Linux decompressor takes over control, it evaluates
> 	   the E820 table and calculates to total amount of memory
> 	   available to Linux (valid and invalid memory).
>
> 	   The decompressor allocates a physically contiguous data
> 	   structure at a random memory location which is big enough to
> 	   hold the the validation states of all 4kb pages available to
> 	   the guest. This data structure will be called the Validation
> 	   Bitmap through the rest of this document. The Validation
> 	   Bitmap is indexed by page frame numbers.

I don't think we need to go that fine grained. The decompressor will 
just pre-validate all the memory it needs (which is relatively) limited 
and the later kernel can know about it in some static way and then fix 
up its mem_map state. We might need a few extra allocations between main 
kernel entry and mem_map init, but that could be handled in some simple 
data structure.


>
> 	8. When memory is returned to the memblock or page allocators,
> 	   it is _not_ invalidated. In fact, all memory which is freed
> 	   need to be valid. If it was marked invalid in the meantime
> 	   (e.g. if it the memory was used for DMA buffers), the code
> 	   owning the memory needs to validate it again before freeing
> 	   it.


I'm not sure about AMD, but in TDX we're certainly have no need to 
reaccept after something was shared.

Also in general i don't think it will really happen, at least initially. 
All the shared buffers we use are allocated and never freed. So such a 
problem could be deferred.

-Andi

