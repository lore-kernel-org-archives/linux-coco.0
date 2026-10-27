Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110528;
	b=xKQGtf4GQXoeDBBhJD0r6BYXcG/+/7DF4Q45XExjc5VKavTmGfmxr68PQax5b/0fvsKj
	 dz4pCETfCn65SVsdCZQCChoPQXkziMf2Nv9BreYYZKQYoI8rH/oKw9wkU1bxuCZOpfh2a
	 0koB9UPAJHuxnLhy0y0V0RN7ylDaYaL4CUFDJcImDap3fO1MOo895M8BIHEGfHUionoom
	 As/eFiEIbRSK+7OYAsBk54TFLp9PWhFyXBhnJHhlD31Cvm0Nl0D1cD+hCv+NNH0IFy/p5
	 r3THHsDpAlEnU7dzx5NLNDPrgxfzt19veBpn3LM4+ulf1jZdg8uv+YHXJn6uBEqLOyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
	b=ENDsrNeTd/2z2wVd4nfE1vXJTa9+Ko5ZO98eJWd/C2MtYA7+8DSGt8cMwXQPnAgFgxi1
	 tz3+QSDKqZg4fAXvQ6sNbhMkD/hOuiZIZ+Tq/x/G4brg6/Bxq1mmS3g6fXTAl0MGBbpyK
	 qDgbVlJWEosxm8kVe3l228QBEQfg31qZcW9QQNMvGxgcqUnBHeLQghzndapfG/GJjUaaJ
	 Hc0gx5UGsT5ALrizS9ZYnr7MJ0SJsGlfk9Vl1XvHD7PbD3+S/oof+fs3jc50kgGzB4oAx
	 CyYmMDCAPSvq45fki7x3p3IQ9C19TBbTO2p6bFnldivYV7kJrS9p6fjm6lb6GbsOSJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KImT2qsh;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8171606A320
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 14:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8171606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KImT2qsh
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f3c89594cso280687785a.2
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793110527; x=1793715327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
        b=KImT2qshP6SCvHqvK7HW1yBPkPojCKwaDmL+0M3LUEuTKXVWU8moRmXBxoraxRSeCu
         Q9zgHJtD8f32HZGFmDMH8OXrEN1JLtDzJ3HiRs5r9UkOqxrcmVyNruLWJi6g/zwxbJ40
         z3GdqhmBbajTy4SGffhWh5iu+7bhGM8N7UghAfFOMS46iXdU4BF8zpIVfNotboozjQb8
         hi/lxIfNI2BlXD+SqHVa7U07XVkQjnnX267sMkxPOs50eC3s80l7VhbvR8LbIVYUZm4C
         Prgus9II4RFhSgJ81CU1bAKZZN/frSWhPHT0tusmP3hpA8LF98v3Z7tLspvo+HkrUdyw
         oZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110527; x=1793715327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
        b=j0DCtr5wuAEdf7QNcr7Uq9/bHEJFWcptidd5bDg7ZckG+OKvvm5SFjTIIQEYqjSlmZ
         LzljPHNJ/NmAF0q6U+yGdCSFFNivez7SzA3Z4LTbO8SyAmPYUprwixYU01UcWggXg1/7
         C5mvILXhlhWjHA5sH/lY0LFaNM19eDorIgpTLv+eT75rDvKQkq5/cT1c/qCXxf6tYFUr
         eK3wKYm8btFQAqAHYXUcjSGwC7H/3ghKvYeEhZzaZtFHRQjVH2WemgrVLikwCoMgyMvE
         BJUWI5nV8oL29psFKj+t+hVevUgYChNotsQXgOCnPOITHyd2+EjlygO4FoRSbFYVumqv
         IQmA==
X-Forwarded-Encrypted: i=1; AKwUvBwZxAdxvv5F19hUlOtzmRxwsqywNuz35proAzzWLK9yMJUn0EvezPDMGjOD8x1IbK6s/d1AyXImXNr+@lists.linux.dev
X-Gm-Message-State: AFq9FYJlVOrhZLzB1bS6wFmRd1VoAfC8NVDerixRJRlxF8vWd2YZrJQF
	pd6kF8/oixji1WnlmbqBaQ1Bq38RmKdqQof/dJ9WgDyVBCRRWdGA61dgzazPDGwYGBU=
X-Gm-Gg: AYBFou1UHKgROtLDWazRfJGrB8r+4da8vc3WNMNx4Ee3FfIrO85Q60PYO1FH2QZDJkT
	6UfhMizrt+TpqAxh/R1VKCfWHEI2yKd0pykbbVamFyx2z1Xqp/ffoG6XIfqMzgBnBHJo98/ZFqC
	6nxjrqxpixVcbsnTlfCUW8TJWy7raiLb/NEFtuEmckXI3fmOUFCzYSe5D3gh7MTwgB9pRG//+fe
	gvs/6u7jco+KXpMy2tC9Z6IJ3jRw+K49Y7QEoNTydxNP8zY75+VEiY31PPBv9kVkSOcFy1q/SRC
	f5M0LYWdvObY9n6eKwCwPHBm+Cd0TwrDOicYlUaqFkxowWcD0oI9Xpw8gyx2qhVppljws7fUTUT
	f5O+p7trPgm/BULcH0LgAqvNADxNYKM+PNVrvbXR7eobydR7t0i25AT7nyu+rHikxHE2XXvazjY
	BidR97f6YrdztjodkJMhY5rvL7grAnxPgfT6rTitEEYgrDql7MJ6IdpgHQO1MiNn6kHOCDPNkDO
	YzyTXL6MM4BuGsFjt+HYGRdgvzNtgssqTPxrE0PZ60LWPUwJYorzRptp6HeHjt/S6wpD+swJCWK
	D+MB+Bu509JjNu3lIPMxo/t0EvP2AShlF2Mz0g==
X-Received: by 2002:a05:620a:261e:b0:93f:d27:c89e with SMTP id af79cd13be357-940ef9d6997mr1602321285a.75.1793110526435;
        Tue, 27 Oct 2026 07:15:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm982932985a.28.2026.10.27.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:15:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLhxU-00000009zYJ-422J;
	Tue, 27 Oct 2026 11:15:24 -0300
Date: Tue, 27 Oct 2026 11:15:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <20261027141524.GF1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auBaROC0XdWpILEI@FV6GYCPJ69>

On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
> Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
> >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
> >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
> >[    3.857301]  ctlv_schema_validate+0x88/0x180
> >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
> >[    3.857698]  kunit_try_run_case+0x64/0x188
> >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
> >[    3.858086]  kthread+0x10c/0x140
> >[    3.858245]  ret_from_fork+0x10/0x20
> >[    3.858398] SMP: stopping secondary CPUs
> >[    3.858630] Kernel Offset: disabled
> >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
> >[    3.858872] Memory Limit: none
> >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> >
> >[...]
> >
> >I think it might be good to configurable according to architecture
> >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
> >otherwise, increasing stack size when CTLV is enabled seems unresonable...
> 
> Agreed, will lower it down. I think we should be okay with 8 for start.

I'm surprised this ran out of stack though with even as few as
32 levels.. Is there accidently something large on the stack?

Jason
