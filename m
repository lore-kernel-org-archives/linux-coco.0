Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD1125BE
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cri6KBL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697794177; x=1729330177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4jcyR0AHrPRoptorbJ7sUPfnYiRZ/f0uNOPZCGqeL0M=;
  b=cri6KBL3bG4QGF2f2USkN9Ze9TpfA37o1jKG9B0drZivk5x7tioXxwma
   lNmiP3i4WAMtKIDBCYwOzwCw2zhy58A2d2O2MoppWm5eXzQiY0buVGDis
   9vNN2sWcJJ1ISjrVrNRpWa/98gKT8NHsDBNIwqJrOHtl4J7swxGoVFDtt
   w9eBlzKJt7ZboFgNO/81ys+KPzvjcTsO8/wD9piYsU2lHO5+KkBUemxei
   7PNnEvLEQTtt7fBkPyRu6JllawbHchJ9VLq+QzuRdmHgSlbeuNWGALp91
   inkaO8qy2+i+u/kY/KD/7yLXfj+DpUfFNKP4Xg3rdGJGh/ricLWkr8SSb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452943116"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452943116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873848717"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="873848717"
Received: from dgutows1-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.39.237])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:29:32 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 9E13B109D0A; Fri, 20 Oct 2023 12:29:29 +0300 (+03)
Date: Fri, 20 Oct 2023 12:29:29 +0300
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
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 12/13] x86/acpi: Do not attempt to bring up secondary
 CPUs in kexec case
Message-ID: <20231020092929.ieig5xbhtwgrkqrl@box>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-13-kirill.shutemov@linux.intel.com>
 <100c567d4ba2e6f25dd6c51ceaf2995049d12c78.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <100c567d4ba2e6f25dd6c51ceaf2995049d12c78.camel@intel.com>

On Fri, Oct 20, 2023 at 03:29:24AM +0000, Huang, Kai wrote:
> On Thu, 2023-10-05 at 16:14 +0300, Kirill A. Shutemov wrote:
> > ACPI MADT doesn't allow to offline CPU after it got woke up. It limits
> > kexec: target kernel won't be able to use more than one CPU.
> > 
> > Zero out mailbox address in the ACPI MADT wakeup structure to indicate
> > that the mailbox is not usable.
> > 
> > This is Linux-specific protocol and not reflected in ACPI spec.
> > 
> > Booting the target kernel with signle CPU is enough to cover the most
> > common case for kexec -- kdump.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >  arch/x86/kernel/acpi/madt_wakeup.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/acpi/madt_wakeup.c b/arch/x86/kernel/acpi/madt_wakeup.c
> > index 15bdf10b1393..4e92d1d4a5fa 100644
> > --- a/arch/x86/kernel/acpi/madt_wakeup.c
> > +++ b/arch/x86/kernel/acpi/madt_wakeup.c
> > @@ -9,6 +9,11 @@ static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
> >  
> >  static int acpi_wakeup_cpu(int apicid, unsigned long start_ip)
> >  {
> > +	if (!acpi_mp_wake_mailbox_paddr) {
> > +		pr_warn_once("No MADT mailbox: cannot bringup secondary CPUs. Booting with kexec?\n");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> >  	/*
> >  	 * Remap mailbox memory only for the first call to acpi_wakeup_cpu().
> >  	 *
> > @@ -78,6 +83,18 @@ int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
> >  	/* Disable CPU onlining/offlining */
> >  	cpu_hotplug_not_supported();
> >  
> > +	/*
> > +	 * ACPI MADT doesn't allow to offline CPU after it got woke up.
> > +	 * It limits kexec: target kernel won't be able to use more than
> > +	 * one CPU.
> > +	 *
> > +	 * Zero out mailbox address in the ACPI MADT wakeup structure to
> > +	 * indicate that the mailbox is not usable.
> 
> Nit:
> 
> It is better to explicitly say that this will only impact the second kernel
> because the current kernel has already detected the  mailbox address?
> 
> 	Now acpi_mp_wake_mailbox_paddr already has the mailbox address.
> 	The acpi_wakeup_cpu() will use it to bring up secondary cpus.
> 
> 	Zero out mailbox address in the ACPI MADT wakeup structure to
> 	indicate that the mailbox is not usable.  This prevents the
> 	kexec()-ed kernel from reading a vaild mailbox, which in turn
> 	makes the kexec()-ed kernel only be able to use the boot CPU. 

Okay. Looks good.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
