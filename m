Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526276;
	b=lxDLJI0gxz4K/5GPU/0htSYxHgR56CwXfTvivNvukXvFR0SFiahS0XzfAgjg1eLbmc0d
	 P/Cp4rNNpbWG9KcbkErWGYfgkOhuispbtjAQn6PU1DF9SWXtzdiBhZI8zMGIrRtb0vRUL
	 9UoyCBo9fmIIEeTrrPfWYdnZjkDYziSVs9QxxF85c62tUlj4pcSWkCNJ+cktQ1aUFFhc6
	 U/PmzHlGH+tWebt1eQGFih6eLqdTL1ONmggjEVuMJBTS44h96R//R1I0YfcXoFFlNHlYq
	 V4TlMot8lgsLoCylqPIsDHfqejCz24qLvSCHgLdYL7V7hlWPfJKBt8l3dcuEX1RJJ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
	b=uS7YwYM9A3fd67FZ/NuIaxEhHynobh7wNzivysmSna/H5A+n8WuD96BLtO1PtpYcW8+n
	 yRIskIqXsfRVk0kwWELYWLAF6SUBIWAoITtG9jTOfekrNNvtVXEKh+Q8EPIiiObFaZX2O
	 ljGKHPr1AhnLytjjINQ44Lt2pNR3hZM47sPpBAWSMOjQpxj50756bHiYyqBBRUr36vt7u
	 LVIzOfbAC4FlTkr+/6OSKxi6FaM5ohTtR8snOiEtV4tSB3p5QITaXuwAbWZD6jK0POMrA
	 qII4t8LUioIHHJHmT3oZ4kDpOObRF53H4htzH3PfdK+ZBbIu/TslR4/fevYPe1aCHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TpvdSgOk;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C4606A322
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 13:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5C4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TpvdSgOk
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-921276742e3so41912836d6.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795526275; x=1796131075; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
        b=TpvdSgOk6WWTGFrKx+ao/aLASu3ndPzaaz5li6JnfDuEhWglOpNDI5WFworLuX0nTe
         qpBnYjSpJNdhCbC2gmEIpIsdBPbT2Zmgqg7/k2rNUzvQY+ejQ5cJO12J+e52++rmzesM
         5umcH2u+3NOE/kslAqvgxLmN2+4sWO3hTbDBO2/8vEG3A5T6Pl2NQRjHgrGyDp9hJUh7
         nZDDXLHaRmYb0bYKcaqg5eFd7TZ2okx4ZRhDzBcyHLfzM8dXDjuW/GzZj+SYhSw8YSiU
         j3AW7MdeUNEnbYls2zPXGVFNVytP9l4PvBRamUJ11wmoireW/QepFFY3RQUgQ1YbZ5uN
         8KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526275; x=1796131075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
        b=ajZOHTtxin7PuIhpF1/ily5dnxAHsnOxMldpPykik6gBJTB93Yhs4i5mVxcSQwn0ff
         Tn/cN3E0gjAL236jLniRfgdj6AGrbM5EdBWYTGMMv9iMTfnxG0D0xGG3pGDV77G5E8QI
         5NbawyeHuWqCPJyAZqiqi2s10ru0SogJl9Qp+dm8WQrsQWEM2vrvNfHTaYifPeB0x0/l
         jwRaF2kmSMc532+5RnYWYT1V6pJgV++215nPIfTlf1sO4WVSRyEHv/M9Z1mr/dtTktXl
         aAgWCTWBKConSCWgRaMP27yXoQ3nnn+JSDE/B6U6IVSvFbiAx6/PmiMfTG7Tayhd1jQq
         VSIA==
X-Forwarded-Encrypted: i=1; AL+hErFg+HUhogRMMFNG0QPJP6UvUU51Avztjun5J3dCZJk5ZCZb47Cc3uhBzPUb/pt/HZrulj9vgQdJO8oQ@lists.linux.dev
X-Gm-Message-State: APuU4Z+m/S/03kZDzwaZMTqC+il75XY4Xh2Z9QnuA2UmzBTJs8AeyAG3
	sch1cDqiMLE1QvaMyLDsGwdknUm9EBhmkCk6byTz6sqnZspJH4DcRGzoefD3Qt3etFc=
X-Gm-Gg: AZFdTZdL5IMCMVMe3lfnJGk04y7PIqQKCDkphPIzruavWKYxd4jOqRRcuq7K9U7e29o
	qznFXxVPBQo0HOL2jklJJbwWJtfEtlZWNIpzuqnqKo8P3DLhUOK+BJqoCE79kGTMyk9xOFeIP9V
	JFULQk/4UWmgKulkERerm+FE32DsLI5CFsGqxCVADCdz1UgjQe1UiD0y9qVareuY6Cjmy4Xhyg5
	+UdOZHH78plEIZG6w4B6q8QG+NYCjtV8iraOmt67ZLAgZ/M+KONQO8y2h1aBRJTu4gbRkcYtMKd
	CRAYbuSBfaBTObSdP/Ck/MVgaz4w7yUjA0BB8qalg4DMYLQDAYnUM1pyQ7pYos0tUJV9AbNuRCg
	Y+MzYDukKP1RjzJkjvDI8xrytLrP8y36XwdZBCpgs6iV1VV42nVMx1jx8568icE9l6YxZl8bRJF
	By0kjiHjt42Ge5rFHhu+856Dzeip5e3T/Eh6Hgl/EQ2YcPtoKFFgqTmqBBSR+TJig4aHHneEPns
	LT4mxo2t0gQzCawSroOqBYBQVw2GztU0BgPtzh4LXS/r+bUVU9VmjXNzY9jSLJD8HSfe7oA1kz7
	ZUweqxY=
X-Received: by 2002:a05:620a:3722:b0:949:472f:226e with SMTP id af79cd13be357-949bab15455mr2786066785a.71.1795526275080;
        Tue, 24 Nov 2026 05:17:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm134605646d6.17.2026.11.24.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:17:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqPC-00000000P5z-0Ouc;
	Tue, 24 Nov 2026 09:17:54 -0400
Date: Tue, 24 Nov 2026 09:17:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Message-ID: <20261124131754.GF9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <20261123185826.GP14811@unreal>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123185826.GP14811@unreal>

On Mon, Nov 23, 2026 at 08:58:26PM +0200, Leon Romanovsky wrote:
> On Mon, Nov 23, 2026 at 11:25:33AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 03:56:38PM +0200, Leon Romanovsky wrote:
> > > > >> >> But it should not, as you are making driver core changes that will
> > > > >> >> mirror the same thing that that patchset is attempting to do.  Please
> > > > >> >> work together on this.
> > > > >> >
> > > > >> > +10000000,
> > > > >> >
> > > > >> > Greg,
> > > > >> >
> > > > >> > This series came as a surprise to me given the fact that device trust
> > > > >> > series is exactly for that - allow confidential computing.
> > 
> > Device trust's primary role in enabling confidential computing is to
> > give space for the userspace to do all the TSM and attestation stuff
> > to get the device into T=1 private DMA mode.
> 
> <...>
> 
> > Getting the device into T=1 should influence how the userspace decides
> > to set the trust level, but it doesn't interact inside the kernel.
> 
> The point is that I’m describing the reverse relationship: the trust
> level should determine how the device is configured, not the other
> way around, as you suggest.

They are unrelated. Neither influences the other. The user gets to
make orthogonal choices if they want T=1 DMA and if they want
adverserial. All combinations are useful and valid.

Jason
