Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FB18024
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153448; cv=none; b=WqGGudkDYCHM6jHftMl4gxhTVBu5v6Lh2u8BOigZpWi5C6yZyJh/VpiUMlJeOQsbV692NP9lT0tbjllc/qQRUHooujIegvPlHmZwweZcdTEXe8pp1/r0ks/S5MZEZanjUmKgvVaHTl51QHBW2oBueCRIKYigCkBBSULtjxfYxKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153448; c=relaxed/simple;
	bh=q7TBmmYy5zKha9UWOs8VX5s4nynivNQu/jxFVFMQUSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JGTWFPbXKs/GaVWwZFUhh8++AilKy+bOpWFCnV/sSMdEkjUrpLfGduB7HcmVaQrCxCCf8rGfBF/b88FJ9Ir/jCoZktZrsQg4IK1txQMXFkmrq/K4BFsoVIXytkHPzNIJcVKW4IWzHx3EEKHuPAgf72oo9iqH63nekjmFcwdMObI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w4USU2lD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w4USU2lD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a8fc061ce1so30883285ad.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770153447; x=1770758247; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0/+kZSHM7M0m1jLitFGSeKA06Tacic7vjEUioHDGHc=;
        b=w4USU2lDef1HQLvyq4r19/p3TewcLKCrQpLy17Usj/fXxQLow/qme1aArtGVbdfHjr
         y4wFM+lCMKy76jJPdP5Sh6eBdTpqQFt21kK7BZ9YXJFZFy9xuFYmAwQuoybZ4zr8uA+f
         NbLrUXUvXCsKyd6r+EMyMrY4mmNbtw+Dby7xQ32LyIvu6jL/09jCNJtOGH8MnF4TZ+Kq
         sCil0HRHA0+gkItKlc+x7OC5ZRj8RGoRewyJ/Mn3R2pnlqh4w0B5zmq6na5D7UvCmAIB
         p8I2sib/q0kzME82w4GE/RR4OnaDZcea5CGPXkeh9vWes4epY6wSDgFs3rnajHEPbLMv
         i/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153447; x=1770758247;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D0/+kZSHM7M0m1jLitFGSeKA06Tacic7vjEUioHDGHc=;
        b=RRuWBMBV67n4B8AZSbhnCEszQ6IgUfP0Az2Q3mt3K8DqGtuJWdEyKFCcIYPSAGbzcH
         y+4zq0p0uWVp9ZtyNzICHlnWh1RrL8ou8MPnpCXaHPC2r6/RJLRG7STSaShvCnbcK35k
         8eQHTiY379R3yoxCrDNHW5FJBj0Z6PtCNsYariTGWD6fROiup5stnFtIHHedPeYB2JYy
         oHUIldyFbUdMof/4hWLQL2TwwltN/8+I9MYuvSrq5e6fVNXhzIBX42PbxZgSLputSi+J
         TcJd/LdWYI6T3yamAV8nlHfd0zu53ALyq6VV1+kgwxiBrYLRoBC8DbQ+eyzcRbBBBVzL
         3u3A==
X-Forwarded-Encrypted: i=1; AJvYcCXOlqWg0CEA7dSRBcHcmEeMaJoL89EFIGWAUtzkIR/tmvD/i5O89qARdXpxvx2SxpkLcFa5AF2fsfJ5@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6lBz7vxCsz1DfeopQFf9Z+cYlqI9/AZGQiTuQX7HElhcgLcEH
	dbqStiiu078fLKykW4xF/yMvsBEUayEZ6MkIohl2Eh0fuhJ8btKTNzdYBr2vEjpHFr/ER4ijUeB
	kGX310A==
X-Received: from plrq7.prod.google.com ([2002:a17:902:b107:b0:2a0:c92e:a37a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8cd:b0:2a7:683c:afc6
 with SMTP id d9443c01a7336-2a933fbc24emr6884695ad.39.1770153446865; Tue, 03
 Feb 2026 13:17:26 -0800 (PST)
Date: Tue, 3 Feb 2026 13:17:25 -0800
In-Reply-To: <c01b2f81e025dd38be90d3820260c488c7eb22ce.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-20-seanjc@google.com>
 <de05853257e9cc66998101943f78a4b7e6e3d741.camel@intel.com>
 <aYJWvKagesT3FPfI@google.com> <c01b2f81e025dd38be90d3820260c488c7eb22ce.camel@intel.com>
Message-ID: <aYJl5XoQw5In9DOr@google.com>
Subject: Re: [RFC PATCH v5 19/45] KVM: Allow owner of kvm_mmu_memory_cache to
 provide a custom page allocator
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sagis@google.com" <sagis@google.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-02-03 at 12:12 -0800, Sean Christopherson wrote:
> > > E.g., I thought we might be able to use it to allocate a structure wh=
ich has
> > > "pair of DPAMT pages" so it could be assigned to 'struct kvm_mmu_page=
'.=C2=A0 But
> > > it seems you abandoned this idea.=C2=A0 May I ask why?=C2=A0 Just wan=
t to understand
> > > the reasoning here.
> >=20
> > Because that requires more complexity and there's no known use case, an=
d I
> > don't see an obvious way for a use case to come along.=C2=A0 All of the
> > motiviations for a custom allocation scheme that I can think of apply o=
nly to
> > full pages, or fit nicely in a kmem_cache.
> >=20
> > Specifically, the "cache" logic is already bifurcated between "kmem_cac=
he' and
> > "page" usage.=C2=A0 Further splitting the "page" case doesn't require m=
odifications
> > to the "kmem_cache" case, whereas providing a fully generic solution wo=
uld
> > require additional changes, e.g. to handle this code:
> >=20
> > 	page =3D (void *)__get_free_page(gfp_flags);
> > 	if (page && mc->init_value)
> > 		memset64(page, mc->init_value, PAGE_SIZE / sizeof(u64));
> >=20
> > It certainly wouldn't be much complexity, but this code is already a bi=
t
> > awkward, so I don't think it makes sense to add support for something t=
hat
> > will probably never be used.
>=20
> The thing that the design needlessly works around is that we can rely on =
that
> there are only two DPAMT pages per 2MB range. We don't need the dynamic p=
age
> count allocations.
>=20
> This means we don't need to pass around the list of pages that lets arch/=
x86
> take as many pages as it needs. We can maybe just pass in a struct like K=
ai was
> suggesting to the get/put helpers. So I was in the process of trying to m=
orph
> this series in that direction to get rid of the complexity resulting from=
 the
> dynamic assumption.=20
>=20
> This was what I had done in response to v4 discussions, so now retrofitti=
ng it
> into this new ops scheme. Care to warn me off of this before I have somet=
hing to
> show?

That's largely orthogonal to this change.  This change is about preparing t=
he
DPAMT when S-EPT page is allocated versus being installed.  The fact that D=
PAMT
requires at most two pages versus a more dynamic maximum is irrelevant.

The caches aren't about dynamic sizes (though they play nicely with them), =
they're
about:

  (a) not having to deal with allocating under spinlock
  (b) not having to free memory that goes unused (for a single page fault)
  (c) batching allocations for performance reasons (with the caveat that I =
doubt
      anyone has measured the performance impact in many, many years).

None of those talking points change at all if KVM needs to provide 2 pages =
versus
N pages.  The max number of pages needed for page tables is pretty much the=
 same
thing as DPAMT, just with a higher max (4/5 vs. 2).  In both cases, the all=
ocated
pages may or may not be consumed for any given fault.

For the leaf pages (including the hugepage splitting cases), which don't ut=
ilize
KVM's kvm_mmu_memory_cache, I wouldn't expect the KVM details to change all=
 that
much.  In fact, they shouldn't change at all, because tracking 2 pages vers=
us N
pages in "struct tdx_pamt_cache" is a detail that is 100% buried in the TDX=
 subsystem
(which was pretty much the entire goal of my design).

Though maybe I'm misunderstanding what you have in mind?
