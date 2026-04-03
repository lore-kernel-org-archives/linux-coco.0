Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FA3CCFCD
	for <linux-coco@lists.linux.dev>; Fri,  3 Apr 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233849; cv=none; b=o6HqKb6bT75zxhrUt7YqFKVEz4R5HQvNGm2cSV/z3ar/JXtkFszbkmdjcAIwEET9rzTAI3sF5abrGIa2pf/nxxJEqKwAcYzMMbumlVAmiWJT+dnQJRx4+JguXQiFu62MPUcZGhG5EfHdAOvPDIG+LpjqKitp6dUGoVivNbpNYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233849; c=relaxed/simple;
	bh=rGZgWtwCCI3+eFvVKc+X88h43lrdjuX32gE4iywL6A4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HO7OfoJTGj4AIjTXLwq/Jyog6KW4E1R+OM8HeWzbQy/GC49HpPuORernaVyIjgBXYKSdGclK2yX5H4R062XXqTs7aQw1gDvvfiIikWfybzHeyPifpxUL4oSY/dGPm8njYw8PsojmNhK8zp8hVSh92PWP5hpJRKlxzULDxgZ4Dw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O0ebdHu3; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O0ebdHu3"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b242cbb97aso15037535ad.1
        for <linux-coco@lists.linux.dev>; Fri, 03 Apr 2026 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775233847; x=1775838647; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+Zt8Ye6QZDycK/H8I2xKI9t6Wy2CW5OkF+BQs3682Q=;
        b=O0ebdHu3xHv8MhzA2wh/yu0alQksJudxTT5y1U4qPqlfgjc9TIrN7JHCUR0tM6xKsa
         hIl2vbLQKk+Z12kdx//7WJ8v/xqnmr2fd2nrzl2GWLmxTH0DoIvoqgWz5wzSZX+YIG66
         CAlSfKcoMUxmIU0Dc6qqB65ZUAO+x8frfBlKVN+Bkbruyrf3ttiXOdmt2pazfkh+v3Eu
         urRWcLHAJOeNkrCAsnbmLW8YREAG4yf2a1IsmoziqmZ6Awp/DAtCE6j9/9jX2e9XYSOX
         1/alYrrQm77egAAtoS2J+ty1pps62BF+eSbQJ1dhU4FnfmZ9oNhNspKzhNLLxo53rBxm
         ntpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233847; x=1775838647;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2+Zt8Ye6QZDycK/H8I2xKI9t6Wy2CW5OkF+BQs3682Q=;
        b=pKr1majoq/g/oi6Tp3PnkBIf9CV2EpXiZ82lrJvDHGvhF15PAyQRLYzNqjAUn/KBxT
         drI5pWofVMfYfft09jmckF+EZCRsjZeLQhhVqetodw20TIaTZmRQisOruwCuTc3GE9ge
         1YHyoSC2XhNzGlJrOi1CojvVv2r+R91q6/wP5g3hHVmjieOsM4y66Sbv3qx4yeae1hbc
         xxAAONkct+/uM1yKxk0jJgWlAN4v6/YbXKoU6Ar3h21pH6887wbjkA7bNfQtxoJqhT09
         x8Pn8lFqIAaSfwcuKWQbuV3OkH5vSRCTtQYhjgle1FtnnI1edVDcV6LCgf2pNTF4QT8r
         cRlg==
X-Forwarded-Encrypted: i=1; AJvYcCUNHsmWiGrn+8NBRAwjzLP65wsd3dmxPkEMoAFy0gCJVXPo7jUXUXLTkSsAXjeGO5R3nDHKwcVbVlj6@lists.linux.dev
X-Gm-Message-State: AOJu0YyVkBjnlK+Wo35knZKyZlZ3bfX/g4WOHJe01lssLoxj5tn7bb66
	kIryKHCI+PGE6/cZ8my7h2DSA8WQRZB5tC+qutV37Q4SRpQb0O87zQw1PT8CuAiJZfCQBTXY9uz
	Qje/2XA==
X-Received: from plrx13.prod.google.com ([2002:a17:902:b40d:b0:2ae:d0cb:5159])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54f:b0:2ae:5eab:132e
 with SMTP id d9443c01a7336-2b28173fa9dmr36278905ad.12.1775233847240; Fri, 03
 Apr 2026 09:30:47 -0700 (PDT)
Date: Fri, 3 Apr 2026 09:30:45 -0700
In-Reply-To: <f67179d7050ae28ac261bb6227b1c045c10579c9.camel@intel.com>
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
Message-ID: <ac_rNT69TdocrMYc@google.com>
Subject: Re: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "dmaluka@chromium.org" <dmaluka@chromium.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Dave Hansen <dave.hansen@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026, Rick P Edgecombe wrote:
> On Thu, 2026-03-19 at 15:40 +0800, Binbin Wu wrote:
> > tdx_has_emulated_msr() is used by KVM to decide whether to emulate a MS=
R access from the
> > TDVMCALL or just return the error code.
> >=20
> > During an off-list discussion, Rick noted that #VE reduction could chan=
ge the behavior of
> > accessing an MSR (e.g., from #VE to #GP or to be virtualized by the TDX=
 module) without
> > KVM knowing.Because KVM lacks the full context to perfectly decide if a=
n MSR should be
> > emulated, the question was raised: Can we just delete tdx_has_emulated_=
msr() entirely?
> >=20
> > However, these native type x2apic MSRs are a special case. Since the TD=
X module owns the
> > APICv page, KVM cannot emulate these MSRs. If we remove tdx_has_emulate=
d_msr(), a guest
> > directly issuing TDVMCALLs for these native type x2apic MSRs will trigg=
er a silent failure,
> > even though this is the guest's fault.
> >=20
> > It comes down to a tradeoff. Should we prioritize code simplicity by dr=
opping the function,
> > or keep it to explicitly catch this misbehaving guest corner case?
>=20
> I think from KVM's perspective it doesn't want to help the guest behave
> correctly.

Uh, yes KVM does does.  KVM is responsible for emulating the APIC timer, is=
n't it?

> So we can ignore that I think. But it does really care to not define
> any specific guest ABI that it has to maintain. So tdx_has_emulated_msr()=
 has
> some value there.=C2=A0And even more, it wants to not allow the guest to =
hurt the
> host.
>=20
> On the latter point, another problem with deleting tdx_has_emulated_msr()=
 is the
> current code path skips the checks done in the other MSR paths. So we wou=
ld need
> to call some appropriate higher up MSR helper to protect the host? And th=
at
> wades into the CPUID bit consistency issues.
>=20
> So maybe... could we do a more limited version of the deletion where we a=
llow
> all the APIC MSRs through? We'd have to check that it won't cause problem=
s.

What?  No.  KVM can't get actually read/write most (all?) MSRs, allowing ac=
cess
is far worse than returning an error, as for all intents and purposes KVM w=
ill
silently drop writes, and return garbage on reads.

> Failing that, we should maybe just explicitly list the ones TDX supports =
rather
> than the current way we define the APIC ones. As you mention below, it's =
not
> correct in other ways too so it could be more robust.

No?  Don't we just want to allow access to MSRs that aren't accelerated?  W=
hat
the TDX-Module supports is largely irrelevant, I think.

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1e47c194af53..28e87630870b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2116,23 +2116,26 @@ bool tdx_has_emulated_msr(u32 index)
        case MSR_IA32_MC0_CTL2 ... MSR_IA32_MCx_CTL2(KVM_MAX_MCE_BANKS) - 1=
:
                /* MSR_IA32_MCx_{CTL, STATUS, ADDR, MISC, CTL2} */
        case MSR_KVM_POLL_CONTROL:
+       /*
+        * x2APIC registers that are virtualized by the CPU can't be
+        * emulated, KVM doesn't have access to the virtual APIC page.
+        */
+       case X2APIC_MSR(APIC_ID):
+       case X2APIC_MSR(APIC_LVR):
+       case X2APIC_MSR(APIC_LDR):
+       case X2APIC_MSR(APIC_SPIV):
+       case X2APIC_MSR(APIC_ESR):
+       case X2APIC_MSR(APIC_ICR):
+       case X2APIC_MSR(APIC_LVTT):
+       case X2APIC_MSR(APIC_LVTTHMR):
+       case X2APIC_MSR(APIC_LVTPC):
+       case X2APIC_MSR(APIC_LVT0):
+       case X2APIC_MSR(APIC_LVT1):
+       case X2APIC_MSR(APIC_LVTERR):
+       case X2APIC_MSR(APIC_TMICT):
+       case X2APIC_MSR(APIC_TMCCT):
+       case X2APIC_MSR(APIC_TDCR):
                return true;
-       case APIC_BASE_MSR ... APIC_BASE_MSR + 0xff:
-               /*
-                * x2APIC registers that are virtualized by the CPU can't b=
e
-                * emulated, KVM doesn't have access to the virtual APIC pa=
ge.
-                */
-               switch (index) {
-               case X2APIC_MSR(APIC_TASKPRI):
-               case X2APIC_MSR(APIC_PROCPRI):
-               case X2APIC_MSR(APIC_EOI):
-               case X2APIC_MSR(APIC_ISR) ... X2APIC_MSR(APIC_ISR + APIC_IS=
R_NR):
-               case X2APIC_MSR(APIC_TMR) ... X2APIC_MSR(APIC_TMR + APIC_IS=
R_NR):
-               case X2APIC_MSR(APIC_IRR) ... X2APIC_MSR(APIC_IRR + APIC_IS=
R_NR):
-                       return false;
-               default:
-                       return true;
-               }
        default:
                return false;
        }
