Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0F3A640A
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949000; cv=none; b=FhyL/zTkh7R9xAg4fInssM4diIm8skbcsc+YGxm/hRPNv95eqOh+lRX8JElFIs00WvbJGjy5hTaRe/VpJrJ2pVwMamHapSApBoq/ZB45W0z7+EALMbjjeax4W5PHIJ8/Mzev2ijNbKMSAa++sZWr8wZk/5RI+QokqAsLjfJmebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949000; c=relaxed/simple;
	bh=SOGQy7+puNM/ba13/nSnregfmqZzlkrJ68UTA3YXxRU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kOxyNR89aeguQyroWElkfNxOvGb2Qk2bMesWI8uGbSgq2zeU3/ZluIp1Vv66y3LwBCtUaOqgh6EQDf2+6WZ/CZNNM8PPatbCf2oEOnTJfw6xk4JbKYMoXEKi69hRuId8HBQuZAmkrDsywdvI/t4Y72xtTegAkp8aM/50gx3+KZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HcU33LOj; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HcU33LOj"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6e185331c9so3436208a12.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771948998; x=1772553798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p31fbkWSCceudE7NtBIgU6iz/jD9HBtJctESA+fNTjk=;
        b=HcU33LOjcTmbdoijyneVrZYm0Q6QZHvrxWhMWH3MM1LQ0EvrrFRsKp3wt8FYe7Ufg7
         6SJ6qU4yyavhN/3vM9S2jsFXpsXkDQYXq1MEWOLZW7jHLiFvXDeHizqWD2L214vTz9Pp
         yKbi/hdQ6riqmvWuMD/12Lg4RGX1Am8P7LwWlXWJcTtFwbYkppQ8VrMaz0ZuOo3ys0x7
         1s7evMkTAaes4JSVp/kIHldHMg7ooa0dp8SiZIyXL6i8NW8bJ3SR8owvuVRpo6GRM+/J
         0qHbFdNlG9Ni7iu4lyu8nMU7DDp0cgBSBIE1Y8HmAZxHQijDajkRzIPOotOdHkyr+i26
         GDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771948998; x=1772553798;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p31fbkWSCceudE7NtBIgU6iz/jD9HBtJctESA+fNTjk=;
        b=k3c8ZLOompenh9OeFR1RMWTrp0sZSfSF1551pw8mF3GZxeTKxOZXPiDahfLL8RcLrk
         cY0A/GaZhSmop0Zw/M1LyOZINw3b5v+jWezCLPZxXQpAp/SCTsWN3jM3hnbKBMBed4Ww
         joEuM35+xy8edXCGg9jluX+lyF7cGH5J8aKSESYyxRB6GG0SClK4eyjhwhMam/UBfXGV
         U6KRJ0CWgvOvHsr2waw4rDURkq4jAkzeGss5lEsRXTo3PC/x74018DpKxNYYhkwMfxEi
         2EWC89OCYjzzD+JYvgeb4o/IT4QPq3niG8azL8/R8MOIcfyaXuK4fF588I/UkwubL9IB
         nvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZVOlRWXObJTBwG58c1CfNHuAOi7NidiRRQgbkCExgODNDU20w0/zQ0gKFodxxHEUkyNWTFo7FSgF@lists.linux.dev
X-Gm-Message-State: AOJu0YxeiJTe4vzWtYAZk96nfa82J6F2RsKFrGZcTebMzRwf34W4TVPf
	wpxqXUFHO8axcbO5Dq9tYqbn/0rAxcpZAOuFZzJViPL6+Py7VqWWgOEhIM5TYfx+u2s4jzIde8m
	V4izz7w==
X-Received: from pgcv16.prod.google.com ([2002:a05:6a02:5310:b0:c16:a39f:5b40])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:898b:b0:394:a026:4c74
 with SMTP id adf61e73a8af0-39545f7d1f2mr10096820637.40.1771948998111; Tue, 24
 Feb 2026 08:03:18 -0800 (PST)
Date: Tue, 24 Feb 2026 08:03:16 -0800
In-Reply-To: <fd3b58fd-a450-471a-89a3-541c3f88c874@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260223214336.722463-1-changyuanl@google.com>
 <213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com> <fd3b58fd-a450-471a-89a3-541c3f88c874@linux.intel.com>
Message-ID: <aZ3LxD5XMepnU8jh@google.com>
Subject: Re: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"changyuanl@google.com" <changyuanl@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Binbin Wu <binbin.wu@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026, Binbin Wu wrote:
> On 2/24/2026 9:57 AM, Edgecombe, Rick P wrote:
> >> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> >> index 2d7a4d52ccfb4..0c524f9a94a6c 100644
> >> --- a/arch/x86/kvm/vmx/tdx.c
> >> +++ b/arch/x86/kvm/vmx/tdx.c
> >> @@ -172,9 +172,15 @@ static void td_init_cpuid_entry2(struct
> >> kvm_cpuid_entry2 *entry, unsigned char i
> >> =C2=A0	entry->ecx =3D (u32)td_conf->cpuid_config_values[idx][1];
> >> =C2=A0	entry->edx =3D td_conf->cpuid_config_values[idx][1] >> 32;
> >> =C2=A0
> >> -	if (entry->index =3D=3D KVM_TDX_CPUID_NO_SUBLEAF)
> >> +	if (entry->index =3D=3D KVM_TDX_CPUID_NO_SUBLEAF) {
> >> =C2=A0		entry->index =3D 0;
> >> +		entry->flags &=3D ~KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> >=20
> > There are two callers of this. One is already zeroed, and the other has
> > stack garbage in flags. But that second caller doesn't look at the
> > flags so it is harmless. Maybe it would be simpler and clearer to just
> > zero init the entry struct in that caller. Then you don't need to clear
> > it here. Or alternatively set flags to zero above, and then add
> > KVM_CPUID_FLAG_SIGNIFCANT_INDEX if needed. Rather than manipulating a
> > single bit in a field of garbage, which seems weird.

+1, td_init_cpuid_entry2() should initialize flags to '0' and then set
KVM_CPUID_FLAG_SIGNIFCANT_INDEX as appropriate.

> >> +	} else {
> >> +		entry->flags |=3D KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> >> +	}
> >> =C2=A0
> >> +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=3D
> >> +		=C2=A0=C2=A0=C2=A0=C2=A0 !!(entry->flags &
> >> KVM_CPUID_FLAG_SIGNIFCANT_INDEX));
> >=20
> > It warns on leaf 0x23 for me.=C2=A0Is it intentional?
>=20
> I guess because the list in cpuid_function_is_indexed() is hard-coded
> and 0x23 is not added into the list yet.

Yeah, I was anticipating that we'd run afoul of leaves that aren't known to
the kernel.  FWIW, it looks like 0x24 is also indexed.

> It's fine for existing KVM code because cpuid_function_is_indexed() is
> only used to check that if a CPUID entry is queried without index, it
> shouldn't be included in the indexed list.
>=20
> But adding the consistency check here would cause compatibility issue.
> Generally, if a new CPUID indexed function is added for some new CPU and
> the TDX module reports it, KVM versions without the CPUID function in
> the list will trigger the warning.

IMO, that's a good thing and working as intended.  WARNs aren't inherently =
evil.
While the goal is to be WARN-free, in this case triggering the WARN if the =
TDX
Module is updated (or new silicon arrives) is desirable, because it alerts =
us to
that new behavior, so that we can go update KVM.

But we should "fix" 0x23 and 0x24 before landing this patch.
