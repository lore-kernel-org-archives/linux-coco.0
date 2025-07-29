Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501291C5F06
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753799624; cv=none; b=upFbt9NVFQCeGvQu2l0hXdOcxf9YyPBS+pWlWI5x4ZAfznp5KtPd42YTU8+wOa9jbw22A/rl5sbQppDiPmOahO5kxdetO0fPzUkrVc6NWAGWRsBYt7afsg1FJ7C4pgQz84GWUvsQDbw2eCyimeAJraSW8UWdHLIatTSrhfdAb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753799624; c=relaxed/simple;
	bh=ojv5Z7THW8JfrqGJ4bInzPOYWW8IoCSNM6sPyk5dgw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3WTwoJPSB6xGwwFvJEeEkX0936hytIUJBbeZR44QPNd6gxCI84J9tx/mQlBxFtPva4sVaQQCTLcU8ktRjwtHP2/pWt88HqaCc7NyKav1MnBhU1rReKXyZmGZ3y2mnie93wautwU+wrKTIMdhHBkG4CiFx8v5eP1B7XfYbAKE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C5fImD0q; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C5fImD0q"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7df981428abso817358685a.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753799621; x=1754404421; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zc+uyc/10nytSXi8WQLd6ot7w8SU7ZrDrS30Eiz0b4M=;
        b=C5fImD0qczcn8zPNSv5JQJHYeSBQ/Uli/RsMr2vdNZQwKCxlmBMYyz49OgfbpkEDM8
         KC0sL7KYObkgRjmYMu3BU/Nlh0CwgZ//y1wZkAhcMHW8h97xspiJdQv2GJ0ENF25qciE
         Ey19bGtf7HWQcQh25uaS3RIZY0kpkw9bct4gvpV5lSoyZ+Y4BM8hTEzwL7dR+mURVD/v
         DDFFWAuN6Osuyr7FmP1ZC3KM72mwbamT7G5DG+FO2fbY7fUXl+C5T+uc9us4dlCPM1qe
         4Ki7Yn4rwXH2H2SkybGYoIEB6Q0LlQrz4sllFIJ/u2QyjeH0HrttxxXAmPfopedszMzZ
         FagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799621; x=1754404421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc+uyc/10nytSXi8WQLd6ot7w8SU7ZrDrS30Eiz0b4M=;
        b=i06vB657qYmvmZc2iLjCZ9pN/y1NlG4ZAJ6zHiai3g5ztBRmfiTNmH7dSD3mvMVk5J
         YaSGFW348T7jveek8ltzwJ/e5w72R5WjxDaiVFgBykHSPrvIab+Jb3adT+YZ/gJ9cuNU
         6qhZElbfYPWMtqJFasx5TsgOefCgmeSK6HUkeZbViKvlymj1qrYuivMCBcuzD7LtCzjS
         Cw65wX3SaSDf/9vwXXVhjvwLXg0Fh/C87L37DPKbJA3SLKz1jaHW1DfoUcYccWhT/vUG
         f7Z0HJD94jumFl/bsHryDfSxqNyJOvMTvNG/TGUMfTTRVzlLyAl8q4FdIHLOKO8ix/tc
         TSOg==
X-Gm-Message-State: AOJu0YzYfmQzeoztEJBZ//ml4NoaxXZAz0rINZjoFEf50W8V51EcP1X6
	Xjbbg2lvQxls0HLqzouhVOChvKvcTJck1wjiRRWP44VgfmBuc3UqbtdtUWsHnYZW9N8=
X-Gm-Gg: ASbGncs74XbPDId02jeEsmjhBRElHJCFLZoCttJif3qLCdsONVrqzZzbA4LmC7D7HOy
	wEBWh5iA0HPVMi1MYZX7pYkY/mv+Gw/sJF7U9DMLFMwhIpkfH9obTa3xYbn6sDwqSbyDpn2z1LG
	aYFaWZmyvOKI8UrKbgtzjC/YByKZOXMuvKLu1XxPMFhF/ff2lOHhFNHrYmG+6yt/TwyYdMZAVA4
	eFxCLkBY7SKWqiV4kLUDwNdIoN3XCu5bcd/RzUVNY496FQYB7hY66/PqzQP+a7pC6rNLzbWMd8M
	bDRDql1DMRlVwJvvr9t3WaH4Qe5IKjrgb1DbKw4LiapmoyCCum88XHbHQ2GIo9+qCyTqlwI7a92
	3y3wjtd4oMxMaPsNoAb3l/Kh5sKZsIM57SG+ouIY27W2zSUyM21/kv5XJy/bzC1G5Ji+r
X-Google-Smtp-Source: AGHT+IHlakacjzSc6HrtkoDQ+47XGGqWamMHvLTjn6gOzXHOqB44DtAdNM0WnIqA8RXRkWmuxkK6+g==
X-Received: by 2002:a05:620a:a509:b0:7e3:3da8:1d06 with SMTP id af79cd13be357-7e63c1bc55bmr1839986885a.54.1753799620968;
        Tue, 29 Jul 2025 07:33:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e64388f28asm436155985a.66.2025.07.29.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:33:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uglOd-00000000JId-3w7n;
	Tue, 29 Jul 2025 11:33:39 -0300
Date: Tue, 29 Jul 2025 11:33:39 -0300
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
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <20250729143339.GH26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <20250728143318.GD26511@ziepe.ca>
 <yq5a5xfbbe35.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5xfbbe35.fsf@kernel.org>

On Tue, Jul 29, 2025 at 01:53:10PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Jul 28, 2025 at 07:21:41PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> @@ -48,3 +49,12 @@ int set_memory_decrypted(unsigned long addr, int numpages)
> >>  	return crypt_ops->decrypt(addr, numpages);
> >>  }
> >>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
> >> +
> >> +bool force_dma_unencrypted(struct device *dev)
> >> +{
> >> +	if (dev->tdi_enabled)
> >> +		return false;
> >
> > Is this OK? I see code like this:
> >
> > static inline dma_addr_t phys_to_dma_direct(struct device *dev,
> > 		phys_addr_t phys)
> > {
> > 	if (force_dma_unencrypted(dev))
> > 		return phys_to_dma_unencrypted(dev, phys);
> > 	return phys_to_dma(dev, phys);
> >
> > What are the ARM rules for generating dma addreses?
> >
> > 1) Device is T=0, memory is unencrypted, call dma_addr_unencrypted()
> >    and do "top bit IBA set"
> >
> > 2) Device is T=1, memory is encrypted, use the phys_to_dma() normally
> >
> > 3) Device it T=1, memory is uncrypted, use the phys_to_dma()
> >    normally??? Seems odd, I would have guessed the DMA address sould
> >    be the same as case #1?
> >
> > Can you document this in a comment?
> >
> 
> If a device is operating in secure mode (T=1), it is currently assumed
> that only access to private (encrypted) memory is supported.

No, this is no how the PCI specs were written as far as I
understand. The XT bit thing is supposed to add more fine grained
device side control over what memory the DMA can target. T alone does
not do that.

> It is unclear whether devices would need to perform DMA to shared
> (unencrypted) memory while operating in this mode, as TLPs with T=1
> are generally expected to target private memory.

PCI SIG supports it, kernel should support it.

Jason
