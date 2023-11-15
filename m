Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C701864D
	for <linux-coco@lists.linux.dev>; Wed, 15 Nov 2023 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3raxvep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700053398; x=1731589398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4dKQNl6OtXKCpQsl6Lr+xytDUybE96dRWIvxmvWFcQ=;
  b=f3raxvepjKqkwzReMNZhI/406qZhQjNZh9uU9XSR2PD1LU/5QjezlDw2
   jWFwZBczVUBsAmHBfQWwCz229tIDu3B9Mxow356HVzU9fFqy+NECkofvt
   Zz7MuVyFYC7c2KgxfRoFkIj6sBh4tkMjIABieNlh2ZSB8E/g4doYardYM
   PG9TOSp1gouOA+FIijQFbkU//hNufwJ6JDIHvVtrcjMRvdjr9/TZwahZI
   EMMU2Tgj6xF8L8GTQtfBMs4rcA5bk+MDlS+gyYmfgdzmuhlpW7afdHiQq
   MtnDWuoCoS6aXkuq8L2mU042E6dztkfdAsnO7KvmMVaOIDHB4HYuwTyJu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="477091536"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477091536"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835391248"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="835391248"
Received: from mituomis-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.44.135])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:03:09 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id EE156109F3E; Wed, 15 Nov 2023 16:03:06 +0300 (+03)
Date: Wed, 15 Nov 2023 16:03:06 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 06/14] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
Message-ID: <20231115130306.kmhaqsfpzi3gkpik@box.shutemov.name>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <20231115120044.8034-7-kirill.shutemov@linux.intel.com>
 <20231115122343.GA8262@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115122343.GA8262@noisy.programming.kicks-ass.net>

On Wed, Nov 15, 2023 at 01:23:43PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 15, 2023 at 03:00:36PM +0300, Kirill A. Shutemov wrote:
> > TDX guests are not allowed to clear CR4.MCE. Attempt to clear it leads
> > to #VE.
> > 
> > Use alternatives to keep the flag during kexec for TDX guests.
> > 
> > The change doesn't affect non-TDX-guest environments.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > ---
> >  arch/x86/kernel/relocate_kernel_64.S | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
> > index 56cab1bb25f5..bea89814b48e 100644
> > --- a/arch/x86/kernel/relocate_kernel_64.S
> > +++ b/arch/x86/kernel/relocate_kernel_64.S
> > @@ -145,11 +145,16 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
> >  	 * Set cr4 to a known state:
> >  	 *  - physical address extension enabled
> >  	 *  - 5-level paging, if it was enabled before
> > +	 *  - Machine check exception on TDX guest. Clearing MCE is not allowed
> > +	 *    in TDX guests.
> >  	 */
> >  	movl	$X86_CR4_PAE, %eax
> >  	testq	$X86_CR4_LA57, %r13
> >  	jz	1f
> >  	orl	$X86_CR4_LA57, %eax
> > +1:
> > +	ALTERNATIVE "jmp 1f", "", X86_FEATURE_TDX_GUEST
> > +	orl	$X86_CR4_MCE, %eax
> >  1:
> 
> 	ALTERNATIVE "", "orl $X86_CR4_MCE, %eax", X86_FEATURE_TDX_GUEST
> 
> ?

Oh. Right. Silly me.

Will fix.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
