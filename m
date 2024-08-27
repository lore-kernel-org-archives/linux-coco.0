Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F519DF97
	for <linux-coco@lists.linux.dev>; Tue, 27 Aug 2024 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761082; cv=none; b=opEaafDQpjt4K+NzdGq7OWzFSQA/yG3u8lPkB81Q9YUg15mRW5nfGlwBSKsfPPUaNzVFhyxmE6HFT58c2mr52d3ori+HyRza24H1DJpNV+W4HXnSe9wIDunjCcchwDCd70XVDjP7BVzTcJ7KAEqgvh0N6CYWPQDxp3Y1t8zriJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761082; c=relaxed/simple;
	bh=sUxTp3mdu6oCe57Y5LmIqO6B2YJIdByUCnPgZGXPspA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz0W6owMkarDLw1LCo4ZvOZ8m/ewUqahZvwqai6f32tyO5tWDWoRs6FmWGXvr86PtqZC14txKoDzb/7gF1/8A5D2tMcO2uZ4ZHJmeYv2fNgdD5kaZLjUuSIV/PhGEQpgFL3glaKukhTyLfXGCle29TF5gQ0IA6PySQ3viLmft00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NgbTTCOk; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NgbTTCOk"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b8d96aa4c3so45813337b3.1
        for <linux-coco@lists.linux.dev>; Tue, 27 Aug 2024 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1724761079; x=1725365879; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSDtcbC+Sb+RM+QrNNHI6+BWQxb+R1S6HcMDikmIILs=;
        b=NgbTTCOk7iapFaVAHC3InBtXsIq3fnE/vZs/+uOe4Sh+u1lNpuz5rZlf3Mx6k0cVcT
         BumY88khVORx9x5SBSn9Jcnwcr+sst+3/nfnrPk0XsylZK6PcfzAZLfyVdBQ1cT1myhu
         1L/X5pG4J4yDoOdLzDALHiL8FVq9l/Z5dzNpUYcWTRa+LPO+Bf4WJ6rziuNxiCZE39wW
         LHjkWnXRSKzrmSHS044mZZqIi3pKp6NcaL7VYbyIF+4uCy67JI7Lku5Z2+kCBkjCgmff
         draJXbnFEFFOkjoNMnfYjmAKBQNJT7vk1NsGeHsR+bFw1pj1+aPXl/qKp0/vGbqb6BTQ
         aMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761079; x=1725365879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSDtcbC+Sb+RM+QrNNHI6+BWQxb+R1S6HcMDikmIILs=;
        b=Jyb990ccqTkYLE0liI1H/glkgEdjXR+vl6fqdMaPQ0AFwVt0aTRPHFfmii0KCdiZk/
         zncob7sjlfwbPXwA3y51r36g3YvN+RoVRJ9KkPd9T6VBNrhineVoXDRfVNhbP2pOfWQl
         GsN/WBghypjr4VgFQUpFSUa5WAC7VyhUOErH+FYXhsMTn13cFpFW2CisFsLneD/WkCVe
         8P1DjiDZZQsQDF5h/EVgOoVJcx9WvlUIl6I1ZTe70pGusSkiSwrREvavRbzNE0EO+Yq3
         OPEhRRP3UkMFlCno0o/NN7cOo35jTaNx4E4mEZziu7wG4n0jPjqmQz7tduUA85hjRSIL
         vV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9RpZ/HPcy7EZIaZzAgzLf7ayjc8WnT/KwwIMZ4WbQEWdpxC1eyBV2kyhn0X5GcXa3aG/dSZsFc3hm@lists.linux.dev
X-Gm-Message-State: AOJu0Yze+56Xv1npBt/3UmaD4xyj7lVPkIsuRO75Y+VC1f/sOnnCxFzD
	eKLgA0txpil8OCDvDsE9xwBPfFgc6jjeIjG+cenxIdoZSbyijkePcNQbhbsMWSo=
X-Google-Smtp-Source: AGHT+IHG7Zt7HYJe2APHJBWsXsXzomPhCcOWxwx00rUDj9SbJTnkeOq8WZx6QjvFGHhSjLRLt1661g==
X-Received: by 2002:a05:690c:d82:b0:62f:4149:7604 with SMTP id 00721157ae682-6cfb941590bmr33630357b3.4.1724761078886;
        Tue, 27 Aug 2024 05:17:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3fbfb9sm544475785a.120.2024.08.27.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:17:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1siv93-000ZUA-PD;
	Tue, 27 Aug 2024 09:17:57 -0300
Date: Tue, 27 Aug 2024 09:17:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	pratikrajesh.sampat@amd.com, michael.day@amd.com,
	david.kaplan@amd.com, dhaval.giani@amd.com,
	Santosh Shukla <santosh.shukla@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>, Alexander Graf <agraf@suse.de>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 14/21] RFC: iommu/iommufd/amd: Add IOMMU_HWPT_TRUSTED
 flag, tweak DTE's DomainID, IOTLB
Message-ID: <20240827121757.GL3468552@ziepe.ca>
References: <20240823132137.336874-1-aik@amd.com>
 <20240823132137.336874-15-aik@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823132137.336874-15-aik@amd.com>

On Fri, Aug 23, 2024 at 11:21:28PM +1000, Alexey Kardashevskiy wrote:
> AMD IOMMUs use a device table where one entry (DTE) describes IOMMU
> setup per a PCI BDFn. DMA accesses via these DTEs are always
> unencrypted.
> 
> In order to allow DMA to/from private memory, AMD IOMMUs use another
> memory structure called "secure device table" which entries (sDTEs)
> are similar to DTE and contain configuration for private DMA operations.
> The sDTE table is in the private memory and is managed by the PSP on
> behalf of a SNP VM. So the host OS does not have access to it and
> does not need to manage it.
> 
> However if sDTE is enabled, some fields of a DTE are now marked as
> reserved in a DTE and managed by an sDTE instead (such as DomainID),
> other fields need to stay in sync (IR/IW).
> 
> Mark IOMMU HW page table with a flag saying that the memory is
> backed by KVM (effectively MEMFD).
> 
> Skip setting the DomainID in DTE. Enable IOTLB enable (bit 96) to
> match what the PSP writes to sDTE.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> ---
>  drivers/iommu/amd/amd_iommu_types.h  |  2 ++
>  include/uapi/linux/iommufd.h         |  1 +
>  drivers/iommu/amd/iommu.c            | 20 ++++++++++++++++++--
>  drivers/iommu/iommufd/hw_pagetable.c |  4 ++++
>  4 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
> index 2b76b5dedc1d..cf435c1f2839 100644
> --- a/drivers/iommu/amd/amd_iommu_types.h
> +++ b/drivers/iommu/amd/amd_iommu_types.h
> @@ -588,6 +588,8 @@ struct protection_domain {
>  
>  	struct mmu_notifier mn;	/* mmu notifier for the SVA domain */
>  	struct list_head dev_data_list; /* List of pdom_dev_data */
> +
> +	u32 flags;
>  };
>  
>  /*
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 4dde745cfb7e..c5536686b0b1 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -364,6 +364,7 @@ enum iommufd_hwpt_alloc_flags {
>  	IOMMU_HWPT_ALLOC_NEST_PARENT = 1 << 0,
>  	IOMMU_HWPT_ALLOC_DIRTY_TRACKING = 1 << 1,
>  	IOMMU_HWPT_FAULT_ID_VALID = 1 << 2,
> +	IOMMU_HWPT_TRUSTED = 1 << 3,
>  };

This looks so extremely specialized to AMD I think you should put this
in an AMD specific struct.

> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index b19e8c0f48fa..e2f8fb79ee53 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1930,7 +1930,20 @@ static void set_dte_entry(struct amd_iommu *iommu,
>  	}
>  
>  	flags &= ~DEV_DOMID_MASK;
> -	flags |= domid;
> +
> +	if (dev_data->dev->tdi_enabled && (domain->flags & IOMMU_HWPT_TRUSTED)) {
> +		/*
> +		 * Do hack for VFIO with TSM enabled.
> +		 * This runs when VFIO is being bound to a device and before TDI is bound.
> +		 * Ideally TSM should change DTE only when TDI is bound.
> +		 * Probably better test for (domain->domain.type & __IOMMU_DOMAIN_DMA_API)

No, that wouldn't be better.

This seems sketchy, shouldn't the iommu driver be confirming that the
PSP has enabled the vDTE before making these assumptions?

> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index aefde4443671..23ae95fc95ee 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -136,6 +136,10 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
>  	hwpt_paging->nest_parent = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
>  
>  	if (ops->domain_alloc_user) {
> +		if (ictx->kvm) {
> +			pr_info("Trusted domain");
> +			flags |= IOMMU_HWPT_TRUSTED;
> +		}

Huh?

Jason
