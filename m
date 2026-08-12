Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7D47986B
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786556582; cv=none; b=ma4oFNxEGvKuVCn1FPTweJiHSzBOG6U9c1pEieiJC68kM3F0Dv/5RAEVtjnHgywirVd2WGBS/z7t0wRaGXbtQn6NHv88oPrLDw+DCmnLnq9xyvcH2qL8LLYdC5GT32s8ltV6QYcKhTA4zSsuAsPwenQGJZDKA9O0j6WTgJyn1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786556582; c=relaxed/simple;
	bh=R8K4AhpTTGabp/TpyA1fPLTe5/En+9HZcWa+J+NqaoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeSi58c8MQW4WCrOHsSMKM987cJ+1Wwb3qQ+hpkB8VoRpaUTV7Oi6+YnMmDH/38iyamGPW2eILR9Ep9Kq1nuolA7dkkzUB5ij363xKvy131WrZ11fa86pF2qFyjS/7is/w3e7zd/C6eZhM6E0BkgIeFPQn6SDLYSybG02iDKOvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=h7iBqkTY; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="h7iBqkTY"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52b6543169fso8692391cf.2
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786556580; x=1787161380; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRy7TSLv7XgtK7yVOoP/4PPtFt0r1aZ67kTGnhbzw7Y=;
        b=h7iBqkTYfGutRLMFliwlxru44k3I/f62FEmk+Xa73AMKWevU4eRvePb79Hr6QKXD9p
         MACy8KwrA9oSCGTkfo0V4t/Fqg1GnYsOJd6dJKsxPXGm7o40GFDWHsunSltVuJJFf4xa
         nBPJK1TleAFCb5z8Gg99hLpJaVzmx4+pKN694GHLwwEVL2Wpq4HM/uFRw81+2+U/r8yA
         TG5vuR78vnclhJaWQ9hbb+uhuMrxTDGvKEhxJsFsMmChaclezK2o9C5egCif8oZ3nhyL
         +fXUb+ba5Mw/jHtrLA3y+iBiIQCe3dqhcRF3lIsNkFlRFz/TrMR+Hms6XjI/tfCTCcb1
         /mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556580; x=1787161380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRy7TSLv7XgtK7yVOoP/4PPtFt0r1aZ67kTGnhbzw7Y=;
        b=FWYtiF8KrbtGexPCxPd5fKlfKUEu5Bc2fgl7rwMwpbAObY/8oYW8Nb/ANo2xaKTnM1
         GoyjbUNxZSvCki8R6I4fL1C55fcz6DUW72QIQqz/r1cSYgEC/VcPJ3ipAuN+kNAL/USl
         0XtRZ2qXCQHYJ/adMgV/RIpfh+FIwAJXrf8YH1rWUBMZuBgJ8MXysJrzmX/HMxxVEfMS
         SPWzslM0WNJr+/cTLwLzRACn3LnkpwM59TEpiIAO/gbSuNE0ACg2C1lmDOFFQq0RbOdb
         TYey9rOVtie8UXbad0AV6sVwOmN8OYguB8OETRMySTzky9J5MSLKMR+g3hhivvoPvMS7
         xpDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqgb+U3iXiUW4N3iVz7UQPldRyBNXMnh7FUGZ9Orv1+/Dsaj7GIktp2pFrIykyVcrW3OvjPzEbk02qc@lists.linux.dev
X-Gm-Message-State: AOJu0YwhJWXV0hY2bbtL6DzN8nTuCfy3wk6S8H3pLF23/La/dmZN0W/O
	08dVffxvVH1mHA6Eu7z6lj7JiJm1DgorJFBVpGYGxXzHfwsxS9lkpvJZbVP5f+GK2so=
X-Gm-Gg: AR+sD11Y21sXSe8YOSM3Ip1U9TNV+sLTy+T+ibNkFvlEZU6KGRk9LNVInZ/gJWtiUNL
	NDUNTZq6YwR4hh+BgI43R9AWPxj0tDX/ov/FIr9MHQzFJRxX6I4s71ZgJ7kMFWXp8dRa9qT4+FJ
	xkmrUt0+M0siWjE7H2lnerJvqURTulvEusJdBoHJ4wSp3WaDNexV8j9tygS4w3Sh7Q29B9MdZwG
	cZVxt9Nlq1hfZktgXCGHYrFTH97bGk7GkKWFQDlkDNaruzdhJnVnQc0oP2N8vxXlk0PBDiWgMYE
	O5E4uD8QBq4h3FiikTscKdir8YQV8rEws5GpZu6fWbLvvqWtW0tbWIlkZWd5Kgq9/HuRQ0WIM+g
	5Q0oGVOShiGqPKvU9vulw8hywWP51u4Vmlmm/0mZ+c8wgWGAdkCD8DHENpTdmNJIxW5pHQYSo7Z
	xFZQ0TM5TKHf3WOJ7+6AEysORgVJhd+agMnnrqqw==
X-Received: by 2002:a05:622a:145:b0:528:38b1:b54c with SMTP id d75a77b69052e-52d646a004amr57067221cf.2.1786556579927;
        Wed, 12 Aug 2026 10:42:59 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d61d91199sm22262711cf.14.2026.08.12.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:42:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wuCyg-00000003IL0-2V6p;
	Wed, 12 Aug 2026 14:42:58 -0300
Date: Wed, 12 Aug 2026 14:42:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
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
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
Message-ID: <20260812174258.GF662699@ziepe.ca>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com>
 <yq5ajypvioks.fsf@kernel.org>
 <anysnQFVTO_RAYxp@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anysnQFVTO_RAYxp@arm.com>

On Wed, Aug 12, 2026 at 06:25:49PM +0100, Catalin Marinas wrote:
> > > BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
> > > option in realms?
> 
> It's still not clear to me why we went for CC_ATTR_MEM_ENCRYPT instead
> of CC_ATTR_GUEST_MEM_ENCRYPT.

Yeah, this tune should be only for CC guests that have the
shared/private issue.

The AMD SME issue with the address width on bare metal is an entirely
different problem that would need a different kind of tuning.

Jason
