Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839778;
	b=Wl5JiAH6rwjasSBEKbnTdNsODpBIgoZ+EjX1SxI6yk/QHBLtkOeA7Xwzl8sAgGAwHVag
	 DDbqLDa5QqeOPd8gCOR90PnCD0MYo8zxrFSz/5B2gHF/hHFRzc8rCiD1c71xlMx63U5gq
	 TAdNS5i89nmVeo1XrVrixUQabvl8lgCUOmOeBp/DNadI9IBOeQ5hS8bS3w/ynkKDwKdEy
	 yZYY9KS3AjbPj/YlbPzbIFjFXmAIs6mdvK1fhXXO9SarVS8x+nXHpQlWYXUK74O2IYmdc
	 2eRitUYEu0divXsgBpwfXQwpe444vy9AY2J8nmEGaRXoqylY58MB1ha5L2Zdrt/toPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
	b=tvOtZeIFcffTQBIpQ2P03Q52wfoDXb8EFck0TmOATrMCy8mHHOF5Vlh9SRJTzQu9jjxE
	 MTlOpsdGGTUHuN51vtMDj7verLYIzUe4iR4zxJGXD2TwRcxB/gNu2IbEq7tmFCfg8fEJq
	 nTzI5BzR2ZRV/fnQ0ovQhV83pHNdzhGRiSEtBCJvUJn8GBSXMPs7C5IRP+BiwCPEayXwD
	 z9HPrG4I/gXLNU4MzDpPDgB4/DVQu+LOcotSaz6HAell2AXJiIL1j6hx7ZH1Q7Rj2zBAn
	 DIgG4rYuaYYzDTmnl/prhM9LfTKnwVyBy43ppJra0+oQNUa+1IyAWuzLCxE97ohTzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ndKc2xO9;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F71606A332
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 00:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F71606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ndKc2xO9
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9905d61449cso367129241.0
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793839776; x=1794444576; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=ndKc2xO9qRF+OKJwv1QYrJYRG4w/ryz08TB1k+CdsREJjFgwxIiQHk8aHmzGtYI2WW
         8iNuWO/V5yO0Ykgh8rpuHdJaLnagtHIc2IDtiUU9tue+gudgfGwLrTdnI2w8ZUjJv0cB
         IS7ToXM4byqAfiXONzvOUrnUtl/ryf6+b3P9zI+Q+9XMyQQSwg9xCw21uYyKMzv0HGrV
         uw4AjjYjDd2+tB75X/qCto+/iZ5ZePzLaa/4EdGPrJCUqaUDF64CzUS6LvXX59F5jvXq
         zBte0B5xKu9tp7JkK+nWG7KFKzVtnVlIRTRM7v9FAr6cBv0nszokoBXSaqkATOEmcwuA
         ZKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839776; x=1794444576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=Qg86amQ8o94eyTcKMdkXc6ilFf/dHslEodFxWEL3cRrHKF6I5yEslVOTbZzfCHF6ac
         u0KlQh+Vmi5g+sVEMy+XVUkYfbgodvytlXZodaVLPrixMpqlpNYc3VfvQfYOVGDPaAJ3
         qIUbCEnUKLqveTzmUetHjsVBXYR1cr3nxf8Gsd6/kOlnYgSkJ28dfpVRfjCSIX4sbhaE
         up39aZmcQQMCZcIPydiZD6U8pVp5Em8fOe8UYuNfsr6cMGKLGryt7e2zuSdJ+NmzPEiO
         hzEjBthD6L2rix3X4E3w6OCcuaN/VPtAh362wXxAfQl8Ov9H7P9qCpwWZc6GBbCWt8JN
         Z6mQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ9oNAljP3Xa57CZ+vwPRmvmFwGwQKhY3Vx8+kt76xFrZkoPgY84N0brWFiMWq+Gr3REPZrxHxtkVz@lists.linux.dev
X-Gm-Message-State: APuU4Z9SmBzviNSfK1GirvdUpVYmZsX4C2oO//scn45EBF7e4XwKzmLT
	tWs8U7oW788AkC9ggF1ge152gD2eyr0o8z2tCBEl5Uz210Vcc/U7Er2J3ic4x0ZcIsg=
X-Gm-Gg: AYBFou3N1OZSUdYuL0IpbSZH8GhAIxHNiaVWo0SULR3RNZ+JX8rNRktB4xBXZO3gt6n
	2O5VfXAAQvycbQWwiIInmhlX/yTnbdUlM61tAKyY23xQZVohiEN7GAQiEjcquRIs4Ro2sRUZcr3
	npGlfZvg8E/q+15KKVNKnb8+JGcMsHwLBwgJtQzdnSOewfZA7G+K3I7X8JJ0024/LEmCMXkbbl6
	XT0hxsgQQczMo/ULUuXDHzGXic/3RWYKG7ZEref8u0Z0uHh9gVY5MvyQM9GQFjXjcAZzq44iVyW
	eKq4yL7sLshI6Q1uJKW805rJqkjTPFCgeY44m+GMTUfE6lLBLlu33tpcdQHRqDKpkOVwJYUrkmO
	bww1EUjUy7v3LveSG4sqptG/1/7/5DqHsXOgN3jDgZkDTenRyEi0VuFaKYm0aBbQyhRWTUBJo/J
	odTS4jTSabNIieoOcIjv9njgFFhL5Vvx8i5UWkyNXA6TgU8YqX0BrwRJ69uoMFHJhLLN4XtsA12
	0LyOiNcNsBhzQsVgOFMwqDR19fpbu271RMu6iqr+VLtNpdAlLhMAArLK9jI2yAzLsew9QYt4fU6
	VIFN8pdQgri8exfPmafQY4+6ZJCCN9xZDlSMj25qUUYZqnZLjw2py+jqAGqVRC9mbUf/NAbGbRh
	GcWuRAp3SfX0=
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7d0725e16d4mr6016853137.21.1793839776242;
        Wed, 04 Nov 2026 16:49:36 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9a9ca31sm3266318241.10.2026.11.04.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOlfb-00000000cqL-0257;
	Wed, 04 Nov 2026 20:49:35 -0400
Date: Wed, 4 Nov 2026 20:49:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261105004934.GE3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
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
In-Reply-To: <20261104152351.00002565@linux.microsoft.com>

On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:

> I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> leverage this? Could PCI/TSM support this role without device-security?

It is certainly not what TSM was originally imagined for, but with our
new arrangement, yah maybe so?

TSM basically just becomes this weird overlay driver on the PCI device
that does stuff. Some of the stuff it might do:
 - Register an attestation subsystem device to do SPDM
 - Register to allow iommufd to create a viommu
 - Some status sysfs ?
 - ??

It all seems separable and composable to me, so if you don't want to
launch an attestation subsystem device because there is no SPDM then I
think that might be OK?

Another option would be to somehow obtain the viommu from the kvm file
descriptor and rely on the fd to handle the module pinning/etc. I
don't know how to do that nicely with the way the modules work
though..

Jason
