Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C62BD03E
	for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866349; cv=none; b=YIXrf1QXgsm4bzToS2/jbA6bdgjA5eGv+uiJORR+U2rjpO6VAhLm5QTm/SoDYKlg5vr24L8benasdTVZW6uZoiEbqZeeBBLHWxcAvohq5F+rzb0ld169MEE6EvgYM67m2H4EflUVRku0f57P54YQoz2snYsWkLQplfA7QhSKr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866349; c=relaxed/simple;
	bh=G16zJpx2+4+ckGIyMFuXTVn6xKtqE4gXqUrwqWcxilM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BTFluwwywKERG9Z9fHXW1ZFD2ARpDS6RzPb/P6Y9n5jfxwqgdk42wV4kbV1o1+MnFXWS2g7HhsIJU1exbbCKbK1SKJpEgUZudLDtX1QdBkE8gH6rtzisZvxwgvvBvuGKGQF17Pfm9DKqF6bXmCFyWbRUDfpp4NEEtPlpQKZ/i38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KahebLFW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KahebLFW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4536c6b2506so714525e9.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750866344; x=1751471144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OzdyeiNRs5SlJL4/mDsI/yOCB6pV7VqrpxyxESO6O5c=;
        b=KahebLFWZqstAdYVBeLJnQBlAowRBVQWu8A1zKUrm0Mojx6ptOFQ2VqE14dmhBOYOT
         01Y4n/18sOxCRuWbDO8mIqSVDqZgl+S/Q03Tboruy7X0xn3qjPr+ldfnIO4pnlMoZGMi
         pgCn5LvcmaLz54VeXcPGiOmeAjyyjPxI9WFl4NZ5DU1wO30zm6I6W29Ri0Sq5Sj9WTYa
         RXdpyvKvIoyhzFL3dfU9UpNz7X2coCM/hMERDmqSiLXJQrMdzBfyu0dW8NnNYY3hCl4D
         4BNu7KI8h3Jli2f39JDms71NNWattCoFR+DF2k/Q2BpV3SiiS1zLLUzlkta1f0ZXAyHv
         WoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866344; x=1751471144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzdyeiNRs5SlJL4/mDsI/yOCB6pV7VqrpxyxESO6O5c=;
        b=QKMH7DzHXyAcNJmU+XAH/Ya6vKyyzhKth9EVvN8nOHBZ4wuXF3S4bSJT+4Uhf5cL9m
         Jt7J8nTCfK8rd4cKiPDFw43YMAGPDLe+oHqUcStBvaZjSg60tmPgvb7RhNFdqFSL0bAb
         4RpfmDsAtB9OLCg8hkeLlb9e62OOXc+dsg3EoM/tjNcGDGn6XKCeCd+2gERjzyfQf1p9
         wyclhq1n6snEcJt5YMSzfeT4jXezT3MuHdAMjSiln0udo7+c8rlscKSDIzT2PWlNSlA/
         ZUQ4K9Su49Hv+c2WXSNTHgT5y3QiZeIKD7CvD+bI5yJ6gT8m+AUZ+KtTdMI4AIjJt+Pd
         cKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj9ajKaLY5h1o0gDnt1wuNW1l5TQQPrZDUEyqNbFhseTEx9LHc0hHjjXHgaVqpsmGtAMrK67FmpDrG@lists.linux.dev
X-Gm-Message-State: AOJu0YxYi/zjmtadGZh8/twq5IyArq+Ht9pzBGKlFdnps6K+0Ia2o+7d
	ERLzY+C2Vxz3ibSTBdsZ3K+txvtKa9lRf2EavdDDdfc7M16NjRKmwxZXdCzPgjbY5hM=
X-Gm-Gg: ASbGnctvZJcksDvxgdVjIgfJr9EVyN4bKskjAgydQql/UA/f8WbXs8+CXQ+DZNFgr6V
	iKbrqgRIKKuf6W9YYeMSrHPsw3V1UOT8ux+4o7vqMmexn2Jdq6IdA2btzMC9n3Z17zGYFgXdKae
	o+Q01RsKB4+dxPhwTOIAybBej2suaqDWU/RCM5x7TuBCExkog2KhmCaIKd2jFrgxM96/JQc7sPm
	9Ew5yBlVyvxym/BwUXREzRNN8gL9W88SAP/ZLbNPP8sc2e6tanaERHAqavjGxJP7TEOqWDOcz6w
	saS+mmxc4wZn47vWZ2gIYU8X9o7T7Q/9cgAoHOAGdfm+r4cIlIIv5dYobK3VD8VA0kEWzV3lvDq
	VKN0sUO4eEvoBHe0g0muwPgwLpZq18t3YmgoKb4FfAnSz
X-Google-Smtp-Source: AGHT+IEm0pNt8N1cvRS3sw3COdyY68vXL7KkG85G3J41WMroyvT0psuCTxySAGZKiMOI7hV46yazeg==
X-Received: by 2002:a05:600c:1f10:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-45381af7e6fmr14491265e9.9.1750866344296;
        Wed, 25 Jun 2025 08:45:44 -0700 (PDT)
Received: from ?IPV6:2a02:2455:86a0:a300:6570:b777:80f4:22f9? ([2a02:2455:86a0:a300:6570:b777:80f4:22f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c749sm24200335e9.4.2025.06.25.08.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:45:44 -0700 (PDT)
Message-ID: <da387475-ea1d-4636-a524-8c47c6e4c764@suse.com>
Date: Wed, 25 Jun 2025 17:45:43 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call June 25th, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
References: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
Content-Language: en-US
From: Vaishali Thakkar <vaishali.thakkar@suse.com>
Autocrypt: addr=vaishali.thakkar@suse.com; keydata=
 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
In-Reply-To: <kf45vknwfpg2ule66cghubbzwdri4frjp3ugmybvfdkdyovqmn@q3hlnl34l5wb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/24/25 8:28 PM, Jörg Rödel wrote:
> Hi,
> 
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.
> 

I would like to discuss about rebasing the svsm-igvm branch on top
of QEMU 10.

Thanks.

> We will use the LF Zoom instance. Details of the meeting  can be found in our
> governance repository at:
> 
> 	https://github.com/coconut-svsm/governance
> 
> The link to the COCONUT-SVSM calendar is:
> 
> 	https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
> 
> The meeting will be recorded and the recording eventually published.
> 
> See you all there.
> 
> Regards,
> 
> 	Jörg
> 

