Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CA3D9DA7
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386065; cv=none; b=JpdcbKOUNNJJT8+kQHCLYJdba/Z9Uv5Hu82Dun4Z2q9VkbBD4suyttFP9ayxVPIr7w3uxkitLi+DVf6CI9vRtkkk/keYiNTNAoXuWRM9z+UdlWXK1Ao3yadxmf/d1U6NNqDH2trWQI2Z1S0LWBEb59lHpCnhqmyjqBst60B6+Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386065; c=relaxed/simple;
	bh=n2LNy9P3hRcmCt1g1+q+u9azF2YECAgiA8jjB7pwYI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RueCbOJaQ9hEzajtXhal2/S3ZlEFzyClVCyHqOR6nezHwYEvlShj/DFpzdkHP2ffoP2zQyCOOzWCNBmxuXcvPZG+E4v7MaH5OSAD1cO3gA0L8HQ7y0qlvs3Vn0ZN9eBJPdmlUI1A8lcMU8bkYl9esBHRsDsjcC8K5OtQIu8AK8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JXEAhYbu; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JXEAhYbu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so72053726d6.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779386062; x=1779990862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EC6XWlOYSm7qj75HyHmp0T60BsFS50VL7KHJNUynWLU=;
        b=JXEAhYbubz/ewGL84eH8GYoCP4VKdI84HbLX7b8Y7DQRkYtdPS4bOHx0/to0i4prbr
         XChLmJd6tIX/Hfd65sATcqA1jcPiVUE8TWYXrVeZs1DB90D1g2btH2tQDuIfvzp4cY1m
         JnKE/NlTXOdf8bl97/AS+F5gn6mNff2nToaRXdUwitsSvHeoXKeiLt4grRqXcjcbJQf/
         ulfSUdyEMZUjdmPVdmv83jbf31/kkmd9vjFpnLanaoC6U12jhoIa6y+rPnsYC/qXw3kI
         DXRx6mFF+/6S/GlTOtewncG93TIRum1NrvT2dfK3Nj+F633iYCAGLUO7ktiNK2a4o1uM
         p8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386062; x=1779990862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC6XWlOYSm7qj75HyHmp0T60BsFS50VL7KHJNUynWLU=;
        b=csc1cY1M//BvmeJgfk05J6PmO0Fo1vlPCScpk8+pvvEx6dplN/nlI0OQGGWH+JLk2u
         bicfyp7dO7BTTx1Z8yJdPDHZ+p7a6/EkHKdRZEdOOGhWrDTHMK70PN32Fl/4RXR0VSlt
         W2kqO/RablyYax3Rx7U+Qd1G//sH0278ucweU1U+I8jPkB31TV8AsvIqTp8owYIw5g0f
         /JJessV2qESbAklUAmaNsvNVrPPB7CmlwF9JlBLznkfQgjUCOhEsla0xdT+vzS0+lNoj
         RGp90N6LML3HyK6TA8x+NLo7fxfrj93iD18TQsB+YFMUY3umQlwypiM4qbLc/9x0/hUU
         L18Q==
X-Forwarded-Encrypted: i=1; AFNElJ9NxGrzjCZ/BAX/qlmUMYj9XTvYnEjPchlTkK7Odp8XgxiwlEB279ghvw/A1/cQK4hCNFoKZufA/efO@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8mXvM9JJImpCcMY4g1tVb1cIXem0M9kHd8YG4nVIULsJO0b7N
	qQF5rYSlgSpVNF+LUFYQZ2iu0nXshp5Pci3wlWK3JL5oxVja9bQJjr2oxwu37ENXZ9s=
X-Gm-Gg: Acq92OG+Pvbsz21A+WSDYDLH7MxRivUNh/9B1zCH6Z9Pfd62+HQWPIk5IBs3ovnZnFI
	aH1bAIkr+wytmsKtRSyBYcDVUsfnLa3dSKR6RG21KNweXYgHOOwwqi8QAoM+jV0/bS2UO9rR20J
	3cuebb8NJ8dZLL4wKiPFhUqCueO68p20jgaEiDCwGM++AZNlk3DkJiH7w0NRZvANjDowkVrK9W/
	BmnIb/FLhkxOTTuD7HV2l3FzqFVcO7whBz6rtHfMLF6nOqJvuu15v0SOjvZWBfjhA984ORbzf9i
	Crszd6mFtJ3zxbvTosqnZYURAYehaH3vFWdmVs7z094yWVypIrU+CrDcjDplPUk/2t5OkeMMhkY
	BxSFE+9LfNqYHVXe1JjLT+lKzJkc139Rw6fpCq9c8W7RmB9TDUOnho4uBnt21KgLuFlGjsFRrjY
	YAOMetn8AbRbz+2HALVOaWjqDEU/lunLHt8hh+wbtYFpw4WQ6n8+WXXaUJ+DKQG3q0g3N3eYPLG
	CBzMA==
X-Received: by 2002:a05:6214:1c4e:b0:8ca:1e71:c5fb with SMTP id 6a1803df08f44-8cc6e91f389mr49249796d6.7.1779386061667;
        Thu, 21 May 2026 10:54:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc768b6fc2sm11374296d6.6.2026.05.21.10.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:54:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wQ7bA-000000020Ak-1yKK;
	Thu, 21 May 2026 14:54:20 -0300
Date: Thu, 21 May 2026 14:54:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260521175420.GA7702@ziepe.ca>
References: <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
 <20260426130531.GF804026@ziepe.ca>
 <yq5azf1s6aic.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5azf1s6aic.fsf@kernel.org>

On Thu, May 21, 2026 at 09:05:39PM +0530, Aneesh Kumar K.V wrote:
> I am wondering whether this is better
> 
> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> 		unsigned long attrs, bool flush)
> {
> 	dma_addr_t dma_addr;
> 
> 	/*
> 	 * For a device requiring unencrypted DMA, MMIO memory is treated
> 	 * as shared.
> 	 */
> 	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> 		attrs |= DMA_ATTR_CC_SHARED;

It is an option, I would be happier if we went and fixed the few
callers to properly pass the shared. CC did this with the
pgprot_decrypted() stuff, same reasoning:

diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
index bfdb9ed7074116..e77f6404caa3db 100644
--- a/block/blk-mq-dma.c
+++ b/block/blk-mq-dma.c
@@ -90,7 +90,7 @@ static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
 	unsigned int attrs = 0;
 
 	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= iter->p2pdma.mem->dma_mapping_flags;
 
 	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
 			rq_dma_dir(req), attrs);
@@ -115,7 +115,7 @@ static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
 	iter->len = dma_iova_size(state);
 
 	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= iter->p2pdma.mem->dma_mapping_flags;
 
 	do {
 		error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a34..96022fadc48245 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -147,7 +147,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 			ret = dma_iova_link(attach->dev, dma->state,
 					    phys_vec[i].paddr, 0,
 					    phys_vec[i].len, dir,
-					    DMA_ATTR_MMIO);
+					    provider->dma_mapping_flags);
 			if (ret)
 				goto err_unmap_dma;
 
@@ -155,7 +155,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 		} else {
 			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
 					    phys_vec[i].len, dir,
-					    DMA_ATTR_MMIO);
+					    provider->dma_mapping_flags);
 			ret = dma_mapping_error(attach->dev, addr);
 			if (ret)
 				goto err_unmap_dma;
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 7c898542af8d5e..e4229b4d35c767 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -282,6 +282,8 @@ int pcim_p2pdma_init(struct pci_dev *pdev)
 			continue;
 
 		p2p->mem[i].owner = &pdev->dev;
+		p2p->mem[i].dma_mapping_flags =
+			DMA_ATTR_MMIO | DMA_ATTR_CC_SHARED;
 		p2p->mem[i].bus_offset =
 			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
 	}
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 873de20a224759..402dc5e5d62b0a 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -21,10 +21,12 @@ struct scatterlist;
  *
  * A p2pdma provider is a range of MMIO address space available to the CPU.
  * @owner: Device to which this provider belongs.
+ * @dma_mapping_flags: DMA attributes to use for host bridge mappings.
  * @bus_offset: Bus offset for p2p communication.
  */
 struct p2pdma_provider {
 	struct device *owner;
+	unsigned long dma_mapping_flags;
 	u64 bus_offset;
 };
 
diff --git a/mm/hmm.c b/mm/hmm.c
index 5955f2f0c83db1..c3f445acddf873 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -811,7 +811,7 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
 	case PCI_P2PDMA_MAP_NONE:
 		break;
 	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= p2pdma_state->mem->dma_mapping_flags;
 		pfns[idx] |= HMM_PFN_P2PDMA;
 		break;
 	case PCI_P2PDMA_MAP_BUS_ADDR:
