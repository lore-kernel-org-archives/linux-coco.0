Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95E2EA732
	for <linux-coco@lists.linux.dev>; Fri, 24 Jul 2026 03:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784862862; cv=none; b=t9yzPshV/Yj0FtTA52vkkYt7TJ6lTgsPwd2HVMKlP1TwZSVKErQSsfTzVSsvAyvvhl3JGZe8UsZQDc5oiLfHzVqvknhHSzFBOBkfPJqE26H8BhjfO/aMX1M4hCT9RErAVv5XnU7uGFZNRxcjYD2Pl466y4K6mypXEuK468S1xmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784862862; c=relaxed/simple;
	bh=F1MObwdckSocmRkOpgDjTl0ker56GIcty0kxXebexvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4+yzBUeIJrfSPzs5EmZ1ATIzUvCJzUOt6hGbp8946wFWbK/tn6JtKx2u/oQseQE7DM8W1i0Y4lLbLhfvmHZk00q+zn2O/8W+E8uBIt0yllrI+Af2ZIkbjKl5rlcXyQdotWrui2jCTH+h4lpkyO54HiwukHpn6cN4BgLiRoeiHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYl8TOpa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYl8TOpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784862860; x=1816398860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F1MObwdckSocmRkOpgDjTl0ker56GIcty0kxXebexvk=;
  b=MYl8TOpa7hB8mHU9m1MnJmu3TcIFl3Tl3+buoSR9Ehlf3hvhhiYytH4v
   /ivNsePf4l0VC7Vz1rkp+n1kcjuAkYrinG0tsgYsFGYD7CdQ07betl88b
   jgzybrROSXWWPm7rRXzxH8cXL3g/JoLAOGqir184Jl6GY22dYRHjJKxLF
   IPmLbyMnxWQvTnz4ijrDejNSb8BtMjJzyllAqXVZHD3yQjgIiHsD/iWqg
   xF4zl2rLZGBXo/hQDh8ysyFujd/YJ7ntBQd4q1OOhyIYu9iZeSq2i3pwu
   5bAE3sQGK6jTOZ0NbvVsFX/8D57g4AVMG1Rc2KHa6fTNLw8VKU9adlsxM
   A==;
X-CSE-ConnectionGUID: yKCry5emTjmA6frJ4kEkGw==
X-CSE-MsgGUID: pebHhr9XQ+WgkZhEWD8U1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85542567"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="85542567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 20:14:20 -0700
X-CSE-ConnectionGUID: GYfXboLoSqel406aB/TRiw==
X-CSE-MsgGUID: 5BShvLq+TQyxrIvCY/ZMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="288563813"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa002.jf.intel.com with ESMTP; 23 Jul 2026 20:14:18 -0700
Date: Fri, 24 Jul 2026 11:14:16 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "Gao, Chao" <chao.gao@intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"djbw@kernel.org" <djbw@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Fang, Peter" <peter.fang@intel.com>
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <amLYiGOfYJEuYKkY@yilunxu-OptiPlex-7050>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
 <d3d33a22f57883f937f28919b96a5fdccdc080af.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d33a22f57883f937f28919b96a5fdccdc080af.camel@intel.com>

> >  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
> >  						  struct tdx_module_args *args)
> >  {
> > +	/*
> > +	 * fn contains base leaf number for TDX module calls and P-SEAMLDR
> > +	 * calls. Other fields in SEAMCALL leaf like leaf ABI version number
> > +	 * are in struct tdx_module_args.
> > +	 */
> > +	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
> > +
> 
> I guess this works because the __always_inline is enough for the compiler to
> trace fn to a compile time constant up the callchain. It seems somewhat compiler
> sensitive though. Did you convince yourself somehow that some compiler will not
> complain?

I see the previous talk [1][2], that existing __seamcall*() rely on the
direct call, though there is no guarantee. We accept the assumption
until there is compiler issue. So I think this doesn't add more problem.

[1] https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/
[2] 0b3bc018e86a ("x86/virt/tdx: Avoid indirect calls to TDX assembly function")
