Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59726173
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 00:35:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209448175"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="209448175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 17:35:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="501088279"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 17:35:27 -0700
Date: Tue, 20 Jul 2021 17:35:25 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Erdem Aktas <erdemaktas@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <20210721003525.GC535804@tassilo.jf.intel.com>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com>
 <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>
 <20210720220113.GA535804@tassilo.jf.intel.com>
 <CAAYXXYwbt4_FcM1=3PRgiacfdFoztwt53CAukBaW61EyGeecnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAYXXYwbt4_FcM1=3PRgiacfdFoztwt53CAukBaW61EyGeecnQ@mail.gmail.com>

On Tue, Jul 20, 2021 at 04:55:22PM -0700, Erdem Aktas wrote:
> Thank you so much for your answer and sorry for keeping the discussion long.
> 
> On Tue, Jul 20, 2021 at 3:01 PM Andi Kleen <ak@linux.intel.com> wrote:
> > You mean when the TDVF is changed? In this case the unaccepted memory
> > will be a different memory type, so not lazy accept enabled kernels wouldn't
> > use it.
> 
> Thanks Andi for the clarification. I also saw the Kirill's answer. It
> makes sense.
> 
> > But for the kexec crash case it would be just attacks against the crash
> > dump, which I assume are not a real security concern.
> 
> If the crash kernel is compromised, it can be used to dump the
> customer memory content  to a shared location which is a real security
> concern, is it not?

This wouldn't be about compromising the crash kernel, but just about
inserting random zeroed pages into the crash dump. I assume the crash
parsing tools can handle corrupted data, it certainly happens often
enough with real dumps.

The crash kernel itself would need to be properly pre validated/accepted of
course, but that will likely happen when it loads. And the memory
it uses could be re-accepted as long as it only happens before it
is actually used (at least on Intel, there might be still the issue
Joern pointed out on AMD, but I guess there it could be avoided 
by just pre accepting everything and setting up a suitable memory
map)

BTW with our current plan of disabling the #VE i don't think
it can happen anyways.


> > The crash kexec
> > mostly runs in its own memory, which doesn't need this, or is small
> > enough that it can be fully pre-accepted. And for the previous memory
> > view probably these issues are acceptable.
> 
> I think this is where I am getting confused. I agree that we can copy
> the crashkernel to its own memory (all accepted) and run it. My
> confusion is: crash kernel will dump the memory which might have some
> shared pages between. we have 3 options:
> 1- We can either accept all the pages again, that includes the shared
> pages and lose the content of it. If we do not care about the content
> in shared pages, then this is okay.

On TDX this would lead to clearing the pages, which is definitely
not what you want for a crash dump.

> 2- Have a mechanism to transfer the private/shared page mapping and
> map all the pages accordingly before dumping.

FWIW we have very little shared mappings, and I suspect their
content is probably not super important for debugging (no
kernel data structures there). So even if you lost shared
mappings for crash dumps it likely wouldn't be a problem.

But actually it should just work.

-Andi 
