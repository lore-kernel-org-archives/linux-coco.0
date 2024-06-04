Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04DA33F6
	for <linux-coco@lists.linux.dev>; Tue,  4 Jun 2024 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518284; cv=none; b=LeH0xZux+xZZWkGfFLX0xsJbd6zwlU2Vu1hYrpaSm5StruC4CFYawtamHGcwVyRcFYt+Lu/a9pMWqkzGXpwpq9R3dYGuc768H0phyDb3fwOPjJ5PupJ5M6BRKMRODyvXuj7Yf+TRTLemfuSEwCmuOmr8/VVTnQWcaPPPO2mg9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518284; c=relaxed/simple;
	bh=pvWvcrNQgufN9CzRFzzo7ISHTN099yhCI9EO4AnyfJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgXENEMWXAsZ3mIGZP+eY5h3Sac6hTJf30IgTBOFsHd6Pns/JOqvDUSU/L0Gi53a27FB7OQ+ZXhH1VqZS9Kws38zJ49a3MLdZf3dSrNRfVRN75jr87Wo6HW0d2n+j5bzMiA4YypqyFujzU14+pqf6zvW3UrlvHG2viN0uteFuXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdDXWpwt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdDXWpwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717518282; x=1749054282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pvWvcrNQgufN9CzRFzzo7ISHTN099yhCI9EO4AnyfJE=;
  b=WdDXWpwt5G7qcBSQibXbhpfLQqOxOuxM4XWxArxIJrWcdCXmFcONlALd
   A4GE5VZfrR+u9IfVKzMZEaDDwgaR4USkIToi+gUOfjLeSN7R1YSdN0EaZ
   lT2v6cSeoTTGHeU71LLiohVFuG3soUf+W7K+wO1IUqwd+6P3GN7uv51K8
   Y20cdp6/msIDoroS0lLGwDgQY0rTw2LCa918//Edf9+DKPAnAyLqNkYmv
   y50oJde/RKUS1/izUXM9b5iD+BmbSDj1n1Kj+CGmpxk+UX7O6Sf7Evo3Y
   QGF/4mPSM5jwoqwv62t2SEV9sVs9R1W8tOTJbt0PP30xzAa5ZxzJl/ee+
   g==;
X-CSE-ConnectionGUID: TAZ8yUGPSoqC1c4KzZ33Kg==
X-CSE-MsgGUID: nQe8xIF2S2OJFyuOHCsWIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13829917"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="13829917"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 09:24:42 -0700
X-CSE-ConnectionGUID: qUBTJsF0Q7eFyomBX4zctA==
X-CSE-MsgGUID: n0UalEy1Qt+6LV6QKuU3Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37293248"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2024 09:24:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 34FF52DC; Tue, 04 Jun 2024 19:24:35 +0300 (EEST)
Date: Tue, 4 Jun 2024 19:24:35 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Sean Christopherson <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, Tao Liu <ltao@redhat.com>
Subject: Re: [PATCHv11 09/19] x86/tdx: Account shared memory
Message-ID: <5sjy5qfztnipehq3j3hn4jsufrd642n272sjjcpowvgze5qm22@jjfmw6u4rvgl>
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <20240528095522.509667-10-kirill.shutemov@linux.intel.com>
 <6fd2c15b-5bd9-4e7e-8da0-4ca2c89b38f9@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fd2c15b-5bd9-4e7e-8da0-4ca2c89b38f9@intel.com>

On Tue, Jun 04, 2024 at 09:08:25AM -0700, Dave Hansen wrote:
> On 5/28/24 02:55, Kirill A. Shutemov wrote:
> > Keep track of the number of shared pages. This will allow for 
> > cross-checking against the shared information in the direct mapping
> > and reporting if the shared bit is lost.
> 
> It's probably also worth mentioning that conversions are slow and
> relatively rare and even though a global atomic isn't really scalable,
> it also isn't worth doing anything fancier.

Okay, will do.

> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 26fa47db5782..979891e97d83 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -38,6 +38,8 @@
> >  
> >  #define TDREPORT_SUBTYPE_0	0
> >  
> > +static atomic_long_t nr_shared;
> 
> Doesn't this technically need to be:
> 
> 	static atomic_long_t nr_shared = ATOMIC_LONG_INIT(0);
> 
> ?  I thought we had some architectures where the 0 logical value wasn't
> actually all 0's.

Hm. I am not aware of such requirement. I see plenty uninitilized
atomic_long_t in generic code. For instance, invalid_kread_bytes.

And I doubt TDX will ever be built for non-x86 :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
