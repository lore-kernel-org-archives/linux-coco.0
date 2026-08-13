Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599B03B0585
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649547; cv=none; b=BnxhMoACjL6pHChxsK2mpKh90PJ2LQ2F2r1sx+Yx87AoGSO0fUH7QEK1bfukWCKYC+jj4xGH938sXiDBljAvMR4rXAHacjofkNXpuyn6D2fuNtFZvasqoGbhERN9WcZ3y9Kb0lmggcHdfmS1hXurog8bacm1uFdkS9lvbln5Xy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649547; c=relaxed/simple;
	bh=cQlaNRMDkTJMuIyxwsPvZ+cjUPtxFEg5mojh9WKY3uY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fakk3NwXjeyX7AguVHund7u4RancaCfqIGzYlQNcHuJAewBsJYuAd9pFcohF7lkAg4D5UqpB8AZPk7UJRUetgQ+kQ/xppbGy+OuvCcc/Ki0YG57lfuRG2ClUv7JFxwmQWILpF9/cjk5kfVVoVTvu1uZKGWwA70Q9hYqa4hqW+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcN6jC2e; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcN6jC2e"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so2661745e9.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649545; x=1787254345; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7+51zd6tnkFNytI+UfVQUKOzVzDcWRHgwQiRbDmfdKw=;
        b=dcN6jC2epuc5Rri4kKHhGNyXXKSUAORL6Ww6VXxznFqD5qk7mrpDuyD+sSr7miA4KM
         Y/3xirPeWjFhy/zPYm8JhKMOSE3xJc3e+rAQZTaBtDIuh+BYyTrg7s28pKvHwhUlcLef
         DSP8PgC0nV7WWZCcTTUDGJ4FlrZrLVMd6f9FFpcOpKGV8wUVtK2DcOqbp39F75uwSaMC
         2JqQxMXlvwmoOZP3ZGZPjUTNRzlCjK5nWOTgfrUFhF7ID0736lostOja2pnqOgb64vxn
         2cYe6YL1kVcenNTpZjqMziSeOjyJksZxQZJqYDqMn0GMklSBbvMpfQfOIBUqkbljrm5P
         3CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649545; x=1787254345;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+51zd6tnkFNytI+UfVQUKOzVzDcWRHgwQiRbDmfdKw=;
        b=jnkRP4L+BicdQjN6inA/tbfrOFvkSZP3E5E10n3rEgCwm5Qoo1G13Q+/NGUleQXHxJ
         tbOxRRwEhMC3KRq4gcGLnwbFU6fTV+sw4ZnRTeM/6rOoWsMQD4reDZF2MS9R65FNk9yJ
         MfMCity9/OGbqpYfamYsMxmVD8mAE2JUzus8FqdDBre2mj6MntAPuajUYRcqWfQERFzV
         kh18sacsd8nDo5qqN+UbUJG3a2fvBtz2rf8VHMSv5PEfnsvXzeegJeklk5RbkQRnbcO5
         tL5Xpv332rg6rnLVxHfi5s9VbC8+sM8AxemmG8aHscdy5hzJCM2u29gsKGYm6DxE78ko
         5hlw==
X-Forwarded-Encrypted: i=1; AHgh+RoqEil0+Y1jeaxZkQpZYGRiGWF92bjGHwiRxx3t+019xwWSEUFM3t3/05n1VtY18zN3EhOUqOEKo/3/@lists.linux.dev
X-Gm-Message-State: AOJu0YyJsDgLZDUd+wzVgke6pIhco8RJn75QmtsRO7xRKsf3/NoL37A6
	go86I+0ApJ+f/uIzKEbNcS5NQOmOp4d30wQEsynGh0QfcSMtTwFnIUL2
X-Gm-Gg: AR+sD10Wo29LjyRWhLPk5aY7qP4D3w3HSi3hTXr3qTZMhi/REXr22vsunXEx04pOesT
	nOpN3Zt15jeyGsZbC11UwXr5lzVX6r7nCdkJrjahzsdsS7A+4UvBd2cub4BSaAXcxhUSSAs2TY2
	FHck0omA6OIyhVdZ51esiHyAoZ5G25XdFT4xH0vv9wg6FjOibviHB0EsbWU0Ka3jt/sTKjDCqxS
	KQXSuq7PBgn0P/kOL7SIJJ/Rd7wytxp025rSTcCUmyeaQcxpjuysFnExKhZqH4Qk9TVQr8sicoL
	iKK4AgHxUhBaC6RQInMajRhOWzloS50EraoyuBnIeW6saeZiR1+ijQmferSzN5HXRoESsU7o+iy
	WVNnY/pVVZRsKattrnVGm1tY2l+4NeGvm0kvVimYK7jqoC6KeMM2hvagrJkJQ86kmWiu9Fl74Lz
	vSb/5g9eN23ouQCMbMUUNrWmpHQpjuYa8V+ThWpRZD6zYCP8cysGJyPozthUFP6Q==
X-Received: by 2002:a05:600c:1d0e:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-49987941a4amr8948855e9.1.1786649544454;
        Thu, 13 Aug 2026 12:32:24 -0700 (PDT)
Received: from [10.245.244.3] ([134.191.227.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20059asm1505239f8f.5.2026.08.13.12.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:32:24 -0700 (PDT)
Message-ID: <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	 <seanjc@google.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "dave.hansen@linux.intel.com"	 <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "kas@kernel.org"	 <kas@kernel.org>,
 "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,  "Li, Xiaoyao"
 <xiaoyao.li@intel.com>, "sathyanarayanan.kuppuswamy@linux.intel.com"	
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "mingo@redhat.com"	
 <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org"	
 <tglx@kernel.org>, "Fang, Peter" <peter.fang@intel.com>, 
 "linux-coco@lists.linux.dev"	 <linux-coco@lists.linux.dev>,
 "x86@kernel.org" <x86@kernel.org>
Date: Thu, 13 Aug 2026 22:32:20 +0300
In-Reply-To: <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
References: <20260729122939.1340412-1-peter.fang@intel.com>
		 <e0a90fba3f8424412387aa08f1fdc708abeedc73.camel@intel.com>
		 <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
		 <anxvwV_Pz4UYaxxt@google.com>
		 <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
		 <anyiwqi9i0NSv0QW@google.com>
		 <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
		 <20260812223707.GD1013044@pedri>
		 <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
		 <anz9b6CDkhr5D5RG@google.com>
	 <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-08-12 at 23:30 +0000, Edgecombe, Rick P wrote:
> Hmm, let me flag Artem to see if he can add anymore weight one way or the=
 other
> from the migration POV.

Hi,

I will just assume the question is: "Is a TD-scoped quote seamcall
fundamentally wrong or acceptable?"

Short answer: I would say acceptable. I see it as a practical tradeoff.

Let me lay out my mental model, which should explain how I came to this
conclusion.

Mental model
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. SGX-based attestation

The original SGX-style flow is two steps:

1. The TD gets TD report.
2. A quoting agent signs that report and produces the quote.

What is quoting agent: a process using a special SGX enclave.

Why 2-step: the key limitation is that the quoting agent cannot fetch
TD evidence such as FW hash or other per-TD data. So the quote is
conceptually:
  - TD report body
  - signature over the report body
  - trust material such as the public attestation key and certificate
    chain

2. DICE-based attestation

The DICE-based model keeps the same two-step flow for compatibility,
but the quoting service runs in the TDX module and can read TD
evidence directly. As a result, the quote can include:
  - TD report body
  - extra per-TD evidence
  - signature over the report body and the extra evidence
  - trust material

IOW: in the SGX-based design, it is impossible to add TD evidence to
the quote. In the DICE-based design, it is possible.

But the question is - OK, it is possible, but why should it be done?

3. Why freezing TD report size

Linux supports 1024-byte TD reports via the `TDX_CMD_GET_REPORT0`
ioctl. It is already full, no more TD evidence fits, and changing TD
report size would require a new ioctl.

Also, as I understand it, based on TDX feature requests from customers,
there may be a need to increase TD report size more often and more
significantly than one would expect.

Therefore, for DICE-based attestation the TDX module adds new TD
evidence in the quote instead of expanding the TD report.

Is this the cleanest approach? Maybe not. A clear separation of
concern, with TD evidence in the report and the quote only adding
signature and trust material, does feel cleaner.

But on the other hand:
 - The quote itself is already a per-TD data structure
 - The it is inherently variable size because it contains
   cryptographic=C2=A0material and trust data
 - A fixed-size TD report means that at least one of them is fixed
   size, not both.

4. Migration-specific case

For the normal user attestation path, the TD report is TD-scoped. For
migration, the report is effectively platform-scoped, just because the
migration flow does not need TD-specific evidence.

I would say that clean design is when Linux does not need to know this
and care about this specific case: be able to treat all TD reports as
per-TD.

Thanks,
Artem.
