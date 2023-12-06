Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F13EA88
	for <linux-coco@lists.linux.dev>; Wed,  6 Dec 2023 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4ZBPgbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701875273; x=1733411273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OxpvoPymnRmbz5abQuGqeWGHWYBRoA/LaZb29RStz5I=;
  b=U4ZBPgbevGikpoB2DGt9bNOJxTNTXLNwROYPRt2mSlUMlNf/EzOQr9ie
   doLcGGQdPDX0jpc3/ffw/yVPjwGIMHW0y9PwEdxLwuFaTEvjzzPVQKVFO
   pnlm9v7mFdOjdDYkRBgRnTPU10Jpu2ngAVijqKsoZpQSOx4tOulX2gihW
   hPCZfA401U0kenMqLtilEvM7FrVp0S/cF+Vv7wJ3v1Pes7KQUHXbA3yFH
   FCwY4Qe5rVlLLkXXCEsCbJ+9cHbA04davgPZC8eiQCaXpe19alDCBuAOx
   PFOkqALEl3D3ARgz+Rh33TXc4VZf/gS3TWzJsgF8imdw94jEQCpsNUD4k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12787922"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="12787922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 07:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915215154"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="915215154"
Received: from eborisov-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.46.36])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 07:07:46 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 8C59410A3F5; Wed,  6 Dec 2023 18:07:43 +0300 (+03)
Date: Wed, 6 Dec 2023 18:07:43 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"Huang, Kai" <kai.huang@intel.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"seanjc@google.com" <seanjc@google.com>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4 10/14] x86/tdx: Convert shared memory back to private
 on kexec
Message-ID: <20231206150743.ylgdh2b3qjnacws3@box.shutemov.name>
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
 <20231205004510.27164-11-kirill.shutemov@linux.intel.com>
 <3cf8b953c449320cc4c085924ef0e2eed5eadcf7.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cf8b953c449320cc4c085924ef0e2eed5eadcf7.camel@intel.com>

On Wed, Dec 06, 2023 at 01:28:08AM +0000, Edgecombe, Rick P wrote:
> On Tue, 2023-12-05 at 03:45 +0300, Kirill A. Shutemov wrote: 
> > +static void tdx_kexec_unshare_mem(bool crash)
> > +{
> > +       unsigned long addr, end;
> > +       long found = 0, shared;
> > +
> > +       /* Stop new private<->shared conversions */
> > +       conversion_allowed = false;
> 
> I wonder if this might need a compiler barrier here to be totally safe.
> I'm not sure.

Yeah, it should be cleaner with a barrier.

> > +
> > +       /*
> > +        * Crash kernel reaches here with interrupts disabled: can't
> > wait for
> > +        * conversions to finish.
> > +        *
> > +        * If race happened, just report and proceed.
> > +        */
> > +       if (!crash) {
> > +               unsigned long timeout;
> > +
> > +               /*
> > +                * Wait for in-flight conversions to complete.
> > +                *
> > +                * Do not wait more than 30 seconds.
> > +                */
> > +               timeout = 30 * USEC_PER_SEC;
> > +               while (atomic_read(&conversions_in_progress) &&
> > timeout--)
> > +                       udelay(1);
> > +       }
> > +
> > +       if (atomic_read(&conversions_in_progress))
> > +               pr_warn("Failed to finish shared<->private
> > conversions\n");
> 
> I can't think of any non-ridiculous way to handle this case. Maybe we
> need VMM help.

Do you see a specific way how VMM can help here?

> > diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> > index 830425e6d38e..c81afffaa954 100644
> > --- a/arch/x86/kernel/reboot.c
> > +++ b/arch/x86/kernel/reboot.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/objtool.h>
> >  #include <linux/pgtable.h>
> > +#include <linux/kexec.h>
> >  #include <acpi/reboot.h>
> >  #include <asm/io.h>
> >  #include <asm/apic.h>
> > @@ -31,6 +32,7 @@
> >  #include <asm/realmode.h>
> >  #include <asm/x86_init.h>
> >  #include <asm/efi.h>
> > +#include <asm/tdx.h>
> >  
> >  /*
> >   * Power off function, if any
> > @@ -716,6 +718,14 @@ static void
> > native_machine_emergency_restart(void)
> >  
> >  void native_machine_shutdown(void)
> >  {
> > +       /*
> > +        * Call enc_kexec_unshare_mem() while all CPUs are still
> > active and
> > +        * interrupts are enabled. This will allow all in-flight
> > memory
> > +        * conversions to finish cleanly before unsharing all memory.
> > +        */
> > +       if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > kexec_in_progress)
> > +               x86_platform.guest.enc_kexec_unshare_mem(false);
> 
> These questions are coming from an incomplete understanding of the
> kexec/reboot operation. Please disregard if it is not helpful.
> 
> By doing this while other tasks can still run, it handles the
> conversion races in the !crash case. But then it sets shared pages to
> NP. What happens if another active task tries to write to one?
> 
> I guess we rely on the kernel_restart_prepare()->device_shutdown() to
> clean up, which runs before native_machine_shutdown(). So there might
> be conversions in progress when tdx_kexec_unshare_mem() is called, from
> the allocator work queues. But the actual memory won't be accessed
> during that operation.

Right, devices has to be shutdown by then.

> But the console must be active? Or otherwise who can see these
> warnings. It doesn't use a shared page? Or the KVM clock, which looks
> to clean up at cpu tear down, which now happens after
> tdx_kexec_unshare_mem()? So I wonder if there might be cases.

Virtio console is not functional by then, but serial is. Serial uses port
I/O and doesn't need shared memory.

> If so, maybe you could halt the conversions in
> native_machine_shutdown(), then do the actual reset to private after
> tasks can't schedule.

It would also mean that we cannot use set_memory_np() there as it requires
sleepable context. I would rather keep conversion in
native_machine_shutdown() path.

> I'd still wonder about if anything might try to
> access a shared page triggered by the console output.

set_memory_np() would make it obvious if it ever happens.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
