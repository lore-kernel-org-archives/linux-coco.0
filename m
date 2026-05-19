Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78D3769F9
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202185; cv=none; b=EdQgFZ67OngcIGGooygVcPDtrMnzHPTkmwraZC/QeAsUW/lNFRFxa4KwkrTSzpAiLwUS3qxw4Bo90zxQlGiCZJFBLUfpzJg5mM3hDY9NIF5hq3CFmEc2Yx4fcsbXh1G/7YfzSqJNKfYJUVnY7T2LLoPqKS7t4R9uj84jJ1S5vdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202185; c=relaxed/simple;
	bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5Z8JYOsv6DuWZdqui3TdFuxW1K8JPtO/PoKpDWFsLhgrxSgNQtEWTKn4tAjJ1T+6G+JdnUoJjViLJUqOavGpnQqB3Ftt42qjrpXJnYutCQRwdzOkcLGQrjrPfoQJJTAY7hUfj9bOZbTNUGZdsNwTM7QNgb4NB/+TXEb1mdBjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JWo1lpzw; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JWo1lpzw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-90cbb2b50ccso286933485a.0
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779202183; x=1779806983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=;
        b=JWo1lpzwiYCVHyZ0UvWbT29Jd75eQ1vERIvj7BXnyQInTT9Ulw/kEPsXvN+ngtRrNf
         CnOZ5jenWwwTt9Dj7HDJjfwasL0haFfnVeb60t1D8EdU8qM6abc/tVFQb4n+HsHpEqKh
         7era4BBDZdMFB4AT01RYMDnm7yLOszWD0wgwuflfqPUUb5hq7l7HoyXWBF8L1Yw9saU1
         zHzdl9rKzTggG8TEPmLcaSPhsfz6IZGMDze3wOO/03COGTulNB8QAW+GZJRIUIS3QAD2
         mq/Po3hqTHBP5GMNYlqZw9SPfa56D3wG59prR7bFMKHLyuhlYt3aYp+J+ILyQiFNhjwu
         B95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202183; x=1779806983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=;
        b=OxmfE+yDlLP1pG9+RcIO8ybfBcJ8peEZchoQXUbfXLZoy/8DmI6IfsqSWqH9Z0M/8x
         5VJTSVD3joghuly3DHMFw/07gh/pvTTSxcPKIZUBleTJ4QQiZIpmWasnEOX2Fc35iSnX
         7XdHr9ybAkFJ92i2YJBYC9BRg94q4NkUGQzk1ffuxCyMecGrmpbwLUC5/O5So624uVuz
         edXZCy90PSioWQ3wpdqxtwh2NhudkjUjOrcKy+TMTcsbnFIDE9ywtkkZKD+QI3Rey7Yv
         +u9/RpgXsfEl663ZcJRWqcH5+7A4yrrY2qI0CL+j0Zs8yOy0LWyhwSy68/TVyB83kJmw
         xzEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+StlyM8yhGBN8mlCVTiP7FgaZnGMy/JCK00al56ezHuYfmuFtcHqqonQk/aP0Up6pekbAgsdU89ZK5@lists.linux.dev
X-Gm-Message-State: AOJu0YxDtpB+ef7ayexlvYOSImO3CeaDB4McGdu0QsAmpJeBvp2TzugJ
	i9NV80OiCuNF5XktT3ds/SWI6uW+osw7uZ3RvZgKGI47oI79S0efrWmkGzq8KcDRVrtenFzPIst
	pBDGX
X-Gm-Gg: Acq92OG8i8ipGTXFutO7SycWF1Bm8Lkaovrn4h1CALeTNV5LhL4foxr6fwqx4jpiRxo
	7IoHmnS2yWpFAbUCDYoNAIk8F+c+du9k0eqncc7ZIp+DLXNHdUy0BEbdv/c6GEUIi00zLJuc/7Z
	LZTBLlbJk2MkLfa1ZNHnoXy7j3NfraL9qysV1TFfH/U626w4jh7fHfdzaVBBB2y2nirdXF7KlYr
	gsMxVCZUjmBxhnItahLw0BL3dQq5HO69RMnLAkFLKdyj7rnjsm9NuhXuOSMcDzX4EABJJZEE66Q
	Wv4YxnNn7ruoDe2U53b430Cj8cCflB7pPEFl95hQAWQsYYe5FHHPsVmTu/dOFOfDqzMI/SrC9rd
	QwYN9wuU0Fd1qtpTzQXcoSFTl+/NM6pGZELbUn8tOepGH9xrI3bt3c1k4cIAIWeLVEWtVd558hh
	kEjwcQzRJfPKMEgqAAnOn+gz4Nhdp/vVQpq/+ACYGx1rjaA4yN6qeQpK86MzXHuEB+FM8I0Py6x
	3tnng==
X-Received: by 2002:a05:620a:1a14:b0:911:411e:2e4b with SMTP id af79cd13be357-911cd46df94mr3109274985a.23.1779202183344;
        Tue, 19 May 2026 07:49:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e68csm1851459085a.10.2026.05.19.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:49:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLlO-0000000F92G-1VL1;
	Tue, 19 May 2026 11:49:42 -0300
Date: Tue, 19 May 2026 11:49:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
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
Message-ID: <20260519144942.GJ7702@ziepe.ca>
References: <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <20260519143529.GD7702@ziepe.ca>
 <agx3j6Oc8QivZ3RG@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agx3j6Oc8QivZ3RG@google.com>

On Tue, May 19, 2026 at 02:45:35PM +0000, Mostafa Saleh wrote:
> However, it should not alway use SWIOTLB? It can trigger decryption for
> any memory returned from __dma_direct_alloc_pages() which can come
> from alloc_pages_node().

The alloc coherent flow is seperate and different, these are not pages
'passed into the DMA API' but pages fully allocated internally and
owned by it.

Yes, it should cause decrypted *allocation*.

Jason
