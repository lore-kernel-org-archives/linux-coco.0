Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CCD3B14D1
	for <linux-coco@lists.linux.dev>; Tue,  1 Sep 2026 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273289; cv=none; b=e0fKuF74eZSzpMmPrWf0hdZUC1RQa9RmxCilYIIybDm/SiY8DRnC80RLUxzZaZHcwCrlXcA2TsJ2hg8ACa4WyNyZD55/Kslv4gZAGmxRjqkCK/2NhnV8UILwyxrNwi8aPMbPWwM1ty8mfeu0r6b98iLXuQk/qJ12qDlHQH8e+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273289; c=relaxed/simple;
	bh=8yIR2l5kWTbTZXEBPaalfxQDjpL45I/SVC9tN3kaCb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deOyl2qerd7x2Vzh3HZvdo7j8L8Z1A1BrmjWI7AiI9BETk1+jv27wCW4kyJ9m0l/uCCyIj/ssMr/7tyN2thOzLNg4odPEHVvWcTrw6/TegpnVKgeKSHi+4Tl7CXKpzgFCkVs1W7rRIst9tvr+kRAY/OYxT8Eu1aEKoEsAdCdwA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IhXwtTmd; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IhXwtTmd"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-530256c6031so8489331cf.0
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273287; x=1788878087; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=IhXwtTmdHxzwQ9PGsA+UjB9J+Ix4KZvXqRgauqOXj3EzLRUm15wC9eGh0bJF4x1BuX
         GDd080U2vlTR9NfxjaUAEzd84AT1Qdk76A2nHcEYA0DTijYzj1uC4c/oJKA0FqNqUoqp
         7x9plcbd3FMZRSiA/dhy65PO94uyXhFs4MvyGNpVwQ5q8KlPCY/Lb8f4A9ZAcmgk9o8z
         FgVi42bEh5ozVCIBUut4+z24jkZqlLH/DJlG2KdhaunBLNPYw1dzRbuSUoaRjXMNuA6i
         NubVjRnAuwOOGS/FweVGbq5+v1ozajLnnRuIGp1/EsPYF4uLN+xmqLgJSluBAufHhCvs
         hlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273287; x=1788878087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=Js3QbBVtkUcNz+FrkhO87tXI5eplpKlrdGOPkjLZCXl2vi8OJ72eAcDybljqPpADiD
         Z8fs5quN+TLD8YtmsqcpYiPhwhW0lS/wFWweXzeug3n3QgkYYQw2ml/j7F6KO9Pyt8rw
         m+w75GXNLg/biaewlWiXdNVVppC6b9G0WGjaRgQX+OjDI/3nY3RNBbZZsAcCEdWUKu8X
         TN8EeRSA7d6iJUvi+rT1V4R9owgQtT9Ss/d6fNmuKlyQ7eA9AYGAOJ2VKgRzXmoc+DwO
         BktZ3LXW5JT65JFSz6nl7vMF4mAC/tH9SE3ZoSpq0QyR/UE/+lXcYiP9aF27+1Fs9KHT
         WdOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou62zzJddnI3El6E9bHOr0+Ke1R0i251BSHVs/cSIi74pdCGmK0xZp0IdHdDKMJzeRPwtMNW80a22Y@lists.linux.dev
X-Gm-Message-State: AFuF++nC4x1iRNYI0fi4vBRjLKCi2lja1gYKV7umO4Mk0ULtVz+D2WMP
	/z93BCoAN15pqYgTOepEEJb+Ij8dJT1587gAfAyRqM6bIP4cBHFJXmn29ym3BdvOy4chca+6sVU
	Gfo1p
X-Gm-Gg: AR+sD12RMr+jy0yJqAdI8D14thet/PEvf9FSA4Cs1EpDQGHk/+Pjb5NAUo+rgBwb2xv
	DmxCBAJqHpk5ZYrXqP7qyUpLH49FVWmSu/aqCikAB1QPiyzR/W9BZJrR0HAeep5kLrF44bIHF39
	v4s7lPt2f+21Dvj5InMtMlDkE//8GxYShXCchiUE/LOxaTF2vUZBog+sw7p69phJG2B0rxGTdLg
	xT8vcYL+SRm770iNTXQ8XaIpIn3RYOfu0uw0xTjhO5e7lvD3sWgIz2K695n8ZiWPF8M+ACHyj1Z
	TrFEymmRI6XGGDRGl2gQxatK4KLBkzXk92UaqXgQnqbgamXhLYKXGeY1f0zbjSr18VVIuxfctYB
	cWnSmNeEwmDhhL4yBM5lKq6hczMzGgk3m55p09MghncbLQchgxv+0M4lX/wR18Csg3K8iEFZNpE
	0Ihw1PDdz3/7kWZNi+b9czbwWgCOEdnRv0Sg7aVWV2KuXK5Ipxa2BIDTrstmQcWLqMhwZGOV+An
	RDrX8CB+O+FzP5MbYrbJ27c2sh4Ca0bVuB3985pnEIB0lI=
X-Received: by 2002:a05:622a:5913:b0:52f:f472:bad1 with SMTP id d75a77b69052e-52ff472c08bmr383344431cf.33.1788273287009;
        Tue, 01 Sep 2026 07:34:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm98165671cf.20.2026.09.01.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:34:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PZV-0000000Bhy0-23ZI;
	Tue, 01 Sep 2026 11:34:45 -0300
Date: Tue, 1 Sep 2026 11:34:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260901143445.GC56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecfdnv4i.fsf@kernel.org>

On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:

> @@ -463,14 +460,13 @@
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> +		if (arm_smmu_is_realm_viommu(viommu))
> +			return arm_realm_smmu_v3_init(viommu, user_data);
> +

I think the realm vsmmu is going to require a different info struct
than the normal psmmu case, isn't it?

If so it needs its own enum value.

It would be nice to see a draft patch showing how the real vsmmu works
on top of the RMM spec for it. If we are using a viommu object then
non-vsmmu case should be identical just with an option in the info
struct to not create the vsmmu object.

Jason
