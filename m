Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C853A7831
	for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456164; cv=none; b=lqgmB0K9Z/l6v7gQebDfdS5vvfZdsTMY1Hg6e+Hq3PMcuiMPB+bEMpSWlhy8LJmdAX/x6Cs28WV/mNppx+adyRIbb3aqlI0T1dPV+jersYZD8P7CswOKrodCDa2Tjom1mClbL2Iw/CbN2k3C4cuIYptHaRDhIu0op1rDbMw+ujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456164; c=relaxed/simple;
	bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCweD91rrsccHJx7S+y5RU5Bgc09kElXymSm+beNNXrmSgFv5tEh8Ut4rFC47r1FY7NWTwADcaXl46KVPI03WgH+rBSjuPGAU15EXqaefyRkwHr0QcS1nSDZwBMTS9B4FvaSDkfo6iUh38TbzO+8nLln4HKR8gZC9Xu7dDPC2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KuQeBvmu; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KuQeBvmu"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8cbe69b122bso31916066d6.2
        for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779456162; x=1780060962; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
        b=KuQeBvmuWvM7kAhzjUPlSpFpXBFD2/RtdfGW04AwkWlE7KlatN0xLDxX06ZscJ+4tg
         66ROWKqm0WUDxMHzfC6PJzTzLrJI2wio1Xr22MzU9TKSQrrwdNNyZJy5Kguu8C9Ue8sp
         VwntvmUmXCOH74+gDSq2aVN1ZvCmu99VTZewyzh9bJ2H8V7g5JPwGcKblYWKrhb+po0S
         kjqkw9FrusCwVHfhbraJiw8OMQAxhY2g2Z+gLxH4A/1szKsiErLkVm0wMRn/sjx4kjrN
         jKY17W2KTG6b/R3905hxVlppG6KDswfulrBUdRiqwkbw5hTJcFWD/zj70sDkFlheeiwz
         7cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456162; x=1780060962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
        b=IgDdt+aS48ZMUlCJMdRNjM2MzugRGTO4DbRp+dit5NIwq7gKoqBgSWRGwlXmR9IuvC
         s6tx7UUyXOdqOtTGwA9EsnyBQR62zJ2OUQ5jy0kBazA/k+Mv04anNOMeRhohz3gJvvPZ
         8MLlTghtqawkl2VhBf3Nznjfs4gUSMuBJaHkkQjxL72XFM4UphZYLhpC1PQqGaBHZeU2
         0EzyXgaeOtL5zmyqo+lKTKG3rg3L1xseubqM6DFSAHjJdxp0B/eyFyx4lO1bIDjqNTqc
         y1fxApMEkWr9bldBzruxFgv8vZkLvMlj44eQuQArh9gKXqCWjLnZ8FnYYvNXXu+9MSHU
         nIqA==
X-Forwarded-Encrypted: i=1; AFNElJ+oAO0ChN6Rg+ae0WD46j8ovBHeEUD8k/NyEqYiMQL464Wq0+GM+69OE7j9euJORyQ7BT87cH5nCzBh@lists.linux.dev
X-Gm-Message-State: AOJu0YzL1ApE0DYZHiJ4yzpcrcop5xJfaRYZFuBZmiL+IB0hy1gAlKdA
	KxwTRRrDb8YqilHBhkO5ipFKPfjXaJ/vbrBhbL3tAWjRdWm26oRUubzR+mo0944GSaA=
X-Gm-Gg: Acq92OHjJShWW68awxfXU1DNIMY+HTKJsvdw7j4ATZPDC47CarDfFaGNccwYgINyPeV
	KwkB1tKmqA7gzinOZh9OeDOQquoIn660/vZqhCNDB+1qVKOsW5NOOPjrhHS+XRhMXZh2jZ+H+9r
	Yiz045zgsCdX+xLmbL2KzbQElRjnARJRigoiu8X6pZjDeF0vaaN+hGcAtVlfcldkw1isxFWeY9k
	3ppeYG+lpJ+TU9JSdO8VvKf+j6b63D+yA3pETKiaXjze4ygdL1TF3C8E2DOuT+h/XvWG9QydCYG
	Jsr+ql/POWZltTAi5QQouzV4fs/LybZvylAz9v+pC8yHB/D9zeLl9HE4cDjbXs508OfZUUg3KJG
	fusDvfg7M3m+P2M5W7a3EPOYxuNC0Z92l8lyQNNPYenaFa3brTpSAaBwO01uMkNxHlGO623CnN9
	zN+TYMZNlH7sp61lKXOTU4F8CV9mV2UsQjad4064ykK+6zCzyTlyuUu3+pjZ+mJ7FE70nau1+JT
	KZ4jA==
X-Received: by 2002:a05:620a:a2da:10b0:914:ba0a:b62 with SMTP id af79cd13be357-914ba0a0df1mr206635885a.49.1779456161602;
        Fri, 22 May 2026 06:22:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bb8c7dc7sm116726285a.6.2026.05.22.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:22:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wQPpo-00000003hPg-2B15;
	Fri, 22 May 2026 10:22:40 -0300
Date: Fri, 22 May 2026 10:22:40 -0300
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
Message-ID: <20260522132240.GD7702@ziepe.ca>
References: <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
 <20260426130531.GF804026@ziepe.ca>
 <yq5azf1s6aic.fsf@kernel.org>
 <20260521175420.GA7702@ziepe.ca>
 <yq5aqzn45a81.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aqzn45a81.fsf@kernel.org>

On Fri, May 22, 2026 at 10:09:26AM +0530, Aneesh Kumar K.V wrote:

> Can I convert this as an independent patch with your SOB?

Sure,

Maybe you can ignore it for your series, the intersection of CC and
P2P is non-existant right now. HW doesn't support it. Make the DMA API
follow the design assuming this patch is applied.

Jason
