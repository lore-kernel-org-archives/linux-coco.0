Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783E35958
	for <linux-coco@lists.linux.dev>; Sat,  1 Mar 2025 00:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740789125; cv=none; b=CByZhmfl4vxLGZf5OIr+enQjdzSy4l8Y3A6y3JtM9MITkE7HL4Ac6MWPdceoDVvVEqLr2AWA1CvUAdJzXYJGUMwLIoHvpzV3PdQEipRsJSTNFdxZeEoz+EYLeWVL3aiask4fdtcr/BCenma8+KYxyMNHArhoS0JCzrU1VR4M+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740789125; c=relaxed/simple;
	bh=IJ/uAZ1nD5RItLsU4XWErABvAF+S58BRfovN898A/9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7fVpZF/fNlvScwSUTPCZ3G9bu4FBuFnPZbFlc/2bWcznzd/2e0fpkMJwa+UPTfII5tMkqQNaopvkyR45gR4B/NBxOZT/s3kBpp7x5g4WvM3HR8yyLTE8MjDGolI4J3WzxsFCuEZbBG8cR9P8/406niHkYYNLl1L912YK58m93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MOakwd4c; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MOakwd4c"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e88f3159e3so22150476d6.2
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1740789122; x=1741393922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGmZpux3eW+jxhKZP1ofv0c4XveJW25IwmZp9EBvmdU=;
        b=MOakwd4cgGeXPC61qMdvCd0RHYM/5MW9FHDaZwK4MiFd8I5Oi8fJksZ0gs7XreIb1I
         GajcsfZmTmijAt/6vjMEY8MnU2wiK83fWD8sE0IxYZYfoFyh+LDMAST30ituyGExUuf/
         F7TB1irSNCc8B1/FXVasmEu+rlbvW8RSx8/O//jkS76TnejCFGZgn0LMZASRjyIS1mL+
         L+cFgXTYafDo7Pnhwo5jmZiH/vrOLhNFMZQW/3nqp/tOTlWlaFA4lAoAS7bTK+9zyc3E
         cqFbyIRPBsaYpjbl9KdXeUSbjcYyfauwnGzA5e77I9AEMp698cx+PO3of5/ZgahYxrcc
         DXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740789122; x=1741393922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGmZpux3eW+jxhKZP1ofv0c4XveJW25IwmZp9EBvmdU=;
        b=ra7/gA3m4QPBbE5DxYj5lPBcEoOMA+i62GrF8h2+tmRTLZg/866V3I2u52DJC9V+5v
         awRcmjZ7M4XPhCF2lRY2QaqWu6UBkJExbKCRoaKgYutCApbtQPJ7iO7GoeEBN0pgk7Y1
         EpmThXvwsgkt8VO7NS4chzATD9uZIQrQSptq5D6yb3v9xtFETEl796cMRdB+XnTy/P22
         jpmd84uQouUytZhT4WCDyY+VlYtYeOK+hRj193wcuvQUhoqDyN2xQpddGNnXeORrDZnI
         eINBZV4GD9wHdWx93O9LknyIqTirdQUFbO7dr7vqQx9HIKbjhZfBJJamOshG3XF3s0cK
         eBFg==
X-Forwarded-Encrypted: i=1; AJvYcCW5bqmaHGsmT7SYtciurVeGvCKMKJpXCVZuZM6QZYJbWQEuCBwPss6fn6Ir4CesqDyB28cHloJqajam@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd9/73cXaRT0yWRPxP4te8+0ey1A2iAz/FDWVqYHSRrorJ+B9H
	BY5Zoc09D83wb62Ni2u/I4PI9xQVMkE/jSS/TXQWRyMWhYSqHW/+m5QHF0xMSKY=
X-Gm-Gg: ASbGnct0qzapEda17XjpoKY8DDfLdL4KGghmq999t6xNcD/+jza3AL+eHUOR5AhYTUe
	zKjVsIr8krtPymLBVPcoW0pDYTQfWmw65SKHwT8iDYx7IOYe6saJYCPZjh8Q402U4ljbz/HUtil
	fmRm0a63WBqwo0stP0AM4lUZJFYzs47yDPmMdxmTf6PbzyUf+1bj4Aq8EO4Xe7eK6AN7blCkqaP
	Q0b79l3mE4mc8WVwrF7/uEwzj/nGsG73YSbVi79paesDU5OIR0mbFduAJGJjpVtVJPOSfmVY1/J
	WBh+Rzub+Rl76Zh6Y/xPQ0CoXYpyz0GKmmLJ/clM8zhnDLsxxq0/HuNz9PXXYfRsXhfJP8L7j3C
	8KhLrI7GsvnoQasUUQg==
X-Google-Smtp-Source: AGHT+IGisC/6wMYSFfGCwksz3Hqk310E6+QHChS9Lt2rzSb1IaRmOie8VRdlWltqdIKsz9jGOQcrlw==
X-Received: by 2002:a05:6214:2586:b0:6e6:617c:abb6 with SMTP id 6a1803df08f44-6e8a0cd3b06mr68816196d6.6.1740789122305;
        Fri, 28 Feb 2025 16:32:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e897652066sm27657806d6.30.2025.02.28.16.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 16:32:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1toAls-00000000VPg-3Ini;
	Fri, 28 Feb 2025 20:32:00 -0400
Date: Fri, 28 Feb 2025 20:32:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
	kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
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
	Zhi Wang <zhiw@nvidia.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH v2 14/22] iommufd: Add TIO calls
Message-ID: <20250301003200.GQ5011@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-15-aik@amd.com>
 <Z72GmixR6NkzXAl7@yilunxu-OptiPlex-7050>
 <2fe6b3c6-3eed-424d-87f0-34c4e7e1c906@amd.com>
 <Z77xrqLtJfB84dJF@yilunxu-OptiPlex-7050>
 <20250226131202.GH5011@ziepe.ca>
 <433217be-55e3-477b-bc10-cf81f02ab21e@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433217be-55e3-477b-bc10-cf81f02ab21e@amd.com>

On Thu, Feb 27, 2025 at 11:33:31AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 27/2/25 00:12, Jason Gunthorpe wrote:
> > On Wed, Feb 26, 2025 at 06:49:18PM +0800, Xu Yilun wrote:
> > 
> > > E.g. I don't think VFIO driver would expect its MMIO access suddenly
> > > failed without knowing what happened.
> > 
> > What do people expect to happen here anyhow? Do you still intend to
> > mmap any of the MMIO into the hypervisor? No, right? It is all locked
> > down?
> 
> This patchset expects it to be mmap'able as this is how MMIO gets mapped in
> the NPT and SEV-SNP still works with that (and updates the RMPs on top), the
> host os is not expected to access these though. TDX will handle this somehow
> different. Thanks,

I'm expecting you'll wrap that in a FD, since iommufd will not be
accessing MMIO through mmaps.

Jason
