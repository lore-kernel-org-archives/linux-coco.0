Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2C63CB
	for <linux-coco@lists.linux.dev>; Fri, 10 Oct 2025 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760110253; cv=none; b=FE12ys7T8CrxY7KoQ8VI1Z3gQH37p8XMA8zib7OAcKVhSRcfY9YT2MtL6F9LaKN43brc24rGTS5M46ecpgFQgIQeYWuTczDYsAVzVfXQKA/asIPDkztpjQTdGQJcgz/ag+Ith0jQjCuWvvr1OxbYM1GUwxb3zOeVwf8WFvRIs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760110253; c=relaxed/simple;
	bh=YweDjybfnRXAUjAFM2cXyTvz7RwWQP0buSdnlIEIdyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRVhFZt2IbCi/7LcrEm8M3P+kwc4pso0s82Txi4kYHnjqq8ubzxz2ST+CF9DiVOKrHEIDXk71V8du80fb2m/dSOEnhvoQGUSgj9/b5nwyU+cBbWlhQ1PlqAymVkUlVKd0AwIG1Di3r/tZG4zayByYlW4HI7fm7xKSajsJr+84GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PQPtKv+j; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PQPtKv+j"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-78eba712e89so21159576d6.3
        for <linux-coco@lists.linux.dev>; Fri, 10 Oct 2025 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760110251; x=1760715051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6cOfIK7qdN8qKLRMhM71lR4Nf+xbZ2+eVm4l2+34ic=;
        b=PQPtKv+jhKJnsU56kc8g8p16eP2hTmBwTeQ18guuHsdT/WOF4nd4n4EgTBhSqtJzpO
         4DeFnRfmdAnxpuM47daEZa8vMgC1Vh/1+B/BCSHRoDiQNaYEe/0exuFnEHdq2ME9tkTF
         P1nHnxyK81j956fVX1Z60T9slh4KsbDCEw9vOXPzm+uph+IM98PforP5Q512L91fApwe
         K8pvNpfo5X9zKWbKdiDjGOEbUCpWDzxY6UUa/7xpaGrEeQLkQ0ZWrSeTHZYbbS+Nk5aS
         QynG9E5U25Ebu3F+ohmOTusqtoKb8qHgOJ1qMxqZuNSOvdqB2FvtOGB/PrP1ojVJjMUs
         OAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110251; x=1760715051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6cOfIK7qdN8qKLRMhM71lR4Nf+xbZ2+eVm4l2+34ic=;
        b=sq8N+1Wg1eWzFCKXg5jCdjmzwY6LaxV8mwwCWb4+JQ2XRXMjl6tPS3p14+1kvRqTZc
         0xHiNGygaXmlf4d2I5CZ/cYgM4q2xoH779yxMSSr2XkCCnqIHc+W6K23OirCyV+j1b0g
         WcaRgW53Tk3wa2pnBCdOj+nnqTvnKSM3ScDokWe0FVOLfCZpkvG/UgEesenKt4bJmpEc
         TIfLmLUZdaL4QKTtwQpfiWbqLH+JCiGfDtpgqwJa8dyq/2El0wgRcmnkwUK7a/H4DZfS
         +e9jlCN+3U2u3HwQ1YUnhL8GxjBwigoBxpsyEt6fAJiGYacNExnTqg4tGSmRdO7rtiMs
         oSCw==
X-Forwarded-Encrypted: i=1; AJvYcCVwLCSmTV4/5InFC+llD0nJP7cjOAxHhmvzRLXS5s712KOsKxl3fIXVpA7gxWSZv2MA268X3JT66eD4@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/UudwNZ+QrwgaJr6gpPsUel9yp39PLUeFhcpehoxulog68XNw
	/ReZqT0xUtPeRYppuT2shK9Y/ezL110n62uj4F0eVpMG7q/Xai+wMMdCVNTPoTjyvLA=
X-Gm-Gg: ASbGncsgmaWla9ixsy3LGiYWJf83DH+bWOIMnB0/o7qdEbO4AgNMl/4FRq9rvvFZVyB
	CME5IRYPeWxj76D0aGGjRXvZb4GHJ2Oj8pFShCfg+HxrGJIf927zPbalKxqlW7umbY6DtcGWvlk
	Wjw4/VcuBQWcBOVEtGfjYQ6fCZf3mjjzXwf8clV3Rzt+QezeW56pt+egUzfDOJk+gTBMKHGrEUw
	mEbIZIrewFaKYR7wlGCrG2ioBG8NxR3HyzZvMm6rwjJ80FJdEKeE+zETOJt7kXguo3Guf1Wo5ro
	HnkWWCY0Mv9RRUtKJLN9ySai569e3m7+gigGpKtJxDdRD7TY+rvAbiq2OhxFbJNzUii1YMGjLj+
	8hxvJ/TGVFOGtE7HrPh+uHT4gh7wJRD/0+KOAlF5UzY8398Mu6QaVBaIctumH+6bsQV2gklrdru
	SeJ9EBFmMOOu0=
X-Google-Smtp-Source: AGHT+IGgKhRm3oNF4ALMXNjdHTaNK2zfI9rzl46bTecy6J4CNJ6lSFvDvqcPlarS77J3/CcjSy9rWQ==
X-Received: by 2002:a05:6214:c64:b0:830:5c6d:419 with SMTP id 6a1803df08f44-87b210728c4mr182061246d6.4.1760110247638;
        Fri, 10 Oct 2025 08:30:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3570c1esm18187826d6.40.2025.10.10.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:30:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v7F4w-0000000GWAu-2XWh;
	Fri, 10 Oct 2025 12:30:46 -0300
Date: Fri, 10 Oct 2025 12:30:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 11/38] KVM: arm64: CCA: register host tsm platform
 device
Message-ID: <20251010153046.GF3833649@ziepe.ca>
References: <20250728135216.48084-12-aneesh.kumar@kernel.org>
 <20250729181045.0000100b@huawei.com>
 <20250729231948.GJ26511@ziepe.ca>
 <yq5aqzxy9ij1.fsf@kernel.org>
 <20250730113827.000032b8@huawei.com>
 <20250730132333.00006fbf@huawei.com>
 <2025073035-bulginess-rematch-b92e@gregkh>
 <b3ec55da-822a-4098-b030-4d76825f358e@arm.com>
 <20251010135922.GC3833649@ziepe.ca>
 <4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com>

On Fri, Oct 10, 2025 at 10:28:36AM -0500, Jeremy Linton wrote:

> > So you could use auxiliary_device, you'd consider SMC itself to be the
> > shared HW block and all the auxiliary drivers are per-subsystem
> > aspects of that shared SMC interface. It is not a terrible fit for
> > what it was intended for at least.
> 
> Turns out that changing any of this, will at the moment break systemd's
> confidential vm detection, because they wanted the earliest indicator the
> guest was capable and that turned out to be this platform device.

Having systemd detect a software created platform device sounds
compltely crazy, don't do that. Make a proper sysfs uapi for such a
general idea please.

Jason
