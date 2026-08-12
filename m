Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33585353A66
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553029; cv=none; b=czKh19iX/w/0Yyqvff0HPpGIKPPxMeqwXq87fFIUjMXqAtVX5O92H1zBKDvSqLLYt6okOmV6Jx401UcDV5i0sAcfn70pARL8Ib4uLfhLltRoS2PCOSrGcWQ9dT0qPqckLyVaklXfPGty3KWDJv1niBA9ZIjwRt46bl2HK//ypzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553029; c=relaxed/simple;
	bh=qLDEIioUL3e7c7lhtoaFmAMbbGSjhMZuTdeVLqKZKZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OG091HBfzJQU8KNCofj7cB0duLEWj+KfJHfN9M819/mPalh8ECM3lNFbswnptoYNFzWw0HhWn96hcpC5tmHzswnpov0pCymTzAXuqwsAJ6O/LOKEJcRzaX0wyI2YGnfXtolTYChCixclUpOF/r0cCXKkD8mUpp1v7D4aewjQN7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PNV0ggsx; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PNV0ggsx"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so16652135ad.1
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786553027; x=1787157827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EVPNR6FWW7kQEwr41zGzOGzrHjzU+yGB7D+zhP7khak=;
        b=PNV0ggsxeeX/zOwddhu+cCcG8Br1h2+3ljssf5PlvpcVIfmvUXb/l+9YJH7C+QQsfG
         dNL9iuc/jE4NQQcPS9CGJFeUQTNT8bhB6zPkhh7g1Ts+h3M3/DcfsP6abmGTzYuA441x
         yv8ThcKZxC/8gXGSd0EMCMOtTU0GNqd33ar4M6W+732Dwpvz3wM1M5bVUjcfvCfUl6AH
         72uDmHVerw3PSfDIvI58+BnoLvrRIW1InB5kqyCMwKJx8UQJF1c7HNAt14G3CE3DBESC
         pkJbuBt4Ic3lGIdKH9m96ciLm5suJAd7SLYEULTyH4hmAPXPgr0knk1Rjdz0hvD2H2ui
         zqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786553027; x=1787157827;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVPNR6FWW7kQEwr41zGzOGzrHjzU+yGB7D+zhP7khak=;
        b=pA2qOaUL4/rfUC+GOHyOVx2BZ57lyqOy7lgZ3bOny13kncTmk57n5Sjxnf+hLig+kr
         AKDF83pUks5W7XQvRdX+Z6pCbJfHjMU58dYccxuj1LoIh7dSKYlH8BD4U0SaJe3vpoe5
         eDLNkylIbJ+XJz7oPFfVORW+2G/e2WEWrkqLpI8QUSA7IpHEYXoGn2OkfmwJNuVf7545
         h42D/216aYXOjWbiAxju/8ktQ+K80etBV1CJQQm8ucMuOEhJOGLRt85E9iaY4kSno3cW
         z/p+UVJaKMYHA8Ls7sKIoD83JhLq3qZ/IMnVSd1hKoWidhcyp9iDxG/zayh6+qRinXaQ
         GL8w==
X-Forwarded-Encrypted: i=1; AHgh+RoLQDVbDvEsTgEL5SuoP0Penl7RnNWMsl/F9ktfzU/n6lq2Hsgz1MQy4esevjhLUpWSkKm8UYL5pOTH@lists.linux.dev
X-Gm-Message-State: AOJu0YwjBI1/Ru5MLJpqpBi12AiK+WaPbjgGLKjzMXPft5MkZBMR1PbO
	P9lluZmBglmvL2u7E4S+O7HDdTF/5ycOhO2EVzFM5sz0UcfgcWU/EKdfJBUXqtTR+5ayzIXMOVk
	P/ksrrQ==
X-Received: from plbkr8.prod.google.com ([2002:a17:903:808:b0:2cc:8741:f340])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2cb:b0:2ca:d658:d874
 with SMTP id d9443c01a7336-2d345713af3mr80782795ad.23.1786553027152; Wed, 12
 Aug 2026 09:43:47 -0700 (PDT)
Date: Wed, 12 Aug 2026 09:43:46 -0700
In-Reply-To: <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
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
Message-ID: <anyiwqi9i0NSv0QW@google.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "hpa@zytor.com" <hpa@zytor.com>, Xiaoyao Li <xiaoyao.li@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Artem Bityutskiy <artem.bityutskiy@intel.com>, Peter Fang <peter.fang@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-08-12 at 07:08 -0700, Sean Christopherson wrote:
> > > =C2=A0 |Normal quote=C2=A0=C2=A0=C2=A0 |Migration quote |Report size|=
Quote size|uAPI location=C2=A0 |
> > > -|----------------|----------------|-----------|----------|----------=
-----|
> > > 1|Platform scoped |Platform scoped |Grows=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |Grows=C2=A0=C2=A0=C2=A0=C2=A0 |TDX host driver|
> >=20
> > With my KVM hat on, this option looks very attractive.
> >=20
> > And with the caveat that I'm most definitely not an attestation expert,=
 from a
> > separate of concerns perspective, IMO it seems like the report should c=
ontain
> > the TD-specific information while the quote just wraps that information=
 in
> > platform-specific goo.
> >=20
> > In other words, to me, TD-scoped quotes feel like a hack that was throw=
n in to
> > avoid having to modify the guest because y'all didn't plan ahead.
>=20
> Caveman crypto person here too.=C2=A0It seems scattered and makes me simi=
larly
> suspicious about some lack of planning. But I kind of came to a different
> conclusion on what went wrong.
>=20
> It seems to me that from the overall solution level, the report should ne=
ver
> have had the details in it. It should just be some nonce or some type of =
thing
> that can tie the guest request to the quote that it ends up getting
> back.=C2=A0Doesn't it seem weird to get a bunch of details from the TDX m=
odule, then
> pass them from the guest to host KVM to host userspace then back to the T=
DX
> module... which already had all those details?

Hmm, my mental model of this is that the report contains the "real" payload=
, i.e.
the metadata describing what is running and whatnot, while the quote effect=
ively
signs the payload to prove the provenance of the report.  That's why I view=
 the
report as TD-specific (what's running) and the quote as platform-specific (=
provides
root of trust).

> My understanding was that the original SGX attestation was a complicator =
of the
> design of this stuff. Because I'm not sure that SGX had all those details=
 about
> the TD. In fact I can't see how it could have. Is that right Peter? So it=
 needs
> them all to be passed in. All the extra validations etc of this shuffling=
 is
> TDX's problems to deal with, but for Linux, it would be at least a lot le=
ss
> confusing if there was not two things that have the TD details in them.
>=20
> That said, from KVM POV, (1) kicks the attestation out of KVM. I see the
> benefit. But a TD quote is a TD scoped operation in concept. To me at lea=
st.
