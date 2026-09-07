Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FE4CA272
	for <linux-coco@lists.linux.dev>; Mon,  7 Sep 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785553; cv=none; b=ccwbe9S2uygGuBS3HH6vTIRs4QgkdnrTiUuAOFFt5K0gRLU6aWgM9iibFJTjDmz/7QgHK2WIsRCZJwnRELNYp31XdnUvX4ZoKQSbBDLzCvlzaOi1blmYBLonPJleBXzSTx3TyUONGTd2fCq821MlllNJhCOeMy5D35WubiVUsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785553; c=relaxed/simple;
	bh=CgrQA9S1BOTEaFZVDiNZT9Jb/LSdMZymbY+ZFIFj53A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmfuZJWC8OF/BE1ibaeHi3KxbVA2OINTxIAtrOevwIf3g6ASe00+s7fBaA6wHAKMbKqmK18XHVe1NzpyyJ0bRghXxPK8KP9McXDCDkXJPgigKkGvFkSnCg6nlWeJ+S/Bohs9s7VjDdAVVmnxXi6Me36lnOrNDUNMJHezcXHcSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IBromfFw; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IBromfFw"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso32775776d6.3
        for <linux-coco@lists.linux.dev>; Mon, 07 Sep 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788785550; x=1789390350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=IBromfFwyzYPQXbxz/H9yY8ph+Lni6CFu1nS5fdLaYWWU8dUgXnfWzRd4545WJ2hmv
         iqQ7KOgfgRh7hEt9Z0BaFnzOuVW/pWk6tR4he2gEhxajG4GhgMYaj4hsCeCqZUWFHYGq
         SEQ2R6TBAMg/HzEYdGn0gROJ87l1J1rQMI5pAX7s4Eb1YEpT0+OiVGaElERRSik4Hyve
         bdthzSRLbSplHXhOxXq3NJdkEbNvbUNd4HM3L/jLTvBgeGRgocbnPyfRVylZ0S+AkfgL
         s2gRGoTp4aHqyuRHllwPcIjcXfULPlUJzIJTGUxdoNwA8gkf/ZW9DNjk8wUCexVHVZnd
         sJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785550; x=1789390350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=r3bCLDEhVoq5GSmAU3Q6U1MzDCjh4kgW5KtdWFwL5P7XaNjR6NtZNdJja1kh6IGKvG
         5b9Au2haQuFvRf3S1k9d52OPLmw/jSBb/08E2VolLV1ZBDuqRJjInTstFaRKRFmXsgyQ
         PUGHoN1sN0aLZcE5IQB+MXvo5uMFZkxLtz1GOyjTAVqbJbuuyZ3/HUB0Qd35CzUDc+3C
         PURYOlzubEdMdsJhAblQAwKabb4/tOyDsS4xWYcT26lIHR28x4/sTBP3AhNOl5WSZ36z
         NDdeZftE9Q0mYPJYTTTzeAZknck/+5Wka9mrLU9BL8iidALJNBMn7zNcPr32qn2XGn/j
         bSrQ==
X-Forwarded-Encrypted: i=1; AKwUvByvp3OcIXD/o7yF8LEoynC0mYyjkXKolxYxUpq4/nE9ZV0PMo7E/MYKPeyUwJK4pUeJqfFIFAbwSgsS@lists.linux.dev
X-Gm-Message-State: AFuF++mKzVwl0/WbpdAJXpAEuBMrIkCAOU4Sfog0a5UI7v9nHekjgFYl
	Kjbv3a3ysbnYZdiNti1sgg/CKN6aPAfqS853ncWJia07twlIPB2vx9EPvScDI02Tgyk=
X-Gm-Gg: AYBFou20FdHst5eUNyAibecLGPIA1/cybNBcN6QD5IfIJa+ZB/GCWhz7XmzX2wvo8ew
	gx5AbCG0O5Be+nEduKPCG+NBX+g5+EL9+cdW0rvMRuWQ0EVHMxDIlVx+l828gUabYxuDqNyQcY1
	NsSfmihZ1EcCY2+6I2mS0FN3uY1zwVodISXZjIst5LZKUqhykASudSbm6i2Dj0xMeJzDRHXTnzM
	AKYtmLXCUYMMvDnHuVgP1NS9qnsR2l9zO/uXwmxWZXm8bAAiwpDDcc5Km9/rJ3G4NFCQaSSLVwI
	WnP7cVOphjLQRQxqliLuaHYy5rUH4d6yVY/30hRRQbOcgS3ALq2yDy1A8jrxQNgL5ru+g6EJ/Ty
	NF7/x7QSX3egkKpoDhgOt4k5dv7eSr7gBZ2E5WC9Az1VN0fdEB5M1HwDPULundVlMcQEu/imygk
	IiKA776TXt/WyPjoAXet4TtcspNFwGFbv/G12uuvrKgqkjkyCyBa2rDZ5zpDYKJZgScJqOvjwz2
	W8ctsSLEQqDMZlBbXnVcpdi+Hr3ur3pOb/AE4Kf5c0aUw==
X-Received: by 2002:a05:6214:3d8b:b0:910:479a:f7a7 with SMTP id 6a1803df08f44-910479af8camr173644776d6.30.1788785550029;
        Mon, 07 Sep 2026 05:52:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91048476220sm62621416d6.31.2026.09.07.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:52:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3Ypo-0000000AfMt-2MmF;
	Mon, 07 Sep 2026 09:52:28 -0300
Date: Mon, 7 Sep 2026 09:52:28 -0300
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
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260907125228.GB667892@ziepe.ca>
References: <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxupjsy2.fsf@kernel.org>

On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:

> I looked into this, and it becomes fairly complicated. We can move all
> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:

I was going for the opposite, you'd move everything out of arm-smmu-v3
and into the arm-cca-host and obtain the viommu through tsm_ops not
through iommu_ops.

I guess I pointed to that in another email.

The only thing arm-smmu-v3 should provide is a simple function to give
the pdev phys and irq parameters. arm-cca-host calls that when it
creates an viommu object.

> 1. Adding more CCA-specific code to the SMMU driver.
> 2. arm-cca-host continuing to own the TSM link setup (IDE).
> 3. Adding callbacks from the device communication helpers back into
>    arm-cca-host, since device communication still goes through DOE.
> 4. Moving the device communication helpers to firmware/arm-rmm and adding
>    something like:

With the above change you don't need to do any of this.

> The locking also becomes more complex. Unlocking a vdev can trigger a
> stream key refresh, which is owned by arm-cca-host. Currently, the locking
> is simpler, using pci_tsm_rwsem and pci_tsm_pf0::lock. With the SMMU driver
> owning the vdev/TDI, we would have:

You can't really avoid something, the vdev *IS* the TDI and the ops to
effect it come in through the iommufd path. The ideal version is the
tdi is never used outside the iommufd path so you don't need to mesh
the locking quite as carefully.

> - pci_tsm_rwsem protecting the lifetime and registration state of
>   pdev->tsm.
> - pci_tsm::tdi_lock protecting the function's pci_tdi pointer.

Like here, why is there a pci_tdi linked to pci_tsm? Anything coming
in outside the iommufd locking is very suspect.

And the iommufd locking should spill over to the TSM, you should not
be able to remove a tsm while a viommu object exists.

Jason
