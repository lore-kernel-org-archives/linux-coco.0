Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD626335547
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714854; cv=none; b=Aki4eLAe5e/Ss1xBkMoRZ71OoiHx06ZRtznAscWRuapBSSBY3vovFHO8HelTSoFf10C3T9MsDM8GXD1CvHcvvI1RfWAubcs/C7KlRjVP56K8p5/NxmCnHT8KJ3252Lc7s70WLmhpP+fCRFJsdKhqF62xPU9LwwjB2HQvzz71PCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714854; c=relaxed/simple;
	bh=Im/jU7RCioSZNbpD02PdmSL3wnBPuIkU8iFeJeFE1d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2H+JVD2VMUVhEYJQoH2BLCvjnnITI75YVCeLiJjoiKhFAVpQTp5ZL0iFb+aTYv34rmcgLPfa5GjBQhKT0HMXvlIwdZyuzfEIMHEIDCOruzkrRzFDKtMtGrx8pw7nrWscotqpgfEthL0X4fD3gBc/t8RF+gU+biBWzRUvzeRfV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=hCdQ/F4M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="hCdQ/F4M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so44503805e9.2
        for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714851; x=1771319651; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
        b=hCdQ/F4MkvtS50cLaKMetjmG9oba5eyQ7ndxhuVdOSN2Boz3zEV737dJcl/pZo50Bp
         epCCjXprrzX/zppR4Z3BReI2n7L3LwF5LprBAJ3GoppbyisOonC+OIPW07iiZVTi4He/
         aH9lT+Ml0kKxYOTKPSKLaXa9w0zqIhrZBI9+xyetAGNZ+FsrgtNMtRDPakZbR4DYxUyD
         6HHQCDdnMMX1oPD2IfPlOXKDQFxI1Pny2QroPsYFVGidcXnC2XIevzNrBzIVTkseUw9a
         ZHqFt4+gTd6+ZAsqOQNAqaJuNtl0mBnGMz8E5ob9SLKb4/Uc4DPS+jenrni8dwnSHcBO
         aztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714851; x=1771319651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
        b=kZyhIFATwGoHjZaBBKmj9htTyxepJUfd4baebDZYVUO0iRg6hnsx0yiMiwAwSB7J6+
         hh1rK1Zl+DtCnXrJ0R09fmLS2+xyO0Ra32yLZy+5II+mWJlkUj8Ft1ZqKwCimIl0aUb1
         ZCNdaJmGqQh3rhjji6+fQeXfn8rTszPpTIsBN+JvOFTqn6EVaivN2ZYDANZdx2ndzmco
         PZkusVsBT8G9Wr9gLRRwo26PS3QNHUD8lSfq6xhckkrfjmnajgHv5xqQikBj0kIMXS49
         mimK7oD8Op6C4zzxFHjIleVRb0zHZGFwJ8lS9sMif67DxkF2YEc7laJaWTbZovSMfTGQ
         /vXw==
X-Forwarded-Encrypted: i=1; AJvYcCUpVCeRBWgbxI2XAwP3bVIVZgC0QUnHEH1Ig9vk4mA2VOqnpbsrne7QGmFgeKIV+I/ySFYx559Tvs79@lists.linux.dev
X-Gm-Message-State: AOJu0Ywus9kndaQlET94YdEQ2eZ8Fg75ozv5UPB1to27YtjjyghtUSP6
	QFZGFp3n2HDCoaNaBEGcodI8kYhjM1EYPF5XFMVi2K6kIShlE3Bf0XvFvpYPRbY0PWQ=
X-Gm-Gg: AZuq6aJ2gavnFFWwnBr3TxaIxFbawh0D56y4i6NQjaSZRNyoBG3ZgFnvKPELMyh6RqU
	TcjONVIXlV56RMP6fwXYH4OCKhyhZhr5OD6oIL44qIToyyLH3DsdhLNMK944qo/UVCvkcRIY4pT
	d4Qvg3jIE9sfT2z/NYCJgCXtHJ8lzp7xaeZc3eRqns8G27fGF/RMpJdbHepZj2krhOj5O6dJa+d
	hRKvhGC+WSctSC9QJeWDeL4OtFjz61kZnOMWTBIXUPwM+/WbuMdw/goGHcLo/Q6T+D7wept2gTT
	M4BAkOupmti4d5YvgB/ISKfJ7xsCLIIGM6QOd9IG0YkHGz91lTtjfKmIDd4q0qPC1CJnlL+tfUz
	Dli/zoY+klEjSkvwSiJX6zSoJOatIfoosfz1Ats4e6cGBCmamTblPIMQtF1007xQEBa6L03vY1X
	M0DLlbDzGzh+5fB9ddo2CNXl1roMwcEpwj8mU=
X-Received: by 2002:a05:600c:1daa:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483507f08c6mr21095375e9.14.1770714851014;
        Tue, 10 Feb 2026 01:14:11 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7f1e4fsm61726245e9.15.2026.02.10.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:14:10 -0800 (PST)
Date: Tue, 10 Feb 2026 10:14:08 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210002927.GC943673@ziepe.ca>

Tue, Feb 10, 2026 at 01:29:27AM +0100, jgg@ziepe.ca wrote:
>On Mon, Feb 09, 2026 at 12:08:03PM -0800, John Stultz wrote:
>> On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > From: Jiri Pirko <jiri@nvidia.com>
>> >
>> > Currently the flags, which are unused, are validated for all heaps.
>> > Since the follow-up patch introduces a flag valid for only one of the
>> > heaps, allow to specify the valid flags per-heap.
>> 
>> I'm not really in this space anymore, so take my feedback with a grain of salt.
>> 
>> While the heap allocate flags argument is unused, it was intended to
>> be used for generic allocation flags that would apply to all or at
>> least a wide majority of heaps.
>> 
>> It was definitely not added to allow for per-heap or heap specific
>> flags (as this patch tries to utilize it). That was the mess we had
>> with ION driver that we were trying to avoid.
>
>I don't know alot about DMA heaps..
>
>On a CC VM system the shared/private property is universal and applies
>to every physical address. Not every address can dynamically change
>between shared and private, but every address does have a
>shared/private state.
>
>By default userspace process generally run exclusively in private
>memory and there are very few ways for userspace to even access shared
>memory.
>
>From a heaps perspective the API would be very strange, and perhaps
>even security dangerous, if it is returning shared memory to userspace
>without userspace knowing this is happening.
>
>I'd advocate that the right design is for userspace to positively
>signal via this flag that it wants/accepts shared memory and without
>the flag shared memory should never be returned.

We can have the same behaviour with the separate heap, can't we?
Userpace positively signals it wants/accepts the shared memory by
choosing "system_cc_decrypted" heap name.

[...]
