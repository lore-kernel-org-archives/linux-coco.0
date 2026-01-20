Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E31283FE3
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 19:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938873; cv=none; b=IGttPR0RjDMNeKQb/KtE0sWhm1vByTaLwwSg77+OZuOqE5AHHzw44iX5wr6b6ILk9xeEv6AXyet+7pnwxr/dTxdUDKtx0rPyRrBWWMmHaPuDWTtOziXTsu5OeMk6Vua3Qzzl935CrsV8UOTJj8cF1sXoRa10HfxKc7dms6DmNeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938873; c=relaxed/simple;
	bh=La0LsKkDKC8PbHNW+0fmemOwAXhZUMEOOr92W3Imo1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly+FA9B3NKZzxpfcav2F8VShx1hgAvYdV1wRK+wZVnPfJ6FkUSzudTkfgpwt1LWUEBqS2VMN8vrI7q7TtpjtGhjLPAcfinTmAXU5GNL2/Op8UmSjvY3VauPD6w0c9vcUQ88HKGAkYeEWYiEDI/0lB2NdcLKFEt+d4XEVK0W0330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BgJDYWEP; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BgJDYWEP"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c532d8be8cso540954185a.2
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 11:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768938870; x=1769543670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxUssvnFkASYj4oCeQRkWpfFPQUd3pm6yqx8I9NL0HI=;
        b=BgJDYWEPFZeqdrYqQiNcfxfy6rVVz4c6uUIXQTbEXFtboZBk8lA9TYEwBSBjDcbl0h
         biIyazuoO9j+GZprWzw2VLL+9/DXCD8UeYS7CttjxT6VVCbWOd+tonD1WCgn7+1HlLai
         pwB8P/zqo3+UuEn09RsHDR/DI5hvSGicoFPywk67lukxqZjOPiEt/ANOg8n9z7Xy2jHX
         u+VBZp3qkeAXhzEGQu4RxFaY9FNMjRFRYK2rthC0yxaGfGiB76MqqRGmGvdRCu0G1dz+
         Z7Wr1Ic+s2pXmf4guH+8OXBYKd15M/WyvL4Y/1UhM5i7eY6tlyvJ0LfrM3um3mMh8d2W
         BkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938870; x=1769543670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxUssvnFkASYj4oCeQRkWpfFPQUd3pm6yqx8I9NL0HI=;
        b=sDAIjNP7bIDZbnDP8CCPfetecuZcopWheheZvV7O87bJdEdgouu/M/xJFYXIoJLRQF
         1R73Ag9q4ExeCGnzwDnBputtAmgdFEStRRQJmBeQqsr3CCXpt0BZ3jx6525qX8H34s+Y
         Ip11EeUFbQAKDbFPVg1zGc7QONfqdsuOcZ32VtgCLgIawLMvokn2/+fkP10aOq5us0UI
         wsmxsqvqH223MuEMF4xI6PmREMNQ9fI6aSQt2/dvYPBkGOjNkORTRrT2htGfZ7IfrfIf
         QX6+diS49vErhFjm/77qsUS4NKRkuLImyW3s1qBhK7kJDmyJNbKX8vGE856tIpLBIIrf
         46RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwDzrIWJJzvAz9QbjMdlNQ4dfwDXFXP2fjM0mzZx2ElH+mHN8lf662l9uzxYtzraBZzWOOo5LOWWb/@lists.linux.dev
X-Gm-Message-State: AOJu0YzBen1XwQFlCD9dno8a9I2AOYIDbLIetiOMuwY3ZXJRcD0kiLne
	sYDOK24OyKPlEep+qSt2c9UfxLS+iXYWkQLbSSanJtwDtkBeVEcZi7YPRSVWdRMYl5U=
X-Gm-Gg: AY/fxX66k302qCc2yqsIDVogwIy2G7JGVd+ZZ/6QmRf3/de55znCnP7o7HR0UzUcJiv
	pLfBPb4WWn+43/sTz18OU+cea4JGgvvwl/9pzsVOxbTJOesFHyLRQmfjc+wRrbuSbBOubOenH6f
	VC0M/DRmXfa6+zo9z20Bk6Bhbhly9CZAZ8rWcNQi+y1Qb+Cfbvb1962MuohC1qoLC53H4BL5VWd
	LEVC8kcuGcDu8+/awK3IyB6XV12UYgndGyMJVzte0AA+ipe5A4NVDx1kxECHViRmamafNeUkiqn
	5eXrKLoeTGE7X4nUXcOf8eE2cEojrA0rcyu9P6pBKX2bGdOx/0eg1RirI3HCgr1ARUCjUFx1M13
	dC0BtddLzEFxPMG9To+MnJvCshf/5dNYUDvIxDZWaZFXonYzzrrS++WVxB+BT3/MIPwsi+OuOi1
	8B6zyAO4DUWUFv1QPZ/5QkDUmriMot1pkIi5Z0zfo0I0w3r2zdltWhVrSBbHTN7A4rdPE=
X-Received: by 2002:a05:620a:40cd:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8c6a6705321mr1981470385a.34.1768938869610;
        Tue, 20 Jan 2026 11:54:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad0eesm109052086d6.32.2026.01.20.11.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:54:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viHo4-00000005bZk-0dfl;
	Tue, 20 Jan 2026 15:54:28 -0400
Date: Tue, 20 Jan 2026 15:54:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	steven.price@arm.com, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] dma-direct: Validate DMA mask against canonical DMA
 addresses
Message-ID: <20260120195428.GW961572@ziepe.ca>
References: <20260120064255.179425-1-aneesh.kumar@kernel.org>
 <2a0b6d1b-875a-4075-8fc9-a8534afc9168@arm.com>
 <yq5atswgjrkp.fsf@kernel.org>
 <0da8b73c-5bec-44c3-9902-221a11142c34@arm.com>
 <20260120151127.GP961572@ziepe.ca>
 <a89e8fcc-29f0-4a6a-85f8-ca8ca41c53ce@arm.com>
 <20260120175454.GA1325733@ziepe.ca>
 <2c04d4a7-559a-42d1-bc99-66e60d9f78c4@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c04d4a7-559a-42d1-bc99-66e60d9f78c4@arm.com>

On Tue, Jan 20, 2026 at 06:47:02PM +0000, Robin Murphy wrote:
> > > then the fact is still that DA requires an SMMU for S2, so at worst
> > > there should always be the possibility for an RMM to offer S1 SMMU
> > > support to the Realm, we're just not there yet.
> > 
> > Having a S1 would help a T=1 device, but it doesn't do anything for
> > the T=0 devices.
> 
> If we have an SMMU we have an SMMU - S1 for T=0 devices is just regular
> VFIO/IOMMUFD in Non-Secure VA/IPA space, for which the VMM doesn't need the
> RMM's help. I've long been taking it for granted that that one's a non-issue
> ;)

Well, sort of. Yes that's all true, but since the T=0 vSMMU cannot
access private memory it will not work properly with the current
driver in Linux which doesn't know how to allocate shared memory for
the page table.

> The only thing we can't easily handle (and would rather avoid) is S1
> translation for T=0 traffic from T=1 devices, since that would require the
> Realm OS to comprehend the notion of a single device attached to two
> different vSMMUs at once.

Yes, so far the general consensus I've heard is that this will not be
done, the vSMMU presented to the VM will only handle T=1 traffic and
the OS must assume that T=0 traffic is identity.

Given those two reasons my general take is that we will not see a T=0
vSMMU in ccVMs at all.

>  Rather, to be workable I think we'd need to keep the T=0 and T=1
> states described as distinct devices - which *could* then each be
> associated with "shared" (VMM-provided) and "private" (RMM-provided)
> vSMMU instances respectively - and leave it as the Realm driver's
> problem if it wants to coordinate enabling and using both at the
> same time, kinda like the link aggregation model.

Hopefully we don't need to do this :(

The current thought is that there would be only one device and when it
is in T=0 mode the OS knows the linked iommu is not being used on
ARM. IIRC AMD and Intel do not have this quirk.

Sadly there are use cases for a TDISP device to do T=0 DMA before it
reaches the run state.

Jason
