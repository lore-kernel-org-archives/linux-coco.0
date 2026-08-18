Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8CD35E1A8
	for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051358; cv=none; b=VFd7Qx9C+b2pQ1gQSAG+nY8Qc+IHHaoZNI9DNGGO7z2LnErwj9r+7Ew1lRK1mPDUa7oHL2z7zvmxTMt/mdiLTfAqslb1IqlWJruOYSXM1kAtx/3OAsxomc2kAYbODFo2QIr8VbP8+cyk9o1d38rIuzrFL6O4R4zKx8UG/rgdcYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051358; c=relaxed/simple;
	bh=1p6nZ20jw4LUTgx/Y5mwhRhU4CxUnUa0MQ66rPqdx6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=deSCP6a9NarP87KGMnbPoqcFsBT+u4PQJGsU/uHtPgm4iO6+mJ5d4ACk6SIGDMLZmj3+Q20PdWTt/K8khDg2eR2mwF3mH6uevqJFaP/yhLoUm8RbVt/8RZjrteBgNZ3MWKqu+s+Z8A5FSXZT4sZLNkG7jXS3y0e6pI968k0/EyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj99h95V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj99h95V"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49954b88fffso50322715e9.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051355; x=1787656155; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1p6nZ20jw4LUTgx/Y5mwhRhU4CxUnUa0MQ66rPqdx6M=;
        b=Dj99h95VetKeeywPwWCIPhH1OuuA6Uvgj/6qD1WOofu8YiklI/MAV60msgOeM2SkmG
         aOBkaQfSuaJqiyRhxPrcAKGTG8ISMMBR3rUsu2SwP+XbsSPJGqlxon+bv4QFnM0s5vKo
         DFAVGafWF0XCvo4s0mFei4elmLWb1YDG1oOM/TScrG0aFX1+YEjA1x6HTDJBimGH3G80
         ktaWTP+qc+riCy8qyqm1D6yED0P1YO0rwRF/NUd7wJ3F+OruB5v+XcFJC1rYmzrWMFfW
         JmvdnMVsUuEKaYNyrJ9a133kMopDVEGuQ8LcgdTaxylf1LuCAOTU5k9NBS+WAvftHgS/
         CD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051355; x=1787656155;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p6nZ20jw4LUTgx/Y5mwhRhU4CxUnUa0MQ66rPqdx6M=;
        b=WyU8piU7yV48lyX2aV1EvmbERhxSD5iFkPJAJwEdUUgtxxECRw+PmyRb55IRAQI6z4
         RzqkoGrIKmItWMxcm6HwqTPTg8yqvFynqUq675ZxIkcPK0v7MMzpss9oEXXwf9b2ISby
         kyX9exj07eU9Zb8jSuDE9AeE00DWZKYoUVyrgQcbzTEkLEiT/SP1yUpcACcuJIxSWRAN
         HmLq1O71p2cq+rjAK35pjCxhXfb/wPWFXJXl7QyRqLkCjXWXiPhKeaGrmIXvPSt1RI7X
         9tkIz0msrz6BwlnQTuxM8mNhoj9NsYISFJitLb9dvmTgmvoOc8jqYh+5c5pM5JmlLa2D
         Qizw==
X-Forwarded-Encrypted: i=1; AHgh+RqTXvbfR26ppQmIcfprHhcJ+KEX2j+118vg4PFl92TBFFwvZqRKO93tvhZlieXHILf+mqIiNr76N13K@lists.linux.dev
X-Gm-Message-State: AOJu0YznEXap5//PGUVYugSTI+qPu6zMEm6XOvJ5wbJ5O51Rlws2sP4L
	cYCgzxo+p0oxEFrJvj7swluFtUZ/Xc+4jbbMPs9fu4rKn84shB1T9Ufe
X-Gm-Gg: AR+sD122gQ02fdYChc+iUMgV+JkkKt79OsQLso0HO5KR2fh7soyG/ZnnW0JkRhINudr
	ZpgT1nV4ATTjbbfZnljkp8kp5T3xHHyu+u69DoCLsgP9BHpEMJmaj/PSuPutzQDJ+mW8Haglcxy
	ePycALri/H4aiLLQyyWQ+CZliTbDz4AvsrHpX3UMZGl78ACg+a24TCRBckBV2xg/g8xJPH45ANy
	4mDDk6czMgV8wRelDMw/dnD5/zsk+QNDbrwAJxqYCw1jGP5EB7fD7DqrxLTKdnTWRgDm9q29K95
	rsQXWfq22Hk2MgUwWYxd2Evsuok1oDsaY2n2NJpJo+P9/AS/UQjeN7+xWAQSb6lwxTOHak1GQHo
	2PGN5jZh4nGkoChBQ4k86sKuoRqAIf3CBwtqRzMHsMT6LkAJ6q0RdAP48bZQX4DATSNx3s7wvRt
	ax8cb+i4b/Ggzo7246at181DwFyuTsjOmTGn7AcjEy17CjzHOgWNFUmuhHJ6R1iKM=
X-Received: by 2002:a05:600c:3b1d:b0:499:87b6:f3c0 with SMTP id 5b1f17b1804b1-4998807e4c9mr507923515e9.14.1787051355348;
        Tue, 18 Aug 2026 04:09:15 -0700 (PDT)
Received: from [10.245.245.215] ([134.191.227.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm301473815e9.4.2026.08.18.04.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:09:14 -0700 (PDT)
Message-ID: <83968006d6ee498621978d81a02659bb6186a0b9.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	 <seanjc@google.com>
Cc: "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>, 
 "x86@kernel.org"	 <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
 "binbin.wu@linux.intel.com"	 <binbin.wu@linux.intel.com>, "Li, Xiaoyao"
 <xiaoyao.li@intel.com>,  "sathyanarayanan.kuppuswamy@linux.intel.com"	
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "dave.hansen@linux.intel.com"	 <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>,  "kvm@vger.kernel.org"	
 <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,  "mingo@redhat.com"	 <mingo@redhat.com>,
 "Fang, Peter" <peter.fang@intel.com>
Date: Tue, 18 Aug 2026 14:09:11 +0300
In-Reply-To: <0b5a26492f367f793aab38e4a0d9d6f398340f51.camel@intel.com>
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
		 <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
		 <4ad451969522eecb445289ca74a88ee73d51336d.camel@intel.com>
		 <8b432c8731167e97432b2e917d0b1c855fedf47c.camel@gmail.com>
		 <21ffbb7b80c0c654c23a97cda55f43c73e49ba25.camel@intel.com>
		 <498af8d6a5de3ee05e0216ea075c0eebf88c7072.camel@gmail.com>
	 <0b5a26492f367f793aab38e4a0d9d6f398340f51.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-08-17 at 17:26 +0000, Edgecombe, Rick P wrote:
> > I am curious if today this is an attestation-only problem or a pattern.
> > I mean this "many TDs compete for a shared TDX capability, VMM needs to
> > be involved to handle fairness".
> >=20
>=20
> Yea, I think it is a really good question. This is getting off topic now,=
 but...
>=20
> There is an existing issue we have with the "host priority" (HP) bit. Thi=
s is a
> part of the TDX arch that is designed to help with guest host contention.=
 For
> example a TDG call like ACCEPT can take an S-EPT lock that the host wants=
 to
> also take with a TDH call. It is sort of important to have the host be in
> ultimate control. So the way the HP bit works is, if the host meets conte=
ntion,
> it sets the HP bit. The bit means if the guest tries to take the lock aga=
in, it
> is blocked without letting the lock get taken. This gives the host a chan=
ce to
> retry and succeed. After the host succeeds in taking the lock, the HP bit=
 is
> cleared. This is like a crude fairness thing.

Thanks. Yes, sounds crude, and it does not look like it covers
fairness across TDs. It only covers the "VMM has priority" part.

> But it all depends on the host retrying. If the host never retries becaus=
e
> userspace intervenes, then the guest stays locked out. We actually hit th=
is
> condition in the tdx mmu stress selftest. So it is on the to-do list to f=
ix in
> TDX arch.

I see, the VMM not making progress blocks TDs which could make
progress=C2=A0otherwise. Thanks for the info.

TDX specs describe the HP_LOCK_TIMEOUT per-TD property (set by the host
via TDH.MNG.WR), which could be used to somewhat make the symptom
somewhat controllable, may be make pain less painful, but it is not a
cure for the illness.

> Now how this connects to the 1-flow vs 2-flow design... As we have been
> discussing this quote/report stuff, I wondered if we couldn't solve the H=
P bit
> problems with a similar 2-flow thing. For example a TDG.ACCEPT call could=
 exit
> to the host without taking any locks and providing some kind of token, th=
at a
> paired TDH call could be used to complete the accept (and take the locks)=
. TDH
> calls should not be able to accept guest memory arbitrarily, so there nee=
ds to
> be some kind of security validation on the TDH call. But then the host co=
uld
> control all the scheduling/priority stuff. The overall solution would be =
better
> for having this locking balancing stuff done in a single place where ther=
e are
> no odd overlaps. But it means we also have extra host code for every TDG =
call
> that takes a problematic lock. Probably more TDX module complexity too.

Yeah. We have TDG.VP.VMCALL as an "exit to the VMM and let it handle
stuff" capability.=C2=A0

So essentially you are pointing out that one of the=C2=A0approaches is
turning a problematic

TDCALL[TDG.ABRA.CADABRA]

into a

TDCALL[TDG.VP.VMCALL]<AbraCadabra>.

I guess this approach could be used in few selected cases.

Thanks!
