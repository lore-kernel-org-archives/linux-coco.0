Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF38258EC1
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779240343; cv=none; b=Wg/kc3mBVnI2FbbcJbT23m90EblovUmMUWm2TMPf8BCHpIMOG07LjysHefFCD580FXBKIQAvqZujXcRbJnhqSZAq8TnJKidRPiGY8YeSuA3FXhdYM6H7mufa6R48iXJ+t/SGdLuh8MI6GWT+j9ZUGaJXSb8dp8UKP6VtDg0q290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779240343; c=relaxed/simple;
	bh=1ZEk7WDfUriJR4Ru02cEYn6C1hyGsTQlxw07aaQqcQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OEpMdYZtWB2o4riK4ynnqxK8QIEXwgE5OB4gDUQvIOMJZFuWHePwV6d1AppvSjYxXQNpVkI8uG94Se2f5TsEwYKOu+mC6iIpEoPaGDIdDKyOcPNViJAYWCTlHI01O2jHQbz3bc+4HJsN9eJB1kfrunexU/PnRwt8Vm5ddhA4Ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AF5nggN5; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AF5nggN5"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b458add85aso44417715ad.2
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 18:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779240341; x=1779845141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRZCDdWW3uq8H2JgwwZbaUSnc8P+nYDdB2aCPo1VFZU=;
        b=AF5nggN5s7JZxedg0BQZ0Yjv/DpO3Kwgg5RPUVg9wbCIzPNBs7zvFdlfaZT7fkOCfW
         soa1r6PvEQsHjYIRqiSv5OhmO6XSWWWWxP+wdb+BtvOzWq3tl0WbPW1Xai3jq47vsOpW
         rXnnuCdiU6ce4Al6uSpr6KVA4/S2XBHfafJ70rNA6cnDhfkeS5ophPJQZtx6K+bx0KrU
         +c2ckWYuD9xy+3VC6kQXI/0dS2s7GqdQbTbj5SY7eemwDBfRRpIIi22BwbBX0hcLn6SX
         7GMKRYnAW5h7dQHwbOXr1f45dtawkLWsNb2UCd+j7H14vwVlZhhOGnoX+w3X7ZaG5QcR
         PEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779240341; x=1779845141;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vRZCDdWW3uq8H2JgwwZbaUSnc8P+nYDdB2aCPo1VFZU=;
        b=Yt17pQNnhO5c/Sd9Rltf9CTMobpOw0s0Xe/v8td4JhYz9eZjx524HkzqSgvkO0xwYa
         wPp6h2A0+tloG/H/m0qxiYR+/FtiWP4eeIT8Or/nvs3l1usz6Zf0nEX4sAnNoycxvo/9
         MEACtxYvdeTQ57GKuSmPwawKYnsm8+YgLEX03+cC1jO9+Ya97JXDOiQPs984EPJGWAp6
         0UnNC352G6NPWxDEp8MWj69uKK7ZE+63c0lyUERiVy4u8CVR4rJsjaJtIXnWO9YqnH0X
         F02g72wpIIoNzogc9vUJ1EHg56s78YIZ1RGfT4dK9FojtfDuYaC/2lATrGIFFEEVYF5N
         Msmw==
X-Forwarded-Encrypted: i=1; AFNElJ+/EQ51STgJcqucTwlLxjqtm8r4uhpzf4SK8uUe6w3vdXW4cCvRQftGVJ8a3IdOZ6C4dqjtGc1HrNMY@lists.linux.dev
X-Gm-Message-State: AOJu0YzzMuhaHw9O76gqVZ8H4/Gf4xGiTybsXkEAVehAey23TAF8sULq
	2qRnn5gZqt2WQUWBIYlTquVvYPTI8ppbl3F6xlyDoNncLbgWZIml5qEiEt4QUW0CPb5/gQZF7td
	1nCVUdg==
X-Received: from plbki13.prod.google.com ([2002:a17:903:68d:b0:2bd:5ced:c1c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e549:b0:2b2:539b:d2b1
 with SMTP id d9443c01a7336-2bd7e8bd0b0mr240369515ad.16.1779240341190; Tue, 19
 May 2026 18:25:41 -0700 (PDT)
Date: Tue, 19 May 2026 18:25:40 -0700
In-Reply-To: <729c4191d16e4c768c231ffb9bb8420306039210.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com> <20260514215355.1648463-16-seanjc@google.com>
 <074e209fe4c78a735868099f13d76b9dde2c88e3.camel@intel.com>
 <agx77QB3UVmJr5xP@google.com> <729c4191d16e4c768c231ffb9bb8420306039210.camel@intel.com>
Message-ID: <ag0NlJ2FEIL7GJIj@google.com>
Subject: Re: [PATCH v2 15/15] KVM: x86: Move the bulk of register specific
 code from x86.c to regs.c
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"paul@xen.org" <paul@xen.org>, "yosry@kernel.org" <yosry@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026, Kai Huang wrote:
> On Tue, 2026-05-19 at 08:04 -0700, Sean Christopherson wrote:
> > On Tue, May 19, 2026, Kai Huang wrote:
> Just wondering is it possible we might want to move events handling to so=
me
> other C file since you are cleanup x86.c?  But we can deal with this when=
 it
> happens.

Events are a hard one.  There's a decent amount of code, but not _so_ much =
that
it's a no-brainer to move them out of x86.c.  And there's no super clear cu=
t
boundary, e.g. events can mean exceptions, INIT+SIPI, IRQs, APIC stuff, etc=
.,
several of which already have substantial amounts of code outside of x86.c.

> > Hmm, though looking at all of this again, I think we're actually quite =
close to
> > having somewhat sane rules.  Over the past few years, I've tried multip=
le times
> > to move what I felt should be KVM-internal structures from asm/kvm_host=
.h to x86.h,
> > and I've failed miserably every time because inevitably even the most i=
nnocuous
> > struct manages to have usage that leads to cyclical header dependencies=
 and/or is
> > used by arch-neutral KVM code.
>=20
> The problem is some other kernel code includes <linux/kvm_host.h> (which =
in turn
> includes <asm/kvm_host.h>) but the KVM internal structures have nothing t=
o do
> with them.
>=20
> E.g., some drivers are using <linux/kvm_host.h>:
>=20
> #$ grep kvm_host.h drivers/ -Rn
> drivers/vfio/pci/vfio_pci_zdev.c:14:#include <linux/kvm_host.h>
> drivers/vfio/vfio_main.c:20:#include <linux/kvm_host.h>
> drivers/firmware/arm_sdei.c:19:#include <linux/kvm_host.h>
> drivers/hwtracing/coresight/coresight-trbe.c:20:#include <linux/kvm_host.=
h>
> drivers/hwtracing/coresight/coresight-etm4x-core.c:10:#include
> <linux/kvm_host.h>
> drivers/s390/crypto/vfio_ap_ops.c:17:#include <linux/kvm_host.h>
> drivers/s390/crypto/vfio_ap_private.h:20:#include <linux/kvm_host.h>
>=20
> But looking at them, AFAICT what they need is only some structure declara=
tions
> (e.g., 'struct kvm;') for type safety (plus some function declarations), =
but
> don't actually need to see the actual structure.

Ya.

> For x86, AFAICT there's (only) "arch/x86/events/intel/core.c" actually us=
es the
> 'struct kvm_pmu', though.

I have a patch to fix that :-)

https://lore.kernel.org/all/20260508231353.406465-7-seanjc@google.com

> I haven't checked other ARCHs whether there's cases actually need to use =
any
> structure.

PPC, arm64, and IIRC s390 all have assets defined by KVM that are consumed =
by
the kernel at-large.  E.g. because KVM for arm64 can't be built as a module=
, the
kernel calls directly into KVM during boot.  IIRC, PPC has similar code.

A few years ago (wow, time flies), I was able to hide KVM internals, using =
#ifdef
shenanigans to deal with cases where non-KVM really truly needed to get at =
things
defined in kvm_host.h

https://lore.kernel.org/all/20230916003118.2540661-27-seanjc@google.com

More recently, I tried to standardize KVM arch=3D>common includes[1], to he=
lp pave
the way to splitting up kvm_host.h, but then s390's crazy arm64 support kil=
led
that (at least for now).

[1] https://lore.kernel.org/all/20250611001042.170501-1-seanjc@google.com
[2] https://lore.kernel.org/all/20260428160527.1378085-1-seiden@linux.ibm.c=
om

> > I think it's probably time to admit I've been looking at the asm/kvm_ho=
st.h vs.
> > x86.h split all wrong, i.e. finally give up on moving structures out of=
 kvm_host.h,
> > and do the exact opposite: commit to using kvm_host.h to define and dec=
lare widely
> > used structures.
>=20
> If the structure(s) are only used within arch/x86/kvm/, it doesn't seem r=
ight to
> define them in asm/kvm_host.h?

The problem is that anything that feeds into kvm_vcpu_arch needs to be visi=
ble
to virt/kvm.  And burying kvm_x86_ops in arch/kvm/x86 would mean one-liners=
 like
kvm_arch_vcpu_blocking() couldn't be inlined.

I've looked at this far too many times :-)

> > Because literally the only reason that x86.h doesn't include mmu.h is t=
hat mmu.h
> > references struct kvm_host, which is currently defined in x86.h. =C2=A0
> >=20
>=20
> Yes. But I wouldn't worry about this too much since it's a small thing we=
 can
> always find a way to fix.  E.g., we can move kvm_mmu_max_gfn() out of "mm=
u.h"
> (with a renaming perhaps).

I hacked on moving more stuff out of x86.{c,h} and kvm_host.h.  The diff st=
ats
are quite promising :-)

 arch/x86/include/asm/kvm_host.h           |  444 ++-------------
 arch/x86/kvm/x86.c                        | 3784 +++----------------------=
---------------------------------------------------------------------------=
----------------------
 arch/x86/kvm/x86.h                        |  474 ++++++++--------

> > If we "fix"
> > that, then (a) we can make x86.h the "central" include everyone expects=
 it to be,
> > and (b) it can be the start of a cleanup of asm/kvm_host.h and a big st=
ep towards
> > defining maintainable "rules" for what goes where.  E.g. there are a pi=
le of
> > functional declarations in asm/kvm_host.h that can live elsewhere; if w=
e trim
> > those down, then the rules become:
> >=20
> >   - asm/kvm_host.h holds "common" structure definitions and associated =
key global
> >     variables, and things that are referenced by arch-neutral KVM.
>=20
> It's a bit weird the arch-neutral KVM code needs to reference variables i=
n
> asm/kvm_host.h, and I am afraid the "common" structure definitions will
> effectively be a lot of structures only used by arch/x86/kvm/. =20
>=20
> Which isn't necessarily a bad thing, from the perspective we might finall=
y clean
> this up by a giant move.
>=20
> E.g., <linux/kvm_types.h> is already used by other kernel components wher=
e they
> don't need <linux/kvm_host.h>.  Ideally, maybe eventually we can use
> <linux/kvm_types.h> and <asm/kvm_types.h> for things needed by other kern=
el
> components, or keep <linux/kvm_host.h> and <asm/kvm_host.h> minimal after=
 moving
> majority things to some KVM internal headers.
>=20
> E.g., maybe:
>=20
>   virt/kvm/include/kvm_host.h
>   arch/x86/kvm/kvm_host.h (can even be merged to x86.h)
>=20
> I think the problem is "struct kvm_arch" and "struct kvm_vcpu_arch", that=
 they
> are not a pointer but a fully embedded structure in "struct kvm" and "str=
uct
> kvm_vcpu" respectively.  That caused that you need to keep the actual str=
ucture
> definition of "struct kvm_arch" and "kvm_vcpu_arch" in asm/kvm_host.h, wh=
ich in
> turns makes a lot of structures only used by arch/x86/kvm/ need to stay i=
n
> asm/kvm_host.h.
>=20
> I am not sure whether there's a mandatory requirement that "struct kvm_ar=
ch" and
> "struct kvm_vcpu_arch" must be fully embedded, and it would be kinda pain=
ful to
> covert to a pointer (e.g., there's kvm_x86_ops::vm_size), but perhaps tha=
t is
> also an option to consider?

The idea I had in the past, and where I was going with things before s390's=
 love
for arm64 came along, was to add a kvm_arch.h in arch/<arch>/kvm, and have =
virt/kvm
include _that_ instead of kvm_host.h.  That way we don't need to make any f=
undamental
changes to structures, but we can still significantly cut down on what's ex=
posed
via kvm_host.h.  At some point I'll try to take another look; it's really t=
he
s390+arm64 combo that's problematic :-/
