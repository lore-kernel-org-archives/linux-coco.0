Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B433FE24
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151539; cv=none; b=egr/756Sd0apbW31uKRJhmlmVsW0kFYhKcn3GAuSNiyg9bcbn0Ytc8FZP8SqPEVMkFzIlHK0FBB4x8UCNorl/u/E1b6GMTOZItetJquJXKasnYs469x2oId7TQ92tXFthUAoSiqkr7zARNbJB5f9afrwXUCtcg3DPB8Ali0uvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151539; c=relaxed/simple;
	bh=Dmw/G5RIZvvD8ZHy/LT6s0YJpihvXwF2H5np16J6wwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQIjMUC9xcTJRvUxysmC5apK9bZ7DL/bElXGgL86Td9UcD+/DZqPr/JvMRXzmqCQRr/qRcA9uRMAgzhJS5lQlJZ5AHX7lz3NXRW1zZnAG3sO897NVitKUiPmYSu9mAuwdE1uWjHmdwWMT5UL6UnQybeawvhodXndXhanAzNIdKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMLdxHAd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMLdxHAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769151535; x=1800687535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dmw/G5RIZvvD8ZHy/LT6s0YJpihvXwF2H5np16J6wwQ=;
  b=RMLdxHAdkZR034k3YKmasR+5zSjwPXbxC1T7KmkT87zJRFVrOAC65Vhy
   omYcspCroZzTvtLtquAcKle6oa//VhacRBtT+Hdnw9QZGtQ34iUqRW5Xf
   GEZz53bl7h8ZX8TqFabz5gETookhiVDCA3Dkhon5xuGF9rA2RmH0gna3G
   yPWEPCpcGWyoAFkHq05ok2O9VUdQLyBd2MK3w+cW/EpMGHXIgbtmbqNNI
   R85N/USBxbeuAUWdtbgO2LDXl1cHgqkjUBN9+R+pVU5ecyaD8fbjvviLi
   G6+jh93iuMU52TCSSyCZ42QR7211s9p5K9Nx54ifoFYBeDTcJjrvC2lJM
   Q==;
X-CSE-ConnectionGUID: MEmiCxSZRVmAugTBoc2SCA==
X-CSE-MsgGUID: krHGELTcRKmXJMcwEuqWQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95875035"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="95875035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:58:53 -0800
X-CSE-ConnectionGUID: nP7xVJvxRouYz7yoGdPhqw==
X-CSE-MsgGUID: 88sA91CeQ5mE8JNuAtkEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206774794"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 22:58:51 -0800
Date: Fri, 23 Jan 2026 14:40:55 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: dan.j.williams@intel.com
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	yilun.xu@intel.com, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, linux-kernel@vger.kernel.org,
	yi1.lai@intel.com, helgaas@kernel.org
Subject: Re: [PATCH v2] PCI/IDE: Fix duplicate stream symlink names for TSM
 class devices
Message-ID: <aXMX98p1RMLwOEGe@yilunxu-OptiPlex-7050>
References: <20260105093516.2645397-1-yilun.xu@linux.intel.com>
 <6972c872acbb9_1d3310035@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6972c872acbb9_1d3310035@dwillia2-mobl4.notmuch>

> That is all a bit too much to do at this late date, so I think for
> v6.19-final just delete this ABI, and try again for v7.0.

I agree.

> 
> -- 8< --
> From 2d236b203ea155d16d3251bd0e3bf4eeab2fcf6b Mon Sep 17 00:00:00 2001
> From: Dan Williams <dan.j.williams@intel.com>
> Date: Thu, 22 Jan 2026 16:35:56 -0800
> Subject: [PATCH] Revert "PCI/TSM: Report active IDE streams"

Tested, no problem.
