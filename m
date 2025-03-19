Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E58F1EE029
	for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742406062; cv=none; b=H8H9hTCLpj79zGVwW51mrvXsttfVwagcuXtpIvEpEL6bF36wGtxMj9UT5fd9ERNV3eTR3EnvMwMeHfOiH4kasn3aA+XnKhgu1n9K/ATy7uiJGQyV8pqoOcr6NV3XK6yqEt9OOoolARh95yvto5Rnz8CEmnkAPlAElh9QPrY5kho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742406062; c=relaxed/simple;
	bh=Uup4ij0e3QxR7P+2AXE6ojI6gZ035al5TOyCCZJD8FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYbyoeCmcFgrcqmNVGS10k7LMYVWz3pJNfbN1QNoXgoyh7uHPGoXf0aRFdSBpb5MJhFnLaYIgWrqcxFHPL7uzqJ0Nrv/gKPOsyxo5sanPdKp1ep5nEe/ehryfQYnX/Vc1vH1RQf9tvuXLM6UQ9ZC5j1UVyfKVkgrzYi2bJvCQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IHP1raAJ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IHP1raAJ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c597760323so240241785a.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742406059; x=1743010859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leCUW9KEkZQcVeVok9ACFyeDj4RZoftXqhcJPMWCJYU=;
        b=IHP1raAJFekGsY4X6L7J/pbPw/z+vXiYEjvh+AMons5tYcpmm8HrfGn8fQ/+evgu36
         e4m/qbriQcZ8TQqaSrw0UPPT6Jy++m5ro2ocZXkg3u9oPUajVALRdgL75076+W118tgU
         JIMRNaiXVTdUbeBWEyPgbCVnv3dnWsASFbw2i92OLVuYD0DyZLYUEixHfYiW1ijjD3M6
         j8xTYtsOS2VsrTw7STAcJMbSsSLdBVEA4FBZf/7SdvVl7ATkzyS0IcYKAcuNX13g8UgI
         l6jD4Bv4xemLutNoCZ0hp2hUDFSBqslboEf4GlSaktfCbpaJPKWlCjLBENCi4BXDvDF6
         Po6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742406059; x=1743010859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leCUW9KEkZQcVeVok9ACFyeDj4RZoftXqhcJPMWCJYU=;
        b=WuZ2O35zIPqyyZSuJSJmygJlHeKI8qKVN1yHpPY9V37/LlXUXFp9mMEB1VEec1j9HB
         UD2CQT+r4WVBG46WDwlvgL7Z+kVNIuor7LuDhPYe6watqPwttdGIkrjAPfWhF9KUmVF3
         IdyxOO4nnF5XFfo61+GwxPmBitJDWAEdKr1aFfWe91+kEabSeYwqfOAG9FqUwkkM46gQ
         xgmbz3yso10GX0K/MMkK2VDAdzJcA+xlIbHvJkomhTW5fqP39AOCnFIZasoUE6QPYehD
         /pDj5GJDuXdYVle880fVZaVLbWH6lyTV73F9KcKhphjC7TKAkDxaZAIPdYnWdCT//iVg
         Vtlg==
X-Forwarded-Encrypted: i=1; AJvYcCV+1md6X8nxjdF3n1TN79Rsq9kn7J1OlsjuK4geyLTue8SHNCDNRdJrisaNkyIKf6rfv0oMNe4ap9hi@lists.linux.dev
X-Gm-Message-State: AOJu0YxzN2AyRAWypdOovz6D0YOUwdluMdsaQT+oHdwmmttsT9Ajvoyw
	oINWBw4kkiIN6+5n2ej0m31B9DJLKtH2F5cU8l8JkcLFG/KPH5LImucboKik6Bw=
X-Gm-Gg: ASbGncvtsqwz4L0pFtiYVHZnWDuPjniIz5fbpFNo83dLihkZEwqKlmVBzt8uPjCl8vB
	L4L0RyfnGLt3WIP8eNzL8RvsLwKe9LDMxtHCOkb8UEC/2KrAx1Cu1/b+FTecDq5tw4hy7bBODo+
	9HABBYVi2mmUMPYrS+Mz3HR+cbiqjlXk/E/2+IHvFnLWN25mB80cImiGAhYBmOd4UEXoQhb6p4a
	RxNqXVpPR72bWD83InONYM+8lfhR2NwGLivmIX8qL3CBXJringusu/qfcHbQd1GufVZzPE29Avq
	ES3UI6AqUiGgY9iRoBHrh/FP+HziBTBdGzI61uegogaUb7wWniYcaiJTAhfuMzahz1RtALNqXj0
	uyRGJhKrOvEudH6bItHPkBdJyIjzE
X-Google-Smtp-Source: AGHT+IFoJAQ9bGba/Z0yZg+D8yG6xp2ytZSUuDU+bbhNp9w3ofz/kSX0XQcOY4VVJjVXQ+26hrcvHQ==
X-Received: by 2002:a05:620a:57b:b0:7c5:6ba5:dd65 with SMTP id af79cd13be357-7c5a84a3654mr479964285a.55.1742406059344;
        Wed, 19 Mar 2025 10:40:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4dd2bsm884915085a.14.2025.03.19.10.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 10:40:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tuxPW-00000000WcK-0irF;
	Wed, 19 Mar 2025 14:40:58 -0300
Date: Wed, 19 Mar 2025 14:40:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, x86@kernel.org,
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
Subject: Re: [RFC PATCH v2 12/22] iommufd: Allow mapping from guest_memfd
Message-ID: <20250319174058.GF10600@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-13-aik@amd.com>
 <20250218141634.GI3696814@ziepe.ca>
 <340d8dba-1b09-4875-8604-cd9f66ca1407@amd.com>
 <20250218235105.GK3696814@ziepe.ca>
 <06b850ab-5321-4134-9b24-a83aaab704bf@amd.com>
 <20250219133516.GL3696814@ziepe.ca>
 <20250219202324.uq2kq27kmpmptbwx@amd.com>
 <20250219203708.GO3696814@ziepe.ca>
 <604c0d0e-048f-402a-893a-62e1ce8d24ba@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604c0d0e-048f-402a-893a-62e1ce8d24ba@amd.com>

On Thu, Mar 13, 2025 at 03:51:13PM +1100, Alexey Kardashevskiy wrote:

> About this atomical restructure - I looked at yours iommu-pt branch on
> github but  __cut_mapping()->pt_table_install64() only atomically swaps the
> PDE but it does not do IOMMU TLB invalidate, have I missed it? 

That branch doesn't have the invalidation wired in, there is another
branch that has invalidation but not cut yet.. It is a journey

> And if it did so, that would not be atomic but it won't matter as
> long as we do not destroy the old PDE before invalidating IOMMU TLB,
> is this the idea? Thanks,

When splitting the change in the PDE->PTE doesn't change the
translation in effect.

So if the IOTLB has cached the PDE, the SW will update it to an array
of PTEs of same address, any concurrent DMA will continue to hit the
same address, then when we invalidate the IOTLB the PDE will get
dropped from cache and the next DMA will load PTEs.

When I say atomic I mean from the perspective of the DMA initator
there is no visible alteration. Perhaps I should say hitless.

Jason
