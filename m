Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63C377ABC
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126442; cv=none; b=ZkeRfHbgwf5CM7LMykCGA24HAL5qAzTcBQuklWVX7mJ+dowdI12yDBXPBUKEf/6HbcAR78J8r823VDJoi7oS0fVa2Npdq0Ndyw/I+eD9V/q1pk5UOGlpI0h5z94WyegzJBTGlkdNcp8H2KNeeFq49lPOPbFRVhmKIJQQrXBb9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126442; c=relaxed/simple;
	bh=E7Ex4RBUa7IG4kdLmTYk7y3iUle3Rq8qAnZNO/0MU2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWMxUv9qaimGyQ7x/6sKgX6kcZOJN7OX6WHW+wHKjhsu9PJiZqbTZNudDpsn/wthTnmgHcBsnw5TmmLq6jkWJC27N/3S1GZou7nbZdvGBRe/YfqR73jtY59+rRyPnTg1mPzQBeD8d4bel1Q5z6QqZetKTau+o7RYtsbrGMQNT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4buJpdK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4buJpdK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a177b2dc8dso1033a12.0
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786126438; x=1786731238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlmgqKiyqc7mU7pAn/JSXJE8TLhKwTlI/zLMMe65kC4=;
        b=d4buJpdKSIaZJy71IfzT8H/zKheMrtFC9C49c7wYwKeC3w0OFT1prUHFH7un5YwL0t
         zCIg/J/AjEA3JPBNSOOWeR/0cdnK0D4HSSSXZ55V6P98MnlvyzX8EKe9mjCDo0+6eFo/
         6tG/WzJWs6tp5nQaXfl0GNAZoPXqMe0wSQJdCt7Uba+/jgSHtTgmGogijx4iSX1GKbAH
         FurQkuXdES3oHGlRNV5D29VbqQsrEPpSb3PFCf58+dIXa+8KkA464lUR4eVYOFbykm7y
         Hz7aMXUZ1sT0HNAJGQ4CTIyRb5ahJMZ3FYAZ9pKBEr8WG3bZo+lSyuZnDPR52lbKmudt
         E47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126438; x=1786731238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlmgqKiyqc7mU7pAn/JSXJE8TLhKwTlI/zLMMe65kC4=;
        b=ZyXGmi7Vnfs0IMON0kp66n6yEn44ofcOaTWCuTgGDzrDS62mwxOkuoy+0Q5DmgGA6w
         HF6imG9S6ekWIiIX2IKLUrscmM4so7HvJ23xQ7R75yKGywJZ7uAi+Fdtb0nM7fgDdM9i
         0BM8QiQH49I0b9P9vqbXdkgz+nS2QSu4VtJiIwa4K4NQZCcU2zY3EboE7DjsDavb3BWg
         YVhlvxpWNudXABMzGqRIZUYcY+PRRV+ojbk7beczdFy0LdAmyZAEle+9fjFe8S+jQFJN
         AbFtw7HBicxdR/kdmBi4fjXzveiOLKFw2TV5Wol1DQGsUe54pTVaIyvekVL17N56YO1S
         Es+A==
X-Forwarded-Encrypted: i=1; AHgh+RphvMrziNyGAhStjdwJAddV3m2Kn64ZMwZfU08SHo2ej5reVfP939Z0UFBHxZeZHmEFzyf5QNOKy4eH@lists.linux.dev
X-Gm-Message-State: AOJu0YxR0P7umMeZUxwQCmT4OjTqn0AGOG0FnS1qSwfstCgxarOwKJQ+
	IOxqmGa1qlkzKgRttA5QRwX6BzLr8L9aT5OQCaNK1Ze0r6HwMg/tdWFGsFkcECY45Q==
X-Gm-Gg: AR+sD10Ouf97quAO5XKpXeUxa/jVSeFox/nmHUJH6ZvynBYWocmUJ+PJRk+aZgyImsn
	+Np3bn9SPn/QirPM/F+oeSn1w+tvPmeyPCtucoZgM7klODTMVujDX+VdP7+vK+0mLY6+w30qRHY
	dt8WlX5YphWGncSXkoRqPFfeGHv21Px4V6n4zAUFiVP1PTgi3UA66flGx9XdfgQyeWy5d5MQ3e4
	aM5paHlXseAcXi7IGomOlZZ8sQjp6t3GEJ7nRdQPeWrjJ9Sa9b8soMXoWJCKgr8/+iykd6wstYU
	q1x3gBpPgwoKF150jx2lD8kOSEzO46O72Ij9M/GpwaYezwuqpUvEFI54/sPPu7DkTHXhsHC3Ei9
	iLbKpFu747xQ1mTZi/LfM63552HWyFKDNh4HulS1PGVxnZzWDWskEQMfgglETp4+cIwkR+JTW2y
	d0xU8Q1HTfJg10luwylWAmvl49mpC1g3QueE5U4ltXzZiP04byXoFeArx+3Y8H+x6zYM5BS3r16
	3s0XgjZBVs51HNL1lXONHsthz1BGA==
X-Received: by 2002:aa7:ce06:0:b0:6a1:f26c:ae2d with SMTP id 4fb4d7f45d1cf-6a1f4f438f9mr5439a12.6.1786126433777;
        Fri, 07 Aug 2026 11:13:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080ab446bsm79186966b.27.2026.08.07.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:13:52 -0700 (PDT)
Date: Fri, 7 Aug 2026 18:13:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <anYgXSR4VAi3TpOj@google.com>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807164734.GE200537@ziepe.ca>

On Fri, Aug 07, 2026 at 01:47:34PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 07, 2026 at 03:34:47PM +0000, Mostafa Saleh wrote:
> > On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> > > 
> > > > > I was under the impression that there is a possibility of using swiotlb
> > > > > instead of restricted-dma-pool with pKVM.
> > > > 
> > > > Yes, that patch enables swiotlb as a possibility for protected guests
> > > > but with your patch we avoid shrinking the swiotlb buffer even when
> > > > restricted dma pools are being used and that's a waste of memory.
> > > 
> > > I also thought we switched pkvm to use CC-like swiotlb as part of the
> > > alignment in this rework? Mostafa ?
> > 
> > Yes, now protected VMs can use the SWIOTLB for bouncing. However for
> > Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.
> 
> Oh? Why?
> 

The patches are not in Linux yet, when it eventually lands in Android
it should be possible, I did some initial assessment and did not
see any regressions.

> > However, I do not think we should over engineer this in the code,
> > swiotlb can be set from the cmdline and now through Kconfig also.
> 
> That's fine for android, but real users buying a cloud VM and sticking
> a distro on it shouldn't be expected to have to mess with cmdline just
> go get a halfway working system

But the whole thing is best effort anyway, the kernel picks
IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
how many devices or how much DMA they do.
SWIOTLB memory is wasted if unused so we should be careful around
that as it would be the other way around and users would have to
decrease it manually.

Thanks,
Mostafa

> 
> Jason
