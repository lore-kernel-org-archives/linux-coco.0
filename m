Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3E427FB9
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752797; cv=none; b=cfJ27Ftjhe5HrU5LDs/mD19crjSFT2ORhOzOX5xQA+RNNDrMLXXs9OgNgzPYO2tayCNeorlPYBHA0mRctGxun5gavnlT1B59DLdO9Qoznn/hbPwN8TjxvgY/5fK4oaimMxqF20maWDO2iZ1iPCbgJ3x9EcU1o4uGwM1UBtxdleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752797; c=relaxed/simple;
	bh=BmbalL68ZikUuh25rRQGobzDqe2QcSShbOPYwfY2XDo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YD7Lo6k3gLgUOLsMfqCYnw6t0nUhiO8PQ/Fj+L0iT9/nTyuuXVfbvTUyz/JBmQv9hNeMp32+0Q6U87c8RK4kN/CGM81oS/LLR6xz4CTN2yqfK6GH5H+JorXhqxK0ZiEygSRMrVAwZ1wHV4rhIUGbbrI6SNbcN6RBZr7e4p6ieBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yuw+JAS6; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yuw+JAS6"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so9942925ad.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787752786; x=1788357586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sJ5J4VsXiOuMp2dajzmF8XaYnCQzq6t9gwVoLisuj/k=;
        b=Yuw+JAS62nkdMElhwgQ6ce+GNJCFi0ezqzGVT7ryLcgm5s+DKJG43BpEP4K3Ae7XJu
         fQaZOsS0gmSjMb9WLLvHDWpVCWulIbi908wTESMFEtxcIuJJeVYlRYwnD93duzvSv/Fv
         3sr4ks5eoUgmiEAnUiCovHQ+5/kuVxYWV+qeTilThPFUMRNh2OmOXc4fffv/nXk+4g9m
         Woq0MrBMPmYyybu2Ae5RP0gwLzepJEvoIs29HVm29utuf9nTObHF4Hxgzf2/dEOrFfKW
         BpChvZhsUor2hKsVgyVINiGwidxJp4MiFxstwvOG89dO0iJqS4VJkY8hOZ/wQ9Iq864F
         DqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752786; x=1788357586;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJ5J4VsXiOuMp2dajzmF8XaYnCQzq6t9gwVoLisuj/k=;
        b=mHbT2NFeTDdfl+zSrgztFJeqOpY1OMm4Akgbrrv4mAnD7aQSWnxEnVC4KJJEkbHVi1
         6mznPmEFHqmFsxx5ODtwr3w5nASVACE7QA/CVu6K7gDqwjtYNVO9vgKZoBzOPTdc/t9L
         GY3g7gRUQbOwcIztPwG8JKJIG2rIogu5MsOVFMpeaAuQXMj8vtBLBVqyheVb8Z6ZAv1I
         NnhJotJITJQg2O+/vdLm84mf+tlghU+3N0H+DuOljaHsjORWpWcYu7nhRfIQt8KCUQ6W
         cxm1CkOBO5tSuKyC7o+jYsc9uCoC4Zdvax2/7fbJ5VZfmwHHFHsaopWwUCgOVeY56pJM
         dPnA==
X-Forwarded-Encrypted: i=1; AHgh+RrPm0ukNhl7qHvOjzXrHD+JKicEhcmMKzT3Y24w/fELdrn3dD7+wu2rQANwVpblC4fxqt+MxNdTRpUX@lists.linux.dev
X-Gm-Message-State: AFuF++k2o9pSLjqsgAhW6OkxEe20sDjTnhUPtSNWoPEykPbjjjZbLgOY
	NuWxAMvElfc2qZlBnfMJtZCGHY1cc/C8UBYGx0lZc49XtFcJEouQ+8WDTGUOMrjZk8Z+UNeEp3y
	jEBrUNA==
X-Received: from plht13.prod.google.com ([2002:a17:903:2f0d:b0:2c0:a516:2c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1246:b0:2d1:1f73:3667
 with SMTP id d9443c01a7336-2d707a04385mr106575235ad.1.1787752785793; Wed, 26
 Aug 2026 06:59:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:59:45 -0700
In-Reply-To: <d9d4264f-eb8f-4407-951b-245d144b3ec8@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-10-xiaoyao.li@intel.com> <5426d2f6-3e67-45d3-85d6-d0da67edb486@suse.com>
 <34161383-a382-411b-9278-098dab6587d8@intel.com> <d9d4264f-eb8f-4407-951b-245d144b3ec8@suse.com>
Message-ID: <ao7xUc88m1fopax7@google.com>
Subject: Re: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and TDX
From: Sean Christopherson <seanjc@google.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026, Nikolay Borisov wrote:
>=20
>=20
> On 8/26/26 13:43, Xiaoyao Li wrote:
> > On 8/26/2026 6:03 PM, Nikolay Borisov wrote:
> > > > @@ -960,7 +978,7 @@ struct kvm_x86_ops vt_x86_ops __initdata =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vcpu_needs_initialization =3D
> > > > vt_op_tdx_only(vcpu_needs_initialization),
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vcpu_run =3D vt_op(vcpu_run),
> > > > -=C2=A0=C2=A0=C2=A0 .handle_exit =3D vt_op(handle_exit),
> > > > +=C2=A0=C2=A0=C2=A0 .handle_exit =3D vt_handle_exit,
> > >=20
> > > nit: Why isn't this vt_op() for the sake of consistency and
> > > introduce needless churn ?
> >=20
> > I didn't see how to make vt_op() still work here while dedupping the
> > code. Do you have a better idea?
>=20
> Indeed, I saw that vt_op is actually different for the TDX/!TDX case. I
> guess that function is always bound to have some quirk - i.e it has an
> #ifdef guard inside even though is_td_vcpu() is defined for the !TDX case
> but tdx_handle_exit() isn't. It's named VT, even though it's defined  in =
the
> "vmx section" ...

Because the name and the implementation are two separate things.  The scope=
 is
"vt_" to communicate that the operation is common to all flavors of VT, i.e=
. to
both VMX and TDX.  But when support for TDX is disabled, there's no need to
trampoline through the routing code and so the vt_op() implementation wires=
 the
hooks up directly to the VMX functions.

.handle_exit doesn't use vt_op() because the implementation of vt_handle_ex=
it()
itself is completely common to VMX and TDX, i.e. there is no routing code a=
nd
thus no need to define a wrapper via vt_op().
