Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100642F83A9
	for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015320; cv=none; b=U2c9Nxy7VjQnV7WdXk3wu6YOvgOnw13S/KdqWqh7f2UT7u2tMQyMRLBY8dFyGkmOuJGv2NRhmuXazVwnExOnbLWAbBVcVOu7I58iBr3OttnW89zbWnnZKPqSn27lrq+n/aMF56nhUILN71fRa/XyJxxdwsGpPgBvE/CKcjoIryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015320; c=relaxed/simple;
	bh=XVjYBTS2KGt7goLI6C/1KU/4w/STuIeq0qoCdNlUrGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wf7inSt9jQDJynHidNnILaKnhFKtyz/RysxL8osctUAu3JysUdw+cIeSBUSOVG9Slprj6IBm9ji6wC1eLxxNIrjhwiE25d6ZKkVSzuNRirwg08ubS2sgPCng7Mo+F5n0ADjM6komlWnU3oTJNixwRwFuxu/sh0E3EX5riBHkUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6uL5A8q; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6uL5A8q"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b4705264d55so24736a12.1
        for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755015318; x=1755620118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pEqkeQuAV3L4A0Lw5G3RFgUoQ/ZjQh6LSrZjNgJPNI=;
        b=F6uL5A8qRLeKySfYHzUBlCdW9a0c8igXbxt2Mf5PPjaqqYrkNreNHAelc7TFWM+i+J
         UXWicT+49A+iYblRQJyNonnsxZd9iiqZpDGVnWysq3nKOh1EAvSKvRLbTRq4exCA70/w
         IPrbjU5pWUXEqdOT4f2gFx8wmI5jpfY/5mgoguKYgpRmB2Vfxzry4/32nOra3dGCgPVr
         rtga6gRMIXa3cHnrcZBt20T37tz3MGFxnRswgAlj9I12+DBDGNI2XLvBBKRH1yU1AJd3
         /Ab4jVuZXgL7R8S+HiagqWJXy/zSNSgYztmRURa76z5clKKff+/pV3DqY8oor/VbxXeV
         LNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755015318; x=1755620118;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5pEqkeQuAV3L4A0Lw5G3RFgUoQ/ZjQh6LSrZjNgJPNI=;
        b=SW2373bv35JlnwBG0NjsVpTSkAR8P4AteD8qU6hlCcbBZ/MEfgllYCcr606d2QSMHa
         oZ0AuBgh98+ZqgA1QW6t5Uc7y4S22wBxc5N9wpvuKtsmUYNjNPR1j+ShTpNP6CqkbqIf
         fL9/NVorJOW7PYDj4m2ghXavF6Y+8KDMITerh5cldCO6Xt7OeBpyZblyKj8JS3CcZHtf
         bMhEQ8aF+kNw/6mZWC6Bq+t790N/LxR1PLOwMgZ/eOWbi1nlUgCrxUt0KzNYWiAaIgNp
         cBYzLRkCO6oZxwTBYM4uPS9ShiAq66CpxWulJkfvoOZ+07qfD91ROfz2x6exLKMSVFIE
         6nzA==
X-Forwarded-Encrypted: i=1; AJvYcCU6uRAnM9kxIl69BDyw+ZX97ac5JMkG9CTxj2kw41dbseVphxhfoKdzTj1VepMzJSy56hieilURboZg@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu79QzLb1FuNV3emmwySN3EmBHmXLFrZQsljxZEgXUybFkggP8
	FcIuFLSgbh0H/i1rI+I6Dio+uNc8F0VNv71i/gpf/Isb4SOIaOgCqZegeijyah+uzFt34+REg+g
	HeJmjuQ==
X-Google-Smtp-Source: AGHT+IEIGklytDuO098frGHJzyJ3yZRVliKBVeAumtBOorVRU3x/EXPXJcBchkgt+lcP6VjhpK035jm2Fmw=
X-Received: from plrj9.prod.google.com ([2002:a17:903:289:b0:242:abd5:b3bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40c:b0:23f:c760:fe02
 with SMTP id d9443c01a7336-2430c7e4923mr998905ad.9.1755015318299; Tue, 12 Aug
 2025 09:15:18 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:15:16 -0700
In-Reply-To: <57755acf553c79d0b337736eb4d6295e61be722f.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <d432b8b7cfc413001c743805787990fe0860e780.camel@intel.com>
 <sjhioktjzegjmyuaisde7ui7lsrhnolx6yjmikhhwlxxfba5bh@ss6igliiimas>
 <c2a62badf190717a251d269a6905872b01e8e340.camel@intel.com>
 <aJqgosNUjrCfH_WN@google.com> <CAGtprH9TX4s6jQTq0YbiohXs9jyHGOFvQTZD9ph8nELhxb3tgA@mail.gmail.com>
 <itbtox4nck665paycb5kpu3k54bfzxavtvgrxwj26xlhqfarsu@tjlm2ddtuzp3> <57755acf553c79d0b337736eb4d6295e61be722f.camel@intel.com>
Message-ID: <aJtolM_59M5xVxcY@google.com>
Subject: Re: [PATCHv2 00/12] TDX: Enable Dynamic PAMT
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kas@kernel.org" <kas@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chao Gao <chao.gao@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>, Kai Huang <kai.huang@intel.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025, Rick P Edgecombe wrote:
> On Tue, 2025-08-12 at 09:04 +0100, kas@kernel.org wrote:
> > > > E.g. for things like TDCS pages and to some extent non-leaf S-EPT
> > > > pages, on-demand PAMT management seems reasonable.=C2=A0 But for PA=
MTs that
> > > > are used to track guest-assigned memory, which is the vaaast majori=
ty
> > > > of PAMT memory, why not hook guest_memfd?
> > >=20
> > > This seems fine for 4K page backing. But when TDX VMs have huge page
> > > backing, the vast majority of private memory memory wouldn't need PAM=
T
> > > allocation for 4K granularity.
> > >=20
> > > IIUC guest_memfd allocation happening at 2M granularity doesn't
> > > necessarily translate to 2M mapping in guest EPT entries. If the DPAM=
T
> > > support is to be properly utilized for huge page backings, there is a
> > > value in not attaching PAMT allocation with guest_memfd allocation.

I don't disagree, but the host needs to plan for the worst, especially sinc=
e the
guest can effectively dictate the max page size of S-EPT mappings.  AFAIK, =
there
are no plans to support memory overcommit for TDX guests, so unless a deplo=
yment
wants to roll the dice and hope TDX guests will use hugepages for N% of the=
ir
memory, the host will want to reserve 0.4% of guest memory for PAMTs to ens=
ure
it doesn't unintentionally DoS the guest with an OOM condition.

Ditto for any use case that wants to support dirty logging (ugh), because d=
irty
logging will require demoting all of guest memory to 4KiB mappings.

> > Right.
> >=20
> > It also requires special handling in many places in core-mm. Like, what
> > happens if THP in guest memfd got split. Who would allocate PAMT for it=
?

guest_memfd?  I don't see why core-mm would need to get involved.  And I de=
finitely
don't see how handling page splits in guest_memfd would be more complicated=
 than
handling them in KVM's MMU.

> > Migration will be more complicated too (when we get there).

Which type of migration?  Live migration or page migration?

> I actually went down this path too, but the problem I hit was that TDX mo=
dule
> wants the PAMT page size to match the S-EPT page size.=20

Right, but over-populating the PAMT would just result in "wasted" memory, c=
orrect?
I.e. KVM can always provide more PAMT entries than are needed.  Or am I
misunderstanding how dynamic PAMT works?

In other words, IMO, reclaiming PAMT pages on-demand is also a premature op=
timization
of sorts, as it's not obvious to me that the host would actually be able to=
 take
advantage of the unused memory.

> And the S-EPT size will depend on runtime behavior of the guest. I'm not =
sure
> why TDX module requires this though. Kirill, I'd be curious to understand=
 the
> constraint more if you recall.
>=20
> But in any case, it seems there are multiple reasons.
