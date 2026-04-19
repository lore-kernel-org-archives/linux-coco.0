Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA02EF67A
	for <linux-coco@lists.linux.dev>; Sun, 19 Apr 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776588914; cv=none; b=nVjvs18xcM7sS61FcqyDzccjOI5Sq3gyJ873FBqPhP9eWFvDKjthf/acgaU61lUohnp4BrIqRI5FCXK+C5A7ld5whND3IRqFql4LE2mCDILDctwalCgzqp/8pGtp/wTFfSLpu9F/5Ohy1aS1ehHGXDnTzzXsZODGcIo5CN7ry1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776588914; c=relaxed/simple;
	bh=121WulaiexZUSOEjuR3IvFl9EjOP9ZwsmkO+X9s4ZWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTEE9uTZL+6S9vWiVSgjfvquZcR/ENlaHCc7abdhj4K2SVl92OqGQN+DktqeMOKoWmjL16kN6u60fASZNz8j1FtyOonglCgHL/o0WQHreeFxLN3EzgRoJOEbuAT+1xaniXMjuHxr9vuuWWhyfNnaLctwiedw+CG2hy2P4dY3+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPtFwyIt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPtFwyIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776588911; x=1808124911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=121WulaiexZUSOEjuR3IvFl9EjOP9ZwsmkO+X9s4ZWE=;
  b=SPtFwyItXO7OLOp7E7LgTnyS+Xf/ll/+IJUQWd+kP4o+iKLkSbvjyOj+
   Sgmcejxwjn6nxiU3yKBEpR3wLbvAJSdIplGIEjmXJIGgYkLdCQIXTA4fW
   baWWX+qXZUJUY8w4E/9NHMyv3HrrxRiIE6X8umh/scRCwqiOrhJk+zJJG
   kdVcJoxnl4bskWmOOBsvgIn9TLLIBeg5yukFSFw+0FMZWOzCArtgT3Vdh
   GKutHV4h1yOUnybU6M/lh7Od/3muuFQ9tXqYJF/e8LUGbAMVCS8vM24YU
   Z9ntJff2+wVHr7b8QjgnSLqSUwpEqZqrzOb/HgcFTwQk2OF3BZtJgL73g
   Q==;
X-CSE-ConnectionGUID: FfkeH9gnSX6cS0lhbrzM4Q==
X-CSE-MsgGUID: LJul7Lx4R1OI5JfN2eZxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77610483"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="77610483"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 01:55:11 -0700
X-CSE-ConnectionGUID: RYJHa410SXiF8FqSiq+YJg==
X-CSE-MsgGUID: o1RkABj5SsyeiNE3W2xrDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="254923836"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa001.fm.intel.com with ESMTP; 19 Apr 2026 01:55:07 -0700
Date: Sun, 19 Apr 2026 16:33:02 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Gao, Chao" <chao.gao@intel.com>, "Xu, Yilun" <yilun.xu@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 05/31] x86/virt/tdx: Extend tdx_page_array to support
 IOMMU_MT
Message-ID: <aeSTPuR9cuga+I69@yilunxu-OptiPlex-7050>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-6-yilun.xu@linux.intel.com>
 <828f174d49a1ecaec65ba1179e08c6b22e249297.camel@intel.com>
 <acvX1x5nDdGtZWyI@yilunxu-OptiPlex-7050>
 <f38d0a080aee052937cb6721683d55155c657717.camel@intel.com>
 <ad4Pj0cqlprvNUSj@yilunxu-OptiPlex-7050>
 <aeBufjwO3t7XzVle@yilunxu-OptiPlex-7050>
 <69e2c9334cbf7_147c8010040@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69e2c9334cbf7_147c8010040@djbw-dev.notmuch>

On Fri, Apr 17, 2026 at 04:58:43PM -0700, Dan Williams wrote:
> Xu Yilun wrote:
> [..]
> > > 
> > > I'm drafting some changes and make the tdx_page_array look like:
> > > 
> > >   struct tdx_page_array {
> > > 	/* public: */
> > > 	unsigned int nr_pages;
> > > 	struct page **pages;
> > > 
> > > 	/* private: */
> > > 	u64 *root;
> > > 	bool flush_on_free;
> 
> How about "need_phymem_page_wbinvd"?

Yes.

> 
> That makes it a bit more greppable and not to be confused with other
> flushing.
> 
> [..]
> > Hi, I end up made the following changes on top of this series:
> > 
> > -------8<--------
> > 
> >  arch/x86/include/asm/tdx.h            |  32 +-
> >  arch/x86/virt/vmx/tdx/tdx.c           | 561 ++++++++------------------
> >  drivers/virt/coco/tdx-host/tdx-host.c | 179 ++++++--
> >  3 files changed, 316 insertions(+), 456 deletions(-)
> > 
> > +		ret = tdx_ext_mem_setup(nr_pages, &ext_mem);
> >  		if (ret)
> > +			return ret;
> >  	}
> >  
> > +	ret = tdx_ext_init();
> > +	if (ret)
> > +		goto out_remove_ext_mem;
> > +
> >  	/*
> > +	 * Extensions memory is never reclaimed once assigned, stop tracking it
> > +	 * and free the tracking structures.
> >  	 */
> > +	tdx_page_array_free(ext_mem.chunk);
> 
> Wait, these pages belong to the module now, they can't be freed, or I am
> missing something?

With this new solution, tdx_page_array is downgraded to a descriptor,
doesn't manage the actual data pages/memory any more. So
tdx_page_array_free() will not free data pages, only frees the
tdx_page_array descriptor.

> 
> > +	kfree(ext_mem.pages);
> 
> Releasing this makes sense.
> 
> >  
> >  	pr_info("%lu KB allocated for TDX Module Extensions\n",
> >  		nr_pages * PAGE_SIZE / 1024);
> >  
> >  	return 0;
> >  
> > -out_flush:
> > -	if (ext_mem)
> > +out_remove_ext_mem:
> > +	if (nr_pages) {
> > +		/*
> > +		 * TDH.EXT.MEM.ADD only collects required memory. TDX.EXT.INIT
> > +		 * does the actual initialization so if it fails some pages may
> > +		 * have been touched by the TDX module, flush cache before
> > +		 * returning these pages to kernel.
> > +		 */
> >  		wbinvd_on_all_cpus();
> > +		tdx_ext_mem_remove(&ext_mem);
> 
> This only releases the last populated chunk, not all previous chunks,
> right?

Not true. ext_mem stores all the data pages and the reusable descriptor
'chunk' for SEAMCALL. tdx_ext_mem_remove() removes all the data pages
and the 'chunk'.
