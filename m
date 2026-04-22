Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F84A23
	for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852952; cv=none; b=Scv0TtLawHGUl9gn/x1Nj+Td6t5BX5cmXBhR1m7Ls7aElBcfo9lKwpr0pbPpA1Yhk6HW4T8VbTvNtlWNddoVZfgfBUprS7+IFbNZoVC12juaWPSE4NKPFbINQrXvvmK9l5hNG4d4KICSBgBJDkNOVjY1UkPzNW2wazsjoTjlLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852952; c=relaxed/simple;
	bh=4pm3cuE4YtiBWgDifB2kYoUnXjTiXLk2G7f65ddr4uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJR0EUiuY52RzYKaVr74vofYhwOCLjCMPD/2g7FKx8v+xe7KDUdl1SrEG+sMIkkzUCNYaj8Zw26HDy6vuMdo67ziNLHhVAwJ6BP3jYGvUbXeZh5OJTU4v0rsw0F+RZNyui1yM//edqO3Qay6w9XjKs3sM4fYn8P1HhkvOdGAXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTL1YhdE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTL1YhdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776852951; x=1808388951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pm3cuE4YtiBWgDifB2kYoUnXjTiXLk2G7f65ddr4uo=;
  b=QTL1YhdENDSgf5RO/FOTVZJeGoB0XHXlhnuoJj4vH5F0/kOhe0PjkB5a
   TkGSihDWX+QRZwR9AptTDLkJQtXMwwnDocG5MveKXuCPELxfBY2BF/8CY
   0+PrK9kT9ITLUEJGXJi2PiChH2abY8oJVP/rkZvov+/XbI0cQb+CvgDVn
   0KksItacFmnwVT38T9uDOq5QjWJKn2QrmTrBvdoKHiygt9DMyoefLUash
   OiqlRtaKCoaLnY/uMrq8d3RgHwv7eJDcJFcroVNykdfSN/wZ9qSuEcQj2
   PjtywTCAMxE0Lr5lH+T/bs9R3O4W/iHrb/vJoWOW55V+MAz8gUrzGbkcw
   A==;
X-CSE-ConnectionGUID: vLPVTTobQIqky1a1Eb5N6Q==
X-CSE-MsgGUID: viAot7nVQKuUk2D+HKW11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88103573"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88103573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:15:51 -0700
X-CSE-ConnectionGUID: clzp6i49Tqy7fKYj7FwyrQ==
X-CSE-MsgGUID: 2wvphU5qQKabKVkwrdVVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227983651"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 22 Apr 2026 03:15:47 -0700
Date: Wed, 22 Apr 2026 17:53:34 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	dan.j.williams@intel.com, x86@kernel.org, chao.gao@intel.com,
	dave.jiang@intel.com, baolu.lu@linux.intel.com, yilun.xu@intel.com,
	zhenzhong.duan@intel.com, kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
	kas@kernel.org, xiaoyao.li@intel.com, vishal.l.verma@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 27/31] coco/tdx-host: Implement SPDM session setup
Message-ID: <aeianoT0LZFC2DNt@yilunxu-OptiPlex-7050>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-28-yilun.xu@linux.intel.com>
 <51f2be5a-47d2-4a06-92bb-368aaed73530@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f2be5a-47d2-4a06-92bb-368aaed73530@suse.com>

> > +#define TDISP_FUNC_ID		GENMASK(15, 0)
> > +#define TDISP_FUNC_ID_SEGMENT		GENMASK(23, 16)
> > +#define TDISP_FUNC_ID_SEG_VALID		BIT(24)
> > +
> > +static inline u32 tdisp_func_id(struct pci_dev *pdev)
> > +{
> > +	u32 func_id;
> > +
> > +	func_id = FIELD_PREP(TDISP_FUNC_ID_SEGMENT, pci_domain_nr(pdev->bus));
> > +	if (func_id)
> > +		func_id |= TDISP_FUNC_ID_SEG_VALID;
> 
> This check implies pci_domain_nr returning 0 is considered invalid. Other
> callers in the kernel seem to not care, they just use the domain nr, so is
> this check spurious or intentional ?

This is the func_id format defined in TDISP SPEC, bit 24 is a must. It
is not the linux defined SBDF format.

> 
> > +	func_id |= FIELD_PREP(TDISP_FUNC_ID,
> > +			      PCI_DEVID(pdev->bus->number, pdev->devfn));
> > +
> > +	return func_id;
> > +}
> > +
> > +struct spdm_config_info_t {
> > +	u32 vmm_spdm_cap;
> > +#define SPDM_CAP_HBEAT          BIT(13)
> > +#define SPDM_CAP_KEY_UPD        BIT(14)
> 
> nit: move those defines above the struct definition, they just break the
> reading flow as it is.

Yes.

...

> > +static void *tdx_dup_array_data(struct tdx_page_array *array,
> > +				unsigned int data_size)
> > +{
> > +	unsigned int npages = (data_size + PAGE_SIZE - 1) / PAGE_SIZE;
> 
> nit: There's DIV_ROUND_UP

Yes.

...

> > +DEFINE_FREE(tdx_spdm_session_teardown, struct tdx_tsm_link *,
> > +	    if (!IS_ERR_OR_NULL(_T)) tdx_spdm_session_teardown(_T))
> > +
> >   static int tdx_tsm_link_connect(struct pci_dev *pdev)
> >   {
> > -	return -ENXIO;
> > +	struct tdx_tsm_link *tlink = to_tdx_tsm_link(pdev->tsm);
> > +
> > +	struct tdx_tsm_link *tlink_spdm __free(tdx_spdm_session_teardown) =
> > +		tdx_spdm_session_setup(tlink);
> 
> Is the free() really needed here, either the session is correctly setup and
> tlink_spdm is returned. But if session_setup() files then what about calling
> spdm_session_disconnect() on an unestablished session?

Ah, we have more steps to add, the __free() will take function when the
following steps fail.

We may add __free() when we add more steps, but I think that makes the
diff harder to read, so I want to keep this style.

Thanks.

> 
> 
> > +	if (IS_ERR(tlink_spdm)) {
> > +		pci_err(pdev, "fail to setup spdm session\n");
> > +		return PTR_ERR(tlink_spdm);
> > +	}
> > +
> > +	retain_and_null_ptr(tlink_spdm);
> > +
> > +	return 0;
> >   }
> 
> <snip>
> 
