Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07B39182C
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134707; cv=none; b=qXBOmdSMO1IlMoN4dewsEoTRvG8r1kzQ9t68dfZTSegEXEocr47qHTA/6wb+A5VwHXhg8IaWdFQlhmLHGOu0jhm+6+nzJ22Rep7V2pxLR7nZuxaDxnyjVHyUzT/eBMRvz6WoXJonkUomu5ub9XTiM2izP8UpzNgTd5L2rD7i0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134707; c=relaxed/simple;
	bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKb9e+lozVZBdqzrNe8TuQmZEuPeJi5mgnT28J1ct7ccfd9GrxVbF24Gal/wbkH9IfY5d+SrDV2x3r1zDHDCwJ/3/BVY5odHq0T777WY1vujFPl8jY2PbgJAD1hP0v0l4WNDK8IxYZXVC4SK4A59mHpdqEDCpkS5RsUOG64Rgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Q18IMElE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Q18IMElE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so7093425e9.0
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1775134699; x=1775739499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
        b=Q18IMElE0+V+sBv9VWIPtFM6ihKsjM8slUqWo0zGE2p2FCNG1kBhEii+MsFtQujzrm
         b7AEPXN1avE0BrVD5dfCtgr8RWUHQnPjdK5Pne9U6KeXMIVivuWFTVzWVh3X+qkFuF5a
         Ia2cmS8a77bKNbwdnNfzxuHR/sYiU0QJi72vkEJ4IhqOhb7dMG6gzO9ef5yzMdiodq3U
         KfDY0PDlF51nsf3lJRgwNg0njddB5AYRCKdKs63HrKPCwDViBMYcokOkEgI4I4uif0at
         M8S9jkN+I1wttd2LzRJSVXl9LvdoBIQOXPJ0eScET8wWrQvjeVmoz+9alucd4/ggpVe7
         rNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134699; x=1775739499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
        b=C2DR12dvMsk9wQgGp9dR3xDa9YM35h3x96JbDjQwvsR9jdgvABqIZyerPfTB/+m4Bw
         ZXxTPKwtIvf7D8FzpUYwivLxlXd8sYCvE77RvNwgnXgLRKOkT86d07CBvk6GFfIZsq0/
         PKKof9Y0hqMAFQa8iecQqC2zWisEG3CKQGtpoBDocQq/txckCkylWWXMXDYEE/nRt15C
         ABDt0bIgy3bsfkX2vJXFM5wNxKHutxcIjBIniPMmhIdLaUjPHcAZIhFHJbrJXvJgvhPT
         JJ8nZXPTFLddA/9rd5e/zyV9eDcy0qrbf0+Nr5RPzlxEQ041u+qwv4PjmFMhoTbpwZl+
         admQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+6Hc5JhE/3R/VK6OEC5K6EURebqslvTXcV8T1snsPu7sRTKpvemRwarHiX525vlk29mrIWIh8jSaw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5PUzKlwNbf2QoQJTR3+Ewp6QtwzCvybH4Uq4bT4Litmjqqbuu
	yTXxYXNLzqYw0gLrQgyhlV0cubLIFWj2Dd4V5fEmq8TAAQA86iY6Rwne1/1vGb4hPl8=
X-Gm-Gg: ATEYQzwfW7s+GvAsp/k32Kry97rWsUQbW4DgcGAHaLHPC+LtgRg0cPpGYESfVwPuVOf
	fxvpIZqwFFxxPSkOybkzj893duZhSWUP9jrbSXqmO8ezhrXywO+BltROcBvKXOTpBMnsQszbM5O
	t30KAKTTjmxy9PpW+mkNCE3GYCFUxMUIg/bZFmuEhzdWOWUa6oZD+pRS/tVcvbwqK8k6+Wo8nq9
	4jc+0P3gY5WvASozLXKCbyjqepn9nC7v5KQ3+S9ve2VRe+zSfc06aflaWQ2htpD9hemQpg+YVAM
	zQ6Ue7aaUQqn4PF8sztvwfbP1kjXo8PRqRLIRzbdsCKSd3jzcML6LVdXTRXOoCEl+9rkEJKjb23
	3hECVX1w18x1LWx6EZCSGM8Bd0MZk2ZgQxbqo+ZArmt/0vzl8Y86lF99+qvRxGDUH4atPZkPD0K
	5lC44hHprcvQsBrnGk/YTTCgzSLUWjaZeFTbOpGEV6kA==
X-Received: by 2002:a05:600c:1f93:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4888b7130f3mr58915525e9.12.1775134698707;
        Thu, 02 Apr 2026 05:58:18 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c884f77sm62829225e9.20.2026.04.02.05.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:58:18 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:58:15 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev, 
	nd@arm.com
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <l26gcpagdhabj6w66hhxzgwkwqlybontqtbf7f6lu2fic6pnu6@crh3rt3j3alm>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
 <20260402120254.GB2551565@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402120254.GB2551565@ziepe.ca>

Thu, Apr 02, 2026 at 02:02:54PM +0200, jgg@ziepe.ca wrote:
>On Thu, Apr 02, 2026 at 10:52:34AM +0100, Brian Starkey wrote:
>> I'm not clear why the heap depends on !CONFIG_HIGHMEM, but I also
>> don't know anything about SEV/TDX.
>
>It is because the CC apis, set_memory_decrypted()/etc are slightly
>mis-designed. They take in a vaddr to represent the address instead of
>a phys_addr_t or a page *
>
>This means the user has to use page_address() and then the whole thing
>is incompatible with highmem.
>
>Which is fine, highmem and CC are never turned on together.

Yeah, I was wondering if it is worth sanitizing it, but decided to be on
the safe side, for unlikely oddities future may bring sake :)
