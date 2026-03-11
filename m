Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5930AD10
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238772; cv=none; b=p2G318QNWOsL6zZKh7z9DHJt3Dbj2Xma4f4j9ZLdCU0uEddg2mvB9WFFdQvLRStMozq2xwfbXxxuSv/u8VCgCHEX3PTZ4LWsR7UrjBKxPG6AfIgTGmyiEV3IoMdisTZdGxR02+0weEbzChHkXU6mH8hNnjrU0ymoV7jvhAGaou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238772; c=relaxed/simple;
	bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYwKRurnv53QVeiJvyxKcu4SoQ8EYYTaBmK15yvXM1kAQlGCMejjP+9qF4yJ86ATqsukt+Z/s0pSByr5dDyTSQ4vQGP9e6HIbBSzYxPRW/bsZgDM/KZFtAYI0Z83NS5KhPRq1iC0RNW/cCZGB25z2KGfC/Z9l1yewLKcLclqDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Cel83xcd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Cel83xcd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so40003795e9.3
        for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773238767; x=1773843567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
        b=Cel83xcdsGWWyndZy9319/MRneAGIyBPTcscEW862mz3ODg5fBib+D8+x0FGlQEFL+
         DWNSLjLjjYP6/QQT+3VU8rIliPZYVx1wrqTWRfyuu/t255gHOUIDk2Ntr/A0HQgcsbyI
         AV6s9oiZZQo+vmOjNN+JqbnwCkxvOTd29NEZNFOgPcbYGw+wip93lm3GzgRbOb5NFVfa
         arB2tLh6Fy/f6VOtX8uWGpWEEudibvhR4piFVCXjuTmYKXS/jLwXKAT6iA+oxjECX0zj
         ZfluohUXZkTg41zCyI+r8tSydif5IG54Gnlc3UY4xaVZFv+xVB2m/eVJSUBtOgZbKiEF
         8dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238767; x=1773843567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
        b=K7Xo71Db8p/d6NKOiraGujb1fFeiOPs26AqW1QeVfslhiUuU0n4fn5Ko4NpHo4mz3J
         9sXXWoXo9Pd/9wBfrn565xqKjfqPxEyZEngEa6Efl/k/CPU9lFy9XUuyH/MgulFbSMlY
         q1Uq1d4fsfRyyJrv0bPMnlWnjtF9KPz7A2Kwa71+muMhsuKeJbfneRtlB+aZGvaqwed/
         p0zgcaiQC7UgBqDKw0xPHj3H+Y7wnonIpYIp9dpwCnIbq/Uz7uoaSKLWQeEPTFfk/PZw
         6bzTogWJqrMNKsZxYcusraqZ062gFWEshj1/+zhEVXzILx5Z2Ox4KPZqgZiQRkpjV2Qe
         NHCw==
X-Forwarded-Encrypted: i=1; AJvYcCU2rkqr32YIkj0F2YkmqYkIa5/VyEKu3wZ54AqOqiWmMLFx+577VbBhEMrefDZIjfwrYqTmbIM8S7jA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ACdsWS8S4BVvjXozqOM3t9VIZEvaI/+mcKOYmRqem1wCG+cQ
	UV+jPH41kI8c7RYH3ZmQCjZS4SSFFulVthjpiEf5fZNPZyzWKixuEijxF29wZ6g86rI=
X-Gm-Gg: ATEYQzyjoILUksrnPtM/TucLGirKhElixWYJVTWz4kCyZIkiVgnfH6CI/yOEHpGVH4Y
	NZVVmWaelrUYOmII7KWCJOKvU0s4G6Faw53Yldb6JW9AKoAZ9rmW26B+w9rrcvnUH+Zi/5AtaiC
	PcCMgqKx+w79nEVg3DT2NL59aLk+PiYGlOUwTjbohrkeispDMCCYjiQOcbLAff6TzajuRA1RHBC
	dJeZGMkxVNrkuWiKgzwrqHcIcQlnMxX3A+ppjl/FUrYA1iGpBsZfigncKEmkh7+qIKPJ3Wm+KIE
	1PscCNKfvMDVChYiUOtpQZWeA95w1ypXyp6uEhWsfnOE/ZDegt3E7WCwuK5aCyvX3oBnIC4UpTH
	JMnzMRTfQKS5rOOrhclsNMgYCmiNgplcZTRIdD14B/+kzg8JFqpaBdcmwJkoDxAqt2ApzsAJPF8
	rkxSiiYbWvXtlPOQ3abmHiXcrhL53qT1hhZOndJ06SGw==
X-Received: by 2002:a05:600c:4745:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-4854b0ae77bmr43456195e9.2.1773238766811;
        Wed, 11 Mar 2026 07:19:26 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm162608305e9.4.2026.03.11.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:19:25 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:19:23 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Petr Tesarik <ptesarik@suse.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <p52ohr7pqtpzmwdpwzfwmwpor3wkop3quwxmq57jopan4awwav@5hhcgsskzgu2>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
 <20260309131736.GK1687929@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309131736.GK1687929@ziepe.ca>

Mon, Mar 09, 2026 at 02:17:36PM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 01:56:10PM +0100, Petr Tesarik wrote:
>> I don't want to start a bikeshedding discussion, so if everyone else
>> likes this name, let's keep it. But maybe the "_CC" (meaning
>> Confidential Comptuing) is not necessary. IIUC it's the same concept as
>> set_page_encrypted(), set_page_decrypted(), which does not refer to
>> CoCo either.
>
>Frankly I hate that AMD got their "encrypted" "decrypted" naming baked
>into the CC related APIs.
>
>I'm not at all convinced that they "do not refer to CoCo" in the way
>Linux uses them and other arches absolutely make them 100% tied to coco.
>
>If we are going to bikeshed the name it should be DMA_ATTR_CC_SHARED

On the other hand, the encrypted/decrypted helpers could be always
renamed if it makes sense. Better to perhaps have DMA_ATTR_DECRYPTED to
have things consistently named now? If someone renames them all in the
future, so be it.
