Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812847DFBC
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583405; cv=none; b=GdJ1XrRBpF2s2UA92HamhpQkBfhskTBiIN/H/d4JbuDE7ORIIBQWR1zNmAVnnI8/sfMiUP1yf2vED6RncvvJEvnL03ss9poF3HnhdtZHfV5ktW2FbUK9wR7vNx4/FgbuqN2hS1lkgORp+jaEe9k+ZKZFknjVLX8vXB3ePyPG6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583405; c=relaxed/simple;
	bh=uV78Na/cU+RIve0Q1YJ19wLHf0X6yGP9GKIsahjNfAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZR7FjAmmcW/auxUJVxApXngK3uuStXkjhynHK3If+oeGdOtGiN2lsJ3oTiBzEm7XxBQPSzXx8FhyuuCvop5vF5qufdeITFCKyo+jSd7FU4Rz3mb9CB3kJW1s7dxvKcxnO/3rZF04k7NoK+vT9hkNxNMoRxflzQYGH7Z9g9Xa84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=V6vu/dOs; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="V6vu/dOs"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9157ec935c5so131585785a.2
        for <linux-coco@lists.linux.dev>; Thu, 04 Jun 2026 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780583403; x=1781188203; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leYnnf5Pg/xQRLvt6GMDQfv6g59yyMdkhV1lUPQrWAM=;
        b=V6vu/dOs9iuTES3ccZVTFyyL1vejOso8sMMBoC62tGPdny9Rcia7rbrZW4Pp7WsSNy
         wUxobmtIrijO18K54ddKfro5JL/uTLn184uKit2Ly8ZA3iFROO6UnIODtiTzSPMEr/7H
         PoBh0gVp8mnaDybSBRboi9n6RDPImSl9NhxtlLbIVA8DQyskbvT0BqyLjloLzZeCE5IH
         npmP9ZcIrsuxccjVxdLtaCsWac5BUV5D5kzCCqfzZ7YVU5xhO9Nmu7tBhOuH4WUlmiTv
         dYq4fNODQLwq+VREWz+TuNGFmkP2hvcR2/8MBqUyMZCZaDR4muU+YXp+JOmVMqxohOJ8
         W8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583403; x=1781188203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leYnnf5Pg/xQRLvt6GMDQfv6g59yyMdkhV1lUPQrWAM=;
        b=jUfpQOB/VLdBTWuJOsZqdcHOQ7c91TL4OemYN5uVWKyE2R4rGxIdgjp75gRsTYPmLD
         InJrtoQ92CWau08Wf0EZjwm0WQC7MPLjGh9WchZO0HCnx+esi5BfvkwgxzJFCjJVm36/
         z4WEKr928TbhWAI2oahX5zk2mu3F/HYMT00HKQkVZbk2Dva1E+E20EzE1KXqW0x/riNm
         qDEVuPMqG7RI5+wEh7BaX80c+GtbeXVPadoU8rKNJf1SXWzcAUdhEHu+cU0DuOUvocW9
         Xpyl4eXQlBBKigwOqRA0tvbKBV7JmUgoBe68V5ETaek7bIjZ+rNfwjJqxVA8mKUYzi3G
         ovCA==
X-Forwarded-Encrypted: i=1; AFNElJ/No96WN5t2UWMga9uzWV4I0AZoyT6yj1qUJLRV2UXeZ/M68AQA5RePiqrSQ8TSwnZkm1JmQAYygVZT@lists.linux.dev
X-Gm-Message-State: AOJu0YwnmoiQFXSOj07JXe3jDG1wLP7RU2EQBy9QjmjiIlGsKCn+077i
	ycJVdvlOwKHGUr7iUqwXpvF/yNfXhJs7TQ+0KyrrSLwWi7+hk6WkKQCCdkX3N4axyZc=
X-Gm-Gg: Acq92OFdYg9+2PYrG72D+91sJ0inRaGJx/6xwjlcp6W73VLDQVQ5OMUqTRI5j1bBDDa
	Hf419J0eLRO1LImUu0zDRTABw5sqRR8QoPfMg1I/b5PeSgQNCIUqNKDpkLYN5rYWBfOvdhqJxoN
	QXbuwjilqGQfRVX2M7tUf2nNRwVePwYsJ1woKK2/cbF6ckucgBhRWTid2k415itJxG0F4T90pbj
	+09dAi5BfMUYUSwBdyU3aYTLo+9zeunlR7ZOAluuHW0V0STYp+ztqNglwP4hPguXOHWf2INt20x
	u75Ra3Ftk+1s+X5gJXeQAbliXxRbmxVzRvurChGeSBBs5cVx5L/8fmLPfABBsgVmYC+32amjDth
	0jo9Wxo4aALHMCmS4Y/gIudTBNd4cp63gknQe6axM5dh/m7gYXENG/8fpXkHoyImug6GFOpyPIr
	Sgv1UInUyeM3KwtZvaI/Uxdmsy9PToHgDfD5XUxGLkBk5RY09lOM/Ab3IP0NNHCandlz2YAtG/Y
	SUnGVKN9PpIEVyL
X-Received: by 2002:a05:620a:2544:b0:915:3e46:c44a with SMTP id af79cd13be357-9158a80c3f3mr1387419585a.46.1780583403463;
        Thu, 04 Jun 2026 07:30:03 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a21d2c1sm657350885a.11.2026.06.04.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:30:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV958-00000008IZw-1Hzl;
	Thu, 04 Jun 2026 11:30:02 -0300
Date: Thu, 4 Jun 2026 11:30:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"x86@kernel.org" <x86@kernel.org>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v5 05/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260604143002.GA2487554@ziepe.ca>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-6-aneesh.kumar@kernel.org>
 <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
 <yq5afr35sciu.fsf@kernel.org>
 <SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20260603005454.GM2487554@ziepe.ca>
 <SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>

On Thu, Jun 04, 2026 at 02:05:35PM +0000, Michael Kelley wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca> Sent: Tuesday, June 2, 2026 5:55 PM
> > 
> > On Tue, Jun 02, 2026 at 02:24:40PM +0000, Michael Kelley wrote:
> > 
> > > Except that in a normal VM, the "unencrypted" pool attribute does *not*
> > > describe the state of the memory itself.  In a normal VM, the memory is
> > > unencrypted, but the "unencrypted" pool attribute is false. That
> > > contradiction is the essence of my concern.
> > 
> > I would argue no..
> > 
> > When CC is enabled the default state of memory in a Linux environment
> > is "encrypted". You have to take a special action to "decrypt" it.
> > 
> > Thus the default state of memory in a non-CC environment is also
> > paradoxically "encrypted" too. 
> 
> The need to have such an unnatural premise is usually an indication
> of a conceptual problem with the overall model, or perhaps just a
> terminology problem. 

Oh yes I do think the AMD derived terminogy is aweful :(

> Here's a proposal. The new DMA attribute is DMA_ATTR_CC_SHARED.
> Name the pool attribute "cc_shared" instead of "unencrypted". 

Yeah maybe. I sometimes imagine replacing the encrypted/decrypted
names with cc_shared too just to make it sane.

> "cc_shared" set to false in a normal VM doesn't lead to the non-sensical
> situation of claiming that a normal VM is encrypted.

It seems like a good idea to me

Jason
