Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDB15A5
	for <linux-coco@lists.linux.dev>; Mon,  6 May 2024 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001732; cv=none; b=nQCeQqL7LvpW+qAIRY5JV7czwcov8HlI/wh2QyzvrHXr/Y5quZAAYw0eepHwTSStDqzh+ZB/t2vJCMSlcVlu8GWNgEI7qQiufG1ZvAz723VM52BlXMG/uAyA8YkZPjs5wk0tdDfgUkYT4+2K9nN5E2NPWsej7560idBNJ1l06/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001732; c=relaxed/simple;
	bh=BCuAyhvvdHlZNeT/yRgbvu9IxMPed1+0m8MQqbV2QlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhaGuhYasZTOqms9m73QhJLKikKL0jp/OrHZh1l3fLZTxauJe2iXQo26Diir7Ql4sVAJmyRM2u5IHQbCFYat0eb0xhUIzBUgcVBhEMXJaMiUWx1EyfXlN/W0/UzkhCp9CvQTtTY5mms1PZstLLU7k76NKtbeNm0gXsAO+W8nCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGtMz7uH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGtMz7uH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715001730; x=1746537730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BCuAyhvvdHlZNeT/yRgbvu9IxMPed1+0m8MQqbV2QlI=;
  b=gGtMz7uHVirWTs1RbaZRydGj9Ixi1vnPKozbVf51yfmPIJScwd2Dq164
   aynYfkVDluj2XK2TkWHn1SKFCIP9yNyCw+b3WcSjoXR8Y186F2TPghhYr
   S9D7wfCDmmCZ2kRB0tVvD/PQVXuD+wDXm0v3AzV6urNH6uoYyRLkSAsiG
   R6l2Ln12tXFm9WPTN20UebG8RBYvq5ldBv+rtaOHlNkR2qzYdPL2DS7xv
   D7YtJRlmV/kPK5RE/TdgBQNtq9Vq491gUB738DsJG3bmlAr4Cjp/Amk+y
   XRtcL4Jayj/5bEFYb79ho3IHDN5DklG50qerbOigXsV/93I8oDVhqDder
   A==;
X-CSE-ConnectionGUID: Avey7UH6Rj+ZXTGxYYuHmw==
X-CSE-MsgGUID: LtBYNkDRTy2rOIcdnQI8Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21900688"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="21900688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 06:22:09 -0700
X-CSE-ConnectionGUID: by/aMopuSXyo3mmKnNMsxg==
X-CSE-MsgGUID: kPhhB31ETkuyZsPTIKNoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28256756"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2024 06:22:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 0513A12B; Mon, 06 May 2024 16:22:02 +0300 (EEST)
Date: Mon, 6 May 2024 16:22:02 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: adrian.hunter@intel.com, ashish.kalra@amd.com, bhe@redhat.com, 
	dave.hansen@linux.intel.com, elena.reshetova@intel.com, jun.nakajima@intel.com, 
	kai.huang@intel.com, kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ltao@redhat.com, mingo@redhat.com, nik.borisov@suse.com, 
	peterz@infradead.org, rafael@kernel.org, rick.p.edgecombe@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, seanjc@google.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	x86@kernel.org
Subject: Re: [PATCHv10.1 09/18] x86/mm: Adding callbacks to prepare encrypted
 memory for kexec
Message-ID: <ch244dd4k5nu5rcryuwqp4pztl4dduhciqunin5drr7a3yls2h@siisliaoc2f6>
References: <20240427164747.GCZi0sM6HBCBYtgWqF@fat_crate.local>
 <20240427170634.2397725-1-kirill.shutemov@linux.intel.com>
 <20240502134506.GDZjOY4guvlKH9-73J@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502134506.GDZjOY4guvlKH9-73J@fat_crate.local>

On Thu, May 02, 2024 at 03:45:06PM +0200, Borislav Petkov wrote:
> > diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> > index e74d0c4286c1..f1b261be78b4 100644
> > --- a/arch/x86/kernel/crash.c
> > +++ b/arch/x86/kernel/crash.c
> > @@ -128,6 +128,10 @@ void native_machine_crash_shutdown(struct pt_regs *regs)
> >  #ifdef CONFIG_HPET_TIMER
> >  	hpet_disable();
> >  #endif
> > +
> > +	x86_platform.guest.enc_kexec_stop_conversion(true);
> > +	x86_platform.guest.enc_kexec_unshare_mem();
> > +
> 
> You call them here back-to-back...
> 
> >  	crash_save_cpu(regs, safe_smp_processor_id());
> >  }
> >  
> > diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> > index f3130f762784..c1920ec34f0c 100644
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
> > @@ -716,6 +717,14 @@ static void native_machine_emergency_restart(void)
> >  
> >  void native_machine_shutdown(void)
> >  {
> > +	/*
> > +	 * Call enc_kexec_stop_conversion() while all CPUs are still active and
> > +	 * interrupts are enabled. This will allow all in-flight memory
> > +	 * conversions to finish cleanly.
> > +	 */
> > +	if (kexec_in_progress)
> > +		x86_platform.guest.enc_kexec_stop_conversion(false);
> > +
> >  	/* Stop the cpus and apics */
> >  #ifdef CONFIG_X86_IO_APIC
> >  	/*
> > @@ -752,6 +761,9 @@ void native_machine_shutdown(void)
> >  #ifdef CONFIG_X86_64
> >  	x86_platform.iommu_shutdown();
> >  #endif
> > +
> > +	if (kexec_in_progress)
> > +		x86_platform.guest.enc_kexec_unshare_mem();
> 
> ... but they're split here.
> 
> And I don't know why and nothing tells me...

I do. See comment just above enc_kexec_stop_conversion() call.

Do you want also comment for enc_kexec_unshare_mem() ?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
