Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8AE39E172
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714421; cv=none; b=T10p1f8bP8V1jez8VQ8E4yl+vUX7FakX6amq6npswdghwPxtAEQ+ukWVImI9JMajU5IIWSfPyrDeIBufLWhlyZ1i5UfT8bDciQXMGnLc8bxsXAI3LxX69MgGzM3DZt1WJPgurrueFJ8zHVcAzTqivzd3UTNEq/2D3SHt5YjXdFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714421; c=relaxed/simple;
	bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvrnB8FHH3aupQYdgH4TvQqAiynIiusVGQtb/JzX9p9GLusN9o9QkqG98OMpCceC2Ki7b2VDLr5gbPpEBAeJVV84kWPCUz3mxeZWNQSfpcmgs7FbaIqaDhAkqsMoWPveR2bG1mbCXz3cpEFC6ADogGc9mBYDQDJmFKOs4yUfVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=pOv+/2RU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="pOv+/2RU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so4849597f8f.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714418; x=1773319218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
        b=pOv+/2RU35bJrOFIGfg6h/pv3HESCAgZcaod0Cix/Cm4J2JnAYfwbr8/TRx4bZXCIY
         Pqu9sz8VVGYb/sfiI3snqtWl2NebdPy9GbiheC1VznwmqS8NiBBj5fbvKgZHW3WhKyi8
         n4xG2ZD0KxEx3iLc0mPzJeltKB6d2yu/8kG0+MDxnt0kv3y+6Ldoi8dfsHo+ZbsBTl4a
         lFq54cdp2jzhCxHvp5TVW0aHiRSzFrNYWiHYYPTLh2DBY/qTfUz5vvv5CQVQJ60+Uc26
         AfBp/W5uGLzfxvuKAKI82QJWjl7FklW/5eJ/zCPXsSaw9NktBUAP6Pu7Q6zH6VVVJuJU
         vDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714418; x=1773319218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
        b=l8X68PtVuO/sx9Xj//xjJxZKex5JYM08QiK0lh8fzRhKeMAdYidch4J6iuQxPGXJlL
         NFyrF4VV5rkKClnysisEiR5TLErSUwbzJYLzrLCGpAfZzCxCQNYlmMFILHtAUqVd5t6I
         l03vwbH93sMsOLB1hYc9jaXPCZBXJvwRsgEVpvaCf+MOZttqdlYKH6dF1MmBHF2QwVrK
         2OsOtdxfOmWlzHsVxjwz4BFpF/zZYSEJoKfZL+A0XPvNcHvVEKVDU/Db1QiczQj5iytl
         K+Ah0jZelLmn0uESWeA1bUownLzfTxKohrnUVTauY3prZs7mgiGgnxqIBcpsu+9/UEVc
         LC/w==
X-Forwarded-Encrypted: i=1; AJvYcCVnIUqA43fGXpU23kFIwiKDuOfg5kIWY/xHzcXoARGLhzjLW+ZuHr5/Qnj4JE9fzrR+Zizg2KRGalWG@lists.linux.dev
X-Gm-Message-State: AOJu0YzGZHyAUVAZKl92GwnP/x1LVC2cS3lblG/hpcfKawAeToL94ObB
	qiNv66hex/3Fs3/9TY1Pv1MBP8Tv5izDm8uiMeK6ArKxVwmbv4a6RD7TuTYyk50r1eo=
X-Gm-Gg: ATEYQzytM/asTJMRLUE9jD4AtumOOULKhvY5NCxW6N1akDSB0tIZGkAhcR6kZ5B4y6U
	NaVkWVntBcEvyarzCYTuT+otcclH44g6gzNe13AuD7IQRqoBnN0DHgJVR4LVq78bRiiPGmUYR0P
	aNpSg3bVkTTV3yzzyxAT8aHg+vp6iXwMRb1EK50jeI7yGNTDG4PRtjvhSk2XJEHs5NPjZhT9Aqw
	jG95oCgICwRdDMiqiSBI6QIxqw2eA9IIH+0gke5UFqTWEr/+96YttoPgwB0R72kfKK2SG5IyDIn
	8gE4GsLgbfYTIIHzBarU8hJttoHU4/fes9/Wiu2TaXdvYFA1kBV+Bx123WgOdLX6NwTc4sO9FPU
	N4TOjrH5ZLJzGf0GdHs7Nx4S8PFIphaoArQc+iKbhhBegm4Tg4qxOHAJb8N1yev/0JImdQ5B18b
	0qmb9N+M6XXJNeEw+7k7T7Zdk36TAmWnI=
X-Received: by 2002:a05:6000:2510:b0:439:cd10:a1f9 with SMTP id ffacd0b85a97d-439cd10a224mr6376565f8f.54.1772714418526;
        Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm33480811f8f.25.2026.03.05.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Date: Thu, 5 Mar 2026 13:40:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <yyb5ozsxnfcuzo5rzpg64hgj4rtxz6glpqf5fpkhp4zrwdgted@izdksr4b3vte>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>

The "net-next" in [PATCH] brackets is obviously incorrect, ignore
this bad string please.
