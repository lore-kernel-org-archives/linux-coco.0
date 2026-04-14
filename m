Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945B2C21C7
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173731; cv=none; b=uS0rzv/2EB3OCmL65yy9QKoXly4BLMqVwTxfUGxNExdSD/wkCYqT3zHnXXnc48cd8O60X4syrqiuOHX1vbTKQ42O6+Tna3Hha+xD2pZum3dFeQnzh1d1ziym5+Tycs4YY02tah9AGypV8Pn+Wx3LsPdMRF+1AZrzqeITaP60VdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173731; c=relaxed/simple;
	bh=cuQtJL3B8l1CAgHZKnCkSCNoAn818tD+E14tyFqikKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNlf96kUwA54NFv3HTigk4vaKwNZXes3LExxseqAAq23VTUwu30dW4LAEyUQyswh208BLZSaV7TNYngVYj+YScq3JoNnqcEAAvDnUQXnimRYb/N1yb4JF6gRZudmtP4Y7w1ygYRZNJrdyMk64n7mB3y1xtNR2xDZz5X2WKHk3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bKoexr1h; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bKoexr1h"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899a5db525cso43814976d6.3
        for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776173729; x=1776778529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrpH3O/UC588LGlyijfHqwmmf8Fc2A9hjyYsMCvb23A=;
        b=bKoexr1hsGYhmN/UP1BXnw2NiJHvdtsnHSMwruUoaRS+sBMalgq/wMukEXD2q0QZWy
         XZlc+zsz5+qI+emkSsN6px26AcKBWcenZOhx8XqjD2qG2Qp57oCATByyR2jBFK+jNaS1
         tn1XjS80/bByu9N3ASMqtJpfo9SmGCwij3BakJkeqmG2AGfplf6GAEfjGK9mqGSeimrR
         VCBKFJ8I782BBlzQMbgO9/jlY2hVvOBQi00getUxaZk4Y+7GakVtAmNED/XTA1ROUCOh
         ooMwHpS6HFExTKq5vKbgPbHTrLjiw/axomrxDXGMZXPfMliuF4n6wFyfJYCUWQAp0A+u
         oxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173729; x=1776778529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrpH3O/UC588LGlyijfHqwmmf8Fc2A9hjyYsMCvb23A=;
        b=Qxf3vsZmM7xwZcxi127cqp8X3UfemjOxsKqIC/t763rdW7Mi2PrGJHyAKZHcDil7So
         ZjLcyirxK2IfMSDIOMWE9ZX/Ty8nH4c0C2RvPlk0HOHT/fXWfGhMfCXgY6mFJpuLO9wT
         EO9dZCXWPmxKkK4Jd2DPqoVAq1h0kgPWnZRjDr+qm1SGGPheMAWTxrTjasNUCA9cUZL6
         F2n8dLAPNc4IaQ2LvLiYuKxOiC2TNR5kG+9tcpXLUo/KiW1qdLuceCGY5KqeJEjDtFy7
         XjaTfX1ujN69qxIMPJ1qDBMbLiM63L4qCYOeHsMjCR13+Q/nICP9bAn+4VuHG3sJH+eC
         uCNA==
X-Forwarded-Encrypted: i=1; AFNElJ/FVFO/u8FXce9R6XSuU8XsavGMFifippFxjNpolO6JeSLIzpzymoRP+EmWe09TuMuL8in6Q11rEW8f@lists.linux.dev
X-Gm-Message-State: AOJu0YwJstRd+ONmOM1ZClSlH8NFwyByOtN+vUbCSnOHKH5UzQhHewIP
	rGMGrJi+0UlsBA5+yGDSA/7sCYSxknxVq347xEk6AZHklblo8BhJBdRta3+7UCD8SEo=
X-Gm-Gg: AeBDieuh9KhybRdwSEqVycUWtPHWqlvlzCKhFOgjnWHRAtEh3nJrMQ39JJhhNSEn3r8
	ntFr+6ZncS8ntC5TpivcmjZzKy/PpOr/2TokkFx8tHUoV9qi3YFuC4N3N5K0VVON+8nACBI6v4D
	GoyAdmDYSIS8rx+6+4YUnxab0a1/lAOnkvicE4LKmTIdsAig1kZuMOaFUVxOs1MKW5WNHLqOrTT
	YddYJ2Un6gUFz2KymkHNSRsyuZQs2TgBaHhegbZvbiYprFWu0dJYlyPKkqFChDC7hld6IUIuYsl
	tcISu+p5TZd+fiL+Hzz8cae21yInytr5CK5dxgoVdv24tPeIpW3Mi5z3A+H/UpLJiInott568f5
	jBMMjz6tOfHm5v100678u/e5DRigCS79X/n0NBk8g0t2Iv6WcijVOb9lRpSxPmiO21aKiXuqk8U
	fQ2O501pTJ8JxGKRNi/CSgenkdSwGoX1y2Rk0bza000RH/rF86Q9zAYT0RTtCXXKajjYG8m2mej
	1HomQ==
X-Received: by 2002:ad4:5ce2:0:b0:8ac:b1ce:3244 with SMTP id 6a1803df08f44-8acb1ce41efmr112063456d6.19.1776173728649;
        Tue, 14 Apr 2026 06:35:28 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8aca259724csm71335146d6.12.2026.04.14.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:35:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCdvJ-0000000Ay68-2r97;
	Tue, 14 Apr 2026 10:35:25 -0300
Date: Tue, 14 Apr 2026 10:35:25 -0300
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
Message-ID: <20260414133525.GA2577880@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>

On Tue, Apr 14, 2026 at 02:26:58PM +0100, Suzuki K Poulose wrote:
> On 14/04/2026 13:29, Jason Gunthorpe wrote:
> > On Tue, Apr 14, 2026 at 11:10:51AM +0100, Suzuki K Poulose wrote:
> > 
> > > > Isn't this also sort of incomplete?  Doesn't anything serious need
> > > > signed measurements? Isnt't there alot more data that comes out of RMM
> > > > than just a few measurement registers?
> > > As mentioned above, this series adds the support for Runtime Extendible
> > > Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is
> > > already provided via the TSM_REPORT
> > 
> > Okay, but what actual use is this?
> > 
> 
> Good point. This REMs are planned to be used for EFI_CC_MEASUREMENT_PROTOCOL
> as described below:
> 
> https://github.com/tianocore/edk2/issues/11383

So this is tying it to the same FW event log that TPM uses.

I think that strengthens my point this should all be uninform. TPM
drivers are directly exposing the event log today, but I guess that
needs generalization if non-TPM drivers are going to present it as
well.

How do you imagine getting and manipulating the EFI event log to use
with this?

Jason
