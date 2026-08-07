Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F035677E
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121258; cv=none; b=i/amXAoekVumxv5UeJMx3s/P89S2Bm40e/JsRqJ7PR3wCs/FseCRDvPAQoJpKk7/eT+vHKszQ1oURPBeoCYPwREg6nYLoPhjY1x9I5H9xaEfjIyU6b4xSDthUooW0z5kEdIWD/5mk5ZXIU4It4Xg2zSYtRY6Qz/eFaw1sslngzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121258; c=relaxed/simple;
	bh=7bs5G7VXSiFLS7sfQ/bpcg7JaFFI7guoI5oTlg+tHew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBky4JiKTteR4yAc31271iZm1V+1BsY+NpeplskapeNutfSlupEPo3RFthgMi6hyIJ3pp2DpBlObxxuRJdGLXppJ2gBveuY6R9F6weg5dbMc556OyKN0AGx4kN1z7cZzeAiKg+uTL/TisKodP0YAsBl/d4ORSMesMLp1XpIvrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FvgbrWBs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FvgbrWBs"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92edb12cdf2so237112085a.3
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786121256; x=1786726056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gWaXZ9+2O+1F3TFyj+8MDOiIFSD+n/ei0pL8L1uFmE=;
        b=FvgbrWBsba++sRtuaSowCj6Ot1vuxahBPm5yKdEdat+KEzO6HPKNDl/+CfW95MIja7
         o3+PHwxpeNL072wOWo9MhB9GlX/Oa8EBVKxGrzRGDh4+GP9D9rLccKxhLFzfNK65++Q5
         FD+kmR0OijjRTcPpXfSZeXgTwxjtlW7ZMqOhXUPh7J+r+9RAE+YyLo4CiyAx6/KABowg
         2qsLbtdzkImMg9xGW+e9FZXq3nop+3FsfWWiX/FY2khrYLuaa8/D7y4OUBcOzaYzr2h/
         Da1ReNA7nO5a068qCWZvitAcJyfkYau3z+N5rKWLo1FRupKxR4wWaWD2xexC6E5MKVGf
         jzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121256; x=1786726056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gWaXZ9+2O+1F3TFyj+8MDOiIFSD+n/ei0pL8L1uFmE=;
        b=WXhsIe35MdWdLoJS3nKfZLn0XSYkXHUKjXLLV2uu0/hmyBVZvWO9gBJ7bFT3oc11MX
         6JA9SmbG6yP/7IBdbKeBbxNybq8ttKTA1RFF+TRN0h5L4S4M13WgqxfiSY/2xF+H6IuV
         iEpmzZHT91AYhZ9M8mtqwGSnJnHO7f3N5iHA9BbP1B10vEeYx8JbWVEL3uLTIUiY00Yc
         tpaJXtlnoaTgI5xaVrp4OTErTFvgAnc2NPNr1EaXyZI1TZBhmBf+akgcScPmdGzVA8Oi
         xHut3dMke+AEmSFdyriOieKG0AiFUTTOf67eMcBWzoqGtx+6Ci/RRN62UOryuLc6YFu7
         mB0A==
X-Forwarded-Encrypted: i=1; AHgh+RqPJ3ReDPDN52TuWMO6pKdi45h0TnMTOzNRjL8/SU0yDHPpuVfF39FeTDlYbIJIM2NDpCwQhm97FvoX@lists.linux.dev
X-Gm-Message-State: AOJu0YwpMLaFkiSW9FOIWJTsMuN7h+mXX3XLogwVbOQB+/XRBYjbiVWm
	w2mnyTNpH8f1DR7cdGcY9+hiIr/pp1INaX1tr7WqVfGz+6G36m7uohL2UGvEn0daj2I=
X-Gm-Gg: AR+sD11Fome4F5f9M7hExTIUgqQ4K8Q7hLyQiCcrRG9fq41YfwXte+oo1dAHiML2nlF
	CxKBhy+Sy6KZVl9z83JGDCE/xnL3/QZ/fGxzR0CSzLKiaxtZzl1zXsXEMqaSIe5RlMjBlZ2Oh4c
	zzvThDQ68ig+3JLngX9oEfavpyn5opg8UIKrpedkZOq1AD6H7NtF6yz50Eby76/0pJXImCl+ERQ
	hk6RGMh5jRlF5ZWnqoJxztPIadB2hZOJIgm4/7tjLBkbp/bOgCcTqSFvnZVFfCll2t9gK34SmtY
	tMOY47x2vT9W3WHsmE4VBXUt6yqd14ZSCXmwsYHRU/4wyvHMEVb/pYZytc3oAVKPgKyVpEPTli0
	69QSTUBuuKhJt5PWQKtSAtDd5AhgCz3vqOyTq/X74cw7kcPfXoS9i+W0GqALGpnRNlPvKGXvNwM
	IEFokxI5OHeYbdT3qaslQi+FRJa1MAu0lr5Bt8Die+24W486v0
X-Received: by 2002:a05:620a:2849:b0:930:f2c8:d9ea with SMTP id af79cd13be357-93671f33f9fmr432093385a.41.1786121255653;
        Fri, 07 Aug 2026 09:47:35 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03ed23sm187954085a.7.2026.08.07.09.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:47:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsNjK-000000014w0-1mQB;
	Fri, 07 Aug 2026 13:47:34 -0300
Date: Fri, 7 Aug 2026 13:47:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260807164734.GE200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anX7F7dnKOtAOIIe@google.com>

On Fri, Aug 07, 2026 at 03:34:47PM +0000, Mostafa Saleh wrote:
> On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> > 
> > > > I was under the impression that there is a possibility of using swiotlb
> > > > instead of restricted-dma-pool with pKVM.
> > > 
> > > Yes, that patch enables swiotlb as a possibility for protected guests
> > > but with your patch we avoid shrinking the swiotlb buffer even when
> > > restricted dma pools are being used and that's a waste of memory.
> > 
> > I also thought we switched pkvm to use CC-like swiotlb as part of the
> > alignment in this rework? Mostafa ?
> 
> Yes, now protected VMs can use the SWIOTLB for bouncing. However for
> Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.

Oh? Why?

> However, I do not think we should over engineer this in the code,
> swiotlb can be set from the cmdline and now through Kconfig also.

That's fine for android, but real users buying a cloud VM and sticking
a distro on it shouldn't be expected to have to mess with cmdline just
go get a halfway working system

Jason
