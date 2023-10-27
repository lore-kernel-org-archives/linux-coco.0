Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B471864D
	for <linux-coco@lists.linux.dev>; Fri, 27 Oct 2023 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PR+lquHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698407901; x=1729943901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FMgGs7keUPnSe1O0ZLkjvny+7wogrNAYRVjIflUV0NE=;
  b=PR+lquHtzn5QGGknt1rZ6tr9LNXqaU4pxvPgIlexGd59lM5r3yrvKGVx
   gOWL1ec/VpHKt389xY5N89qqk1enhnJb9d2JVpiP/G9+2LeZSWD0888Ve
   vaWQu2UAkCggw5bevwFYBhdnZimsHkfZNdEEIw+s34h6/FDlOKYj3aIaA
   Sc2orWT+RxXJSQYxWAyvoOwbEpJiaHrAidvQX0kdAm5+Q5nRIrKokH3Yn
   dGohGi0hREXpNJQZtjlRBMmz8SRgyDGA+eKrDLC/y+v33bBDSayZ05rZh
   Z21xb7jzZQkxqz/AGx/NyFS1a41AFTCfWfiA92c8GreXEBEaQsqHkx1nN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="474001327"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="474001327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="7634420"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.213.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:58:04 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 98EBE10A210; Fri, 27 Oct 2023 14:58:13 +0300 (+03)
Date: Fri, 27 Oct 2023 14:58:13 +0300
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
	"Christopherson,, Sean" <seanjc@google.com>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCHv2 13/13] x86/acpi: Add support for CPU offlining for ACPI
 MADT wakeup method
Message-ID: <20231027115813.imxsyq2ehl664nnw@box.shutemov.name>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-14-kirill.shutemov@linux.intel.com>
 <d86dbb81338d3473f24b3c479cf985a70bfc1118.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d86dbb81338d3473f24b3c479cf985a70bfc1118.camel@intel.com>

On Tue, Oct 24, 2023 at 10:11:58AM +0000, Huang, Kai wrote:
> 
> > --- /dev/null
> > +++ b/arch/x86/kernel/acpi/madt.S
> 
> I think the name 'madt.S' is too generic.  How about something be more specific
> such as madt_reset.S, or madt_playdead.S, etc? 

Okay, madt_playdead.S sounds good.

> > @@ -11,6 +16,150 @@ static u64 acpi_mp_wake_mailbox_paddr;
> >  /* Virtual address of the Multiprocessor Wakeup Structure mailbox */
> >  static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
> >  
> > +u64 acpi_mp_pgd;
> > +u64 acpi_mp_reset_vector_paddr;
> > +
> > +void asm_acpi_mp_play_dead(void);
> > +
> > +static void __init *alloc_pgt_page(void *context)
> > +{
> > +	return memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> > +}
> > +
> > +/*
> > + * Make sure asm_acpi_mp_play_dead() is present in the identity mapping at
> > + * the same place as in the kernel page tables. The function switches to
> > + * the identity mapping 
> > 
> 
> This function itself doesn't switch to the identity mapping.  It just creates
> the kernel mapping for asm_acpi_mp_play_dead() in the identify mapping page
> table.

By "The function" I meant asm_acpi_mp_play_dead(). Yeah, it is not clear.

Will so s/The function/asm_acpi_mp_play_dead()/

> > -	cpu_hotplug_disable_offlining();
> > +	if (mp_wake->version >= ACPI_MADT_MP_WAKEUP_VERSION_V1 &&
> > +	    mp_wake->header.length >= ACPI_MADT_MP_WAKEUP_SIZE_V1) {
> > +		acpi_mp_setup_reset(mp_wake->reset_vector);
> 
> It's better to fallback to "disable offline" if this function fails.
> 

Okay, will warn to disable offlining.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
