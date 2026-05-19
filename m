Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9433ED3AE
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201333; cv=none; b=RIn+Xyi7InMUYwU1+1J+eQiYGaNiv1Ifk/yZu7K+e0k+gmY/osVxCymYbbFi+eyrYlZ8BaKLaKXvD4fpeTbm7xQ6XaPJ7kyqMMFJLBu+ApBMOtqGt0ENzc3UWCrygp2CXJp8BLKDaZFlR4uvpO6gihbtrmZs/8ghsSbtVB4vQJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201333; c=relaxed/simple;
	bh=SrJusYoqDcdUKkci3L7v9V2XCvsCIXynjFVOmsBOWE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mkfu97tmi0GQxRxtgmRYCPaJHGHTnPlIj0nKNKpxUK5Rhhr7gRH/v330dptBg0h4ritiTHt0iPP2wckP2HbkHQgrJxGicHxCqs9s4a2n7cdC+fAGj8ZA3iTuVyiYAeyRpvuUJmWO7NDgCezdFM915KVYK+Ir+oMOJ+5m7yeuDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fyA3hkxu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fyA3hkxu"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-910f734b477so418338085a.0
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779201331; x=1779806131; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQZO5nTRmEQFRCy1SP5NN6DtrD69wZAHlR442WwrJB4=;
        b=fyA3hkxugEfTfIebzWbPdNvTuz6dvVq+lazElDdASCoS3M7LFXb/fBJFeY7XOoDGRH
         zrrNxYSggPFQsgkj9bxIdceMIrMMT9Bj1MvPjDYWsv1Km2U7VrJPrRtI89ee6XOhPCQD
         SoyowqoQJ2zD/kJ+Y0NyhDv1Ig+NnYvZcc2jLNqjTLUUxuhZmryeXRhl7NEhBEBgRZ3Y
         /IKBBcq1u2pHzLSjHcnlXqP0DdXb0Fwa789/ZZGrqgm3DXeOwc1StwWu4YQkk7Hf3rei
         f1785LNGOWKhPq/izBt9XWYrJrSp4z2cvXFU5finYD7WASi59Mq5jSj9cnMMTKogwFtg
         LQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201331; x=1779806131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQZO5nTRmEQFRCy1SP5NN6DtrD69wZAHlR442WwrJB4=;
        b=Z5CxEIZImbF4uD/hkFgw47+P5tzDXsAGE1EA49XOJvdXmR6s+uIRKg21gWmPowzKcp
         0jL4kKoaZnoJ9ir8d85cycGSyPHaUjomiw6P1OXWvTSwZjkarLkGPTu26xcNvo/FJicZ
         RYnpM0O4TbNrTp0x16D2jvlJOYgXRHW9q8zFvCP7jO02LZTwSJs0gmLKK1N8QeL8tL/8
         i/hhxZATMatI65ILa1Xt2uQQGCPLkgx/mS2yrA9GedFx5Kl9YNCsNeF2gSm4p+ZZFjgq
         nUFvKpmpas83qDmSZ9e9dvKZcJmGu4xfAzX8j5z1WMnxDUlkBcTKS3b41X+ihRV6X3az
         fsrA==
X-Forwarded-Encrypted: i=1; AFNElJ8kUPM/Nl6rpKbQdtELI534E4HVWtVJpv0a19BhRKyaiIjqgL3oucSRf5nzIjiUG0Tpyv0KhNJfwXm+@lists.linux.dev
X-Gm-Message-State: AOJu0YyI1COG+TfkFeKux9T+xGx0jRm7NmuCbF4DA4XTrZzXpHSGYHOz
	tOQnsh8pE9hJBVSJOgcPgbVf5J84h7bvWizhcjASGvKMIuare2He8X/hH9Qpt5GukuI=
X-Gm-Gg: Acq92OEdFliyjE5qoWR7VKTYGXfgHkQAgMap86HenhZ27pz6mbkKyDPSUoDdzI8+IQp
	JqZmhow4clTLr1Ipwa7/LHSQ9Wy647uMwN4jqvOSxsUb8lB5cwiN3T8HGkVpv2OEBgpsLKl4Atk
	84sYURkogRp9muwzk9FvK+Cfn0ZcwGDm+jO2mo9wO5o7pL0CReCKeaMOwVzMCRCz/XUApDidpLX
	ph1YSeCKBVYhuzABX3ger3DeUOqUMlRWpsL6nrMuukS0FSViHKD+2r5ijVtewQnDXt7QXX+l3iP
	OfZXetkXmkp/uqO9XGdjVghd6DzoTrlqdpgDLYMzg6FpAd1umeovtK2pgb/8KtI4Shmzz+z2532
	MQyUKiTPa0kkGQDJP2wRG4zz1iOv8+UrEh6Qy3Ga301FVVSpwXi6/zkApl7y+EFy/BBR1szA9CU
	uAIAlhLLZfzIVZX6i9IDQNm4iZrXgvUoAMC+WuJgTg56BPOpdOplFcBNBjAyTXD4KP7He4GUOQ5
	EcRvg==
X-Received: by 2002:a05:620a:d8a:b0:913:e5bb:3db6 with SMTP id af79cd13be357-913e5bb548amr1506341585a.31.1779201330581;
        Tue, 19 May 2026 07:35:30 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83ff00sm1849026185a.26.2026.05.19.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:35:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLXd-0000000F7pa-1dCL;
	Tue, 19 May 2026 11:35:29 -0300
Date: Tue, 19 May 2026 11:35:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260519143529.GD7702@ziepe.ca>
References: <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agxolksC_1nfO34X@google.com>

On Tue, May 19, 2026 at 01:41:42PM +0000, Mostafa Saleh wrote:
> On Tue, May 19, 2026 at 10:29:11AM -0300, Jason Gunthorpe wrote:
> > On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> > > On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > > > >> 
> > > > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > > > >> that we can use it in the conditional above.
> > > > >
> > > > > I have this patch, with that I can boot with your series unmodified,
> > > > > but I will need to do more testing.
> > > > >
> > > > 
> > > > Thanks, I can add this to the series once you complete the required testing.
> > > > 
> > > 
> > > I am still running more tests, but looking more into it. Setting
> > > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> > > guest shouldn’t try to decrypt arbitrary memory as it can include
> > > sensitive information (for example in case of virtio sub-page
> > > allocation) and should strictly rely on the restricted-dma-pool
> > > for that.
> > 
> > ??
> > 
> > Where does force_dma_unencrypted() cause arbitary memory passed into
> > the DMA API to be decrypted? That should never happen???
> 
> Sorry, maybe arbitrary is not the right expression again :)
> I mean that, with emulated devices that use the DMA-API under pKVM,
> they will map memory coming from other layers (VFS, net) through
> vitrio-block, virtio-net... These can be smaller than a page, and
> using force_dma_unencrypted() will share the whole page.

force_dma_unencrypted() should only trigger swiotlb and that never
memcpy's more than necessary?

Where does it do otherwise? That sounds like a bug?

Jason
