Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A052378C
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860632; cv=none; b=c1HXZxM99bXUPLTDN7b5h3nDyW4Ft3eqxiaMork/aAWkmFq+8CtLT7HZZvo+pMbJCYcRhCldqDvAAXfNvZNHNiBSyQcdk2s54Ax2y1MSmWi25rnYH1YcnKYyMN61tt5x5cxsxP0aG/BA/UfTr+LbygFoy5PBt7QmZOYbGcjKqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860632; c=relaxed/simple;
	bh=O/RU7XTNP0iwtgCnZcCsut02WHgg8KAIIJ0b3lZIwQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kErB6L2/uaCBSlXwYzLoESp/93lI/SSwz8y1N8G3ucboVi1XCsZBYgcpkb/Sz/9GBYMfER7FJyteMGoF+A+hIk1EZNWzGhdP4IQlt94LMJzHiVZreUVFC77UxoH5sEZWDMKDD9q36p+B6nN9oTnC5N6f9lqLdQqbZd2ZDgSeEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deyQbRX5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deyQbRX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788860631; x=1820396631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/RU7XTNP0iwtgCnZcCsut02WHgg8KAIIJ0b3lZIwQs=;
  b=deyQbRX5IB+9KTDbsEvWWyQSHbzUNfAQni85muOoa5Pu39wgb3ldW6ak
   7sRqSoEtaH1QCYqvXS30c6HHbvS5ThcWBh5dolsPTVBSefY7VMK8tBm8q
   juSlpDpLSiC6RKg/ZKRVyrljwKfuvfvsvnO+y5+nAjdsti4P44vPlPrih
   uLqEHwIrgoyIp1i18pgxXlS1hTE2WeDxrBSzdgrgk34x63EwvT7CB2+H6
   VI+denoHFY9XTYv/u97sI0ZiUOYb9bKZjle2opDpJdCutobFDGk7xsVby
   GgALKdLJoiJnHSA6vGT1sPKA1ku8tTDJwwDQ6jS2j9hhhAVA3nYP3ChcG
   A==;
X-CSE-ConnectionGUID: kJd5/hx4SwS4a6CXie/guw==
X-CSE-MsgGUID: d6/7AApERwqOlgd0Gs9wKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114797453"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114797453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:43:42 -0700
X-CSE-ConnectionGUID: GW81OCrSS3q00qRL3iFtvA==
X-CSE-MsgGUID: vs9FiQI+RX+B1xVqxPlyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="271459358"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2026 02:43:40 -0700
Date: Tue, 8 Sep 2026 17:43:39 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: dave.hansen@intel.com, dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, kas@kernel.org, nik.borisov@suse.com,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version
 encoding support
Message-ID: <ap/Yy0uNp+78/wjv@yilunxu-OptiPlex-7050>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
 <d2a198a8-cba9-4773-94b6-1513b8b718c5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a198a8-cba9-4773-94b6-1513b8b718c5@linux.intel.com>

On Tue, Sep 08, 2026 at 02:26:39PM +0800, Binbin Wu wrote:
> On 9/1/2026 6:54 PM, Xu Yilun wrote:
> > The TDX architecture includes a syscall-like ABI for OSes to communicate
> > with SEAM mode software. This ABI has the concept of a "leaf". Each leaf
> > is roughly analogous to a Linux syscall: it has a set of register
> > arguments and does one logical thing like adding a page of memory to a
> > VM or running a VM. The TDX architecture refers to this interface
> > function as a "SEAMCALL leaf".
> > 
> > Just like syscalls, the TDX architecture wants to evolve the ABI to
> > extend functionality while keeping compatibility. But unlike syscalls,
> > which do this by picking a totally new syscall number, the ABI encodes
> > the "version" number directly into the bits of a register argument. So
> > instead of openatN being whatever the next free number is, the SEAMCALL
> > leaf number and version number are encoded into certain bits in how the
> > RAX register is defined in the ABI.
> > 
> > In Linux, several seamcall*() wrappers have been introduced to invoke
> > SEAMCALL leafs. They all take a u64 "fn" argument for the leaf number
> > which eventually get set in the register. As above, the version number
> > lives in the same register as the leaf number. So callers that want to
> > select a specific version of the leaf, can jam it in the right place in
> > the register by passing it in the "fn" argument.
> 
> Do you think it's worth explaining how callers determine the versions
> supported by the TDX module,

Yeah I described this in v4 [1]. Generally it is "selecting the minimum
workable version number for the required functionality".

But I feel it distracts people from the problem this patch wants to
solve, so I removed it. This patch actually involves no runtime version
selection. The future change for TDH.SYS.CONFIG does. Better we add the
explaination in that patch?

[1]: https://lore.kernel.org/all/20260804085054.190847-1-yilun.xu@linux.intel.com/

> and what happens if the specified version
> is not supported by the TDX module?

I think it should not happen. This means the kernel is trying to enable a
functionality that the module doesn't support. Either there is a problem
on feature enumeration, or people are using a deprecated module. Anyway
don't runtime check if a SEAMCALL version is supported.

Thanks,
Yilun
