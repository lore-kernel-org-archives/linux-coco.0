Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5283E49D2
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646968; cv=none; b=u4Qk5nr42zwmxwkc5XJZcBk1OMqMemUODKdYdnhBZrcSbpxI2Trs0W9lKEchyfCTCPO5PeswTeoVtaIc92RShTgXcH/7smV4L67301sj02n1HqwpetUKq3SOY/lsncZaUo8wRr5de4JsT/2EqiGO/HKW5NMiUNofGfjIc+EryIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646968; c=relaxed/simple;
	bh=hH1bHUz7ZzmNl3w4J7aV1l+Cll8Y+az/2qxGUKWizng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV37wjXCb3uS3vMiYRxENg0RwkNW/MGH2PU0zo47WDP21hT2A2auAwgjP2GfdauYFmq7bfkDxZEPu3DSreJDKG0sbswhomgvqScqr74mecJotbMChzBodHQXWbY1j8hCSdbTgFQBxDmzhLCCarPI5WadtHbGF/gr2LiQ0GtjR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2YoWUlw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2YoWUlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787646966; x=1819182966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hH1bHUz7ZzmNl3w4J7aV1l+Cll8Y+az/2qxGUKWizng=;
  b=l2YoWUlwg3bpOeubxUPiiMdMtRlTo8vPmzocvF8Vi3GeSOCyGSaICq/a
   D4knVFtWKa2pnxqY/ewAk8DnuKUcLfxkSv9V3/ZcFvYGaPxtdeRPp8bZK
   EV1BwboxF/TuXlEhU/KwpJ/XAVTvrEYSvNoImf6Wp7b886mCxAqrDvZGo
   Fv/XI+Z3l8icZDc6HnzKBv2Rv39rcC1odZXPkVu+6pyTMC8vT0TUqY4oe
   6erJghUZGC5al92+L/kf+7B5yQALMrrmFyWdHMREeYCXeT0AtBNMVRiWr
   h/ZPnWdfpnPK+A2f/W/920eG6C5XCIeLhQDdN9cU3vEB6JJlHO7rjtxOI
   g==;
X-CSE-ConnectionGUID: bdEdN+n5S+ynY1FZOLmkeQ==
X-CSE-MsgGUID: KRASwZmtSSOBXab6aCUt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88029865"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88029865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:36:05 -0700
X-CSE-ConnectionGUID: g7NK5mjpTAug4nTANpVZjg==
X-CSE-MsgGUID: DKW6IBDUS4GK3dWzFRwoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263954802"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.230])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:35:59 -0700
Date: Tue, 25 Aug 2026 11:35:55 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	xiaoyao.li@intel.com, sohil.mehta@intel.com,
	adrian.hunter@intel.com, kishen.maloor@intel.com,
	peter.fang@intel.com, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, chao.gao@intel.com,
	artem.bityutskiy@linux.intel.com, kvm@vger.kernel.org
Subject: Re: [PATCH 6/6] x86/virt/tdx: Re-initialize the extensions on
 runtime TDX module update
Message-ID: <ao1T61FjnTQwa6qN@tlindgre-MOBL1>
References: <20260821032920.256225-1-yilun.xu@linux.intel.com>
 <20260821032920.256225-7-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821032920.256225-7-yilun.xu@linux.intel.com>

On Fri, Aug 21, 2026 at 11:29:20AM +0800, Xu Yilun wrote:
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1289,7 +1289,7 @@ static __init int tdx_ext_mem_setup(void)
>  	return ret;
>  }
>  
> -static __init int tdx_ext_init(void)
> +static int tdx_ext_init(void)
>  {
>  	struct tdx_module_args args = {};
>  	u64 ret;
> @@ -1332,6 +1332,19 @@ static __init int init_tdx_module_extensions(void)
>  	return tdx_ext_init();
>  }
>  
> +/*
> + * Don't update the extensions metadata, just follow the requirement originated
> + * during TDX module initialization. Let the extensions re-initialization fail
> + * if more memory is needed, or if ext_required is dropped after updates.
> + */
> +static int update_tdx_module_extensions(void)
> +{
> +	if (!tdx_sysinfo.ext.ext_required)
> +		return 0;
> +
> +	return tdx_ext_init();
> +}
> +
>  static __init int init_tdx_module(void)
>  {
>  	int ret;
> @@ -1532,6 +1545,10 @@ int tdx_module_run_update(void)
>  	 */
>  	WARN_ON_ONCE(ret);
>  
> +	ret = update_tdx_module_extensions();
> +	if (ret)
> +		return ret;
> +
>  	tdx_module_state.initialized = true;
>  	return 0;
>  }

How about use naming to follow the comments and patch $subject, maybe
use reinit_tdx_module_extensions() naming instead?

But now I'm wondering how come we need separate functions for init and
reinit of the extensions, would a bool flag for init be enough to signal
the reinit?
