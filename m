Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC02FD1BB
	for <linux-coco@lists.linux.dev>; Wed,  5 Nov 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334949; cv=none; b=GEEVU5/LA7as9/oeIJZbWHRh/gem1aZNMs3BPJ3aNm7Aqshm21TUcDPrp0pPf5vUI3QfGvLbVqpr1W1sQrUz/H6hYE86Dvdpg2b9nSU9xsJjDdczbtlzguXnlKBZJ4asthQ/OGGZGpNnKMwV4cERXoIoSrdx0E504bVEnS7qVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334949; c=relaxed/simple;
	bh=yfx36wDX4m39g20CCrf6iqz6VNAuX8hHprWRNyavob4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfvqI3aZKwX8tbRpBR4F2oHf903CgTabkaOzg2WrmRjTxVBioCwiBLnIk3meEPHmSHAhmHIwflqqeYhIVXZzbq82prA7bcN5GisPZTrFKi9VQVOo0RY2MXvJ739HMi3LzrX2yLIlTw21Dh2JnHxTMHRBwV5wtwkyVBeD0/w/msM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mumrQpVx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mumrQpVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762334947; x=1793870947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yfx36wDX4m39g20CCrf6iqz6VNAuX8hHprWRNyavob4=;
  b=mumrQpVxAOTwM94qQgFViyVZTTIv8PnGEZGyDDVXyFHdL0+xvnsVkUCX
   1qTTDhG7fO1x5D+7rZUC6K+zs7Of6Bca/7QkgGxJlntONAmCUWH2m09ai
   Qlxh7EkvKD9mlwdUaSI0p8+NY34klU/BxzEn0g8KkUtIFZqx2ktJwSdUe
   gB+4TGD35d5lL+8KcAZxEjCh0JKit13rRQQMWcbSiTV6kCRPFcJADbeSr
   Dy8LeqBZU0J+8h/novH/SZFIOOWTG8RelLMP6/lXxDlNQBoXYX3UY89H2
   6rVKi2tup4h6dCmT1fxKWkIf2Omne7nL4Xw5g+EHWND1B1oW7/L6YQtY3
   A==;
X-CSE-ConnectionGUID: At/V7+zEQWqAtgI/QNenAQ==
X-CSE-MsgGUID: 6U0sOU8LQMOfDStsDyLk7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68282419"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68282419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:29:06 -0800
X-CSE-ConnectionGUID: icCqqZAbT4WrKpH3JJMkSg==
X-CSE-MsgGUID: BDOK3b8fQTysR7KDm4N4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="186654411"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2025 01:29:04 -0800
Date: Wed, 5 Nov 2025 17:14:56 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, xin@zytor.com, chao.gao@intel.com,
	Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [RFC PATCH 08/27] x86/virt/tdx: Add tdx_enable_ext() to enable
 of TDX Module Extensions
Message-ID: <aQsVkJmD98yyRXvn@yilunxu-OptiPlex-7050>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
 <20250919142237.418648-9-dan.j.williams@intel.com>
 <20251030105551.00002fe4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030105551.00002fe4@huawei.com>

On Thu, Oct 30, 2025 at 10:55:51AM +0000, Jonathan Cameron wrote:
> On Fri, 19 Sep 2025 07:22:17 -0700
> Dan Williams <dan.j.williams@intel.com> wrote:
> 
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > 
> > tdx_enable() implements a simple state machine with @tdx_module_status to
> > determine if TDX is already enabled, or failed to enable. Add another state
> > to that enum (TDX_MODULE_INITIALIZED_EXT) to track if extensions have been enabled.
> > 
> > The extension initialization uses the new TDH.EXT.MEM.ADD and TDX.EXT.INIT
> > seamcalls.
> > 
> > Note that this extension initialization does not impact existing in-flight
> > SEAMCALLs that are not implemented by the extension. So only the first user
> > of an extension-seamcall needs invoke this helper.
> > 
> > Co-developed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> 
> A few more trivial comments.
> 
> > diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> > index d47b2612c816..9d4cebace054 100644
> > --- a/arch/x86/virt/vmx/tdx/tdx.c
> > +++ b/arch/x86/virt/vmx/tdx/tdx.c
> 
> > +
> > +DEFINE_FREE(tdx_ext_mempool_free, struct tdx_page_array *, if (!IS_ERR_OR_NULL(_T)) tdx_ext_mempool_free(_T))
> Very long line. Add a break somewhere!

Yes, will wrap.

> 
> 
> > +/**
> > + * tdx_enable_ext - Enable TDX module extensions.
> > + *
> > + * This function assumes the caller has done VMXON.
> > + *
> > + * This function can be called in parallel by multiple callers.
> > + *
> > + * Return 0 if TDX module extension is enabled successfully, otherwise error.
> > + */
> > +int tdx_enable_ext(void)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&tdx_module_lock);
> guard() perhaps which would make early returns an option if nothing esle
> gets added after the switch.

Will do. New version will be based on Sean's VMXON changes [1] so has
some differences, but guard() is still a good idea.

[1] https://lore.kernel.org/linux-coco/20251010220403.987927-4-seanjc@google.com/

Thanks,
Yilun
