Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447536;
	b=sSDQfKC5TRIJK5v7BkqVlHi4Q1buCDt7WhHGCltIAWbvvfkSoejISVFmgTUk0y6VSwkL
	 LV7Wyg0qIyURcX3TTZjH6tY7mPr8pAfZo7h5d0IpIcmByomi6B4QW19FDqSsjGwKBS/Z5
	 aaGGKYAaTZv2F1nbN9eEUnhcLXS6EFhMBS820JC1BqH0s0yBVhcUvPwu840gdr1KTCQuC
	 eneaUX9xqlt7DjWvCR1WxTITAT6lT58WWPYRI0OAB5892dMfCCloHpq8IcNUa+nSrX+Z1
	 uwLd5daGdsFVdfiJgrbdOsI+OXN2DdaD9ciTaZbmAEgZ+PapTjYIDgJAiOtkyupas7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uJeUtw5BXBG6B+iGuyb9j1OIKHpejrpTmDWG1agjBxs=;
	b=H2N4AqreSPjio15fuuG6DGiBT+f+76qIg5syCpNs95BnITVkVsvEYSic7vdRkxgb2kjw
	 Mj/h9A7qRWx8Xt10P1diLOyp4F34+uufentSKIETSZEDp/dvy57fOxiqUlcYplpx2kEpu
	 S7QgGrzCqMjpi/Q3HJaAqOWf+FXihQLIcARNyf9YjtLCfEs6dnKaIzq9wkH5C+07AZTpP
	 P0Cmq+ljWHXbl7RfeiCa/kHY0ogsvG9uxO2u/yzBygQRymJprrvB1V5XJ+3U3DCSW5HEn
	 hha6rybSLuU/L2g5u7t1XVEwx8QwZc9yvw+ywRJ8itEovHoKubh6TX3YN8aSBbwK0zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Q5iwmH+d;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B22606A691
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B22606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Q5iwmH+d
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-949b0d32315so298385785a.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795447535; x=1796052335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJeUtw5BXBG6B+iGuyb9j1OIKHpejrpTmDWG1agjBxs=;
        b=Q5iwmH+dNQzpihQspnPZ5EknU6HI/0PvP1I+036hQnLg13miFGooYywZ5CGnjd+ApV
         OdeNzbgSAc12r4zav2Z3u5ePi/tGH1XO/MQjx1g8hLrD0tYqBGpal/o6v9dn0eOm7Wk6
         4G0KZa0rfSGJdq/iMF3tdCuYNHszH6oH+YLxBCbui9po9540zCW1rD6+nVW5jCG5eXkY
         4xU7PYb/KWFxFwA2mX32ExZ8JAujcfUWv19lrYBC945TsgLEPTyId2qOTY9ZDFyyZpPl
         Gq3yIAgusZE4aezbrXyYud4Jtwfm80O+dxzkya3D3GKEZCyM8w8gLGmrJINnagaI/zW7
         exrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447535; x=1796052335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJeUtw5BXBG6B+iGuyb9j1OIKHpejrpTmDWG1agjBxs=;
        b=2Cjcbq9N8QAPdlJhHAGLrj6Bhjk1pMzOJypY/BIGBpu8s+pohtmOx6aBHC9Kgmk5ib
         osyaxwRM6tw7GTVGPAfSEwrrKOE6t/4qwDlOIY6HBh4tnpLeUNn280eL6PyVXre+QOWC
         wAQQSntQztvtx7vJxQ0C3EYkdNEhNm2ujoV7z/P73iL4mNjWw+QOfJ8/EkDk4QHcQuPE
         x7JWgkiVnRzPYTqbyM6wYj+xY2ovjhQiKICs1JBHlClOt+nfo5REj7Utz46Y5HvOoV5c
         N28xPHhlyqkUcW8lhIT2E9EAVHmCl/YD4ycHv7uE13wyZndzrX4bEhPWFQvYfK0oxKqJ
         QMIQ==
X-Forwarded-Encrypted: i=1; AL+hErG3yyLBR3NzXQhZwrxg8/WNzMgqlPX/2ZJEPKlUaaD3YII9I86M5+s70UcUJpxYNZRLwhLCHWgjpT4G@lists.linux.dev
X-Gm-Message-State: APuU4Z8QBDfzJHNBo60GHQuWeluvYY3XrNfe6TWdnp4iW226wSW/j/js
	skXnxqQr/u/rmHfopwh1ElbYGL4hI2cKgwTEg6J6M3QIzvwzdMPgOkT9zPFhXp4UGh8=
X-Gm-Gg: AZFdTZelRrPOaU6+jvz5IvRmK4HKXhXBYH+6MMSIJ/P3CcjB5GyFxMDM1jUJC9jpCJw
	gvQIJgS/tGioIlswU3A+LPF/uTInbc/91ScBe4qId8wfhtGDVIEa5hdrVEurQqfz/U1SrEsDf5d
	nkXAg4xkVHtMTPAw0iTZry2Mj7aAhP14hXNtdH9hj/1Gym3ho83uPbOeiTYsgmR+zG1RRqt0hTD
	2xLgJ47BvVrmsuIKSiZF6LDdwgHcti86OOz7l6X5leQrGK67CYmh02lwQV9QJwzoidI6UgRQ0B3
	/RX84m49B9MJnFVIvA8pEszNFuBWWGYvyA48wHsridX9ZbFhLocJLohE5LLl/b9TjzrH6Dd7AGx
	+zT+DfANQbZIHL7My/E/nerUk8XI10PpFBMi09KngHUYhmFWBx716yw5KmvfdchIoJW5iSQoixU
	x4SmE2T+kuktdstB4nknA30ZevHbheUOvH+TLfpn4MFTBSOS7cZPBr0dZhSE56Kw7+UbHf/xEtO
	yKPDARzej85LaOJGJ/zdT2LHfs2FOQT0k659KjCyj/R9s+pcM/e7hwPojTk+c8FN8di3FTl5oQh
	gbMpmBNH8zRALKwImVfnw5epwKl9FUSnjYuA3PdM7DI6rTSArOkTdgsNG7PoVfGm7HrRNguGDNW
	/vRk=
X-Received: by 2002:a05:622a:a881:b0:536:6f7d:1145 with SMTP id d75a77b69052e-55d76a27f9fmr215459771cf.21.1795447534734;
        Mon, 23 Nov 2026 07:25:34 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm100671031cf.6.2026.11.23.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:25:34 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVvB-00000000sLi-2ANX;
	Mon, 23 Nov 2026 11:25:33 -0400
Date: Mon, 23 Nov 2026 11:25:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261123152533.GE179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
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
In-Reply-To: <20261123135638.GO14811@unreal>

On Mon, Nov 23, 2026 at 03:56:38PM +0200, Leon Romanovsky wrote:
> > >> >> But it should not, as you are making driver core changes that will
> > >> >> mirror the same thing that that patchset is attempting to do.  Please
> > >> >> work together on this.
> > >> >
> > >> > +10000000,
> > >> >
> > >> > Greg,
> > >> >
> > >> > This series came as a surprise to me given the fact that device trust
> > >> > series is exactly for that - allow confidential computing.

Device trust's primary role in enabling confidential computing is to
give space for the userspace to do all the TSM and attestation stuff
to get the device into T=1 private DMA mode.

It is the userspace that does all this and the userspace bridges from
"I got the device into T=1 mode" to "Now it meets my userspace policy
to be trust level Full" and then finally "Now I can bind and start a
driver"

The two concepts work together, but they are not linked inside the
kernel.

> > >> > Adversarial is equal to the "cc_accepted".

I expect most policies would make "cc_accepted" as a full trust level,
but we do want to allow adversarial as an option too.

> > >> I think the confusion stems from this thread:
> > >> 
> > >> https://lore.kernel.org/all/yq5amrr8yldi.fsf@kernel.org
> > >> 
> > >> Based on that discussion, I understood TRUST and eligibility for private
> > >> DMA to be complementary attributes. Device acceptance determines whether
> > >> a device may access private memory, while trust determines whether the
> > >> core must enforce additional restrictions. 

Yes.

> > > Device trust does little beyond preventing driver binding and recording the
> > > trust decision in "struct device". The missing piece, which I would expect
> > > you to address, is ensuring that the IOMMU and private DMA are configured
> > > only after the trust level has been decided or as part of that decision,
> > > rather than beforehand, as they are today.

They are orthogonal and unrelated.

All the TDISP and T=1 DMA flow is about how the DMA API works and has
no direct impact on trust level. You can choose any trust level for a
device using T=1 DMA.

Getting the device into T=1 should influence how the userspace decides
to set the trust level, but it doesn't interact inside the kernel.

Aneesh has it right that these are orthogonal and unrelated
activities. There may be some confusion as Dan attempted to couple
them, but after discussion we have moved away from that since it
doesn't meet all the use cases.

> > What I am still trying to understand is how you view the DMA allocation
> > and mapping paths determining whether a device can access private
> > memory. Paths such as force_dma_unencrypted() and SWIOTLB receive a
> > struct device pointer and need to decide whether to use private memory
> > or shared buffers.

It is Nicolin's work here that needs to go before the TSM drivers:

https://lore.kernel.org/all/cover.1794343501.git.nicolinc@nvidia.com/

Because that is going in and starting to fix the DMA API to work with
T=1 DMA devices.

The TSM side should sit on top of that to enable it for PCI devices,
not just integrated devices.

I think for now lets just focus the TSM series on the attestation side
and we will tackle the PCI and DMA API issues as another series.

Jason
