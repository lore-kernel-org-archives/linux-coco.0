Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3E20AF7B
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523425; cv=none; b=Z2tFeIoyPFleAsMrnhpx4qcRi9lBTf9ZclwBwlmK/KFpWKED1pYOdx8iQbZWhshHknhf1HeQUtCNK43dvIM+VjxkpyoCojIl4YsS4L4xMelladQPMdId71+yCrHqqwyiIYOHP9qsNMyafiCNXJjk5T0wwEDxMTEfG/gq7+Xs03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523425; c=relaxed/simple;
	bh=xnUsRAnCTM6iow/f/UCejEdDYoiWEl5F6w3kOCDrBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFt/JWTEJrqCLR9eXwqAklRaNQzo37WsWPGfBwNuv7gBemRuLmHK/gCtVUltCeUA2XMB639ESvrSTk206+b0s5xSwSlY+EA2qIVRbYlXxTET3unutR2F6DfLPBsS+Q5ECdZifwcLAC97VYqlVXt7nTAzn97ZVhwgfTmkk0ryPh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=l9BC5LMG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="l9BC5LMG"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c55b53a459so596128085a.3
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743523422; x=1744128222; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUIWAEN6Qyb8+Hz58OV+4wJouq5dad93BnZ8Do0foZI=;
        b=l9BC5LMGYvsEge/mFcYl7L7meeRNtLQM93U9DYgQO9nLOjsrLOIHlaX0aqbfHcjIGD
         7nITP+WNSLL/qA6MB3ps1q55oKD5i8Ax1L9F8ZcJf63pRplqVYNiKrjNHUA8DRJYwrvy
         rEF+ptbHoqEHDVWBLjLZdTIVRszVenSnoeylqBqg4BQnY5BqBvCxjecIJR0BWeJL76xd
         x1vCvCdAKJuYH7V9fzVoUNkmj3vIPi1Im1OkdAuixLn8ptzSTz0x8J7F4uSCFLqxQZS/
         15YEhJ+/NS3llH238a4iRq4Lzae9RFq+43sm2wm7zT1Am+FeNDZ7dG+EtXaiCEqaYce1
         3Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523422; x=1744128222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUIWAEN6Qyb8+Hz58OV+4wJouq5dad93BnZ8Do0foZI=;
        b=vqdSxfBO/RWPo1P3DxkB0qbdDmIGrTHrZJUkhBR2AS3AF4VWkAFcb+vZttCCLa9rxq
         dUiLPBto2rIel9EBw50hnrvvHVb/csXvTAXY7raZPCdVjlsYXk9yikEzmSsWWDt9MmgJ
         EXOw/UTDNIowoAM0yBlYmSH3mzMLKWVW9dhVoRXRVhl8r4fCOdd29kImtwnHVLMzPk6M
         oCfbAoERDV5GsY9s21nRVSzD0dy/7IZQ0ZJlXYusqgiZrVab/r3Xu0Axt4GzTobk+gD6
         ScdU0affJJ33m7rGZBHDt8ejxSpHL6HejuSnTb6LJvbw1Bg0fgCGy5fgCPcofYP7YVr7
         aM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVIy0x3OSdnmE4mxToq4tx38qQQLNHg5aKxZtL2tk8x06GZjD8bGdafDmvlrcwSg0dJmP9Z9NfDOHV@lists.linux.dev
X-Gm-Message-State: AOJu0YwC7UUXL/SlTqOxx/b8M3GhciZ8iATiKuhaYrej4IxF4p5PmI46
	DYqnWYKJwEkuzopj5GWMV6MLySIpBWp7+CkbXg24Axp31Ee/ntdgtPl3YPju/eA=
X-Gm-Gg: ASbGncs9VRrLjVRrSpQBGzth0VR03ZijmHQD7AqxvxH7c6kPUYMAgSci93mKTnBF06d
	zCrvpJgbTpwT8scZLbdYFhTkj1kHEE7b2gopd4pIskwUwtSnIc1iKtSxs+P+OZCIfj3zY2SKX+Y
	u+r4vXdadTopm/i4BZ6VIy4m4c2h3WK6DCVFmxnVIDaAQjXEwcxnQDmZlwyA/fsz5GSi7v7t9fM
	Q7lYEW2JsD1D+5mdd6hZoDFO3aXDZygUGrfCmBgaRb8LjDxFxVe75VJoNKoobXxYp/lwMk0s2ZL
	2NykuKEM9ATJSupovvFohuE42Vzi0xzEdlcRKImUJnW8wNiK6b46RNWpaIBs/pw9Co6dBcNE9g6
	M9gNVR67u3lPx/PYt77EPhm+zI3UpESAWpg==
X-Google-Smtp-Source: AGHT+IEK38CnaMLkGKnp6wFhyTba4uVPU2YkYY6SqmlutfADek1SIeamjKZM91laT+FptTnOqcHgWw==
X-Received: by 2002:a05:620a:2551:b0:7c5:6045:beb7 with SMTP id af79cd13be357-7c69072c8b5mr2068616685a.32.1743523422038;
        Tue, 01 Apr 2025 09:03:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f77802c0sm673482385a.104.2025.04.01.09.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:03:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tze5U-00000001MIe-3oUm;
	Tue, 01 Apr 2025 13:03:40 -0300
Date: Tue, 1 Apr 2025 13:03:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, x86@kernel.org, kvm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, Nikunj A Dadhania <nikunj@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Dionna Glaze <dionnaglaze@google.com>, Yi Liu <yi.l.liu@intel.com>,
	iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	Zhi Wang <zhiw@nvidia.com>, AXu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v2 14/22] iommufd: Add TIO calls
Message-ID: <20250401160340.GK186258@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-15-aik@amd.com>
 <yq5av7rt7mix.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5av7rt7mix.fsf@kernel.org>

On Fri, Mar 28, 2025 at 10:57:18AM +0530, Aneesh Kumar K.V wrote:
> > +int iommufd_vdevice_tsm_bind_ioctl(struct iommufd_ucmd *ucmd)
> > +{
> > +	struct iommu_vdevice_tsm_bind *cmd = ucmd->cmd;
> > +	struct iommufd_viommu *viommu;
> > +	struct iommufd_vdevice *vdev;
> > +	struct iommufd_device *idev;
> > +	struct tsm_tdi *tdi;
> > +	int rc = 0;
> > +
> > +	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
> > +	if (IS_ERR(viommu))
> > +		return PTR_ERR(viommu);
> >
> 
> Would this require an IOMMU_HWPT_ALLOC_NEST_PARENT page table
> allocation?

Probably. That flag is what forces a S2 page table.

> How would this work in cases where there's no need to set up Stage 1
> IOMMU tables?

Either attach the raw HWPT of the IOMMU_HWPT_ALLOC_NEST_PARENT or:

> Alternatively, should we allocate an IOMMU_HWPT_ALLOC_NEST_PARENT with a
> Stage 1 disabled translation config? (In the ARM case, this could mean
> marking STE entries as Stage 1 bypass and Stage 2 translate.)

For arm you mean IOMMU_HWPT_DATA_ARM_SMMUV3.. But yes, this can work
too and is mandatory if you want the various viommu linked features to
work.

> Also, if a particular setup doesn't require creating IOMMU
> entries because the entire guest RAM is identity-mapped in the IOMMU, do
> we still need to make tsm_tdi_bind use this abstraction in iommufd?

Even if the viommu will not be exposed to the guest I'm expecting that
iommufd will have a viommu object, just not use various features. We
are using viommu as the handle for the KVM, vmid and other things that
are likely important here.

Jason
