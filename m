Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0833E7
	for <linux-coco@lists.linux.dev>; Sat,  8 Nov 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762617570; cv=none; b=cxONy+rw9UHcJDlm6x8vqHoxyfiAVpdkGXfVZ6qBZgSHY20O72MAOrOZ+n0ksNekICYj6+Dxi5Sy+96/ommQuiDCwKQvgADMoEKS4BbdcfCIzOUVNIHbiE/4w8IZx2HMPOZEle6APkySPxP3VooFu0gsSndEORQyGJj0bMmvV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762617570; c=relaxed/simple;
	bh=SWz6gu02dAtpWz/P4x1Pdt/Zmtr9UNLsVuK+uxaYo8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he+4EYZlEuKuR0U/kTAcxnzbx5uoR7Y+8UaowBbjg5WVsaIWWzpDIn1QcKI3b0s7aLg3qLMSj7HT11x6KNupQG7Wm/gQJ5fXrqTEajeZXJu8u3WCG96DaR8+JDl9xQVXXCoWxdTM6vfeXuuxRLt6eXO6jm2sD1CfuDmai3F4fRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB0oPqUg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB0oPqUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762617569; x=1794153569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SWz6gu02dAtpWz/P4x1Pdt/Zmtr9UNLsVuK+uxaYo8E=;
  b=cB0oPqUgvicAv21Xi/qwm5BnpIcNgyrneUgAOeVvuLEK3jkCWEo212uw
   yw401bMJAQ5scY9hKWe/unax62TJmClXO4cYI7Zn6BooGpLU7KOQkufB+
   0kEwl/9FSPadEF8v+zlTu0qiwXJNJ2Oz7ifyn/xZnDtIWJH1k5k2m2vtC
   vhQtLpmvh6qCNDkFij4xURjJE+sTPoMlidbTBLHbGzwdGkmCiu5xPkYp/
   ku9/n7/3y2uDz6ON+N2raWc/axAw8kTJ+7dsR/99LSKLO4IdbhbG/lztY
   qxDjvevHfT/Oa/HGT4bUHo71QFPy7JTKoWdMh7Eur9wpMDTK5CGPYlmd0
   g==;
X-CSE-ConnectionGUID: gbjQRdFzQ6GOme8QJ+1Fhg==
X-CSE-MsgGUID: i+vudgpGRSWNCjslkUztyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="75849413"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="75849413"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 07:59:28 -0800
X-CSE-ConnectionGUID: 9NqH486MSDuIM0JxyZtFcQ==
X-CSE-MsgGUID: LP7DwtGvQoyG4GswHFHnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="187601444"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2025 07:59:27 -0800
Date: Sat, 8 Nov 2025 23:45:09 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org, aik@amd.com, aneesh.kumar@kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 1/9] coco/tsm: Introduce a core device for TEE
 Security Managers
Message-ID: <aQ9lhQSB8t1VGZ8v@yilunxu-OptiPlex-7050>
References: <20251031212902.2256310-1-dan.j.williams@intel.com>
 <20251031212902.2256310-2-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031212902.2256310-2-dan.j.williams@intel.com>

On Fri, Oct 31, 2025 at 02:28:53PM -0700, Dan Williams wrote:
> A "TSM" is a platform component that provides an API for securely
> provisioning resources for a confidential guest (TVM) to consume. The
> name originates from the PCI specification for platform agent that
> carries out operations for PCIe TDISP (TEE Device Interface Security
> Protocol).
> 
> Instances of this core device are parented by a device representing the
> platform security function like CONFIG_CRYPTO_DEV_CCP or
> CONFIG_INTEL_TDX_HOST.
> 
> This device interface is a frontend to the aspects of a TSM and TEE I/O
> that are cross-architecture common. This includes mechanisms like
> enumerating available platform TEE I/O capabilities and provisioning
> connections between the platform TSM and device DSMs (Device Security
> Manager (TDISP)).
> 
> For now this is just the scaffolding for registering a TSM device sysfs
> interface.
> 
> Cc: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Co-developed-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Alexey Kardashevskiy <aik@amd.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
