Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011B24C062
	for <linux-coco@lists.linux.dev>; Wed,  5 Mar 2025 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741202926; cv=none; b=jMlxoZqzXXC7hUma2XjUjBHWPfExx0XMKRLL9/rxcV/8ASxNObyE26U3hbiRVYGTkQo1hP1OsHgT6SwZSgZAfrCPp1P8gi1yLL9qhq2Tg95ku+7QL3BqKJpRXUvgnolQqBFZt7kxF2I2AmVgOz3mxrK0lqfCgs2eA8YBAzBr+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741202926; c=relaxed/simple;
	bh=yags00HimzcK4ADiEl0X3eL1vhGMGirpJlRolnATCxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8wZe6WO9THhvmXKl16qDfY5gF+r2Vd2nkE5I2jaHYqDowWLb8qqH1EVLM4tY8E26FpKrRmqJIq3dzk+d/XTCkYJieYOgwYDAGRaXknTONObbiurDxEvm7lGaro9CLm5MUycL/AC4RAmb/9SnbNChMTmiKHEA2eXnD64IJWu7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OzyS60LM; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OzyS60LM"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c3c9f7b1a6so131368985a.1
        for <linux-coco@lists.linux.dev>; Wed, 05 Mar 2025 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741202924; x=1741807724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTrOJMautZJ74CE8chK1zIyRNkTfUPScJmXz0FQll+Y=;
        b=OzyS60LMucaIVAbE2Hoqgq/YUT5Xvl1Tevud41XU46v87t5Fl+o2s87AhWZ6uI7cF3
         zK7eMOBR4GScmv4ILwcwIU9tCp6mStLSigzeAst74ePfI3l9nN8S/WlD/H1k5D0YKVIt
         BKLoD+svFC62cqSokNFQhUXofPqEB7k9tSuF7f4Fh0OYYTiIBFdyoRX+HnE7CxFmnZxQ
         L7DZwsSRLKNL0nUitGajoH6vndQhat0RWZtgmIWbkWiVRLXEcbpvlMwnSePw0hMs+eIU
         yyP+9ETw+fbYQlhAcLG41D5/gahMDnbhGkfUu4QuUGRSckN45Dhg5gFXyvIVDV8UZP17
         PKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741202924; x=1741807724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTrOJMautZJ74CE8chK1zIyRNkTfUPScJmXz0FQll+Y=;
        b=C755CcQQYBApQK9COSk5109QhS/Ruo84ES1P7xvECrV3ny2heSVFqL+x39OOCmV7CF
         wEx00tLPldBborsBj7Ml0shnYGUM1NLPqLDWCKkR8T4SehiAO20DhtVVVsPibHocQwd/
         OrXf0tOTgtt/4xDXBcIb7yE9WMcWLhBE4au7cmDIFF0nKYFZMhAiKspC4ixv6p2NxI6u
         GGfGIixjzvoZALYK1XZn3kk6B8q6y39ITQJnHyvNVCHesPmMkP8YnB6Nunji0YKX7G0W
         6b9ArvlAdqh0TNAE6J1LW79XuiXoJFMVubDYtRnL8P5AeGjKc/Ki/gaDPDY6YUgkw622
         qNiw==
X-Forwarded-Encrypted: i=1; AJvYcCXETdyANe/gI4Lc6zk7XGUfrLKWl7sdOHn0MKYiOvKeSQGTgpmjG89mmiGjaKRpJCaVUz6TQCdzzDOR@lists.linux.dev
X-Gm-Message-State: AOJu0YynV4+VL36gpA+tIWYm2WtIT4P3jU8RSGt7f7NU6GgX2pt3Zten
	hvWSJlPASXRq22S5v5Jn38vqGyhsU5wihNvGUubOZitphXDl+DFhVcsZQM99dyE=
X-Gm-Gg: ASbGncsQSd36uvZeJR3nfG9T2Rfmz8uxw1gy5Iu4chM+G4VS7n9chQq3u3Rhwhwvu9j
	VlyJP4jd+94ARJaSHGMLj8DFjC0Aqot7ixzQtlaIJ9519+GI6yGsSswLojFGpo7xqUYPnh8PD45
	xAD379iEWsicccANtzybL96flT3LBoSEfrnFyDC2r1cGmT0Vp222TfQo3VxMv7zkHeug1WlT+6V
	J2NsA+eoSK76o002aqXgEWhDRW7q6LDOvstHTun4Mcn5Igy9wK3sfbDtwRnsrKWRYNvyJ6ruhlu
	HDdbXqvDStH8RjYXoR6cPe7AocHTjqksUyACGGnUheNQlDlm/M/3Llo1NQRF3v9hbtGbK2F5M8y
	GxXTRg1i+Uv1BI1T4AA==
X-Google-Smtp-Source: AGHT+IEHx2UVGeNJCjdCHNzkys/fqlsDci1nQ/1m9GKN7AMZGI83uk7z1IQe+K7jbrNiF4r725P/BQ==
X-Received: by 2002:a05:620a:6285:b0:7c0:b350:820 with SMTP id af79cd13be357-7c3e39b1392mr81853985a.5.1741202923780;
        Wed, 05 Mar 2025 11:28:43 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3c9f640cbsm324838085a.108.2025.03.05.11.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:28:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpuQ6-00000001VBp-37wk;
	Wed, 05 Mar 2025 15:28:42 -0400
Date: Wed, 5 Mar 2025 15:28:42 -0400
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
Message-ID: <20250305192842.GE354403@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-15-aik@amd.com>
 <Z72GmixR6NkzXAl7@yilunxu-OptiPlex-7050>
 <2fe6b3c6-3eed-424d-87f0-34c4e7e1c906@amd.com>
 <Z77xrqLtJfB84dJF@yilunxu-OptiPlex-7050>
 <20250226131202.GH5011@ziepe.ca>
 <Z7/jFhlsBrbrloia@yilunxu-OptiPlex-7050>
 <20250301003711.GR5011@ziepe.ca>
 <Z8U+/0IYyn7XX3ao@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8U+/0IYyn7XX3ao@yilunxu-OptiPlex-7050>

On Mon, Mar 03, 2025 at 01:32:47PM +0800, Xu Yilun wrote:
> All these settings cannot really take function until guest verifies them
> and does TDISP start. Guest verification does not (should not) need host
> awareness.
> 
> Our solution is, separate the secure DMA setting and secure device setting
> in different components, iommufd & vfio.
> 
> Guest require bind:
>   - ioctl(iommufd, IOMMU_VIOMMU_ALLOC, {.type = IOMMU_VIOMMU_TYPE_KVM_VALID,
> 					.kvm_fd = kvm_fd,
> 					.out_viommu_id = &viommu_id});
>   - ioctl(iommufd, IOMMU_HWPT_ALLOC, {.flag = IOMMU_HWPT_ALLOC_TRUSTED,
> 				      .pt_id = viommu_id,
> 				      .out_hwpt_id = &hwpt_id});
>   - ioctl(vfio_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, {.pt_id = hwpt_id})
>     - do secure DMA setting in Intel iommu driver.
> 
>   - ioctl(vfio_fd, VFIO_DEVICE_TSM_BIND, ...)
>     - do bind in Intel TSM driver.

Except what do command do you issue to the secure world for TSM_BIND
and what are it's argument? Again you can't include the vBDF or vIOMMU
ID here.

vfio also can't validate that the hwpt is in the right state when it
executes this function.

You could also issue the TSM bind against the idev on the iommufd
side..

Part of my problem here is I don't see anyone who seems to have read
all three specs and is trying to mush them together. Everyone is
focused on their own spec. I know there are subtle differences :\

Jason
