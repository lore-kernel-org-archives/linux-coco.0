Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6D33291B
	for <linux-coco@lists.linux.dev>; Mon, 17 Nov 2025 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392407; cv=none; b=MnY2bi++9m7ycsVvhRmDpdWIcshckfyJsSNDFAyIxtEEUOLGjNg67+egV3H0oJdSu0nHOohlnYPDMWnMOFhebGiWtwJwOLdAPSt4DpI9MFo/6Gyel/aaBevna8ZgowfrXI82y7w2EBP95pBzrLZCW57KIA6TCGcgsyNhXBXYbeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392407; c=relaxed/simple;
	bh=OBvsF9gYOTJDqXss7CjhmAyEM0ox4oqYdV/ncbetlbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6FScxiCWBO3uxgX/fbDgyq8obVFvYZay1UGa+JhC1eYrCsAYt5nT1F0KgfXwlkakLXhI6YzjotNM7an089vyVyl5+oa33WWM2iDuQ9f6rdC5mGClGzNb3GI0xuGcRW2jLk1naxExK4bi1JZNU9czGr8tbJQ/1ps3UPhPLLwP4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COELKfPU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COELKfPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763392405; x=1794928405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBvsF9gYOTJDqXss7CjhmAyEM0ox4oqYdV/ncbetlbA=;
  b=COELKfPU+7cZScRGZD7Z64kKHLVp7EmAEcS1tIiA7KFZdrP1rDwwAsci
   iHJEFwYLFr1nS+/Jpyt5dd2tcc8TcNP3hsaITipxVC1rW4j9IV7EBHyPx
   9wdqgnuLZ4iVrzPXx2ERDwsbb2GyjzfLvslxu3l87AMM5E6K/4TVkOmnj
   uR/pJt8mh/n8xNrovFRGNaUjMSBEd7NiFgdDGz9EhBr7mVMGT/HiCXp1Q
   9pfTwWAGgc4OthQi/f70PQ9LwWQzR90dy2eg1on2E+KBO6RZ+xeVAARlg
   E0TI93y31TrGYP2vXQ1KO2nCecg25K7NWKdSgz4mg+ndzDhaaZIoolZPc
   A==;
X-CSE-ConnectionGUID: KT9cHpI2Q9i363HXHaWpUA==
X-CSE-MsgGUID: b68JLiZhQ6u/yvtYZxyBXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69014025"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="69014025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 07:13:24 -0800
X-CSE-ConnectionGUID: bBStdWu1R3mgedFTda+0DA==
X-CSE-MsgGUID: rw0Hy/rDSbGoH6t0WsFHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="189769969"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 07:13:22 -0800
Date: Mon, 17 Nov 2025 22:58:38 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	Jonathan.Cameron@huawei.com, Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>, Samuel Ortiz <sameo@rivosinc.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2 8/8] PCI/TSM: Add 'dsm' and 'bound' attributes for
 dependent functions
Message-ID: <aRs4HnWBzJuD4mVt@yilunxu-OptiPlex-7050>
References: <20251113021446.436830-1-dan.j.williams@intel.com>
 <20251113021446.436830-9-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113021446.436830-9-dan.j.williams@intel.com>

On Wed, Nov 12, 2025 at 06:14:46PM -0800, Dan Williams wrote:
> PCI/TSM sysfs for physical function 0 devices, i.e. the "DSM" (Device
> Security Manager), contains the 'connect' and 'disconnect' attributes.
> After a successful 'connect' operation the DSM, its dependent functions
> (SR-IOV virtual functions, non-zero multi-functions, or downstream
> endpoints of a switch DSM) are candidates for being transitioned into a
> TDISP (TEE Device Interface Security Protocol) operational state, via
> pci_tsm_bind(). At present sysfs is blind to which devices are capable of
> TDISP operation and it is ambiguous which functions are serviced by which
> DSMs.
> 
> Add a 'dsm' attribute to identify a function's DSM device, and add a
> 'bound' attribute to identify when a function has entered a TDISP
> operational state.
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Xu Yilun <yilun.xu@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

