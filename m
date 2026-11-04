Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821585;
	b=1/w1ecrog7qrV5clxZd5l8o52KQsZeRZ7mkdZ9ZMoHxvKIqD+CKt7Ky0+ZN5i45pPHAJ
	 abFPhxR4ME9obdazbhiRXkZv1Si5F2Ysz94gDJbpcnXczD04xfhphwHQsBw86VVYM7klm
	 8CrxiCwpkxR4E3gnw/H8RCSBV9Wn0TBjOzneyx6lBesqjZuFz7Sa0lLfKZPw5EtJlKKpR
	 OYGru09kMAkjl+Szr8hTDOFc8wERLieuQWSrEFBLO3doo7Q/BprvkpgE6BcZI7lXyNXQ7
	 Pq28NoQazYdODrZ9mWj0+n49duCDFx3RxusmyulKxkXRQdQKjI1BnKxGLiNJ9nDGVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
	b=mvAnTaXeb9EItf0MY6F4ONrDcrvl9OaY97aHIG/6TX0xggwSgk6iER7i+p4kBib947yR
	 fkiILQGaWF14KUAPVavM+lWz+oh1dUjKIFPBnKvTypQZ0MovVWI0n7XEe5uGiC8QLQ/km
	 rrn3Y7L3g0Ie3RG746DAwqg/Y7WOQCVmV6mRbgmOwGE0sgurnMnMBsn7qOoL+t8wIwAO/
	 RP0c/aqjyls39XupBVfjbo8Rq+dx4zdTHp7Tex79dMOtlYBsrjXa4v38j03F92pkig0Lv
	 PSkb9PmXJzbRCJBZS1FEKHmMf+UfIJD1IpPuFAXirW00l2OMO1KGnnIjS3Ks4iK32Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KTpS+Fxx;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29F608CABF
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 19:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B29F608CABF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KTpS+Fxx
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53bb57f1310so10783541cf.2
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 11:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793821584; x=1794426384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=KTpS+FxxahJlEhfIO6YV9+U/9pYCOW1k2cTEOAS0cmW5Lc8VDNtCx6AQfNW9x/Zbf0
         JK48hegR1r9waGINpg//NdIf4fga1qfRJIjUTNd0KjgagLCwxfyoGHtG50nM7LI1oz+i
         tshg6IRO90Zu+tXP3t4zG4k6dEWMLFzGYB7Ep2lO8v4z+711odF2os7S3PQRzYKlkU+F
         IPGRIyI2Qn50lGrm1LFBz3IS8/ujplvuA7QZ9SKnuV/aj6SnGuzBIY/F+Q4FjQdMXDLf
         +zCo6+4LFg/5Gk3ueRWO0hKKm/yEI0FaNByGDBSnF5z8+9NQ2ICvVMzH3nFHRspAY1a5
         k5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821584; x=1794426384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=rZm0rR7UmlCRHywOV435+G81AQkX8svUKLlleQblxz1IGGSw/PEgplwizEJNIladej
         Qlrpe1sPfrQzTQcund79g19hSvRWi8tp7LF6iVK0VVXAJLYmPXSo2JEKZjkG1w33Iafw
         /LALOQyNddNLFQBcLLiE2le3IwKxoTDSuPEpXjL6bbUlllc+CQkpIQVa1QvuUpog8dsu
         kPN/71oZTP9GdjpN6YtV+Darkyb0pH8jouRwGwpPnvYnHLIxNe3iF2y3QlxWwM4eoHBC
         MxqR2LsMm/3rzh9Q1nfB64oOxZeCr6++D1++PgPAgf1w0e0fAPTjPkjIDhP+LNBwYW1q
         Tq9g==
X-Forwarded-Encrypted: i=1; AKwUvBz0ZzKETmiHbB5R5IMaKAfnCOmSVCJEuw7+avDZaxcnNfgbyKbNUA9RkI3ehKH3uDeBhUgY/bt6cL1m@lists.linux.dev
X-Gm-Message-State: APuU4Z+kjSwgPWM6YNtYJOJ9LYKv82pNIo0KO9fi6pcjzXwTOZvxr0gy
	lmVNhoTTB0Evz2w6YT0TjLrohXzEIHeg86QA4wdiHL3iSUvDxvwUqaz35O+C6a7TpV4=
X-Gm-Gg: AYBFou1nH08T+/3USm+7Aa/JwpNzQeJhduVh3lxH4iZ0Oa4i8ecpmCquqKOUY5sEDzd
	ZFWz4qbI4bGvJY2xyhkkMLwofaYkHIxa3g61s4FpzHxS0Dzx6mxqcgDjNoZIvuVOVgMGkgsYsAh
	6DS7M3bdYc9eN9+AeajMSZx1GDB4C8rLyguGHf9JT7IojFYSZSG87MPPaGbPbG4Qu33UtuMaDXI
	FGf/9ANLkcYISuUzAc9qHRFxgUGmSGTNBheheWnlBmxFy46JgiNZmhqkInjva5eYXle+JXSnnor
	bCumAzj3ruBsgfEMphfR5zHn/4QtH7EI/UQbREywgsmezltgO30TGOYLhBWg8U3BN0iwY6RRuCR
	ssedCx6WmiSTKqGHkSyIx5qSDl7ps8/tjlh4gcja3SwfLi2ET7IpRh5zUp5jVjWYpvMAMcsX4Ax
	zEU69A4DTyEjdVwWCsmVQ2hcGPeAHkeeN8paM1iriBCL6t2A8TDRc3mntkHpcBYSP6/S4kIhAUO
	5VAuMOStxADwFsCVEscpZy5HdHIGx11+ZljawY89BjFyCAe3DHRsh0efZPpz8YhKUoti6fAgRCH
	A3KTP9egfELB/nk0HV1nmBP161jlyS3/BJ9QNW1TgZvKLG9tr95k8W6CEk8TmzmwLZ+wwzufh6v
	lqdU65P9Vyi2gCu2iRkpKnc6rccD6Sk0=
X-Received: by 2002:a05:622a:98b:b0:535:be07:f31c with SMTP id d75a77b69052e-542b83f684dmr276665021cf.74.1793821583898;
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100aba28sm32315511cf.9.2026.11.04.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOgwA-0000000HIFZ-2f1S;
	Wed, 04 Nov 2026 15:46:22 -0400
Date: Wed, 4 Nov 2026 15:46:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <20261104194622.GC3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuDcABX27EeTApl@e129823.arm.com>

On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
> [..snip..]
> 
> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
> > +					       const struct ctlv_cursor *request,
> > +					       struct attestation_evidence_request *decoded,
> > +					       struct attestation_evidence_object_request **objects)
> > +{
> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
> > +	u32 challenge_length;
> > +
> > +	decoded->challenge =
> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
> > +	decoded->challenge_length = challenge_length;
> > +	if (challenge_length < caps->min_challenge_length ||
> > +	    challenge_length > caps->max_challenge_length)
> 
> Hmm, I'm not sure whether this check is required for
> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
> 
> for example, if the provider provides two evidence:
>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
> 
> might challenge is reuiqred for generating the token
> and this would be marked at min/max_challenge_size in evidence_cap.
> 
> However, in case of eventlog, it wouldn't require challenge.
> for example, TPM event log or CCEL event log.

Right

> Do we need some field on attestation_evidence_supported_object whether
> it requires challenge or not and applies this sanity check per the object?
> 
> Otherwise, to get eventlog, it would need to send *dummy* challenge
> always.

I wonder if we should have two interfaces here for signed and unsigned
evidence? It would be clearer for userspace then when it needs to
provide a challenge or not.

Jason
