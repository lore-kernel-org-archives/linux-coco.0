Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6B2E889C
	for <linux-coco@lists.linux.dev>; Fri,  3 Apr 2026 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775257665; cv=none; b=tM028fyITarMVBBQBxnwnVQEbJ7r4Ye5nx6W9LJgRhlZOc+4Ej+xXVRZcsWG+cbP2MdChYHGwUgEZ5Jfz84qjmxcj3wLuCLoP+kA6CQdgSOArOXPEZnZ3kBSHWcn5YxvnApYUQsu0hs0wBYmlnGc8QJOuSHJ/K8PIWrRS+plNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775257665; c=relaxed/simple;
	bh=QFw0rrC9aSRV2WEJT8WSxFXaANoNrpSU9ltrBzCF5KU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cm6V90kHjqPVwuR8fHu75SyK0BZByOdpvsHX6uXmhjomXBqti0sf+FHekvHTnPjsUGBbrpkuoTANueWJLK3/x9S9gV57ZD1s6MSoxhScby6si4EqRHI1zCRYlvo/ll3v7Gz0wv/b5USrqPrxjqzSZKtjLe6T6Ugy7jUVg+NtyWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IO1/ehAz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IO1/ehAz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso1367358b3a.3
        for <linux-coco@lists.linux.dev>; Fri, 03 Apr 2026 16:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775257664; x=1775862464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyvj5kBMSuNn+SZot72GWuwcDIHZb7QGlMIx1bfcdhA=;
        b=IO1/ehAzz+lqDqaQq/KiqiyC06NWU3uOziktmSWOGb1eXNMoroklOyeVqWpzypTbza
         5Yujh0pJyJ/xdN9N6rQwrdDOLaWNid5v4W89pyRNMGwPcYKlNAjv2uS49+O56YIsRBB4
         8ONGwrLpo5R/b3I7HXw4I5wBgBuKaI7e/RtLHDgaIAHzlyIsuB5gIZWrM7nEulaOvFis
         NGVvy47jLuuK/pbGsfq0ne35JCwecYv+xAFRs8x84RvY/w1G0bgRnO0+IE/jh1bISZyZ
         wiItK12c2ZiS0x0OjH3XWvcYC5cMTG+z2vCfAixUBzLxfdznJYAmmucjpqgVvXQpfMIV
         8FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775257664; x=1775862464;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hyvj5kBMSuNn+SZot72GWuwcDIHZb7QGlMIx1bfcdhA=;
        b=DMxBKr6DwvGUw0BgbNTRc8CE6iOqRaT6jCf26BHhB5B/UI1O0ZA5PVtew/nmexPxkI
         XiJOXHVIGlawVle9B76Qb6KygfnJ8yg1awFFNZLj3lolsFd1mgbwAy9ORbiwPgFsTxr2
         Kyz1MuDomNopKVB33/+yMRstpu/IfzLlwlRU9Hs0UsvG965/kunMAfbUmXN20oExyd+P
         Pd2ERha6fES7i0NnE+4FeDYNA9SfurL2Fyrq+f1Iz8Vw6iTLjnon5hBN423GcrzsEVVc
         LyM80yX7qtdjchbnzEQLy89JEoHzrPzDINIdUza9xKMkhbggFITPrtk/swu6HunD6biC
         ukrg==
X-Gm-Message-State: AOJu0YwTSTmdUFAf7/pe5IflZ9tmu1truRLfc2aPuhcuHPJOn9/NPG8Y
	Oe+w0siej0xAVaQ0BRN2bl+02Nkz4N7mfo7XTYJdxoVKifKhfT0zCNkQyDHCDkgibgWvyVePzXV
	zJ/T4hQ==
X-Received: from pfra8.prod.google.com ([2002:aa7:8e88:0:b0:824:ada9:ae89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a89:b0:823:3079:7c7
 with SMTP id d2e1a72fcca58-82d0db6bb43mr4629830b3a.29.1775257663390; Fri, 03
 Apr 2026 16:07:43 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:07:41 -0700
In-Reply-To: <ec581571ab4141ed77e6979b3e03773e301a62c1.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260318190111.1041924-1-dmaluka@chromium.org>
 <94b06319-2be8-4f01-87d1-8989ae1ca85d@intel.com> <cb99e44c-8bc9-4bab-b485-9f63a4d0b262@linux.intel.com>
 <93358559-5ed1-4574-8951-24d7ea9354e4@intel.com> <ee8d7ea3-0ece-43cf-ab07-6954df4c01ad@linux.intel.com>
 <f67179d7050ae28ac261bb6227b1c045c10579c9.camel@intel.com>
 <ac_rNT69TdocrMYc@google.com> <401db97a254b356ad8539a5d637d68ee826179a5.camel@intel.com>
 <adAQCXI-7Yj0wcKA@google.com> <ec581571ab4141ed77e6979b3e03773e301a62c1.camel@intel.com>
Message-ID: <adBIPdBA-aJWcUrY@google.com>
Subject: Re: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@intel.com>, 
	"dmaluka@chromium.org" <dmaluka@chromium.org>, "bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>, 
	"x86@kernel.org" <x86@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026, Rick P Edgecombe wrote:
> On Fri, 2026-04-03 at 12:07 -0700, Sean Christopherson wrote:
> > > > No?=C2=A0 Don't we just want to allow access to MSRs that aren't ac=
celerated?=C2=A0
> > > > What the TDX-Module supports is largely irrelevant, I think.
> > >=20
> > > Not sure if I might be missing the point here. As above, we don't hav=
e
> > > enough info to=C2=A0know which MSRs are accelerated. If the guest ena=
bled #VE
> > > reduction, it changes which ones are accelerated and the VMM is not
> > > notified.
> >=20
> > What does the "accleration" in that case?=C2=A0 Or does it reduce which=
 ones are
> > accelerated?
>=20
> I mean ones where wrmsr is handled by the TDX module instead of generatin=
g a #VE
> that gets morphed into TDVMCALL by the guest. Actually usually called "na=
tive",
> but I just reused your "accelerated" term from the mail.

It's neither.  Precision matters here, otherwise I can't follow along.  Acc=
elerated
means the CPU virtualizes it without software involvement.  Native would me=
an the
guest has direct access to bare metal hardware.  IIUC, what's happening her=
e is
that the TDX-Module is emulating x2APIC stuff.

> So... "Reduced #VE" (also called "VE reduction") reduces which things cau=
se a
> #VE. The guest opts into it and the TDX module starts behaving differentl=
y. It's
> kind of grab bag of changes including changing CPUID behavior, which is a=
nother
> wrinkle. It was intended to fixup guest side TDX arch issues.

And KVM has no visilibity into which mode the guest has selected?  That's a=
wful.

If KVM has no visiblity, then I don't see an option other than for KVM to a=
dvertise
and emulate what it can at all times, and it becomes the guest's responsibi=
lity
to not screw up.  I guess it's not really any different from not trying to =
use
MMIO accesses after switching to x2APIC mode.
