Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF19314A90
	for <linux-coco@lists.linux.dev>; Sat, 19 Sep 2026 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853736; cv=none; b=fsgbR5IMKsclPdLyk6q1fGivyH8AG0k7Z+O0xTfWjlZy2scfgVX2tZLqUYVH3gTVRwzFQBNYMcIKsMli5KJRunrZ7Pq7UOb2G0Sjn9uPMHRNEsG8pF7FEQFU9JncbCIeV9VtVym15Js/dY70xa9yxLR0vgdTsuQn1BPDw2bBe00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853736; c=relaxed/simple;
	bh=xlefR/akgVIwwabPG2m/iCIg0y04aOCKWgO4pB6evyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd9QBW5FihPkZhx1+M7JQv0YAuzO5DSxnWLhZ8u2QjeK79ZzV+9Yr0o6Q1093mC+v6JhnWrvf23RZngak1FoqGSRyM9EP6o+k2ksHDYHq2Oi6O3fBKPIrbwgNe/7D8gJNxWj+T9cpXMjukgUHJHx47f+TkwP8K9JMUY8uiier0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PAIIwRAV; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PAIIwRAV"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93be6d3f424so124286985a.1
        for <linux-coco@lists.linux.dev>; Sat, 19 Sep 2026 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789853734; x=1790458534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=PAIIwRAVAe/WOVLevVuGYmY8odDwwmClsabEE1TRoPCyBQVTkftWVtryVD6Rq4PB5b
         JuYT0Kbw8Y+F4I5/lknGcqUqWFNKTFOqg6viUlUbqd9NNFpUf3G32ejGnHj2hwYXyI87
         yev3NlHmIFZc6shHVWsGR32tdAfqmB+zZYdq8RFHfAvJZak79eZqw/O6Zf6lL7/ECtJx
         6Upaa3DgBuS6jtsiTb0hXTXsnmH6UmADpQlapn0YE+Y3lZ9SzSQVDph5f8dzTTVSOXz0
         ZEBQqxoFeBLTTmwoGfLEn5wlE1HNv54u23UGsJgJ9HmPD9Owad1jGFGmLwmjQPIUO96Y
         TrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853734; x=1790458534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=yc18hLvzNMeRbyCyJbifRADKF8gnk80DMIv2pQiSxprUZ5cem96aLJtt4AEKckk7Xn
         dveQOrM9j5ccJwtKfDwYzHzQ8iTjSP56hBn3qax3nAZhJWK+GqlwlEPm5pIroGT4oydi
         bHhNqFf5y2226y049XIz96DT3gwY4CYVnqNS5TfjKaN+JISIFhabBzEHwH3geMCOFp6J
         tLZlbFeejN378KpPHQujMIrX4Q44AaAEN1PDuPN9/aKpMbD9RiFzJP1HX0nwzCHYQnpn
         go6BupC2mLGiXCX+YFTbPUKMB8LaO9KRdQVq3Tg1s6ucDhky746WpTwBat1fGrmjKknc
         Rj4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzq2RVZwZeGS4EQk6jq0Nizi/bNpwb0wFggLp8kFSWDGaVGQzEt5dl4GY0IrIciiOapZYMwXNFzSup7@lists.linux.dev
X-Gm-Message-State: AFuF++kEVza1Uafbh9h2Xfb93M9OePMIgYVbCzsqAO+a0lF2cs6HIVGy
	4BEEXwwA0i59zmJJ4zqoEBPAVkdUzR+7n0h1xKwIb8GHzXHVDqYQ/BoEz8RHlViuxf0=
X-Gm-Gg: AYBFou1migGVVAYpYFoUNzF0hfRA4SAV2XVe8gTrrr1CXmVsl+5TrFWFlH0PBJ2GiXx
	nGRuJmz66EC11NhUUa2en8VeNhxcA0g4NHrkW/00f+rOnsP99BHYGB2VceBzNWKSZ1zsrmOOzUp
	aOAiZdhZhWMzQvkwL2DuY+ilpIAhJnsZXUZSga5z+lMk+3AaKEsBpEZ1g+9CltimOGFjjhrfwYs
	rov4os5SOf9sFqphGskKMGVhfwYjotJ4c/C78As9D5Q5qoPKASbPfiCS7TIwTWJJWSWhFmEbZD1
	DdGnRxilb9sZLe2yj+TjeOjK5dtPTM5H7hXnWiOGU2y3VMDmMBYxCN7M8A47u9QfptcAdMnVSZg
	HTgz9hgb/YSpw2yfwZEoi9g/i9EWvirZFTmTKgG11EX7QiTa1NFjM1LhEAZ8MmI6pywItbZKA4t
	JBpNWAYjvTTP0HsVz6fdnbtnu9tB5Ri6s4OydCKX6XHPYavT+hrB2xz0+dG2wQtl79IkwSfoEe/
	pnnHXFpIa6FMID5ajdu+Jc1dZlUk3ZjMfsTAS7OKobunza1yogSj3nP
X-Received: by 2002:a05:620a:4416:b0:939:fe55:402a with SMTP id af79cd13be357-93bf577e246mr341980385a.31.1789853733973;
        Sat, 19 Sep 2026 14:35:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bed72215fsm275561085a.1.2026.09.19.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:35:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x82iZ-00000003aXY-2gnK;
	Sat, 19 Sep 2026 18:35:31 -0300
Date: Sat, 19 Sep 2026 18:35:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260919213531.GI11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <yq5atsnl47c6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnl47c6.fsf@kernel.org>

On Sat, Sep 19, 2026 at 08:27:29PM +0530, Aneesh Kumar K.V wrote:
 
> +static struct page *system_heap_alloc_order(unsigned int order, gfp_t flags,
> +					    bool cc_shared)
> +{
> +	struct cc_shared_pages mem;
> +
> +	if (!cc_shared)
> +		return alloc_pages(flags, order);
> +
> +	/* The shared granule can raise the actual allocation order. */
> +	flags |= __GFP_COMP;
> +	if (alloc_cc_shared_pages(flags, PAGE_SIZE << order, &mem))
> +		return NULL;

Oh yeah that's surprisingly easy because of how this loop works with
order

Makes sense to me

> int alloc_cc_shared_pages_node(int nid, gfp_t gfp, size_t requested,
> 			       struct cc_shared_pages *mem)

This argument order is a little weird from mm norms?

Jason
