Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A13A7F6C
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062134; cv=none; b=VggF65rsyOzgJBSQ2DAwdgOzgHceFlE2pYvFUPvKZv/VMM8Vhdi/w42YL+TbXMg+uLxesTi4sqVkO8+GebK4YiS2kD8ox1alIC08k+hDfumu+9+qVdZmOzkmnVFt/wTIP23qHBbd6+dTg6CQ7mj4kzsoC61Jh2NWwdxo9yZFTWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062134; c=relaxed/simple;
	bh=UbKRPGurvkeEylighvGv7GG2XxMvDn6WSSd9/y7ODUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXt/6R/mmFSTlRIgaiPA4Jx1oJpziJUR/UBsS+Vu/CYZ0qlgdvjYiO90gRP7pptzcCU4qZ3JGTdo9MYVdpq5VmAeb7yaPL41UtSKA+yXDTiUBY0VDopZbxZnRX2hC0OU5iIuWVxCYNXM+NGp5KUZZcDimJvkc+3WzaiPKrL2qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kJ9eWZl6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kJ9eWZl6"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd75abd09dso281899085a.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773062131; x=1773666931; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
        b=kJ9eWZl61EGOnCVSfU9ovkMlvubbJij/eoXalqVz2EgYruV5/t/Mj4gndH751lC6ZB
         5w6JAPSzmbDoRZ9Wpo1jh9/5QOvDgFHZ+dsgpE2Zuhp8ZdfLK9fwqpIGs8cRB9jIdhmQ
         7cBa+rsqmEK2+s2tYVcOv4RjWUT5Wlgc6U9LwoTigOZkDENFZ9VfUuH+daFT84VPSASc
         q8QRonXq1h5XJW8GqTgv7FAM1rHSVaNZh1OS8wfs0Sppp3ToQBM9xwc5RlVpKXe02tw7
         i6k0K3a9xnniaeRIfNmBU1CoMCR5oEbnA/+xzpjaAp8B9M2v3czsfFLL8XN3MsElpWDZ
         2L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062131; x=1773666931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
        b=jthYkT3boPS0jqmWGBKsoHLjonj+jYxj19zYArGosOAxa/aDeIvgMCDCegkuGliOlv
         vO8LGdilh8JAakuD72rI0AN2ZVGeVcmH+5qIdtZ7FTDsPf3Jc5YFyVz4MjYZaoTNrFGp
         pAW/lH3DKH1zV1zB3pmiaM2T6vKsyA6k50z44KZykhVJ+9avy0CAZir5jQj5gYM0ttPH
         4+6wAVMOfkouKbid4TXz1kEOzfAD+HywhA7YSYYmHsjV3pXcWN2Vu1T3quwUCi7HUy8q
         cZt3L66daDWMM+L+iw4XDcFcPfO3o51vv+sA+EfmKIe5TuNgBhI/AG6tV6IBSxKDP3go
         WxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGJoCWSJzxvbXUULabUA6oNMTdAPtENzM+9rLkDEUEfSK9cdXyqFeK2tKT3mI05zjfwR1wGrEt/cBl@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0bPgTPH3I2160B+s2KQ6OmyWKSN8RCoHLxSqOJ/aKMsgExi77
	SkoGDHbUU78787wLdoqqD44WKj1cG5ZtNOL5zyVqYJQtTxtPisoHTHGpIxa6h8sJkSk=
X-Gm-Gg: ATEYQzw2u109FBxSBZeWM7nIqkYyV853hM2S8Pr4Nz0FiRQLCcLsOmfwDGyhX/CFvSb
	B/vUMquHostdXAQjZNZvgzwG5eIFrBtToS/cwIoheM6CgwqAeidqVt1nmaBOXNpR+GuMqw1GFAD
	QDSC115WEVdkPXebJlZou+45VE4ktX3PdYITrU4DezlxmQ60XmpUjttZ8M56ns/4IBWAgG35TLo
	UlXeNuwCADh7exPdHfKmJly0cFnlobRj9HkdWSic01jLjEKdQ1CsKz7WQLOTkL7fZmTYwfy7Gzw
	tT/TqVe2BEDYTyFzejz2n2LyHSQhF/kSSfU/01kxd3YXoUlAJIL8BPRB6f+v9+iCR9aYX8F65aC
	7gn5mp9laRs9oU5PJP1jHyTXLJdB9pD8AOEs70I7TibRXdD58DFnkXZOdB21NWthaCfA5kxODw0
	bz3oMdmsf8j31x38pjdtnJIxbWJe4qRg24qDqCPlF96e/cgoTlZ1d2uKC73fz4HkX1FoYjChq/9
	WswyNb9
X-Received: by 2002:a05:620a:4381:b0:8cd:76fa:1be1 with SMTP id af79cd13be357-8cd76fa1ff3mr1023224185a.14.1773062131558;
        Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7e857037sm378431585a.20.2026.03.09.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzaSI-0000000G6JW-1RIq;
	Mon, 09 Mar 2026 10:15:30 -0300
Date: Mon, 9 Mar 2026 10:15:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309131530.GJ1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308101948.GO12611@unreal>

On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:

> > +/*
> > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > + * (shared) for confidential computing guests. The caller must have
> > + * called set_memory_decrypted(). A struct page is required.
> > + */
> > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> 
> While adding the new attribute is fine, I would expect additional checks in
> dma_map_phys() to ensure the attribute cannot be misused. For example,
> WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> that we are taking the direct path only.

DECRYPYED and MMIO is something that needs to work, VFIO (inside a
TVM) should be using that combination.

Jason
