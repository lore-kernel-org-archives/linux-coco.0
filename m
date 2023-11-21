Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927F93C095
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMqNUu+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700560748; x=1732096748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XyEy7zmHBwf6sIUIxjVHPKFIhUo8sYFFxrT0V70k+g8=;
  b=DMqNUu+p5GaxM1RuBR8UfcoFTeSQHUgh0nMqnGDkRxbydhB115EJca8F
   XQ5HQJ7phxkZj1q+s4HRZa1IHaYKP4RyXNxpZ/Xn9I8vVZO2vlg17Oo5y
   kUGzf08MW9HZz+749NaKOLtKbXXZWpKGsyC9faWTQwe6UHBGlE5c3BZYk
   uJ2/R+KTT4lw5eJ3Uu220y0msGgfTxc4IkPHwDm9DiDwb56YXWQggGY+D
   ofiY9HXM4TidWne/nqIZECRseSluu2N3ktRYG7IAujuFKOiitet4vq4Gj
   L8WvEiVXNrj6rWvbdDjaX9HWLOGox2okBh3rnY4t5GQHrTVzFtATXGS3C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376841394"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="376841394"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766586766"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766586766"
Received: from ikosarev-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.84])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:59:02 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id BFF8510A36E; Tue, 21 Nov 2023 12:58:59 +0300 (+03)
Date: Tue, 21 Nov 2023 12:58:59 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCHv3 10/14] x86/tdx: Convert shared memory back to private
 on kexec
Message-ID: <20231121095859.36xiltn2gwgyxmwy@box.shutemov.name>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <20231115120044.8034-11-kirill.shutemov@linux.intel.com>
 <8277e9a1df4c3fd968edf670b0aa7dc1dd50dcf8.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8277e9a1df4c3fd968edf670b0aa7dc1dd50dcf8.camel@intel.com>

On Tue, Nov 21, 2023 at 03:46:41AM +0000, Huang, Kai wrote:
> 
> >  
> > +static atomic_t conversions_in_progress;
> > +static bool conversion_allowed = true;
> > 
> 
> [...]
> 
> >  /* Used while preparing memory map entries for second kernel */
> >  struct crash_memmap_data {
> > @@ -107,6 +108,9 @@ void native_machine_crash_shutdown(struct pt_regs *regs)
> >  
> >  	crash_smp_send_stop();
> >  
> > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> > +		x86_platform.guest.enc_kexec_unshare_mem(true);
> > +
> >  	cpu_emergency_disable_virtualization();
> >  
> >  	/*
> > diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> > index 830425e6d38e..9fb302562bfd 100644
> > --- a/arch/x86/kernel/reboot.c
> > +++ b/arch/x86/kernel/reboot.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/objtool.h>
> >  #include <linux/pgtable.h>
> > +#include <linux/kexec.h>
> >  #include <acpi/reboot.h>
> >  #include <asm/io.h>
> >  #include <asm/apic.h>
> > @@ -31,6 +32,7 @@
> >  #include <asm/realmode.h>
> >  #include <asm/x86_init.h>
> >  #include <asm/efi.h>
> > +#include <asm/tdx.h>
> >  
> >  /*
> >   * Power off function, if any
> > @@ -716,6 +718,9 @@ static void native_machine_emergency_restart(void)
> >  
> >  void native_machine_shutdown(void)
> >  {
> > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) && kexec_in_progress)
> > +		x86_platform.guest.enc_kexec_unshare_mem(false);
> > +
> >  	/* Stop the cpus and apics */
> >  #ifdef CONFIG_X86_IO_APIC
> >  	/*
> 
> In native_machine_crash_shutdown() the "unshare" is called after
> crash_smp_send_stop(), but here it's called before the stop_other_cpus().
> 
> I am wondering if you call "unshare" after stop_other_cpus(), can we guarantee
> there's only one cpu running in both normal and crash kexec in which case you
> might be able to get rid of the "conversions_in_progress" and
> "conversion_allowed" above?

For normal kexec we need to keep other CPUs going so they can finish
conversion cleanly and get us to the known state. Note that the conversion
is not atomic wrt preemption.

In crash scenario we do the best effort: detect if we race with conversion
and report. We cannot really wait for conversions to finish: we get into
crash path with IRQs disabled and in generally unknown state.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
