Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892647DF99
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576242; cv=none; b=HtZj6x/FWAQf6KuqnXbOeSPdz40sNkTrYzAmiJRJC5ceSiid78WKGdqYBZ9j9AMtLEERivHTqmgSnrxpNJaYZZv9L8nkgMqkdyHYTtLZLwPFZG2G9rMwuY1k89v75XlhqB/blAoUaSTM2BMKPaF16ndDLSXDXcGMXA9bq3fhzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576242; c=relaxed/simple;
	bh=PWilD9xVtNGdO3Uy6TxTN16d1Yo1Ku7NjIk2U429cdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oHqY6sNyyBJ8RABKfH2Ze2pQCRPwnh7frgBQxjGx2bZrmrsTse8wezEPoU7iZFl4fezBN8tSkXrkvj2emh6GpwYTBFsUH8/ABjmc4EZTPTOdQDCCfdZBtEgnbIzRo2rmS6rxDywOuc6Kr7unEiotlndBGPlK236/QGQeQUgbDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gg1DurDH; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gg1DurDH"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so1688622a12.1
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786576240; x=1787181040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RLBNTc88EjJxi9sbuWlT2lHuO+uKsoJ8s8VrdcOLrzE=;
        b=Gg1DurDHkt2M5PEYlm07V0j0gktr4SQHciuRgxcZXmQQE6iCGR6957QbOSqfJC1HiH
         Q8EvLxiDp7VbAnuJlClGavjTfEDJ85IFKxu5NfKyCG3SgeXLdsRKpwMiKU17FMP51uof
         E0UsXF9cMXziGD3y8oJJsiL4MDlTz6lEzMZSjVu3fLqwACN8hR6alBsFwM1c4tgstvEX
         W/H7Xl6/nKGZi9ZBcSeLJ6gYrOq7jkVQ6G6jPHsYmJsBQ2g8MOO4DeJo+Y4jbdJ3N2h4
         pshsOpuTCHko0/Ir+th0jWA1nNinaFoOweuq2daHQ5dR73DojqRUbhP5RCTCW5AmrUhu
         nVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576240; x=1787181040;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLBNTc88EjJxi9sbuWlT2lHuO+uKsoJ8s8VrdcOLrzE=;
        b=H+xEekq4qTW4zwpSIlPby7/8sjL30XeRNLBRRgOz2hRnX2swHSoBzSSWTwZNHlRKYi
         jxWPs1Uvnk/xMOTT5ibTjZlDXfIArNz4UwCaM7d83/mRCGfrgxF/QR9d7FnMW/mOvVZD
         RrhiKj4PpOIAsHrm4rjuZX4gd1GLGyqdcam6XGsTphJ358WvKL1zCfDGNTj2Tkf5uQSf
         KRvUBHIilZprS4kpD1cLY7cWW1GmmEHqrweypDAIvLfp6n7i93m3F5maVb/00U8ngb4I
         4Y/KTQoR6aQStj0ZtznWT/IY4Xd0v8uRJzfgTqWX8R7qtUI1+TqnHhgeK7Na+rqmNGBC
         tsIA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu04AMclDecRBR1LrEkEutrPozFIMG17LeCuBf0TSiZ69voR/7Ii7pWA951a5G4V3r7e6ioUhWBT0Q@lists.linux.dev
X-Gm-Message-State: AOJu0YyD5/015YUzW72fSJTobDopB2ABMSt3d1Umf383bp4QZ3Qz7gw2
	9h7P+GnhlR1cL7M6TDEcIwYpWJy85Sa9K+fOY0SGpdCCodfyf+6X+UEukhr97LP2bpVzXlY926M
	kXXBOBw==
X-Received: from pgbdq25.prod.google.com ([2002:a05:6a02:f99:b0:cbe:948f:d640])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1409:b0:3bf:ba48:ca88
 with SMTP id adf61e73a8af0-3cc550e101amr2768351637.15.1786576240369; Wed, 12
 Aug 2026 16:10:40 -0700 (PDT)
Date: Wed, 12 Aug 2026 16:10:39 -0700
In-Reply-To: <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729122939.1340412-1-peter.fang@intel.com>
 <e0a90fba3f8424412387aa08f1fdc708abeedc73.camel@intel.com>
 <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
 <anxvwV_Pz4UYaxxt@google.com> <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
 <anyiwqi9i0NSv0QW@google.com> <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
 <20260812223707.GD1013044@pedri> <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
Message-ID: <anz9b6CDkhr5D5RG@google.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Peter Fang <peter.fang@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Artem Bityutskiy <artem.bityutskiy@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-08-12 at 15:37 -0700, Peter Fang wrote:
> > >=20
> > > But part of this too, is that "DICE" is an industry standard [0]. Som=
e of
> > > the existing TDX attestation format is TDX specific, and moving to th=
e
> > > standard is expected to make the verifier better. So TDX does not hav=
e full
> > > flexibility in choosing which bits go where. There is some. But I'm n=
ot sure
> > > which.
> >=20
> > In the SGX era, a lot of this attestation stuff was Intel proprietary
> > and that caused a lot of pain. To follow the DICE standard the bits in
> > the report have specific places to go inside the quote blob. IOW the
> > DICE quote doesn't just carry the report like an attachment, and so the
> > two can't be separated (not without breaking the standard in some way).
>=20
> Yea that was my suspicion. I'm not sure if separating them was really Sea=
n's
> understanding or not.=20

LOL, most definitely not.  Though I have a naive question at this point: wh=
y can't
the TDX-Module extract the bits from the report and put them in the right p=
laces
when generating the quote?

> But the other part is that=C2=A0the verifiers and other VMM infrastructur=
es are
> already expecting this standard format. It would have a lot of downsides.
>=20
> But the "grow the report" or "grow the report and quote" are still option=
s that
> leave the quote in the expected DICE format, right? Sean I'll assume you =
still
> prefer the "grow both" option for the sake of kicking the quoting
> responsibilities out of KVM.

Not necessarily.  If doing the right thing from a "what's intended and sane=
"
perspective is to put some quoting responsibilities on KVM, then so be it. =
 But
I would like to have a passing understanding of what all is going on, if on=
ly so
that I can justify why the new uAPI is being added when I send Paolo a pull
request.  I'm pushing back purely because I quite literally don't understan=
d why
KVM needs to be involved.
