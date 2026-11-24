Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533445;
	b=YFvgg17NzLI/QSpOf0rbHt3iT834vr8IGZGgGEKfWuJo7NvP85nTnE/Yejyb41pGW5CI
	 fzGj42cxXgNeJzJbJQkPXZjGA2TzLX/Ucwts9Syl8GQzjBiTADSB17A08HxCN1B8xmbml
	 jLtKOZE2UKGkPPCSSt55UROzbVZuSwL1V6PpkqlyAVzEDA1Q8O4Atc97Dk4JTFSbvwspD
	 mN5I3fID0rJ4gmILiB/C2JT7UAQiLwXBCA5zMYH9hNqO78oZxSujK8Ya9vaWPny1+7sxP
	 PGz+Eo2eGOgRTRr10cjFCsxwiG62kJmgW0Y619uRo1YTtVR43iT2RaLiRcnaXy4MLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533445;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=IaacVAvKGyMmPecRhuxGdgf3LN883I8nJRoVmWEAC8U=;
	b=a0/XpVcWAkvTPrpH0/JmoUfVG8vSH3gPOeWdyzeMg0gzCZX9leCKQ9KMeSjQvZHb5pIu
	 OxY2oVnzt7kev/SjqG9b52lGEeYFsIZ2zhIAoD2pb80UsSDXfFHol12Py3SHCScHO3zl5
	 EDSsBMrnUQgDBmqTxwxl9OLclaw5W6pDSZ0me44E8tTxgqy5hUtmOh+eSqoTfjfiODQY1
	 xxXD3w7iJNaZcic3Y2nt4tHpVrrVi0aZqtuXOqBGRF5SO1goSxQGFiLFIv8ibn52Gw47e
	 Xrv7mXYRDHEM84XOHAML/ByN5lKQO8pK4idvh/rCfVFFf9O7GXPv+cq81pIhoxre5+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GmT5rvFJ;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FC606A329
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 15:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010FC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GmT5rvFJ
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124151722euoutp028d0f71328ee28084e40aa7f40b35eb69~rBCcJ_fJz3183831838euoutp02Z
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 15:17:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124151722euoutp028d0f71328ee28084e40aa7f40b35eb69~rBCcJ_fJz3183831838euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795533442;
	bh=IaacVAvKGyMmPecRhuxGdgf3LN883I8nJRoVmWEAC8U=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GmT5rvFJ//Q0xjTnt1azHynt9KgxevYNbRk42IQr4pPkhx7CjTpVxdqpnyZZ+tfbl
	 5lhLj+XQbwWkw6U/JcdvkoNY68kd0mOBRuPUDyQfIQlq0Ynjr1IhpH/2WMFmA6n57V
	 bji+G50yBzT5nKPlz3Rj5K/sfdNGaWpsBmwDAzic=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124151721eucas1p2767fd7a4a3036d2e7d11de472046c7e7~rBCb6IL8Y0751607516eucas1p2G;
	Tue, 24 Nov 2026 15:17:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124151720eusmtip10daeaa7910796136f5c7ea55a3ba4bd9~rBCagtcn-0894308943eusmtip1z;
	Tue, 24 Nov 2026 15:17:20 +0000 (GMT)
Message-ID: <42415609-c784-45d4-a79d-ef3cc5e6c3ef@samsung.com>
Date: Tue, 24 Nov 2026 16:17:20 +0100
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] swiotlb: clear read bounce buffers on confidential
 guests
To: Shukai Ni <shukai.ni@kuleuven.be>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Halil Pasic <pasic@linux.ibm.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, Elena Reshetova <elena.reshetova@intel.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>, linux-coco@lists.linux.dev,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>, Jason Gunthorpe <jgg@ziepe.ca>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261123205302.1034348-1-shukai.ni@kuleuven.be>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261124151721eucas1p2767fd7a4a3036d2e7d11de472046c7e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261123205317eucas1p2f96032281e0f5e9f17acc7ec343acced
X-EPHeader: CA
X-CMS-RootMailID: 20261123205317eucas1p2f96032281e0f5e9f17acc7ec343acced
References: <CGME20261123205317eucas1p2f96032281e0f5e9f17acc7ec343acced@eucas1p2.samsung.com>
	<20261123205302.1034348-1-shukai.ni@kuleuven.be>

Hi!

CCed Jason and Aneesh.

On 23.11.2026 21:53, Shukai Ni wrote:
> On confidential guests (AMD SEV, Intel TDX) all device DMA is bounced
> through swiotlb, whose pool is shared with and readable by the untrusted
> host. swiotlb_tbl_map_single() copies the destination buffer's current
> contents into the bounce buffer at map time even for DMA_FROM_DEVICE. For
> a reused read buffer that still holds private data, the host can read
> that data from the bounce buffer before the device overwrites it.
>
> For DMA_FROM_DEVICE into a host-shared pool, zero the bounce buffer
> instead. Zeroing rather than skipping the copy keeps a short read from
> returning a previous transfer's data.
>
> Fixes: ddbd89deb7d3 ("swiotlb: fix info leak with DMA_FROM_DEVICE")
> Cc: stable@vger.kernel.org
> Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>


I'm not sure if DMA-mapping or SWIOTLB is the right place for such fixups.

Drivers should be aware that doing DMA from unsecure device to the given
secure page might reveal its content to the host or other parties and
prepare for that (like zeroing that page).

> ---
>
> Notes:
>     We are open to discussing a different approach: e.g. clearing the
>     residual when read back, scrubbing slots on free, or extending zeroing
>     for bidirectional DMA.
>
>  drivers/iommu/dma-iommu.c | 3 ++-
>  kernel/dma/swiotlb.c      | 7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 78742aeba..42e0bfced 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1187,7 +1187,8 @@ static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
>  	 * Untrusted devices should not see padding areas with random leftover
>  	 * kernel data, so zero the pre- and post-padding.
>  	 * swiotlb_tbl_map_single() has initialized the bounce buffer proper to
> -	 * the contents of the original memory buffer.
> +	 * the contents of the original memory buffer, or to zero for a read on
> +	 * a confidential guest.
>  	 */
>  	if (phys != (phys_addr_t)DMA_MAPPING_ERROR && dev_is_untrusted(dev)) {
>  		size_t start, virt = (size_t)phys_to_virt(phys);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 786954bc5..351bc7c54 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1630,8 +1630,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	 * the original data, even if it's garbage, is necessary to match
>  	 * hardware behavior.  Use of swiotlb is supposed to be transparent,
>  	 * i.e. swiotlb must not corrupt memory by clobbering unwritten bytes.
> +	 * Exception: on a confidential guest the bounce buffer is host-shared,
> +	 * so for a read zero it before sharing.
>  	 */
> -	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE, pool);
> +	if (dir == DMA_FROM_DEVICE && mem->cc_shared)
> +		memset(pool->vaddr + tlb_addr - pool->start, 0, mapping_size);
> +	else
> +		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE, pool);
>  	return tlb_addr;
>  }
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

