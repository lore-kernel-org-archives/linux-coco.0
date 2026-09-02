Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F0D47F775
	for <linux-coco@lists.linux.dev>; Wed,  2 Sep 2026 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351427; cv=none; b=YVYsI3ySZ2bnrFwsFCu7qpy0x9VxXsVn+oMvqOvayOeWLJf1Xyaei/AXOfBj2TJn4v0NljnsksV4cP66A7CtlPySYqfelJ0us6CLMk689BxMenh3dVjyw32IrVtEpvydZs/8EO+TFdvdltW98+eaznCfNWXL6ppvfoQm6kM9HqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351427; c=relaxed/simple;
	bh=KiuQi7KyeiZxotF4pe9yz/R7uxutNRVzafURAOqLelg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7uWn+bHG84ETN6V/yu+wVzYjv9bmkdy21CJ58sIWqRQIOJcJMI4qvOOgZ5DWKDubgtPe4IlB6FlJD1sYUAqaOpMLUUMkfAodq8nYFHg7rq1N3lBwr9ezSPRMjbGpD8Y/eJOoHFUMi/MhKasR40F5P0rZZHnYQlTMkeJDKCxuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Z1aghS/I; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Z1aghS/I"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52de50e77ffso10994721cf.2
        for <linux-coco@lists.linux.dev>; Wed, 02 Sep 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788351423; x=1788956223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=Z1aghS/IEorDIQpm+hZy5NzD2fWPVZIKZ74CiWUWo2itxR/kvjUEmJ8GOAhUNTVH3O
         Ndo0X0yV/f1DP15Uys4DggRMycJGh4I/DtjpkIM/Ov5HYRW/pJRvMh/iH/ZkDc0qekpM
         FZk3fGERMWwLqoJbjX3eus+F44WHqRvGr46qLhNR0Hv5xwRGKqdw1cr+VRx1GwUBYj8N
         MssndhvaLID+7Y1/Gp2q/VrnUJTtHWazXZ+RYC6XdTChR8zC5BUMcGBEWUF2lj6T8nft
         3GsEdVDNYPOxHsWVm427Ho/y5Nv0U8KjWTq1aIkH+pkfpY33CXEfMLuPnLZGTqoyiruf
         wzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351423; x=1788956223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=H7cuuxCJbosbOp8qS2y1wjrje/eJ+U+q+thh8cCmGFmEJZ2SFvW3NEniRkjlWgFuD3
         z/6d0HL+PhmMviMlcZ4P+a5rcpr6qGNXm6MeUY1EhW/rEHPTfWuUcYAYW0rWNjtBeR28
         aQymjgJkxv/vxjvpzVnPDUkXBVT2xwmJNwJfaA3l97idmUZNn5QYPH4RHBUXT7ejaVqg
         DKTbHnUpoVNDS4HOjBa2qmXwCqTKNuK9yxrLovzmoYFeLc803rO6RC5P8OrAT1ersNi+
         qcuaZvBCMZ4Qzuctq1njHfSf8S8Mb06lRvelr69sRR/X2ATXG47HV8x/dzom3yyKVKh0
         +JIg==
X-Forwarded-Encrypted: i=1; AHgh+RpigtNMZHfchMkrTpWL1qBLd6eYhF5A+yZTFT6kvVDt7vPuKX0zXE2O96lbQTR/e4PPT8Qj067Jr8JK@lists.linux.dev
X-Gm-Message-State: AFuF++mIHteT8XqT6YQhseBWKSb3CwCEByBoIB+Y7GoXjK5AXWBOVYOI
	1DT0Ghiw4okbH13byADsTHVJT+zm0YgKQDCUklWBzYG4TjYEoiZjCu25Rp7grv61/7t6zOBNBjW
	aZSa0
X-Gm-Gg: AR+sD12tF9QSJOcfmEydftijVpCbC1QnOBNiBCB+5J6hoa4s1mDZ6eg+q12Dc4MJD8k
	CZjaPyzeDIeiqOGCTt9dZzAQk2hgKEgpUnfVHD10qwaolpKAUjs9w0Mt/uRhebclgE9/7nkgQAE
	bC1Pot4kRhhm5IG+LpvJ6dMM3DUJkPd4pUDd9Pdg7/y1WYJ0/AVGOMC71cqAMRPnLbyVv48j7AH
	Xeamq1489JGgsG+1b0IewvChaZcaHg8MGk6mefDOTK/SgXXI9GLcz9uv9g7jYNnoPbiy0HFKiGO
	oWzGFngv2L4VuWHPnMaTTXgBcGUhiRBqeSjOy6XPPMk+m+jvt5TF1lE9JKrOw+ymq416UFioUwH
	66jV8vRKpTFAdiomNROgqg8hx+xqaVff4aAOy/TKUjCSLKrLj3evEOuBzs9Nr+FsPkDLgYlepLB
	5ooq8lyeymhpl7Z89I54XfqqqVeiYj9b0IEY3RmD3LmfH0M9/Tks5taM3SO/GixXUYI2GSEhEnm
	BQ8OOS9L1YPhNRPnBULQP8gcu5YoTxBClVaXgA0c/fyYQ==
X-Received: by 2002:ac8:5d49:0:b0:527:7a5b:ca67 with SMTP id d75a77b69052e-53036cc7263mr48464101cf.20.1788351423074;
        Wed, 02 Sep 2026 05:17:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm17590961cf.2.2026.09.02.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:17:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1jtk-0000000EB68-1U6I;
	Wed, 02 Sep 2026 09:17:00 -0300
Date: Wed, 2 Sep 2026 09:17:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902121700.GC2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q5kkoz3.fsf@kernel.org>

On Wed, Sep 02, 2026 at 02:30:00PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
> >
> >> @@ -463,14 +460,13 @@
> >>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
> >>  
> >>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> >> +		if (arm_smmu_is_realm_viommu(viommu))
> >> +			return arm_realm_smmu_v3_init(viommu, user_data);
> >> +
> >
> > I think the realm vsmmu is going to require a different info struct
> > than the normal psmmu case, isn't it?
> >
> > If so it needs its own enum value.
> >
> > It would be nice to see a draft patch showing how the real vsmmu works
> > on top of the RMM spec for it. If we are using a viommu object then
> > non-vsmmu case should be identical just with an option in the info
> > struct to not create the vsmmu object.
> 
> Based on feedback on other emails in this thread, I have now implemented
> this without using a vdevice or viommu. This should make the CCA and
> non-CCA cases similar.

That wasn't the feedback. The feedback was to use the viommu and not
make a bunch of new stuff..

> +int arm_smmu_realm_tsm_bind(struct device *dev, struct kvm *kvm)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	int ret;
> +
> +	if (!kvm_is_realm(kvm))
> +		return 0;
> +
> +	ret = arm_realm_smmu_get(master->smmu);
> +	if (ret)
> +		return ret;
> +
> +	ret = arm_realm_smmu_stream_get(master);
> +	if (ret)
> +		arm_realm_smmu_put(master->smmu);
> +	return ret;

It still makes no sense this doesn't do the VDEV_CREATE too.

> iommufd_device_tsm_op_ioctl()
> 
> 	switch (cmd->type) {
> 	case IOMMU_DEVICE_TSM_BIND:
> 		if (!idev->tsm_iommu_bound && ops->tsm_bind) {
> 			if (WARN_ON_ONCE(!ops->tsm_unbind)) {
> 				ret = -EOPNOTSUPP;
> 				break;
> 			}
> 			ret = ops->tsm_bind(idev->dev, kvm);
> 			if (ret)
> 				break;
> 			idev->tsm_iommu_bound = true;
> 			iommu_bound = true;
> 		}
> 		ret = tsm_bind(idev->dev, kvm, cmd->tdi_id);

Yuk! Now this uAPI doesn't make any sense when you have an actual
viommu involved, we can't take tdi_id from userspace, it must come
from the vdevice.

I don't want two confusingly different flows, this stuff is hard
enough to keep straight.

Your first version was better, we just need to commit to using the
viommu for everyone on every arch and drop the the tsm_bind() API and
IOMMU_DEVICE_TSM_BIND interface.

The only draw back is the VMM has to manage a litte bit more.

Jason
