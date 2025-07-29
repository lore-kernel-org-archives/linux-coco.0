Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE563156C6A
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753799495; cv=none; b=WTzc9+nhh3DBYokrrt/pl+2kG/zAXljcKey1qMCg1SIo0nW2jjw3+U0gqOl5z1U1Owyvl7BE7AyTf0CBRuJuQP6fA/OoDXa7oEnTY5Vjt9Q+aO5c6RlSa798xYotnNWwV223mvbIi3q3btb4L6Iwl2N43cvb1hDwIVSW1htqgO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753799495; c=relaxed/simple;
	bh=AFA9S8jJFe+5kqGl8N1DKFqAh45nYl/JtFITblQV6NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzS7R9K42Fx2yKTkHBYVQe9+yoUfPMq1+WaW5UdKrrAn3zGTmnUqGEiIhMdnaQVBflbbZqKd2+XKo5B4xXvrrfYuPQWWwdwNo5eMBMI50TRcAoEVXay3CY4vQIa7KPy0euxDkoWthw3RlFOIbN24q/Z4gdgrO0wdphnF7LNAYaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gZup8PGI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gZup8PGI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e6399d0656so411007685a.3
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753799493; x=1754404293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZNnUHdSPfcp6QWb5ggqY8dXU0goduBd5NcpjKFrjAU=;
        b=gZup8PGIeKGfVK/3fiVREAEEul5rmv1PNvTIy978d6GdY2x4+s21dOaBjUdurd3leB
         0Gim3DGqzCZb3q/KYMQyC0pjTxDrdOjOQX55L3Vd1TkbuWjBupF2Mnw+vWbqGMIpyPPU
         o1mZGiaIl4cdo71HHbUSpqyiJjDmgwqsci3titTwhCChTOmgB5m2HdLXNiQ3acZooo1h
         qLcrG1OGkJsNYiDJA0ncmqch+VX5FVVMnDka25Pyt4K6d/9yFJBfzeEgLwP3utCoW0yG
         ki2M1D/ovQFat3vEl5W+gCLnOXcnmkyNHlEWU5f9I8RLKhTb8Fn/72hhI3u9QVdC/AIt
         ar/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799493; x=1754404293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZNnUHdSPfcp6QWb5ggqY8dXU0goduBd5NcpjKFrjAU=;
        b=sX2XkDd4qscoab3k+zeBBgEVS+7Ycyz9AVQlFcWLtXUIWZKvvY1kftOcjjyd0iUZZY
         w2oEudZmADZluL3/tvg0ylJ4w5sS+oqIm6pEVCHMTKLnbreIDPaMJuZns4unEgo+X1sX
         /j2D98YSCnlZVNZxT2Fiyfd5RvjkiKNpIX0nLSxV5LRt9Tzs2qagm6Evg/7MLRX1JH9B
         z9NEJQCrNdFUDV05zXzqh3T5yhQsRTuKX7i/o9OYSaObFnzMcfoKCofWAg75eNCj/GqL
         9ubjv9ZNQq7/t9gpFq3Bhb/EPMtdKbiuefxaQVpRJouRAX0ZkeEefOPksLpOzFXu2euA
         I5LQ==
X-Gm-Message-State: AOJu0YzIPR32OVLJtN8atB9oY/XKy71mCx7fdh0L2jE9YDPS4WBMzhhu
	T2NJXD2k+04Z2uAq2r/r4bPCOPH09+Qfho62pRa37zpoR7xhh7zBc2SWY7HwPDOcBxs=
X-Gm-Gg: ASbGnct9CYnR2wAegFpwDzNq0ve09DxOVDXqC1WEwEk0Qu2l5usgwNwKBr4Nz17MvRG
	pQAOT395sNEXiCEh33z2Bja49GsXYPNVPDDCwiSQ+zrW807WDhHKa4IdQd2wVAhlSjf8UvNaCX+
	cygufwzFsM+am3DfrMXyVovptmZ+BDvHrU4NPHhZ+4toSOneqWHii8fSL3ZVEKomlMgRN/IGoAn
	Mk+3vSck554w+2R8VkS375jIr15glEsHfdd5AHnlg136A38ynZXjqMX1ANzhFy/ay5BfOqpIWaE
	oE0WMQDduvoYJEK1sJUq1j88HyR/aeJLui4MGoodrpjXxh/MKRjTHfi8OYLYpbMcDzHiXY7klHP
	yFqSpp+TjyLv6Gme2aGtpjFHeMRrPQpKYPnSEg6fqZ5Mfz3l6VWPks1j5ffjf7PPHAcjB
X-Google-Smtp-Source: AGHT+IFtTSRa0Wzwdu/obR9nIK/NWqbYkP5+Vs9fYL5e9jSRCtuDURGeBrwm/w4UzvcIKUq4y49L+Q==
X-Received: by 2002:a05:620a:1a0e:b0:7d3:8ba0:614f with SMTP id af79cd13be357-7e63bf964d9mr2141405385a.26.1753799492694;
        Tue, 29 Jul 2025 07:31:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e643879481sm435354385a.57.2025.07.29.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:31:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uglMZ-00000000JI6-2o1I;
	Tue, 29 Jul 2025 11:31:31 -0300
Date: Tue, 29 Jul 2025 11:31:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 10/38] iommufd/vdevice: Add TSM map ioctl
Message-ID: <20250729143131.GG26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-11-aneesh.kumar@kernel.org>
 <20250728141701.GC26511@ziepe.ca>
 <yq5awm7r9yu4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5awm7r9yu4.fsf@kernel.org>

On Tue, Jul 29, 2025 at 02:07:55PM +0530, Aneesh Kumar K.V wrote:
> > But it looks really strange to have an iommufd ioctl that just calls a
> > KVM function. Feeling this should be a KVM function, or a guestmfd
> > behavior??
> >
> This functionality is equivalent to `IOMMU_IOAS_MAP`, but in the
> presence of firmware like RMM, we also need to supply the realm
> descriptor associated with the KVM instance.

There is no IOAS here because the secure world is using the KVM page
table. Since KVM owns this I don't see why iommufd should be invovled
in any way.

You need KVM to push the guestmemfd to the RMM and pin all the memory.

> > I was kind of thinking it would be nice to have a guestmemfd mode that
> > was "pinned", meaning the memory is allocated and remains almost
> > always mapped into the TSM's page tables automatically. VFIO using
> > guests would set things this way.
> 
> We need to allocate and free these pages dynamically as they are
> converted between private and shared states.

That's still within guestmemfd's area of concern and it can
immediately pin on state changes.

Jason
