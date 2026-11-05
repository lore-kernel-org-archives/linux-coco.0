Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884302;
	b=pVFahxxcvMjaNBTxgSF6ZizRwG/TI27urELNL/5XLnsI94WyP90DozAB+H85Yg71PTU7
	 EW5hV+NZPaQYluPvirS0waqavha0uOy2ip32W/CX/grVlmo9tB65ZwqvjZreveAp63jM0
	 HUyZ0t5maQOfYeGUzF8SeBuXnE5xuYT/MHTSVh1gGRZEVb2BRgt83qFIHnAjk7MwrM71i
	 WBD1HIXp3vHXFnOuj+0wYoZ7hZQRFO4ljytf8OhqefG5/1d3ZEZw9mMk61O6DD719RfIn
	 oyLk/wgFscD6jmEC9TNWEdQPNaubx+3iA4ztoLp0wPY1xCMmcV4zn+14OSLhbk+rJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
	b=NDzC9CHzsa4MpPKIqPyFK+fhDc+fhz/GX17srmID21rvn+wFxHHX+KltvY1lSJgVSuSC
	 +UsriZQLxjJ7DgDfypApsrb19jzaOiwlE3sqXoejZxxe38ADud1Mqlpq5c9XtuOLitiUA
	 HNf8MnzuHalIqoy0hM1K+HNY3g4o/4f1jI7qAR1zS+LezoCzVD33fbRDXct96QNqc+zZU
	 NxiyEFUtAWgJZy392lMah27a67tPTmC6RV5rVAvxdqidxuQzOhBkx6UxQd44EHhg4yyZK
	 KVyePdYOnUKs6n8HL0PSSkRrOYfrwx07tHiNHtcpnL3iSx7I6oer1sUUbf1SAdysHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=tiLs7tP+;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5E606EE83
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 13:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE5E606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=tiLs7tP+
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1205960e87.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793884298; x=1794489098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
        b=tiLs7tP+bDpomcpD03ONvb7pD7FXzzhEYxb31oEC3+sd7XVZKfCGCM4aUsxowpitHN
         4MHUw6KLyKBcZbl2Fny3QEGreZLAGcB7OLF899uZzqloUgE6oso+UbdYv9WM+Onj+XxN
         9Xd5tsEO29N/b/CSITNTtDecUo6dwDq8MYijuhnTeAuSyOoK4Vbo8w4D9Bwl5j9X77DS
         1Fjuh1N23mfXxMZ0SxnMVeGpm90fJrdsY6k/rD1VR9/qPVyHPiywkGncXoZ8sy6nrYk1
         DOlx1INue0unrX/YpSTm2U9d3WjMIJSRc+g8n1qpwrmz71wGn/XNwdYL6EZBROuiGOFZ
         zbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884298; x=1794489098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFWG6Sga3Lp6k+n+muTvwPlAdm13M1aYQLJn0cvv/Mc=;
        b=Cu8ggIDfjgkxfNPXK/tN9y9K0+rw8Dx12HfxiGDkvCVghJqCjMiOhc2mOd59UArjOj
         c1ALCmpAwVXU6W9Kuo+sF61Una9KOzHd0gZxChIvZTAnYX0EiCfE2ofWCnfY7B06hUJF
         gCl/Kzu3dzDqJV4epA0mp06yyb5/0I+wgNRDvSLenZvHWjksr/+CKC8ldV78bqXQsB4O
         hogvLKaHM2V4NdMFw3jbfMEgbmJLa14UtNNJUyvSRezfSP05Gd1AzkIWs2dzpIemZWxA
         HfWYH4YB+c1kurY0SkeWV+uUOIc+l9hE99EErZ1rNHZMiH1nYnSrExHZmlRux8hWGcI1
         K1DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIA5UFhyK8th0WaNNMmSOhGHFHr4HdxbjDBM3TLN7nRXjmPKuGamK88wxljE95TSM2S+OhFKPKWt0R@lists.linux.dev
X-Gm-Message-State: APuU4Z+60l9mxC13JpSM6yOO/i96hLdm/lZvAfB6U3eD+zIl4IamwlD6
	0fEdi1ZtNgGuFjmxyH4zi/JP90jKYE1ukjlHCtxdterK+jnTBIYNGUZWQLy3G8XN44k=
X-Gm-Gg: AYBFou1Hp+SLiDLUeTaT2WrDx38uXqptIeHfimBDDTAqxxJpYV2+XsLdBEkUbN2A7y3
	9Qm+On+EZoFFNcOVKVlOr4PVMVGDWE5A7f8RwtLQ731fwYbN//Er87ATxL8rZtb2xti/AbD/tC8
	SNvrRU+ZgC4PkUYMkwsHh+7yVv53OCN5Wna2VRmskUKhe+HlCsSP7gulJXKkrjb/rkI9NEUlkr7
	3i73g47zLciA7+/dx3VJwZOtg9GznIZbSORlUF5sQuN7Q5O+EycFJU2Kn5F3HD9Qv9pMbhTpshi
	2tNsABEmNmOiyioCQvEZMRMS4AmXnxi+Geyf+mXK1HzfZpN58BUcyZPV3tP/tVGJp6QuoL0odJQ
	NYGOAnz52FR66PB3jd32+LmMDiVGEpKfK0My0p2jRU2zabSOqkTYBDNNa4+anAruOIbVveaIO7/
	Qc2EHD+30ceMcClrs//Y2N/qYLNuzyz1vxRVXnwU92hIwxRZmAP1rGVofhlD4Y3uMYzJgPiGod2
	+SO1CSLoPKuoPOyM9d4u16nUimA/mJAJ8CO24uhHoqpyPMDIV3GfzKJpsqVZsXEquOHadVTJL8+
	45Rtb1bcJnUn4aCw6KV/pcp5dqbpYTWIho34aNnDi8q0ZRx+qYKvsmF6aPo=
X-Received: by 2002:a05:6512:128a:b0:5b8:fa05:e49c with SMTP id 2adb3069b0e04-5bfd9569d40mr7209047e87.34.1793884298157;
        Thu, 05 Nov 2026 05:11:38 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab798sm817490e87.23.2026.11.05.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:11:37 -0800 (PST)
Date: Thu, 5 Nov 2026 14:11:32 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <auyAJ8OMWHUTCFKs@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
 <20261027141524.GF1685504@ziepe.ca>
 <auC5sw9YMC9NO4wl@e129823.arm.com>
 <20261027151729.GG1685504@ziepe.ca>
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
In-Reply-To: <20261027151729.GG1685504@ziepe.ca>

Tue, Oct 27, 2026 at 04:17:29PM +0100, jgg@ziepe.ca wrote:
>On Tue, Oct 27, 2026 at 02:48:19PM +0000, Yeoreum Yun wrote:
>> > On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
>> > > Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
>> > > >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
>> > > >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
>> > > >[    3.857301]  ctlv_schema_validate+0x88/0x180
>> > > >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
>> > > >[    3.857698]  kunit_try_run_case+0x64/0x188
>> > > >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
>> > > >[    3.858086]  kthread+0x10c/0x140
>> > > >[    3.858245]  ret_from_fork+0x10/0x20
>> > > >[    3.858398] SMP: stopping secondary CPUs
>> > > >[    3.858630] Kernel Offset: disabled
>> > > >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
>> > > >[    3.858872] Memory Limit: none
>> > > >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
>> > > >
>> > > >[...]
>> > > >
>> > > >I think it might be good to configurable according to architecture
>> > > >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
>> > > >otherwise, increasing stack size when CTLV is enabled seems unresonable...
>> > > 
>> > > Agreed, will lower it down. I think we should be okay with 8 for start.
>> > 
>> > I'm surprised this ran out of stack though with even as few as
>> > 32 levels.. Is there accidently something large on the stack?
>> >
>> 
>> Nope.
>> 
>> When I see the each functions stack allocation:
>> - ctlv_schema_check_indexed_nest():
>> 	sub	sp, sp, #0xf0 // 240 bytes
>> 
>> - ctlv_schema_check_attr():
>> 	sub	sp, sp, #0xb0 // 176 bytes
>> 
>> Roughly (240 + 176) * CTLV_MAX_NEST_DEPTH = 13,952 (around 14KB)
>> consumed.
>
>400 bytes per nest seems pretty big to me...
>
>Do you have debug options enabled or something that increases stack usage?

KASAN is such an option. On arm64 with GCC 15, the stack protector and
zero-initialized stack variables, ctlv_schema_check_indexed_nest() takes
208 bytes and ctlv_schema_check_attr() 144 without KASAN. With generic
KASAN, which instruments the stack with GCC, they take 432 and 304: the
redzones around every local whose address is taken more than double both
frames. Your numbers are in between, I guess a different compiler or
KASAN mode.

Otherwise there is nothing large on the stack. 96 of the 208 bytes hold
the callee-saved registers, the rest are small locals and spills. It is
just two frames per nesting level.
With the limit lowered to 8, validation at the maximum depth takes about
3KB, about 6KB with generic KASAN.

