Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976038B7BC
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111099; cv=none; b=U7ihueTVyHTQBpNj/kJNp3fezBVXP+nM4vYblBCZsGgukK5cAAr+UVi8tBEVvGt6MW5+/ZYkr9G6AyJIvg7VdUS7WHG1Bj5XL9zsy3+J1S2Il3lzhSlwas7Io53099QCcNx8wkkxbNfdE30Sv71fy+jFpYUauSZfcq5guuMs7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111099; c=relaxed/simple;
	bh=zrBhytxcXDNPG0MMxibBNcHjDvvuQV6t6BI7tYVRQPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmRUec5tspBLhqndNqDo/onlHNMJ7s878a9a//ZovO3RLxrQMPYJ7Rnl0EwkGYwoGQm7Pv+WawqriPUwPRJcvvLvGLKo20Ez9R+gthyTbSzvKlod+IJHbpQAtVBWG4R7MLyHIuvW/I1nxpi4a+5aBOTYXHMphBBESOfqv3agG8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RV6Ri2z1; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RV6Ri2z1"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e54f8c051so180853585a.3
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786111092; x=1786715892; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2ro1loNwbkACqpDIeM0PdgrbNZfsWDTHY6fPjx3IQg=;
        b=RV6Ri2z1nDWFk/0ToSMTdbWLqWID0I3F7D7EonNClVjgQTE+VpJxEe6CCvoDpRuDK3
         A1JsN5TqC4wOHI1yM75iorj6SRwWkl1+FNfyIV+fiWVvM5rs+pXqj6mPlGz/3ZZ1ikue
         I8BwCywNHkzLLZaKZ4kJk00Hql+n6d5oes6v2EourTZtq0Hr93ybPSYIzK7qMGGzJIRB
         gtCN5U8TvW0FB7f5x90JooINn01fAILKeNGQH8T8gsFVPXpBBjFsAvayExCk00ZMjyt/
         Abc75A+DicCWDAGnTEJ596GufoTUA7ShpNY7ZL+cu+nSOOTqo9Ti4+qpWKh6dvDrmfqS
         2ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786111092; x=1786715892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ro1loNwbkACqpDIeM0PdgrbNZfsWDTHY6fPjx3IQg=;
        b=fTzIicqlRScg8PeSskLcEc4+oJLPdEDNeH6EkajLBp5cO1RQ3qsSKFlJd4t04myCz8
         BeQ3JLceotqIYXK9dUXRZm2+0zUsdaZXE8r7xPtn/6VJdJU4zyoRwTg1ZeDsgxW+VDlS
         NcE3k39689VS2A+R4w+gL5lQJa3uX/eOf+mniv2yLNyJI+ZyvwoF5enDk7ozpPC9YVLK
         T3j43JDcuFT2ucLthxCmNTTPJl3h0ePh3Lo9wAEF30QTxAuvXL7TFabfxGH/NZmcEk60
         8UmbPQ4M0wVIdYGX3l3+QoiLThhsRK77PyxF99FZN1Or9pY0PZ/eZ2jrm6EL/HHwBg3d
         55hw==
X-Forwarded-Encrypted: i=1; AHgh+RphoC0oKuvcHkdnlVcrw50dEoue88jzDgkXRu87NTbQuMQfdJNzBOkTvkr/O9hjZBkVd8bGgbgNyETk@lists.linux.dev
X-Gm-Message-State: AOJu0YxAsiJDY4dbfx5LxnsqO/ZxUW8SibRTi8Pk6UR/0hce3WoBGaDY
	3yG5wR4Pf4HYkTKd1hPmYDPnEQKIqObsQ+XHXhxNTsDnXB7x9sMRdBUPICC7DmxLK8Y=
X-Gm-Gg: AR+sD124qCX/AC+yOcLuG6LXfbIdFr7tXR896w8uon3ezdUrz/Ns4Har4/Jf46ZD6yq
	VFR5m4FYNvskOYrhu1vurlY16YEjktjFF3N0/f0PfiZIf4vyZ8SVu5OCzhWyeyGtqAPcUkFlyjI
	m/gUkv8T2rwlkHY/bvBt4GSjkgXXkXFg1YlYe/UzDAU89EMAJW/rH9lp4I+qPy7eHfcHyXCsTTb
	iezWvgY0ijUE6Y64Fyg75sjSEpepVAo0sLp4d0wKYbN6odOn2gbFZL9Kp4Dg47bskJs9MzB3Syh
	Y8XLo9NsWaVg9VexyB1N7qg4xpurPEa+HWXS6KrDnBIium6i3wmlZu3QJsEHb4Rlym+JHoMJDzL
	URq4Iwgd9Mojafw1FiQf4vR+c32NmKWygcDbLHKRvWH4vEbuBqb1Qe3LzwZcaoAxP2hPhfGOWZl
	WEp6D41EO6/cj7FL8TC1fHKpmSlB/otveydyDhPg==
X-Received: by 2002:a05:620a:2725:b0:916:14f5:8866 with SMTP id af79cd13be357-936490191c4mr2577886985a.16.1786111092001;
        Fri, 07 Aug 2026 06:58:12 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e2971d0sm152121785a.43.2026.08.07.06.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:58:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsL5O-000000012Hc-2aob;
	Fri, 07 Aug 2026 10:58:10 -0300
Date: Fri, 7 Aug 2026 10:58:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>, Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
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
Message-ID: <20260807135810.GA200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXbJ2O4DWgPxCeg@willie-the-truck>

On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:

> > I was under the impression that there is a possibility of using swiotlb
> > instead of restricted-dma-pool with pKVM.
> 
> Yes, that patch enables swiotlb as a possibility for protected guests
> but with your patch we avoid shrinking the swiotlb buffer even when
> restricted dma pools are being used and that's a waste of memory.

I also thought we switched pkvm to use CC-like swiotlb as part of the
alignment in this rework? Mostafa ?

> > If that is not the case, then we could change:
> > 
> > !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > 
> > to
> > 
> > !is_realm_world() &&
> 
> Perhaps, or you could just pass the swiotlb= option if the defaults don't
> work for you. Can you give more details about the slots exhaustion you're
> seeing under CCA?

We see badness with swiotlb too, it basically doesn't work out of the
box if you have to use it 100% for real devices. It easily runs out
of memory.

Auto tuning to higher levels makes sense to me, but I'd rather the
core code handled adjusting its size to the estimated need, not arch
code.

Jason
