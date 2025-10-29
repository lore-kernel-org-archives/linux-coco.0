Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59431E0EF
	for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758381; cv=none; b=RjyM9dv1sA+iOcx2y/LG+QoLtVJfV0g8Xrymb4CJ9UjRdRREx6Bnxnx39EJyDW84hL1tqo8HXFixU0ixbgf8CmdppDl6gpSH9IjL8hkNofo2YMoAQJZLl2jXU/aB+8iuR8DkLdFGguGi/SGYh8DAC9ekSmyIz41X5Clsy3oQK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758381; c=relaxed/simple;
	bh=bSNd3wWUQQy2YBLmw8YBigmBKjZAe88REZ3E0Gos148=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJFkacIIxlICQOFowsX5Sx90wnddrCoep79pidWkhraewkvvTYMdxXw5lfqpS+YYlJIdeDlgEyYhqzYzGOmOAiKyLCuwZ7pdd+Js33ndF+J1Kiry0S4eWTaJWP2pkcF+bVfaJ2dS8xN6ba+XUxlZ6wKhbRyiRRTlelJzEgFs1es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hib+IaEm; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hib+IaEm"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-89ed2ee36b0so4809085a.2
        for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1761758378; x=1762363178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bSNd3wWUQQy2YBLmw8YBigmBKjZAe88REZ3E0Gos148=;
        b=hib+IaEmI0n8nxZWdWACo30UWvmBDEOHshVqHVH2zczE4BObOXLFtiu29Bp8GjIqur
         xj6Plh/xeAay2qEgH2OLAhB8S5f19gqH9iN1I9ywtjpa6/PUtvKqr4+bvHqZNY2aWIkj
         jvpmU/+ac5P7xMrPw4q2XHZ6ADLYeQcWQIA1McxOJefyZZlFTaCJWWZqFEXNi9LFyL12
         mcbWysJbxHv+8PGK3vBhiYY0+C3dHeC6SOfdGugxNtZJcHKrKov2HREaHdpYlgCuEt5C
         A4odrkM8ae0AWQ+69N17nApt4PBX7kdC3Yy56+gil0QJbC4gFlWU7C50imP0Sd4BRPKg
         z4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761758378; x=1762363178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSNd3wWUQQy2YBLmw8YBigmBKjZAe88REZ3E0Gos148=;
        b=V7F+xvDqM4wreK3WSuCWPywxM0Vm+rKTGpxOOndnE1yhETZVa6BhpuW/1XoorRbIIc
         GHGxqPHQN6fp6he19rqVaWNysARmu//LsKLP1ZlTcuL1pQWwDssFG1DP3aFUIG97P7PB
         6uIxlgwqsMZNQH3ojJ2xrvDHo/w/h3wCn7Vn82W8uQjjjEUnTHcz+hpuimIF4fjjlwqM
         bE6lhP0WdZkQ3guXYI/0qS/3L2RZoING8+bWSs05lwaMZZIl++ylzq7vGrpGWQAKDsD0
         aItq26KoNgoQoEYhBZbY3TQHKR0SeyLw3qUzQwjf/GVfLlBqOc9e3V836aZ5B8sgYUH0
         DYrA==
X-Gm-Message-State: AOJu0YyHxLam1iKy6pcSJrMQSmHX97yr8NGNUx4qmewIrLev423Mo2rI
	dmdcYExlo/2qJ+iTi1JK3LfAwQw13cBkz4tNlFxSmzkxlUpeVanIPJc1QWrTpuNgPOo=
X-Gm-Gg: ASbGnctxt/uhsZkFup6yXVLFoj1hz2TPfe+l4whMuPaHLbRgsAy2yEcBYlGdhvmNVpV
	tTkGLsd08bmOynmYNbaySj1REaULFFrO6JMH54jB7vv/ksHurTIgDXAD32Rt3SC7I5oRLRIL6jn
	cayaeX2gUGIZGYnY+Tw1LwyLNrwSLq0jFqIYz1TydqwDGK5MdPTfBSABYD3WmBuxEghKMgjeGXg
	way/PRC3ReOg7m1sc8Qec4bH/zrUC+/y5bQiTQk25iwYTAxadoCQXMPShk7v43hZu0CafKJYKA7
	vrn52tBkG+xWA7T8DJYHywtpQ3zjVCqLaguc+w+e18cVaUgdujkWkjce6boT790lVlnVOKRYFjV
	NOLFe4Xayy+5fXCYvG+1uit6xIsY0FdCzDcuhEWACk3CFSYvbefXBZt1/u1iQsfaIBetG8R3H/E
	K43FKRd9JY/gt/xenTxmm7yqcVGAtvhP+0GJ97/V54Hv9+2Qqhd++7yFAM
X-Google-Smtp-Source: AGHT+IEE6XGe0cEoiRKL4NLOLkjviUWVkKq1s/Sgdt6ffSSTAqyCXCbcME2UvP5qWSwdJ9Al+rYJjg==
X-Received: by 2002:a05:620a:bcc:b0:8a4:6ac1:ae9 with SMTP id af79cd13be357-8a8e436110dmr482308385a.3.1761758378351;
        Wed, 29 Oct 2025 10:19:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f247fe594sm1089845885a.16.2025.10.29.10.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:19:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vE9pg-000000050Jg-2H4f;
	Wed, 29 Oct 2025 14:19:36 -0300
Date: Wed, 29 Oct 2025 14:19:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	dan.j.williams@intel.com, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH RESEND v2 12/12] coco: host: arm64: Register device
 public key with RMM
Message-ID: <20251029171936.GR760669@ziepe.ca>
References: <20251027095602.1154418-1-aneesh.kumar@kernel.org>
 <20251027095602.1154418-13-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027095602.1154418-13-aneesh.kumar@kernel.org>

On Mon, Oct 27, 2025 at 03:26:02PM +0530, Aneesh Kumar K.V (Arm) wrote:

> +DEFINE_FREE(free_page, unsigned long, if (_T) free_page(_T))

Please put these sorts of things in their proper headers

Jason
