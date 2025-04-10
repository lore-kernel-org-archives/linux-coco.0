Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E44928C5BA
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290336; cv=none; b=O/GxLx0VMayqhnSa5kYpp6FVPbdlMKc8KtOB+iSzFfSvFm+xYUp8eHE3iVWemNTEG/iUyvCaQhge7+YmeFVTaGbWeWCeMGEDqmux/q74fjeZZBj5x2VhTKeiDEc4T1jkTsuMa1DG05wvezjB6b2fdFLKeThyXlmSHG4GkbVFZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290336; c=relaxed/simple;
	bh=HMR9MCdcSh4ghNXN2PNjr8BtDW52Pk7L9AMhE1YOGEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnZdW8S85P2Slt0CD2ULBc648YalVqsASCeTN74wHTaorD5ha/yR3zRQsbTg2fTXhz4mhLnOLF7EcByF0n+O1B08LGaiK1vMbbs3ke0JpWiDMX2wojIJiWbpUR0ZyEv8TNH4fgWMAKjfudkWpc4x4RNX7uqaedFBU+553vVXvmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OsTnzLcN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OsTnzLcN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5a88b34a6so80493485a.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744290331; x=1744895131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHIQ/++9W1bwFwjTR3scNHhBiiv2Oa9aNs8dRl0dl1I=;
        b=OsTnzLcNJplDvhcrb4iiB1wJ5UrrJoPmzEzoB67wS4c7SBD4ARv9JgYmqe8GpkHH0w
         RZN23wb15Sq1dsXbyvTpG0nlDSLBK//4J0w/T4qhMZ13tOYRKioK7i/6BXSozhcwzRDO
         qeHgUifrkssEXGnL+btT0J/BCoHCwbKkXvhoM44mT9fUj/ks5yo4gg1+AQ0Hvt2kCn+V
         pq2eg13wHtZfStvO+7Y4NO/A8AG02lEeeFr5QSO3dCRkrvYL9na/KCoLymwMWOrwGFzX
         iM4i0UPvrMBm2+mDJKKnCtFnnMnjOqc6JDAf1drtr/HfneZ3nI5FClFRD/KZ0wm+WfqK
         /kYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290331; x=1744895131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHIQ/++9W1bwFwjTR3scNHhBiiv2Oa9aNs8dRl0dl1I=;
        b=DuK9XChYviitIZ9EjD6aaFyeSLedKlvRc78CH2w+6J2fjVMcA6xtIjnZgtKx6KewKe
         5Z3LWNE3YR3E5dDRnwLt5vNZCnDglP06e9JV6gifzH66mhucslj+Xtluv5ny89ktBiBY
         rN2Q5bWQYtknSCwu/CUAvOPhMc4j4LU/QyUAV490q8qx7taWyhIdB0Kwr+J2FYuDiQOc
         BdJT/ZNzItWNazKcin9vxSnovHRsqx4dMZFDSjuiCcQmjdPZKLg1p7GgBnJ4W2Wp4/Vb
         DvJo70dtX3YtKpGMhRRtRBIbOls4EABXSaiK+u8xd7bpVarGv89FIwIPWc0RQsyfBcFy
         +wsw==
X-Forwarded-Encrypted: i=1; AJvYcCXWxfanLh924E+2gNUn4OtZmWjkUODtLCgQlE8SqF4aIySJ2FoobKmTLE9oPtqQ/NJ2PI4ThKCpDw1+@lists.linux.dev
X-Gm-Message-State: AOJu0YwGDB+hcggqnjTFXmgBbaqiz8JJc2LVwEdGjbpSHNrC0+RJY7TM
	IzoRDfuy/yMPOl/OI7o0r17dVIOMMHmonWB+VDeMVOzFz1I5gtkv0+p5Kqp88OU=
X-Gm-Gg: ASbGncvIOimqh310PUFIkjUhMqiSQDy/TyxCb587U3Z8fuhbh3pS8JOMrDHz+5TLS1b
	KuzkGphptOepIeavOvUi2CBwmFcl3jw7g3zBmmKI9aku2AA2T8bip9xOO3ev9goocR+gfC9TtI6
	0EKFVYYRvyk5bmuX2/GLSm9Or7KsAquipnFJhx6VzteKePyWtPxWrqfXUDGM0cZLeHSREPsmzuw
	ni8a1RCq0FDaVkKzuWkiZmdJqTOZ0Nzf8stdCYAmGE/mjc/TMvPZSZXvyM2KIyGw2+GrmsDIPmp
	Qh5P3IdgxIJxWv41KgVKWTbBLC+TKL/zUw2VzyhBZhhtPyvgymE4VWZKW8a/aTtMQPRDEaC0XMJ
	tPRt4jZwY/VNYvktXErI=
X-Google-Smtp-Source: AGHT+IG4IzEnrtMNm0AmTZUaqXGTX04b5UW6VZBKQK8VGv14pbPLZJgnECNrc0NUhMe5YZKTD9kaag==
X-Received: by 2002:a05:620a:2445:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7c7a76d3503mr365847885a.50.1744290330960;
        Thu, 10 Apr 2025 06:05:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8969f1asm82420785a.59.2025.04.10.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:05:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u2raz-00000009aH7-1871;
	Thu, 10 Apr 2025 10:05:29 -0300
Date: Thu, 10 Apr 2025 10:05:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
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
	Zhi Wang <zhiw@nvidia.com>, AXu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH v2 13/22] iommufd: amd-iommu: Add vdevice support
Message-ID: <20250410130529.GE1727154@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-14-aik@amd.com>
 <20250401161138.GL186258@ziepe.ca>
 <b051dcc8-58a5-4f24-8b06-e817e9762952@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b051dcc8-58a5-4f24-8b06-e817e9762952@amd.com>

On Thu, Apr 10, 2025 at 04:39:39PM +1000, Alexey Kardashevskiy wrote:
> > > @@ -2549,12 +2561,15 @@ amd_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
> > >   {
> > >   	struct amd_iommu *iommu = get_amd_iommu_from_dev(dev);
> > >   	const u32 supported_flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
> > > +						IOMMU_HWPT_ALLOC_PASID |
> > > +						IOMMU_HWPT_ALLOC_NEST_PARENT;
> > > +	const u32 supported_flags2 = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
> > >   						IOMMU_HWPT_ALLOC_PASID;
> > 
> > Just ignore NEST_PARENT? That seems wrong, it should force a V1 page
> > table??
> 
> 
> Ahhh... This is because I still have troubles with what IOMMU_DOMAIN_NESTED
> means (and iommufd.rst does not help me). There is one device, one IOMMU
> table buuut 2 domains? Uh.

It means whatever you want it to mean, so long as it holds a reference
to a NEST_PARENT :)

> > You can get 1:1 domain objects linked to the viommu by creating the
> > 'S1' type domains, maybe that is what you want here. A special domain
> > type that is TSM that has a special DTE.
> 
> Should not IOMMU_DOMAIN_NESTED be that "S1" domain?

Yes that is how ARM is doing it.

Minimally IOMMU_DOMAIN_NESTED on AMD should refere to a partial DTE
fragment that sets the GCR3 information and other guest controlled
bits from the vDTE. It should hold a reference to the viommu and the
S2 NEST_PARENT.

From that basis then you'd try to fit in the CC stuff.

> > Though I'd really rather see the domain attach logic and DTE formation
> > in the AMD driver be fixed up before we made it more complex :\
> > 
> > It would be nice to see normal nesting and viommu support first too :\
> 
> It is in the works too. Thanks,

I think your work will be easier to understand when viewed on top of
working basic nesting support as it is just a special case of that

Jason
