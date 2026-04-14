Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE62798F8
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169794; cv=none; b=GXQ/iYBGBwvnDxyg/QZWgo5SdAUnSGRmn4YtVWad/u9cKuZTXg0uYhUumeKeSk1ro+fxGT1PiS3K6NR5hQ+lwbPKgGr612prLCyKIeIZ3G36YuJkpjrJAd1R7yPOvDgeazKvS3qOPJnGD9M8t0KiK/g1VE5Asx/E2JDRNfSe7v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169794; c=relaxed/simple;
	bh=hQa0XybnuyPx7t6yGGg9fVWkSsuFAZQnGq1aB05OPoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emEl+zU84Oykd9C9sh8pJ87snm3GNjGpahwibmFNzcfVtyfhHAgt+/UjWSG+YXJK3eFWYA8ys1HBR45PR4KWzCXI73e0fsPmOWMfQzplBGdYyqvI8l5u0d2Am+To2fuh19GJbopT2chC1ugvpq01jc3Rj30V/ff+YYV9N33zHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=R3h63404; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="R3h63404"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d933da14f0so603633985a.2
        for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776169792; x=1776774592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJMqO/MtamYrx+eD9k7vgpIEFfxi+YyFS8+euIM3MYs=;
        b=R3h634041w9zZz7Rkrj0RokdUSRfjGv62KWB3Fr86iMleK0sD1w8CcTDwLunK+mrco
         gQ2vcB3Cat4FxKj5Vo41Hk255yTGui0pAmsJVBcNwHcWeD5H6mlp7PTRq7uIimfO8GXU
         qJLcTJJaBYv6Hds0tdAKBE1tDQ/OsNP6hA1xi0S0ILtV0lmP2uEbbWhruoya2bbLdwkD
         W2zViRyZenpN5U9bNQOPANXu2Ini5viV2DNOqrh5t0Fo+5s14q6gc3jWr+KgGIo9q91t
         OJ8pRbkb8SZQz/KYO2ItZ0E5QuA8bRdQrroqSjpj6V+Q+rbi4IOgASsP8v+KEJYwsPsS
         Irwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776169792; x=1776774592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJMqO/MtamYrx+eD9k7vgpIEFfxi+YyFS8+euIM3MYs=;
        b=CG0s68pozoAgIqYGbwkSkXEwCMvzB6Dm+ISD+TYuxbr2TcnWX1+yYLpiYAt4BiZLFf
         dh3adn/CkS0ZQ3TpC+PbGaiWaioIhvmK3uxUkzTA3dB99QXRD3ECt2vzfxeCq9KtCVfX
         HQ9PbDo0sshWebdt1wlOjt8WWRzEFTHtiBkmKHaPz/L3sTFun1P72lMhBliVlwPi+Q+O
         X3pVtqQxEfCpPPB5rXeK9q4gTfqh8+LvkDfT/uDFc0QWRiGDgl7aEUo6nI7dAFYhCLrN
         8q9vN7jKQhoTrT7wyrKctNeEQJ5z6WujunKWy4hfM5/SA2AxpNCUgNpc3QhTRCSnAjJV
         ML1g==
X-Forwarded-Encrypted: i=1; AFNElJ+2uvV2fQ1tqnL0q1xw6fRnhFnTwXta2k6RHogqzK6Wjf6UmFG8jZLtrA55LzKIEE67pi5jSyYgDGbh@lists.linux.dev
X-Gm-Message-State: AOJu0YxjX/X6hVg8/guBwbLqa1NeiDj86HSLAlmT+S8fpJ4gB+qcjec2
	iyMZm1UJopTSrZJQ/w19TTquUrzgBCeeSJz4obb08t88SW8ah056MnnL5wO68iH2ym7OVaS6jnx
	QEVEK
X-Gm-Gg: AeBDieslQkHQ0kWRupPdpVJKzeYjkEd6xc0nom2gcyb0gPOOMWN5B5nBy8taLMqXIzx
	/uV97TnRvqO2jr82jJr6hQ/tX74DKs7nz/m/bSeUiPRYGXQ69ue0jQSJyLLcq48GCY3URBrsBlV
	SB4CtD+0yCn1LpM7FCW0FbyEqY0s+p2Ov/4YxTzIKGyNR+eMkyVD3dfyddb/ir2KOTFcxPlI3iz
	9R9d2sx5TmtU1NsJ21Si3yOu6Gqix3Dc6efP2yrDsyj8OWwS/PGwiKl+VoLwn2PHQ+mX/sZ/mWR
	kYqt1njaGHlDdcwPV7Q3x4wyGqZxHgA6hU4lnTPEnUdCDKnt1QNmaxhsBnL7sbjagZEjcPPZ1Lp
	Y86hLS0Y3kSkGXcbDCXRRoNXCE6YrDYum3i3HXm7gWvXLI7jXAKok0gzLbuh8NPWdOhdFuNTbmb
	2FaoW/UEWaR1B+DdFMm16kwajdTtgYYTmYskREqLoplRjEjKyWdQI7oTTtuQ0PZGTjtQwkIc4vh
	h2jXXA5jepokyKl
X-Received: by 2002:a05:6214:5504:b0:8ac:b46d:8543 with SMTP id 6a1803df08f44-8acb46d8cccmr95904756d6.9.1776169791555;
        Tue, 14 Apr 2026 05:29:51 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb0474sm121526396d6.40.2026.04.14.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:29:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCctq-0000000Afc7-2XTs;
	Tue, 14 Apr 2026 09:29:50 -0300
Date: Tue, 14 Apr 2026 09:29:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>, Dan Williams <djbw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, thuth@redhat.com,
	steven.price@arm.com, gshan@redhat.com, YeoReum.Yun@arm.com,
	cedric.xing@intel.com, Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260414122950.GW3694781@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>

On Tue, Apr 14, 2026 at 11:10:51AM +0100, Suzuki K Poulose wrote:

> > Isn't this also sort of incomplete?  Doesn't anything serious need
> > signed measurements? Isnt't there alot more data that comes out of RMM
> > than just a few measurement registers?
> As mentioned above, this series adds the support for Runtime Extendible
> Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is
> already provided via the TSM_REPORT

Okay, but what actual use is this?

Extendable measrements with no log
Measurement read back without signature

What is the use case? What do you imagine any userspace will do with
this? Put it in the cover letter.

I don't think the raw rmm calls are sufficiently developed to be
usable directly by userspace. They are less capable than TPM and even
TPM has a lot of software around it to make it useful.

Jason
