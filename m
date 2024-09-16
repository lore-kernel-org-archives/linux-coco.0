Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3113B7A6
	for <linux-coco@lists.linux.dev>; Mon, 16 Sep 2024 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476985; cv=none; b=TXTaYhjRzpy90DEvr37jI/zaHj+nhKa03bEA+G/POJlvgNkYlkiPRoBi1rjBqi/fJ2zjhs7ZdYQE5jGmHxI2HgeCF/cnzUKqWu8LLU1VBwqNsqS0/Zq3o9o5elrIAU0SYAHnuVp+v4Qrxxd06qOYTqFZPpUSsquknmG9fR79CMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476985; c=relaxed/simple;
	bh=TUIwnWG4s3LqEk+cyb0RoEVHTiTzOqOopkYyQx5CAY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgXiLNQOzpX0DsD/f4wOhUs0/eOIdjMizAOYmtdVa1F8ZY4ZJC3FDKHyW4vsDGZrevVjWchLDGHFcs1nsZJG9kal+8PSeYClG7mc66r8ii6I+eWgVIH/lXwy+ulOtKQNkantY23VKBBu6otShNIvlgpmfCbU/jddEFANoJ9OHT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiQcLshG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiQcLshG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726476984; x=1758012984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TUIwnWG4s3LqEk+cyb0RoEVHTiTzOqOopkYyQx5CAY4=;
  b=JiQcLshGv/aKsdIF43c0DfFLnayHkYqPuHqYu87Cl397qbAILnljIzUw
   O7vNPl9ASmPRtJVwnLphNZZPTQP20z37knNBCUpGJq7k0nihaVNTNVyFf
   WGH831BqFTnDPwmjvUrlz6/eWAz3jSHgnQyke1hDxvG1n91sgjhpbiQGH
   Dj1GlgSXBIKmH/kHq5EqqlQSj7uxldBSuRstAtqRrAanchCJkSCXikXDJ
   5t3p/2WQoe0YAt25wOaohhMBFGHck7KL2vBYT5BI/MTd5R2taxSVXasUz
   zKlEiH4uiN8z9JwPHFny8H1Lheno23GC/xWHpe7GPNfMCQqx17YtuG+Fr
   g==;
X-CSE-ConnectionGUID: 3VaV+0+LSnuGjl4F26z/dA==
X-CSE-MsgGUID: PrlHJp6hQ6GnO6hKK7n2yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42770649"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="42770649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 01:56:24 -0700
X-CSE-ConnectionGUID: NNTw4tTPR/+5R2KzSRYFWA==
X-CSE-MsgGUID: Nf2Tb+XjSu2OuUotL844iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="99489109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2024 01:56:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 1C80E481; Mon, 16 Sep 2024 11:56:20 +0300 (EEST)
Date: Mon, 16 Sep 2024 11:56:20 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, aik@amd.com, elena.reshetova@intel.com, 
	pgonda@google.com
Subject: Re: [PATCH 3/4] x86/tdx: Introduce guest global metadata retrieval
 infrastructure
Message-ID: <fg4oibulhylpceczrts2wt4d6cbvfwnyu2gnji63u3hx43eeks@ksdkcowisam3>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618717675.516322.6087817418162288917.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172618717675.516322.6087817418162288917.stgit@dwillia2-xfh.jf.intel.com>

On Thu, Sep 12, 2024 at 05:26:18PM -0700, Dan Williams wrote:
> Similar to the host side [1], build some macro helpers for retrieving
> global metadata fields.
> 
> This infrastructure is overkill if the guest only ends up consuming a
> few fields of metadata. Some of the overhead reduced later by
> refactoring the TDH_SYS_RD (host side) infrastructure to optionally
> support TDG_SYS_RD (guest side) as an alternate low-level transport.
> 
> If this moves forward, expect that it is rebased on the host side
> metadata patches to share infrastructure.

This patchset already introduces helper for TDG_VM_RD. The same can be
done for TDG_SYS_RD.

https://lore.kernel.org/all/20240828093505.2359947-1-kirill.shutemov@linux.intel.com/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
