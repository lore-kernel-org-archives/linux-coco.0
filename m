Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2F38BF9A
	for <linux-coco@lists.linux.dev>; Mon,  8 Jun 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915033; cv=none; b=sqaHgZox1Jkq1+PVA8XKLvBIndwWJvt0J4JdGmHZxgALYcpgOMJn08aJef0u7fUvxfcWlgxZztNkxo0+LgVXD6NS5ocPlGqMPOLW8rYjuzhbvSUG49XaAjk0HcHtm+qZBmh1CLgNU0vgnDSFQotJR5GyVYETr6GT9tMAwjCtYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915033; c=relaxed/simple;
	bh=2FThFKxYs4bzxGqjzsQzOD6fyC3fuZhlK+6psg6h0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzJsXUt0SpSbnUpDlFyt6MNWBaIZ0Ioo6mw/fE1OXNMJoWHmiYtrL6uT9qqAdnb+Ap+MLB8E6cJ1AsJBRBKy6FfDt0El8n/pvWLUuOC+GS3t4wZIgaVujiIAJHEhCbKEXjoNOFT+J+T81THtRbjG9cJwQcxM7ov8U1LJbHfCobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPokVi0w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPokVi0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780915030; x=1812451030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2FThFKxYs4bzxGqjzsQzOD6fyC3fuZhlK+6psg6h0vc=;
  b=TPokVi0wv8z85tYz181RnLruu7HqQ7HSgbpmkaU1zvB7QmI+41tSMFKN
   2gl9NvptVCyYgJgX3jMISLrKAbi6sRO93xV20OeOP83Xp8pSiWZGIU2TO
   NVKad1wv5L+ZkF/MMzfAK9zwUL7EI0xSMZP8VsJgLewKtdVpUZrkBRO7x
   TK+iozKpIElSfpRkmHHOaim8R4M/ynT9LBxXGNv6v1PXPpqtDYqAthKxr
   mcpROL53XgosuW1raYpO7lJGxzXV2f5Z8xYo3boPa4nQz1Piyq//qQ3F5
   aO84totQE1qF/LEZvyUweitvJaFgz0Ql55i5FbFeAjIbPeEh1dcK0MvWx
   g==;
X-CSE-ConnectionGUID: Oid+r5TBS9GQE1Vio9Ii2g==
X-CSE-MsgGUID: a1mzezcxQ6eRibJbPz8YRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="99230360"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="99230360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:37:10 -0700
X-CSE-ConnectionGUID: GjsIbh1DRv+INMaLSd1MDA==
X-CSE-MsgGUID: UBHN8JTwS6qLqA9D5Kgiwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="243061766"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2026 03:37:06 -0700
Date: Mon, 8 Jun 2026 18:12:35 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kishen Maloor <kishen.maloor@intel.com>
Cc: kas@kernel.org, djbw@kernel.org, rick.p.edgecombe@intel.com,
	x86@kernel.org, peter.fang@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	sohil.mehta@intel.com, yilun.xu@intel.com, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH 04/15] x86/virt/tdx: Enable the Extensions right after
 basic TDX Module init
Message-ID: <aiaVk9Lx7iakgd4g@yilunxu-OptiPlex-7050>
References: <20260522034128.3144354-1-yilun.xu@linux.intel.com>
 <20260522034128.3144354-5-yilun.xu@linux.intel.com>
 <f8b7aea2-228c-4e51-b79e-094da656f4c9@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8b7aea2-228c-4e51-b79e-094da656f4c9@intel.com>

> > +static __init int init_tdx_ext(void)
> >   {
> >   	int ret;
> > @@ -1373,6 +1373,10 @@ static __init int init_tdx_module(void)
> >   	if (ret)
> >   		goto err_reset_pamts;
> > +	ret = init_tdx_ext();
> > +	if (ret)
> > +		goto err_reset_pamts;
> 
> Is it a reasonable policy to fail TDX bringup entirely upon failing
> initialization of extensions (which are "add-on features")?

mm.. I think TDX Extension is not strictly an add-on feature from OS
POV. It is still a fundamental TDX infrastructure. Host should not
look into the Module and create substates like Base-good-Extension-bad or
both-good. There are some considerations:

 - Extension cannot be explicitly configured by TDH.SYS.CONFIG, it is
   implicitly configured by TDX Module if an add-on feature requires it.

 - There is no enumeration of which SEAMCALLs are Extension-SEAMCALLs so
   Base-good-Extension-bad actually brings more chaos later.

So the series is making all effort to make TDX bringup a stateless
process, no intermediate state.

> 
> The handling of tdx_quote_init() in Patch 6 suggests a more
> best-effort approach.

TDX Quoting is however a clear self-contained add-on feature from OS POV.
Though I'm not sure if a TDX platform is still a safe TCB with DICE
available but failed, and good for "best-effort" policy? Maybe Peter
could answer.
> 
