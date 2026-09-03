Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500374B203C
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446854; cv=none; b=PCQZyOvuAu5u+lN68tEIY2obXQPHTJ7oHUoAwvB6Y+3tpCINvd4g+JAHA4BykOfTRVWUp0A8pMVqICzqg64BibseB2xwJu2u/QYdWso1Hy7uPy7CSi5F1cxH7B4uQgcH7zbNnAQAcxLKiXa0+JgONc3Tf6AijPts/qqPAtt3nfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446854; c=relaxed/simple;
	bh=s35i71g40sE6NNYFzd2cEk81BylAH6qoa2XMtwsVrmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trM2sjN6lDS9C9jdqZHw9RttAwVBUnrcnuPKmXTP2qe9XA163Y6E2NjDYr80hseTs6j8xpjo5Bl4zvVb7WBltdWpks4VzkgDkBpeVgR4O426qnUpBDANBoE4dvm824XXE15a+4mOUqsd6cpWT+1iFryCqIpVbEtbc6QxVrGgsS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kXVKO7Df; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kXVKO7Df"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52ff0b7c98aso41081cf.0
        for <linux-coco@lists.linux.dev>; Thu, 03 Sep 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788446851; x=1789051651; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=kXVKO7DfzVL9uDGPD++GZMZ49i/iLmUzigR5xouxRPebKRkp0YOLMFD3/1kHe/5wBN
         LYVuZvDSDZIHF39lhGC5ukcdfGLRMC+zQ8W1gSOad+KVSl71aWQEK0JIwksJUvCI7JPC
         HsZa83YvR+A2S/qswtpfkI29sarf22uD8Fd5/UuGSzEOZH4t3nxqEUtUrNS8yQVmvIG8
         cH7mL7FGOxvDzA66uFra9v00k5kbL4IEsXthF+Mdx6IuvSmGG4+034IPOLMGSb42KiLJ
         HU4A1Ay65AjfZw2IJSbE+FQV4D2xFSkkeLhT1fXD9MbFsigWzRnysUTLzsyTABLDioOQ
         nohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446851; x=1789051651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=aDsrVsKD9Rh9l+r9GHOdyEAMBNUbbqRRavqUyue91d04gha8S543R2Do1gHQtrJsNR
         GhSTf68Ja7xldxQ9qugWi2OEhuhHkjbpfFyzVcG47fkS2XfWuqRumZcmCQOglJRV5dsj
         tea/ra261E6zpDQq/3N9tcyR3dWQlDh0JXTx6qGMKvoD3FtEbz4UIQd5AEBm2/4I/xvB
         bV9D2Uz7s++kZ92p0mS1t2p+72T//A28iveANQjlqmsDHS+fCJvAEx9caJ4dbk6B6OvE
         z9tJMCc35zVWIdrqH+MGxuyNn0hjFUy1rK/3Q/qq9mYMMj924Jty7e06D8fJPBWbvL13
         cLFw==
X-Forwarded-Encrypted: i=1; AKwUvBx9pNvbOUB1DVHlYNwIkZTln+QUdBp1XBgd4TRhXI3bbxprWHGAHDhVrz8VXyhwSjRTudw8QdD/hArE@lists.linux.dev
X-Gm-Message-State: AFuF++myQY0CpzgwdvWdUCUwIygW8CVIErHRs1/ZIO57GU/fSwOeVdYf
	m6o1Dbk2V6+zSb541763myqW5AT5g6798w7tL7TkqK0ipjus2lf7Zs4XEdPlHQIt6qo=
X-Gm-Gg: AYBFou2EkI9+tbuqTgampfi140jGMT5zZ17XBDuVlKUsPD1U9aINqebg3iiQByjYMlA
	4YBxgpMFbB8COVink8rcJLW5sjczhGyyxHHrecqxVlGyl8cMUH+/1sHTMFBnXy0aqIe4paLE9N0
	exP+vPrPL7szdF+rtdTrUZ74zlkwDRC8NRUM/HimQCizF1VRjakXFCZUglecEIVS/lNzxpm0AcS
	tiI7+oVYIDcoEmMw1WYH3G/Gv+469syczvKaE92/j39JY56KStpq2ReuLtqj8/JSuNxmrRVyF69
	diVCedn8xLKmkH0bU2vxfE9GGGygcv7tFo/JrlQOz6s1UeTIEGhfSkYUDeRs8ABuowjo8ZDX/+Q
	gT4x0QyApYX5r+zecTVcMGPgSEZYQYnppU/NAZDQ60qB/a6+PYqSIqncQS85RThTrxfUPtP2mL6
	jXsiANRdsNzJkSdI9+9H8+IYJ76qynvZ+am4q74IlwhYy8/cVLMlbLIiecfK/0AgU/eCr/BwDAN
	MrMOHsTTfLssS6u+zbYzrwh7HZNEHKlyR0bhj/VEn6nPmx3cADeSBw7
X-Received: by 2002:a05:622a:1455:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-53036be6a5cmr143516721cf.9.1788446850990;
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5303301ddcdsm44166831cf.9.2026.09.03.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x28iv-0000000HFle-2ikl;
	Thu, 03 Sep 2026 11:47:29 -0300
Date: Thu, 3 Sep 2026 11:47:29 -0300
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
Message-ID: <20260903144729.GJ2890729@ziepe.ca>
References: <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjaezyxl.fsf@kernel.org>

On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Do you mean the SMMUv3 driver triggers RD creation? That feels
> > wrong. Did you mean the VMM just does it earlier?
> 
> Currently, CCA creates the realm lazily as part of another operation.
> Realm creation is triggered by kvm_arm_rmi_populate() or
> kvm_arch_vcpu_run_pid_change()

Okay, that's not what I would have guessed. But critically is there
some way for userspace to specify any realm creation parameters (like
rpv, ats_plane and so one) prior to the lazy creation?

Why lazy? Why not just have userspace provide the creation parameters
and create the RD right then?

Jason
