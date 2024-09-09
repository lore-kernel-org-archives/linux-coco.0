Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C281B5806
	for <linux-coco@lists.linux.dev>; Mon,  9 Sep 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873573; cv=none; b=qZi1o/f8v+nOwuxTtWRfvtMDZoLMd/G9YkC3FAydSB+RZ/Sv5x/jxeUpnPO4UO86wZKWb5pRZvqN5BPl1xbQNXOyuGb7up5ZgxrZCC9WkK1gRRtiW6ORNwOJOdYsdbdL37zRbucuT1lsmKQVg2/CLmaIXDGexYiVX6D3R6J2VTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873573; c=relaxed/simple;
	bh=vBicCEn34wOQk+mxT1S9HSE+MwVayxQWhVfS2wuRQoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOQY+pBCOeCott5KVypGrBAgPRMg3a8k+j0LFMg/UA2u3RG4CxXyFCvmSjD9lR+a1CpCrX4hlG930AGg2lxaiYE1bXn7EmswbiPHEOHVGwBZripNx+6U8+MaMbjM00zIo2pUJBxNUjL0XWNxfyO/LcO6DXYUdb6ZbpRNWw/dZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9QhVcKk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9QhVcKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725873571; x=1757409571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vBicCEn34wOQk+mxT1S9HSE+MwVayxQWhVfS2wuRQoY=;
  b=h9QhVcKkUUWgq2oq+b8IQoO5zEhbwHBdvTjleTF5cKfYl7m83LNf+APo
   xwrivNvVbDOZRwnWtEoheJmyzJNMrsxqHPft1wo0DcCgH6Y5PFF1oFKFE
   QovAfKC4kXSph6wHBnpg/0CGumfKLVowPIs4Md9dspl2wFDedkYCnjfZ7
   Te0tqZMrSOSXaaK2lv33zS0I+E1piqf4ePC1bSMzY+z+4X71EWlFMsNtY
   DyowH74PTO5seX7pu6jQg5AfkTBzbYz+S/qndm338fxFJ+yZig9hVy8xc
   Ed5d+F3WthiEKjW3CGeSERU3da2ceQx7hijA2UnM9ZpyMqj6japu5RNwC
   A==;
X-CSE-ConnectionGUID: 4ag5IU0YQBOCxzHkAZ48/Q==
X-CSE-MsgGUID: CJrxP//wQtuEY5GpziOtwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24717029"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24717029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:19:23 -0700
X-CSE-ConnectionGUID: cvkWcm4WR729h0FwFTRqiQ==
X-CSE-MsgGUID: w3M1/NvXSfKQry4pHGACxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66846484"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 02:19:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 60847297; Mon, 09 Sep 2024 12:19:18 +0300 (EEST)
Date: Mon, 9 Sep 2024 12:19:18 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, 
	Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, cho@microsoft.com, 
	decui@microsoft.com, John.Starks@microsoft.com
Subject: Re: [PATCH v6 5/6] x86/tdx: Move MMIO helpers to common library
Message-ID: <hga6pbwtnx4wgbau5nqem7d5ypsv3swwxezdpok2fw2zqfbvxe@f4zsrbvymckf>
References: <cover.1724837158.git.legion@kernel.org>
 <cover.1725622408.git.legion@kernel.org>
 <24044dab4a665f6208c10d1cbce4b99f0fea8239.1725622408.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24044dab4a665f6208c10d1cbce4b99f0fea8239.1725622408.git.legion@kernel.org>

On Fri, Sep 06, 2024 at 01:50:03PM +0200, Alexey Gladkov wrote:
> From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> 
> AMD code has helpers that are used to emulate MOVS instructions. To be
> able to reuse this code in the MOVS implementation for intel, it is
> necessary to move them to a common location.
> 
> Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
