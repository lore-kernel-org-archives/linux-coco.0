Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD2171D0
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTjsZ5gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700559073; x=1732095073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bzOd0cd2+5cL6VwtiHKsX8WwvIE2qYTC6osgFynenks=;
  b=WTjsZ5gfh8LKJ0ME4j4IWeZfHck366TlCkieWU39Fa0r4Tw29Gt3zuMT
   pjLRAgf1yS1TGEpcrz4fT1HlPVa0VWSOjaZTmwWtKDMPtRaHQLno2ZkFZ
   SZiS4XLKJ/cSCy2pxDSYBS2TqhJrx8YxPHiP1a7FU+lT7QtPZKR79+lfV
   GyxC/HPSql1S1yPyZ7UVEfoX+iEWYx6SU/uvQ6VageNOPgcC7wLr3EVVa
   a7lfjQQcz1h6L/VTcVl/LlPU3AJP0/nIK0w5TqW9k3iKMEWPdcSRy8SCc
   KQWJ0LvTYjaqV97jRPMmO+MnmJg400bDrkgx/xPEZYYhbOArRiH+unAFd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4930136"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4930136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="8023791"
Received: from ikosarev-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.40.84])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:31:08 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 14A2410A36E; Tue, 21 Nov 2023 12:31:05 +0300 (+03)
Date: Tue, 21 Nov 2023 12:31:05 +0300
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
Subject: Re: [PATCHv3 03/14] cpu/hotplug: Add support for declaring CPU
 offlining not supported
Message-ID: <20231121093105.ev77pgbssq6scugm@box.shutemov.name>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <20231115120044.8034-4-kirill.shutemov@linux.intel.com>
 <dbb07c1ba14dc1bd3066aa8b784b884c67638ac1.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb07c1ba14dc1bd3066aa8b784b884c67638ac1.camel@intel.com>

On Tue, Nov 21, 2023 at 02:15:59AM +0000, Huang, Kai wrote:
> On Wed, 2023-11-15 at 15:00 +0300, Kirill A. Shutemov wrote:
> > The ACPI MADT mailbox wakeup method doesn't allow to offline CPU after
> > it got woke up.
> > 
> > Currently offlining hotplug is prevented based on the confidential
> > computing attribute which is set for Intel TDX. But TDX is not
> > the only possible user of the wake up method. The MADT wakeup can be
> > implemented outside of a confidential computing environment. Offline
> > support is a property of the wakeup method, not the CoCo implementation.
> > 
> > Introduce cpu_hotplug_not_supported() that can be called to indicate
> > that CPU offlining should be disabled.
> 
> cpu_hotplug_not_supported() -> cpu_hotplug_disable_offlining().

Right.

> > 
> > This function is going to replace CC_ATTR_HOTPLUG_DISABLED for ACPI
> > MADT.
> 
> Is MADT too generic? MADT wakeup?

I'll replace it with "ACPI MADT wakeup method".

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
