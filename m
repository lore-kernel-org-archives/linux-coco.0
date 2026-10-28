Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180729;
	b=jkAHw+hdRMPQFoF4GIHWN4eeSnYIRm2v0IMpTduPEdHFk/qLuadJ4hDxgLU7j2eh6nz6
	 aY8BbXhhmlfTnTJLvNY8KyxrCRggF37Ri/y2051p9nyue8yDE/EtbwRU4LtmXLJwJuehk
	 28ooKMa74yD+IAjNzbBfUgtpD03pepM3AVWk7Sk2yADCw5yOYtUMa+c1tW1Q4NRt+nYBF
	 44cKuOpqkUi4vgPZFmzgiKUNrTql/8iKyQlIcqJtagf9FIHV4eIHaicpGJcmAGcbQ+OJ4
	 aqvG1vK2NR7CTGoOyHyIoafehnQEin7LbUSFXwkBVVBiOfwrTHNwG3oXjEut8VK9gbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180729;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9aFo0L0jon7+/G9fXPa2tntqqWwFAcaJAliV5DNKX2I=;
	b=Eia0Y+HS8lB6zed51AHHA8m95UHz3LgQhWiDxU3Lqf3iytaUc8kSN0G0HxejpvKLx7zx
	 s9wVmkH5EAnm39Sl6UDVDeNVIWsUrcY/UMDQlTqVNQ+oT6/S7ggCvwesD9FYMnEBBTEre
	 vvUVlmw1GqVD8VysqLFQPIt28Ju/8HzoDm0zkmgapjthFwapqR9HNKnAHPSK/I1y97u9n
	 nUBDFebv5F+/EmuMy69PSlWode47ja9rJzfBygINkIrJyeyGiVdGgkFhr8T05yS8fw2Xy
	 o/dYBx/hPlQr/bvC5wFxO0RO4HGSy++3QcuPcUolCvrSX/ANc9VfBKtLKPfIGLBGz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mreYnfeF;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101E606A31E
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 09:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B101E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mreYnfeF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793180729; x=1824716729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cGgaP3xn8OVZ4sh0TYyonmgb9hzn2fCnVLUnNqvoSM4=;
  b=mreYnfeFUU2db7sbnKH+7SqSvHHPAKcW97pFRloElVzcUbyXz3dDoiBz
   fXxLZ+/oOdSMl+7OpSyCgQTfhxVfJ6TpsDYEKnMEiO70TAfU3475S778H
   /F/9r1hTnanWwBKWC/sgNEGo+z6cR/iSUMNB/KLY/DTw+tI33mtk5vmYF
   SCQmpKAzO1SZLUwgewmbZRqAPH7A8QIWe2zYUfz/KSRqOrPeELF+JMX+s
   uKlnZlZGDIxQ9fQ4Z8bFZDi410gt68Phcqop3KCJfkIHJAFrEpvmZv6h9
   GdyIpPtLKw7KyVXq7xpwiEnztViJaRJbggbxqzAlh7cjnJVbZlc234XkA
   w==;
X-CSE-ConnectionGUID: BarzZL8XSEKANzVTyOsHag==
X-CSE-MsgGUID: Dvrcs070SsizsOo/WcR0CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1927275"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1927275"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:45:28 -0700
X-CSE-ConnectionGUID: mUyh5x4ZSYWR6L8bbgquqw==
X-CSE-MsgGUID: FxKOblEDSm+28Ot7JQSR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6609868"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 02:45:23 -0700
Date: Wed, 28 Oct 2026 17:39:23 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
	aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
	pbonzini@redhat.com, chao.gao@intel.com, vishal.l.verma@intel.com,
	kevin.tian@intel.com, chao.p.peng@intel.com
Subject: Re: [RFC PATCH 15/15] virt: tdx-guest: Accept default DMAR entry
 during PCI driver attach
Message-ID: <auHCy2idoZfKpdnC@yilunxu-OptiPlex-7050>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-16-zhenzhong.duan@intel.com>
 <de19ab97-c86b-442b-be23-c921c0831542@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de19ab97-c86b-442b-be23-c921c0831542@intel.com>

On Mon, Oct 26, 2026 at 03:49:30PM +0800, Xiaoyao Li wrote:
> On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> > Before a TDI can perform DMA to guest private memory, its secure DMA
> > mapping must be accepted. This happens during driver load stage after
> > MMIO acceptance and TDI activation.
> > 
> > The enable_dma callback issues TDG.DMAR.ACCEPT to set secure PASID
> > table entry to present state and target non-partitioned TD.
> > 
> > The secure PASID table entry is cleared in unlock stage implicitly
> > so disable_dma is a no-op currently.
> > 
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > ---
> >  drivers/virt/coco/tdx-guest/connect.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> > index a9d41fd38b64..b328caac0a49 100644
> > --- a/drivers/virt/coco/tdx-guest/connect.c
> > +++ b/drivers/virt/coco/tdx-guest/connect.c
> > @@ -427,10 +427,26 @@ static int tdx_devsec_run(struct pci_dev *pdev)
> >  	return 0;
> >  }
> >  
> > +static int tdx_devsec_enable_dma(struct pci_dev *pdev)
> > +{
> > +	int ret = tdx_mcall_dmar_accept(pci_dev_id(pdev), 0);
> 
> after going through the series, I have a basic question on guest function_id.
> 
> Per TDX connect API spec, TDG.DMAR.ACCEPT, TDG.DMAR.RELEASE,
> TDG.TDI.MMIO.ACCEPT, TDG.TDI.RD and TDG.TDI.START all require guest function_id
> as input parameter. However, the guest function_id is specified by the host VMM
> on TDH.TDI.CREATE.
> 
> So how can the guest ensure pci_dev_id(pdev) is the value that will be specified
> by the host VMM?
> 
> This is a strong contract, while this series doesn't mention it at all.

I think the contract is already built for legacy VM. QEMU made the
mapping between the gBDF & the device.

The TDX guest doesn't need a new contract to identify a device. Instead
the VMM tells the firmware what is the contract on TDI creation.
That's why there is a tdi_id argument on host side TSM BIND (though we
may refactor the interface later).

But yes I agree we discuss this in changelog.
