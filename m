Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AB736C9D9
	for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844275; cv=none; b=CEUFboj0W860mi/KUF3m53592M+CAfSNf2A4oj/kGSUv8bRe/1knm0e6IhvDsEDm6xwINT0gcOrKnauBHb7wWeoswl66PDLTr0VP1KwhG8IcYW1InQkuECLRoSRsZIRI98Bo/xyjlYxQEouQ0JntNGbDlzaFMDJELn70Q75/sXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844275; c=relaxed/simple;
	bh=eFM3fFc5Zl326sG07acTtNC+v1oI2aRgEXDFTR18mFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfWUqBuElsorQ7ly4iitRFKZPg0xfQXZB9/v7g/d0pixtUxTHBQ16TVKxpRsxOvps8Z0KbeGzSxZy0En0j7LjGoQrJ9bcJ5x7BJCZTpO9OiVxln+pxtFRP754MVjQaMfbDF/TFldkwMYVWD3BVC//it4adyScDCuymmsxcstzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I3mJ2h+Z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I3mJ2h+Z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso3629165e9.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776844271; x=1777449071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoRr8QDMIzfqgX7VNwrYeGw2tZtA7cdSKtjPSj3Z59k=;
        b=I3mJ2h+Zn7e8TAtxfjQ+RVmj9ifgVJ2P988xK45XLiJTAC+xslv6XQutK1U+EXGZss
         NpaLx0GWoHgXOZ+UhAo8FhuE4alQSd9TE6Slz74YFauB7ASC2w5D0ER0Pyo4v0OeoDKF
         1r+AxiYQSwS8XQTKNCl6QbwByUt6tFAJRlFMEwEUnOUSvH+P9N+a3oHX7lHyaP1QEIEH
         tfuSaSQ0R5stPpUrex41oSZs2VRWS2ncQ7as/giM3LwdIpNn61Yt5pxvBttTTmw8iU4+
         U2FSkIKTUKc6q2N/DIVZW3JXlWdLMsSaw8G5yHVTBjyRy7sZxAVC6k1T+1pZ8pQ2Nu47
         V5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844271; x=1777449071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JoRr8QDMIzfqgX7VNwrYeGw2tZtA7cdSKtjPSj3Z59k=;
        b=sb43hhamrvT+6gwMQB4KDf2xjWd295M0Nz0eAf9qnA48o3IgdqLqaLGEktyfTpLcrT
         ueAP4glXABUK/NrA5ATBIfD99crpGo6zMpBUXAejO3fD8ThLFztCpL530fQHPQRe9bIX
         lICTl5U6D4Ew4GlS27IHS15tjemKKA6YyGU6mJGXTSj4S/mL8XOfnbJ03TrXU+ARictG
         1cyk02ADLUwzJB60SDKIy4exBUAPo0v0Q6FiCIYn/iZJUG/hJLtTuaC3iE+EErLNagJY
         Giew3fRVpgiaoIxZ6QWc+GJzPorwQcEVlG3dzGmX6ITE9y4/aJFHiXceoaLz+yOmTLp1
         D+Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8KD7Je/h+d3xUo/9wcYJyO7svV+Cl+K041j0wIzGIpwFbErK4lQ8Ts+cwzPxn0gJgfJzkBxAie0LRJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5n5HA9cp8b1y/vHYiYGqKAYow367cR4KubKMamlFZLwfEseXw
	hFnWfUuhwJSfjPh3cYvrd9i+Cw9p0i8CPtFEFIJOrmueertLx1ePhiZMF48QmwdWfz0=
X-Gm-Gg: AeBDiesbHmyr9RNfs4MwHOOyDQTwHM/UkArOywYGgwH7xoj9HNPl2wV6tN6vTl9TAT5
	ZNzV5yYTOQGoMCnaxx58pL4RejCJiBdAZdBjxrQyARbPpZSklTa59ogdGn3W+K18vreH2l104T/
	0EBlmmtUYMZl/7a82cjfNteozKTrwvUF1aOgc/NjXj1UtBrfgCJFNUPL9FLr+aSS4EaARoJDo49
	dXTytVVts5dYTJXFeWUEIXgC8R51Vrt/72IDij76W8wX3vsV1r4BefZtO7uxurHch2mYrcFk6Wj
	KaIrc/1JsLt5Kx7D8sPeDncFmqWE9o5StXMDkWNPvuwNZPlPG9dxsoFYgXvrVSqVi0ybCOyvdmK
	gn492CvFXyjkuL6k+6axU1OFoRyybzJC5IzdmQowuXhQOqHNrCfkcb6TtrMMNHG36iLGBuoxNwy
	kJ+cEnJK6UjJzx4/KFodwsgVtLh9UyWqL3wUbOEg87yLf9ccT6ooD7Yy4MjglaN2N36ZRUt7RP8
	88Q79nY1NDbxkuArPNNvzrSdLE=
X-Received: by 2002:a05:600c:314c:b0:48a:5664:f44a with SMTP id 5b1f17b1804b1-48a56650076mr45995745e9.2.1776844271346;
        Wed, 22 Apr 2026 00:51:11 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm39579398f8f.32.2026.04.22.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:51:10 -0700 (PDT)
Date: Wed, 22 Apr 2026 09:51:04 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
 catalin.marinas@arm.com, suzuki.poulose@arm.com, steven.price@arm.com,
 thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
 suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260422095104.1b3c4132@mordecai>
In-Reply-To: <20260421121004.GA3611611@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
	<20260325192352.437608-2-jiri@resnulli.us>
	<yq5atst6ywbl.fsf@kernel.org>
	<4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
	<yq5awly0d504.fsf@kernel.org>
	<tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
	<20260421121004.GA3611611@ziepe.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 09:10:04 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
> > >> You reach there when is_swiotlb_force_bounce(dev) is true and
> > >> DMA_ATTR_CC_SHARED is set. What am I missing?
> > >>  
> > >
> > >So a swiotlb_force_bounce will not use swiotlb bouncing if
> > >DMA_ATTR_CC_SHARED is set ?   
> > 
> > Correct. Bouncing does not make sense in this case, as shared memory is
> > already being mapped.  
> 
> It is a little bit mangled, there are many reasons force_swiotlb can
> be set, but we loose them as it flows through - swiotlb_init()
> just has a simple SWIOTLB_FORCE
> 
> Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
> selected for CC reasons. For instance if you have the swiotlb force
> command line parameter I would still expect it bounce shared memory.
> 
> Arguably I think this arch flow is misdesigned, the
> is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
> the correct API to check if the device can DMA to the presented
> address, and it will trigger swiotlb_map() just the same without
> creating this gap.

Seconded.

Then again, the whole DMA mapping logic is extremely convoluted, with
dmaops, direct, CMA, and swiotlb, so I'm no longer sure there is one
undisputable way where CC shared mappings should be added to the mix.

Has anyone considered a cleaner design yet? If yes, I'm volunteering to
help implement it. If not, then please ignore me as a random rant.

Petr T
