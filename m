Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909259;
	b=ViKTEYkq5gHCfCRdoSE9qOY/WujVx/+7MbAHC93FXIHMnR7ECpisPXDdg4BkFBawfO+b
	 OACGtpnyxKEG/mGTfBi2OE/WUnQb3/2fE5/8SnvYbLk9/08b1f1Sms2LCODHG4JG0vBwG
	 jsxlmn4bHHNguDse+ZnEOUBRY6vJmbpX685WmA+AhvqQSKEIALGYiEWvd+dxiE8hbiOe+
	 7gEqVcMLQFYa1nsX56xNTDOfG4NFRrL9z2yZW2ORPpCso1fiB15IyH57vfR22dzlk2jOX
	 XCYC1GumKEpcBPra4tRozKMSmYmiIPU4le9dPvN1n5MlIJTPPQw+S+PZOIs1n0AtpfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
	b=KCWMzWVWoFwjEkMjPMu7GIAEOgNsxhZSCWk7c0+8ic5hNZfmiT0n8pj+DGK1pAwlQi7x
	 lUSzj5B2TRZITxvfnxg2Nu1dkArLrs51wHyob7QnXgyszFoVQdPL39fVm/gM1teAQg1Ic
	 pf3GlqVsjKIjYd2xus54b4pWNhpAdpxnDEATRv6b12gkPTUsD0Fj8jeg8KXUjjTNLS67q
	 ct2Bj578UUgJxVtOfS99gq+ZbqKh8qyN/iiUNZW0IikIYU4sGAEekJ6aH661IC+sEFfhA
	 XCjnardd3lFaWrF4MMpNWXA0LvD6o10y0CTX6Y4MI5NDf6ZbkS9OdQUy6SOeidva6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SAR9OnkU;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4966082BD0
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4966082BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SAR9OnkU
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-980c4258105so1233140241.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793909257; x=1794514057; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=SAR9OnkUfh8Bk57D1h9VhG+n+xp6rS+jFsjk46kHoRXHVLX9haAbLHq+wxnKVLEXEe
         w9ew4dTvVCWZAVaNkBSvF+kc4KemD2YCY7zR3oIavVuYN8HZ1lSFKYLaYYuoaNHWCnwm
         cDm+xoDMw0z5CiBEM2d4yQlvVeVKvnxAYh2AFFNMrM8X0oQDSkhFLd461s/fYfptyNB2
         cIOEZjwSH+nYssA2XUyFiEocrR+0i2JJi2RCdLYWTdYZjWEi+a9PK0TfDnoD5dXhB8IU
         FTpq575un/jRIEe8hDw4Y+yBtZxvaA5EZtmy78v9qP/a2PTPwEObDdnHE4w9CJyiYgE6
         xgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909257; x=1794514057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=bj+pk3wYvTHmGQWvxKtX62/RFWIEX7gsKby2Qxne8Uzl1GcUFWzfieEEf9zeGk1QCu
         7sd0RHaoQhgNFhGYPknlQLaEg6WWW1Z0v5jkBrTk7sn2fhbdN/YVajo48arpQhPcUB4n
         BceAyBCiDDHTdj9VLkXTdjyAnSyum0LSwv045KLHTxYbYPJrgMiIJje5YgRdvkGnR7pQ
         KpppgyqKTkJDjhL3EsB6LpLIuEsVI2CYFTLVgBDODbLsiSTHNDNk3lUSxJGnCoMHSiAG
         Qr44FRbThRHCLmomncwpFIRN/y/l6NVYOlTFai2QlDzjhSvBmmsNL9DIc6HxsNPkJLn2
         bADA==
X-Forwarded-Encrypted: i=1; AKwUvBwvUz0/0wRTRdnwxf9IZaSJiSgPR8IebxCtLeiWYLYIwBtdcUKcjJ474z1ZWh3m2Hqd2QmPPtFFYlqE@lists.linux.dev
X-Gm-Message-State: APuU4Z92CuzQa8dB5EEeikHboYqDBrOgE4L8qeKmkWlehJ7RqWk8UQut
	uReLPGb77MapSyexJLsXW3hHvnwhZv5Uy+W4UMpQAkyHPKeW+aqHgSsxoJIm+r/EIhs=
X-Gm-Gg: AYBFou1L9fR46C2LjTYUQ9hdevXjx3QWPwQF3DdIMorKuLD02o2gsoJ2eK9KHxanaZV
	LTpWGniV4P7lBrM7hBldkXJ9fjyqsG7LXcJHQEi+X7ibkcp1iEBaCkgcD42FVCTAdxLtdeAkrEQ
	ebx3ZR1b0VHu557giXO1Q54VKcoZ7NDiaF3wsMOjDEMzVUCQP9+8fpMbEREnWnRiUa4yi1Nvx9x
	3KtbkCgjubVO7wyle8X6RRbp8T8vhCg1dkIVCc+/vr5lBSOy2dsKB0NW/r8LoSmpKaCGyn/3Yui
	+r+Az33e2lpo0ezxR8xbolLMTDcs9LY7VqL8peBP9pW4ZIFr4ma/tPt6lNvQzAncVSGZVjXHI0t
	nHjsEb3mTEft0ce2kjCi4+lFxCPZIGfz6zG3O2p8aW1KDaAdZd9rnGgBMQmBoyGwaCAQaDn6hRv
	NJov2uVr+pbJYJnYBwCo9dq39rHTcwLVFL3+maGNbxxr4nmtts1DShVgQDQr8/xcuVyr3FHBbBm
	HKoZ29HsPcB/pBqhQ9WL6w2bNg/ivDZSRHW/ci1P5ebIHDd7kaNrMfq6RLEL05YrL52JP+9AXnu
	hYWYzeTDrj6WAN99s+tpdnUHKN/k813peylRgYgtn0hmpZKtuOL3SREEYo2JAXxqv+zSyzHrSYi
	D5WypqldV1g==
X-Received: by 2002:a05:6102:390f:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d2a1509e88mr658597137.9.1793909257584;
        Thu, 05 Nov 2026 12:07:37 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm2610604e0c.7.2026.11.05.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP3kF-00000003dYX-3Q5c;
	Thu, 05 Nov 2026 16:07:35 -0400
Date: Thu, 5 Nov 2026 16:07:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
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
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261105200735.GF663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
 <20261105182106.GD663069@ziepe.ca>
 <auzNkAGFLH6da8fq@nvidia.com>
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
In-Reply-To: <auzNkAGFLH6da8fq@nvidia.com>

On Thu, Nov 05, 2026 at 10:40:16AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 02:21:06PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> > > On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > > > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > > > >> attachment to an S1 paging hwpt, right?
> > > > >
> > > > > Yes.
> > > > >
> > > > > The VMM must always maintain a S1 paging attachment that is the
> > > > > identity map of the VM on all devices, same action as when there is no
> > > > > viommu.
> > > > >
> > > > 
> > > > I am currently creating an S2 paging attachment. This results in a
> > > > configuration with S1 disabled and S2 enabled, which is used by all
> > > > untrusted devices.
> > > 
> > > For validation, that would work. Yet "no viommu" should would be S1
> > > paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.
> > 
> > It doesn't matter, consistently using a single S2 for everything is
> > probably better..
> 
> Hmm, I am confused: if we use a nesting parent, why do we need to
> allow a viommu without a parent HWPT here?

It is because it doesn't *use* it. It is a confusing to pass in a hwpt
that is never used for anything.

Jason
