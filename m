Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792EC43847C
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371773; cv=none; b=A11JZSAwLIqxS8HFBN/8AuSj6YEdt/AkYqQRk3GREoF+BrQDbOTzjbj9V78yT0tRJqFCxLTltiTc208XDQIZ1MUMiQD4HT2srkpjrZkqA8nHR/PBxKvM36WmjNMzEycN9l2HHxUoFdmit3dGImH5i5xViMY4wWjEW0jf/mghzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371773; c=relaxed/simple;
	bh=zTXiXJfLd3I0qxI0c9+WLAaIt+ka+KmG6qU+/CRk2ek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hmMbcGPH641DTDWh/nDaW/pIcnmKaCBzdq+igzqwuojnr7cTCftEFkVnpFVHuMCwjZZWzTfJxRWQxkYf6uFcPS97pEpZORZ5HWO9ddnx+l/pKDP9y91PLae+ox3YnqRw//4O4t0OKNk5IZOfhOWhmE9sNWKjFr4mkkxJMLvHDl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fcU3DibT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fcU3DibT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-847a225cd91so3434716b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783371768; x=1783976568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LnR6K9WmltPvXj/MyNsRXgC89oeJseuvf2YbIimKSE8=;
        b=fcU3DibTBc47eQG2sllinJ1qM8Gm2mljJI/Sf8xscZ2pGTlBOKRGRV7XiEi+5Dmlnk
         n/qATzhcjTAEIgvnpzCKDHS4a4Gk0wVRv7HRlBJD1sExbG38dViiH/3H3A4vP1y/oeNh
         TrRmfACJ+WI8SU0x5+m5UVdvWsW4+dur4u7n0exQxwbNLXaCaUG2TTT66ig7vlwcXWDH
         tNYCkrc6CUpSt2oUz9f9MfL8sg2cYxhaLLS+eXDynCm8INDHe9m/VmeFWJWO4c8lwI6K
         Ck+c1B30+f+aOuW7DC8ZkMRy16aZCqt/ngr1XbT+j8jmWCg/aVJr/orkAdJR+hdLOzVG
         0ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371768; x=1783976568;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnR6K9WmltPvXj/MyNsRXgC89oeJseuvf2YbIimKSE8=;
        b=UGl4eMTOwCd1G/nAQXWSoxJIWenK105h/2M2qoT+XJRGlw0LajV/deS9smgie694AP
         x+N6jAemSV1SNioGplmdArc4MurOeJPH58hT0qgnMDCdmbbbcuEsbsyNfxRWorq8ejXq
         yhhasBAj7nZ4CpypLhZ9GTzful1tuyDW5E5nDI6S5Lldy3IIlfhvuE9CxHs93Q7BB71l
         Y7yjUMwXd9FOaOqrEsLANYI5bPMJwYvF4UmrAJ8sEvcruwK144rJme1A5ZqpVXL2xCgk
         pdDK5G+d2SwFtAlL2h6V+9uJ0K/aJJK+APEJvm2Ts5g+s/MrJyNAMmAcwMjruaK4ZP+T
         Cu9w==
X-Forwarded-Encrypted: i=1; AHgh+RpzoZUemkgT1xGjF0uenrxjD+2GdpI/Au+MxMAgoizfRFRAj8oFZrAeWTce1KPG14NffukEx9lJZ4tS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4AHaJkFAZHtCN8JBJ4Onzb3vDVBb3p4hFzAY0UWvlfkEGIPIj
	/tBymRlZZoaV+0XvyntMoz0aXMoV324C5nZ1s6V3rthZacmOc+kNzrVWEZW334jxE+N6aHchMjd
	3YTAIxA==
X-Received: from pgmh30.prod.google.com ([2002:a63:575e:0:b0:c80:296b:72cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4612:b0:3bf:6c07:b2ed
 with SMTP id adf61e73a8af0-3c08eebb4d6mr2396075637.48.1783371767923; Mon, 06
 Jul 2026 14:02:47 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:02:47 -0700
In-Reply-To: <2bdcc07d98df66954b9508be537b6f6a7c9f88de.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-10-rick.p.edgecombe@intel.com> <0c31fcdc-048c-4ff2-9e89-1ba112815c84@linux.intel.com>
 <2bdcc07d98df66954b9508be537b6f6a7c9f88de.camel@intel.com>
Message-ID: <akwX9wUS_C-lc-I8@google.com>
Subject: Re: [PATCH v6 09/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026, Rick P Edgecombe wrote:
> On Fri, 2026-07-03 at 11:15 +0800, Binbin Wu wrote:
> > > @@ -1669,16 +1683,29 @@ static struct page *tdx_spte_to_sept_pt(struc=
t kvm
> > > *kvm, gfn_t gfn,
> > > =C2=A0 static int tdx_sept_map_nonleaf_spte(struct kvm *kvm, gfn_t gf=
n,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 enum pg_level level, u64 new=
_spte)
> > > =C2=A0 {
> > > +	struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
> > > +	struct vcpu_tdx *tdx =3D to_tdx(vcpu);
> >=20
> > Nit:
> > Is it better to move this after checking vcpu is not NULL?
> > Although tdx is not dereferenced in between, if vcpu is NULL,
> > it means container_of() does arithmetic to a NULL pointer.
>=20
> Personally I'm on the fence. I'm going to leave it, because Sean did it t=
hat
> way:
> https://lore.kernel.org/kvm/20260129011517.3545883-23-seanjc@google.com/

Heh, because of course I'm omnipotent and never make mistakes.

I agree with the nit in the sense that this isn't a great pattern to encour=
age,
but IMO the root of the ugly pattern is the use of kvm_get_running_vcpu() (=
which
is sadly the lesser evil in this case).  I.e. I'm not terribly concerned ab=
out
this code leading to more "problems" in the future.  And I don't really wan=
t to
grab "tdx" later on because that deviates from the standard patterns in KVM=
 and
incorrectly suggests there _is_ a need to pre-check for a non-NULL vCPU.

All that said, we can get the bost of both words by simply not caching "tdx=
";
there's only one use anyways.

diff --git arch/x86/kvm/vmx/tdx.c arch/x86/kvm/vmx/tdx.c
index ee073cacafbe..f53bac52449b 100644
--- arch/x86/kvm/vmx/tdx.c
+++ arch/x86/kvm/vmx/tdx.c
@@ -1684,7 +1684,6 @@ static int tdx_sept_map_nonleaf_spte(struct kvm *kvm,=
 gfn_t gfn,
                                     enum pg_level level, u64 new_spte)
 {
        struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
-       struct vcpu_tdx *tdx =3D to_tdx(vcpu);
        gpa_t gpa =3D gfn_to_gpa(gfn);
        u64 err, entry, level_state;
        struct page *sept_pt;
@@ -1697,7 +1696,7 @@ static int tdx_sept_map_nonleaf_spte(struct kvm *kvm,=
 gfn_t gfn,
        if (!sept_pt)
                return -EIO;
=20
-       ret =3D tdx_pamt_get(page_to_pfn(sept_pt), &tdx->pamt_cache);
+       ret =3D tdx_pamt_get(page_to_pfn(sept_pt), &to_tdx(vcpu)->pamt_cach=
e);
        if (ret)
                return ret;
=20
@@ -1721,7 +1720,6 @@ static int tdx_sept_map_leaf_spte(struct kvm *kvm, gf=
n_t gfn, enum pg_level leve
        struct kvm_vcpu *vcpu =3D kvm_get_running_vcpu();
        struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
        kvm_pfn_t pfn =3D spte_to_pfn(new_spte);
-       struct vcpu_tdx *tdx =3D to_tdx(vcpu);
        int ret;
=20
        if (KVM_BUG_ON(!vcpu, kvm))
@@ -1733,7 +1731,7 @@ static int tdx_sept_map_leaf_spte(struct kvm *kvm, gf=
n_t gfn, enum pg_level leve
=20
        WARN_ON_ONCE((new_spte & VMX_EPT_RWX_MASK) !=3D VMX_EPT_RWX_MASK);
=20
-       ret =3D tdx_pamt_get(pfn, &tdx->pamt_cache);
+       ret =3D tdx_pamt_get(pfn, &to_tdx(vcpu)->pamt_cache);
        if (ret)
                return ret;
