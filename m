Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD3173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 17:38:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190879889"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; 
   d="scan'208";a="190879889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 10:32:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; 
   d="scan'208";a="632388638"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.245.156]) ([10.212.245.156])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 10:32:57 -0700
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Joerg Roedel <jroedel@suse.de>
Cc: Erdem Aktas <erdemaktas@google.com>, Andy Lutomirski <luto@kernel.org>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Sean Christopherson <seanjc@google.com>,
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
 <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
 <YPaTKF0TPicll2FN@suse.de>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <d9909e0a-e9f7-cafa-0fc3-cf7bd1db1864@linux.intel.com>
Date: Tue, 20 Jul 2021 10:32:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPaTKF0TPicll2FN@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/20/2021 2:11 AM, Joerg Roedel wrote:
>
> I am not sure how it is implemented in TDX hardware, but for SNP the
> guest _must_ _not_ double-validate or even double-invalidate memory.


In TDX it just zeroes the data. If you can tolerate zeroing it's fine. 
Of course for most data that's not tolerable, but for kexec (minus 
kernel itself) it is.


>
> What I sent here is actually v2 of my proposal, v1 had a much more lazy
> approach like you are proposing here. But as I learned what can happen
> is this:
>
> 	* Hypervisor maps GPA X to HPA A
> 	* Guest validates GPA X
> 	  Hardware enforces that HPA A always maps to GPA X
> 	* Hypervisor remaps GPA X to HPA B
> 	* Guest lazily re-validates GPA X
> 	  Hardware enforces that HPA B always maps to GPA X
> 	
> The situation we have now is that host pages A and B are validated for
> the same guest page, and the hypervisor can switch between them at will,
> without the guest being able to notice it.


I don't believe that's possible on TDX

>
> This can open various attack vectors from the hypervisor towards the
> guest, like tricking the guest into a code-path where it accidentially
> reveals its secrets.

Well things would certainly easier if you had a purge interface then.

But for the kexec crash case it would be just attacks against the crash 
dump, which I assume are not a real security concern. The crash kexec 
mostly runs in its own memory, which doesn't need this, or is small 
enough that it can be fully pre-accepted. And for the previous memory 
view probably these issues are acceptable.

That leaves the non crash kexec case, but perhaps it is acceptable to 
just restart the guest in such a case instead of creating complicated 
and fragile new interfaces.


>> If the device filter is active it won't.
> We are not going to pohibit dma_alloc_coherent() in SNP guests just
> because we are too lazy to implement memory re-validation.


dma_alloc_coherent is of course allowed, just not freeing. Or rather if 
you free you would need a pool to recycle there.

If you have anything that free coherent dma frequently the performance 
would be terrible so you should probably avoid that at all costs anyways.

But since pretty much all the current IO models rely on a small number 
of static bounce buffers that's not a problem.

-Andi

