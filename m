Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827EE241F4
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWY5Qkj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696605121; x=1728141121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fjbIAXrWpPm5Y8Alw4dLyHvY0cP22rX9Piu85LI1l5Y=;
  b=HWY5Qkj3W00Q/fPR5VZ0mQpOWMOpMVy/Mm06PerHOtWFa7pX4JzD4dra
   dKIAW3wlUUITgk5mB4H7hsY1j2zKJ5o/39P2/pCe1gWUgjrLuttpnr0uC
   T53GwXx3uQWsyUer51DLt/bTUBtSOs/v/Tw/M0xzdlSUJ8D8euZkH8gyY
   /3WV5i0dGQxmBxqq/W1bC4XfRcMSXAJvZD06MZNWKyCssZAMOOfv06JCA
   fYAM5x3asyPwPZeijguuVkVsv/uBZtBHlePZXtddNUTezENKh/MRF8PSm
   ezOrn887HXpcRYMeTyX4+t/Rjb3uAqd106eNPv3Thv1KT7WiC0PEk/lBM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="470035255"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="470035255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702081581"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="702081581"
Received: from kvsudesh-mobl1.gar.corp.intel.com (HELO box.shutemov.name) ([10.251.222.76])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:11:54 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id AD52C10A172; Fri,  6 Oct 2023 18:11:51 +0300 (+03)
Date: Fri, 6 Oct 2023 18:11:51 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Kalra, Ashish" <ashish.kalra@amd.com>
Subject: Re: [PATCH 10/13] x86/tdx: Convert shared memory back to private on
 kexec
Message-ID: <20231006151151.2m6t7fcu36hlrtzj@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-11-kirill.shutemov@linux.intel.com>
 <ZSAge6W4vF6ePudw@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSAge6W4vF6ePudw@google.com>

On Fri, Oct 06, 2023 at 07:58:03AM -0700, Sean Christopherson wrote:
> On Thu, Oct 05, 2023, Kirill A. Shutemov wrote:
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 7368d254d01f..b5acf9fb4c70 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -884,6 +884,7 @@ config INTEL_TDX_GUEST
> >  	select X86_MEM_ENCRYPT
> >  	select X86_MCE
> >  	select UNACCEPTED_MEMORY
> > +	select EMERGENCY_VIRT_CALLBACK
> >  	help
> >  	  Support running as a guest under Intel TDX.  Without this support,
> >  	  the guest kernel can not boot or run under TDX.
> 
> ...
> 
> >  void __init tdx_early_init(void)
> >  {
> >  	struct tdx_module_args args = {
> > @@ -882,6 +1007,14 @@ void __init tdx_early_init(void)
> >  	 */
> >  	x86_cpuinit.parallel_bringup = false;
> >  
> > +	machine_ops.shutdown = tdx_shutdown;
> > +
> > +	/*
> > +	 * KVM overrides machine_ops.crash_shutdown, use emergency
> 
> This is going to be super confusing.  KVM utilizes the emergency virt callback.
> The KVM paravirt guest code uses .crash_shutdown().  People that are passingly
> familiar with virt and know what KVM is, but don't already know the difference
> between the two are going to be all kinds of confused.
> 
> I also feel like you're playing with fire, e.g. what's to stop the hypervisor
> specific paravirt guest support from using .shutdown() in the future?
> 
> And the callback is invoked for far more than just kexec().  I don't see how the
> host can emulate a reboot without destroying and rebuilding the VM, e.g. it can't
> stuff register state to emulate INIT or RESET.  Unless I'm missing something,
> converting shared memory back to private for a shutdown or reboot is undesirable
> as adds one more thing that can go wrong and prevent the system from cleanly
> shutting down ASAP (for some definitions of "cleanly").

Okay, fair enough. I will look for better way to hookup into kexec
process. That was the best fit I found so far, but yes it is not ideal.

> Lastly, doesn't SEV need similar behavior?  This seems like core functionality
> for any guest with cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT).  Why not make the
> "unshare on kexec" code common and gate it with CC_ATTR_GUEST_MEM_ENCRYPT?

I don't know SEV specifics. I am open to collaboration on this.

Tom, Ashish, let me know if you need this in generic code. I can arrange
that.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
