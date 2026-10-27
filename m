Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144823;
	b=nYk2EcIn095nYgQQz8w988wh4sal87gWTYcwgxsHMg9pNuEDTAYUHhT0i1wOBz3eCs/K
	 Hm92CDLHZaNxV63sEJ44vEkHWMGgaTzmULGpA+JQj8daO7y16eXMb2Qr+1sKn9txjxCPk
	 0Lp5E1PhiNnC3XMlfliahfReoS8ab7I7VC6Bdvmtx8zjEcYgcZgEFXtNgpaHZZ4H0f/Z0
	 3rjep7htU2Zmybt8ivNR9ArFzwyY+qE8tQiS1sMXMJiMykEWQo1otCw5UGn3+cjh567pl
	 iunOPnil+D3iZjdzGMpoFRF3QXYGU4WSlXq41MfDTZFpzGc3aotqINAtMQXlNyV6g1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
	b=yIHICB3MHAeKkVU0MCYff+14Tkck5gAryQgS7vHVAIOR0kNj2Nx+6ufnJdz0xLc+W3WW
	 h/Smys3pzk/I4hezGdkf6XXZ2b7LLMaz7iQmEhzP/JWFMC8Z8pbGSpQ283HV4C+ImXAq2
	 AVds5PBITfhqhXrX/KDVVb+hZ8T3dg0zlUyYPh3RbliGaZ6lzoPkiz1raGUH9mkqfLaGa
	 MEZjHmOcCyts/ui8ulrvLShOT1JG3SiVbZbtKiGHvKiqZDTjijbGBNgG5JH+rdd+o+sB4
	 1OVGe+3b6luFnYiBzK25uOraZy6L32iXPpVcBa0Q6YhY9ztgoGAv2xoKcWmOxgSGGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GIEBLS71;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA6606A320
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 23:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DAA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GIEBLS71
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533778ab0bdso5761161cf.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 16:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793144821; x=1793749621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=GIEBLS71FdHNLNs4k8MsRzkKZKM3JR4IKM80CWkm6ZJ2WeeQOuq1o69qoBtSA3I0S9
         ewm6gFqqm4Qym2ogjSlKgWguUHlWoEAtBtwzkYBHOGmj5xVwSXjZYCiszDA8DfHT+NEc
         JJ2tYfEhsj+XCrU7NjcQUVlJGABqnfwiLRRoOdKokEAiM2pKk+MdUmsY35aGLz3k9JYs
         7rJMgsY70624B++l43A/tm2NvJy2Scm9pRCyXcOluelhuHZhJHa+WJOxbr/vrTYsTVW8
         bQQZNRWyUe3fGCVFxdpU1tSJ7JQJxqbtKuiRiNwE8/gUgPVoQg3LsZcArYX7ETblPRh5
         D5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144821; x=1793749621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=yIl+lPKFKCx4zf467mDOK1XyYhQCiz62pYYNVB+YPsMgi0/vl+fDGilkCdaQyV089M
         Z5tB/u5GA6IgQn9SwpnCUltXrYHSrkx15wfeR04XO2ZtzjlaMyiaawKxTD2gt/5RGcXZ
         mnpawvaI4t9CtMTRq6Ab9bND+TD/GkPpz4vvWkhhBrpWsd1cWwStCyf/E8g39IVnWHXS
         md4nJngLOfNmgPWuzPqKIxE6YGr/yl8aN1RYgQ5TyYt4Z9YCW0Uso7vOoGMiDXLkOE+4
         KQTKrNeeZsqDPsi+lu7paSiBpASZwETlycIiAATlQCjoLASWG5WTp7Y08fjTuTrekzdo
         Zhqg==
X-Forwarded-Encrypted: i=1; AKwUvBytNccXyswNr9gg244Fp4KYGQLKErV1MictnzxDqrcHEpVWFta2GVEp5r+5sikvhWig/cdlO5R0YfT7@lists.linux.dev
X-Gm-Message-State: AFq9FYK4whNhMuxwcRzwSiU58PM8v+2R2MIucKZOIlDESmvrUGD4uXWU
	yOsXRxEUcphxOUJdwjSeE81/2ZJw7zNjQxeHgOZp2WOSZP4ymzQalqf9bufkRQsV5qk=
X-Gm-Gg: AYBFou2rQvzBIT2yM6b+3gC+XLkiYBr1sBtZIUCf3k8qRkDMR6Z6695WPCIIT4Db/SQ
	Q7vip0siByx54oD1KScyrzABE2U9E5F1vy/UY+rabhmz50FTTLoNB+yULxU5+yKGuUynW4XpESM
	uchG5TplmMdTP6U8NE6+10kt9oDTYytdKizV3Tkb7SJdJq5nckisEtcMIeCPu/hw80CrtKGU0nL
	1dszL8B/kwxk5xfqEKP4M/XpIPDl11icyOBCOzb0sDPrpJRGLtdskXPUOwQgE2aBNhIGJ0v6bRw
	yZAn9cwYUwTwMBJzQinQmSAWNrGggYHyPOGj04WExpaQv5vQnPmPREC7Lb0PgJUIxEaSUCZ50vB
	FbDfF5vdV/RihkqlhPDYrNLPKiS/SzGjt5dFahO816KImR3Nb0Wjzc92oxg+ncp51lNHgPmd22J
	BFu9o0jGcB2oAd8BSL7ycMPTg8j9EVxaE+ybflckX2yYdCfcdEr6kLPA38ZHdHnQEn0Je1cwKqd
	/RUYBgZt8LriK4fvjv/4/GV0lkZz95SHHuyidoi7OsocaWJgBTp5aHyLBJE9UJEaPDLCm4oOV3v
	1uJbBa8b/pDyl/+YyNS3mEZB6BirWeg+zrql13N/uwuXpvL+LnInNQwOoY30e6P80KOtcF2Kkz8
	0y7IqDKqhb1k=
X-Received: by 2002:a05:622a:342:b0:532:8ed7:534 with SMTP id d75a77b69052e-53fcb7f9e76mr15856551cf.37.1793144820933;
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a69129sm114200426d6.4.2026.10.27.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLqsc-0000000BHke-3ly0;
	Tue, 27 Oct 2026 20:46:58 -0300
Date: Tue, 27 Oct 2026 20:46:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Jiang <dave.jiang@intel.com>
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
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261027234658.GL1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:

> There are two issues for TDX Connect. One, the device info is collected at
> SPDM connect (TDH.SPDM.CONNECT), not at lock. TDH.TDI.BIND only returns the
> interface report. So the measurements a TD sees at lock can be from well
> before the lock. To get measurements taken after the bind, the TD has to
> ask the VMM for a recollection with its own nonce.

IMHO measurements taken before lock must never be made visible through
this interface, it defeats the security property of evidence within
the locked session. I would expect the guest kernel TDX driver to
prevent this.
 
> Second, a device may take a runtime firmware update of equal or higher SVN
> while its TDIs stay locked, unless the lock sets NO_FW_UPDATE. The
> TD isn't

Sure, any of the live update things are not really relevant, the
evidence can change asynchronously and without notification, so we can
just ignore the issue. If the guest opts into live update then it can
only rely on things like min svn.

> > I'm a bit puzzled by this optional challenge concept, I haven't tried
> > to read SPDM spec yet, but it really has a way to omit the challenge
> > from the reply? It doesn't just replace it with 0 or something?
> 
> SPDM puts the requester's nonce in the GET_MEASUREMENTS request, and only when
> the request asks for a signature. The MEASUREMENTS response always carries the
> responder's own nonce, and the signature covers the request too. An unsigned
> request has no nonce and gets an unsigned response.

Returning an unsigned collection seems like an interesting use case,
but why would you want to do that in the first place?

> The empty challenge in my provider means something else though: don't
> recollect, return the evidence collected earlier. So it's less "omit the
> nonce" and more "no new collection". Maybe that's better as an explicit flag
> than an empty challenge?

I'm not sure 'no new collection' is an especially useful thing. Since
the kernel won't be validating the signature you still need to pass
the expected nonce from the prior collection back to userspace so it
can check it.

Is there some specific use case for this?

> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
> >>    directly, which gives 3. In a real TDX guest it fails with
> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
> > 
> > I would have naively guessed this should inherent from some SPDM family?
> 
> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
> directly, so I think the test's 4 is what's stale. Jiri would know for sure.

I think TDX report/quote/rtmrs should be a different familiy from TDX device
assignment SPDM. They are completely different things.

Jason
