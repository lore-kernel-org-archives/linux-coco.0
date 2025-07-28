Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29F26E6F8
	for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711831; cv=none; b=uaNYHGK/IpH4+ttTTWom7b3KCoPPdwxumF034nqPlagD6gEAbQfEEXDFsaBekix/PHs69TUvOcdmejsP3FONK2STrByZh5mGH/9wydk4LEIHQ/f8HYE+Z+HLKI3m4zPuRaNEpyDMJZ4qZYw9T/0sGalupUOMEIfPEDo6vDqnn2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711831; c=relaxed/simple;
	bh=I9ZeIDzhsLC+Rw6BB2ZpsuLCUCI15ECbtPmeNUTuSxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcAFeKeJlm3q+HiqHwJ7kapUfNXo8p4g3H7aqAfPxppkQaLHI4Vk07dY20VSt9yL+Hw2amuFP4VdGs8hp9m1yLXzhCtN250WvcjmDatySDTph+eUN9n6nIhAUchCRkD6U/hQ65Y3fIyW6VQ70xxE/kkTXlnA1XWbUqLAYgiTAXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XC44TTlI; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XC44TTlI"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e32c5a174cso405777385a.1
        for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753711828; x=1754316628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+eqiZhyg+ZCBOtjufQJyy2X2RHAGHLhNx9NLb+2h7ug=;
        b=XC44TTlIi1jcD9qvsUzIoFEwxqP5vaRVQqY+RU49sjj458oEYNJKL5Jno9yMG1oQTW
         COGlf/JPIzfmHt7FPvUc13K/0wdoPAarGoXOovObKjSxnVLvpE+mckVNsJjnARCuQkeZ
         TLMEwwMnlSV1xSMdgW/ndGYMxmTglbCXm22jskT4L3kbxruiTNCkQd+00kgmbIbd/crY
         BNvFjDAfWuvxmMVrutivfemHExljH+kBFXV4oeyMBPGQ9BTVMq52qzthPh3E+HAQjCRM
         sVed7CW2ZI7k9s/Zk1eCb9Mgapxb48cJZAlUTulD7usxIVmX/Gvk6wTXq8M+a/fNCyuS
         Cjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711828; x=1754316628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eqiZhyg+ZCBOtjufQJyy2X2RHAGHLhNx9NLb+2h7ug=;
        b=fUF7XeaX/pO4WKA+eHUd+c3iDB9iMzv6M7wMmcBaryeBbUPUFlg5pi9bNcqoYioWaR
         zZRG/KwtIutPo6ZoPN4Lki3d6cQmkSWrG8FjvKOswFPtt43iot6ez+zKDXaKtI3SAaA9
         CS1TvZT7RG96j2iPKND+zBn8+9MmDrSP4ywsut+KqhjY37J8A83kCt514bjbHIpEsX6L
         dUGQYRiFnIE1yiYN7+1fDlDoIg41+dXLJiX40N69A+nSQQSw2JIRKPllaHrv6wVcoOqX
         Pu3a5aZWEFE87GNV7Uzet0/h9xCZpTVzyyVhRzlrTowWJZhI7SDp+rVt3SwWcSo+0fBH
         pxgw==
X-Gm-Message-State: AOJu0YzkvmyJUrvEqAXWyiN2bQsmmAyo6Qf4Uj1PzyvojvbgAPk157Wx
	yeHic9t7oamZKiKMQQJTj4FG4SFhQcGqlTqNsiSXhSsxyOgLYZyye5i2xl8vl1hEhdE=
X-Gm-Gg: ASbGncsoSupeecwA1HKYN60oJ0adgVJ0Gk14MyMDmedRtN1L6/qQp047gpv6enP/8mu
	a5SQMNFhoXHo9VK/7Xmx0w7YrVuskO7gjWSSEkGj972CjiHF4HOE5MAMZ80N8SVJJz70V2SYgnV
	j1Dgj/4Owk8kU4eNCOSa4clShQrYmBgICIO8A2v34TuRYHBFileTm5qQ6uxWTefKtzaTrkXJ7Wm
	/1KocmEJwyC9MmTgo8fSYXpWRo52iMOyvN8EtB8VHsx/Uby10OnxrEA7wmfvtj+ZDxwejKMnB0C
	uLx0/n2KKTcOmbScR75X7h+pTFuQWvjyx1EAT0HvjB9WlW8gsEQlwz5BiGY3HecFNdjKwGS/0Ky
	9YQ69ovpwt+we9HUnc5YrJ5jIzH67DKQ5A9RDPFecyWHEdsuYstvuvRo7c3SkLeRm+GyL
X-Google-Smtp-Source: AGHT+IG4AMn3fFLDW2xb11IBx2YQ2BaQYNWmVWPx/pnTmFR/H2yiwHIFP+BF1HqcDvdzFfnmN7sa7w==
X-Received: by 2002:a05:620a:2a11:b0:7e6:3c25:b69b with SMTP id af79cd13be357-7e63c25b6bbmr1410127285a.13.1753711827688;
        Mon, 28 Jul 2025 07:10:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e64327b33csm296288885a.3.2025.07.28.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:10:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugOYc-00000000AQN-25tk;
	Mon, 28 Jul 2025 11:10:26 -0300
Date: Mon, 28 Jul 2025 11:10:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
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
Message-ID: <20250728141026.GB26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-8-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728135216.48084-8-aneesh.kumar@kernel.org>

On Mon, Jul 28, 2025 at 07:21:44PM +0530, Aneesh Kumar K.V (Arm) wrote:

> +#if IS_ENABLED(CONFIG_KVM)
> +#include <linux/kvm_host.h>
> +
> +static int viommu_get_kvm(struct iommufd_viommu *viommu, int kvm_vm_fd)
> +{
> +	int rc = -EBADF;
> +	struct file *filp;
> +
> +	filp = fget(kvm_vm_fd);
> +
> +	if (!file_is_kvm(filp))
> +		goto err_out;
> +
> +	/* hold the kvm reference via file descriptor */
> +	viommu->kvm_filp = filp;
> +	return 0;
> +err_out:
> +	viommu->kvm_filp = NULL;
> +	fput(filp);
> +	return rc;
> +}
> +
> +static void viommu_put_kvm(struct iommufd_viommu *viommu)
> +{
> +	fput(viommu->kvm_filp);
> +	viommu->kvm_filp = NULL;
> +}
> +#endif

Missing stub functions for !CONFIG_KVM?

Looks like an OK design otherwise

> @@ -1057,6 +1068,7 @@ struct iommu_viommu_alloc {
>  	__u32 data_len;
>  	__u32 __reserved;
>  	__aligned_u64 data_uptr;
> +	__u32 kvm_vm_fd;

fds are __s32, they are signed numbers.

Jason
