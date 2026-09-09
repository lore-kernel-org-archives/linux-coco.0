Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC59F3E315F
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958004; cv=none; b=HlXbd5nD0TK5cFsisrnFQkJcZSC+iBNKOU1MIZr0s3LrRJZSEQo3ggVDt4zx8kOzvspUqDzEQqe/UXcCFOYnLDepjCxT88gwrEAwJou5bwNCScpitOCK967emRBjg84SP9M8mFU/daZ4pwIWd4zP/MuEnwMexQrbhJffu1CKWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958004; c=relaxed/simple;
	bh=QDi/RLEV4NM3t1kYDBD1hT0dRtZz7+g9ZWoQx4FJiek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM5mLdXXploznyfstPYsnfeUOAi0C71OJ2Xpb4HrCb5hLWoVDpsi4xlLcygOxsu6U8gl4ozW8QR0Qhx8B4lSFK2ZTuXDkiDTsKZF5ZwtPLS4TjlyOIuKvZh7k8x7B1Q4S5MuFqL3g+GNlhFh5wGOcSjd7TR8FIojtvc+GYNXtfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HyyPKq/P; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HyyPKq/P"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso4081386d6.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788957997; x=1789562797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=HyyPKq/PGAotO2ruWp9KxWTvHKvZEnXRD5bLNwOmYhc3lE0qrhJjkGenTwy3e1F+9X
         f+93JJzg8rN2JUO1a6yoL9zpNjA/sraG2y/Y0IKZhvRAh/3AMqg0qLwsdZaqH4/j7DOj
         HYYlf3rwnJfWPLFNIfNWRl9ch2zpWx4Cy/qGDihFFZqoSmQrCZZxLzr60n+hdahOXppg
         MzAX1P0UOzIwRykpyPmKLE+8E1WWtjd+cEat7jwcp9htNMdEuFOk8j8HNoyAzslMTcjI
         FGjnq4oOmibyCjXc6ULcmGldpFOeAdzH1WVqwzocwpSilJ1r+F27vVmbQwylTd5k1avc
         dACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957997; x=1789562797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=PT/9AgPuFCHGSTLeFoBdwZm5d8Ildcl3GfZULhzGmipFE9QRRGH7e4p/aPon1De1R5
         U+qHQeXTkyByPG2NmFbR+mOiqGPXgo1NUCdf6MQDy1j6G7uXh/SKR+ThW7tYGxjJYack
         n23Ivlyr6yB25ieXANj3a2yTdJNs5Xc2nEJhMMPbFkcX5ObocW1+4/QY+vflOehVJsve
         B4wMmMVOIHVXOM74/3b5VoLZ/oyqA8JaReqDRI6xJL1miZfnNjHLvb4hvRT9I/4swIXN
         yoeCkLP0AD6LEbRkg043yenP4iD7kt7/dEvRgiC/KyZkgGfv1hjAnzXJril7EppQu0W/
         AeQA==
X-Forwarded-Encrypted: i=1; AKwUvByNL5cdn+suIMJKgYFpEn69UABD6n2/TwZTKGm9JhbIYyDI93olrSV++aqc8djX7pLwki8iAvEcZ5/c@lists.linux.dev
X-Gm-Message-State: AFuF++kAqWzVkvbtHPh8KC1QMqV4RUet0kYUXa4pzsSH3eoELSmr6WoM
	8eEO56HNKTdmqZ1fRn4B5lwGfzqbnEa6bo6LMfqMR80IPBnzucXBYYqwc/H8M1mEesA=
X-Gm-Gg: AYBFou2soqov9T33fOVuaEXRlsLPc3uHQOQ5RCHbWf90E9ondOkKlJN4B8OZdK1wV0E
	cSo4vFYzWZqgZ/p1qZllvUgr+eXg6fD84zuVJ2CzUBrqckA+4XjKFzhQ3OwAEUsDjjPPLjp9x+K
	1zPHKedQ2vkcT1k2e3wQHhVCMoBeznMJY4/kNFBiRtKOWPHwcWRcgRgMQIIE1ZVPrTT9MntDhv5
	MZd3ZMwvRJ1qjtiE2yh9QZabEoGu7LT9tRKoRzkFzfMuNaptwWiirnXHttXSF3Itk1tfh9bWx2z
	BgE8w7H2UDi0xjmK1ruVnHHpkus+Zguzn1QMmP94MpqanOXEpyGmbVwmuanCe9V9LPIKZNsWGkh
	ZtsbwZKbSNQnroy7UIllWN3IXyl/whXjZVDMnFYcoOEgLV3Cd7f+hx+jdev6HPdXP5bd2uwP9sz
	LHCxXImw0h03mpQ5DuZg9IOgx3FpitOR4DsfcofGoptPPR3Cep9C41ZEiJ+sc3qIfBK6shEq3d5
	8EHTk++Y2tmoqEqMz9dAoYbaC75kZHS5eyCjdybXgxh9FEz6q0lchgY
X-Received: by 2002:a05:6214:ccc:b0:910:4080:dc4f with SMTP id 6a1803df08f44-9106b371c17mr87577676d6.4.1788957992321;
        Wed, 09 Sep 2026 05:46:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91053b4992csm85467086d6.22.2026.09.09.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:46:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4Hh6-0000000Ge25-36Uc;
	Wed, 09 Sep 2026 09:46:28 -0300
Date: Wed, 9 Sep 2026 09:46:28 -0300
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
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260909124628.GH2543240@ziepe.ca>
References: <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnyag84.fsf@kernel.org>

On Wed, Sep 09, 2026 at 03:39:31PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:
> >
> >> I looked into this, and it becomes fairly complicated. We can move all
> >> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:
> >
> > I was going for the opposite, you'd move everything out of arm-smmu-v3
> > and into the arm-cca-host and obtain the viommu through tsm_ops not
> > through iommu_ops.
> >
> > I guess I pointed to that in another email.
> >
> > The only thing arm-smmu-v3 should provide is a simple function to give
> > the pdev phys and irq parameters. arm-cca-host calls that when it
> > creates an viommu object.
> >
> 
> 
> So ended up with
> 
> static const struct tsm_viommu_ops cca_tsm_viommu_ops = {
> 	.owner = THIS_MODULE,
> 	.type = IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3,
> 	.get_size = cca_viommu_get_size,
> 	.init = cca_viommu_init,
> };

OK, may also be fine in the main tsm ops? 

> struct cca_viommu {
> 	struct cca_psmmu *psmmu;
> 	struct iommu_viommu_provider *iommu_provider;
> 	const struct iommufd_viommu_ops *iommu_ops; // backing SMMU ops

??

The viommu created for a RMM owned vSMMU should have no connection to
the normal SMMU driver? It just needs the psmmu information.

We need to adjust iommufd side to know that this object cannot accept
an iommu_domain, only a kvm fd. I don't want to pass in a fake
iommu_domain that has nothing to do with how RMM will operate things.

> static struct iommu_domain *
> cca_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
> 			       const struct iommu_user_data *user_data)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->alloc_domain_nested(viommu, flags, user_data);
> }
> 
> static int cca_viommu_cache_invalidate(struct iommufd_viommu *viommu,
> 				       struct iommu_user_data_array *array)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->cache_invalidate(viommu, array);
> }

These ops should fail (just be NULL) not reflect to a psmmu.
 
> struct cca_vdevice {
> 	struct iommufd_vdevice core;
> 	struct pci_tsm_context *tsm_context;
> 	struct cca_host_tdi host_tdi;

Is the extra tdi struct still needed? Isn't cca_vdevice the tdi struct?

> 	u32 l2_sid;
> };
> 
> static const struct iommufd_viommu_ops cca_viommu_ops = {
> 	.destroy = cca_viommu_destroy,
> 	.alloc_domain_nested = cca_viommu_alloc_domain_nested,
> 	.cache_invalidate = cca_viommu_cache_invalidate,
> 	.vdevice_size = VDEVICE_STRUCT_SIZE(struct cca_vdevice, core),
> 	.vdevice_init = cca_vdevice_init,
> 	.vdevice_tsm_req = cca_vdevice_tsm_req,
> };

> 
> and on iommu side
> 
> struct iommu_viommu_provider {
> 	size_t size;
> 	int (*init)(struct iommufd_viommu *viommu, struct device *dev,
> 		    enum iommu_viommu_type type,
> 		    struct iommu_domain *parent_domain,
> 		    const struct iommu_user_data *user_data);
> 	int (*get_params)(struct iommu_viommu_provider *provider,
> 			  struct device *dev, enum iommu_viommu_type type,
> 			  void *params, size_t params_size);
> 	void (*release)(struct iommu_viommu_provider *provider);
> 	void *data;
> };

Not sure what this is?

> The TSM disconnect path will now fail while any vdevice is alive or
> active. 

Yes, that's makes sense.

> Destroying a vdevice will unlock and destroy the VDEV. 

Yes

> I think we can also unmap its MMIO mappings at that point, provided
> we track the mapping requests in a list alongside the vdevice
> details.

The mmio is owned by vfio, there should be a handshake in VFIO to
remove mmio when it becomes private, otherwise I don't think we need
to do anything more?

> All CCA operations will use pci_tsm_pf0::lock, though I think the
> locking can be made more fine-grained.

Sure
 
> I will send a cleaned-up series so that we can review the code changes.

Does it seems reasonable to you? Was there any oddness with modeling
the vdev/bind through the viommu?

Anyhow I'll look more closely when you are ready. Thanks

Jason
