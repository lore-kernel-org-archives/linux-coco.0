Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA432F39AB
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934469; cv=none; b=nlvkeAif3RD37CeC9h8Fu2UweynqtrUa7eD76m1BEEfysxTB/I/Vn47vP0FI1DHE3aAkB48Ws63PiQl4Pb/AK/VqYvtGKXPHhX3QFP8W3K4uOpGI5UfeOj7aATrlS5no/ncffJApLB00H4GPooYjYUCw5Pcm05W/w92Drzb1v/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934469; c=relaxed/simple;
	bh=Ja2MGyu39t8tNbIWTPssFyskeFiJB+817EP0VcH/qbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0XzEytljac7TEitsUmScxjLOad/1VZ2nYDt0tc6AgqtVJIya/UdXFoTZQlkuCTDkf9Mwb/mHcRg7AZWp50elNbomU7LarYM1RQ+bQoWPVUtIzKElxrSmAfLclHicTIyG1gAvyTOR4vee5LryA21roOw/GbpjGAgZGG2lhYozbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ez3mZ1sG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ez3mZ1sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783934466; x=1815470466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ja2MGyu39t8tNbIWTPssFyskeFiJB+817EP0VcH/qbI=;
  b=ez3mZ1sGI4LC1ZFX7n4yJzILDtpcYvK86lpKGwiGG1hLVCmAm4FRRYhb
   BuQpVrQ1uCTp4mJnbTzQ0v0c+cOMliqHECOrJEeVCrG9wpVNjboPPzJYx
   Ut3hNvVY5f/JOrX1G1q3fU+AQIHfLcL4ZZNcCLUT69uf2rvNJt6YD1cVZ
   ghZsajZvBJdkVWSayNo2lFJ1/6sPUZyZwW1cMSnDV8m0lLrL1kgQ7d9A3
   vK90w+vdscIqcICEKToKupmkcVqqQFhYU8SpmEppO/WEQYSco+mmQmNbf
   UGzHYJSSNRlrP5m4ERaWdxXDlkOdLt+eCXqwdzz7JLofIzD9p1Bp8shbB
   A==;
X-CSE-ConnectionGUID: qa+Q0ZjkQweIRbwaEM66DA==
X-CSE-MsgGUID: KmeYs8ZJQtSXaTSyWLG+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95685996"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95685996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:21:05 -0700
X-CSE-ConnectionGUID: 53kyV0mFT0qo55rLcElrBA==
X-CSE-MsgGUID: QadwLEFjTmGoim6+PXimRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254372468"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2026 02:21:03 -0700
Date: Mon, 13 Jul 2026 17:21:01 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
	djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com,
	xiaoyao.li@intel.com
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <alSt/TgbDQgNveoS@yilunxu-OptiPlex-7050>
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <alEUAMgx7HMegOmX@thinkstation>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEUAMgx7HMegOmX@thinkstation>

> The commit message covers the mechanics, but is silent on compatibility
> with older TDX modules. That context matters for the design choice, so
> regardless of where the implementation discussion lands, I think it
> needs to be spelled out here.
> 
> Who is responsible for picking a version the module supports?
> 
> TDH.VP.INIT can hardcode version 1 only because KVM already refuses to
> enable TDX on modules without TOPOLOGY_ENUM.
> 
> The TDH.SYS.UPDATE user from [1] is the opposite case: it has to pick
> version 0 or 1 at runtime depending on whether add-on features are
> configured, to keep working on modules that don't support them.
> 
> The second point is the actual argument for a version field in struct
> tdx_module_args rather than encoding the version in the leaf defines:
> the version is not always a compile-time property of the call site.

That's good point. I'll add the TDX module compatibility argument in
changelog:

  One concern is the compatibility with older TDX modules which don't
  recognize the new SEAMCALLs. The kernel should decide which SEAMCALL
  version to use at runtime, selecting the minimum version number for the
  required functionality. It can't overwrite the function number with a
  new value at compile time.

> 
> Without TDH.SYS.UPDATE context, the patch seems pointless.

mm.. It's true one target is to address the compatibility with old
module. But is the other concern valid?

  Another concern is the obscure usage of the 'fn' parameter for seamcall
  wrappers. An existing caller for TDH.VP.INIT packs the version into the
  'fn' to match the low-level TDX ABI RAX layout. The RAX layout
  interprets some bits differently, such as INTERRUPT_MODE, SEAMLDR flag,
  which are not a good fit for the function number definition.

Is this a blocker for you as an independent cleanup patch?

Thanks,
Yilun

> 
> > Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.com/ # [1]
