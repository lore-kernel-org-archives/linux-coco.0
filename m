Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268474;
	b=J16E7GQRhgQcinvrFevCIWfJt3unAP15Im5wnIech8GzlzzPhMJVZQzJOUb/s2A786jm
	 Zy5m1qLHPHvif82aBAc7RjYdwYlcu/VSYMhyXjzNwz7qEUu5g/gF42OaoHNmdcgVijdce
	 /uHFkxfKWHq4u/H4ZmtQyUQxyTWa2SKzjHaEmtN6V6ahG48Qd8H0w4168+WDiq0KhcykP
	 Oc86IicmQKd1Cj7oB7/VIGvz+QWRUrVnE21ODT8+NLLITRjUsaIKCssiOehBuH9x9ua7I
	 Lgsd/yPltPsRsPYvGlSpzpDFeNhkrpanXnqIlvS6dvb2htrmA+z6camm6z8Mb7Hew2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
	b=doZOdOcfockL49dd3T709IvBqceS18OkfBP+NSdlKsrz2ssvBFA8W9xceLdwWDKCkh7T
	 p1DzTZn4BiiBzKa9djHskfOf7C1LUSF/UiRugSLjb3Yd0/qhVMuJ3MiPtJcO8NzH/d1YJ
	 Ki2xPWgyo3MO4FgYP5jDwFyltMf3q3sEE+ibucYfH7+SVtgG514zQMznbd/OIeDR4xgai
	 qktOncRmmCUXVDTLrivVSUDmEDEM7Tt7A5UXvyPI749s4qf7xK0dMoc+GL4DjJLk8ight
	 raL7Xakrd4xHxK+oNMi1IxUOEcEeOUF9n45bXLvThfyMo/U+BZHzj+S0phHMQhqDXDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=adXFxVIq;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5743606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 10:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5743606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=adXFxVIq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso294979766b.3
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268472; x=1793873272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=adXFxVIqqEp0IIxkJgXrfUUipAZ6gBZ9RWwXp3z4+B0z1VUMqAhOtZg+aTFH+qobb7
         NrCs42qa6QZ+fMRcAcT/m/HdicfUCy/npXJ+mAnqQgDsQuxVMhtYt8JGR6JlypmzNiv5
         5XA6LbBnmuP4bYZkrDM7FSppk9oeodCSXvbsg+bkqQeUjBFNq5X0ix3z5wUq39leaBwX
         41lA5+5MilmnZTsN7uA+x5zEltuzbMC3LS9Qejy8ZJF3uppmfCsr7oFk+nCef+MXahi9
         6BSisBdHAoH5IZ4vRe8wk2xVhxypyGwHjoXAgSngQ8FSVPbyqPMADj6BnU4qfufpbSxD
         TavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268472; x=1793873272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=N17Bfi6WwG7rZZqFOPdiHc38oLS4CP+QFxxO3Dqi4yxizbcRwwi3B42Wf4SdtFAhpE
         qOVbRWq3CDjk1xbB2J+FjLppSI2ZZhC55gAE4FrXBuBf9+TI8RRwAwYAP5wFruRmP7UQ
         CVunb/8dRCnRHzMRAT2zhruIdG4VKc9NSphpz7VPDlRndJY+woPPVCQBOdY5sqCFijbA
         Yx1vRue5vGG6CfrlYEaUYJVRI2UDwPEOIhcWfFr1ji2TwlWDW9ppmKAyoPMWQ4MSH0cu
         tTdAbrUGKi0bkmxQnn/Yia3wRArZ99kLbDtZmuHn8+Z5pIq2R6MKW7rXXSXc4QUsrFud
         HW3w==
X-Gm-Message-State: AFq9FYJZEbHu155fpzcEEGk10TwplEmJ1rR/dVDcKUmo0Jst0TrdZSED
	xJ0VI+l7RCrFas3a5kT/jq/66A5bPnrrhsWGcxj6lrJb4WhHbbQpaM6SpOfl4EXU00M=
X-Gm-Gg: AYBFou1FpXupw55HxVvbdnX7zBWYWssdralW8es1g5t9/qzf+GrtltherUxfXEeZqyS
	glld3NiCB3Dt/LrP/NpAqtrZl9uy39LzIoBUl1H6aIkkmaa8VpuGAzro+4t4LqeUl0v6AcoosEM
	fwKylgPrSg+8JBZ+jugB1r8rGYwk3ZU4WNyJjO1LBdmzW8+ll4riGduigNlYOufOyoBFNUo+9ye
	WNn682MDrPSHpNPelJZKwygb3iY1MkJhTFF2+FJzKWMIQpexLm4seDQuKX4y4pm+lkHF3N3cG+c
	2GkVUHonOjo0o4x2pYhCsg5Wd5vsx7v1/u0XOsuqo0WTXvzni4BlADn9qfu+/4/hi67V/jdnEOf
	uwnPHQynjopvfe5j4ZPrVDZt88t4Y0oYCo7mt4XkEIc4ylWwx1zZ0g1a/GFXSwinQ2Fyu0bVVzA
	jUGlw4tIomiyp9Up6FJBjHmN+fJr/N5izgwdMjFyNUqUSzauCbsL9nVCMdoW/vHXs8R6XZsrNhp
	wSOXZyA6r8aY+LylmWP5gm5lonh5bvds/oHveZz25iu1SSza6SGWpD+ofaDJwdhP0DJFOX/LaqM
	laFsVmocdRMQv2BMYlVoBp2SIi8NRYKABJqLFA==
X-Received: by 2002:a17:907:9405:b0:c49:8d28:73ad with SMTP id a640c23a62f3a-c49be020e3dmr404569566b.49.1793268472113;
        Thu, 29 Oct 2026 03:07:52 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm715397566b.31.2026.10.29.03.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:07:47 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMahpRIeL-Dkytk@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
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
In-Reply-To: <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>

Tue, Oct 27, 2026 at 07:43:04PM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/15/26 7:50 AM, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 

[..]


>3. Jason asked on 14/20 whether anyone needs a variable-length challenge. I
>   don't think devices need a range. A plain read sends an empty challenge, and
>   an SPDM GET_MEASUREMENTS nonce is "NL = 32 or 0". Your TDX provider always
>   takes 64 (attestation_tdx_evidence_caps).

https://lore.kernel.org/all/auMX4kbsflE9kK3Q@FV6GYCPJ69/

>
>   A device needs exactly two lengths: 0 for a plain read and 32 for a refresh.
>   struct attestation_evidence_caps only holds a single min/max range. It's
>   checked on every request in attestation_evidence_request_decode(), and any
>   range that allows both 0 and 32 also allows everything in between.
>
>   To work around that, my provider declares 0-64 and PCI/TSM rejects any length

Perhaps just omit the challenge attr in that case would be the best way?


>   other than the backend's nonce size, 32 for both backends I ran. Could the
>   caps give one exact challenge length instead of a range, plus a flag that
>   also allows an empty challenge? A device provider would set 32 with the flag,
>   and your TDX provider 64 without it.
>

[..]
