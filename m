Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE1137C2E
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228385; cv=none; b=LwxkQBV8nEo7frqZ0UIyCZFlud8NRs3yNVqxcOsUfVT/U/Uq2dx3SbMhyud68D4fN8FFWb7nMbBW5WLPwdqiBCYR2tvCvO304xZmgWLIrl+eli1rwE86BainelyTFeEcLToMElkJScKu72EMzKHpMDGefz7f2hFohTKewJ1RgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228385; c=relaxed/simple;
	bh=Tm9fAW/AREuzKA/Tkfd7vj68m0jTPVdhUFYZv8Wddfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2AJ+8o2q8iMguAMQGAGkYhLr+rutoq5Z7dUlh5UxWSEqYi5WVUgpUM1Qqu4K1VkNIfbgascIC/pMaNffPww+FxVrskLyzNUdgcTlenbt5pWKj+11p1dH5NUqYrWaIEeu1WNPEsh5zUqvpgHwuXZkXa8qinWvxu1Pth0+Z7vPbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBoWFLFd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBoWFLFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719228383; x=1750764383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tm9fAW/AREuzKA/Tkfd7vj68m0jTPVdhUFYZv8Wddfs=;
  b=WBoWFLFd8fbleS+PXYbQEGUcIqg4VZp3fahOlP42N4SvfMVllLLrWEDu
   nMneQL73R0Y7Ft3TLp6Th8NfEJmFrBQaGlWvWbr2gztHbZjG1XmLPXU8g
   taHJCCHT2/iS04/K1d+OlyLffw6LOeEqD+zLcUZL3gl/SWu09WNHY3mmS
   qIptLSaFyFM6zZyYPNTRcuixngmL6V6gDTCvBj/6E7EPLVgfIANWtnG2B
   a4TOAMtGnVmevpAL0u10MfZTxTJ1129hiknlyt1RWLPo3HhfQ4DRnnrdh
   rXQt8ntR5fnYesZL0NiWYab5r0oiB09Bav1TtIZn76fNAlrT38L7ZV1K+
   A==;
X-CSE-ConnectionGUID: 8KLiKpXbQ0uRoDVpTg4Vzw==
X-CSE-MsgGUID: GdH7Nb/PT6SqdT3DQMq5vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16317119"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="16317119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 04:26:23 -0700
X-CSE-ConnectionGUID: asvPvMNNSP+tBAvd27oXwg==
X-CSE-MsgGUID: CE0VjRTdRMSn65ma02ofQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43354576"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2024 04:26:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id CB0CD1BD; Mon, 24 Jun 2024 14:26:20 +0300 (EEST)
Date: Mon, 24 Jun 2024 14:26:20 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Jun Miao <jun.miao@intel.com>
Cc: dave.hansen@linux.intel.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH] x86/virt/tdx: accurately distinguishes TDX module
 loading situations
Message-ID: <2sejjb666z5rzxzinqtkvyh2q4726fgaq5cqvxi57xd6mqu2o7@ixhcmkmumxhr>
References: <20240622175037.2051612-1-jun.miao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240622175037.2051612-1-jun.miao@intel.com>

On Sun, Jun 23, 2024 at 01:50:37AM +0800, Jun Miao wrote:
> The first SEAMCALL is important to response the state of TDX Module/BIOS.
> 
> In actual incorrect BIOS setup or deployment, the sysinit_ret will be
> -EOPNOTSUPP. But the message "module not loaded" isn`t enough to describe
> the accurate loading situation when module loaded but SEAMCALL failed
> for some BIOS wrong setting. So add the error return operation code number.

Do you want to actually check for EOPNOTSUPP and print a
user-understandable message for it?

> Signed-off-by: Jun Miao <jun.miao@intel.com>
> ---
>  arch/x86/virt/vmx/tdx/tdx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 4e2b2e2ac9f9..787dfaf44036 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -122,10 +122,14 @@ static int try_init_module_global(void)
>  	/*
>  	 * The first SEAMCALL also detects the TDX module, thus
>  	 * it can fail due to the TDX module is not loaded.
> -	 * Dump message to let the user know.
> +	 * Dump more detailed message to let the user know.
>  	 */
>  	if (sysinit_ret == -ENODEV)
>  		pr_err("module not loaded\n");
> +	else if (sysinit_ret)
> +		pr_warn("module loaded error ret=%d\n",sysinit_ret);

s/loaded/load/

> +	else
> +		pr_info("module loaded\n");
>  
>  	sysinit_done = true;
>  out:
> -- 
> 2.32.0
> 

-- 
  Kiryl Shutse
  mau / Kirill A. Shutemov
