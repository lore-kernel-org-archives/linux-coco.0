Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2E757EA
	for <linux-coco@lists.linux.dev>; Mon, 10 Nov 2025 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762749042; cv=none; b=vBetlb3sdWVIEtQ8/GSDr25uuWNgI32Wt8qyrqGXEKG2OiOQjotjL2QPaKuHozN5BbvJnmko+rccJ9EGBZ9vgJfbrjz0JdoQMUqC0FYWfPFuSXCeIKeGlyi8EHH40J2Iyt9TaM73gJNXkL8WnysVMJDSocusLcWxWMutevnt8qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762749042; c=relaxed/simple;
	bh=/MaK8XJpPj9MvaeY04XRTBctbl3/A0aTY2hauY/Dgw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzoQd1tplNdz9heafwsOTGc5bwL3ORKlU8W02opqfn1/dxjQ3Wz9SU2RB9NDcmD4Vgc7vMnb3ycVsqxtpJ0N1KYXAyR9faBG5mkEbOKym7PprvKFt5w4d8vkDP75bemrcmSOO45eqphzWOXV/ijCsFiJhU6cA1ALBAWhtRqmZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTrmmKJf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTrmmKJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762749040; x=1794285040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/MaK8XJpPj9MvaeY04XRTBctbl3/A0aTY2hauY/Dgw4=;
  b=jTrmmKJfyOZaywWkRqiqHrvctfzhmZCssFYsZYiJ5P6Ez44EmrrX7PIK
   W+hZ155so97z7+3+wT11eBzX7dZ0duO3dwesakzelM6rMpgYmTnG7Sm7C
   wn7y9PB3/VVTCLa9/XlkVI92LA4vIw93WfegS/bvg84WCSO7sHIPc5XrU
   +AAsNqT9x680jChUqf/HoOZGnPlmJgjwLvSb9QEAzSsD1i7IHm8SRVJCx
   kcJnZLoAeXPMXk5R/RAQXzUnHyLi/9mYef8I5rN+H/pqPiVwG6W7kn7UM
   phXNqQxR8OlAchqJwvsWc/vje7p/hiE6f/1yl0s2VoQSjazNo8QchpIMy
   w==;
X-CSE-ConnectionGUID: JWgdapCWRbCtc4fsYBrsDw==
X-CSE-MsgGUID: i5Bj37IAQxedjY0VM505RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75090720"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75090720"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 20:30:40 -0800
X-CSE-ConnectionGUID: phv2LWDmT3msgRtTHfJFRw==
X-CSE-MsgGUID: y13hwxISRsWhn3w+6x6PRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="225829214"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2025 20:30:38 -0800
Date: Mon, 10 Nov 2025 12:16:16 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org, aik@amd.com, aneesh.kumar@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v8 7/9] PCI/IDE: Add IDE establishment helpers
Message-ID: <aRFnEMYe9yCic5a3@yilunxu-OptiPlex-7050>
References: <20251031212902.2256310-1-dan.j.williams@intel.com>
 <20251031212902.2256310-8-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031212902.2256310-8-dan.j.williams@intel.com>

> +{
> +	if (!pci_is_pcie(pdev)) {
> +		pci_warn_once(pdev, "not a PCIe device\n");
> +		return NULL;
> +	}
> +
> +	switch (pci_pcie_type(pdev)) {
> +	case PCI_EXP_TYPE_ENDPOINT:
> +		if (pdev != ide->pdev) {
> +			pci_warn_once(pdev, "setup expected Endpoint: %s\n", pci_name(ide->pdev));
> +			return NULL;
> +		}
> +		return &ide->partner[PCI_IDE_EP];
> +	case PCI_EXP_TYPE_ROOT_PORT: {

No need the braces

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

> +		struct pci_dev *rp = pcie_find_root_port(ide->pdev);
> +
> +		if (pdev != rp) {
> +			pci_warn_once(pdev, "setup expected Root Port: %s\n",
> +				      pci_name(rp));
> +			return NULL;
> +		}
> +		return &ide->partner[PCI_IDE_RP];
> +	}
> +	default:
> +		pci_warn_once(pdev, "invalid device type\n");
> +		return NULL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(pci_ide_to_settings);
