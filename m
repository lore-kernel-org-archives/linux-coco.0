Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C0420E74
	for <linux-coco@lists.linux.dev>; Tue,  7 Jul 2026 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439144; cv=none; b=lPSrYBvoge5b3VA9uMLmLsDhTWehljb/4QapnMzP3L+PSQd4jNzqkJPa/ulxf3aY4WENelcluQJSaG63ptVVu31D/6OxnGQNH1/+GskHj0Ne6EUGSLl9fpvZcr92dp/4d3uKM0g8YAqPQwPiRgrL87nr235xODz0TWnW1a00IaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439144; c=relaxed/simple;
	bh=OLF4hmmf+Tc3sRZQ1Zn/zpMeXWlzqueZGfFai3lxUS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax7aq3C+QU3+NeAqJeKEigAAahNrziS6IIw2a18+gstc2SWaY24rqlHtn+9cetptHkGrYVPu0Kk8Oa3uuzZY8vRpk3z8ZdLhvQZ50cCNvzfRPguQf4ZO8IO8R6w8PVZaL8ntpEAN8Sd4KtuCFBBm2TQ8wxVAG5IamtwjP3Lt0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPNhNj0W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPNhNj0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783439140; x=1814975140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLF4hmmf+Tc3sRZQ1Zn/zpMeXWlzqueZGfFai3lxUS4=;
  b=KPNhNj0WUbQ38ZoWvszKKCuB89LNsqZMCtIICFiDiBBmwxX9xFXA3TaL
   3r/qRRf4/ag6oJspZZ7/JvOS02Xaxxufze/+UTDUQFTBjh6q7U/93qzm7
   z5EUQoy6LTVksaJu7F7AQMtUvhYC/H/CSoqN+T4li/fZAmhNkLm47bj1L
   1qFBimoiCGZXdifiu6FCRCDALKxxfWYDdIsrggFtYa8RmatQCuAqxm2+L
   gYPzfhc3WJQqTBrOaTUjp2iW0VI01UrkxWX06tMW4aFRqKqa7ubH9Br4t
   kXafVaWxxAQHWwod3BXcu+kskP7YKLUZ5vuZ74yiF28qspwgBrozIQkv7
   A==;
X-CSE-ConnectionGUID: i8P6qLq4Qq66aEdg5ABgug==
X-CSE-MsgGUID: Vj8uCAaxTYeCaCck2HJ7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83066441"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83066441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:45:37 -0700
X-CSE-ConnectionGUID: MQL0LnQXR1id52jn/IouIg==
X-CSE-MsgGUID: WiASptY7QHKl5InA4nxNwA==
X-ExtLoop1: 1
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2026 08:45:35 -0700
Date: Tue, 7 Jul 2026 23:45:33 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
	djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com
Subject: Re: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding support
Message-ID: <ak0fHVtxjC6bXQZY@yilunxu-OptiPlex-7050>
References: <20260702144614.59464-1-yilun.xu@linux.intel.com>
 <ede965a3-0fd6-46b4-906d-716bce163036@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ede965a3-0fd6-46b4-906d-716bce163036@intel.com>

On Fri, Jul 03, 2026 at 08:00:38AM +0800, Xiaoyao Li wrote:
> On 7/2/2026 10:46 PM, Xu Yilun wrote:
> > +/*
> > + * SEAMCALL leaf:
> > + *
> > + * Bit 15:0	Leaf number
> > + * Bit 23:16	Version number
> > + */
> > +#define SEAMCALL_VERSION_MASK		GENMASK_U64(23, 16)
> > +
> > +static __always_inline u64 __seamcall_encode_fn(sc_func_t func, u64 fn,
> > +						struct tdx_module_args *args)
> > +{
> > +	FIELD_MODIFY(SEAMCALL_VERSION_MASK, &fn, args->version);
> > +
> > +	return func(fn, args);
> > +}
> > +
> >   static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >   						  struct tdx_module_args *args)
> >   {
> > @@ -39,7 +56,7 @@ static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >   	 */
> >   	this_cpu_write(cache_state_incoherent, true);
> > -	return func(fn, args);
> > +	return __seamcall_encode_fn(func, fn, args);
> >   }
> 
> Can we drop the new wrapper? I don't see why we need it. The wrapper makes
> the code harder to read.

OK, will call FIELD_MODIFY() directly in __seamcall_dirty_cache()
> 
> 
