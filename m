Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7A225D7
	for <linux-coco@lists.linux.dev>; Wed,  8 Jan 2025 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736323308; cv=none; b=b9SB47PTzpe2ronbPmpUUN6Kbqb+mKoVUv8etSpBx8QIhdRn6S4JxiLj6gopUACrkRcYU1LGB4bCdOxGd0veIpf2CqROF9BywzGCeieaaatw9ihj3pkl0DdAof5H3KimEpse0AqBTSAdeMoxbw5fpYmH15BUdNiz0/xUBydOgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736323308; c=relaxed/simple;
	bh=pw1KQHMt/ygdy09xhNVxbdYTD3WT24Qle6Az2Fp4BCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEdNBC004a7bhybLm5rTefDQa2VUeNw54WeXiKkb5QMTR3k4WL90h7McxY38uF9S5TsQQ8qjQGDrexEic0aDzRj7DcXHaC6ZPtohEiiM0D2MB0fi2QQ0G8fZlZYYmQxpfSFw38Kkp9hHwDGKyz+If5nCtr/hFakqSDS4v8Y5f5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYbUOR7K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYbUOR7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736323308; x=1767859308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pw1KQHMt/ygdy09xhNVxbdYTD3WT24Qle6Az2Fp4BCY=;
  b=GYbUOR7KwzewtBfsMC/XglqeZs3LzqqP9kHnkyu2GUM9AvSQWNR2XjTh
   mDipFeGeMRQP0lfgZXHqlgJn1C+u/BYFZZCIXrdCzN9o/MAOKAsLRTU19
   P1JEI0o86bdJbOHAMZ9egV6Fhu780zpVmHzc2LpuqdXrtTJKaP8x+ae2U
   j2HPp6yCojSF0OFGfxp5d7Mok3NglFhqmjIsg0PBM7mWyoHSkqjgoxM81
   bGGw+TcoEt6Vtg9ezZu439oGvXW5Lakb1SOnQkG6MYdYi/h9RObz3cJNn
   zPOTLH+JihvmwgA1oxBmV3zSq4GCzC5s4BHihCx60guPW6GYFlWSzeNaM
   w==;
X-CSE-ConnectionGUID: vdWOhSkBQGqbbaBiZytb7A==
X-CSE-MsgGUID: Umeq9UcARQC6bw42YhQfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59001635"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="59001635"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:01:29 -0800
X-CSE-ConnectionGUID: xZAfw/h8T3SiFXgz3hAdFA==
X-CSE-MsgGUID: unBBLsoXT8Ov99s1AfuApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103525226"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2025 00:01:26 -0800
Date: Wed, 8 Jan 2025 04:00:25 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
	Samuel Ortiz <sameo@rivosinc.com>, linux-pci@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 08/11] PCI/IDE: Add IDE establishment helpers
Message-ID: <Z32H2Tzd1UHCQEt5@yilunxu-OptiPlex-7050>
References: <173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com>
 <173343744264.1074769.10935494914881159519.stgit@dwillia2-xfh.jf.intel.com>
 <9f151a74-cc5c-4a7c-8304-1714159e4b2c@amd.com>
 <6d50f215-93c4-49a5-9ee2-f9775b740f92@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d50f215-93c4-49a5-9ee2-f9775b740f92@amd.com>

> > > +static void __pci_ide_stream_setup(struct pci_dev *pdev, struct
> > > pci_ide *ide)
> > > +{
> > > +    int pos;
> > > +    u32 val;
> > > +
> > > +    pos = sel_ide_offset(pdev->sel_ide_cap, ide->stream_id,
> > > +                 pdev->nr_ide_mem);
> > > +
> > > +    val = FIELD_PREP(PCI_IDE_SEL_RID_1_LIMIT_MASK, ide->devid_end);
> > > +    pci_write_config_dword(pdev, pos + PCI_IDE_SEL_RID_1, val);
> > > +
> > > +    val = FIELD_PREP(PCI_IDE_SEL_RID_2_VALID, 1) |
> > > +          FIELD_PREP(PCI_IDE_SEL_RID_2_BASE_MASK, ide->devid_start) |
> > > +          FIELD_PREP(PCI_IDE_SEL_RID_2_SEG_MASK, ide->domain);
> > > +    pci_write_config_dword(pdev, pos + PCI_IDE_SEL_RID_2, val);
> > > +
> > > +    for (int i = 0; i < ide->nr_mem; i++) {
> > 
> > 
> > This needs to test that (pdev->nr_ide_mem >= ide->nr_mem), easy to miss
> > especially when PCI_IDE_SETUP_ROOT_PORT. Thanks,

Yes, but nr_ide_mem is limited HW resource and may easily smaller than
device memory region number. In this case, maybe we have to merge the
memory regions into one big range.

> > 
> > 
> > 
> > > +        val = FIELD_PREP(PCI_IDE_SEL_ADDR_1_VALID, 1) |
> > > +              FIELD_PREP(PCI_IDE_SEL_ADDR_1_BASE_LOW_MASK,
> > > +                 lower_32_bits(ide->mem[i].start) >>
> > > +                     PCI_IDE_SEL_ADDR_1_BASE_LOW_SHIFT) |
> > > +              FIELD_PREP(PCI_IDE_SEL_ADDR_1_LIMIT_LOW_MASK,
> > > +                 lower_32_bits(ide->mem[i].end) >>
> > > +                     PCI_IDE_SEL_ADDR_1_LIMIT_LOW_SHIFT);
> > > +        pci_write_config_dword(pdev, pos + PCI_IDE_SEL_ADDR_1(i), val);
> > > +
> > > +        val = upper_32_bits(ide->mem[i].end);
> > > +        pci_write_config_dword(pdev, pos + PCI_IDE_SEL_ADDR_2(i), val);
> > > +
> > > +        val = upper_32_bits(ide->mem[i].start);
> > > +        pci_write_config_dword(pdev, pos + PCI_IDE_SEL_ADDR_3(i), val);
> > > +    }
> > > +}
> > > +
> > > +/*
> > > + * Establish IDE stream parameters in @pdev and, optionally, its
> > > root port
> > > + */
> > > +int pci_ide_stream_setup(struct pci_dev *pdev, struct pci_ide *ide,
> > > +             enum pci_ide_flags flags)
> > > +{
> > > +    struct pci_host_bridge *hb = pci_find_host_bridge(pdev->bus);
> > > +    struct pci_dev *rp = pcie_find_root_port(pdev);
> > > +    int mem = 0, rc;
> > > +
> > > +    if (ide->stream_id < 0 || ide->stream_id > U8_MAX) {
> > > +        pci_err(pdev, "Setup fail: Invalid stream id: %d\n",
> > > ide->stream_id);
> > > +        return -ENXIO;
> > > +    }
> > > +
> > > +    if (test_and_set_bit_lock(ide->stream_id, hb->ide_stream_ids)) {
> > > +        pci_err(pdev, "Setup fail: Busy stream id: %d\n",
> > > +            ide->stream_id);
> > > +        return -EBUSY;
> > > +    }
> > > +
> > > +    ide->name = kasprintf(GFP_KERNEL, "stream%d:%s", ide->stream_id,
> > > +                  dev_name(&pdev->dev));
> > > +    if (!ide->name) {
> > > +        rc = -ENOMEM;
> > > +        goto err_name;
> > > +    }
> > > +
> > > +    rc = sysfs_create_link(&hb->dev.kobj, &pdev->dev.kobj, ide->name);
> > > +    if (rc)
> > > +        goto err_link;
> > > +
> > > +    for (mem = 0; mem < ide->nr_mem; mem++)
> > > +        if (!__request_region(&hb->ide_stream_res, ide->mem[mem].start,
> > > +                      range_len(&ide->mem[mem]), ide->name,
> > > +                      0)) {
> > > +            pci_err(pdev,
> > > +                "Setup fail: stream%d: address association conflict
> > > [%#llx-%#llx]\n",
> > > +                ide->stream_id, ide->mem[mem].start,
> > > +                ide->mem[mem].end);
> > > +
> > > +            rc = -EBUSY;
> > > +            goto err;
> > > +        }
> > > +
> > > +    __pci_ide_stream_setup(pdev, ide);
> > > +    if (flags & PCI_IDE_SETUP_ROOT_PORT)
> > > +        __pci_ide_stream_setup(rp, ide);
> 
> Oh, when we do this, the root port gets the same devid_start/end as the
> device which is not correct, what should be there, the rootport bdfn? Need

"Indicates the lowest/highest value RID in the range
associated with this Stream ID at the IDE *Partner* Port"

My understanding is that device should fill the RP bdfn, and the RP
should fill the device bdfn for RID association registers. Same for Addr
association registers.

Thanks,
Yilun

> to dig that but PCI_IDE_SETUP_ROOT_PORT should detect that it is a root
> port. Thanks,
> 
