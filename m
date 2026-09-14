Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083C33A9E9
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361929; cv=none; b=lWYS00guPzDNihurSBQjRW2GMS/9aVmCrTYYhuCvj3N711bIh1IkhJrEC5G8Idylb2vwN+7ASTxWGXqoyjRvp3ttB5gSrxzAylB58m7l37HFaDnyzqNseu3Bgwds62q8IAmzmgmv3kk8ZmVnjXUOSFkVCREA7pw4E29LTuqujAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361929; c=relaxed/simple;
	bh=wIKDRymzQlNqiI3neHO05niMh3+n1GiNrKsaPpSmgGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb7NPEv1qxJ4nF+ZnVVcD+lcZwdv6HOwD4a2aR405FJheU4KaJ/ci1gI8CAjrQ07AQKK8ycAzJMlaCicv5bdqvWhtA6JHSLGBX0PkZBw7d50+xNMqF922i2aH4vFMcryYnseiJIVpeQEgsq+F93AMSX3xxu8felAFl/BCh/L5gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqJpFhe3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqJpFhe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789361928; x=1820897928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIKDRymzQlNqiI3neHO05niMh3+n1GiNrKsaPpSmgGw=;
  b=hqJpFhe3ZJrL/PFXu69FIO8bHYUdX2gIHtYIkQJPWakB6nu8fzD5fgkQ
   eyGTDj7xVpzMnrWYllEayoHjxMpxXNE4+sIMDkp+xLgrLdHRIuy5Rw5iV
   BRzMXLcDgxgxI6P9n4W7uNoC1RcfA/e5U0C6voHGGLgT/PdBoRgqtgQ4K
   cld4x/b/2ajh1DQLs1xyfV1ZY6T4JZCo6VrUziH5MxuXsX+ma7skLqi/q
   h+O1c+fsRmNP1ms80HT88OwQDppePXAPvbc3cMUd8tlHIaET7saR09wZw
   hAKupO68aupm6lCyub8FZbfiXCe97sdbcGl31zdTA4Q0dzTjgfQMW4+xS
   g==;
X-CSE-ConnectionGUID: dLmc/nqGQWu5boqgpvl8bA==
X-CSE-MsgGUID: d3IqK5WmTEitl0dIrT0F/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="77275645"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="77275645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:58:48 -0700
X-CSE-ConnectionGUID: j7uHzTY8T2OciiBrqqXJTw==
X-CSE-MsgGUID: YV+y0UKzTJmq4UPflVP7ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268246721"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2026 21:58:44 -0700
Date: Mon, 14 Sep 2026 12:58:44 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kishen Maloor <kishen.maloor@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, djbw@kernel.org,
	linux-coco@lists.linux.dev, chao.gao@intel.com,
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <aqd/BGL7MPGKVoqc@yilunxu-OptiPlex-7050>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
 <a9eb5e96-1e2f-4662-9863-61317c163800@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9eb5e96-1e2f-4662-9863-61317c163800@intel.com>

On Fri, Sep 11, 2026 at 12:58:58PM -0700, Kishen Maloor wrote:
> On 7/22/26 1:46 AM, Xu Yilun wrote:
> > ...
> > +/*
> > + * SEAMCALL leaf:
> > + *
> > + * Bit 15:0	Leaf number
> > + * Bit 23:16	Leaf ABI version number
> > + * Bit 24	Pending interrupts detection mode
> > + * Bit 63	1 for P-SEAMLDR leaf, 0 for TDX module leaf
> > + */
> > +#define SEAMCALL_LEAF_MASK		GENMASK_U64(15, 0)
> > +#define SEAMCALL_SEAMLDR_MASK		BIT_U64(63)
> > +
> >  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  						  struct tdx_module_args *args)
> >  {
> > +	/*
> > +	 * fn contains base leaf number for TDX module calls and P-SEAMLDR
> > +	 * calls. Other fields in SEAMCALL leaf like leaf ABI version number
> > +	 * are in struct tdx_module_args.
> > +	 */
> > +	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
> The changelog lists the SEAMLDR flag among the RAX fields that are not a good fit
> for the function number definition, but 'fn' still carries it. Why does 'version'

Yeah, it makes confusion. I deleted these words in v6 [1].

> get a field in struct tdx_module_args while the SEAMLDR flag stays in 'fn'?

Because SEAMLDR flag is now defined as a part of the leaf number for
SEAM loader calls, for example:

/* P-SEAMLDR SEAMCALL leaf function */
#define P_SEAMLDR_INFO			0x8000000000000000
#define P_SEAMLDR_INSTALL		0x8000000000000001

> 
> Otherwise, looks fine.
> 
> Reviewed-by: Kishen Maloor <kishen.maloor@intel.com>

I assume you are also good to the v6 and added your RB, please let me
know if you object.

[1]: https://lore.kernel.org/all/20260910104347.625378-1-yilun.xu@linux.intel.com/

Thanks,
Yilun
