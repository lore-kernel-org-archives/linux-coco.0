Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0353EF670
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375041; cv=none; b=s0Gwx7PLYPmeAFgZCaVuy4osFCaYBgshsSUN4nlJc8btChpft6+2JHvL09Bi8Vw6Bg/M3wTVNSDonx821frBvwv9glDXDnZYPwR97lDjgMqOmu8GXcaQX8Wlq1SHTL460h3MIAOymlgnuSM4CGu952fo7NxFJInEb2qVVERtnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375041; c=relaxed/simple;
	bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgP0qz7ng3Bant6HiufhaLCdUDh15gx+kd5W0+K8i5O7DcrhNtRGIWICfACROyrv0NkBIMoF6mwPYyUURl3pMENoLm3hne3d/kXUcEnUmcnOkXNSxYtkY9ZeXgFcio84zm84fPHGr3wzp+YHCmqDZquMtyOLXaMjDupCZTrWBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GWhzKchC; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GWhzKchC"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89a05955720so65326536d6.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774375039; x=1774979839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
        b=GWhzKchCO4GHQ5HnWmYLnuMPpmJxdkYA7NyvpBZjqGKkIv1ntsB65lQIWPyj1kiF67
         YsCDpD4eXh/nBO/TB27LK+aFY7zgyvLq5QWZeXtu8WoQizGcODHWvn8PbxUwr4YjrFfy
         H/ONtaabCcm4OMs4mFbMZciWYi3Ql6FkE8nyuuHPyAAaOyixgDFFpBT+4rne9dkPPlit
         XBEqtSBop5Ej76Olszi4NlBZoDiPZHchI00qJ+EYoj/3ZtBVBzWVHYcdaxSkEHL9XIqU
         e6vcsfc4LlwjHc+61q7SupxhYL4XqgrlsgUUhAnNEqYzezCv9T8evkWtPwGet2g3UxXK
         fUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375039; x=1774979839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
        b=hbWY/NNtpHVqNx9OvFuJHykUqM16qaVcTnn35xEZmlx9HhJwZkZSSwzaxyH4V8CdAE
         CMkG072krJngmKLmnMCF079r0sQykOhKuW35wjou4y5fsYHvb4kAf4PUx1pkSFMYRCzM
         wpTeQVLL1vXfa30FlanD2FNLy7uJsKgkUFrcfBV+HjIqgbCkYsPttfCuPWgttooSncvZ
         PYjQCPyToU+bNkfQ2o2w7SfVIPMGZvRC8YGw2GBPZwDhYFUGe1NDZmsUbyjPwgEbpFvY
         qh+UjHLNVjEko409CnIszIYL8if8RoT5DIBzKLzHUPc20dquXTRMCNcgIN35ov8nyz0l
         Xv4w==
X-Forwarded-Encrypted: i=1; AJvYcCWBFR62dhsHBlvDsXNtur6hKSooFhnHFEKRFdkgng+3ANp8/D8uSV7wmHWAabBim/QuWvdGRh4t2vga@lists.linux.dev
X-Gm-Message-State: AOJu0YwE89NORNce1hsF7GfBE/0MXY02IuVy6JaGoqaZyunTJwX8VSqe
	SeQutbw7YJ55fkuno/B9+2x7/Pc/3iNE3b6Ht9KarUaheDs9Mk5vAucxAD/gTO5di08=
X-Gm-Gg: ATEYQzz61bGsnLfAbUkoGw8hx+URFpLc4gB9ZP3EzMHx1F0V/iGQH7m9pc12hvzosSL
	mKab1y7mV3Ks+5b/w3O4HQKO+xgRGOlfu8ePyKG/HoQLnDH2ycXUhFKwFnjK7M4MnjexTkH9BHz
	Mg3g/HemaKfLbffqlS27nTNZtVaAWMlZqEIa+jYcWqXt7XM9TO0ob2XewVIQIn6Te+WyO2uVyGa
	JfGgU9Dcb5mEGZvJ+B69tetjtnferJzuHMNfWJ66+hP2cKYKw0Wzrxx3q+n8URmjiCWb+MB/BGO
	hJzcY0amzKItwpGDrXa5YBqEws+nqgg6lX360KPG+HkVSflMgZdAA4+cqlE0hz0er+7kALETmE9
	sHN8rl7zHk4Q965K5o+bZSi3HehKyvCnXfaHKOo6hqwVp0iKxqlTGClHiW5KLADWQnvNV+nq7oQ
	ZERcgy7fpDBFTfqmUc0kKThnzLzRvGlChQ0ptGqg+k8HPc1oKy49uDJgrVto44tav+uULYNw==
X-Received: by 2002:a05:6214:4293:b0:89a:125f:37dd with SMTP id 6a1803df08f44-89cc4ace974mr7595006d6.49.1774375038919;
        Tue, 24 Mar 2026 10:57:18 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85251b04sm116985626d6.17.2026.03.24.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w560D-00000000Isw-1b4r;
	Tue, 24 Mar 2026 14:57:17 -0300
Date: Tue, 24 Mar 2026 14:57:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <20260324175717.GE8437@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca>
 <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca>
 <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>

On Tue, Mar 24, 2026 at 05:36:23PM +0000, Mostafa Saleh wrote:
> But it's not about drivers in that case, it's about many places
> (SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
> ownership so in some cases they step on each other's toes, and I don't
> think that will get simpler with yet another caller in this series

I don't understand how this can be, ownership is clear. SWIOTLB owns
the buffer, dma alloc coherent owns the buffer, user owns the
buffer. There should be no other cases, and they don't step on each
other unless the APIs are being used wrong.

> I am fine with the API design you mentioned, but I believe that it
> needs clear documentation specifying who is responsible for
> decryption. The code should provide wrappers checking for these cases
> instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
> everywhere in DMA-direct.

Redoingt how dma-api works internally is some other project... It
would be nice if swiotlb would sort of recursively DMA map using the
new flag instead of open coding it but that is pretty minor.

Jason
