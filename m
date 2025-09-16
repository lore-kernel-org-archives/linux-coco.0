Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392028724C
	for <linux-coco@lists.linux.dev>; Tue, 16 Sep 2025 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010569; cv=none; b=Y18r90rT6EvQiz0GGsN76DdwRsnpVdrdjCz30BjO446eNMxrvZcjqI1wdUWaawVQy2RgSdwoVNemYeJ048BDeZs4TunR6U+3B0a9HRzHa0bG+BCBapRipipRP/SlL/T+ITpLRCX1JUbr5ps2S8ndlVMEGneJoiV6uaA/Uvbt5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010569; c=relaxed/simple;
	bh=m871iIeOfCazaoSPmTALTlNsX9LyCc0jz8OY6/Cozzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aD1BWpMz2IYvd8SLFadboGRTejoSeCluphQYR0nQXoY06041OtsFLttB8pkKqvIe2/mWN3hqrqyLUqC0G4wMNv4yLeQ+SEpDslWLpB9OLTowh+qgsJLaasza0FqjuK/iM9vPzMgQmgoAiHSyvojP7bBYND2IZRKr0xWkpgVwdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=heBU+3N8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="heBU+3N8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f30011eceso32125e9.1
        for <linux-coco@lists.linux.dev>; Tue, 16 Sep 2025 01:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758010565; x=1758615365; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meShyEXsOGbbZChp3RRq7DlLygLq0PznBxg+g8h90lU=;
        b=heBU+3N8JU2l9SPGcGYCjBJNPiXN2tQ0wA3xthu8Bw/ocjG49qyeXpa7Vkt+Ot72SZ
         y9bXj/Tm5R9tXlhLx+A2ibfAuLYl+0kzlnuhpeqKFcTB0Q+E1QhpVh/xFiXwpGQ8V3a8
         SQniLwku/LW1/9LwpBhtVAqSugid7RNjPq6p8IHPFgrypGH0Uyjd/QArTwTK9RCErQwH
         UZgQef2+3XzvsY39vmvojBcXWBBHLVs+Z/eQsiGfYOPWCUauVa5LwxsYKBYrHmj93gnk
         ekl+7MiS3Jd0G9htHuaM7wqakbAl4i0sTsEpP8tnHVh3f2Znz6XiSHtaamlYtLUQK0F1
         MbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010565; x=1758615365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meShyEXsOGbbZChp3RRq7DlLygLq0PznBxg+g8h90lU=;
        b=MN02akstVQEjGp22uZ02rZn32BieTW68/kSqg4pVFCSAgat5Lx4D8H/agol1Bgatg2
         WAVLy+lQNKCaquOxR1QBbkeK70puhLdRSg7vtgB5XAEtGm0sx75d2d/WrZmvIq5pHX2F
         fh8UtKdf1dZg9dq5RztEBJL/1hxecUuhXbm8BFA4eY+4QK4LfrRiHvKa/TwPJuEXfchY
         cUmjdATvPR1M6UeziOULW8YprVae/6O+WEJY+JOn3U7kyATdRd5WLHKil4Zm516nQWvf
         zd2CPKAdIDFzh6NTwAVRDiJmm/eMyEOYjKw9WSCE0cC2KTjSMy616fKQA8qOb0tKJ9dv
         kLTg==
X-Gm-Message-State: AOJu0YzPJNn/UdUoPnBa7bAI2vRgKpRrpDtvswqGAecXzlILmJNzrwVu
	7UvH5e4+fgsXdPU2bxe5SvrBeLceTXTSX9cGyCqmBxvAtqrzYCtPAH2WKUSH7VF1TvgPtBoEVqp
	htpwsnQ==
X-Gm-Gg: ASbGncuFsg96Ejy2f/zWSwxtDONvTrxzrqKnp0sk7EtN4vesm5fvtjqC99ZnbUXHnhM
	HxaGIrJfTmQSx8K/W+cNqyGLuX1/urwl8DihPaqZWacpnvaL7qBYi4q/rqcAmQdtwuFlDYa5u7s
	6noFlz2+Ldwo1SUFDof3HWoiCPh5L1CXvg7h5AIGXsFis85HPj9dNpd3SyT28k5MXNTI7x3Rner
	RaYiEj+1EB99nqZrOsPY/rPMvTWysAWQ/Y2UYCgGU51StiB1zVlYdmCnzuVENRwcplXKWUsNkwj
	JIbiIduY+r2BIvjqDbJxZwp1cc+33FESO+3zSGHK2nuKiZ/bEMgDKUb9a3wXA+WxFSFiheE+DK7
	mvHyD5U0lNRTzaQ1tUjeafslEaSINVOMT8QAqEaQ4Hm6aRcffj2hhZLH5xYUmdwjS/sQxZA==
X-Google-Smtp-Source: AGHT+IHNkoboGHrMun5G1DUGWBcXZWuBWQV4A74ZxNJ1t1bghrprssY/hv3V1PDkdyjCOmCzxhKQPQ==
X-Received: by 2002:a05:600c:2d08:b0:45f:2e6d:c9ee with SMTP id 5b1f17b1804b1-45f320ea054mr964325e9.6.1758010565354;
        Tue, 16 Sep 2025 01:16:05 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372aea2sm217980535e9.7.2025.09.16.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 01:16:04 -0700 (PDT)
Date: Tue, 16 Sep 2025 08:16:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <aMkcwZpr84eMc4fF@google.com>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <aMfQCoLuVeR0nf02@google.com>
 <yq5a348n823t.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a348n823t.fsf@kernel.org>

On Tue, Sep 16, 2025 at 09:45:18AM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> > Hi Aneesh,
> >
> > On Mon, Jul 28, 2025 at 07:21:41PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Currently, we enforce the use of bounce buffers to ensure that memory
> >> accessed by non-secure devices is explicitly shared with the host [1].
> >> However, for secure devices, this approach must be avoided.
> >
> >
> > Sorry this might be a basic question, I just started looking into this.
> > I see that “force_dma_unencrypted” and “is_swiotlb_force_bounce” are only
> > used from DMA-direct, but it seems in your case it involves an IOMMU.
> > How does it influence bouncing in that case?
> >
> 
> With the current patchset, the guest does not have an assigned IOMMU (no
> Stage1 SMMU), so guest DMA operations use DMA-direct.
> 
> For non-secure devices:
>  - Streaming DMA uses swiotlb, which is a shared pool with the hypervisor.
>  - Non-streaming DMA uses DMA-direct, and the attributes of the allocated
>    memory are updated with dma_set_decrypted().
> 
> For secure devices, neither of these mechanisms is needed.

I see, thanks for the explanation!

Thanks,
Mostafa

> 
> -aneesh
