Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF8356777
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970794; cv=none; b=I5Rc8SJCfyoSPT4KV5DpQyNWZh3lZIX35sGhXDCw0AWtPu2TYauISSZN/3lgGflOGbCG6qRhJBbJmHMbHgl8gAxeBy5y3Gu9ltwG2/nQmFUMcgz+mXtCWNm8bjoSzBwLqrR0cvr2VE69bCc1VohZcPHJKC93WsUnhm0YD6YUSKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970794; c=relaxed/simple;
	bh=3hYUesku0XYcq9M5Lzu0X2CUae3t5wbu+UMwDadhKgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHqytL6VZm7rTHpsYJ3oR4EwWEMvPoQJ7j04X3mD9WZj+u7WeC9PlU+CjJGuzpeT7ZAgNCaRMZOfY7VlkXga+wDR/KzcoAAdHhsv1+BPFCn57arZ7tAIIyoeJouGqb1bapmWwveQZMMVj/JfrailxY3+eAl63yEHo7mMc2fKjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JWnKTSE7; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JWnKTSE7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c928bf172so23035881cf.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970792; x=1784575592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcYJlt5p9Qz8AXWYIObijachKEBwhFuSBSepR8dnD2g=;
        b=JWnKTSE7DB8AHjuAXeih+cIuR8qsMqkYMAgVfRrNeRkNESVlUeF0r4ainVvGLgOMRt
         dBVEQS7saQRDzOmPJGporsgoLuc24NokaPuNfKxCxTqJqjEgCr1YdyLGn1PErR0i5NHN
         Vz5FNycVW6by0Y3k3OMc7I8fA8zJURefH9nxbDf5q2y+iRO1YCEwP1gepHBc1SswHT6u
         gt3yHY9mmRrGSQ2IVZR1xOb5Snp5AXR29UOOlh3Po/qpMPkNgFFTyBe0PdE19u5INd82
         sqL2BPmY6tGSuSHXdwK01vbC8krjjUevZzJQasFrh7jfxJPXAzs9kEKH9qqeBNB3hxwT
         T/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970792; x=1784575592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcYJlt5p9Qz8AXWYIObijachKEBwhFuSBSepR8dnD2g=;
        b=Jlnu81SZFt4DcawdVboKUVdhTP1RazwMEfHxZkkCAS/2rPp1YOx+1E2FKYY/7IcuMs
         uxY6Wg79vU3zMqmZRC913D23wBXmWqDYvVf3i92q24953BsC++448SJ1M8q3Q7zmuiR4
         LzvY1KVfVHunSUcB3YIhK7EvIpGjMtgt8TzrEELgGbP2rFKXs9sygLb8PghNaLB+sb9q
         PDkyHuCk8E4sSPDJRrF0vESKwHXrfgxNqIjWAu3vOK1MwlkL8FkTfek85r7MEzJ5th3S
         wEhhUPsl1FQoT6YlSIKnfF9t5Cr1pZ+r8Mnjub8lZEM3ixF05Q3v8cvVZDkLwo19dONG
         3g5g==
X-Forwarded-Encrypted: i=1; AHgh+Rqrw4q0Bu2VCFH7PWVilvTBlaSLf6XfePKNxrPsX7vcWQUym7SbmbB9R3MBP2ASbKMbOTCiCGijeBEE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8cWNw3nMAI4cHcvoCMbWnH8fk7xSzUlzjHdLZUpfIiw5YzxDd
	H47N6/K+X5hJg09Aetu9cgcE1CI+b1xNEi5LwvLtyQ3CCOROpcrhGTNOJ6XCowgou/M=
X-Gm-Gg: AfdE7cnIT5tZumqqS322Y0ligHSRxkGH/neffDj0VvCUuU/lqE0e6wHMa3A0Ibi5RIs
	JCoozarTE9LkFNperOJmWMsig81dt+1VYx3oMcDcUzGYWgWo9+yN40uxHepbIAXCmwk+N2bY3l8
	BKgv3h/TY9Bj2SfINPoXms6xO9C59DnpTwGX/RTlvZg+z82J1klttQF8t1DvBQxFq5HuLa7M5k9
	YnDZn69kiTB4XdD1nVwwfH8UF46l2KgnQdj7hemGbyzk5o5H1zeN/zPIt5GI+OAv4aLCQ4pk4mL
	vFOMrtPVGfetbXsroZLovtnmv3rfJQdqHpTAtyIHZ6CMqKGBG7b1EkM/6cQrvdiv8lm70phpau6
	piy367OIo583b1aSdqw6C84uygZRwW+EneLdrOxPfIZ7K6lBZCKqxpABALXvV0R1ZWSbsMbo=
X-Received: by 2002:ac8:5906:0:b0:51c:83ee:e430 with SMTP id d75a77b69052e-51cbf27d077mr95594101cf.75.1783970792197;
        Mon, 13 Jul 2026 12:26:32 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51cbd8efab4sm70831241cf.1.2026.07.13.12.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:26:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMIR-0000000E5Pw-0MTy;
	Mon, 13 Jul 2026 16:26:31 -0300
Date: Mon, 13 Jul 2026 16:26:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v7 14/22] dma-mapping: make dma_pgprot() honor
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <20260713192631.GT3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-15-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-15-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:18AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Fold encrypted/decrypted pgprot selection into dma_pgprot() so callers
> do not need to adjust the page protection separately.
> 
> Update dma_pgprot() to apply pgprot_decrypted() when DMA_ATTR_CC_SHARED or
> __DMA_ATTR_ALLOC_CC_SHARED is set and pgprot_encrypted() otherwise Convert
> the dma-direct mmap paths to pass DMA_ATTR_CC_SHARED instead of open-coding
> force_dma_unencrypted() handling around dma_pgprot().
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c  |  8 +++-----
>  kernel/dma/mapping.c | 16 ++++++++++++----
>  2 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
