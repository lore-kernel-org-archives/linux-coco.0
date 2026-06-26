Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069633BBBA
	for <linux-coco@lists.linux.dev>; Fri, 26 Jun 2026 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506812; cv=none; b=ouCrv/xSAxnJHbKwI0cmDmAO6BPFvhghUv/JW9uDQy9taseq41VQ3QbD3ZtMB2hy/9d1hKqDZZJInZjRx04Sci4NudgYg6Bp8HE+vv6xN32TmlMvg0PcJz+Cz4jfe+nrCWDWe/g6TVuC2V3wOMUS0pFx3fghkr2RfOphnPys17A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506812; c=relaxed/simple;
	bh=e7J9uIK3Aofke44f4FDBkSxZh3Ga4jKB7NqOYQm2LHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hzbcBrWGuhM30HFcFIsDH9IBee/M3Z2wB46Coz8Asc7uqtOLphzpqliNpkbVpBky+RegV1T8KcD9Hwgwhy054a3QUQf2pgndCbpZjAsWWNNxIVf8G0/2zdrVC26l6aBzmjZrtRs68tXpqFUJPko/NGPc4hVkP3hpYiGLy+DI3qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ASVqHznA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ASVqHznA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84534f17866so995904b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 26 Jun 2026 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782506811; x=1783111611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGydA0y/9gCZTrWkuXJsUrWFK6ou+XMOSPMt9MVQDVQ=;
        b=ASVqHznAI3aid1q9OOr7b2U4nAIHrVuGq5zPUd9RjPnmhUrFuBb7aO/IVre0gqEjoN
         cPGEWLOQ3CIAgVZmENAW67Rnb9omLoe1RU8EsZXf2N7dPxnCT5IJJ8hg0d5vyxlZqWcH
         dMVWjs9i1Ot5SaAEMUNaE3CWO7DO9z85yvMqR5CyVCJlFm1FTx04eD07P7saQdJ2H4XR
         q2jl8M/h6s6WufLWzs9NuJkiURadbTW1sAx+d1bdwOthWgiDI8o9oLVaozqZHbcvbRTf
         792JH3Onlzx0neiauNchdl88Lw+nroXD25XS0xZX5Y95AeM09hjBOURTn2dTvigTzo93
         r1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506811; x=1783111611;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KGydA0y/9gCZTrWkuXJsUrWFK6ou+XMOSPMt9MVQDVQ=;
        b=ItiJcA8POiahHCOVz+cyeB2g6K8cfRzbMntPL76FErAfhhWtmgfF5ozc7KPmxELwX9
         ex2x3dM83EOXkKLcWcPffdtJjza5eTre6wLszfmdxpOg7WazgDCyeWNgLxNUQatyqQU0
         eElDDDajShE/XF03RHrCm2YT2qITrCeRhzbJ9xmx6VhheN9lTx3dhJ/E3spk/vl3btjp
         GqiQGUOWEAvOhCy5fx7JzCX36TOMMpJdYy3tgy5b4RI7PUsxoO5RorsqQaqecyI3Iwji
         vHZAE0JpN0N/A+T38DPcyhwwAeLT/ea/BBgz17KepRdXArXZD8U1m/NPJcRJbagXSaVb
         vJvA==
X-Forwarded-Encrypted: i=1; AHgh+RrZOm733VHPfo48nMs8C0RL45oGZ5mcfHoDI8I+iCRmgftpUAfYK4SdWPWGJyNE+ybk+Iogo/ST0tAX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7o4Yx+Txfjqb+0eN0r98t9H55pbm2/VmhT4J793FQic+5a7kk
	9ZIWiKI1eajzGXXLSvHZtuUQAQE7kB1IppyWE1EdlfVu+VPvnYCTa1tuSK3KmYZ2tsG0nuFDRcD
	xdvobQg==
X-Received: from pfm4.prod.google.com ([2002:a05:6a00:724:b0:845:bf85:3f1a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c9a:b0:845:b758:90aa
 with SMTP id d2e1a72fcca58-845d2857835mr1434306b3a.47.1782506810703; Fri, 26
 Jun 2026 13:46:50 -0700 (PDT)
Date: Fri, 26 Jun 2026 13:46:50 -0700
In-Reply-To: <b3b60c37-aaf5-44b4-87bc-6aacd49be717@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260623091556.1500930-1-joro@8bytes.org> <20260623091556.1500930-2-joro@8bytes.org>
 <b3b60c37-aaf5-44b4-87bc-6aacd49be717@amd.com>
Message-ID: <aj7lOltxzAej13RH@google.com>
Subject: Re: [PATCH 1/4] kvm: sev: Fix user-space triggerable WARN_ON on
 snp_launch_update path
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>, Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Joerg Roedel <joerg.roedel@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026, Tom Lendacky wrote:
> On 6/23/26 04:15, J=C3=B6rg R=C3=B6del wrote:
> > From: Joerg Roedel <joerg.roedel@amd.com>
> >=20
> > Sashiko reported on an unrelated patch:
> >=20
> >   [Severity: High]
> >   This is a pre-existing issue, but can a host userspace process trigge=
r a
> >   kernel warning by passing a NULL user address (uaddr =3D 0) here?
> >=20
> >   If params.uaddr is 0, src becomes NULL and passes the PAGE_ALIGNED(sr=
c)
> >   check. kvm_gmem_populate() skips fetching the user page and passes
> >   src_page =3D NULL to sev_gmem_post_populate().
> >=20
> >   That function then unconditionally evaluates:
> >=20
> >   WARN_ON_ONCE(sev_populate_args->type !=3D KVM_SEV_SNP_PAGE_TYPE_ZERO =
&&
> >                !src_page)
> >=20
> >   Since the type isn't ZERO, won't this allow an unprivileged user to s=
pam
> >   the kernel log?
>=20
> It would only be one warning that is emitted, "spam the kernel log" sound=
s
> like you could fill it with warnings. And I would say that the severity i=
s
> only "High" should the kernel be configured with PANIC_ON_WARN.

Yeah, ignore any and all complaints about panic_on_warn=3D1 leading to DoS.

https://lore.kernel.org/all/CABgObfZJV5hU_7WoPWLRH3-EvKts%2BUBZOwtCXmwVZYJP=
8dDo2A@mail.gmail.com

> > The assessment is correct, so check for this condition earlier in the
> > snp_launch_update() path to avoid the WARN_ON_ONCE.
>=20
> I'm not positive, but isn't it technically possible that the userspace
> virtual address can be 0?

Yep, though it requires an explicit opt-in.

  config DEFAULT_MMAP_MIN_ADDR
	int "Low address space to protect from user allocation"
	depends on MMU
	default 4096
	help
	  This is the portion of low virtual memory which should be protected
	  from userspace allocation.  Keeping a user from writing to low pages
	  can help reduce the impact of kernel NULL pointer bugs.

	  For most ppc64 and x86 users with lots of address space
	  a value of 65536 is reasonable and should cause no problems.
	  On arm and other archs it should not be higher than 32768.
	  Programs which use vm86 functionality or have some need to map
	  this low address space will need CAP_SYS_RAWIO or disable this
	  protection by setting the value to 0.

	  This value can be changed after boot using the
	  /proc/sys/vm/mmap_min_addr tunable.

> In which case, should this be fixed in the kvm_gmem_populate() API with m=
aybe
> a new parameter that indicates whether src is valid or not?

Nah, treating 0/NULL as invalid is perfectly acceptable.  It doesn't work t=
oday,
i.e. there's no risk of breaking anyone, and just because userspace can use=
 VA=3D0
for other things doesn't mean KVM needs to support that for all of its uAPI
surface.

FWIW, I was initially opposed to using 0/NULL to mean "invalid", and even c=
alled
it ridiculous, but David W. convinced me that accepting 0/NULL in modern KV=
M uAPI
would violate the principle of least surprise.  So now I get to claim using=
 NULL
to mean invalid as my own original idea ;-)

https://lore.kernel.org/all/a2cfad68277cae67791f07646c842672593a8dca.camel@=
infradead.org
