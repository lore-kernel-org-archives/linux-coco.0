Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5653BED44
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 06:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367949; cv=none; b=R++jM/397zAlghUfGxBxa/ao2IV4kKRGJMUj3kEe24s6XOW/zhLtlj+dL0lzY2g1AqkRglY0SLdE4AIFaivgNkxtrT3R+1TKhhwZj3T5dvIqubHiFLMQzEacbkPKC/wA/6y/w5xIeEiO0SWLTIRYT0vuFtC5JvH6VlkaOMqrRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367949; c=relaxed/simple;
	bh=46HaakOsu2a5v/nMnqwJfAOWcAaW45oVFT3sY67JCEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzt5A5YGfuar1Vce8ofoGStOyJWkPCYzxm9j9FdC2l9rlGadLzEv+QZKHy4c6DYRRU8fYIcOAJo4BAJDQg2mvbcHVXKdBT9bbQxxKkw6D8v9BxWfy98rwEzkj+Jd+7YyTL42UPR1MZRXR2ZA/oA32O6wAAUt8w1kLMJXluPDbm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNodaXuo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNodaXuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782367948; x=1813903948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46HaakOsu2a5v/nMnqwJfAOWcAaW45oVFT3sY67JCEQ=;
  b=FNodaXuoIVapcfJfN4k2fWlUUBCNnE2769+3Ixdl18qPCPqiW7iIiwpH
   RgWFs0tcAeUh+Wy7oL49sHaf5yDXjnFY7Hy5xhEBrITvE6b3qM3N5ZQy6
   otYLR6c5+zEEEK3SwFgPNHmGKjX+kOldNyVlnWNVPY/E+wiLqBtkWItKt
   2l8D9tJWFtf/UxvK0Cd2cohYyUGEMe3bwY5IQAPQEFMWBfha6lT7JiNJW
   JJQY8rokHIh3aBwH+WxoBcye69AtbUgNQJjty0n+Hw0wJJ7a7OihxR7kd
   IcvgRj/YpdLfjZkzjLnqzguK54zkn6gRtRbwFyXg49wV2Bp3oOzKep9P6
   g==;
X-CSE-ConnectionGUID: opktNRKGQpWjLS98VwcGAg==
X-CSE-MsgGUID: XpSnUqwiQymeuDAvY/k/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="87044661"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="87044661"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:12:27 -0700
X-CSE-ConnectionGUID: aniz/n/cQIWLjv+371yrnA==
X-CSE-MsgGUID: g+l1oEjgThyq9LpEFELeCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="252331229"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.64])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:12:23 -0700
Date: Thu, 25 Jun 2026 09:12:20 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, djbw@kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	xiaoyao.li@intel.com, sohil.mehta@intel.com,
	adrian.hunter@intel.com, kishen.maloor@intel.com,
	peter.fang@intel.com, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, seanjc@google.com
Subject: Re: [PATCH v2 12/17] x86/virt/tdx: Reinitialize the Quoting
 extension after TDX module update
Message-ID: <ajzGxIztV1pRlpvE@tlindgre-MOBL1>
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-13-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618081355.3253581-13-yilun.xu@linux.intel.com>

On Thu, Jun 18, 2026 at 04:13:50PM +0800, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> 
> Invoke TDH.QUOTE.INIT again after a runtime module update to trigger the
> necessary rekey procedure in the TDX module.
> 
> Keep the existing Quote buffer since memory allocation is not permitted
> during the update. Compatible TDX module updates must not increase the
> Quote buffer size, or an undersized buffer might cause Quote generation
> to fail. See [1] for module update details.
> 
> [1] Documentation/arch/x86/tdx.rst, Section "TDX module Runtime Update"

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
