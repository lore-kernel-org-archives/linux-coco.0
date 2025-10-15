Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC1326D5E
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530537; cv=none; b=hyA1e/cjIGZ4Oo5XHVh9AmIAPqudRYngg9Tc175VrTV+U5SdN4jUEe2QpyNjGypHzisxJFk5tiPnhf+njVJX8PI7K+HlwtydC4T4VpWQ3gpyGxICP0vq4E6koEELTC1AbTipxeH6c6kt4YkceTVE72U0FInSk4Wy/k7qHYHGlVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530537; c=relaxed/simple;
	bh=mjHQrbbDrwX6GQ7o9PGjEA7im+oTQeT6k/wmhYoPpbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQwKSVKpvLlWU5q2yb6/YrIjHUkQT7puCjkPtweuubKVHp9tU3q1yhzgg+2++mpFxoonGHk2EAbu1mSwgNn1/aHNa+cGuber3rzcCajYDy0OmBSIxppNYRt6YH2XapiBy0GIqNEfyIJU+RhKa3/5SXNDLUGK/IYAzIB9dLcvg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=legGRLvy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="legGRLvy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33082aed31dso6742313a91.3
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760530535; x=1761135335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3fPSrHORtZHq6E/vA63d68c0Rr3vVgkT2wP5kavB8E=;
        b=legGRLvyGvPgShmHNxzyKaRVIHBNwOwepM9ggFet9w9QEtffSJGEmFhKqUVTZ2Np9J
         7G8HJufFqFmODiLqYQgBqNfr7Jj+GBGtnVmRp9YcUsnwfl1+OK0BoqSz4seds59tTLxL
         bSk4QCswcRDF5E5gIYN1x00zGa6M8eFoh+rkpvqoRIRoHedRunkzsM0fCwXI6Fp4MV4W
         Dy7M1IH2iLtno0Cx5wL+bkLC7OAnlzE7AT6yp2C6ElIggGPq+JMjtwjMc3dU3KFzZNP3
         NVv8YX2lotAdEaMx7VdBe/y5ebLaMXVI0mRSQKe5k10jh1hlZaC9tUED19TngiJ0qNFG
         jfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760530535; x=1761135335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3fPSrHORtZHq6E/vA63d68c0Rr3vVgkT2wP5kavB8E=;
        b=IU3M8bUa5LQHUgvGEaKp4M7Fz0n2Ze/1NYtGgajQv/Caau4pSqauZEj+Gbyet3MFcY
         6fY0Fxtr52xpJ8TZDh7wGd7a3hFkoQekba14JqXjlfIh0cRsbKtNtZou4GWzTteRdfqy
         Yo/3+IEOnxI8kGLaAUs4B4eRwCeCOCXB+vv1VIIzPw4wac6NtEwsekfQkggErUmwdryb
         8xx4UU5zhJQFrGCQRFSmkcwXyikiH0Wpjyt9AzF0o3aLgAnYCd5zREH1hbVuzLLPCiOZ
         deoM/lLshjOdEvhiDFfgnMXNdn9+Pt1EoVE0kqBD3Q53LDkdEnj2GmbpeUFxH29894MC
         p0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXGunVFs06D/w7D5OKVZJy3R4v+sPWcWQWCMFO568M6+WCIPgnQihHePe59L9VgMI1MH5en5Bq4AsfZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwIJEpEoy4qTjI1l3/ffUQpfRKiKAIbuni42IyNM56Y9Zea3emd
	gxD6D2j0fn1M2ifXq4daIrx6MYy7DHormGlChWaILQJHjX0g/42DxiSIwnJvkVrb8v8=
X-Gm-Gg: ASbGncus4M8Y9StfdfLRxW/cqlfeaDuzsHhZtG56uws5TwNHTgXuSKr8///2yQl4tM6
	pOogZqJoE9ubdNaRWgKUE+n6CbfL27luKItmjf1bdwS91PqgPogife20pEhQyr6RtSaFAbxVbbl
	2NyPY+R0uyLBKHsGvvD8rWEGDqnnKzw01nHx95UgxhfjCszcH2N6h8sgOCYOHPazPWnRrjFMic4
	WXgyYSunSblsGRpfiMyfSL6kzVvrIjJxnKsZ+e5Ew77khr1gh81sW+/g+pO4841vI8f8MDcYUuq
	YlvLZl0l0VMDVpF1H9QfM+d4zdNk6A4ioRpC4Y6QwDjydftRCkjSzr4nQntWWFADxW0xZtk0JPg
	6WRmc1MjEzIJHukwiweoPSgMTPvvhluhOrR3K+l0mwiIc8mZ18gsdwnNyYrBp
X-Google-Smtp-Source: AGHT+IH0oN0GQSOhSxcUM3EYcPBObyIHiYZ5l2qwqp0SzcDahjgm/x0qX3kZMHorNm24TIg/Rs94NA==
X-Received: by 2002:a17:90b:4d05:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-33b51118904mr41185997a91.12.1760530534910;
        Wed, 15 Oct 2025 05:15:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67d313e7f9sm6775819a12.12.2025.10.15.05.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 05:15:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v90Pl-0000000HOiL-1Vvt;
	Wed, 15 Oct 2025 09:15:33 -0300
Date: Wed, 15 Oct 2025 09:15:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
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
Message-ID: <20251015121533.GF3938986@ziepe.ca>
References: <yq5aqzxy9ij1.fsf@kernel.org>
 <20250730113827.000032b8@huawei.com>
 <20250730132333.00006fbf@huawei.com>
 <2025073035-bulginess-rematch-b92e@gregkh>
 <b3ec55da-822a-4098-b030-4d76825f358e@arm.com>
 <20251010135922.GC3833649@ziepe.ca>
 <yq5a347kmqzn.fsf@kernel.org>
 <2025101523-evil-dole-66a3@gregkh>
 <20251015115044.GE3938986@ziepe.ca>
 <2025101534-frosty-shank-00b1@gregkh>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025101534-frosty-shank-00b1@gregkh>

On Wed, Oct 15, 2025 at 01:57:38PM +0200, Greg KH wrote:

> If this really is a firmware thing, and you have a firmware device, then
> I am confused why this was even brought up at all?  Use a real platform
> device, with the resources that are needed to talk to this platform
> device and you should be fine.

I think the issue today is the PSCI does not always get a
platform_device, fixing that seems straightforward then all the
downstream things can switch from using more platform devices to using
an aux device with the PSCI as the parent..

> BUT, if you are making child devices that are NOT actually talking to
> the firmware,

This thread is about how to bind various subsystems to this shared
firmware interface.

Jason
