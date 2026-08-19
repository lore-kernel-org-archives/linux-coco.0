Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2B2D7DE9
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151477; cv=none; b=kqAJnHOtDitfdsfTmZD9VaQafCF1wGK87t/QYCjPo42ApwiScOY1GUlkH5A6lkC5Wh8owH36hLVL3BUgwrc73U74B92nGxA1YC9jLK+tUq3/gTv9lxIjJiJQP0EScE2D6WsjOi8WsloLojCRxFCBzQO8+b572AdENWvMUTtUg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151477; c=relaxed/simple;
	bh=zTygHR+bb9tPh+r8pKI2nQZjTF6gmzub3Gf+11ydK2I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WIn8LG2eVKGoyT+ozeB4GKko7owU0qg0i6g/aQuUNuLjZ4egKqOsgTmR/CL2KOI47/NtB4idE8zImSWsaIlrzOHntLMcYkWiua+6yW0eJwHvNbtbi8YPMtiGRHRU5/HD2ZdKRT6iOq1HpdugHCjPSZPhoCaI9vXRjwWvTvTasX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9IBmthF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9IBmthF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so2146315a12.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151466; x=1787756266; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RAsntpzptWfAPjVtkOJehjiQ6tiS2RKLcun7ZiRQNR0=;
        b=q9IBmthFVGaC/oJujDSVH4A8MpeFg8sCyePu/9A8jiSDKgmoa2kkUaTNtwpUMhaiZx
         Rwo4OvoWpQFqoio4FMQjXMU/kDHAuOk4U0DkZGxCiQlhWa6JnAv+NjgWYM1W83qORZKl
         Syy69F1/DUoVkapmdRh8eL3XmsDd/jrVOzIzd1Era2ownrnNvOKETSaPf6O+dSgcP8tR
         L7PgtquftOrgoww6swf7vLrKvwmo+z5NN7lSKjaZGWod4x2cvOQ+c7wMRDUdSK2lTgRk
         ghvp3dq7gBv8n7zhX6SqYOZJOZhS+irbk2mYxa0uiYhNTNxP/E3ej4yOS3Kh1qKxdWCU
         Sd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151466; x=1787756266;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAsntpzptWfAPjVtkOJehjiQ6tiS2RKLcun7ZiRQNR0=;
        b=gJmGGFZ8KwrDoL7XWdPLpLhGGyTsz4Eo1w4NsgcpDdB2TRAcXQER8IcR5rTanyjc2H
         rqC4HfRUT5vXYcXV0SM2oomjFPK6dvn+C9bqXGsOsjzgrnfHpMUy1jT0ykIIiKOKMWGh
         fFXQKobP6SZ8fsU5s9+3eoR3Ql4KJYFlo65RlOXPUfER8yJiZ3tdFXFCwjqdnXBf2gUR
         2CQE7D5LCu6evbuTtk0yh+HzJEcUTvioDWvY1MCJGjv9kvDs7yJ7wlvutEdS7YaejvMV
         6xceTnHoPJG20jJL21rbpZRr/fDCw1OviACHsLFsLDaJiyCwBGTjk9mxqzvhS8St3j72
         YszA==
X-Forwarded-Encrypted: i=1; AHgh+RoagEoSb4jA/Da7XJbyMgNYZt7G95nPhVUYAoxeDi6SIScbGaaK3l8feUKZIITFnAph3A1yQWKMh/Ue@lists.linux.dev
X-Gm-Message-State: AOJu0YxFS3gaxfvAqc+oTH6CqHWWqJV9fNPhGcauIJikzP25p0pPSnJU
	/C0N1Ew2lx5tuMZlwv2bgCFXX8xEHws1IaGCHYnqVImX7sZNxGs32aFH
X-Gm-Gg: AR+sD10I4yfhzxiBzQSz4MQR3e0F64PqUEu4AEpaoO3NDdp3eDxbRWuZgHFENgcFzlu
	w+3FXa2SDs+mbju3bakpOBh1+xXKoudcKGq9qMudn5cieZS5G0eUW0CWu5r290wveWJrkESr70G
	qHJTmOigXh9mZhhHXqry0a6mRJ98t5bIjAauIw2h3gTMZgzG571AlydmlO04iiDBWbG/OLN77Ux
	mnnQNRUOyOlI+Oaidx1g+FtWB4D5CDofnfHuUpQy4tK3rT91s02FmtoWx+FojHJ4Y5eYz/20xYY
	NP3t1DPGP8PIJnL5xuAOeNzQ6i1V2BnCg8Qx/OVwOayEBrkFDregaccNkt4x1cyWJ8pCtdNf+tD
	F0qEAKl6eGd0VE/fuiI2fhunkaR+y9pKbjLVIx56evbRQOs+7/ub2Bs+v0ngUi69mlkzAJWuAmD
	EhOnxrKWwRXiijYsMnMC952uA8AWlmDgRfY3Hx+98zAUPsZGWsIFXBCLtFBf+L1kHG
X-Received: by 2002:a05:6402:2383:b0:6a1:1742:ac22 with SMTP id 4fb4d7f45d1cf-6a3ff11a4e4mr1047552a12.2.1787151465623;
        Wed, 19 Aug 2026 07:57:45 -0700 (PDT)
Received: from [10.245.244.115] ([192.198.151.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9f4asm1124014a12.3.2026.08.19.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:57:45 -0700 (PDT)
Message-ID: <a4149f528734a5deb03664b802939bfe67921149.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "kvm@vger.kernel.org"	
 <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "dave.hansen@linux.intel.com"	
 <dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "kas@kernel.org"	 <kas@kernel.org>, "binbin.wu@linux.intel.com"
 <binbin.wu@linux.intel.com>,  Xiaoyao Li <xiaoyao.li@intel.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"	
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "mingo@redhat.com"	
 <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org"	
 <tglx@kernel.org>, Peter Fang <peter.fang@intel.com>, 
 "linux-coco@lists.linux.dev"	 <linux-coco@lists.linux.dev>,
 "x86@kernel.org" <x86@kernel.org>
Date: Wed, 19 Aug 2026 17:57:41 +0300
In-Reply-To: <aoTCmJXjQQbXRKqv@google.com>
References: <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
	 <anxvwV_Pz4UYaxxt@google.com>
	 <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
	 <anyiwqi9i0NSv0QW@google.com>
	 <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
	 <20260812223707.GD1013044@pedri>
	 <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
	 <anz9b6CDkhr5D5RG@google.com>
	 <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
	 <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
	 <aoTCmJXjQQbXRKqv@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Sean,

This was just discussed off-list, thanks for guidance. I only will
comment on one thing below.

On Tue, 2026-08-18 at 13:37 -0700, Sean Christopherson wrote:

> That's not a TD report.  Call it whatever you want, but it's not a report=
 about
> a TD.  If the claim is that "TD" can mean something other than a TDX VM, =
depending
> on the context, then that needs to stop, because there is no way anyone i=
s going
> to be able to follow along.

Oh, right, Now that you point it out, it seems obvious.

We called it "TD report" because it uses the same data structure as
the=C2=A0TD report, only without the "TD information" sub-structure.
But no doubt this is poor terminology.

Thanks,
Artem.
