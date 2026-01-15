Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617C3BF2EA
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496106; cv=none; b=gbC4rAgIi7zyW7asQ+4ZG1zaq/9XuUbSDXoOSF0OF5Nhx/PY6e+pa9+KHz+9wND1GH08n2L/vmp42BBkhBES07/jBu3kVsVD01j25WKu3/QDspsTym1ddqXTo57oW3XUfLDE01vYoS0IBdZHOaBP/Xft5tBFsqr5UkO7/xyo6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496106; c=relaxed/simple;
	bh=vHJzNvUgrWMaqSEXYwJjvXoh/vXYEQ7TR+f/TbNG3c8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LZpYJ/ub702GTmQxK8XFC9Ax5hyz3Af97IUFYM6Xa8oRmerUGwK4BvunTLvrJww2PA6NjtArtTyPbJybl/UVePbgRhY9MIHFO/JnrhWNeGG1wmiOrBd/KZfWqwIkp5AlJFGYH2Rf5rPjQePLyQSCVslegDtJFNiyVjRikzZwTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEQczRMx; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEQczRMx"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a0e952f153so22890305ad.0
        for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 08:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768496101; x=1769100901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL+E7/4JmScKJihcx95KMzbVjQVIxgRJYXFYqhlTPBQ=;
        b=tEQczRMxp1U6vR5IMDaUD5h352ZC2YjAfQ6h/prLXaQx9ccxVYYAo9GI6xZf2ELGgY
         dxyncRzaTkRlfuaAZSFHt3GiRjqYHD2keW/vjkaWaIiLjBb13QvJSYLlUbFpp0UZty3i
         vqolGh/5C33Pzewug6DHgu+jupLknYvTsxZXirfc6yTORqrOoIqHetQ5/rHkhHCJjuyG
         vfP+hQJDSs8bvBB/moHsWwGkg4Hs1E2ZXgdl65N8t16j44PxmCm2bftmc2HbCV8vj7H4
         vsPOPKirDzRXDDMsJ+PtvFCmDFPu3oWXlx9U9a5YL1LAOt2Mud05FYkABwuF/9qSLd1k
         4eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496101; x=1769100901;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eL+E7/4JmScKJihcx95KMzbVjQVIxgRJYXFYqhlTPBQ=;
        b=IgPJ9X+h2SOsYJy/nwGcygL6sEbDMTyf1mlFKzJ15nnuW2eHfilyuepUw//8EwnbRh
         O2FeBofRA+AkiKD3mwalbWwcdtNCRPvGGnt+rqVw7s0sb5jP2j0B3cB+82ZWp7MAWnku
         Y1qZq9PvIl6gM5UcrljaA28Nck7JkoYSL3Mqk90ih3CIIBm6b3Yz6G0Ng0Cp/EzW4SAw
         pG7mZMLps13EF/VQGN0b9H7dj98A8cOZ4E2uHKrkYc3KtuoXrgSjbsGcMXgNDsPdq4T/
         T7DFMHze0s/+388paTe/ciGL1v2FqVyH2B9SbQPHRgQ23X/XmZ9bV23QKQEsl6gcsrMM
         FMHg==
X-Forwarded-Encrypted: i=1; AJvYcCX1K4IwROmBbqvHKKki3G2iUlZ/JYELCROWh1pn+lNfjJVTJ18mak8iWge0E4Hbwk+wTztQat3ALDkm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6VheC3q3pHs1vIunbilL3GfmNeJrfy9xa/WmUNG5vOrQFnPNr
	Hs4kKIrHWkiWreML1O2jIGVEvIj7xI8JEU0Dpi7QXGlNhPA/YIdwPRR5Z4Q/lo9BVAzsiSVI4f7
	ViA/1Pw==
X-Received: from plog2.prod.google.com ([2002:a17:902:8682:b0:2a0:ad08:d949])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f685:b0:295:96bc:8699
 with SMTP id d9443c01a7336-2a7175408damr1410685ad.20.1768496101557; Thu, 15
 Jan 2026 08:55:01 -0800 (PST)
Date: Thu, 15 Jan 2026 08:54:59 -0800
In-Reply-To: <af8bbddc-fcf5-460b-9a6f-1418a0748f37@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260114003015.1386066-1-sagis@google.com> <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
 <aWe8zESCJ0ZeAOT3@google.com> <CAAhR5DE=ypkYwqEGEJBZs5A2N9OCVaL_9Jxi5YN5X7rNpKSZTw@mail.gmail.com>
 <af8bbddc-fcf5-460b-9a6f-1418a0748f37@intel.com>
Message-ID: <aWkb41gbjs-cPX60@google.com>
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sagi Shahar <sagis@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026, Xiaoyao Li wrote:
> On 1/15/2026 9:21 AM, Sagi Shahar wrote:
> > On Wed, Jan 14, 2026 at 9:57=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > On Wed, Jan 14, 2026, Xiaoyao Li wrote:
> > > > The -EINVAL will eventually be returned to userspace for the VCPU_R=
UN
> > > > ioctl. It certainly breaks userspace.
> > >=20
> > > It _might_ break userspace.  It certainly changes KVM's ABI, but if n=
o userspace
> > > actually utilizes the existing ABI, then userspace hasn't been broken=
.
> > >=20
> > > And unless I'm missing something, QEMU _still_ doesn't set hypercall.=
ret.  E.g.
> > > see this code in __tdx_map_gpa().
> > >=20
> > >          /*
> > >           * In principle this should have been -KVM_ENOSYS, but users=
pace (QEMU <=3D9.2)
> > >           * assumed that vcpu->run->hypercall.ret is never changed by=
 KVM and thus that
> > >           * it was always zero on KVM_EXIT_HYPERCALL.  Since KVM is n=
ow overwriting
> > >           * vcpu->run->hypercall.ret, ensuring that it is zero to not=
 break QEMU.
> > >           */
> > >          tdx->vcpu.run->hypercall.ret =3D 0;
> > >=20
> > > AFAICT, QEMU kills the VM if anything goes wrong.
> > >=20
> > > So while I initially had the exact same reaction of "this is a breaki=
ng change
> > > and needs to be opt-in", we might actually be able to get away with j=
ust making
> > > the change (assuming no other VMMs care, or are willing to change the=
mselves).
> >=20
> > Is there a better source of truth for whether QEMU uses hypercall.ret
> > or just point to this comment in the commit message.
>=20
> No version of QEMU touches hypercall.ret, from the source code.
>=20
> I suggest not mentioning the comment, because it only tells QEMU expects
> vcpu->run->hypercall.ret to be 0 on KVM_EXIT_HYPERCALL. What matters is Q=
EMU
> never sets vcpu->run->hypercall.ret to a non-zero value after handling
> KVM_EXIT_HYPERCALL. I think you can just describe the fact that QEMU neve=
r
> set vcpu->run->hypercall.ret to a non-zero value in the commit message.

+1.  We can't _guarantee_ changing the behavior won't break userspace, e.g.=
 in
theory, someone could be running a fork of QEMU in production that explicit=
ly
sets hypercall.ret to some weird value.  Or someone could be running a VMM =
we
don't even know about.  I.e. there is no single source of truth, all we can=
 do
is explain why we have high confidence that the ABI change won't break anyt=
hing.
