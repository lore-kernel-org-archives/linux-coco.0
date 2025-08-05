Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AA289817
	for <linux-coco@lists.linux.dev>; Tue,  5 Aug 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754409272; cv=none; b=dQKGx70dgCFTy80N1GbqeSglLCjts/D7WaF0ecMSZ44KGLsywCbqmoHAT2esRR01OuGjaxjbRxf/zilCvWUDr5P9dsQgj9CJsNczfKt/8CcyVBqDtd0z+YPKVEyZeutP6KcityAwpIYvuO/VoF6HWxlGhetVMlZecESdMXf8Kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754409272; c=relaxed/simple;
	bh=/OzaxpwEfK7AcyjcWdiVUrxbZQFVcmCDmajtf4oAfG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+KBZTsbS1gdNHQ9FmaEqmovwIVH3hCTgac0CvO0JBiUmPlREbqSsmR6S6KJgicO9YxOSPQAjKe85qZh3leI0R3g3DgdmTkRUR+4G8p/b63PlhvHgHcNvnTKyKKQo/bLuVChfVXV8GUjQcXFGz5A4r91o4LhPygvq9mmGiG3bx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n88r/LTx; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n88r/LTx"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70749d4c598so51068376d6.0
        for <linux-coco@lists.linux.dev>; Tue, 05 Aug 2025 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754409270; x=1755014070; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmi6Xyv0QvJ7lU7CctnLT4GD6xbprG8jnHy2E/XWXdI=;
        b=n88r/LTxe5C8X9QFP7inFHWtfonuCqGH0HPg4PcRJBFW/nlu9FIjSRed8ix/kG+Faz
         BDgjTxyQl0GnviBUa4dG4y3wdwgaViLs9ejq4YHViRSe3TF64LUe7fW+hU72TQE0lMbn
         DOO911/+ys5oVgVbbbDGfQlJ2s2zRfS1llmXTApFmhzjEFsAZ98I3+UW/LwBkg9FpNlr
         P7DvnkO54hPmzP4Cc6K34nVEC3p8Rk2IG1aCtbUdfwKhEaxUYFOv15SFbE1ggFEPiP0B
         ykXzgw7gJ7AwMgzVt7jMZuq/JH+dPU1kRSYfunUGCZx21CfwWpcwyGGutuBc2FvbRbP8
         qUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754409270; x=1755014070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmi6Xyv0QvJ7lU7CctnLT4GD6xbprG8jnHy2E/XWXdI=;
        b=of8AR1Dqw2onF26HHLtHEdqafdWii78YaNG2fh8K7G7kLlqnxdsBDxv/tBQcHaffbA
         JZ1bUf1fP95I/J4jZcXf1Iu1SDjTSSc2h0qszs3Hsasw6ZpCRzugeV8JciNlnx8QyyNn
         yFpqWsBgnjBLqatZtrVR9xxoeVqhSQWfcp3T6AdW5jL70AhOwz7K+i9h/PEFEgBMPnvU
         OU04CljRh9XdREzWPO3FSytnW2+1XJxeYKEFvAfLO1ytR0NmtEiQGbFrh9Mw56IzThGn
         Wyj84hS0n+c3sa95tW6z2R0Q9HsHDVXA8AqVu4V/J2lSzoVBklfUODUA4FktYJOBgpbF
         uJOA==
X-Gm-Message-State: AOJu0YyKy3x/UiqD9VDpQcFFDBGtfeVbuTzF6GucPvsbKWd7D2AoycO0
	o+DWHMvTaaowfLtKaCHS6U5RrWDceLIZK1vy23XSQ7gOp1+jFJkZwQDWjRodyo2kTq8=
X-Gm-Gg: ASbGncsPWT4CVYCCNUyWfdF1GppE2I178u4BS1EX0sgdkJDc86D/QyOjVhElQahRemZ
	jQJrKiE5BwK9Od0itLcrHWnhvviugW2bOkb64Mg16dRFPx0Ise4oIY//lXI4kON/zcu0GjKS8ce
	OlBLj9hDPuAo6SC4Eq0TZRpPrt5b/YrLPAvSWorNFZXhbGgp81mnNRaYMkWX+jcszYoVRYQjK25
	v6hkrXm+vzZim5shcILeFwHcWLbyYFkrzWsCyLx95rFM2cFMtAiQpfJsH38n2mdVbP5BpsljMSX
	QcjOIn7RjziKwIV2mIrQWLjF+k1QwMwYGLZEhDvJeffE4F6YWWunUzF6xIJYzZyuA8CVYdiDw6j
	rIQKH1YHQTPH+4vlgSsTGucSvlVymsJV5vpWdgiXMDgQXduMoYee/AZnRSXdJvZiv65zU
X-Google-Smtp-Source: AGHT+IEbopEuDV++hnxNrBy6jE94j7fNSg5OYfawZGMmOOqA+BK3PuMzmdEKgi6bq4gnWI1YvySFkw==
X-Received: by 2002:a05:6214:2a4c:b0:707:635f:67c3 with SMTP id 6a1803df08f44-70935f79001mr202676776d6.14.1754409269871;
        Tue, 05 Aug 2025 08:54:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ce37c01sm73097906d6.79.2025.08.05.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:54:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujJzg-00000001YhL-3W2I;
	Tue, 05 Aug 2025 12:54:28 -0300
Date: Tue, 5 Aug 2025 12:54:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <20250805155428.GU26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <20250728143318.GD26511@ziepe.ca>
 <yq5a5xfbbe35.fsf@kernel.org>
 <20250729143339.GH26511@ziepe.ca>
 <yq5aikj69kpn.fsf@kernel.org>
 <20250802134154.GI26511@ziepe.ca>
 <yq5aldnz8teu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5aldnz8teu.fsf@kernel.org>

On Mon, Aug 04, 2025 at 12:28:33PM +0530, Aneesh Kumar K.V wrote:
> Note that we don’t update the phys_addr_t to set the top
> bit. For reference:
> 
> 	tlb_addr = slot_addr(pool->start, index) + offset;

This seems unfortunate.

So you end up with the private IPA space having shared pages in it,
so *sometimes* you have to force the unencrypted bit?

Seems to me we should insist the phys_addr is cannonised before
reaching the dma API. Ie that the swiotlb/etc code will set the right
IPA bit.

Jason
