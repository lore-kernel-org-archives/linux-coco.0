Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CC247280
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408935; cv=none; b=a8wHVqGOKwn+0IF25b9XNr1CvbIpkvT5t9fOjLMTSDpfPGPPrLqkZQluL5MLS6V1l4YY2PWFz4V93TnPEdwG7uQzjypgz8rmCJP25XybLFKlkpM0Osc4y3D3IItbepJF1yeSro/CzeDdYWBiCUS0/LjsqPTt/RBekYjPH0mPRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408935; c=relaxed/simple;
	bh=vK/izEOcqRroDKEjuurkSpJYsxNQb8UJ35ZS/H8ApXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqJpXhXwA6wY18n6RAWV9Upds1ji07waIfrZEwKrU9JJxBlNqIwhfLeQS2yBB4MPTUxoa4ir7M9k9zY0C1+0nY5RTsXNZx28x997a1A3H+sduIPWTILe63beacw5ACdqtrFONE48NrZwBMy4OXhNlojUhMLJszglTYQNaMabaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kLxISsO5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kLxISsO5"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e638975262so586255385a.0
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754408933; x=1755013733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvWDI0NE7eWO/Fmxnrgsva4q0z87yVrAZ5bf0Zwi6vs=;
        b=kLxISsO5ZfOIXIn5/TPwoB3DGILRcIgKnIPIjRtNQ8C+DZDKNTlh86MdtUJzQ/n+D4
         5NJuL/+4w3OkPAlAEfZpBgaxiVLIwoA6YWe8Wb0kJaPsK67I0JYkrCA7ulM/UUjJBiDI
         H0aRe9vuv+XT/VRAuf/o8eITt0RHQ4iQcKWw7QiUk7K1+suvQSRNtVgxqYpnglHAmMQR
         j71SDsvPE3JDXIttWaOQhDijqOS2Xqedgfk7GAnzqJvlECRKCTBVuRVQMsMKEy97ZMFy
         a4HKWbilm00qC19+AnTP00aBxQXJeuI6zvaK1SWoDgJDh8Ir+Y+dCMlaEi2ejpWhjsUr
         YuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754408933; x=1755013733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvWDI0NE7eWO/Fmxnrgsva4q0z87yVrAZ5bf0Zwi6vs=;
        b=iBMkROFL6y0s5W3z7g40nl9wrXH11MVA/oC2+ghPDtsaDm5ibJfYQ16m1U3j5OTDf8
         REuvjLwmaiXR2juL7YFRdG6inlQhvx9GwTCPaFNYZTnTy7aeTN2M/sBwb8oW5SDv9tgx
         SY33td1dYcvV8Q5n8s2Wa5KnX/3MIo1I0RC2m6vaRvdnn4tZL8J1CsybNrs39rl+eayP
         /g1ntZupXzbKGkQpq3OG+75qH54TIbqAJAjmnFiipMDOP+kPwS5FaabiFLjPpMZvWFIB
         QSDhdUIgSJ+WpXK9T5OTwddoXS3BC7oi0D0dhA57nBuokbp+Eq2UXNXulCxKdosMqx2Z
         TPHw==
X-Forwarded-Encrypted: i=1; AJvYcCXfNXjJQ35DD07iNnERSf0Xa9fbHkxGW4OFbXrQltbw4Ee1baaFk6o7C+mvthNi+j+Q7ptpoeUpv1bM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5s4qLzDDxbSO/M4ZkbAhRCwmselsgwtfJG2+4CwpEMDvAHc/8
	+gQTnbug2OjAPuZNQ20deX33pEBGUstBLAFrJe79LX6FoxjrHl+w+qpc3prQDfsBixA=
X-Gm-Gg: ASbGncvj+IMWnvhqCOFA+ay4J7tRNUi2LLQsQTyHhq6uCj9iFU9A2m8eZWnG8b9AcUM
	JbDXrgrPK/jDJmMLNk3yMRHaVKrpP7EhPN/JgFFEfDCfTEZJgCyOTecanhyFhSFfQQQ5uVzN0vI
	LsoFdSzyS3/g62Lrjq3g4kTU9WRzU94afSGkqp0WSouFxPMSG+OyzZybfbXi0hZpZh3QNDaX9BE
	vD4Liil8KQW53e+cZ/eHheBz0Ab9e1pBOPxufh5PVFXQv+h4G94rpAefGDRl7/syqMbvOEz+hiJ
	Jqa3kx+LnWRxP2lAjt3cCHgPsIQ/G0yS0U5F3HaQmALjM+EHI0kF9ZYDrrBt4z1v2Xc9NgWklKO
	ZQ+KN2bm+Lbl/nHdyaB3Gw9Wh/PJT5EsPe6vYht3Mg2ZcvWfyms7j5KdwqazDujpm1BNd
X-Google-Smtp-Source: AGHT+IHt6aPFR2Bw0HlJGSa/mOk3c8+BRcWZQsYV0g4OgyGhD3tGZLbn6be+rsoLdw/XIZZFhDjoag==
X-Received: by 2002:a05:620a:2541:b0:7e6:3030:e480 with SMTP id af79cd13be357-7e6963a6eedmr1890516185a.57.1754408933141;
        Tue, 05 Aug 2025 08:48:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e8040a9154sm214850385a.70.2025.08.05.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:48:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujJuF-00000001Ydr-4AIQ;
	Tue, 05 Aug 2025 12:48:52 -0300
Date: Tue, 5 Aug 2025 12:48:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 10/38] iommufd/vdevice: Add TSM map ioctl
Message-ID: <20250805154851.GT26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-11-aneesh.kumar@kernel.org>
 <20250728141701.GC26511@ziepe.ca>
 <bfac9ab6-9115-44d5-90c8-e22c3dbdb607@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfac9ab6-9115-44d5-90c8-e22c3dbdb607@amd.com>

On Mon, Aug 04, 2025 at 08:02:23AM +0530, Alexey Kardashevskiy wrote:
> I ended up exporting the guestmemfd's kvm_gmem_get_folio() for gfn->pfn and its fd a bit differently in iommufd - "no extra referencing":
> https://github.com/AMDESE/linux-kvm/commit/f1ebd358327f026f413f8d3d64d46decfd6ab7f6

This patch needs to explain how the lifecylce works and why the IOMMU
can't UAF the memory. I think it cannot really work as shown without
more things like an invalidation callback.

IOW you need to define for how long the return result of
guest_memfd_get_pfn() is valid for.

> > I was kind of thinking it would be nice to have a guestmemfd mode that
> > was "pinned", meaning the memory is allocated and remains almost
> > always mapped into the TSM's page tables automatically. VFIO using
> > guests would set things this way.
> 
> Yeah while doing the above, I was wondering if I want to pass the fd
> type when DMA-mapping from an fd or "detect" it as I do in the above
> commit or have some iommufd_fdmap_ops in this fd saying "(no)
> pinning needed" (or make this a flag of IOMMU_IOAS_MAP_FILE).

It should be autodetected.

Since this is unique behavior for guestmemfd it is fine to start
there..

> btw in the AMD case, here it does not matter as much if it is
> private or shared, I map everything and let RMP and the VM deal with
> the permissions. Thanks,

I think ARM would like to do this as well.

Hence my suggestion that guestmemfd could just have unchanging 1G PFNs
and all shared/private changes have no impact on iommufd.

If so likely all this needs is an invalidation callback from
guestmemfd to iommufd to revoke on ftruncate.

Jason
