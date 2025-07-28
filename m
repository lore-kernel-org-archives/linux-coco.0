Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124291ACEDA
	for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711726; cv=none; b=N/IoUXn5K6Bh82/ZpvPJwoFvIImxe/a6z/szRanmDDvoLoN73qUB0gJmB+yVr2kUuVoUsg5gZIRwmcWdwodKlnjr4+NCMTZA7t3WWFtCHCRrHZQiMm5W0jyrOsMZ8toB6LBIeWqY8if9n/ZaNgsY/IXqwZG0ahLuf8X452VSQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711726; c=relaxed/simple;
	bh=4kahnbCUUVK18hvpSBxURKB9raQB46M0iQ5FOKtQghE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+hniWOQ2rWLAI8Hm06w77eHX6tICqyztl6+bcrx57Cg5d2t7cg3J66PDURWhKv7FeZlxfX69D+5VSzgLQVAoG9EPVEaTBChFDRKwCWRsc7MKOKb4HRfeIToXijdn+jHACFikHDvRriAVC9dO6Rl5q9o7dYatJPd6H4x1qKc5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C559wDSm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C559wDSm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab8e2c85d7so58984821cf.2
        for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753711723; x=1754316523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kahnbCUUVK18hvpSBxURKB9raQB46M0iQ5FOKtQghE=;
        b=C559wDSmPJulpG31WSKvuAZsusIH3s+Oj9hxMBMhOAXbmbElL9HwX1CuCuZrWvcxRu
         XjvEbIMfaQivMPnuaUE08YQsMn0w+12LfhhdhRFADGmi1ZkG9X/CylgUvu90OiXReX7P
         6L3S7t5y1/VjF77qjwD45dagL5pkQe3TBhKBQd7OF01tWUBrTdVqVVaF4zFn13iVA+AW
         lZF0UM3xvuRk7rwX4AudOsinUzIBi9UZyQMSBBHlNrdcQshUFNRGH1fywca7WXcCte6C
         lE7tvpj8WpagC4DDSkBjoOQTiLxwlHeos0eOwPZTy/z0HVYtgleZnn2eFA06sYuLInJn
         uJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711723; x=1754316523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kahnbCUUVK18hvpSBxURKB9raQB46M0iQ5FOKtQghE=;
        b=LyYaet7SDIMxuiSIllj4akuF1zm7INAIJLI0nPHbiiwo3ZiTOpK+pXJiRgtzGIrwTO
         It/iAETybTdpd9U5R9zV1hzH88EA2xWsM9vzHpMt1+MDCX5W1oJMl8V72kjU/j80GNtA
         ljyNdJfOxp30cm3l/VGUoS/Ou4JCESxU/cGWTWaSEXdoP4/by+T6P+gJ5YBwO4Uk2L7M
         yJmfxjACi6kGuhTO1VDy76fkSdGrnf0Zd3hPLnWv4Opg/LCr6Yqkr6ba/buKvN+DRwvm
         HrWU9FVUT5GCbnk+4KvCf/Dek+/syYQkyZtzrX1uYlUpjrnnpk1vvvPWCHPqLVrbvTKm
         TFeg==
X-Gm-Message-State: AOJu0Yyf2f+arDoKd3dKU7sJEh+NTbO3GR8vmeAkJaMOpTho+4nWckpm
	p/ZcOajFcBWfhhg6uOset5pfJYrivtuIwq8Z/xALhd5/PjnaHSjhk/e8X0d9lARKa7Q=
X-Gm-Gg: ASbGncsE8BaBNexv8vHeYw0lpmWZ1RoETyNSRTItp/9K9/AXQR7ZGiMIGHJ/TYOkGjO
	1tYyKJt3sCt7F87QAK+1EXlB8cxVPw8v64dmdIGDCyL3J5mb3v4pGD6ViFHefDCXTINiYbaqjty
	qpU//q1Nj0jgyLwW3cYqBQK8aWr2/XaTuPu16qW6y7KmQLM72m1cB9jlkvkcOWfDgPCw+43fcVs
	9iMjTgSCv6EwobmS/a5Yt4rLdTMsurPdZ+jQqVHrKnNiwNnUOf0WqmANOJKz8p/EbaycavKPF1T
	QdfaLfUxLFps6TFnUyzQ/lkiInbl5Ex4GEifkLyZL01noValK6UWgCUekSq6GQ/Nv8RKydPvlsx
	QexXeAV1AU9gCkvGfboypc4mlbjythicd8bNU8OsocD80OWEkjJmfcwVc/Vka2onuHg7s
X-Google-Smtp-Source: AGHT+IGXQH54g+OEuDAZ//VEsPFOF0VZ1eCHZSsCk3KsPn6dRKNeXLVClWZB7Vwu63ig1wAqfFoyFQ==
X-Received: by 2002:a05:6214:929:b0:707:4509:b6c1 with SMTP id 6a1803df08f44-7074509b794mr50900796d6.11.1753711722526;
        Mon, 28 Jul 2025 07:08:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729c70979sm30626156d6.86.2025.07.28.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:08:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugOWv-00000000APv-1G4L;
	Mon, 28 Jul 2025 11:08:41 -0300
Date: Mon, 28 Jul 2025 11:08:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 06/38] iommufd: Add and option to request for bar
 mapping with IORESOURCE_EXCLUSIVE
Message-ID: <20250728140841.GA26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-7-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728135216.48084-7-aneesh.kumar@kernel.org>

On Mon, Jul 28, 2025 at 07:21:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Why would we need this?

I can sort of understand why Intel would need it due to their issues
with MCE, but ARM shouldn't care either way, should it?

But also why is it an iommufd option? That doesn't seem right..

Jason
