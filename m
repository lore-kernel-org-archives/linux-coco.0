Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1407205ADA
	for <linux-coco@lists.linux.dev>; Thu, 20 Mar 2025 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463534; cv=none; b=PUBz61MBnS95aTFEueuDfDbYjGXWF/ACDRUGgFOGWRsxM3gQ/AXtrhgxaYNJREwhQAAhXSqbZzx5JsjZ/HUV8+afKl8w9ZjHEmujld0fPs57gbMJTM7yImLRjvqEhG4kh2x6DhIYxvYmc1nNaEs1VuHbS37X+UFnjkwqCPZL9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463534; c=relaxed/simple;
	bh=XxhDtK+NPjrUigmQEObn5NVqHG9KWOcga5qM3iqOX/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWPAOP3dhcpU5e4gnHvY10DHwYVivfOC8F6aySXmcObdCkBPPplBrISUJ47id9hZEJIO9Y1OsSsSChA7NFoEzlPz5xPKC0Nkg/fREmQCqEHGnrOFRDFeLBoz1QYB4NnA5ttbZybw0X5RVPo6UhcCIyVlq+p4XxiyguPeiMvpXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4/uNaO3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4/uNaO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742463533; x=1773999533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XxhDtK+NPjrUigmQEObn5NVqHG9KWOcga5qM3iqOX/k=;
  b=F4/uNaO39/UYmmT+b0xPNmbrnp78DDNxwZizAvt5PLzjqcxImQn+V023
   Lh8hzVvVEqhLIBuFlZbuTmuXGvSSMT8malcLZqAJHHjOzJG8OdTsPnzjl
   UOs33/IA17lGQ4Gv7WkMog8B4Zte0RLywX0VfrD7H4DhkBUm+Nk9iQGl2
   tThXKdUkBWhl4eUWpxosECdVDEKZgf1IJbhps9GRF1TNXlunb3uJVtuxD
   EYbrrW9lTycsMHudpU4YNkYqQgf3pgilfoazXxHbbBoSK5Zzg2h3eSQdo
   7nRcOE/xKlXfjlu1lzGXnL7L2I4IVw7cKslZzMBNUR7CDcEShoC56dmuN
   Q==;
X-CSE-ConnectionGUID: eZRJo8jvQRS2DULk2sAXew==
X-CSE-MsgGUID: 4OdcwGeJQB20sOMdKOTL6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47341106"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="47341106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 02:38:50 -0700
X-CSE-ConnectionGUID: KT0aoQBlQDqdQcJOlWaX2g==
X-CSE-MsgGUID: AIYXmeVVQbu8OR1s90H7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="127879555"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2025 02:38:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 856FE1E0; Thu, 20 Mar 2025 11:38:46 +0200 (EET)
Date: Thu, 20 Mar 2025 11:38:46 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com, 
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
Message-ID: <h46ki6cfmrflbw4fhebsb646cpzba6iqq6cozq4prveqhowdtj@ifwsk64zo73k>
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <guatjzjzipzjzvj4oou2gktxmzileawshxmxj22hsa5kmet5g4@2rhf7tzaiytw>
 <b6d132a7-b259-46f4-8bde-fc517bd9d294@suse.com>
 <auno67lcikllqdlgdsad72hvsmym4lqxnaqaohmvtvf2boscxu@54ftt6342jxy>
 <d0891544-98b9-447a-a382-bfc078865243@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0891544-98b9-447a-a382-bfc078865243@suse.com>

On Tue, Mar 18, 2025 at 04:21:21PM +0200, Nikolay Borisov wrote:
> 
> 
> On 18.03.25 г. 15:27 ч., Kirill A. Shutemov wrote:
> > On Tue, Mar 18, 2025 at 02:53:34PM +0200, Nikolay Borisov wrote:
> > > > I think we need to think wider. What about applying a subset of LOCKDOWN_*
> > > > in all coco guests by default. Many of them are relevant for the guest security.
> > > 
> > > How do you envision this to work, by introducing another
> > > CONFIG_LOCK_DOWN_KERNEL_FORCE_COCO or some such ? Will it be opt-in or
> > > mandatory?
> > 
> > I think cc_platform_has(CC_ATTR_xxx) should enabled some subset of
> > LOCKDOWN_*. No need in new config options.
> 
> Care to suggest which ones should be included? The way lockdown works at the
> moment is that it only supports 2 levels (check lock_kernel_down() and
> lockdown_is_locked_down()) at which you can lockdown - INTEGRITY_MAX and
> CONFIDENTIALITY_MAX,  where each level includes everything below it. So by
> choosing integrity max you get:
> 
>     19         LOCKDOWN_MODULE_SIGNATURE,
> 
>     18         LOCKDOWN_DEV_MEM,
> 
>     17         LOCKDOWN_EFI_TEST,
> 
>     16         LOCKDOWN_KEXEC,
> 
>     15         LOCKDOWN_HIBERNATION,
> 
>     14         LOCKDOWN_PCI_ACCESS,
> 
>     13         LOCKDOWN_IOPORT,
> 
>     12         LOCKDOWN_MSR,
> 
>     11         LOCKDOWN_ACPI_TABLES,
> 
>     10         LOCKDOWN_DEVICE_TREE,
> 
>      9         LOCKDOWN_PCMCIA_CIS,
> 
>      8         LOCKDOWN_TIOCSSERIAL,
> 
>      7         LOCKDOWN_MODULE_PARAMETERS,
> 
>      6         LOCKDOWN_MMIOTRACE,
> 
>      5         LOCKDOWN_DEBUGFS,
> 
>      4         LOCKDOWN_XMON_WR,
> 
>      3         LOCKDOWN_BPF_WRITE_USER,
> 
>      2         LOCKDOWN_DBG_WRITE_KERNEL,
> 
>      1         LOCKDOWN_RTAS_ERROR_INJECTION,
> 
> Given this if we for example choose to lockdown the kernel for DEV_MEM,
> we'll also get the MODULE_SIGNATURE lockdown as well. I find this somewhat
> inflexible as we might have to rejuggle the current ordering.

Urgh.. I thought we track the lockdown level for each feature separately,
but it is lockdown depth instead :/

Maybe it is worth reworking internals to have bitmap of lockdown features?
It will allow us to pick and choose features to lockdown.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
