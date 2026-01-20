Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4D44DB79
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921894; cv=none; b=O+MNUbjXM8+Owd3gNXBg6wYYIGM19dZ3n/L5g4ov/Poiko4XV50Av1TY3CT0UGEhCfEXacRxj22xwX6qKWjxVzbPuk8lq9Sra4IRvErJbTTXJRFG5FHAueE2CiomOfcjti/am1uIVyiOe0fdvMaZuUR/hsOi9oNmGTwGLxu+1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921894; c=relaxed/simple;
	bh=z1JAlWdxRfNL4N3zWMO4F4IvA2PNLQmDwYlXJCnUewE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjQZAPISBq4woKl7AfXGhbPclbgHg/Ayw6Rz2PewvqwfRkmkgosrwLViIOwU6zF9F390gac1yZhUYr6Y9mForemXS2k2Y4RtkrHGXYpwOnjpRvkfLq5oDim45U5IK9JQvfl41blbmEgQMuD/nrHvWKYnFKrBmXk7wAB/YOlyPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SwKFPMek; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SwKFPMek"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5014b671367so67598101cf.3
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768921892; x=1769526692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NlmbI9zXVktAgfsh6c8tsGYEK/T/Ft6rYTRkQgOh0mQ=;
        b=SwKFPMek1L17UCRbosSy2voASgUDujTJQ2IFZSScHuV+LYBpe+D79UmTLY7/OgK7cr
         3+G4DSOrJ4W8Xarcf8bhfgC0m4bUg6FCnQ2w8r34dRJecLCtrp+eTNHqkQ+SvW+cWVcj
         CHj7We7XPk4uRQ4YKBFpodRRauFnwHwPTmH3DsxyZZ5US/Zer3VYyEbQpV3dwD6Fmhcm
         rrDEoXtYcNqIXGOLgtT9akRJl8cwpJaVDQu+C2FtZr08MOiDHW+AQHX2Mn8YncIQ9PbC
         8aUaGwm8/KIYQ7BnBqn1iqFMnUx0Pq985rgjQH7ZA44+Jgl2psJQhh6yaeQPm0m9cQw7
         w58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921892; x=1769526692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlmbI9zXVktAgfsh6c8tsGYEK/T/Ft6rYTRkQgOh0mQ=;
        b=PSbJmock/X6N95RYvOlwFDDXiplzaqpJ96SWJhZnLIJcXudVnpobpcx9r8MEtB2JBo
         PiekMCzbHVuZTNcwc1VurKiJHNa236pVHCIfSa3i1rc/eTmqD92lqb44l2y4SG7gS2+G
         tNoyqS3UzeFEEm9o5g1OZXhBHmjBCop+0+rAHqanD0/c2xqoO8fKrnIiv5Mv6cpAjEW5
         VIHClNmoLg/M7JmVTLurH8nhj2KqTLOssumRoukG3QxxcR99d6ACGGwjOR+xgh34QKLR
         P2lJ4QaXMA+TvzcYskEYJiGpbO9FosLTjir0j+Nq9kRNA9tNyQ4gjXQFl3E5mOOzy6GL
         YvyA==
X-Forwarded-Encrypted: i=1; AJvYcCWoK7yIT8tykQweTZH0oF8bkTNF5bC50U15oICLR9I4Y2Ja+5FNs+Cp66HdeCqDRPpt5hRP/Q+DwXQX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlb6+KhUREK72L8+TdfSLwXXl+hzAZXq7+I5eoCPo8lX33QAGB
	a0i6bREesTx96D2+ozYMhQ9X4HnHiaxlryLdsNuYKNykhNWYiJptHwgpUmubF9W5sk4=
X-Gm-Gg: AY/fxX5A4pC3gHaL8xe8KbY6QiJVvPrzq+XCI+c5bD4U1ENBaJ+lOgN4iu/EkOc86qq
	Unav5wxZNGbbfw++AYt+OP4nwyfeWJWzZNjMIAIW/7shLqkD9Av3W3z/T3XHQ2KGqT6/+BGanqS
	BsSX+TkKWlVXHbe6T1KfWM1fyUz4sRWSp30x0edYPTu1bHNU5CfCTWHGg9vR8/NkMTRSp2xJoM8
	qLld6hv39uHIk7XFqtZaGKwou4JUsfuxH6HEyCzpglvHBvbmeqCOScaLyTK2dQ4VSAJ/eArFXsc
	1wP1VDb5wTX1326+WPN3j5e2O2vrHq5hvTAvE9E2o46RLkz7tQXRb+HC+2zOT92TkLXBhnt+z9W
	VQsFMjWpNdOyNWApqrGTf/Zhd3FXaMNpmhyEBr5XZWdW23E6jwX5+R80DYUpAtCrtL1MgbtUlGu
	wU0WcUdJ3xPZIFAt8mCE1CUjhMBNWSRkFW1S8ctFVjJ3gqyC9atUq9jraON1Ow/3KG8Gw=
X-Received: by 2002:a05:622a:287:b0:4f1:e928:3fda with SMTP id d75a77b69052e-502a1e07c0emr192323241cf.26.1768921888830;
        Tue, 20 Jan 2026 07:11:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad0eesm104011586d6.32.2026.01.20.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:11:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viDOB-00000005XsW-2bF7;
	Tue, 20 Jan 2026 11:11:27 -0400
Date: Tue, 20 Jan 2026 11:11:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	robin.murphy@arm.com, steven.price@arm.com,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] dma-direct: Validate DMA mask against canonical DMA
 addresses
Message-ID: <20260120151127.GP961572@ziepe.ca>
References: <20260120064255.179425-1-aneesh.kumar@kernel.org>
 <2a0b6d1b-875a-4075-8fc9-a8534afc9168@arm.com>
 <yq5atswgjrkp.fsf@kernel.org>
 <0da8b73c-5bec-44c3-9902-221a11142c34@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0da8b73c-5bec-44c3-9902-221a11142c34@arm.com>

On Tue, Jan 20, 2026 at 02:39:14PM +0000, Suzuki K Poulose wrote:
> > > > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > > > index 8e04f72baaa3..a5639e9415f5 100644
> > > > --- a/kernel/dma/direct.c
> > > > +++ b/kernel/dma/direct.c
> > > > @@ -580,12 +580,12 @@ int dma_direct_supported(struct device *dev, u64 mask)
> > > >    	/*
> > > >    	 * This check needs to be against the actual bit mask value, so use
> > > > -	 * phys_to_dma_unencrypted() here so that the SME encryption mask isn't
> > > > +	 * __phys_to_dma() here so that the arch specific encryption mask isn't
> > > >    	 * part of the check.
> > > >    	 */
> > > >    	if (IS_ENABLED(CONFIG_ZONE_DMA))
> > > >    		min_mask = min_t(u64, min_mask, zone_dma_limit);
> > > > -	return mask >= phys_to_dma_unencrypted(dev, min_mask);
> > > > +	return mask >= __phys_to_dma(dev, min_mask);
> > > 
> > > This is wrong, isn't it ? For e.g., for CCA, even though the "Flag" is
> > > added to the PA, it is really part of the actual "PA" and thus must be
> > > checked against the full PA ?
> > > 
> > 
> > That is true only when the device is operating in untrusted mode?. For a
> > trusted device that mask is valid mask right?
> 
> Irrespective of the mode in which the device is operating, the DMA
> address must include the fully qualified "{I}PA" address, right ?
> i.e., "the Unencrypted" bit is only a software construct and the full
> PA must be used, irrespective of the mode of the device.

But you could make an argument that a trusted device won't DMA to
shared memory, ie it would SWIOTLB to private memory if that is
required.

Otherwise these two limitations will exclude huge numbers of real
devices from working with ARM CCA at all.

Jason
