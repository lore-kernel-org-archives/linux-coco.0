Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B244B67D
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031924; cv=none; b=j/Fr0XAu7F6ACAdMEfFRmO4BKLeFFNxxF+7bcwv6dli83tWT9uVPUR3UElM1jbvd3LkGFVSu14/w6VoskCB14TYuSv0dVT6mT7WDwccDqQfIu5B00qf4cuAOxQ2h58HEK7TpFBa77j9tw2O2u2KpHLM0ZId1NLx2TH7ZpM3mn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031924; c=relaxed/simple;
	bh=k2xYiw7NCZIf6MiSTVQXcck+1c/iJ0/CPBcm116ZP7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5ZE3tC0Tly0qbE9aA3TYqWrNgYJcjs4fwZ3IsTAIjvLp2bMspDwF8TtdBSagAI++N30OUnmKMB3A4fOHsf9VoXReKyMJTTBxm0NGcMGcrwHNhyysMLdmi+/w2PlueG4FBmd8oBgJ4u/7wE+wnHKUj/USv64OPc5EMzO+bU3c8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RPxCF811; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RPxCF811"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9217d13c276so269195685a.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031906; x=1784636706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NW2Ta6E1fh/Eyc2M2Ag3HwLKZzUCdETSNuP1MsMtNOc=;
        b=RPxCF811BeB8RmpTWJJ8JWfSCCAj7vqBg159GoRnls+fnOZbxrIU2EOy3I7/moSzYr
         F6+VDrUBDceMdtpc/0FbKe/xOGs1Lts0dnTo+choKsvjZBewTr1FD/axNmTQ9wv5ccqC
         YFx1V5lGF4ToGkxB75VJhtW1i6vypMq8n59rNsmM4rz8iHNhcobDRIBW9rskhsYawl3Z
         HNlumIdxtNPtZGpIoL5Ayom4IwmR6AgKvNkOTZ1ICxcg9jBLWKmV3oni6EKEhJkWP9Rt
         wAXaEOIisR1Nt7LP7FkKWBg9B76OhD2DHvA47elzoUdgVeVLZnwg/j34N7dXwSeE+LOp
         Lhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031906; x=1784636706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NW2Ta6E1fh/Eyc2M2Ag3HwLKZzUCdETSNuP1MsMtNOc=;
        b=cAPR8XJP6CcTYuTDteow7m1YRKp4p5T3GKCg/oubG+V73LqIlSaNuEwbq2kQFeSABT
         0ZlgfJRSrZRRSB5OABXBDZnQUbiVcs/KiGlYLVEmrXA5dLhtyFmeCN1DsXviQ6mBCsYS
         d5B48TlrMzTlPvzhNREB9xO2LFQ2rBL200SGbrOvO8AqMaxUSL4t7dXldPBcGRUzHq2d
         oRRLLEo5W5YjP2CgqArDWqJsnqNQ0OL6k+PXd2uyPRI5MuafaCiyPMj/BJwv/HnI3V/n
         0X/iAf7fQrQPFIOrGSVg7LLPV4hUNVxSLaRMq5tPYgazee/MYmFXV4UKXxyN6u22OkcP
         jaZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjmxN+VI+CBgHiXOYgd1vEM+eqJp45hUfem+70NP6kKyVolTmvk/7440AdKvVrWDFjV8FZvsWqY6Hf@lists.linux.dev
X-Gm-Message-State: AOJu0YzJWdD/OAbXPbtxxFtj3J19mFucuB+gqTunE9ejxaJPK6OOyfu1
	vKCa/nm3lZQ6PefkLECG/0rBTQ3EurxrLWt/DaR/64apYx7kqD6hsMHEZrRLQPIT90Q=
X-Gm-Gg: AfdE7cnEEFFXFxuiENR0l/qTMx/Gfc5vSEdRF0VyRHyaZk96iivJDHhgCDv4HroXBW+
	buoO9HvFiZjc77RD+Umg/2F/bx57vxv6RmI62tw/HdIfubbCpzFiRnPB4UcSoFhWAxWCO2Y2sVM
	CYgTrEexlp/UgctLlvIIsGL3eAzto83Pc/67XZxDVgu1aweccbPXqysSidRWQa9VkGDMnZVdwTu
	F8ybIO/cmAIIXs9CncSkL1BoRceNjRKgd17bDCGJ7S/VvtdSddiBykJ0kgiZ0b4fZzdACCMIbp1
	rpfjJC4J1hgNUThMCjVj/AS2CppFIwdzWxXzQv+XR/T/S2/TawFA2cfrfcR2EldglGhukq2e209
	pzpCDWOfBsl7/Yi/GI8iCCEjTo4WwVEX0dp2J56fhxXKjLHGfWMqA/iPlEPhA1jBhfgil9lo=
X-Received: by 2002:a05:620a:261b:b0:92e:c118:18d9 with SMTP id af79cd13be357-93083dc8f4fmr281429185a.80.1784031906057;
        Tue, 14 Jul 2026 05:25:06 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4a0a6sm1474337885a.8.2026.07.14.05.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:25:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcC8-0000000FRl8-3aT6;
	Tue, 14 Jul 2026 09:25:04 -0300
Date: Tue, 14 Jul 2026 09:25:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260714122504.GG3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
 <20260713175616.GJ3133966@ziepe.ca>
 <yq5atsq2md64.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsq2md64.fsf@kernel.org>

On Tue, Jul 14, 2026 at 09:32:27AM +0530, Aneesh Kumar K.V wrote:

> If we want to warn about such failures, we should add the warning
> consistently across the code. We may also want to handle decrypt
> failures by encrypting the page again to avoid leaking it.
> 
> I will work on that as a tree-wide change in a separate patch.

IMHO the WARN should be inside set_memory_encrypted(), and maybe it
should be a BUG_ON...

"free" functions shouldn't fail, and returning the memory back to
normal is a "free" operation.

Jason
