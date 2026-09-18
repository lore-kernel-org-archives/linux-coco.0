Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416B4B95B4
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726016; cv=none; b=rbvC/pLZ0N71YGRCjQH7FUMP60UtTkxlGDZWqQlOOwmA8F7fZFlKtR/ViffLxV1xD/+DEhOt4Xp6Fkrihe/G5XVFeJmX1zLrSXa7UB9OcrqLw213QE5aTNLGVPHldpHaV9Ql+PDHaKP+bTzuVDY04OjJcdhj/ehy/RIaeR72eag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726016; c=relaxed/simple;
	bh=6WLjZbRvmVl2N7vLY5y93GfaimnjwySfhvh7VSdofr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9bV4poshltg28fWH6zghE9vQ84JGkCx+LQ0BLKfCD7WvbMSr97VC1YT5LG6Qjsgld16sGHNDN8hJOefAi3nAowcyPSEPslnE0B+twM8pYmG0EDJiX17st89kmp1OP3/oxxUh3qOPA5wW6UknM8PQSNDRkuYoNe5yzoeGikvH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAZT6TnS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAZT6TnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789726013; x=1821262013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6WLjZbRvmVl2N7vLY5y93GfaimnjwySfhvh7VSdofr4=;
  b=YAZT6TnSOUpKcN4jTVCMk6UVEEKI3vAV26YMHb8k6ObJl9F/ajpppv0f
   N69MFuBocMbL1mtsM/W5EqpudHuNZ76HnQF8X+bwiU0p1H3Udj3OGY5vp
   XiHmzdeP9WLv8/ZVxV+4W6r2gN4EAtuL3SYFRRMWXXr2bhF7CkSVX0JP/
   a8i1CB2nwGgV5RuU25YkRVuNjUc6t/F0h8dq+VvbCQQeocR9NideOm2cx
   3izs/DAqrHKKloLWtkEphBL7UKok4r4SY234UgjlMnP/IBpxFcu8u2nB2
   kpzT+7hofMxV6SlCr7E0Ja9mxxKhQYtlRkhjz2VMX9K0pM1xb63dNOmEf
   w==;
X-CSE-ConnectionGUID: HUxv8z8yS+q1ax5AjOBwJQ==
X-CSE-MsgGUID: RrBNos3NThG/fGUElS1E6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100883809"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100883809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:06:50 -0700
X-CSE-ConnectionGUID: cmSHFzgdSPqfvvvpE1kjuw==
X-CSE-MsgGUID: MFCrC+yGSf28levtRRmoAA==
X-ExtLoop1: 1
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa003.fm.intel.com with ESMTP; 18 Sep 2026 03:06:46 -0700
Date: Fri, 18 Sep 2026 18:06:23 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	xiaoyao.li@intel.com, sohil.mehta@intel.com,
	adrian.hunter@intel.com, kishen.maloor@intel.com,
	tony.lindgren@linux.intel.com, peter.fang@intel.com,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	artem.bityutskiy@linux.intel.com, kvm@vger.kernel.org,
	nik.borisov@suse.com
Subject: Re: [PATCH v2 4/5] x86/virt/tdx: Add extra memory to TDX module for
 the extensions
Message-ID: <aq0NH9jL/MIXpgIv@yilunxu-OptiPlex-7050>
References: <20260915102658.713079-1-yilun.xu@linux.intel.com>
 <20260915102658.713079-5-yilun.xu@linux.intel.com>
 <aqpIAxQ6C71bEqFm@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpIAxQ6C71bEqFm@intel.com>

On Wed, Sep 16, 2026 at 03:40:51PM +0800, Chao Gao wrote:
> >+static __init int tdx_ext_mem_setup(void)
> >+{
> >+	unsigned int required_pages = tdx_sysinfo.ext.memory_pool_required_pages;
> >+	struct tdx_hpa_list *hpa_list;
> >+	unsigned int added_pages;
> >+	struct page *page;
> >+	int ret;
> >+
> >+	/*
> >+	 * TDX module uses the metadata memory_pool_required_pages to indicate
> >+	 * how much memory is still needed. This value decreases each time
> >+	 * memory is added via TDH.EXT.MEM.ADD.
> >+	 *
> >+	 * On first time initialization, a value of 0 before any memory is
> >+	 * added is unusual. But host makes no assumptions. Skip the memory
> >+	 * setup and let subsequent steps catch any actual errors.
> >+	 */
> 
> The fact that the value decreases on each TDH.EXT.MEM.ADD is not relevant
> here.
> 
> Also, calling 0 "unusual" does not help the reader. It is either a valid
> value the kernel needs to handle, or an invalid one the kernel can assert
> on.
> 
> How about:
> 	
> 	/*
> 	 * The TDX module may require no memory at all. Skip the memory
> 	 * setup in that case.
> 	 */

Since we will drop ext_required check, I've found a reason why no memory
is required.

	/*
	 * Skip the memory setup if no memory is required. This may happen when
	 * no add-on features requiring TDX module extensions are configured
	 * via TDH.SYS.CONFIG.
	 */

> 
> >+	if (!required_pages)
> >+		return 0;
