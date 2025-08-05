Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5E293B75
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414865; cv=none; b=WPnwDmfbTKaTX6NVMZtgAmXd2BKNzO/+A7wAkT7iO0JTlzX0TaFVXok8g6PWIm3FieQ4GBqAbxgo8r0yWVkQGwFcNQfPfKMH6X969Uvb9TECuvc3SMgF7/L5FNZwk3nWo9jnh26VDSxngfJtW/hXm9G1l6+PykhwLkh1cX4q8Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414865; c=relaxed/simple;
	bh=ksPy7bPW/9nCkZK2o4mLxIR2SoHOhV5fATid0kfvACw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofueKspFSCz0EF4a3qZsaevobadABIHpWzw709uMZlRA6reEoBWuSlLfDMqmac4iVTF96taqf+h1vsQKM+FQdyVPTpTNcXn1ZRIVy2hoyNC22bs0BMLJmOit5ikvNu2qrU3FYovigW2s7xGXY7BFiK7VrL4NVIlPSrk0eN/Ax6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RHQj1mNZ; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RHQj1mNZ"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e182e4171bso485176585a.3
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754414862; x=1755019662; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WjDqUy71lV/WUAYYIZFC/brYVFN0tl6XNylwIvC8u88=;
        b=RHQj1mNZoSrHDz/6LWVgVs32nORofP+zlZ8mVWzV0MO3HgX6WNqhvlmkpkowzz9VAy
         IdDCfRRf4MAx0R0cmwxQSbaVlFJhQms/T+EnO7M/GNqcKW0akeqeiowx86xZIfCeYGyu
         55RY0VnddZxqjNuiFCwSE2WRPQhp7Koy96FLpWyaq/nOQcJGy16LL7a5fOxxLYkt6lka
         MpIGy5x0IC/LfwHYTWAO8McK1WI5fypVfGgbBlCGq2l3M2kLgeJCN1yD4z6vu91vq8km
         mgl7NmfWx4bARx3dHvSvd9v17ZS9ZPaU7CryroVPL68GVXJmucC33hiAEDKFiIXvDu4D
         TtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414862; x=1755019662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjDqUy71lV/WUAYYIZFC/brYVFN0tl6XNylwIvC8u88=;
        b=OA8t1EyieRIeFrjAzIPg+CDDay2CQXeV5rE2DPY4dF9K7tYhApvY2zkXhuoTL33+lK
         2/A+XeAxxiJCHoniVqBDGXqAI4ayzkDwWg5h0yGPbLaYjlM4x0qJeI23AQic8Eh6c8JB
         i5Y2SXr/gHt0jg6tgsnMC0p2LL0RyOG5p9W+kGG47FOHWe6bFPq0QDfEZfYq+eNhJHQa
         XOahSqmgu4l5AbhKDFHdw18GCjqN0iaIzpQBmAbYkwRvJTxzmg6J4T6hjnwtO6wcM6DE
         uz6O7bsxYXyu+1OGvyohVzwLY3K63XVGlds/HnFB6uVHksbv6Z6pKH5Ve8NrBHpxVxT/
         bVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2bBryKwRNcPZ3ueIJSr+wpG5uyEIZ2A3le9Aqjkke1H+wDhdA+Fu3wIInwM0lN8dUPPqzKm6n6s3x@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4pNXMweRnjgL8pSLa9b7C5dbcao7c3A53JkEmOFtGb9GBE6fq
	Sj5EVlYAHQyumD/tC5k8d7NoXzSNogW5W/gJ04M6u4bPszfD6YOpB5Y+ySmUp7t6YLw=
X-Gm-Gg: ASbGncvULkcLu8s9iU2zUifwO6iwjPYmcqaErrU0Q30S4iwRavHGisMnGqftqAoSHCn
	umlMArigGiqc1FRP7YD8NLbUAdwYlnuk+yP6cXdiPhUqnlozL4H0I86FHh2pXL0G5vsubh8ho9r
	xBRi0eN+5bmfU3b6J0Hpu9HYKsWylvAK2JuXPl4UdgVYa4nAHjAmAH3/BC2fuNr5WDCgwRjPY5+
	87dmaMuOkYBRLqnimZcHffTU/0jjRZnNA583qMtRkANy7ttSchZpM4bsq2vgfBGU0r3nfnd5VOK
	PYNnJr/OEVH5DOxKDC6qagl4IYKjWq9iqX/5wi+8tLvrG4WKshVG/gpH/SWBdUnpEybQoU3ZOfB
	KJ0kel6kLiI2J+jM557GXioaKe5ZVTvLr2GWiA3KQMZAaTy+LLbBmb5OsWNj28oBltCmh
X-Google-Smtp-Source: AGHT+IHy7XpO/6qEYngCoahXnCYpu69oHlagjnUCUPJ2Su1NtW9vipMRvRP+Dn6+sPrF7WNA3FiTmA==
X-Received: by 2002:a05:620a:a203:b0:7e3:2c33:6d9f with SMTP id af79cd13be357-7e814dad6abmr7669585a.31.1754414862403;
        Tue, 05 Aug 2025 10:27:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e806ad969dsm201306385a.78.2025.08.05.10.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 10:27:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujLRt-00000001ZRN-0PWO;
	Tue, 05 Aug 2025 14:27:41 -0300
Date: Tue, 5 Aug 2025 14:27:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: dan.j.williams@intel.com, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 00/38] ARM CCA Device Assignment support
Message-ID: <20250805172741.GX26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <688c2155849a2_cff99100dd@dwillia2-xfh.jf.intel.com.notmuch>
 <20250801155104.GC26511@ziepe.ca>
 <688d2f7ac39ce_cff9910024@dwillia2-xfh.jf.intel.com.notmuch>
 <yq5acy9a8ih6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5acy9a8ih6.fsf@kernel.org>

On Tue, Aug 05, 2025 at 10:37:01AM +0530, Aneesh Kumar K.V wrote:
> > To me it is an unfortunate PCI specification wrinkle that writing to the
> > command register drops the device from RUN to ERROR. So you can LOCK
> > without setting BME, but then no DMA.
> 
> This is only w.r.t clearing BME isn't ?
>
> According to section 11.2.6 DSM Tracking and Handling of Locked TDI Configurations
> 
> Clearing any of the following bits causes the TDI hosted
> by the Function to transition to ERROR:
> 
> • Memory Space Enable
> • Bus Master Enable

Oh that's nice, yeah!

> Which implies the flow described in the cover-letter where driver enable the BME works?
> However clearing BME may be problematic? I did have a FIXME!!/comment in [1]
> 
> vfio_pci_core_close_device():
> 
> #if 0
> 	/*
> 	 * destroy vdevice which involves tsm unbind before we disable pci disable
> 	 * A MSE/BME clear will transition the device to error state.
> 	 */
> 	if (core_vdev->iommufd_device)
> 		iommufd_device_tombstone_vdevice(core_vdev->iommufd_device);
> #endif
> 
> 	vfio_pci_core_disable(vdev);

Here is where I feel the VMM should be trapping this and NOPing it, or
failing that the guest PCI Core should NOP it.

With the ideal version being the TSM and VMM would be able to block
the iommu as a functional stand in for BME.

> Currently, we destroy (TSM unbind) the vdevice after calling
> vfio_pci_core_disable(), which means BME is cleared before unbinding,
> and the TDI transitions to the ERROR state.

I don't think this ordering is deliberate, we can destroy the vdevice
much earlier??

Jason
