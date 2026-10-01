Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BF47F3BE
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858447; cv=none; b=OYNFw9gSsJqnw24rji+bbVrhaR9cFBhVGTwPxpiQFeG8cOoxNX5d9ZNG2j961WJPYJ5n+kgGKbW7+jY1QztldZnJ/Vxe3dDwl2UjoNmFFTXCrPzxvYUP2xXqGT5Q4/7AcjKza1LotncB87GycymE3aMziSyEmXOZgMjMCwbiTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858447; c=relaxed/simple;
	bh=i/cKfZ50vNgGTATLuK2eCJ789uoCgVbuV5TIGIHKDD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgIGd5NDxGYwPuhKuENXg8YUyQYKDLE1BB3C9Lo64w/SaUmfZNf+CnDw3yDOb+HTAFTsv20JJrNpLRa9xWNf4rRmRJRrUR2hc75z/WRchBFva/If+9DJobFfQi0OXaR6rcrwL8eOAkBhDf35Hze7XXU4yMK7+dkx9nfGcv7VmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXQAZNih; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXQAZNih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858444; x=1822394444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/cKfZ50vNgGTATLuK2eCJ789uoCgVbuV5TIGIHKDD8=;
  b=dXQAZNihq4HsrKxH/IJFH1j5Y9e21rCf47L6oLf4Ec7erM8GIbMUmZvE
   9Ih/2nYGOz3R+l3yg2GLeNLRpYIgpCyagADCN6mo5QZl/FHEx8dvE/iIj
   ArMmW7W7/MlDeDtMIpaiR7qMDl/ZwFaCGOqtFBwrsuCRmlAtyzxwpZgKY
   Ju9sqJvUacLcVIZq1mHB2uI6PW7zTkSAxmZL8PyciYKnKGhWZreg/UwOh
   8mvkP3xNMSAg4kNZjM4N/YVK+9OYNl18c/mgo7ZJo00gvbXI1M9mFLG5I
   GLA/GpB32GyO3wwv0/r1vvzcsyVtXBkS7p4IcU1bGDFP2evMskxEO6d7N
   Q==;
X-CSE-ConnectionGUID: DkTskb4tR8ivZccPfEWNCg==
X-CSE-MsgGUID: Ls5BkKQbQtiGf1Y76MIXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90668586"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90668586"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:40:44 -0700
X-CSE-ConnectionGUID: lCHhsoJiRbiAAHLbFPeYGg==
X-CSE-MsgGUID: glVacqwTQkmjZLy9qoP1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="49356"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa011.fm.intel.com with ESMTP; 01 Oct 2026 05:40:39 -0700
Date: Thu, 1 Oct 2026 20:38:26 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
	aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
	pbonzini@redhat.com, chao.gao@intel.com, vishal.l.verma@intel.com,
	xiaoyao.li@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
Subject: Re: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Message-ID: <ar5UQg/Q4zePFSzb@yilunxu-OptiPlex-7050>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-2-zhenzhong.duan@intel.com>
 <ar2JlI0ApPCb_C2G@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar2JlI0ApPCb_C2G@intel.com>

On Wed, Sep 30, 2026 at 03:13:40PM -0700, Peter Fang wrote:
> On Thu, Sep 24, 2026 at 12:10:18PM +0800, Zhenzhong Duan wrote:
> > Export tdg_vm_rd() to allow the tdx-guest driver module to directly
> > read TD-scoped metadata fields from the Trust Domain Control Structure
> > (TDCS) via TDG.VM.RD TDCALL.
> > 
> > Since tdg_vm_rd() is read-only and cannot cause harm, exporting it
> > directly is simpler and more flexible. This allows the tdx-guest driver
> > to read any TDCS field it needs.
> > 
> > In a following patch, the tdx-guest driver will use tdg_vm_rd() to read
> > TDCS_CONFIG_FLAGS field directly.
> 
> Can this be a separate helper? I'm adding another helper for
> TDCS_QUOTE_MAX_SIZE [1]. I think maybe their patterns should stay consistent.
> 
> Yilun, any thoughts on this?

There was a helper in the series before this public RFC, but was then
dropped, something like:

int tdx_get_config_flags(u64 *flags)
{
	u64 sret;

	sret = tdg_vm_rd(TDCS_CONFIG_FLAGS, flags);
	if (sret)
		return -EIO;

	return 0;
}
EXPORT_SYMBOL_FOR_MODULES(tdx_get_config_flags, "tdx-guest");

The concern is how risky is the tdg_vm_rd() export, and how it impacts
the existing tdg_vm_rd() usage, and the tdh_mng_rd() export which reads
the same data set on host.

My initial concern about the cons of tdg_vm_rd() export are, the
SEAMCALL reads any TDCS fields, some of them are writable by tdg_vm_wr()
and there is no synchronization between them, so seems not a good kAPI.
Reducing the scope to read-only fields (e.g. TDCS_CONFIG_FLAGS) may be a
good start.

Now there are 2 cases in flight: tdx_get_max_quote_size() helper in DICE
and tdg_vm_rd() export here. Maybe we need more cases to see which is
better but anyway I agree we'd better stay consistent now.

> 
> Thanks,
> Peter
> 
> [1] https://lore.kernel.org/kvm/20260930103739.2851980-6-peter.fang@intel.com/
> 
> > 
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
