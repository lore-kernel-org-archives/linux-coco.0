Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC830F7FF
	for <linux-coco@lists.linux.dev>; Mon,  8 Sep 2025 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354146; cv=none; b=W0++dfpmoE9tNwmf3iRBnfVYbZhdgwIos1qO8n5Wj29FzcaCI+Yaa0X+wLLGzN2G5munHrmmZDjsmXlyJuFvoj0x9v7p2CV66/9qFQx3pBna1ogy1MU3fZQGH1ET17PymIKWu6/IjlRYefu8XuCPjqHFVbTjGz5Kz3gCsxFg+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354146; c=relaxed/simple;
	bh=luD0W/bhW3JJu9+vgqpwc7IpxwiGIuat3uX0AMFM0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh6XwKSXHnY1xhF4VWcrVIYGBBkKd6lgkhpLUPFoYpV1mkv5O9OeWUcIozsq+AibgL6rV96rUa6KsuHQtcZpTpw3UFcKK4N4v95wfPezAh5gJS2tlUWPRKpsh6/culnRI3Q4qyBdTO8gCV134ccJ3y0WvP3/2UGvBzBTTYNz27k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FIbJ/vhi; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FIbJ/vhi"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-726ee1a6af3so53110786d6.1
        for <linux-coco@lists.linux.dev>; Mon, 08 Sep 2025 10:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757354143; x=1757958943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngnzmJDONOgUG1rwcnXYUKxxVO5TVbhQcQIkSu6YQMY=;
        b=FIbJ/vhi5WvTWi2hwTTegoGHLDmZMaN7a8Z4cwRphJbszYu2TaTRVj8CNa6c5DWYKh
         cTbxn7PoLPsDfolBoNExstlWN/HgYkHPCjzJILHjAVZqjjg0nRTAtQuDwdtoZDIf2jw6
         HF9LSXe7oIGTURBbVN/BUel49XpLbbMOYfawUn/pJrXtcu5dom65Hc86gSqOW31rI/+9
         6LdLKtNDrIVdsECpRLsMd/XW+ZRsyOdY2m6/PewhuU+lTLkza440UnNLEg5BU9EsIwbO
         k19dTyVG/GjLiMespXMX9YZLl1h85HEF3RGf2MrHKAMuCOzB3J5sVjh8oxYC9Yojvxdz
         zS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354143; x=1757958943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngnzmJDONOgUG1rwcnXYUKxxVO5TVbhQcQIkSu6YQMY=;
        b=pEgdHHSFIzSuLU+O63tFotEE1uKwy3rTAyh9PvZXlHxlu4zyGevy1NfmRzQvrBJfSR
         W+lli5dR2ATmIqZdjXVfKgsUT46z6X3uYe9Mxpx1meSrIlLKKKoJbXkeGOlv0ob0QZxN
         KIh6quxXoPfixFj2/GO4yGOxVyh8aw04HVQWltv0yVBZDHjZNB6wZdFz+4bThV8fCZzL
         ixpbRr1afo+R3t4PN4pmPT2daAxXF0rNXpK1+fMBkB38oMzT87bDypVjlWwIkKfVUOim
         dM2UrqhVfC90hMogxXgkHFS3GjIGc6K6n/SyrmMwawXDUkLeSKF5RbF0MKdoJu5dAD0J
         Zn9g==
X-Forwarded-Encrypted: i=1; AJvYcCUrLglJ9o+fSTiDQt63yhecX3KYmeXz0ZTwHzYUg+bmvkMlyWTdV5Z3kfzAyHGbB9NEUXz6s3nh/Vql@lists.linux.dev
X-Gm-Message-State: AOJu0YySYK+Tp3V3CxPTgABKcV7ZiZ27Emb1Ejs7uft7LowO9aHqJ5Su
	viW2Ka6aGOVuCywaWW6UVtHKXfqu6s+ftk0Fm09ZXClZyERsrcYWAKTOOnvbvt1mCx4=
X-Gm-Gg: ASbGnct2NVFKVN2TqPXK0NkTgHkvVKccXyRlMaWO/Rz2U+0zKWQhNQkDi8E3W45gSSf
	T1n0ClrlbLBgHQ7UGqvzUIxZT2IEg14TjmGjsairjQjxb4Pc1fr8N9GTOijxGg+jy3HNxgi/ht3
	55qtJGduGHJ//HAZimgil+vPSyhFgbn+6r+HriUhMnNsPZWwTxo5hMcTvcS1gE+d/PW/tiNp6Ce
	ohwUN4KxPTSvsVoGU+/8rJBH2Mxi74jyV95eHfovM82of0ZqyYNPxBrgSMjgRuEssu0wv+aUVBH
	llpy+o3d0vIdN1+vkMUo1JgjkpOEdsRBeBtS5HH49kowZB+9XLOseqcLWa3ZPshQSkcv3wVUWFX
	1U3ogQeEcYyW46xM8RlHAXyAtZmehqzQme31+MQxANA9nu5z/kOzpYe6zaqjQMhEgR5hu
X-Google-Smtp-Source: AGHT+IE00kJwyXYY2ZwvWXqThymzS6C5sZyc2P+J2HPIEW9i7tRHc/Ygwlxj4g6UeWvVOGWXsJ+oNg==
X-Received: by 2002:a05:6214:f06:b0:728:69f2:dbc8 with SMTP id 6a1803df08f44-7393f9861e1mr86467006d6.46.1757354143607;
        Mon, 08 Sep 2025 10:55:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-721cf6d6cffsm119699136d6.54.2025.09.08.10.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:55:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uvg5e-00000003M4i-2UqZ;
	Mon, 08 Sep 2025 14:55:42 -0300
Date: Mon, 8 Sep 2025 14:55:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, will@kernel.org, maz@kernel.org,
	tglx@linutronix.de, robin.murphy@arm.com, akpm@linux-foundation.org
Subject: Re: [RFC PATCH] arm64: swiotlb: dma: its: Ensure shared buffers are
 properly aligned
Message-ID: <20250908175542.GB699673@ziepe.ca>
References: <20250905055441.950943-1-aneesh.kumar@kernel.org>
 <aLrh_rbzWLPw9LnH@arm.com>
 <yq5aikht1e0z.fsf@kernel.org>
 <aL7AoPKKKAR8285O@arm.com>
 <b5ee1ab3-f91f-4982-95c7-516f4968a6c9@arm.com>
 <20250908145845.GA699673@ziepe.ca>
 <d8687b08-6bb4-4645-8172-72936a51b0d8@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8687b08-6bb4-4645-8172-72936a51b0d8@arm.com>

On Mon, Sep 08, 2025 at 04:39:13PM +0100, Steven Price wrote:

> guest_memfd provided a nice way around this - a dedicated allocator
> which doesn't allow mmap(). This meant we don't need to worry about user
> space handing protected memory into the kernel. It's now getting
> extended to support mmap() but only when shared, and there was a lot of
> discussion about how to ensure that there are no mmap regions when
> converting memory back to private.

Yes, you probably have to loose mmap() support in this scenario unless
the kernel has lot more work to make things like O_DIRECT aware of
this sub-page safety requirement.

But, IMHO, this is an optimization argument. Unaligned smaller buffers
can memory copy in the VMM using read/write on the memfd. That is safe
on ARM.

I think the need should be made clear in the commit message what the
issue is. As I see it:

1) The RMM may have a 64K S2 or something else and just cannot do
   shared/private at all using 4k

2) The hypervisor wants mmap() of 64K pages to support O_DIRECT.
   Kernel cannot safely support O_DIRECT on partially GPT protected
   64k pages. If userspace tricks the kernel into accessing something
   GPT protected we cannot handle the kernel fault.

Therefor, the VM has to align shared/private pools to some size
specified by the hypervisor that accommodates 1 and 2 above.

Jason
