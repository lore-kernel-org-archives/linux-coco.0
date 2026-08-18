Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8C357D13
	for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085467; cv=none; b=fXQWZ15dG5Ot2gpi1Wne6pvQ7apfM1ZirD6w9YGtbgsMdGp3lZ8TMEpZbB3bONy6YTOlRiwvE6lBkxHwufCRR6j8c6tWRY13wohjHAJcgFcducld0IJY2rYFaJ9JWvit3E7WhgbM1O7ahg02K4RPWZbehojEPSc7rLl9GFTW9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085467; c=relaxed/simple;
	bh=6iPIb/NGfhyw66q8Gzx9C/Hh1IrKPQkJh6eoXaONCgI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZOR+EgYc6pvdOmQzxVrW4BqGi4e5UaNPchFhzcMf9cXAOAohZeRPJVO73NNAEmpHBSWRGfnQoQj4ldJU5kNW6gew2R11aukTym/+1LhaYVVZU+Ba03Y8m3d8fvmidW/Ze48V8CQtYdpEnjyxXVUPj5WWVViYUyGB0TGyzSvNWag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTgP7Mgc; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTgP7Mgc"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so586885a91.1
        for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787085466; x=1787690266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5bvSIbOOi/LGDNWtBrRegseU7kGQ5JA6GPeCKC+/MNs=;
        b=YTgP7Mgcz1e6E+yVtK64SPvxN2V5GiQ+8eAmOgFW5uZriC38kGz4jML5kt99nIpoqp
         ABhqOR3UMLeVuweVhbdUxNj7UY9+kDfs6A46MlD8st0S2ZOT2ZVjbO5C7ztz3uzfgtf8
         7AIkTpWk5YxrSYwMeCXMwaHYU0+IiGj3y6qfcnQw+wmNBLum/E1K8sVMYcE6zM8ECqiZ
         pcySILTltEac1sasqQq+o+DhMgUOCH47/2LEaEvImPa0zVyQdFZijjOuhKM3fZllYtl1
         cRYWwRKuT8J3HhrRD07vjZY1Qq9qDOhSe+RSBbNQAZ+5o9j1qmkT+cp66fKy1uxEonn4
         a/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085466; x=1787690266;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bvSIbOOi/LGDNWtBrRegseU7kGQ5JA6GPeCKC+/MNs=;
        b=CxPFOAYRdmh42d3SEa4jtS1fB2z7siwZbBPblaTjvrJVDlCwKE/eSLHXLMA1V2ur0d
         QxVP34xcbvsr4mW5eZ8m3uUtfxMkmU0XyU5+x6c0igPC7T88Jvi4qwk1Q+E1mXZbsh2w
         3E2xNszsFUxPV9J3zj09Q1iVqg3cD/TTNNg9/DlF3LN2ppkkn4h3Ny5Aibn/G6DtVwmN
         KqghIj3h8X7AxIU4n93EQFaxf43PDahqCAD3b31WE9iL5kxGObgKDQnvtD11tx3l56rh
         ZvQmCxTJm+pOATPvnD1JqEyefN53EDQ5K7h5y96PzkfQ4RPvRRf/y71+CrgunyXsqbKt
         pU+w==
X-Forwarded-Encrypted: i=1; AHgh+RrRyWp9SRHNYcqLGwGYUWuH7R+ah3huqxQKDMp/stynpW9b8cQjBmqbZUkqjWqqs2GLNDmKrktyCFga@lists.linux.dev
X-Gm-Message-State: AOJu0YwTPljjEc568u1IHzsczLltBoJOoeTI2gep2iMZ2A6HavcFNJh/
	UHbzPq1Tw6AhX305q/pjrfeACaVwzB5Wd1bl5qDg2R894gVfSfw3vGqmzxafasooltLyNw/twuW
	9PbMDdQ==
X-Received: from pjbga10.prod.google.com ([2002:a17:90b:38a:b0:381:fafe:3071])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e50:b0:38e:2524:724f
 with SMTP id 98e67ed59e1d1-3957b2d203amr652642a91.12.1787085465373; Tue, 18
 Aug 2026 13:37:45 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:37:44 -0700
In-Reply-To: <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
 <anxvwV_Pz4UYaxxt@google.com> <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
 <anyiwqi9i0NSv0QW@google.com> <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
 <20260812223707.GD1013044@pedri> <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
 <anz9b6CDkhr5D5RG@google.com> <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
 <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
Message-ID: <aoTCmJXjQQbXRKqv@google.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Sean Christopherson <seanjc@google.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	Peter Fang <peter.fang@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026, Artem Bityutskiy wrote:
> IOW: in the SGX-based design, it is impossible to add TD evidence to
> the quote. In the DICE-based design, it is possible.
>=20
> But the question is - OK, it is possible, but why should it be done?
>=20
> 3. Why freezing TD report size
>=20
> Linux supports 1024-byte TD reports via the `TDX_CMD_GET_REPORT0`
> ioctl. It is already full, no more TD evidence fits, and changing TD
> report size would require a new ioctl.

So instead of adding new uAPI for the guest, TDX adds new uAPI to KVM?  Tha=
t's
not a very compelling argument.

> Also, as I understand it, based on TDX feature requests from customers, t=
here
> may be a need to increase TD report size more often and more significantl=
y
> than one would expect.

Who cares?  And I mean that literally, i.e. "who" as in "what chunk of code=
 is
negatively affected if the TD report size changes".  "GET" ioctls whose pay=
loads
have varying size aren't novel, nor are they particularly difficult to impl=
ement
or work with.  What's so bad about adding e.g. TDX_CMD_GET_REPORT0_2 to all=
ow for
a variable sized payload and any other mistakes we made with TDX_CMD_GET_RE=
PORT0?

> Therefore, for DICE-based attestation the TDX module adds new TD
> evidence in the quote instead of expanding the TD report.
>=20
> Is this the cleanest approach? Maybe not. A clear separation of
> concern, with TD evidence in the report and the quote only adding
> signature and trust material, does feel cleaner.
>=20
> But on the other hand:
>  - The quote itself is already a per-TD data structure
>  - The it is inherently variable size because it contains
>    cryptographic=C2=A0material and trust data
>  - A fixed-size TD report means that at least one of them is fixed
>    size, not both.

Taking this argument a step further, why even have a TD report?  If DICE-ba=
sed
attestation can "add evidence" at quote-time, then just throw away the sepa=
rate
report entirely.

> 4. Migration-specific case
>=20
> For the normal user attestation path, the TD report is TD-scoped. For

That's not a TD report.  Call it whatever you want, but it's not a report a=
bout
a TD.  If the claim is that "TD" can mean something other than a TDX VM, de=
pending
on the context, then that needs to stop, because there is no way anyone is =
going
to be able to follow along.

> migration, the report is effectively platform-scoped, just because the
> migration flow does not need TD-specific evidence.
>=20
> I would say that clean design is when Linux does not need to know this
> and care about this specific case: be able to treat all TD reports as
> per-TD.
