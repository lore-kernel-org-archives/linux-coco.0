Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42F3E5560
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769457; cv=none; b=oo0/jw84cT/BN/iXdjdEt6scv49zoJYVEoXPSjsw22pdW3CDtSofnxV6yUnIm66QeIp4fLWnaIU9CRiLAQmFVWHAAbEEsoAlzJ5JAkhqRISs/wozbykrWO4sddd574t+8oTYeOIXfctLW4QDrY4PNHqeIwUd/mThNtrxnJ8wALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769457; c=relaxed/simple;
	bh=1R/nhGX8X+QrR70RUCgUXl+c5YpTnUwInBBh5eq6G2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU359j/YZHX0M8aP7qnIDuRgI/oJWVmbiyMdpdEAoXivUJjVs9e+PWLPntwKrDch82+VOl7xh3TXE4Prsvha6/z4EVBu00Pme+NzBKzfSU8C5ZX61DL50wodlJEEULxqAyPk6pBGBXF5Pgd5opBy8R8+EUajBjtAQ5O5kuwdjXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IvL/0DLn; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IvL/0DLn"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8be236ce888so63931496d6.3
        for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778769455; x=1779374255; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKVmCu+Gb/QJi05GS/MUngbhCp2nJ8/F0kCLFA01DR8=;
        b=IvL/0DLn7SKrOp1rX/wGl8AWaRCYkdp8OfEW3zxxAqhcyyOqqB49/4eG4o8P/iM6l0
         kgYIc93bT/eVcZMjL+eAe7hfOP1DF1Z2TTDQj2RmGqqfqowCUvyNzjMLyPSb/+et/GGP
         IkjyWdcE7BG0JcKM435yh8HvCWVf9hSVPybTykFF85RBUTHzIYmUD87gPvI8M+okpaZR
         MaO3sMK1qrj4earksYrXN0aCY9tbrBPJXvo2AyEdzmsnuKKUql+ejWJHt0mKSE26Dzz2
         2aP5rlVJRVLfqE4OQT3M5vsqzD1oZ7PEZG0xxO2C53GD1ryvDXrI7Jen9nlpxwwaqHNG
         ackQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769455; x=1779374255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKVmCu+Gb/QJi05GS/MUngbhCp2nJ8/F0kCLFA01DR8=;
        b=eTTArdgmqQKk3V+e/FHCQbfBhEIJ33llOqNYUU/oLNb9fuwdUqV1ZQ7RhNyzIKhAXj
         a/FXBIj3OnwYQfa2InwjFdVPJlBIfJjEOnczfOWobvuIh/VRxSdWLX2dxibhv91JSlF6
         LPqIUAlQllSqFjw+Vih6aaBKzRQzvCGV1ovJJ7Ov7bO1Xhk6zSUGrNTEoGNGCBToOfQD
         udJJxCDWs3RDLGNKoELlBsfw+xhDhD4v9HsS5KJeKKUAE9zUAH3WPWJ7RwqgVq0oGD2U
         Zw+LbmvcJ7QU8Qr3E8A1j4ojaPEKQrGEBt4LiQFGoT/7PNVc/sDQC9oAlPndqyVyK9C5
         8nMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wXD0veI05rDEs1aTIgzhwgjeo55ZmxPV0UV3gdg6OzUAPxpcbfkYHg+T1Mb7PfdWfDN9wwGfYtKCj@lists.linux.dev
X-Gm-Message-State: AOJu0Yxar0icwgrCi7voNnBOnTp6ndZZx8o8TDLfqS0B55rBdveu51cH
	dkkxTGUXoAP6htk+RUJBBaVtRVlOJrSTKwypKxA0y4yOsn3oJRpZS/x1VU/aF/gEMeY=
X-Gm-Gg: Acq92OGE2oRpNpv8sH41MxsCSA0PNXD6RykKObB+MZfN8u+CiVhk+82pWE8UPcaQ117
	7iI7z1dz9ijXuyK+9HuV/IEME5Ue6BkE2yWT0sH5mYQ94B3D8tmTT4dG2nd75OIkMpEj9tNpxSL
	EgurUIzjWvSKogedVMiSzb8Tb5yak0iK3DBSNs0+TvcR3cACV7ysGxAG5MTqq7meIW1Nbp47rhk
	RRvwRQCBEtJPyR3tDzUWnfZM27paaoj0jiMNoXTI4ywu+sirkc0mcNZKSsYGS+2zlI7shwRiNMa
	+Xw4OaCZISGKddv7V28t+i/VG9SjxPvVH+EyEJu1Y3QnZH7w9rbPEwMm5MN8IY89T8tUvsEKfnk
	gyMSC2kHGj70QE9n8AObjGbvw5UNShzgTPKf9r+IlpTwGRvSbS9cYNImvxZdL9a7ABMJh6yiuWa
	/ytsF8yYzUsO9dJ7xliNceq4K70OIp3qOkpR6BzwiXWxidnXSgHHlSI/4Zc5V075EnaGhlDRHXo
	ncY8A==
X-Received: by 2002:a05:6214:55c6:b0:8ca:ee3:6e99 with SMTP id 6a1803df08f44-8ca0ee376b1mr2894306d6.44.1778769454659;
        Thu, 14 May 2026 07:37:34 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908e11929sm25017416d6.14.2026.05.14.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:37:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNXBt-00000005Lti-0CPB;
	Thu, 14 May 2026 11:37:33 -0300
Date: Thu, 14 May 2026 11:37:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260514143733.GB7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5apl2y5f96.fsf@kernel.org>

On Thu, May 14, 2026 at 06:18:05PM +0530, Aneesh Kumar K.V wrote:
> > There is no problem with non-protected guests as they don't use memory
> > encryption, my initial thought was that th encrpyted/decrypted is
> > per-pool property which is decided by FW (device-tree).
> 
> What I meant was that we need a generic way to identify a pKVM guest, so
> that we can use it in the conditional above.

If I understood Mostafa's remarks I think different devices in the
guest need shared/decrypted and some don't? Ie a virtio hypervisor
device needs shared while a real PCI device doesn't? Is that right?

In CC terms that would be a mixture of T=0 and T=1 devices hardwired
and signaled by firwmare..

Ideally we'd have a flow where if the arch precreates a swiotlb pool
with special parameters this overrides all other decision making. Then
this series is about making CC NOT use that flow... ??

Jason
