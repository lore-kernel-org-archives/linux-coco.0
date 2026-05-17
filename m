Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C108E2C0F69
	for <linux-coco@lists.linux.dev>; Sun, 17 May 2026 06:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778998784; cv=none; b=tyPA+LXiryKZdOsSkdYfjsvpvAosW+SIJClpVCDF8WqNUN1J+/FLaYtZe8qyC7azMbejSkJVIk3srNVu61M+Zwz/0f3VxkaBsu7Ocd7f6MbfVdlmPZxPx1AwvSOd0NeSZl5DehNsqwz55rPD1qGsggpnpmQGBmimzy694Qqp7O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778998784; c=relaxed/simple;
	bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqXY2z2h92Q9QhkY1Gp93RRVRzRWChb6YskwIVTp5XI5Is2c5qLExvqKhbbW0enrXKcg8KyENDHn/pR/tv0xvfkOmKbgcesMzKMxbrMqLFTX8u4ouRRe8Tl31PO5RSXf+md2aAAbYwGsCoX0aiy/KXSavA7+mGnAQSTheEKX7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=xE8N5Yjl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="xE8N5Yjl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43eb05b1875so469473f8f.3
        for <linux-coco@lists.linux.dev>; Sat, 16 May 2026 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778998781; x=1779603581; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=;
        b=xE8N5YjlgeZQ2/8dzKDm4mxObadEMqmyS9V+uGIntKzeiTP/9IVL7sRJrE7S8oxkPN
         +yrDEjJ0qSDEczkjqrwIViwX5i7nXExtIK9Rzt21kCUQiRiSXZiYfqiEXr8P8E7Pz0NS
         TdG2k1SFiyKsi1VOM/ORQYlUqIAR2uFar2Y8x1PCELL/QatMTobrAD4U+iaB+1IC7fDV
         QcX/+0nsU4o/EK18glZRJnVbCvdQVrc3RgIF61rMvM2DDRI88MdDMXUS1LMmHGpe7lMu
         M+7ovJcI+TcRw+WRic1D1PiGSjBgi7gW/mJJV9+h0Iz6CdDpQzl6esT9qenPHKlhb26a
         UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778998781; x=1779603581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=;
        b=YcFnMq9dCRb1Cck+1r8KIqwGplosPeg7KBaADJTJAoDQwc99oHT1oH2IC+fTerI7Tt
         5nRZDf32b8cQn9xrqNlGLuFJxvpzEAPbSapDcj69htEb7dZN0SoLfAcjhEIoKD5aZ5oI
         zZ6irFZB+CNfbVB0MhdTY8jpOxacqa8KnY6UosUG0TxfSt6sCeX+wrtY5k+kBzirMZPk
         bBmHBCAmYRWLOiwfNp/CqFx3c2Zs391WNi1FdQG1S/ITAixbRfd0MI4pIqbvs78W36NU
         2MyyesnN9tnTSuWMqdKNOgyNEW1shyCXAduVCOxHQ9i6MGRUurdObes9Nhe1/kCEn8pB
         agdg==
X-Forwarded-Encrypted: i=1; AFNElJ/EvFUH46lh+Iu+qlDtC/edOkh0Y1NEKh6+lSQIJDbVpvRN3kJWedhejRmomZXnYWvjX40gBHPQnHQz@lists.linux.dev
X-Gm-Message-State: AOJu0YyZz7qtpbtfypal2OE+83DTbR26tAfWreVIDC31XNLOXL/DDn3D
	2EbeKl1+DoETNjvopUyu1OZTFSudC+6Z2um9liGGxGT0ABeG5hD1wLKr6SWFUgVO4As=
X-Gm-Gg: Acq92OGJh9GlcHLmzWOODWFVeX4TRvk02g0W+Ycwf4B+zwo7SVvw2eh81RHE9p/UUgg
	VpAGIwcqn5z3OuMgoKcxj21sU5G4PLqaJYCDm+6JIRKZV9VK9pAfklcFH9V96TWSRJaiksVmVJG
	HgnaVyU4T1Xg90ibQ0X+iSur7ZCj9drcf6IB6oMrw6StOZiX6pJ4XVlYBwCB4LveOWzfcfM+mJ3
	E3hjGRZ45hqp8vXNQDn8eS2ZFlHWhJBaFvfXGgsgh2L4qL5GIR70eVRqNTVhlqz7sOsSOr8MvFH
	o+rtBcVcdsX0OMNat3EqBb18Md8rG0dgod8U4FnnXTxQiuJP9THwsLZue4rRJdi6guS3o4gQaYV
	zLXrV/YONNQOSLfx//Gtz5i8fvKCJd/Xm8lNxXxg+Lh3KgQILe/I9xOvGNNDBCOh3Mv6LLsrIe5
	m458gJQEWNckl3WEfaTR5wwlY3Pw0WolOkAMMQB5HHJhznGg==
X-Received: by 2002:a05:600c:a30a:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48fe5fda35fmr111967805e9.8.1778998781051;
        Sat, 16 May 2026 23:19:41 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c788sm163535945e9.12.2026.05.16.23.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:19:39 -0700 (PDT)
Date: Sun, 17 May 2026 08:19:34 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Message-ID: <agldl4XQLKAtyLty@FV6GYCPJ69>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512090408.794195-1-aneesh.kumar@kernel.org>

Tue, May 12, 2026 at 11:03:55AM +0200, aneesh.kumar@kernel.org wrote:
>This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>are handled consistently.
>
>Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>shared/decrypted buffer handling. This series consolidates the
>force_dma_unencrypted() checks in the top-level functions and ensures
>that the remaining DMA interfaces use DMA attributes to make the correct
>decisions.

FWIW, the patchset in general looks good to me. I tested this with my
system_cc_shared dmabuf flow, works flawlessly.

Thanks!
