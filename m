Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997E2F47
	for <linux-coco@lists.linux.dev>; Sat, 28 Jan 2023 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bU5gUwsThNIQrMDCEBdhvtVUOL/JSp67mzVg+s9HoyM=; b=LqTh7GK0HzuF/jTsWDZ5ej3mOA
	G+VK0jKfAAt9Ossxga6Zvg18dCdkRiNBnzWPNc73ufZHEDbd7/fo6iHojv1nadOw6tS2NeNoEeKnl
	UrlUSMYcr1C/RluABATSX+gIfFcyDsePEQaslXEp9FWHq4LA81bQV+QqDMCeNkROB0/Q8Tz1js3BG
	uFZhsj1E+w/7/AOXNOy3la2D1aEkDrSf5FsEhqpZGocrqQ/WwXwsl8n8jiMYOHBXPq2GBjXYffDqq
	gzrc7jQd0aBR6pMcHhQCg2dr7wl+G4ZcLrTwitpa10y5FqPT6QUtJdhOk1E0UkJpKdjFZYqvmqETz
	CNoaN9SA==;
Received: from [2601:1c2:d00:6a60::9526]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLoGr-000Q5j-JO; Sat, 28 Jan 2023 16:41:41 +0000
Message-ID: <c966018b-95f0-7b92-0a5a-9023236b0dfb@infradead.org>
Date: Sat, 28 Jan 2023 08:41:38 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] swiotlb: Add a new cc-swiotlb implementation for
 Confidential VMs
Content-Language: en-US
To: "GuoRui.Yu" <GuoRui.Yu@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com,
 linux-coco@lists.linux.dev
Cc: robin.murphy@arm.com
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
 <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230128083254.86012-3-GuoRui.Yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 1/28/23 00:32, GuoRui.Yu wrote:
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 56866aaa2ae1..7e6b20d2091f 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -78,8 +78,18 @@ config ARCH_HAS_FORCE_DMA_UNENCRYPTED
>  
>  config SWIOTLB
>  	bool
> +	depends on !CC_SWIOTLB
>  	select NEED_DMA_MAP_STATE
>  
> +config CC_SWIOTLB
> +	bool "Enable cc-swiotlb for Confidential VMs"
> +	default n
> +	select NEED_DMA_MAP_STATE
> +	help
> +	  This enables a cc-swiotlb implementation for Confidential VMs,
> +	  which allows allocating the SWIOTLB buffer allocation on runtime.

Two "allocat..." words seems to be redundant. Probably the second one
can be dropped.
Also, instead of "on runtime", how about "at runtime"?

> +	  If unsure, say "n".

Thanks.
-- 
~Randy
