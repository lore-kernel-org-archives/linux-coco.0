Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090090;
	b=m3zn1Ou+uFMezRChpusWpCe5NcTQUnkJXHBRWDMBjmAQwuy1PQyKyWYRBuZjc7+2Cv7n
	 1IKcMzaMMbeeFnRceZ4oBfm/elRPsCJiWzJFT1YMIgnBb9zviLW/RzJN+tBb26a0MHqY5
	 rGKIT5qPd1DzIreer1xxdlwYmBrEZQNVDkk2IjxSSENqpdLzYbI/HRUPlGlFfV1DPD9oV
	 TPVlXhCW9v77qBnDqHTf9ilXffHN18g2N9tycy7mtzRe8QO9c5MuRxvYLaWPI7pK7+ijI
	 JCrf2gJwOM1KEJJh7CjxMl64SyE/FTODvAW/fOIIhyPeyhVI7Jqd9OLkrVq/q9cX+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
	b=RxGL1Rc5NMOLFzCnFfmtieluugr6FWUhwp1FEPaZ3elPSiOJMC6y7JQgKv1swzZFhEc4
	 BQOfPKKdAURIvfp73gIb7U8z/1qsluAD31sAyAQNuPXGjOuazCRP5T5yqFBhdUnWKosYA
	 uCMHVhOIKHuhsBtIsxU6rDtQ3uzvbDS4JCwI7NjB2dPkkjRZ2V+0GQFtleEX79owDBILF
	 T47hRRlnSEsLia2pEFpbsk00bWZnQ0Z9zdRlw8zklBf4D/DtmVvn6lf8GCmWKDBHaqrUA
	 x852iweLeLPIWpFrdzrFE53F5DtUSl0uv85iRmqvXra6KUi5Elm8ae+ZwwlCVB9eBMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61C606A321
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 08:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A61C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so20996945e9.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793090082; x=1793694882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=zXgMSbfVCKxlzGcMT+kLhP2JXb0zXoaQkPgNhl0ADJ0/a24qK9K+oJiBd4UbKilA4f
         5qhMqWZIKlGB3JcfeeMNBK5DhiSZsO4dxzsSDwCt8DmWo+Xy9hYMJubiU0NHR8cRKHoT
         dirfj9Aznj86kD2RvGZU2OSDY+XWe04f6ANE7CR2g0rBBlsdEYT8upeX3JZ5QVw+jZaJ
         mcf43lhBeqlzFLx2DheltuX4tt7ZklSw+Sj829aUi2OMBBYbaBObgXiqS4RCoK/4dVcR
         eJ5zc+/AJ0aKoJGP4AB2ObYf/Vtj/6BOsJ6KgAzvpG9kQ3PktL5OCXXqIMHVKOkVq7rt
         9U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090082; x=1793694882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=gLYxH/tguAcxtCEEINTHIO0A/n/5+IcTDf1EywuTCGGu0aEt6hg8/ZxWHEXtdilTsd
         iypf6dqdmcYomRAIi9MSGqwd/oC0dArFO9G4MT8EMymMSYXZIdQ2GRqR4B8YoVrlwfL7
         To9QnqpQj0vOiemCf9ASVjhel+4hc4h6theekh588PeamsreQv4RsLbUh73bZ2w5CNxM
         y8YKdcVYpVx0jXN2b40aL1EYVWWm5cF9K9wcLM/jqMuz1rgOv+do/qN+JwDA0vv4ZXvU
         ctRSvQF1es6UuDkRRKA2TW+qHFiiqDbT7kd1Wt8PpXtCGqdIvArPhRGI4UnbWLubsHR0
         EmHw==
X-Gm-Message-State: AFq9FYI97ZDlVeQeSjexmaP3t0+as8bIxawyqSps9axiy4E0iudsmOr5
	D6HzgSwb5iW2Q/+9PuxB4jNLii90pa/L/BMcnTns0a+6Uizo0jbm/3pNHmI/LnDuG0A=
X-Gm-Gg: AYBFou0mEksK+4YM7CVyAEsTlRHtEMCTELUWBVwXkJIeo/va54ryzYXXR/oufFmDd6e
	iYtvrYVpaJon3Ayca0Py7cVr40kVh+hDGzmcM4ru7gbbCDZcMCOCJ8FyiCJ2f2Kq8ebmBipCMp5
	RDxSif4FZpF0AH0jYscaKmD9K/jX+NL5wW9RCJRFVJVcQ07wp7JR9OeqPVytg/oljBfzNaNb9dx
	0byH3dhcxhVGfXVnBkr3zSj7Y5zbaAbniwjcVOKjIaD+3A8X+A57I4IbJUn4/DXiHC3qUKkZXvx
	TfUDG0l171Ng4LFPGBTT1dffR4DW6Xa3NXZ1sA9tblJg/4i43eKlLzINFN/DMcmR5SCLXpqO8/l
	V8CX6apc+aq9CDzSoLClQyE2Eh+/2gJ3NsaiceivQPM9p8S0/ulSxak5gWkhRx6AdNUMtF73x8a
	1FdH2UIY9CR/9EOeMJQY9AyVSB7FaM9UuqF0Y1aLecR5XO7W+N38P7qMzdpQdtOUIA+DgUi5Osj
	79sZO08fS0uT8tg6MskBwc8erWXDBYffiDCvWpP25eqccDBD2pldrXEkiX7QROa
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr167523235e9.25.1793090082317;
        Tue, 27 Oct 2026 01:34:42 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm261457975e9.4.2026.10.27.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:34:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:34:38 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 01/20] ctlv: Add the schema language and generator
Message-ID: <auBhwll-zJAaLXRf@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-2-jiri@resnulli.us>
 <20261020233132.793b7e97@jic23-hlaptop>
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
In-Reply-To: <20261020233132.793b7e97@jic23-hlaptop>

Wed, Oct 21, 2026 at 12:31:32AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:34 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>

[..]

>> +      A named attr set, a whole attr group, or one exact attr as
>> +      "group.attr". There are no tuple selectors and no cross-family
>> +      qualification.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+(-[a-z0-9]+)*)?$
>> +
>> +  selectors:
>> +    oneOf:
>> +      - $ref: '#/$defs/selector'
>> +      - type: array
>> +        minItems: 1
>> +        items:
>> +          $ref: '#/$defs/selector'
>
>My yaml is terrible (and all learnt form reviewing DT bindings which are
>undoubtedly perfect :) but random LLM agrees with me that you can simplify
>this as it's a local definition.  I think doing so makes life a little
>easier for reader by indicating it is thing defined a few lines up.
>
>            $ref: 'selector'
>
>I don't care that much though.

Tried it: $ref is resolved as a URI against the schema's $id, so
'selector' doesn't resolve. '#/$defs/selector' is the shortest form that
works without an extra $id line in every definition, and it is what DT
bindings use, so I'm keeping it.


[..]
