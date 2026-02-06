Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6972E6CA8
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419883; cv=none; b=fn6eOoBCf6KezYfYsVgv6/8Enm4nrZKTJMKD7DI8WqlfiVfW1F5GhqU0iLMyEggdCci2XbgwwYY2h6iLZKY5G30/onSwUd5zEILJl20+WKG0hry3neQnzYxTmhRl0hAmPFlUtykuWwqQgGIeCrV00SCYgnDnF6LCa+njS4VgpDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419883; c=relaxed/simple;
	bh=vC+UzOiNSw7Ep+RaYvzyF57/776KykC+Gx/GSex0hQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=raBmjWLUwGuqWsZmAfjVBym6jD9jo9MFOg+af8OyIwWIhuvhDTFnX0VJyNFenzab3xerjKHa013hooZCYV6xlkjzjOz5N5XPzP2qmRF4ZqbzMZpW9dGuy1EOax1bqHDb1glrVIfUO3UqCtibHniCxpMB762AOmuAt7JdKjgVtcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CT7HkqPD; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CT7HkqPD"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so764570a12.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 15:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770419883; x=1771024683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVZvicGY3dplrb5J2oNrXVVT3pZgPh6D3oyNVxQfbJc=;
        b=CT7HkqPDzTu8cLMthGeszmxe9ILcn8yvWXApLnzzXWyberz5chsT4IRr5dOdkr0uHE
         c6QbYcq3lujegot12jeDi4w2sb6bXqQZNDweQBoOGle+sSEFgBeR+vPkV22tWzyxhFc6
         uGzpM0asmRxoXs4d7jRL9XNebn8FsnN0mL39O8vXlD3pJfy7DiOGQDN1shJiK1GkE4G2
         3cpVqUv2zaV+l0XbMEeHRpXAFXbtciCcurXGp9q/CXufWidKq1WJaP3lTMD04yiub67a
         ypWmkv3Y4GVQt23Zs+JA4goeNaUy2/h89+hCqPaujBoEuGEdPOOmMLw5hoy3/mfcozco
         iL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770419883; x=1771024683;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iVZvicGY3dplrb5J2oNrXVVT3pZgPh6D3oyNVxQfbJc=;
        b=oMo3dsHjXhks5JAasW1tLaLOVO3f/2xG8EIHj/MAcbLcNqv7+fuBvLF1kZGPaqsLxQ
         5BvO3WD52wFlmaOMHFzrJ1qoe3n3wcK+86Yvk3dYaf8yPbcIWZitLDfnW+8aWDPAfLmu
         Q/hSTRLHNHrgSC+Ig6eCesSLA+bI2hCgnFJWfvJEHGwpalxZIP08uVFFmd4VdiKy7rk4
         YZMwInvsOQjhOrbcIR7NUmbWxIUHac4QyVHUGi6WX3+EO7rKQRznOT2XE99/4lQc7mbB
         rPIdoMJ1Vig8ZcqNWBmYlj+vBAZ6Npf9qzAD1dEBrQEzkQ6Yf2+otU/tMhdFDxXDTeAp
         BqaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAKFpystHbbOW1PUSy6OB5X9BBUZm4iNOwLR+LAcWGOs4BABdhsHO0E9vXDabRynfHOzfowo/cyBUy@lists.linux.dev
X-Gm-Message-State: AOJu0YyR/+6z47Djl/Zg3LZlW05L5ytVGKfCUeRPhQXu/vZBRKwAzsKG
	deg8BA+fu2J5VulbhGgCCS/N1r4aDk7MoSnMrjvsKa9+mgCfUrzho0whm8fe5AlivJo7Ugi2fBm
	KU7BNvg==
X-Received: from pglr14.prod.google.com ([2002:a63:514e:0:b0:c61:3a0e:23ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7001:b0:38b:e9eb:b12b
 with SMTP id adf61e73a8af0-393ad33a87bmr4315678637.41.1770419882896; Fri, 06
 Feb 2026 15:18:02 -0800 (PST)
Date: Fri, 6 Feb 2026 15:18:01 -0800
In-Reply-To: <b3ad6d9cce83681f548b35881ebad0c5bb4fed23.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-23-seanjc@google.com>
 <aYXAdJV8rvWn4EQf@yzhao56-desk.sh.intel.com> <aYYQ7Vx95ZrsqwCv@google.com> <b3ad6d9cce83681f548b35881ebad0c5bb4fed23.camel@intel.com>
Message-ID: <aYZ2qft-akOYwkOk@google.com>
Subject: Re: [RFC PATCH v5 22/45] KVM: TDX: Get/put PAMT pages when
 (un)mapping private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"sagis@google.com" <sagis@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Vishal Annapurve <vannapurve@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2026, Rick P Edgecombe wrote:
> On Fri, 2026-02-06 at 08:03 -0800, Sean Christopherson wrote:
> > > If this external cache is for PAMT pages allocation for guest pages o=
nly,
> > > here
> > > the min count should be 1 instead of PT64_ROOT_MAX_LEVEL?
> >=20
> > Oh!=C2=A0 Right.=C2=A0 Hmm, with that in mind, it seems like topup_exte=
rnal_cache()
> > isn't
> > quite the right interace.=C2=A0 It's not at all clear that, unlike the =
other
> > caches,
> > the DPAMT cache isn't tied to the page tables, it's tied to the physica=
l
> > memory
> > being mapped into the guest.
> >=20
> > At the very least, it seems like we should drop the @min parameter?
> >=20
> > 	int (*topup_external_cache)(struct kvm *kvm, struct kvm_vcpu *vcpu);
> >=20
> > Though if someone has a name that better captures what the cache is use=
d for,
> > without bleeding too many details into common x86...
>=20
> From the TDX perspective we have 4 types of pages that are needed to serv=
ice
> faults:
> 1. "Control pages" (i.e. external page tables themselves)
> 2. Private guest memory pages
> 3. DPAMT backing pages for control pages
> 4. DPAMT backing pages for private pages
>=20
> (3) is totally hidden now, but we need a hook to allocate (4). But from c=
ore
> MMU's perspective we hide the existence of DPAMT backing pages. So we don=
't want
> to leak that concept.

Heh, there is no way around that.  Common KVM needs to know that the cache =
is
tied to mapping a page into the guest, otherwise the parameters don't make =
any
sense whatsoever.  All we can do is minimize the bleeding.

> The page we need is kind of like something to "prepare" the private page =
before
> installing it. It actually isn't that related to the mirror/external conc=
ept. So
> if we separate it from "external" and make it about installing private gu=
est
> memory, it fits better conceptually I think. But it could be a bit confus=
ing for
> other types of VMs who have to trace to see if anything special is happen=
ing
> inside the op for their private memory. In that case it could be:
>=20
> (*topup_private_mem_prepare_cache)(struct kvm_vcpu *vcpu)

topup + prepare is redundant and confusing.

> The core MMU doesn't know about DPAMT backing pages, but it does know abo=
ut the
> set_external_spte op that consumes this cache. So how about the slightly
> misleading:
>=20
> (*topup_set_external_spte_cache)(struct kvm_vcpu *vcpu)

I really, really, want to avoid "SPTE", because the cache isn't for the SPT=
E in
any way, it's for the memory that's _pointed_ at by the SPTE.  And the conf=
usion
is exactly what prompted this thread: I forgot that it's not every SPTE in =
the
chain that needs DPAMT backing, it's only the page that's being mapped into=
 the
guest.

How about?

  (*topup_private_mapping_cache)

Because it's not just "private memory" it's specifically the mapping.  E.g.=
 for
the hugepage split case, the primary memory is already assigned and mapped =
into
the guest, but a topup is still needed because KVM is creating a new/differ=
ent
mapping.

> It is easier for other VM types to ignore, and not that semantically wron=
g from
> what is happening on the TDX side.
