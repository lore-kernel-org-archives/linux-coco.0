Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3FD39A04A
	for <linux-coco@lists.linux.dev>; Tue,  1 Sep 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273149; cv=none; b=uvVCgo1xu5fxI0WJUSFbObwi8GHYXQNLYFtIwSNy5cae6v1vha0kCuOfwNSwTtk06B0vpk7FMK0DVuT4oajbz0Oxwt+i99XHOTn/ZaGyrC3ZGpkKCAbI7I1kLTm8GM9sFOkwjQNs9pLK/5d2niym2yisgWGH3q4AqSBdgfSEEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273149; c=relaxed/simple;
	bh=Epea1SJtx0b5eyI7MQ/aNcrxf6TZYklQq7AcTHGfVa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG2lmo4SjwTiwrAKy7Oh+AHeOtNZZMtJov1O+WBPzkqi6lqQQFAlBjgcSJwkTm4pVXHn8wVGcRmGX998eCUNkJneSv7ubVNiRtJIaRAmWvq48gG7z2NqUdkcu5G/QLQLEeL7IHddMUDUnLvvfIcpTdmQ0xynff1DCTZkhlb1aD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QULNW11w; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QULNW11w"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530187593e0so13416311cf.1
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273146; x=1788877946; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=QULNW11wAUo1BtBBTjFrvggxpwU2z+pe8KZ9722l44l71B5Gu/y3l1gkRtktSnaR0e
         I/Fh58PQVEqoeM1BTpr5jxhOrrGObo1pXZ3GvCyIucp/4pMm9Z5dP/PqxKUzsWlzEU9U
         5ogcsEOVuBH5uuNffU+wgF2XkPXNYulHpG9zhROcN4NVCATBxsOuYZpZZrusoJqmJK96
         MD88h/sd9FwSzivcCPNqYwCbJsQiaHFDwQKnO4fHoBsgwGXUFMrxmDWZ6lh/l/UkI3uG
         hoJk3YP01WZFu4bAgH3NSbK+n4uhp8NMomzl2JwEZqZdIQoFfEn/gfcHfYwAgd4EHOGx
         kXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273146; x=1788877946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=K65oGZdl57JHS4aFtE2j7IEY5pv+q5ltwaDQzvALtQXDjbnxelNg2+zBqUDqs/Mbcw
         fbTOpNzH23ECDA5d2BPSp/boHENeJ4f+IEip0MIIhLvB6YcxQVFO2bjMks0k/MclapwI
         07N456718qmM4z1uDWdOG2W0P0GhH969Wf6q9Hxnbo5JG8dbGyrjl/yi2QKxMlhTGfrh
         mQKf+s7iooPKi5m0Zhb+2KJeJ9L5CDgSJxH7lJu0cn4zLUf7sNIDyDSu21OP/8UECYP3
         aHGKeN1NLGv1d8XQFqVeFpwyRryV7SS+1SJ7RhzGGw2geG3UxlqThlSomAnNPzil3ZO8
         n8aA==
X-Forwarded-Encrypted: i=1; AHgh+RrvuhJ52tA27sSzpnmlATXkBKKHI5C4wktNs3K7T5rycBY9jNAmFxvXsVntlkHphy16tWIfZPhZWRJw@lists.linux.dev
X-Gm-Message-State: AFuF++kdLO2ymIMnoqeuxOsSKEKKHjkyh2YEtgNs2/7Ute383b43yYs6
	j6FJdXD5l9SwY5uH4O0AquFjDL1PjnrqY7N6UkT2GjfPpS4o/5HpihGdIJ+YeoSCOlo=
X-Gm-Gg: AR+sD13LvrlyEZwpOIIzlPFouTIiq2/Fiz4tXvQLSmo1D1re82q4sTSi6P49v0Y/UfG
	8GXVCwJAn4Y20R4juG0ilg3SPyKMdveWd69mVhRaN30qZTuZKJqIhWLtGjDcfk08K6lSjYKVHo0
	n3Cj6h3R9JnvREMw3dFuDFeUv1riRxkGMYDpo9/L/dmk6ZkiLSkcdnyOeZw5mnYl84sgz0bDjWS
	vrX15pYZBkkS//gWuGqv//eR0O1Wphx6d2wSV503z9oq497aTjbq7BIdhjtOGKvWOlQjubgfZYP
	k6EX3QN4sxtWyNSmJVsX53sgZeyzmoJo50lY5/U6HXnx9gl+rQootAK7Nt/iL/r8h/fwrufPbau
	pD3XamenINvIcxo/evgJeGtEyi8mCBd6pseZWr4+IcFZuwG/SNVDHxDHrrdN4c4v1dFCWJhxOEw
	M7YhJIDmbp88KH2YTZmXG8clsG81Aub/FR87UxxY97DfthjolhI5n2IXwqb7VBB9YIJlf4zw1R3
	K2yIvCN7M3/bIDM7h1jMBRsdVNK1kqKI8E7rEsNREBCihJFxqbL2cxV
X-Received: by 2002:a05:622a:948:20b0:530:2ded:eb32 with SMTP id d75a77b69052e-5302dedececmr22533091cf.2.1788273142344;
        Tue, 01 Sep 2026 07:32:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7fbe06sm96855001cf.17.2026.09.01.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:32:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PXA-0000000BhaA-3wav;
	Tue, 01 Sep 2026 11:32:20 -0300
Date: Tue, 1 Sep 2026 11:32:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 01/16] iommu/arm-smmu-v3: Discover RME support and
 realm IRQ topology
Message-ID: <20260901143220.GB56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-2-aneesh.kumar@kernel.org>
 <apMjUSbxcnlAKjks@nvidia.com>
 <yq5aik4pnyul.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik4pnyul.fsf@kernel.org>

On Tue, Sep 01, 2026 at 02:16:10PM +0530, Aneesh Kumar K.V wrote:
> +static struct irq_domain *arm_smmu_get_wired_irq_domain(struct arm_smmu_device *smmu)
> +{
> +	int irqs[] = {
> +		smmu->combined_irq,
> +		smmu->evtq.q.irq,
> +		smmu->gerr_irq,
> +		smmu->priq.q.irq,
> +	};
> +	struct irq_domain *domain = NULL;
> +	struct irq_data *irq_data;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
> +		if (irqs[i] <= 0)
> +			continue;
> +
> +		irq_data = irq_get_irq_data(irqs[i]);
> +		if (!irq_data || !irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		if (domain && domain != irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		domain = irq_data->domain;
> +	}
> +
> +	return domain ?: ERR_PTR(-ENXIO);

I'm not excited to see code like this in a driver. Please put a helper
function someplace else to translate whatever the RMM value is into a
normal linux irq number?

But this feels wrong to me, interrupts need to come through the FW
side, ACPI or DT. Having RMM pass the value outside that
infrastructure is going to be painful. None of this is trusted, why is
it working like this vs just adding more interrupt lines to the FW
description?

A naked integer is not enough to describe an interrupt in the system,
and guessing that it is connected to other interrupts in the psmmu
seems like an uncomfortable leap to me.

Jason
