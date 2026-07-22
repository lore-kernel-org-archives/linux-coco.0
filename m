Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC323E559C
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750233; cv=none; b=pWqB8N5OYlt2OkZkt+NGxTr2CS5Jc784UotQCmRPtlFnlwO02LtPFzCWWRjelBQCzCx3kqIHIZ5na6K1Fu5G0cGddPSoVtWeoR05ZIgVVSg8Fr2Mr3cZ0TaKWp8a6HXUoQKjEfk2EwnYoY6X/dvFqXC+Cyt3AWVeO3YbOO6PBKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750233; c=relaxed/simple;
	bh=tJmj53zfWsNVLl4x+pL+wraxm36ZaOa5Vnqva167EKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYRt4Y3NNEvqi//tzdbBWMDrhffBwMnMQf2AB0wQ4dbMWx43IM6JYyJL732/LMZYXVEE0qbSMBzIkT/vJgqxNFrFGRCl4U9F4EuQofcVfyZQMYu26hBgjZ7+HhOJvFsbdUjIm16eWDlJKjbN7o6p/870vmFOBnmOd1XG+1B7lf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AubK3zkp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AubK3zkp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc61541f8cso78858265ad.0
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784750231; x=1785355031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N2NbIgCir1Hq8D+FOL5JeKeK13r88FeOdRS8YSok+dE=;
        b=AubK3zkpJ7EzouobdSCXTTRV7Z6DmLNisldaNwZy+oEh0/tM/T0Gff1Fdh8w+/liZi
         OTUsbwKl3GDSyy83nwLgR1peIipv2ofDJK3ykK5vZd+LEwMM/i+nHQHtB959XWXJ8Ma8
         XBysroa63cgLhP6gzivTclfsrxqPBIIDZhGWSqTbW21WeMVO804O/ghNVZ0Jkathp8w0
         fshL4sjpG+iZyZhNmPegc/1hOBVYHDrZaRat6CzbJ6JshQh/ZTyoKHu4UXAIlTwrGrM/
         Xbh3u4UitHIR/CwLUHc5WZ4nuhE4FfvdiwI9xcYk9IoefqTdvEQFUvkYJpLBFpy/7W4q
         oLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750231; x=1785355031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2NbIgCir1Hq8D+FOL5JeKeK13r88FeOdRS8YSok+dE=;
        b=Hqu+tyfRsQb2Ycwt0C0xZ8Y8whzOEg4yZVWvhQ2rKZAeYrv74y/nNZ/xiJn92Cjzbc
         73NZNdOMzutSEYJLeJITNQAwkJ58azgspjdbKbzLzeiR1fupf1L7af/U9I0dTHnvCE68
         WmScJbfV1LwDBrmHQKGV0O1hd1Dlqj0zjKL6N9Sw9IpW1wsH9EQvoK3mvBcrxmp2Ixgd
         1GApyvWvfzAp0kxlh8V6yPJmQcphi2lwFVkWckQR9t3QilmDsMQfcF2j7DTyaiZAGLhZ
         VMt9C1t/6khE8WlVJuXb0MQ6Oh+YXtRubF+nyiHJHeyvIxuCpWtt96Xv2ZiHMrnWa4DW
         dOug==
X-Forwarded-Encrypted: i=1; AHgh+RpQWh3oN4NsHfnNTa6QH/W6j5vI/izHgqEeAh5MbNDgg+0cVN94Rq+9AXrH2NY3Vwb9V/Dfjbxv2UkW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4WJHO1w+k4SHy0F1FUTIh5efHOXtTC0NmEI5DJ45CgQYlJPls
	S2oYoJ3Dy3fSm8SzaE+fVRxZEZjiif9VdhzVcMYdQWDJLu4hV7+ZZ2+ZT/Ef3yf/xhs=
X-Gm-Gg: AR+sD11eTMkVxE9on8atl0aIuQQAn4KacMB4o9+liVe51YueJAdTvUeVDCzSr6EYjN+
	OvkR5eWf9g+C+gd/37LGZSUe6R1c6gFMIBTmt8pa+XF9q22FdV9Q6HCCMJdmEW5AtjkbbLL63M5
	qelZ/dXidVuQzzfOb3ttItWysMJbVCQriQfX7OjClmZs39wkSjKGLTtoDqlriJwKqdjdwDKOaWw
	N1UKQUY2fdFDMTuH+j8SWsHxhnbchmr2ZxkNVEi8+fGLeCUCbKFxDc4TB+XZmpJ5CsSWlwWxjng
	oO0jg7CTdH5j6iShHpLw4mhoiJU+afYKwo3cuvx1SP8H0o4bbTJIBODllPk32IKOoyRnlB8A6rU
	Q7Ye8abE/yG4MljqoEhqGRg7galt19gYG96ONqD1TEtsmW0rdC8T0
X-Received: by 2002:a17:903:4410:b0:2cb:402:70cc with SMTP id d9443c01a7336-2cf8df30504mr51520965ad.28.1784750231136;
        Wed, 22 Jul 2026 12:57:11 -0700 (PDT)
Received: from ziepe.ca ([216.228.115.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm11833170eec.7.2026.07.22.12.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:57:10 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wmd42-000000002HD-06RY;
	Wed, 22 Jul 2026 16:57:10 -0300
Date: Wed, 22 Jul 2026 16:57:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <amEglRH3u6UFFnIQ@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260721124056.GK110966@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721124056.GK110966@unreal>

On Tue, Jul 21, 2026 at 03:40:56PM +0300, Leon Romanovsky wrote:

> Why don't we continue the effort to remove "struct page" entirely
> from the DMA API internals?
> 
> IMHO, everything not exposed to DMA API users should use
> phys_addr_t, including the DMA address pool.

The alloc interfaces return a struct page, that is why this stuff is
organized like this. Look at dma_alloc_pages()

There is also an API that forms a scatterlist that has to be struct
page as well

Jason
