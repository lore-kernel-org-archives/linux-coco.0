Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E3C13DBA0
	for <linux-coco@lists.linux.dev>; Fri,  6 Jun 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224840; cv=none; b=Z2986DdRtfM14w7RG5wIM23Jns3jldfVcWzrGgDBnXHN9/5XMKnK1wtrVZMQCkZQrr/Ap8zohD8zqQ2JRMZ2Unmud/nFqz1w1skTkCLYIIL93DqhxAKOFn0vFCTzs2cfd5GOnJPkjyrngQD9NMhq6Rk7G77RhJtB6qi2+GyrLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224840; c=relaxed/simple;
	bh=Ssjur6v5ZfsWvWethIVQ02vvKvhPdOyOY166FKsWMpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUigBfYm+XyDw8cg6KPbaCejKwYqo6DCZbe2H6j/+kyJkabnB5weUEXyJ3+s4QDUD2Ye2FxIG3Cnrho22y+SmcFUd8i9n9lDys79lfgnuGd/S6JjeUa970czdqMxlsF56qAiyI7+4GpK4xP7PIUsImkVK9zQQ+FeAmEMEc4In0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJGt90Zw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJGt90Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749224839; x=1780760839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ssjur6v5ZfsWvWethIVQ02vvKvhPdOyOY166FKsWMpA=;
  b=SJGt90ZwVmxfTcJMiJX8bfNXQEfOdyQCcQIHxWNDNaHEFlu+q7SAFRBK
   nDl6wacmfwr+YBLMeTQ+y4ntuw2pZuEaMK4pAYl+/ahjf7m5yQo93hXgG
   jQ0lBuMFtzNAK8LU1sCY9q3Gywh5iPgnL7ZCphCBet8oxa3b73HMp2Sre
   B59vZwYMUkAzn7/9PKp9QTbc4KY8BJbQmnMqW59FBXnvnJLKJnLVRduoV
   Lc/0Ufvd6Gj1ieJtQ8GX52QDyZ+DFvY9eB1afEcl6bSEYw19k6NdYjqhL
   8y4I/xoFR9Q019srbWITx2GFZTPBWZzo5GY6addSH0aaIZH1QD0e/dS4i
   g==;
X-CSE-ConnectionGUID: 7JQUJYQDRaqS81l8XuFAWQ==
X-CSE-MsgGUID: 5jdCllS2THOvx90SDOQ0LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51082667"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51082667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:47:15 -0700
X-CSE-ConnectionGUID: Cp2C8RRoQjyNz3n0NtV3vw==
X-CSE-MsgGUID: L1vfuxLbQzWacV9JsclMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="151115771"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2025 08:47:12 -0700
Date: Fri, 6 Jun 2025 23:40:30 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, gregkh@linuxfoundation.org,
	lukas@wunner.de, suzuki.poulose@arm.com, sameo@rivosinc.com,
	zhiw@nvidia.com
Subject: Re: [RFC PATCH 3/3] iommufd/tsm: Add tsm_bind/unbind iommufd ioctls
Message-ID: <aEML7kUPSibTaAYk@yilunxu-OptiPlex-7050>
References: <yq5a5xhj5yng.fsf@kernel.org>
 <20250529133757.462088-1-aneesh.kumar@kernel.org>
 <20250529133757.462088-3-aneesh.kumar@kernel.org>
 <aDsta4UX76GaExrO@yilunxu-OptiPlex-7050>
 <668b023e-d299-42e1-87fc-ec83c514374e@amd.com>
 <aD3clPC8QfL1/XYF@yilunxu-OptiPlex-7050>
 <c552a298-0dde-409d-9c2d-149b2e2389bf@amd.com>
 <20250604123747.GG5028@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604123747.GG5028@nvidia.com>

On Wed, Jun 04, 2025 at 09:37:47AM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 11:47:14AM +1000, Alexey Kardashevskiy wrote:
> 
> > If it is the case of killing QEMU - then there is no usespace and
> > then it is a matter of what fd is closed first - VFIO-PCI or
> > IOMMUFD, we could teach IOMMUFD to hold an VFIO-PCI fd to guarantee
> > the order. Thanks,
> 
> It is the other way around VFIO holds the iommufd and it always
> destroys first.
> 
> We are missing a bit where the vfio destruction of the idevice does
> not clean up the vdevice too.

Seems there is still problem, the suggested flow is:

1. VFIO fops release
2. vfio_pci_core_close_device()
3. vfio_df_iommufd_unbind()
4.   iommufd_device_unbind()
5.     iommufd_device_destroy()
6.       iommufd_vdevice_destroy() (not implemented)
7.         iommufd_vdevice_tsm_unbind()

In step 2, vfio pci does all cleanup, including invalidate MMIO.
In step 7 vdevice does tsm unbind, this is not correct. TSM unbind
should be done before invalidating MMIO.

TSM unbind should always the first thing to do to release lockdown,
then cleanup physical device configuration.

Thanks,
Yilun

> 
> Jason
