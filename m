Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505212;
	b=Lb0vP9fXzuQ9C9BqOU3LhKmlELFFXMUWkmemzOdIT1wcHI2wpBIDsQiMUiHncgJmsvFh
	 tGwPmYr6LrbYc3Ui6RsY/RT7GVQcsBcd8Quzhkn49Bq0VH9pyzIHio7/8/g5jQje6YtRs
	 0bdTO2SA7g0vYauvJuhMe3ReuE4A8RO2Hgg87ZkLhUCwZ2S6mvi78qZWezMwEOwqKx5Ws
	 6CUOZT1kBk3nlGhrT1Z4B7jYl9fPG4WibT1ogoOSS9Ju2KN8XqfmrosdpVcSiaJLFIYSp
	 JujGvUxQuRBPeZxAprmq42TXevOZDExRnPsGY29PIwAFgXfWYOezamSrcc8gynnX3tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
	b=hrR3iUHLES1aSwq2ffgGszOCeqd2A1xkP229ikB1/ol8vmgHFMww8b5hg7Lk2lWV6MMB
	 MHDudFt9M6ltrywiYUStimD3rAcDJq89LAv4k3Q3cybIBeG5WUcmjYlbo56kAH95HYXLV
	 Wi+yM5vklguI1/jA+gx1mWGNf9vVJk5ED6+vw4s7GGG1w9SreiOUKnfusVs8T3YcHmUNl
	 e+DyFdYwDp7KP4sLTGjmV+x3vxNv5X+jpQogKIBp6r+oNTYjWL9It84lgsDDpmof0LZIq
	 M1T9hOxEp2UzuDtfE9xfE5rnWk7tip4dfRSzZBn0UFsBubsitsI9o+I+QOWlt8rDseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CqV1uTWZ;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF587606C342
	for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF587606C342
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CqV1uTWZ
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53397554beaso42712281cf.3
        for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794505211; x=1795110011; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=CqV1uTWZLD1L9NUEhI2miAOIlg2p8ADhRgdBZNi/jB7KVrktxCFGZpG8aV3NgcbXFZ
         OWgv+DZIi38KQK1QkKH/EPpymiyHVP6eSTndDzO0mDx9EIhPcaU0t2FcGvuWY14Mc7UL
         +iu0irxg40LxiWHzftdkFD4EdL7cciS3GNDvQZSBOoArB6mvY+xc4KCU7W4ARensaN3k
         o9BP3qpEgCfhrdYyRG154oTynuTKUvJTnpTfsZYLRRwgsvMJAB9avNyfMHd25Hp+C3tx
         uE6U+CLgzKTkdnjvko4rr/YkqM4vS7ZgUrm/w0Z4EUbzumidhgmrpKIdLrsMB043Ubc9
         EXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505211; x=1795110011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=DAakkgOWGju2eb1+y3w20FOdZ4T4lSko305mp5efI2FLxUuhfQTQyYqeRSAX2e0OdX
         dkOfgI5A8HHzuPWFtF9RapVOmsNeRDzWFZVVe8UID/NkWxlBYBVy3cgWt8VrXWlhpfrx
         ScwFTWMF9jKUGVujYztLy4d0CI8yZniCiXC3WjWunEYWBIr60SHuK1VCOI5qtmcLYEz2
         bvEJRqP6nXaJ09l8zx1tyXr7rzNPLN3qX5iemlf+h75WUxUKswRp5PEpTlURBFQI/MrY
         IEv+iM4w+qeGYmXVg0NuE6Sx3xvaFkIz8dwZgrMODUOHGHNIT+WSPu8AFw1G/O8S/TPB
         ZJsA==
X-Forwarded-Encrypted: i=1; AL+hErFRgAICj6EkucYUD0BQCc0oUxjWt0HYkujLbWgzS8xKftnCMW8FrC6euhYVYR/N0sJ4d24NKISMUGfN@lists.linux.dev
X-Gm-Message-State: APuU4Z+XRSZ5r05VeLdgvdpb2ppvsHyuq1jllVKhmT0aNcIF6Ta4itfF
	/W0iu4hA8EOgHNkWQ3mXSZLjdfkMrco97lOrdPIdid8uCmE8LNzheD8wFWyGEcngJHw=
X-Gm-Gg: AYBFou3KzPEO0px7aO0A18DwAW7vPvub+vvH6ypErVtReYrE/wIy1E6TrDNwT6ihrKm
	qTARMiUdoltfxNlm/9V0CrWYGYt9tKZWNVkWNqnmYdMgQSh//VubculjgB02bqmErFYMJA17714
	CyL05b53kKhquVRm8HCotp9jZTfHU2gPO7TgtlsIugq6vjw+LztlrF5SFwMjvw76qbwn2wXH53S
	5wcoQZ/AfvGuYo8eH9F5C4u9ntaScH5L5JcF8PYZ7CPhSypLZ8Ch0mRuj7X6HHezBZLx1pc9lqM
	AyPJuIUVt+pBNSvc5oiySTvp26plbCL3SdY98AKlD6DIrBpn4RrUnkUux7gxrWuM9Y6KfYzxK3H
	78DnV06X8lg9lHZGEJKWAq+Nyc92YsXgDLfNQwRzunFqsUUVz9ZDmTkDdtODUFLGqZl1/7ekbOg
	piFTB6d8qedqcjpEh/kXAoJ7r5C3ytPsLJf736ZA/AeLI2V4vUgVf7nyYYcXEhA4emc4Di5+OUg
	CZfWGmJikj/b6IiH0tUDPAuoW/qOK/kH0z6hm7lJ5QNTwCcuKSxmQuPzxlrvs09M59eQgZmH95o
	ihVcjA==
X-Received: by 2002:ac8:5fcb:0:b0:533:8e6b:260e with SMTP id d75a77b69052e-55ac78597d2mr1668441cf.31.1794505210728;
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm890336d6.21.2026.11.12.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRYmP-0000000FjX1-1XQV;
	Thu, 12 Nov 2026 13:40:09 -0400
Date: Thu, 12 Nov 2026 13:40:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 06/15] iommufd/device: Hold a KVM file reference for
 the device lifetime
Message-ID: <20261112174009.GB2532299@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-7-aneesh.kumar@kernel.org>
 <CO1PR11MB4835982DE81AFE060EEE01B88C762@CO1PR11MB4835.namprd11.prod.outlook.com>
 <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>
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
In-Reply-To: <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>

On Thu, Nov 12, 2026 at 11:25:46PM +1100, Alexey Kardashevskiy wrote:
> > > Once the remaining KVM file references are released, a later ioctl on
> > > the still-open iommufd can access the stale pointer:
> > > 
> > >    iommufd_fops_ioctl()
> > >      iommufd_viommu_alloc_ioctl()
> > >        iommufd_get_device()         /* finds the surviving device ID */
> > >        get_file(idev->kvm_file)     /* accesses the freed KVM file */
> > > 
> > > Take a KVM file reference when binding the device and release it when
> > > the iommufd_device is actually destroyed. Release it before the igroup
> > > check in the destructor so that bind failure cleanup is covered too.
> > > Document the ownership in the bind API and device structure.
> > 
> > I don't think this needs to be fixed. There is already a WARN_ON()
> > in iommufd_object_destroy_user() and many bad things could
> > happen afterwards...

Yeah, it shouldn't be fixed like this.

Either we need to rethink that warn_on path for some way to actually
wait forever or we leave it.

AFAIK nothing here is going to make that warn on trigger.

> > If we really think an ioctl could take more than 60s in sane scenarios,
> 
> It is quite possible when some TSM operation involves (in)validation
> of hundreds GBs of MMIO.

That won't be under these locks though.

Jason
