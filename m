Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F672
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 22:01:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211393011"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="211393011"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 15:01:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="415387981"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 15:01:19 -0700
Date: Tue, 20 Jul 2021 15:01:13 -0700
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
Message-ID: <20210720220113.GA535804@tassilo.jf.intel.com>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com>
 <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>

On Tue, Jul 20, 2021 at 12:54:16PM -0700, Erdem Aktas wrote:
> Now let's say the kernel wants to access a page for the first time, or
> after a kexec it wants to make sure all the pages are private. it
> needs to call tdx_hcall_gpa_intent or  tdg_accept_page individually.
> If the page is already accepted, tdg_accept_page does not return any
> error in the current implementation in v3. Depending on how this page
> is being used, it's content is now "not zeroed" as opposed to what it
> is being expected. Converting this to an attack is not trivial but
> possible.

You mean when the TDVF is changed? In this case the unaccepted memory
will be a different memory type, so not lazy accept enabled kernels wouldn't
use it.

> 
> I did not see any #VE implementation to handle SEPT violations when a
> page is in PENDING state. I am assuming that this needs to be
> supported at some point (If not then we need to discuss the use cases
> for such support).

We actually plan to disable those #VEs, to avoid any problems with
the system call gap. Instead the plan is that the kernel will know
in advance what memory has been accepted or not, and accept it before
touching.

-Andi
