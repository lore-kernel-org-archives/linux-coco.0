Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D394973BF
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946398; cv=none; b=jszZNOT6IpJZAOuU+fPy6zN/NSGBX4icm6gGHvibUW5LEjGn1CL5fQouKksH+2ZzX1KWM7eLdBlRh1i5CauEZOVhhXrLDtuBN8o7+uS64UkfTwEouU+WiQlHkaRlz3gj9bei5+/EOpK0BtqS2g8xPmbg3Hiuba5TSqBUoeyAwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946398; c=relaxed/simple;
	bh=OxoSJ4srJKDimtpmkHPLj3pXrTAzJqY42lZbitdgufg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDzLG+2x06TxQXwmEKoUHdXfD5zzD3jHGm+6rgTbKe7EklH307C2NJAEhwhPq4chbbeDdPfR2TCmzlFkZd/DY75b8c0FE49CMCegB9DYYjxBZd0haETR+2Fd6YjrvYTKHElGCXaY/7RwTQn3bc8oM0u0VWgM0UWAyvQ5i5iD79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BxEPJwlp; arc=none smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BxEPJwlp"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea9118159so1941503eec.3
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790946384; x=1791551184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1eeIXXEBO6PHS8yDF6wQU14zHl2iX5iGebTQR/5ZsM=;
        b=BxEPJwlpUKi9xI6nbQwO7IB0KzGwoU6hW0JPBdxWfL+G5xoQgtUOiY2xAtrqaWVq93
         pRQyo6q2SV+GbkGp12LGB5pyUABhKF9IOSG+pYRV62Z1N6J/B/nJpO1DpDwMa+Q6nHnc
         vs2q0izypTwPEKEgYTktS/QUh2cX47365Plmvgb6k3bfsh4UkzH8Ju+fgz+Ko1EILEB0
         F47UQLJfzTr1mepjgoLmv0C2TSLE0LVggHhYBD/EBIc4bCkSmJlilk8Bv8LBJHW176gk
         O1IzXVguvDsvvBeiAqvuzTtzHy8QOrJK8StpSbEO09Gu6Elcu6+dJgjfL43ZcRCCVfEY
         a1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946384; x=1791551184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1eeIXXEBO6PHS8yDF6wQU14zHl2iX5iGebTQR/5ZsM=;
        b=rXaWydV06w7IVegh19B1E1iQJQFY0sEpiafxUm+Ddcanj2rxFHRG/BaZNRNxMjLC1C
         5atEP3EGse0mglqNwydH+xL0B5tsfwBBbSUeTD+msjD+GnH8cw3l1e8SVnuphBw8+leN
         5HCwj2TEbIog2KlniSotMrASs8vRczebKjlmfonbdg0L5W5bd6q5/MJR4bruPIIuY1zJ
         jfqX/pjpiHFU82V4sxOX4aau2xqaHn1TSWopMpgkhgAc5To1QZstfZ4D4ElGjLk9ChHG
         McETsRppDlQK5lx895yzfdeI2ItsbCywWjAAfbVbR2N6Yplb4/oGQf64ynulFUkrPwFz
         Jr3A==
X-Forwarded-Encrypted: i=1; AKwUvBznv2zOaEPo0JMhpyX4//Agc8z1IZEJSNWSi7mxMF94vBammKfSaiFmi6GUuidFNpb7eQTc4ToHmvRG@lists.linux.dev
X-Gm-Message-State: AFuF++krdwe6OFo00mkvwSGt4p8LsVZb+MG7bQozCj9qgUr6pr5yJBjN
	NkwFAM3cZP1lh8kCA/4EJPsTsS5opN63YBP0re2DipjmSnWhQ8qKe2SoIx/lyAAdYHA=
X-Gm-Gg: AYBFou0vpXQHZ3ZkRixCj8eauHTcQPgnsjKYAeYIOd9usPLX1kfjLo0LdPGV2BmpLlX
	aInBFo+lN1n1lP1ZflVfcegQs8uP+1d8sT/IK1FHxSY0CFtihnGctDVaAsBK7qjydG461j85SOe
	qOB/op/cql9UmwzpL31SMZ5OLArTJC9Q14xCHsIzD9ZY7wiEJtzcsmuum5y++SVsejQZ/kXUhul
	3F889XKbkZMZFS9SBIKZK9sGQovaaHBPHJlLkompaaRXkpnz3X4iddVssK/tMB4qHCUeqwhd2jJ
	qx4W0qlcczcgFknBuVKXSiqLOIgcBhfnPvmpfZSZE1aSPmqp+tN5NomGVIOCRHyH97Ho0VLoves
	Yaq3nsJKLpeEXOUlf5xtxlaDMzRQ7ikMlZi1U38wcru43JOzOjIRBWtgvUUM8ztCIj3JMw8Q1EC
	29nteTN6DFjtQ555tg10REs5QBD2+ola4g5hwQp4rGwfab
X-Received: by 2002:a05:7022:1587:b0:148:c6ec:13b3 with SMTP id a92af1059eb24-14f5b71069amr3573874c88.17.1790946384348;
        Fri, 02 Oct 2026 06:06:24 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f46da52aesm5332231c88.10.2026.10.02.06.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:06:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCcxy-0000000GZnx-1o1m;
	Fri, 02 Oct 2026 10:06:22 -0300
Date: Fri, 2 Oct 2026 10:06:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Sonang Patel <sonangp@nvidia.com>, linux-coco@lists.linux.dev,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 11/11] PCI/TSM: Add reference-counted contexts for
 vdevice providers
Message-ID: <20261002130622.GB3481470@ziepe.ca>
References: <20260917140159.1163281-1-aneesh.kumar@kernel.org>
 <20260917140159.1163281-12-aneesh.kumar@kernel.org>
 <arq2Ql3-q9EApe3X@sonangrm.nvidia.com>
 <20260928230834.GL163130@ziepe.ca>
 <yq5av77ktyrs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5av77ktyrs.fsf@kernel.org>

On Fri, Oct 02, 2026 at 11:44:15AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Sep 29, 2026 at 12:17:30AM +0530, Sonang Patel wrote:
> >> On Thu, 17 Sep 2026 19:31:59 +0530, Aneesh Kumar K.V (Arm) wrote:
> >> > +		if (is_pci_tsm_pf0(pdev)) {
> >> > +			if (pci_tsm_disconnect(pdev))
> >> > +				pci_warn(pdev, "TSM connection is still in use\n");
> >> > +		} else {
> >> > +			tsm_remove(pdev->tsm);
> >> > +		}
> >> 
> >> What happens if the PCI device is removed (e.g. sysfs remove, surprise
> >> hot-unplug) while the vDEVICE/TDI still exists?
> >> Since removal cannot be refused, should the remove path still force
> >> the unbind/unlock?
> >
> > vfio prevents that. It currently will block the sysfs remove until
> > vfio is closed.
> 
> This came up during a Codex review of my patch set. The question is what
> happens if function 1 is assigned to the guest and function 0 is then
> removed through sysfs. Is that allowed? 

It can happen and I don't know we can do anything to prevent it.

> If so, it could be a problem because function 1 is not unbound and
> can continue to be used, while
> removing function 0 tears down DOE and IDE via:
> 
> 	pci_doe_destroy(dev);
> 	pci_ide_destroy(dev);

Ah, PCI sig keeps on giving..

The actual measurements are per function but the SPDM channel is per
device!

At least for RMM is this a problem? It looks like the spec handles
this case the function 0 destroys IDE and commands related to the
other functions will just start failing.

So I would expect the OS implementation here to have similar
properties that even though function 0 is gone the other functions
still 'work' in that they get the RMM defined failures for these
conditions.

Basically, this shouldn't result in a TSM hot unplug of function
1.. Trying to do multi-device operations is always a locking mess it
should be avoided.

Jason
