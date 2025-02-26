Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E121B9C5
	for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575527; cv=none; b=tHDd/omGHIZ930aD9Qm8Q1rYpBejeoitKTCpcWueftohNb98G1061hZRaTSAeRln9TLA7NT5qSh8cmZrUcPYiMdpSIJxSjD156ushx2GfDT4Xo/hNT/HK5E1LN8Sppnzo1vbM/ezuXgv6JD1EWIDgIU5irTS8mWtlYVHyMDiOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575527; c=relaxed/simple;
	bh=UcN+Yc8/BXf/BDVbG/QiIbLhSfNGYB+VDmHOpxILJEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm8XkwdmOjYrovBbLO8xAiED9MEM2roM8KqVY/7tr6BmsMIj8p5WLdq7FMufsj5PrirRdnEds9wMKYGfFkDdKkTwOKHib9W2s82F3yyV2iUN5cIYnBKoqA8DJ5We3DXmAa0DUc8AsV3nmSEoi6G6EMQUF0F/w8jMv/JCPmOJHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TXmOdZV7; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TXmOdZV7"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08fc20194so1129017385a.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1740575524; x=1741180324; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6Xk4LHq+vuxMrWb9QEhIjcrWUMHuvgAEq1BuTfNkWI=;
        b=TXmOdZV7mbSQxOi0t5SmHpwZposQlX3dLoTnfAGtdjUDO2qJnX8bwJqVDzxgzHvP+r
         J3J4wtJXgfe1nVIUMp12Ck9stYqwPVJ7m1Vm4/4AyBZSzt3NEW0MZC3EuKtWVc1LJYJ8
         jFjLgsWRZxElwiJH4oBy8Ybxaz8ty+ZQG61BdSlZq+ERA2+EimPK488o3rVOW3fr3o3o
         xZY70UugOJC3WhFpr0NrS939wdksGf28M4ofvaEvmDP9vRgQxY1OQ4TGF9xCUpQVz5TL
         Xw2VoyMzfEV9ku07cg0i2mlb8g9yEjk6QASBUUaaudbX8gKlRxYwcf/RqpC8qZGfhGlm
         vedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575524; x=1741180324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6Xk4LHq+vuxMrWb9QEhIjcrWUMHuvgAEq1BuTfNkWI=;
        b=olyJbrzYNmCWudpkR6IYnavTcNv4QNQLXe6juZO+qvlO5rVs3hVTBcwE9+RkvWEuaP
         bPPmg1TAHU1HsXBo+vKtFbXMtGjqCKUUAouWcYNbXRBvpFYE9V7W8IM6UFIPzK24OsuP
         SfKRHpXnz+MtnVORD+GV7WWyiGBBvr0YBJciluk7GixARf7k91kUEDeDvffPo6W9/kHh
         hfjfE5CFVKmC5Q8Dmzt6w+824Tw12qbzD4N1aCce1YnV8rI2p57VIt9BfOCjGkNbcHLi
         mokWS7Hu9pBXQjquATFjZU1uepUVTgN09ehjGRUZh32ffsAnNktK57rPRetj47eXU2oF
         0jjg==
X-Forwarded-Encrypted: i=1; AJvYcCW/qjCcPYwVxq2dtfeADei1g7jLkeC6gxoEZiiQ2QeP4jT3RJ0ob0bkcakRPhUlGEGlaozmbraOcIxq@lists.linux.dev
X-Gm-Message-State: AOJu0YwloqTcEOELwDITqRg4sAqWcnmuHUmT9h3VVHh2WBiDb1i1aeMX
	Br2hOVJ2a+KQ8mOvqWjy8PkpyzHDQDqA9805Vd5AmCmG0+qpwtvqyLu1Cddhfig=
X-Gm-Gg: ASbGncu7IFBe+TAQjGEHv3drajv907I0Dn8inLwevMoZvmg69HhX2BxOZ5WEu+uU4pU
	cuIEpTfHjw1e9UGGMma0039hlkar5BkAua/XsKNo9xTNtGyEmEBZy+rrVZ5QP4PYl4hiEej4Bra
	gOd8LddVIwHelBrQV26dBSZ20kVw5ShrcG24DGoKWZje6Nq5HbXAUCI6ec080BXUlfl7a2ZwCRZ
	PCeR2zyFXtSogxcoNZ3iqmj1EocBJtDeR3v6c/9Rsc9xnq7NsEPacrH1MhMAlCv7miSSnr5nvWh
	2WK++K11BCs/JdabD0EA0ky1rBspEftUHu7q4YXcayIUO/2ZV0y4yKpZZP7apsaf3AYGv8GZmR8
	=
X-Google-Smtp-Source: AGHT+IEEfwlXAvWZ2xNGVxvzUGP6nDfT13h++oyNBWTrRPp0M1zvh40QuIYqQQDMaC1/myckxEJxtw==
X-Received: by 2002:a05:622a:13ce:b0:471:f619:db45 with SMTP id d75a77b69052e-4737725caa7mr88331981cf.42.1740575523795;
        Wed, 26 Feb 2025 05:12:03 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47377e21fcdsm23423041cf.39.2025.02.26.05.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 05:12:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tnHCk-000000007O6-0KPx;
	Wed, 26 Feb 2025 09:12:02 -0400
Date: Wed, 26 Feb 2025 09:12:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
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
	Zhi Wang <zhiw@nvidia.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH v2 14/22] iommufd: Add TIO calls
Message-ID: <20250226131202.GH5011@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-15-aik@amd.com>
 <Z72GmixR6NkzXAl7@yilunxu-OptiPlex-7050>
 <2fe6b3c6-3eed-424d-87f0-34c4e7e1c906@amd.com>
 <Z77xrqLtJfB84dJF@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77xrqLtJfB84dJF@yilunxu-OptiPlex-7050>

On Wed, Feb 26, 2025 at 06:49:18PM +0800, Xu Yilun wrote:

> E.g. I don't think VFIO driver would expect its MMIO access suddenly
> failed without knowing what happened.

What do people expect to happen here anyhow? Do you still intend to
mmap any of the MMIO into the hypervisor? No, right? It is all locked
down?

So perhaps the answer is that the VFIO side has to put the device into
CC mode which disables MMAP/etc, then the viommu/vdevice iommufd
object can control it.

> Back to your concern, I don't think it is a problem. From your patch,
> vIOMMU doesn't know the guest BDFn by nature, it is just the user
> stores the id in vdevice via iommufd_vdevice_alloc_ioctl(). A proper
> VFIO API could also do this work.

We don't want duplication though. If the viommu/vdevice/vbdf are owned
and lifecycle controlled by iommufd then the operations against them
must go through iommufd and through it's locking regime.
> 
> The implementation is basically no difference from:
> 
> +       vdev = container_of(iommufd_get_object(ucmd->ictx, cmd->vdevice_id,
> +                                              IOMMUFD_OBJ_VDEVICE),
> 
> The real concern is the device owner, VFIO, should initiate the bind.

There is a big different, the above has correct locking, the other
does not :)

Jason
