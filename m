Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4322228C00D
	for <linux-coco@lists.linux.dev>; Mon, 10 Nov 2025 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747191; cv=none; b=M0qNCI3i/yFyjwc0f5w3+CwYVA1bXnYd2gRtq2RVHQBMYzf+5dBLTmh83/MJCAYt4PsnVJlInRVqFN9hDvCr0OeLALhABPkJy19+3ul2WWhNb/D0515kWvR2NbnJdeVlyrK5Kxw0N7BTvrD4W3sYysJ4B0Kl9fg28Ws2DjYk9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747191; c=relaxed/simple;
	bh=I0FjTHzU8X0vmig/FJeYke3iDTi4CGAfUw2yqwkABOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEMQo9GmGnwyftrebUIQWIpXD3EqFmRZfVRA9PMcRVh8gFJd5RIWVYH4UgSLcNPsesT/jSyIi73TMhCaYq14WI+mIxRdDy2aCgmFKE1PYRXqeNobKh/r5a9TRC3yfEa4Eydaha53+9RQApwshjPCNnuWSBwQ5J77EtztLNMVhD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgRQmmCq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgRQmmCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762747189; x=1794283189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I0FjTHzU8X0vmig/FJeYke3iDTi4CGAfUw2yqwkABOQ=;
  b=kgRQmmCqRcMwd1vWqqK4prIZCFBuYLIHN4rBWzi4NwHtIpPQ298tQflT
   wWk8jlMOqmCJZwVm2pnQSixb7t8p/d7lSnrvm3l2p2QWyuuSwN1z894OG
   Lg7FRPFOIu8Wq91T3d0N8cIQNUkuW3OhCMXh1UOxBu5+CUaYBgCXq0HEb
   83CqrtZLFnbu2ISHS5njyoMRCSvB+jBYm+PjtCamDI4uvL9PABsANMe9v
   ibv/0eFEYXmud6I+cCUQoXrvbeHHFLTu+L4LvJ2m7MCd+mr5d+3GEvsu+
   OtPTgH86W7g3tkhJQWjTjq0cb6cVjG1YYN/zgCl/bG4p6umK7DitwOTSD
   g==;
X-CSE-ConnectionGUID: qcbodIegS/+YIx1ouWj5GA==
X-CSE-MsgGUID: uZtggfQMSv+q4WEnuKgQ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64705082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64705082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 19:59:46 -0800
X-CSE-ConnectionGUID: ZwNJci3ZTIOtMRUDTP0I6w==
X-CSE-MsgGUID: +scLqliaR6O1mA8geYiCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="211972496"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2025 19:59:36 -0800
Date: Mon, 10 Nov 2025 11:45:15 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org, aik@amd.com, aneesh.kumar@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v8 5/9] PCI: Add PCIe Device 3 Extended Capability
 enumeration
Message-ID: <aRFfy8gQi6+JwLTQ@yilunxu-OptiPlex-7050>
References: <20251031212902.2256310-1-dan.j.williams@intel.com>
 <20251031212902.2256310-6-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031212902.2256310-6-dan.j.williams@intel.com>

On Fri, Oct 31, 2025 at 02:28:57PM -0700, Dan Williams wrote:
> PCIe r7.0 Section 7.7.9 Device 3 Extended Capability Structure, defines the
> canonical location for determining the Flit Mode of a device. This status
> is a dependency for PCIe IDE enabling. Add a new fm_enabled flag to 'struct
> pci_dev'.
> 
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Xu Yilun <yilun.xu@linux.intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
