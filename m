Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676126E624
	for <linux-coco@lists.linux.dev>; Thu,  6 Mar 2025 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741285579; cv=none; b=eIPhlp6XFqgFK6DuvCnwobrED65DIV7Q1YqzDxCo3logZahCGMXd7vV0iMUIZF9rIJMFaRTNNEpnlKILgAR7zwcO5jajebIYZcekrfFWJI1L+odxqem3A3H7flxxoMUtkr98r4DZd5Ef5cSie3tMZjjRMKP5IB06RmKvJvRAh+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741285579; c=relaxed/simple;
	bh=A0wvu3n9vFC16f3qlUsNA6dfIvpISQcUDrHPkbUkZ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiYyOSK+mlPkAn4C50Ilq8Me885yH+fmzwQupDHkpGleOfZDRv+ZQmQ+r2u0e9fOHAAbgsdy3C2ZvF4JPU62z5YjWGTfU8vyC2CSLS0cqzPyQLbTKbQ3zaO9adMgxeWRXjKIxmLV7LKgOamX6P2Mi0hwj/SLzs7abcFo/mVgh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nzYm4u8p; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nzYm4u8p"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46fa764aac2so7350421cf.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Mar 2025 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741285576; x=1741890376; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJmNeR7cBbicmXZ58VNFTx5zHy0Fy/985QYAD/du2Go=;
        b=nzYm4u8pSPDfWc4fWZZfB+AfM6K6wR9dFSoBY91fdYh3HiV9Uht4uPfjaoWoYq0ILf
         V28GBB19GHeB6AU6F2OCMuyjyFC5e2IjvBfEP5Ees6BvXyQPJilmSSh9IilO/ywQnArg
         vYkPO4ch8W8bLMKylxle/EXWnGaj9yTi1dmii5h+KShAmpCi08DslO90xFoxZDBvD6rw
         Hbx3FFUFmNW18VlPRZ3N5TUUKGv9+eIOzqPFNNT7ymsepD1ieG4Cpf2gWcalufBfFwb3
         kJSYpvLd/Uqg5DrqHXjCG0DUaRris4kKhsB7oeFVkoRaN0vXKnhpnD1Dje/b1wkgJ+cb
         kdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741285576; x=1741890376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJmNeR7cBbicmXZ58VNFTx5zHy0Fy/985QYAD/du2Go=;
        b=tLxRV77M6l5Xdg4Z1YzaKwkFz6U9rjHwA2nY8KArkpF034we7xZSs4MseKUqKbqzwr
         /7tRL2/J0ck54dOMKHQkAGV9n0zY1GwpbwKXLxkisXP09HeuUwyd72/CEIpVHcfr0VbL
         nrASJdKfWwsLyEvfBAbuL7Iy6UBFdsYyZWqIexawEzL+nwPclYusB3cOwF+gG8keJYfP
         EefdFB3wa6rrHso4NyWHcYVlv/1ljHjOdAqvw+qHrnIo6RVGJ0B7kUwkgorJIfkrNonL
         7BwEYRlvgVfB66PcCwMcqeemCXs4V6KzXi7E3sAp8mGwaQXkWnrFyiq4qXfFfIE6OzS0
         Yfhg==
X-Forwarded-Encrypted: i=1; AJvYcCXREQbejgAEZpXd2Ix0fjXtvOeue8EeJ/eoXfpuMrFlgwngAj4XoBhtVWXDOS7Yj09kX5S9klg9aaBx@lists.linux.dev
X-Gm-Message-State: AOJu0YxA++M6d4z79HsXa+/1BEWmrPvea294d1wxwW9M506Miv9iZXcB
	NvZlti3gUvXfciRYdbwlGCLueuUz+Jfcdi/cZNwWzcNQZSpnm7FVaqgORYXd1Ko=
X-Gm-Gg: ASbGnctzRwrzzHBVF3hjeDkJEUvN9VF6RnDiCNmH9iViq2hklqFwm5Gt/QfzzQ23c0n
	nxvt61hDwQc4jP2h2XM0JXDI9fm5dyuHbJT2qEX+Aln6TuykZ3YazAeOiA0leBwhhcjMq3abAnN
	snc3uvLu2PMlMbdF1y8g9Ce4705K1NFpa9RmjGMROKFmorwJ+Ipp8QPJFgpSRWvTv5n3Bq9K9Cy
	OLdT/bRrofwDlsdTFCQcZHuRajkDa75EP4+u7jSLyW7FuXuXARHmijv+ont2mOGZxCG7z0JO9qV
	h7qDjDoFG19SMsZ8dDN4lBwdctfktDICzTjmdS6gIw386HMo/DcA0NZ5jkAnKoV7RelTUCo6AOD
	VGmuJuHPNL3hzG9mQNA==
X-Google-Smtp-Source: AGHT+IHdLGu9+NkI+poSobXraQKM371I6DGk+LdkIPbK8ktXY1plTaVgGJ4wX3yHHMcP8NJrRnY4AQ==
X-Received: by 2002:a05:6214:76c:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6e90066a2e7mr783186d6.26.1741285576387;
        Thu, 06 Mar 2025 10:26:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f7090c4csm9806836d6.33.2025.03.06.10.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:26:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tqFvC-00000001eHR-3E6L;
	Thu, 06 Mar 2025 14:26:14 -0400
Date: Thu, 6 Mar 2025 14:26:14 -0400
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
Message-ID: <20250306182614.GF354403@ziepe.ca>
References: <20250218111017.491719-15-aik@amd.com>
 <Z72GmixR6NkzXAl7@yilunxu-OptiPlex-7050>
 <2fe6b3c6-3eed-424d-87f0-34c4e7e1c906@amd.com>
 <Z77xrqLtJfB84dJF@yilunxu-OptiPlex-7050>
 <20250226131202.GH5011@ziepe.ca>
 <Z7/jFhlsBrbrloia@yilunxu-OptiPlex-7050>
 <20250301003711.GR5011@ziepe.ca>
 <Z8U+/0IYyn7XX3ao@yilunxu-OptiPlex-7050>
 <20250305192842.GE354403@ziepe.ca>
 <Z8lE+5OpqZc746mT@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8lE+5OpqZc746mT@yilunxu-OptiPlex-7050>

On Thu, Mar 06, 2025 at 02:47:23PM +0800, Xu Yilun wrote:

> While for AMD:
>         ...
>         b.guest_device_id = guest_rid;  //TDI ID, it is the vBDF
>         b.gctx_paddr = gctx_paddr;      //AMDs CoCo-VM ID
> 
>         ret = sev_tio_do_cmd(SEV_CMD_TIO_TDI_BIND, &b, ...
> 
> 
> Neither of them use vIOMMU ID or any IOMMU info, so the only concern is
> vBDF.

I think that is enough, we should not be putting this in VFIO if it
cannot execute it for AMD :\

> > You could also issue the TSM bind against the idev on the iommufd
> > side..
> 
> But I cannot figure out how idev could ensure no mmap on VFIO, and how
> idev could call dma_buf_move_notify.

I suggest you start out this way from the VFIO. Put the device in a CC
mode which bans the mmap entirely and pass that CC capable as a flag
into iommufd when creating the idev.

If it really needs to be dyanmic a VFIO feature could change the CC
mode and that could call back to iommufd to synchronize if that is
allowed.

Jason
