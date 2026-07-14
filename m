Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697D37E2F3
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027929; cv=none; b=K9PyOoGGhXY1XsMEjrMTBYNkqziWm4Q5PRcFjJMfEEfHXevhNdbaDcIBBFsvfjAsxJ09SZyElun5Rl9oty1eAFP7Ix96AeiB3xbOECRjw3VH8UI/qjxuFtXQrOyOVOMUX03KSYn2eMaeBK//hIsg5Z15RCQ3+5PoTL6Om8jf6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027929; c=relaxed/simple;
	bh=nwD+LLuYuY87RlJT62pZIUTdyPGrcFxfNw+o1aBmQzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPrC+H+gQGE2ZrZBN4qmhcKakGgEWDBJ4ep1zUlRYscDa5TO4UFWY/TAS7gl/FxydaH83uBiHHPU+CZZLPA0DOjOvsDVup0ou76LyT4DYtn8iJbr3qG1NZFcLmGXIoxuL3LPb/p5W9yoteh+B6A5Ev+cOxG1VzX2RpTq7Xiiyww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLNtGw78; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLNtGw78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784027928; x=1815563928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nwD+LLuYuY87RlJT62pZIUTdyPGrcFxfNw+o1aBmQzM=;
  b=PLNtGw78jireHfphiAF69BVvrjMHk+5U+YOBe/PnuPWXPlAuZEKZZdbx
   MB6toJCdmK2NpEmeHbMgwHSOPf97LSopf7SPCn8hUUsNxxdyhYcJDjRh1
   y8O/tl7+JsvbEgzCslAQCiX0uNB2m33YI/MkzxyRi/uw6EyZnhtDxt6Em
   CsQ1zNEzMW9iEmiFKmKy3AubBBtLGFG3WFzU6e5t3emYIHQuJfL5EsNkT
   df3QFoNaVqb1acCSm8fySII1uVmWV+A2y/e2pvEO/WUENCPp/rZ94tyH9
   2Wlse/CcFStB1qixdDco2MLqG2ISw8OY9b1MamLlVYHzt7VFwALQzhUNZ
   g==;
X-CSE-ConnectionGUID: aSQIqNRaRSCLPUnEFGbPIA==
X-CSE-MsgGUID: Hq7WWYEmTFusvyu/k7D1FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84742293"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84742293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:18:41 -0700
X-CSE-ConnectionGUID: vMZUPnpFQB2zgo+ZDy8wnA==
X-CSE-MsgGUID: ip0GhzOqQh6D3lMPGTbqJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="249477791"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2026 04:18:38 -0700
Date: Tue, 14 Jul 2026 19:18:37 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
	djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com,
	xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alYbDcnzl2dUPEJ5@yilunxu-OptiPlex-7050>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <alEUAMgx7HMegOmX@thinkstation>
 <alSt/TgbDQgNveoS@yilunxu-OptiPlex-7050>
 <alTMhIWnRgrqatUK@thinkstation>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTMhIWnRgrqatUK@thinkstation>

On Mon, Jul 13, 2026 at 12:38:02PM +0100, Kiryl Shutsemau wrote:
> On Mon, Jul 13, 2026 at 05:21:01PM +0800, Xu Yilun wrote:
> > > The commit message covers the mechanics, but is silent on compatibility
> > > with older TDX modules. That context matters for the design choice, so
> > > regardless of where the implementation discussion lands, I think it
> > > needs to be spelled out here.
> > > 
> > > Who is responsible for picking a version the module supports?
> > > 
> > > TDH.VP.INIT can hardcode version 1 only because KVM already refuses to
> > > enable TDX on modules without TOPOLOGY_ENUM.
> > > 
> > > The TDH.SYS.UPDATE user from [1] is the opposite case: it has to pick
> > > version 0 or 1 at runtime depending on whether add-on features are
> > > configured, to keep working on modules that don't support them.
> > > 
> > > The second point is the actual argument for a version field in struct
> > > tdx_module_args rather than encoding the version in the leaf defines:
> > > the version is not always a compile-time property of the call site.
> > 
> > That's good point. I'll add the TDX module compatibility argument in
> > changelog:
> > 
> >   One concern is the compatibility with older TDX modules which don't
> >   recognize the new SEAMCALLs. The kernel should decide which SEAMCALL
> >   version to use at runtime, selecting the minimum version number for the
> >   required functionality. It can't overwrite the function number with a
> >   new value at compile time.
> 
> There are two policies, not one: make the new version a hard
> requirement at init time as we did with TDH.VP.INIT, or fall back to
> version 0 at runtime like your TDH.SYS.UPDATE user does. Both are valid,
> and the changelog should not claim runtime selection is the rule.

Maybe we don't need 2 policies. This first policy is only helpful if we
don't keep version history at all, we always update to the newest (from
Linux POV) version and forget about old module compatibility.

Otherwise, we use the 2nd policy. Vx as the first version accepted by Linux,
Vy as the latest version accepted by Linux. We should maintain
module compatibility between [Vy, Vx]. TDH.VP.INIT has only V1
because the accepted version range is [V1, V1]. If there is a case in
future that requires TDH.VP.INIT v2, then it changes to [V1, V2].

TDH.SYS.UPDATE V0 is the first accepted version, so it will be [V0, V1].

I don't think we have to use different policies for each SEAMCALL,
1st policy is simple but I see problem - the newest module is not always
available. 2nd policy has better compatibility. Now I sort of like 2nd
policy - the runtime selection.

> 
> BTW, we might eventually switch TDH.SYS.UPDATE to hardcoded v1 once we
> stop caring about older modules.

Maybe we don't have to. If we want compatibility, I don't see immediate
benifit to shrink the compatibility.

[...]

> 
> > > Without TDH.SYS.UPDATE context, the patch seems pointless.
> > 
> > mm.. It's true one target is to address the compatibility with old
> > module. But is the other concern valid?
> > 
> >   Another concern is the obscure usage of the 'fn' parameter for seamcall
> >   wrappers. An existing caller for TDH.VP.INIT packs the version into the
> >   'fn' to match the low-level TDX ABI RAX layout. The RAX layout
> >   interprets some bits differently, such as INTERRUPT_MODE, SEAMLDR flag,
> >   which are not a good fit for the function number definition.
> > 
> > Is this a blocker for you as an independent cleanup patch?
> 
> Not a blocker. But respinning now seems premature: the shape of v3
> depends entirely on where the RAX composition discussion lands --
> args.version with FIELD_MODIFY(), a version macro in 'fn', or Dave's
> rax-in-the-struct. I'd wait for that to settle first.

Thanks for clarification.
