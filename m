Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0947F2CD
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832910; cv=none; b=I2GIGcmFTBG0gJw+WBxBr2mhYV6SX3kIuPLyx6+jMDfQhizwK+8B5EPuQnqMO5sJD0HCIKdz8vhzoSDV02cJba8r/Yjf+aZrRuD+p+UdM7qMzeQAwoOlWpgh2PgRxlkcfJx0aH2WlBF8+XJixrNz6u6hZzQ0zzow697yrqeTQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832910; c=relaxed/simple;
	bh=6DwsFQ3xewZ6W6NJBGeZH/qAhtWLndOqe4ZccqIyQec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONua0Mo0gxWWh1azyiT4siO0pYW26vPOHym/ZQdxVC8odLILRp+/mgyh/uzMNpYe5lpsiNcsXEEy+xRjEljpYWqyfC9zO+G1SrteDjZKNCZiR+RIWP1YSZfg105cOXFUvhsC8JunQVVCX2/bMWNl/qJ70lgmGqetvX/Iw6c6ffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkpn6LVT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkpn6LVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791832908; x=1823368908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6DwsFQ3xewZ6W6NJBGeZH/qAhtWLndOqe4ZccqIyQec=;
  b=kkpn6LVTtunuZEgvXLzP3lTEsxujVwLvvWZTJBn63veurbrq/xNnTrHH
   9F/8owo+PVLDiXYdl7XLH8vCHzfkDyAu3+N2uvv5TratHDLO9MBZTOyjt
   mgIjFibta0pU/DXQkdFCOAzmOLdvNNQsD7L8esgPLbKpLd66sJFuXiaZa
   EFal6xf9vncGos3J++6L5t4MreTEtYyD3VKgx1sr/wfTh99TjIZUL4XEz
   jpCxEaYW1H8zgiQjcQCjc94O8nJJ7z1c89I3ShLdbMOe53n60UF+Lrruw
   Wh8SvnaO6ESCoUcdj2D7oT1Y1tiHErk3VFXGM0bgdL+8rYalZcLKkS1HX
   A==;
X-CSE-ConnectionGUID: QP3uXFx4Qc6AwOKM9nvJ2Q==
X-CSE-MsgGUID: HvNf0oRYTaK8DO9vmeo3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="657294"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="657294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:21:48 -0700
X-CSE-ConnectionGUID: txnXQ4HYSPyd0XLg+xqFJw==
X-CSE-MsgGUID: ixB9ow7+TM+7U4MIpIbK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="889273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:21:44 -0700
Date: Mon, 12 Oct 2026 22:21:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave@stgolabs.net, jic23@kernel.org,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, jgg@nvidia.com, aneesh.kumar@kernel.org,
	aik@amd.com, yilun.xu@linux.intel.com, iweiny@kernel.org,
	ming.li@zohomail.com, icheng@nvidia.com, bhelgaas@google.com,
	smadhavan@nvidia.com, ilpo.jarvinen@linux.intel.com,
	Smita.KoralahalliChannabasappa@amd.com, linux-coco@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] PCI/TSM: Derive the coherent-range IPA from CXL
Message-ID: <as0zRXh5f5kjULVI@ashevche-desk.local>
References: <20261005070252.84810-1-ankita@nvidia.com>
 <20261005070252.84810-4-ankita@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005070252.84810-4-ankita@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 05, 2026 at 09:02:51AM +0200, Ankit Agrawal wrote:
> The DevIf report range with range ID 0xffff describes the device's
> coherent (CXL) memory window and unlike every other reported range
> carries no BAR number. Recognize
> PCI_TSM_DEVIF_REPORT_MMIO_RANGE_ID_COHERENT and recover that window's
> address from the CXL side of the device instead of treating it as a
> BAR-relative offset.
> 
> pci_tsm_coherent_range() resolves the window from pdev->coh_resource[],
> snapshotted once with the committed CXL HDM decoders range. The
> range to IPA conversion is applied onto range_base/range_len using
> pdev->coh_resource[]. The ascending BAR order checks stay on the BAR
> path only. The coherent range is required to be the last report entry
> and is not part of the BAR sequence.
> 
> An HDM decoded window lives in the CXL Fixed Memory Window and is not
> part of a BAR. So by construction, no pci_dev resource contains it. So
> the function pci_tsm_coh_resource_contains() validates the range against
> pdev->coh_resource[] instead; the same known-good snapshot
> pci_tsm_coherent_range() already trusts.

> Assisted-by: Claude:sonnet-5

Assisted-by: LLM

...

> +static bool pci_tsm_coh_resource_contains(struct pci_dev *pdev,
> +					  const struct resource *res)
> +{
> +	int i;
> +
> +	for (i = 0; i < PCI_CXL_MAX_COHERENT_RANGES; i++) {

	for (int i = 0...)

> +		struct resource *coh_res = &pdev->coh_resource[i];

		pci_resource_n()

> +		if ((coh_res->flags & IORESOURCE_MEM) &&
> +		    resource_contains(coh_res, res))
> +			return true;
> +	}
> +
> +	return false;
> +}

...

> +			for (j = 0; j < PCI_NUM_RESOURCES; j++)
> +				if (resource_contains(pci_resource_n(pdev, j), res))
> +					break;

pci_dev_for_each_resource()

...

> +static int pci_tsm_coherent_range(struct pci_dev *pdev, u64 *out_base,
> +				  u64 *out_size)

Instead of the last two you can use struct range.

> +{
> +	for (int i = 0; i < PCI_CXL_MAX_COHERENT_RANGES; i++) {
> +		struct resource *res = &pdev->coh_resource[i];

		pci_resource_n()

> +		if (!(res->flags & IORESOURCE_MEM))
> +			continue;

		resource_type()

> +		*out_base = res->start;
> +		*out_size = resource_size(res);
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}

...

> +			if (pci_tsm_coherent_range(pdev, &range_base,
> +						   &range_len)) {

I would leave it on a single line.

> +				pci_dbg(pdev, "No CXL region or committed HDM decoder for coherent reporting range\n");
> +				return NULL;
> +			}


...

> +		range_off = coherent ? tsm_offset :
> +					tsm_offset - reporting_bar_base;

Indentation is broken. I think it's better to read when it's a single line.

-- 
With Best Regards,
Andy Shevchenko


