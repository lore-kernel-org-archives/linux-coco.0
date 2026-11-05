Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902869;
	b=yaLjBERQlC1h0RyM2yUUaR8pee/ca2mpd09uqkLLdLTcsj6DBjzQQLqC5dqVONxAFde8
	 JS980lJ6jAXNVn0yrfCrdWqGLp1LaHU0riCuVHz212ViHrzzAkjHQgaxr1Z5spRTRIA5w
	 x+W7hFHvwIZWgBSn0oJQ57JWlNRM+8qG929/sxEN+bOzqmb0JleRh5jBsnK24+tnHkLC3
	 lp1F72YPiFMwP2rlVRRN+3rFOsubbgC1zbGxlyIfglER3YvY5Gg9433na7QrenKELI072
	 oErpY5NXcZvJdXe3qyoMJLZY5IR05EWDgYCdxAcdpIIvXwgDSDYD7j7z7eaYh/qAnwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
	b=etChFJvWHYmkDXdVeaCIlFmHsg8KH8SKhl7lN0Xtd83bscj1dkDvK9wJRzAx6u49yaG3
	 u3WBl3JaFRhu43Uf9quDqparHJzceO4lDowT0AjYxfTeK+LHOtjj+P5LJwat9tXZTXzT9
	 Mjl7KvOyEjspQOuMDd6Ot9Co9bs6CH7M1Gsu8Htat70y9P7arRlqH6TB/eZXhjqMpknek
	 0+3pRVqDKqn6xi2t6HhdMXZho/9QJ42O8opboPpbpAL+Di3EMZBkVpfp+6E+LRpbFvQZr
	 iNFxOgHroLTZmPHycfzkSfrR3bCBWP0wQO6SCkllaqnomfIeLICCl9bdEE0upvXIKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KwkvY4No;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8134606A329
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 18:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8134606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KwkvY4No
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so1632456e0c.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793902868; x=1794507668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=KwkvY4Noo9MdiliDbF51fRW8yuF5rw/er5MRULiFOVf9fY/6wsh8QBq9LVWR9wcrRC
         FGp/MWKI9pmGF5kKdlJDBJgYWt6XAd0PV4zKtXhW879oxmqfTs50iY6aVLN4gvC0A+Lc
         OQ68KKNj3+YrIYQMv9egJxXKbj9LJBWQXCnX+HcLfhJCkz8EOVFdtrj4P0TI1F1GbZuN
         drc8OKignNp3MyyVoVdX0RTj2NO0QiGJAijL+s+KJxqHMUE68M8B8zeG5v0jPtHJ6uqK
         CjFVvFQ9JHgEzPnWTPFZzafq2SEsZHvGcfaiO+MtAtVWiaRETW0lRiUn3oJfnatl9Fu1
         tHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902868; x=1794507668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=N1FIA7pzc5U+rHK2uhRE2TW5feVx2zaXkoMYaI0jzP/4qza8T1eRZlYltOUGIPSZpR
         4n60AyDRmmhwKhDZDbrSW3JSjEgI7RkRmRF4iuGbt2bknsbNVujFFx7jJv9bZRWE6x1o
         EE8HXqw3P1eBW31dkMcXCmQWQPa7AZl2IrrvQ3ANqwt+ckEFMA4Sq+1fVkL0RUvonu2V
         r0I7ly9cKnNwaXUAAXCcnRxeJfPvl9yInDVpqbKAC6vi1/bdBAkTI3N6MzsldzYUYxGa
         BYdDigrUUUwdcUFb8LeAaD2J4vsClz15hqy1YGLg00xrwms9bHtNQRhzEpwzBLHfLLxM
         yovw==
X-Forwarded-Encrypted: i=1; AKwUvBxSq5//SvrP9hLMI0jbK3Z1j6cmU1gxD3r4GHzmgsi0qZh2XuAZs50XFpGpDsdgW6ucAHsilTpQrVH+@lists.linux.dev
X-Gm-Message-State: APuU4Z8Po4VypNcJZuAtj3BJ/PsFEoA3e3d1q0eKSRrQm/XWrRtuF31e
	gw0/+ez+nws6WfqOGCfnPT0sobIgNXLOOygK+levi19gIzymAaxZQ++W8/uBWDQCSIQ=
X-Gm-Gg: AYBFou1IIAXMBiNyz1Tssv0wvHrv7m/5BVjDCJhlYMxfbB3w20yUp1OzGcOQgk3ZF16
	AOgdJXua/celex6TfxkNpusnAxJjKbGmdUOp/Kc1O207IOgUKpNz05bEa6X4jd0nk9PzDRONWJl
	pJOjkDssOBhnPT9fwQoYuR5K3tq0fXiXDnqvxRJ4tZCq+4MN7zwOf7rUYv35+KvijUOoBdDBacL
	za80h0IEXnWdZ0ZAvtzx0MD3ZSdo2X/N5GmakSjZ68OLvjNCZ5ayCLOMt3qJI33lPkJlwoT3gkV
	nVsGVG+ONGcFMf80au49KuXtDX5SA+3x1+/Up98zBlgZKzatC2WesLAF9jthBlmNqJPSP4MoFf5
	q75LuRBszrjfun8htp9PDPwWGwbmSeN0vzLRwfz2k0DfOcQipLcaR5/+bzRWrPHePWQPqI9n9NN
	orFJLBysDOU5O8OoWzkPFU6/Mf6xRIEVlI7VSN+7c8jRW5zCzWnX68re6S8T5+IK/qAMFTP90g/
	hv1mXuvb67rK4tV/wzuBv1eNcvmYT1ikPHKChCgnO74DPJoyD+vZpgBlj3nyApAYm4xh0+A7I6U
	qV5jKd3YWWyj+lkEuidWl58FTh8c6D3/PuN1nB3jTKYGpzVQ3q0sMWfUTu6MuuUX1PSM2P5AQFZ
	i09h2YL6M2w==
X-Received: by 2002:a05:6102:5706:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d2a1628b19mr348440137.23.1793902867469;
        Thu, 05 Nov 2026 10:21:07 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998da178b59sm5242293241.12.2026.11.05.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:21:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP25C-00000003LsF-0vAz;
	Thu, 05 Nov 2026 14:21:06 -0400
Date: Thu, 5 Nov 2026 14:21:06 -0400
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
Message-ID: <20261105182106.GD663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
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
In-Reply-To: <auzAivzpzSUHjEQj@nvidia.com>

On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > >> attachment to an S1 paging hwpt, right?
> > >
> > > Yes.
> > >
> > > The VMM must always maintain a S1 paging attachment that is the
> > > identity map of the VM on all devices, same action as when there is no
> > > viommu.
> > >
> > 
> > I am currently creating an S2 paging attachment. This results in a
> > configuration with S1 disabled and S2 enabled, which is used by all
> > untrusted devices.
> 
> For validation, that would work. Yet "no viommu" should would be S1
> paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.

It doesn't matter, consistently using a single S2 for everything is
probably better..

The VMM should try to minimize the number of hwpts involved, ideally
just one per NUMA

Jason
