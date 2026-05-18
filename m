Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB033E277F
	for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093307; cv=none; b=sqhpWxcCJzyzhmBZHhY0yxTtvAoESL3X1KVpro35v03I+Vh0loKl6hS5PDv4LMCjG5ajE7i2i1Ep3xp+UqsHZ28GEdieeQvdx9QJNn8GdmaWPuWO40dlHSWpVNvbVQ+IVcQytpy1+yV2nqH7+gqDaaZQP7AuByL3HLokO9XumkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093307; c=relaxed/simple;
	bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkvUxQ7hgiiDIzI5UU/RQpjVoxP7GrYZRrCSkRIitJUYt906T42qOggBo/LPBsOnX8gioHhexEUfCrbWbjCmg1Nv8QKljWUeqCpwIYpMfdX6WQxSd19cP55ubm9UC+2OIKPY7gfZFYgNt3IfLPjATjU/wLgjRKzEd85MPlSrCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=DF7/QgUz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="DF7/QgUz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so617475f8f.1
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779093302; x=1779698102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=;
        b=DF7/QgUzoi0t/MCBHUjpgc0lDZbKmyW2XWCtXG2m3jOQlqrg+LGiz7c6D6hRkOYf+u
         JWd+7wYxlM2t7JwlaYog8kZ7iTajVQPuFAfsk8dKmeUfiU9pYFuca3s5+dSq2tX6lw19
         GJuZnxXfHswoVSLANhsaM1m9Rpc3Or5Pix1jzZ5UHD+x36CvJecYLb2usNdeqAyUFXD+
         bKUlCayFnu73cB3zbyIZE8Uhv8H4s+aDWz3lfLs6Mehm28Jn9lRzyBCKpaeMyZiPg7G8
         kFCdhxO7JypnC6wkgHScb07oaQG9VBVHZB/hdq2Wdc3fpi2CXYHESm8rL0Q0rBgH82qn
         2GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093302; x=1779698102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwzE4WvS1tturD3icBf4rnhXP8uxns5EKACf2ikgZYY=;
        b=Y/SFRoTwPItv3yj9WtXL2UiM/83kZjOSj4aokahzSBXlckUrUmzI3lTzpTkvKETIDU
         JlJPKJ2Hr6FAwFlmY5ep4tjh0lEUMQTed3a01yyZ9mqkOyzr28/aTog9GJujpyeqsV/E
         op7FF1isGSZr6YXptOvBmo6ZGwBvUx2a+AvA/qFYIFsQZk9r4lotlp0aoVLrvd9VYsMO
         Jpe53vjOXEllc8mQBjMGze+W5wvyWlyMZlILxGT+gwx8ONVFT+LbYFzksXj65CPcGRqQ
         vJX+z8geBq/OO3CiN/KoBK1jiHqhi0WMuROaF5CPsKfjRV+PPOrxDkK5zxjUk3ijFBaF
         aO4w==
X-Forwarded-Encrypted: i=1; AFNElJ+Jbs92iGSyswaiPIFI6r8IRsg/wpzVZZ4e/VH+TCtC6G29BQ13BvH5HeuPQEhFMbRkEB5+lbpKrUfn@lists.linux.dev
X-Gm-Message-State: AOJu0YzqfUlVegw50hUgz8OWJv081CS3OpupFGoH80kpPu+EPDsUCxTH
	3gjnfBjXZyflWbb4imZ1c7bRWZJrse9NdCHPmvHQ2gMd9eMwxORmfen1QuvqEJX2IQs=
X-Gm-Gg: Acq92OFhAYdpLNycxFCqqvM60UP75pQlI8U+Qy4zv5P+DcuPCrIsjPPCKWjrQVdV5M2
	o7RvQ4myLP2ETfUp+8dES11IO0+rErj/7zRxdCSvinh1SYLr9mLDjIbkEDF4gkgdrtkIX5yOnKA
	F/b8iSZkQNuSRzuH09UVIvSm37+QU6c60L3jV8KotniVp5zivU//+nnTMHRB4k5u2Lxn3fRmfQM
	OR2QE+/b7r4VHWo9IpDd8Gxs54bRmcKsklamtZVPCrjz4da5oWGP/a5kXyZJFXVfV+zyYHfe6FI
	b7EGXmnZVnSEl0cmbQtXN58uPznZfPWpxX/d6wPqNWkdMzXjbO3v2+Rx99Nc+UHz5JZY1ur7HNH
	d7Vj29ZRe6W1omwnem7uxk5IgtmJ1zYUeSDdh2FVDMlmpx86or8ZQ5Rk4tqi03vWqhgoDnZMT+H
	O3UC5yGzMVcB7i+Kv6OGbgkbguQ2IKwdkTG8BfNtynhZKB
X-Received: by 2002:a05:6000:2083:b0:43f:ea04:dcc7 with SMTP id ffacd0b85a97d-45e5c5f277emr23023553f8f.24.1779093301850;
        Mon, 18 May 2026 01:35:01 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm35354787f8f.37.2026.05.18.01.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:35:01 -0700 (PDT)
Date: Mon, 18 May 2026 10:34:57 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Mostafa Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 00/13] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <agrPHNClrdRvzOFI@FV6GYCPJ69>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <agldl4XQLKAtyLty@FV6GYCPJ69>
 <yq5amrxxxh0h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5amrxxxh0h.fsf@kernel.org>

Mon, May 18, 2026 at 10:23:58AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Tue, May 12, 2026 at 11:03:55AM +0200, aneesh.kumar@kernel.org wrote:
>>>This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>>>dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>>>are handled consistently.
>>>
>>>Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>>>shared/decrypted buffer handling. This series consolidates the
>>>force_dma_unencrypted() checks in the top-level functions and ensures
>>>that the remaining DMA interfaces use DMA attributes to make the correct
>>>decisions.
>>
>> FWIW, the patchset in general looks good to me. I tested this with my
>> system_cc_shared dmabuf flow, works flawlessly.
>>
>> Thanks!
>>
>Thanks, Can I add
>
>Tested-by: Jiri Pirko <jiri@resnulli.us>

Tested-by: Jiri Pirko <jiri@nvidia.com>

Thanks.
