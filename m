Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E71A71F
	for <linux-coco@lists.linux.dev>; Mon,  9 Oct 2023 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcvfdF/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696858343; x=1728394343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6X7t52RMQYAzBBtDAQ5xYHufke1Kv7hNGxphb4I9Vo=;
  b=BcvfdF/g65hpKzWaJC6k/EHaUp/fcPAdtw5zSSyK8dTBHJWwPAXkEeEM
   kbIjSfTA2UmFHuzMd/DB+Nmf5MfG9rTT4pVhnSXWOP2uugfSz8slWPqMD
   VcboRZnxB3+zXOFIuenH1jaZC1HO5eNzkWTsJNBxlZfoR4NqSM5YfeBP7
   /d/vKuZUEnj5pE4tKEXJE/s5a2zcsNl8GYrPcktkf7aCAgpviNk39sGS+
   RLhmIYeglByEQPADIpasUL7XHbQ9VTDX1ooi0hmZhuAviM0suE7HFnTdq
   ZVTvc8N9DZtF+soH2+UoJW37vkuY2CVUHUH15wTJ9YfghaOSro4Q5N5+s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450644576"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="450644576"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756719143"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="756719143"
Received: from ahuge-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.233])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:32:18 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 40F1710A196; Mon,  9 Oct 2023 16:32:16 +0300 (+03)
Date: Mon, 9 Oct 2023 16:32:16 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] x86/acpi: Extract ACPI MADT wakeup code into a
 separate file
Message-ID: <20231009133216.pmihemrukk6k63mo@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-2-kirill.shutemov@linux.intel.com>
 <2be8a356-79c8-49a0-ba93-2a92df119af3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2be8a356-79c8-49a0-ba93-2a92df119af3@linux.intel.com>

On Fri, Oct 06, 2023 at 11:33:47AM -0700, Kuppuswamy Sathyanarayanan wrote:
> Hi Kirill,
> 
> On 10/5/2023 6:13 AM, Kirill A. Shutemov wrote:
> > In order to prepare for the expansion of support for the ACPI MADT
> > wakeup method, the relevant code has been moved into a separate file.
> > A new configuration option has been introduced to clearly indicate
> > dependencies without the use of ifdefs.
> > 
> > There have been no functional changes.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >  arch/x86/Kconfig                   |  7 +++
> >  arch/x86/include/asm/acpi.h        |  5 ++
> >  arch/x86/kernel/acpi/Makefile      | 11 ++--
> >  arch/x86/kernel/acpi/boot.c        | 86 +-----------------------------
> >  arch/x86/kernel/acpi/madt_wakeup.c | 80 +++++++++++++++++++++++++++
> >  5 files changed, 99 insertions(+), 90 deletions(-)
> >  create mode 100644 arch/x86/kernel/acpi/madt_wakeup.c
> > 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 3154dbc49cf5..7368d254d01f 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -1108,6 +1108,13 @@ config X86_LOCAL_APIC
> >  	depends on X86_64 || SMP || X86_32_NON_STANDARD || X86_UP_APIC || PCI_MSI
> >  	select IRQ_DOMAIN_HIERARCHY
> >  
> > +config X86_ACPI_MADT_WAKEUP
> > +	def_bool y
> > +	depends on X86_64
> > +	depends on ACPI
> > +	depends on SMP
> > +	depends on X86_LOCAL_APIC
> > +
> >  config X86_IO_APIC
> >  	def_bool y
> >  	depends on X86_LOCAL_APIC || X86_UP_IOAPIC
> > diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> > index c8a7fc23f63c..b536b5a6a57b 100644
> > --- a/arch/x86/include/asm/acpi.h
> > +++ b/arch/x86/include/asm/acpi.h
> > @@ -73,6 +73,11 @@ static inline bool acpi_skip_set_wakeup_address(void)
> >  
> >  #define acpi_skip_set_wakeup_address acpi_skip_set_wakeup_address
> >  
> > +union acpi_subtable_headers;
> > +
> > +int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
> > +			      const unsigned long end);
> > +
> 
> IMO, you don't need to declare acpi_parse_mp_wake() in asm/acpi.h. Since the
> only user of this function is in arch/x86/kernel/acpi, you can either create
> a header file there or re-use sleep.h.

Is it a really a bid deal? I don't see how it fits into sleep.h and
introducing one more header file for one declaration seems excessive.

> If you want to leave it here, do you want to protect it with
> CONFIG_X86_ACPI_MADT_WAKEUP?

Declarations are harmless if nobody uses them. Needless ifdeffery hurts
eyes :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
