Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9387C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656036019; x=1687572019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UJ0AYgFys+sE10qyEdSaNFzs230jBihAsKBv88t635A=;
  b=C6ZgLNy8eu7HzQY7Q4m/FyPZtG+HWCFC6tLG/wNRyVzKZvxs17FTGjlW
   KFQd4wMKzoKdhZJnA7ax9kgrO8/t6I/CNo9D+yWqUoSNAI3Sj21EMOkld
   +lVVTZ5zo9VmNiVwdLsv2Xr/aw9tp5lWN2fWUpKvf6oRTlQdbl27VY5Ey
   +V18W1Se/ceoAGVP3qJ8QXHz4AOW1ORLX2rK/5ZmRBc5BkWPRiDzYiwEu
   LQB/kDZCTvPqVPLylbnyJRQGoc9iHdl1RIrzbwqz1kBPuGWcaaKY1+XAc
   PZTAVCun/KrmEyULCSNPyeZs7tXEW1nwAyQXhVfqSdwQ8mCoF4aT75Obj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="342583037"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="342583037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 19:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="656446240"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2022 19:00:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A3D07136; Fri, 24 Jun 2022 05:00:05 +0300 (EEST)
Date: Fri, 24 Jun 2022 05:00:05 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
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
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, marcelo.cerri@canonical.com,
	tim.gardner@canonical.com, khalid.elmously@canonical.com,
	philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCHv7 11/14] x86: Disable kexec if system has unaccepted
 memory
Message-ID: <20220624020005.txpxlsbjbebf6oq4@black.fi.intel.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-12-kirill.shutemov@linux.intel.com>
 <6be29d38-5c93-7cc9-0de7-235d3f83773c@intel.com>
 <87a6a3aw50.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6a3aw50.fsf@email.froward.int.ebiederm.org>

On Thu, Jun 23, 2022 at 04:48:59PM -0500, Eric W. Biederman wrote:
> Dave Hansen <dave.hansen@intel.com> writes:
> 
> > ... adding kexec folks
> >
> > On 6/14/22 05:02, Kirill A. Shutemov wrote:
> >> On kexec, the target kernel has to know what memory has been accepted.
> >> Information in EFI map is out of date and cannot be used.
> >> 
> >> boot_params.unaccepted_memory can be used to pass the bitmap between two
> >> kernels on kexec, but the use-case is not yet implemented.
> >> 
> >> Disable kexec on machines with unaccepted memory for now.
> > ...
> >> +static int __init unaccepted_init(void)
> >> +{
> >> +	if (!boot_params.unaccepted_memory)
> >> +		return 0;
> >> +
> >> +#ifdef CONFIG_KEXEC_CORE
> >> +	/*
> >> +	 * TODO: Information on memory acceptance status has to be communicated
> >> +	 * between kernel.
> >> +	 */
> >> +	pr_warn("Disable kexec: not yet supported on systems with unaccepted memory\n");
> >> +	kexec_load_disabled = 1;
> >> +#endif
> >
> > This looks to be the *only* in-kernel user tweaking kexec_load_disabled.
> >  It doesn't feel great to just be disabling kexec like this.  Why not
> > just fix it properly?

Unfortunately, problems with kexec are not limited to the unaccepted
memory. Isaku pointed out that MADT CPU wake is also problematic for
kexec. It doesn't allow CPU offline so secondary kernel will not be able
to wake it up. So additional limitation (as of now) for kexec is !SMP on
TDX guest.

I guess we can implement CPU offlining by going to a loop that checks
mailbox and responds to the command. That loops has to be somehow
protected from being overwritten on kexec.

Other issues may come up as we actually try to implement it.

That's all doable, but feels like a scope creep for unaccepted memory
enabling patchset :/

Is it a must for merge consideration?

> > What do the kexec folks think?
> 
> I didn't realized someone had implemented kexec_load_disabled.  I am not
> particularly happy about that.  It looks like an over-broad stick that
> we will have to support forever.
> 
> This change looks like it just builds on that bad decision.
> 
> If people don't want to deal with this situation right now, then I
> recommend they make this new code and KEXEC conflict at the Kconfig
> level.  That would give serious incentive to adding the missing
> implementation.

I tried to limit KEXEC on Kconfig level before[1]. Naive approach does not work[2]:

WARNING: unmet direct dependencies detected for UNACCEPTED_MEMORY
  Depends on [n]: EFI [=y] && EFI_STUB [=y] && !KEXEC_CORE [=y]
  Selected by [y]:
  - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]

Maybe my Kconfig-fu is not strong enough, I donno.

[1] https://lore.kernel.org/all/20220425033934.68551-6-kirill.shutemov@linux.intel.com
[2] https://lore.kernel.org/all/YnOjJB8h3ZUR9sLX@zn.tnic

> If there is some deep and fundamental why this can not be supported
> then it probably makes sense to put some code in the arch_kexec_load
> hook that verifies that deep and fundamental reason is present.

Sounds straight-forward. I can do this.

> With the kexec code all we have to verify it works is a little testing
> and careful code review.  Something like this makes code review much
> harder because the entire kernel has to be checked to see if some random
> driver without locking changed a variable.  Rather than having it
> apparent that this special case exists when reading through the kexec
> code.
> 
> Eric
> 

-- 
 Kirill A. Shutemov
