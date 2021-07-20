Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FAB72
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 05:17:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="275002467"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="275002467"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 22:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="431928112"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.49.53]) ([10.209.49.53])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 22:17:37 -0700
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Erdem Aktas <erdemaktas@google.com>, Andy Lutomirski <luto@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86 <x86@kernel.org>, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
Date: Mon, 19 Jul 2021 22:17:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/19/2021 6:51 PM, Erdem Aktas wrote:
>
> > There's one exception to this, which is the previous memory view in
> > crash kernels. But that's an relatively obscure case and there might be
> > other solutions for this.
>
> I think this is an important angle. It might cause reliability issues. 
> if kexec kernel does not know which page is shared or private, it can 
> use a previously shared page as a code page which will not work. It is 
> also a security concern. Hosts can always cause crashes which forces 
> guests to do kexec for crash dump. If the kexec kernel does not know 
> which pages are validated before, it might be compromised with page 
> replay attacks.

First I suspect for crash it's not a real security problem if a 
malicious hypervisor would inject zeroed pages. That means actual strong 
checks against revalidation/reaccept are not needed. That still leaves 
the issue of triggering an exception when the memory is not there. TDX 
has an option to trigger a #VE in this case, but we will actually force 
disable it to avoid #VE in the system call gap. But the standard crash 
dump tools already know how to parse mem_map to distinguish different 
types of pages. So they already would be able to do that. We just need 
some kind of safety mechanism to prevent any crashes, but that should be 
doable. Actually I'm not sure they're really needed because that's a 
root operation.

>
> Also kexec is not only for crash dumps. For warm resets, kexec kernel 
> needs to know the valid page map.

For non crash kexec it's fine to reaccept/validate memory because we 
don't care about the old contents anymore, except for the kernel itself 
and perhaps your stack/page tables. So something very simple is enough 
for that too.

>
> >> Also in general i don't think it will really happen, at least 
> initially.
> >> All the shared buffers we use are allocated and never freed. So such a
> >> problem could be deferred.
>
> Does it not depend on kernel configs? Currently, there is a valid 
> control path in dma_alloc_coherent which might alloc and free shared 
> pages.

If the device filter is active it won't.



>
> >> At the risk of asking a potentially silly question, would it be
> >> reasonable to treat non-validated memory as not-present for kernel
> >> purposes and hot-add it in a thread as it gets validated?
>
> My concern with this is, it assumes that all the present memory is 
> private. UEFI might have some pages which are shared therefore also 
> are present.


Hot add is nearly always a bad idea.


-Andi


