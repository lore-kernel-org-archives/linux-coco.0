Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6BE13BC1E
	for <linux-coco@lists.linux.dev>; Mon, 16 Sep 2024 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477584; cv=none; b=iV7kFTjRA29/DBtMkdAhp7MQlfc0ObWtGT24SeVbm0R3jppkUXf736qJ40ES41hDfO3p+OVhIRpGMchXI+8R4GsXzPHk7xuX3uEcoOEKNLWZXXN+Vnk7v3K54aOEpheSTO2uORcceL8d8/JDRez8kqjrgPDBUgVf4g4gC1P3bcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477584; c=relaxed/simple;
	bh=WUIHIpfIv72AE+y4IS8rZZDNI9UBN4lb8kqGlVwjVvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJn2kwK0GX0yyUqofkxsQOrabeqDH4eyEukEA0mNFI3Ft/pK3nUqCAM6AqyXimsk9JznvT3q9pPZdU68V2/sPTBTyJBxT8oLByvZOdg9DrfRLoIhILsvPeFx196/kS9e3hYbFXBH3XtbA8NhP0yv3ubYpE4t0HA0b2KJRelCcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKLfiLa0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKLfiLa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726477583; x=1758013583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUIHIpfIv72AE+y4IS8rZZDNI9UBN4lb8kqGlVwjVvM=;
  b=QKLfiLa05VvnnAh/2jBZff8CWLftAgHy326edVsiqGJOwZq8b0qStCU1
   yHj3aY8tEG8nfKjRzF7QABUQXdEGdKklhK/kGdTkD0ZZT7SxWfiruYlyF
   yRriZmnMLJRWoQXWPcwvTp9O4XknAeBCFQSBzMFkc3w9CA745sSOrfLk8
   2orzEb8GsOajZeckMEAWmS3kvonppmIenmqd3N5l9QtOA1fhpMK8khzjn
   Zq0Gt5y2jy3DbuCdCLM2LG4dOiX1iTJY/GF6wjN8kDATicKlyjLNX5RPZ
   utST4G3xmGYPdAjOelZ7k6xX6zPAVQuT+Vz7bsQPleoiBdukx4qWRh1fD
   w==;
X-CSE-ConnectionGUID: rmHunl0QTp6v/+WI2LzBUA==
X-CSE-MsgGUID: cpcPU146SVWHwLXSI6M6SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36675864"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="36675864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 02:06:22 -0700
X-CSE-ConnectionGUID: H3ewBOlHQwW6PdETSttD+w==
X-CSE-MsgGUID: NZf9zWkeTqSH6VAVGFlZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="99662610"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2024 02:06:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 2F8C8668; Mon, 16 Sep 2024 12:06:18 +0300 (EEST)
Date: Mon, 16 Sep 2024 12:06:18 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Michael Roth <michael.roth@amd.com>, x86@kernel.org, aik@amd.com, elena.reshetova@intel.com, 
	pgonda@google.com
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
Message-ID: <74ne4i5nzgqzoxdvh2f5acqeffa7cx7nkpi5cknl5c66kbm63v@v2m52cgxy2ko>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>

On Thu, Sep 12, 2024 at 05:26:26PM -0700, Dan Williams wrote:
> One of the points of contention for enabling runtime updates of the TDX
> Module has been what to do about the fact that it results in
> confidential VMs seeing surprise updates to their TCB. The general
> concern is that there is a non-zero confidentiality regression risk for
> updating measured TCB components. Not only the TDX Module, but
> microcode, SEV-SNP PSP firmware, RISCV and ARM equivalents etc. The
> degree to which the TCB is or is not compromised by an unexpected update
> is unknowable by the kernel, but it should at least try to be
> transparent about what it knows about TCB stability.
> 
> Ironically, microcode and PSP firmware update flows predated this
> launch-state attestation era of confidential computing and resulted in a
> "permissive" by default policy. So while TDX Module update is a new
> concern that triggers fresh questions, the resolution of that question
> reads on more than just the TDX Module.
> 
> The proposal is: update the cross-vendor TSM Reports mechanism to have a
> unified response to this question in the form of a "TCB Stability"
> build-time configuration stance.
> 
> Likely hosting providers expect tenants to be permissive of updates at
> all times in which case they can just mandate
> CONFIG_TSM_REPORTS_TCB_STABILITY_PERMISSIVE in tenant Linux kernel
> configs, and no need to read the rest of this changelog.
> 
> Outside of that case though the kernel has a responsibility to be
> transparent about what it knows about the stability of launch
> attestation reports, and it has the ability to supplement the lack of
> proactive notification of pending updates with an after-the-fact
> watchdog.
> 
> The expectation is that userspace that depends on remote attestation
> (the common ecosystem expectation for confidential computing
> deployments) already has everything it needs to periodically revalidate
> the TCB. However, similar to how the typical watchdog backstops
> unexpected lockup scenarios to limit downtime, the
> CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED policy backstops unexpected
> remote attestation connectivity losses in a common way.
> 
> Lastly, CONFIG_TSM_REPORTS_TCB_STABILITY_STRICT, for completeness,
> allows the kernel to be toxic to even the possibility of runtime
> updates. The inclusion of this option is mainly for the communication
> value it provides to later survey how many Linux distributions, cloud
> hosting providers and confidential computing host platforms offer
> compatibility with a "no runtime TCB component update" policy. The
> maintenance burden of this option is low compared to that communication
> value.
> 
> The enforcement of "Relaxed" or "Strict" violations is expected to adopt
> the kernel's "panic_on_warn" policy. I.e. a violation is only a WARN()
> in either configuration.
> 
> For now, only tdx-guest is updated to convey when runtime updates are
> disbaled. sev-guest always asserts that runtime updates are enabled.

I am not convinced it brings any value in TDX case.

Whether TDX module supports TD_PRESERVING depends on what TDX module it
is. And TDX module is already attested, so attestation server can just
fail attestation if it is not okay with it. It seems to be functionally
equivalent to what you are proposing.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
