Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D03281526
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830995; cv=none; b=qVt27oDBnkDk28NdNZfW1q0xT9j8XN6VR9hGrPnSSvzXgUaD2vPrNAWxyzEMZeECB7aYTDD6XPAA+TPVWkdqWeZJtIBfoZWzmP+UQ2Y+SQuXnFzi+6uhmpC8Ct7DxE9ipApQQS6M5/xiVQJNHSAWTSy0cUDda7qS3/enHm3FSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830995; c=relaxed/simple;
	bh=bq2RlWHsFjj3W7R7JIUlOjH7x9ItqrAb031ifSmshcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/4sIi7jGK8LvXc9/gIIBUTHAomUDAmFUMHdjrE3xpNvhh5xnpd+0ls8p4zFofnTggqRxEXDaXA70CHGJMup3vZJ4RgC4UdfC9wa5O7TF6vAC9y+VuXExIDvREk244NIOrJXDs1DpJzGF+xQ09j0ID1ZgV01FReEaWu/dHFqOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IqLs4uwr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IqLs4uwr"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a9bff7fc6dso4328901cf.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 16:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753830992; x=1754435792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wQLLnlIOT2tj87satzYfNp/smzLn3IXRBaMhgwLr/E=;
        b=IqLs4uwrpMIEvDL+gxlCeRy0B7JMz2yapAtefYX+QlioHP0NVktmDjZbBm/kerE/8c
         +40J51DZ34/F49NYqYxCqjR9yUaMEUbYo+yBEzGb+FdEA+wv3oARZE/Sa5V9YY6Wb/Ib
         596lhmjBcYvOSgSe7y3Rg350z4PcVKAET2CkgS9A0Id9ezGPSLJrDlWCXx1dOezZLRyc
         lPh0aLZkcnaaPuNNZ6DgfDlJV3yBZOWUVA5p+NwIn4sT/agSrC65RK1/PKwQC0sWAvkl
         IvxWEpy6MSSswTF44+tgkKWsJszYfR7IFsZLGFhJix81PznfKCOxyjT3VucbpWLGTRI8
         4txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753830992; x=1754435792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wQLLnlIOT2tj87satzYfNp/smzLn3IXRBaMhgwLr/E=;
        b=bGx+CC2ZrSSN9gRFOta7q78RMSsYAIlbfuEwSzoNTc9RxYpCexOTvUQ0Bfh/VVajvG
         zhzCd042QbcRQl7u9He9fnpqOwv44d8RjbkrSPAyB0S8Ytis1QBh4n6IrBxZibTUB+DS
         ch8OMrIwsnj+lb+GhKedyfU33Z84+iVST2F/xEt4hWQkvpUesQ2iJB0RveSZ9pE5j+GB
         iFtB+2UzEr+CAzY2mGxV8awUBAr/gT7/7Hpm5frhnUjpc1sAUe3aMOqmHQ/HJbKTZDuK
         i5e7/ZzJwYVBrOxusU0DqyJRZd1LR6JM7ouDEq7y8jK8CpqZYvyFKZrN+OzQdDsaScjV
         3ToQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEZBDDrykSvoqABOB5CMvqTs4PinRwjXPEBAgrjTNO9YfaAdXltY5r5AO8u2xB9a3r7RNDehrrTUtq@lists.linux.dev
X-Gm-Message-State: AOJu0YyAtw7U5Dmgpe+k84Et/BIxDmEgDm3tqmAJzVOfawB42U3DzqRB
	6lvBcP2cQ7hzZGkeUKeVqiKtGWm4CTzu2A+WHsbhOMMzrnaHiaPDQgj+/Y/gKrGjhCI=
X-Gm-Gg: ASbGncuR4qH5zoUjQstIYsXWtnte3LHpKnFEU9GrnPqbp71XaWcQ3wxBa/Kyrq6BK0U
	R8R5tP2PoIyy4J7bSV7/txIkk3aWIeo1JnGj3/keqm6IR26eNlgFJe68lsEYl+4GJGQuWqpmPur
	UlChx3RXdwCjjE/6AE5fW1RBHcOuhPgZz30uYS2ZqMQlRS/Q/izjqnTJPmKQxhMmfYSVK5r2Z4r
	nIxBqOBUEleeDvP8nJdIWW859/cHEqMyGYBRKYwf9hQJldJEGKIB4fdhpQLl8P3QJF80rrkRTKM
	YRVaJz/nEctrQTmF2TNlfzlces81KTWEazxy0BhHOp+YMiP3JyccD43anXGSawq03fLIpJiZenw
	hB4wX6s2Zo9xEIA8Gheql61/w3TbobpiTeQvxTr4+7IGoP0B8PCjzMVCD1VDZ8/5Mr0Gg
X-Google-Smtp-Source: AGHT+IEwE6N4arL2Nfp7kwi5xzmxE5rT1vejHQ7TsbwA2ZmSnSBM/dGl+o0EjInQ6KuJFac70KrvZQ==
X-Received: by 2002:ac8:5846:0:b0:4ab:552a:fac9 with SMTP id d75a77b69052e-4aedc4361f2mr22773811cf.10.1753830992101;
        Tue, 29 Jul 2025 16:16:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963b732sm55042891cf.39.2025.07.29.16.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 16:16:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugtYd-00000000Meu-02WY;
	Tue, 29 Jul 2025 20:16:31 -0300
Date: Tue, 29 Jul 2025 20:16:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 07/38] iommufd/viommu: Add support to associate
 viommu with kvm instance
Message-ID: <20250729231630.GI26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-8-aneesh.kumar@kernel.org>
 <20250729172621.00006344@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729172621.00006344@huawei.com>

On Tue, Jul 29, 2025 at 05:26:21PM +0100, Jonathan Cameron wrote:
> On Mon, 28 Jul 2025 19:21:44 +0530
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
> 
> > The associated kvm instance will be used in later patch by iommufd to
> > bind a tdi to kvm.
> > 
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> >  drivers/iommu/iommufd/viommu.c | 45 +++++++++++++++++++++++++++++++++-
> >  include/linux/iommufd.h        |  3 +++
> >  include/uapi/linux/iommufd.h   | 12 +++++++++
> >  3 files changed, 59 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> > index 2ca5809b238b..59f1e1176f7f 100644
> > --- a/drivers/iommu/iommufd/viommu.c
> > +++ b/drivers/iommu/iommufd/viommu.c
> > @@ -2,6 +2,36 @@
> >  /* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES
> >   */
> >  #include "iommufd_private.h"
> > +#include "linux/tsm.h"
> > +
> > +#if IS_ENABLED(CONFIG_KVM)
> > +#include <linux/kvm_host.h>
> > +
> > +static int viommu_get_kvm(struct iommufd_viommu *viommu, int kvm_vm_fd)
> > +{
> > +	int rc = -EBADF;
> > +	struct file *filp;
> > +
> > +	filp = fget(kvm_vm_fd);
> > +
> > +	if (!file_is_kvm(filp))
> > +		goto err_out;
> > +
> > +	/* hold the kvm reference via file descriptor */
> > +	viommu->kvm_filp = filp;
> > +	return 0;
> > +err_out:
> > +	viommu->kvm_filp = NULL;
> 
> Is this to undo side effects from this function on error?
> 
> kvm_filp is only set after all error paths so maybe this isn't
> needed?

Looks like you are right to me

> If this isn't needed then use __free(fput) and no_free_ptr() to
> deal with filp more simply and in teh erorr path can just return -EBADF
> directly rather than the goto.
> 
> Or are we avoiding that stuff in iommufd?

Nope, gentle obvious use is fine :)

Jason
