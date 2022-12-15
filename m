Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3192190
	for <linux-coco@lists.linux.dev>; Thu, 15 Dec 2022 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671118879; x=1702654879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2spTJNDqOA3JU359JYb+gDTvNuuQDCTXFiO+1qLec6I=;
  b=PWYkJbq8/w6mQnM53DqomSotMI6s5mb9cRHoh/5oZ+n9t2u0fICJZKGt
   uCZdIzo1cpzUgDBQEEQpNBLQV+Ed6DhxFaL71EwkqNvwAF9TAgOYJ1RDu
   ZPQ3WHYb5fubDVU81kITp2LSPqRfA9J+PeXisl4VCY+oaCOmLvDu6qH4v
   TzZxIQQJ4uqTiDeYaqJJl+9v+IZ9iO3n8rWHZbT47tQDWwWPL7f9fLJ5w
   2rtmw4iJzIdxGEZ+DcCEI3/X8U5EPKNHIuDSC8ySNQfmqF7uJYYJFkOlC
   NIsmraDEiV7ZwRKXMh6Xl098CN/B4lVz4du5xBWvuDvdCrTWdLAwWCRty
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="319872882"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="319872882"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 07:40:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="642962422"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="642962422"
Received: from milawils-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.217.73])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 07:40:21 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 48A1E109448; Thu, 15 Dec 2022 18:40:18 +0300 (+03)
Date: Thu, 15 Dec 2022 18:40:18 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] x86/tdx: Relax SEPT_VE_DISABLE check for debug TD
Message-ID: <20221215154018.dyoce56wfpvlihxt@box.shutemov.name>
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-4-kirill.shutemov@linux.intel.com>
 <4e595e75-2c5f-e114-9c2c-37689870639c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e595e75-2c5f-e114-9c2c-37689870639c@intel.com>

On Tue, Dec 13, 2022 at 03:13:43PM -0800, Dave Hansen wrote:
> On 12/9/22 05:25, Kirill A. Shutemov wrote:
> > SEPT_VE_DISABLE check is required to keep the TD protected from VMM
> > attacks, but it makes harder to debug guest kernel bugs. If guest
> > touches unaccepted memory the TD will get terminated without any
> > traces on what has happened.
> 
> This is a bit sparse.
> 
> --
> 
> A "SEPT #VE" occurs when a TDX guest touches memory that is not properly
> mapped into the "secure EPT".  This can be the result of hypervisor
> attacks or bugs, *OR* guest bugs.  Most notably, buggy guests might
> touch unaccepted memory for lots of different memory safety bugs like
> buffer overflows.
> 
> TDX guests do not want to continue in the face of hypervisor attacks or
> hypervisor bugs.  They want to terminate as fast and safely as possible.
>  SEPT_VE_DISABLE ensures that TDX guests *can't* continue in the face of
> these kinds of issues.
> 
> But, that causes a problem.  TDX guests that can't continue can't spit
> out oopses or other debugging info.  In essence SEPT_VE_DISABLE=1 guests
> are not debuggable.  That's a problem.
> 
> --
> 
> Eh?

Thanks!

> > Relax the SEPT_VE_DISABLE check to warning on debug TD and panic() in
> > the #VE handler on EPT-violation on private memory. It will produce
> > useful backtrace.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >  arch/x86/coco/tdx/tdx.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 8ad04d101270..0e47846ff8ff 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -38,6 +38,7 @@
> >  #define VE_GET_PORT_NUM(e)	((e) >> 16)
> >  #define VE_IS_IO_STRING(e)	((e) & BIT(4))
> >  
> > +#define ATTR_DEBUG		BIT(0)
> >  #define ATTR_SEPT_VE_DISABLE	BIT(28)
> >  
> >  /* TDX Module call error codes */
> > @@ -207,8 +208,15 @@ static void tdx_parse_tdinfo(u64 *cc_mask)
> >  	 * TD-private memory.  Only VMM-shared memory (MMIO) will #VE.
> >  	 */
> >  	td_attr = out.rdx;
> > -	if (!(td_attr & ATTR_SEPT_VE_DISABLE))
> > -		tdx_panic("TD misconfiguration: SEPT_VE_DISABLE attribute must be set.");
> > +	if (!(td_attr & ATTR_SEPT_VE_DISABLE)) {
> > +		const char *msg = "TD misconfiguration: SEPT_VE_DISABLE attribute must be set.";
> > +
> > +		/* Relax SEPT_VE_DISABLE check for debug TD. */
> > +		if (td_attr & ATTR_DEBUG)
> > +			pr_warn("%s\n", msg);
> > +		else
> > +			tdx_panic(msg);
> > +	}
> >  }
> >  
> >  /*
> > @@ -682,6 +690,8 @@ static int virt_exception_kernel(struct pt_regs *regs, struct ve_info *ve)
> >  	case EXIT_REASON_CPUID:
> >  		return handle_cpuid(regs, ve);
> >  	case EXIT_REASON_EPT_VIOLATION:
> > +		if (ve->gpa != cc_mkdec(ve->gpa))
> > +			panic("Unexpected EPT-violation on private memory.");
> 
> What's the cc_mkdec() doing?

Checks if the GPA is private. I will move it to helper. Like this:

static inline bool is_private_gpa(u64 gpa)
{
	return gpa == cc_mkenc(gpa);
}

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
