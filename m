Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944461DC07A
	for <linux-coco@lists.linux.dev>; Wed,  4 Sep 2024 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461287; cv=none; b=gTSjxaKwCqDbOpsDfoPoekCpuzpnCMpk3t762aKNfyXqFXL+FgJQPm6X+SirwJtQPbtLtzRJZs+N8j0WHskWUDLn0wpvG9atWK6PtOuW49+K+tm1kw9NrdiX3Pzf9+2Mo/rJri7H63buBbzVjPtDchPS+Oqu08xh9AQW9b7swLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461287; c=relaxed/simple;
	bh=zwkevx0JOA1sU3/G6Uk1dmNSxwY1PH5EmMk1/KtzlkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvCy0Y46G6srGnX1Io9g+Ri+xAkwRnKAwCzGiPDFgIAZmoeQ+fW83pLX6BCdgCWV1t1rFGWkd2r4A7/LZc3L5/ssxImxRp1MI2xnaJx6iSohBrf3YGiXFSAtFBYza7UWJ5z+1IL1iMHkzV/v1tQJ/NZkzWcxQPJJqfJN9wWaHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2ypGIlf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2ypGIlf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so40544985e9.0
        for <linux-coco@lists.linux.dev>; Wed, 04 Sep 2024 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725461283; x=1726066083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6kEIYFtkOtx+DJY9n3gGx8oC/72d34oJtC4eMa+2Jo=;
        b=E2ypGIlfvOioqogj8/466W/tgFUez/KbtvE0zsx7s5p5IOSc1djIj100T8KfZ+OEUM
         1oZB0RmlcFIpkpY2W/4A1+C4iS13Azu4rSNL75R3H1n75Zb3AmIGG48bi8gEXpzLN3rK
         552mXqtow/jQJZWXM1laRvnQCjFri+NG0tLp19gClIIjeBicFX8vDhKeZPs18CUjikQy
         Z0Vin7njeFJY+W7uAxLOFModVNrFk/Jd8S+D8Com1D7qYDWJHXRLvNm6u9KuswBiJO67
         fMg02aPXjglQ6HM4I2Y9Ci33fPqLTa8iNjb8b+472EAOWbtmeokRx7J0F1lNyikgA+G0
         hq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461283; x=1726066083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6kEIYFtkOtx+DJY9n3gGx8oC/72d34oJtC4eMa+2Jo=;
        b=AhzDSxqJr3diGnYsz+bxh7cou3182hxWAIbvq8J2IhAHEVxZ0kJrfcOSjYnQ2V1bt/
         W1DprKZQ7SoA5ZC0UMD3OSdL4OaZU30nd0YnE9WtZQOb9Pj81lZ43B9HZE12b+aLywMf
         vbA+H++g7Zhwz+hJD8n+f8dZ+mxwIQwmlXRU46oZhGha4TuJ/rNSlbxCbpa3zWCqZBLO
         Mi/kNMbz03f/CEli3GAy4XQygOxmFwtwNc2op7vTTT+YAMC67wxSwxOcVeA7CCyUicci
         pUpwx68M2ROGrobqbWB/WlsW4fZ11HD3dL9GHfE7ohfqlfkRPE4OTuZR4oddD2dLDgBU
         /oRA==
X-Forwarded-Encrypted: i=1; AJvYcCVva1u3V0uZgGLiH7+rLEQxnQs9SvU20znuO1/m1PdYJy4wsuDx97IWNaIii3HvJ4/VaUpyNT35XtwQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ1UEvhlNhURlOO1bR0w4iXzFELuR4dL5hvGyhxiGqCIvd+6wA
	15jo0BUi6Ar3zMTQd+R1mtjLAxdQ8txSRlxjVHtJKwx5pN38UfUsnPrYJNfkD9g=
X-Google-Smtp-Source: AGHT+IHKZyt11Lslz0HlasHPTxHt7BSYAR0Jjt79ONBZBuyaQ3ymGqrpolN3WJVQPOJE6wYCFvw0hQ==
X-Received: by 2002:a05:600c:3b8e:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-42bb01b556bmr164929245e9.15.1725461282171;
        Wed, 04 Sep 2024 07:48:02 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb01d300csm218202355e9.15.2024.09.04.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:48:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:48:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v4 21/43] arm64: RME: Runtime faulting of memory
Message-ID: <20240904144821.GA223966@myrica>
References: <20240821153844.60084-1-steven.price@arm.com>
 <20240821153844.60084-22-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821153844.60084-22-steven.price@arm.com>

On Wed, Aug 21, 2024 at 04:38:22PM +0100, Steven Price wrote:
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 2c4e28b457be..337b3dd1e00c 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -627,6 +627,181 @@ static int fold_rtt(struct realm *realm, unsigned long addr, int level)
>  	return 0;
>  }
>  
> +static phys_addr_t rtt_get_phys(struct realm *realm, struct rtt_entry *rtt)
> +{
> +	bool lpa2 = realm->params->flags & RMI_REALM_PARAM_FLAG_LPA2;

At this point realm->params is NULL, cleared by kvm_create_realm()

Thanks,
Jean

> +
> +	if (lpa2)
> +		return rtt->desc & GENMASK(49, 12);
> +	return rtt->desc & GENMASK(47, 12);
> +}
> +
> +int realm_map_protected(struct realm *realm,
> +			unsigned long base_ipa,
> +			struct page *dst_page,
> +			unsigned long map_size,
> +			struct kvm_mmu_memory_cache *memcache)
> +{
> +	phys_addr_t dst_phys = page_to_phys(dst_page);
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	unsigned long phys = dst_phys;
> +	unsigned long ipa = base_ipa;
> +	unsigned long size;
> +	int map_level;
> +	int ret = 0;
> +
> +	if (WARN_ON(!IS_ALIGNED(ipa, map_size)))
> +		return -EINVAL;
> +
> +	switch (map_size) {
> +	case PAGE_SIZE:
> +		map_level = 3;
> +		break;
> +	case RME_L2_BLOCK_SIZE:
> +		map_level = 2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (map_level < RME_RTT_MAX_LEVEL) {
> +		/*
> +		 * A temporary RTT is needed during the map, precreate it,
> +		 * however if there is an error (e.g. missing parent tables)
> +		 * this will be handled below.
> +		 */
> +		realm_create_rtt_levels(realm, ipa, map_level,
> +					RME_RTT_MAX_LEVEL, memcache);
> +	}
> +
> +	for (size = 0; size < map_size; size += PAGE_SIZE) {
> +		if (rmi_granule_delegate(phys)) {
> +			struct rtt_entry rtt;
> +
> +			/*
> +			 * It's possible we raced with another VCPU on the same
> +			 * fault. If the entry exists and matches then exit
> +			 * early and assume the other VCPU will handle the
> +			 * mapping.
> +			 */
> +			if (rmi_rtt_read_entry(rd, ipa, RME_RTT_MAX_LEVEL, &rtt))
> +				goto err;
> +
> +			/*
> +			 * FIXME: For a block mapping this could race at level
> +			 * 2 or 3... currently we don't support block mappings
> +			 */
> +			if (WARN_ON((rtt.walk_level != RME_RTT_MAX_LEVEL ||
> +				     rtt.state != RMI_ASSIGNED ||
> +				     rtt_get_phys(realm, &rtt) != phys))) {
