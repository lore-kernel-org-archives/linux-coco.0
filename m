Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C6B35AC3B
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971806; cv=none; b=ridFz/m2CQVps/zP+eBLkFfq+WweilQFXnJrmjpFQmlNbYfrdv5Eq92HkzT3D1d38Gv+OHn6yKUd8yoNWdX9gMtCYV0kTuurcpmPzj1K9K1i1r6Gw07pxV5pUnmkLxIepz1kQSal0wrdIFxUm1Sa8fwYm4GbdajEX5YC4i27hTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971806; c=relaxed/simple;
	bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1QUFaiRfKFCGlTivnvsuCHKjUWsBV3QoeBy1GvCVOPvzqXr2dHGirZFgCTQUUb50LVYs1wDFEA9e4hJvoYfcWqdd3vAL+AhAPD5uHoKmvbC/W9/q6pFQi0T4M2jubnnDt2PfEz6rcPyiq6JWeaMw4tjSWyly0lZHxLoixLyxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VORMpffP; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VORMpffP"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8efbafa1bacso29125136d6.1
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971804; x=1784576604; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=;
        b=VORMpffPRMFry0Xf5/rMK9YnBk9iyfPGjeYBhGqdEZWl9zUCdNX13NywkCmYHCDkdM
         fkSV2eW6Js0DYyd7gCvYbY3zKufkS71rEb2cj57AAXo1WD1V91UduVGCbZBqXWbLgdwl
         yX0Hy4DlZjO3gKULGrsx1ueEuYrhFTIUF8WgnLdiqNAWX1mxzfftHqQPm4CVkNhMSmxx
         aoMSqZimyyfJ4pQjA5SFgWK6qs+eOLqnL1NpTGTk+boWjIFLFM+eLj1ggJ4kCtosTQ+t
         CVodXcdy9qkJNGgIOR8Yf01QaEQ2i5QSk/7mWgcn7qK783wxjLH6RIixEOqdHRm21sQF
         LwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971804; x=1784576604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=;
        b=XFuJqhOkCFiDgfHKPSmINFqf2VcVwIMVES53/MWsGTZJsZhkQ/KQOe5DS0ynbKZNN7
         tWLqV7I8YkyWD+OGBpWuQ6qF1xioUcY3M7WjA4BpptQCauQeXAEO+nLhXJHtbpBXUtpX
         sw8y3EAUyoZmznHoRArFW6boiiWXOgB0WKWinBmHXqZXmBr8YPXqby2sxaeSpNt+fiWd
         LKecH/Sn33ZNcNpRBZFCA61aHWjjId5gbgOWWGetpHEZDDDFATf9mHpByazGDx3p1y5z
         3zv+xVp8+c6jDOyVx7GL5upIbOa4NsZe9uiWifVHkr3HVVMBVTjsev18woYc4GoeFFKU
         Xe1g==
X-Forwarded-Encrypted: i=1; AHgh+RrbDx/pAqvEyS8Ur5a6E5dnrBOaFmb7rhlmnWCkFZZ44NjNuk4HvJG6pAk8kIZL//nhLkng9HUQRKus@lists.linux.dev
X-Gm-Message-State: AOJu0YwS9/dFWGrRHevfe8Dlp70S62JRgnvTvO6ZcmR95EP50mSy2Xt8
	mppvaf7lWkOHwgeTFWNX4GB0hHDr66Sv8R40198XsFgouepB9YBJOBZ1ofyWcjqhZGs=
X-Gm-Gg: AfdE7cklFQk/AVVI4G++g7n5tB9nyoFKkM4OUDFvAM1TdSfvNcpp/BqC3i3GUXaRkQo
	OjMLaL3ZW7uh4HaLw81VMTwAcrJQdfQV9zpB20p3iPFcfIBbDlmfyc80dw6ELI4Ezwsje855gf+
	H2MvMm5nDpB5cDq4RxXHCGudM+rqiZtB26Bec4mxa4I7i+W7oOpjR0iL2cLhLqe/f0BpV5ftBsu
	brdXuqn87Fz37i8USNEqlaocjAB8zZCKV9Fad5PvxC+Ge3zjfR7239P6LyegDZH80k2oghe3AK7
	WaFexDhtdjCOyHuGiY8p1X3vfvuCGeUBZrPliL+Ouy2WOf6PBDyz9RBDO9DQ4N5Z7Q/m45ZIwSI
	AWSNmkiSHnCEjMiPIdgeoMIa/ZUuwBW6YM/jYlxQ7pCqw9GB9zBaw3VBXqcpUQjUdmTiO24w=
X-Received: by 2002:a05:6214:3302:b0:8f0:63b6:5881 with SMTP id 6a1803df08f44-9040236cc47mr114290366d6.26.1783971804298;
        Mon, 13 Jul 2026 12:43:24 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9500sm137858946d6.46.2026.07.13.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:43:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMYl-0000000E6yO-1CDU;
	Mon, 13 Jul 2026 16:43:23 -0300
Date: Mon, 13 Jul 2026 16:43:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <20260713194323.GC3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
 <yq5av7argr65.fsf@kernel.org>
 <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>

On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:

> I'm fine with merging on top of the topic branch and I assume that this
> patchset is mature enough to give it a try in linux-next, but first I
> would like to get a review or at least acks from others with good CC
> knowledge or experience.

I think it is good to go from a CC perspective, there are still some
more items to fix up (like the MMIO) but I'd rather they be followups
at this point.

Thanks,
Jason
