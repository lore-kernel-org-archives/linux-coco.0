Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0933E372
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714320; cv=none; b=basC0r3JXzhyl1Cz3ddUA29WItqRpkhrSK8N/4j3es3sogvWH8VFu6Aqg0tevJ8PklVgT3xCauV0FZXL+Lavadks6vJxwPEmM7dvXtQIhuGlFbH4GF6qBwIxO9f4rDBjrxGbSSQ8fQ71IUsTgrj+kGaxraO3mxAzTaxH6YRqE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714320; c=relaxed/simple;
	bh=QhkVDbBvh+igrt5Rbw45wDL4NFt0q7ZuczXEzataWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVgYAau6M0KfDKDBjr8wOMC9vyC2ozNd0UIt3SyzCjwikh/uF1YdpsR+Y2sMisHnfxvzJJUa5etEQmv1LNGpgRs8FXKJ2IaXsfUK8cT+x8oPd2sv6zhGkvzQDUHm/ruIKtuny5hjZ7/HSAMGyggIKCl1O/NscHsiHgtQhRQ3ywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=dkDtX4uX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="dkDtX4uX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f2599980so6659795e9.0
        for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714317; x=1771319117; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
        b=dkDtX4uXrTSFoFT9G/upkUzlAAnbPUWWTbhjr7AxGZ58t4ToK5NGY0aR2NMHB3eQUv
         umsHJ8jOMuYEmhHMoBCFFLgLR8qqPC/yFG/e3bKNc2zReWfZdH13RgC9/iOTVHbOxU00
         xwPNVGegO7rU4bTWGI7NXhWEPWjyY+pTbG3bU/6Rz5zFBGLKbqrAxf5zmfcxvNrhAu9S
         7hoCOJJ6JDA9kZgVbOyOPdeZwD4S54XrHdgXELhZzWUCDeuoPGs9h8W5OV+B8rGEgcHs
         sa/S8RXvxvBfWQryIWf30LDQT3/JWNKUneQGOjUwNJENG04VOJ8Eo1X87ZCsWvX1biJI
         4Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714317; x=1771319117;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
        b=ek2GWvD5xOxPVC7z7BuG2cX/2cZx52sdFrJKJrxxKtt1e0eusmeV7E1McPJaR9e9jz
         adMTfH5+kc75J4URRPIl/3TU1Losefk2mw0Wn82KkNQecdFRfbjl4IK6c6ve86LdB6Al
         3z8HIIuznpDHbv+rZLVR+9N6Bx5Redn8ZY1W+5C5nps67IRjaAIeWwgk8KpKzG7IeurF
         PwVtNvCj0VMPNtyIVCk4PUBmex1gf5Eh1m9/eN0BOk5Gxr7Wxrf5QPLn86EprTJkBj0Q
         romRXIL6FqVsKNdBGXFuBCu0BWakgX9FBf6+MdecKixG81SkA9Fz9xQZ00ahh5rkt6+m
         FETA==
X-Forwarded-Encrypted: i=1; AJvYcCVkNVJZwOqGofaCOOD2LwtSIissGf2uzi7FojBrCn4/xrWGjBMsk/pdEus/t/6lzrx4GVyT2mV0Yg/8@lists.linux.dev
X-Gm-Message-State: AOJu0YyG6iuvVERZyiePBWzC5JzS9UucqDsXHzBFIwZisVXotVRcM0Po
	GbWb9/vtQEbasQY0xLbuHo087fO+yoKhnoR0XPnDntt7wNIr9vx6BlO5BMSL7MHxcOU=
X-Gm-Gg: AZuq6aJ2yuWzcp17caXBmf91hg7otrVuZpbi6i/HLo5NuhE7H9s8M5R9ZIclXk/smKF
	Sbk10Q0hTuN8duJjAV4LI7pEOIseFZTqLNTpUKgL9WSWgmdD9UJ3JWMy64G1UXlotdrHvUNLRAu
	mLxKMNRlEBi9b+uYrfdCCMinss5PaKF1XFmoREftvQpxI6XB7CGU+6ofih1TV4O5BpRNU+k07h5
	YG7IjfRscuEZa0JUSuYO8Mjx/HDX03LXTqDiAwOBFf4vLawNOxZM9trJZY9DDHmVlBGYD+mf/c/
	VtY1OCFVGmBC9flGkheZt5OmG+rCiaQhcWAtdLyFPuODX/ReehfoC0DiKDmkr47h86FOLgFdP89
	1thEzWpVNXSU7POFbEz6Z8CaK0KizYsGv0n8WZSSEN4GONsKUeyEmSAkoNGQM4L4pyVn4Pqf5mb
	mepiaZxVot6ohrAIyOVaywcI6MNOIRzyRrnEU=
X-Received: by 2002:a05:600c:674f:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4832022aee5mr181770665e9.30.1770714317119;
        Tue, 10 Feb 2026 01:05:17 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4desm32761634f8f.18.2026.02.10.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:05:16 -0800 (PST)
Date: Tue, 10 Feb 2026 10:05:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>

Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
>On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Currently the flags, which are unused, are validated for all heaps.
>> Since the follow-up patch introduces a flag valid for only one of the
>> heaps, allow to specify the valid flags per-heap.
>
>I'm not really in this space anymore, so take my feedback with a grain of salt.
>
>While the heap allocate flags argument is unused, it was intended to
>be used for generic allocation flags that would apply to all or at
>least a wide majority of heaps.
>
>It was definitely not added to allow for per-heap or heap specific
>flags (as this patch tries to utilize it). That was the mess we had
>with ION driver that we were trying to avoid.
>
>The intent of dma-buf heaps is to try to abstract all the different
>device memory constraints so there only needs to be a [usage] ->
>[heap] mapping, and otherwise userland can be generalized so that it
>doesn't need to be re-written to work with different devices/memory
>types.  Adding heap-specific allocation flags prevents that
>generalization.
>
>So instead of adding heap specific flags, the general advice has been
>to add a separate heap name for the flag property.

Right, my original idea was to add a separate heap. Then I spotted the
flags and seemed like a great fit. Was not aware or the history or
original intention. Would be probably good to document it for
future generations.

So instead of flag, I will add heap named something
like "system_cc_decrypted" to implement this.

Thanks!
