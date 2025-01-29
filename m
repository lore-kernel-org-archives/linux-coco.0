Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07051802B
	for <linux-coco@lists.linux.dev>; Wed, 29 Jan 2025 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738111539; cv=none; b=m+ZgUF60jx3goUvre8JSJFSJZSd/DbMHqKY8m+wikufo7K59tr2bRP3pgaOMyv20E12xeZRnyXFAhrsBpVsqTK38Ot0mHA9BivKm7bcSdbLfWr8GZlmvNXSSR16c88D/uwwOT/1lRdL4pxpGj/kjrzk6iKGze4Y+EkLdf6uEZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738111539; c=relaxed/simple;
	bh=TZeiHzkxvxGGLrLMIlM92ETrGOfcUeX/i1cn7JCmtG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dv0ek9aETVgTnnvPemFfl5XNgYi7u8qGoMJCPaMNTgcYyeY5vZEjEW9Iu0mDX79X4NbyqaJ68wijNFywjXj9Eo/eboNpY+4vjaAJv2lXl4H1fKMKayyiW1Uua/2dJ3nsiaQclhLswBNendwlOXFE8uTuGlG1jdjA/Q0POQfBr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GUeZU/jH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GUeZU/jH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2178115051dso114812875ad.1
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 16:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738111537; x=1738716337; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ6odtBYi07ZEaJT5jmkk2xI2bqUgFfyGQKpSdf1RQA=;
        b=GUeZU/jHtKnaTiwowy4UgBmcxpeJfDBPmQkQRbrXwK07FzhWX61fyNWTgYNdK4uwTC
         04ILDPefZxnYmDMimTyHStbWswsjA5PVo8rvhMZrcgMIjWLxnF1nFMZujKTTJbsEV3Ls
         YxtJv8uZrxO7WApr/YLdNKVSwsajEHkq6MXAFuJ84MsqhXnZPbp/Awf0iBBC2tRjT4er
         dOH9T37UZHR5JGz5HuXKY98TAIoGnsspqpxTnLVCgPN0dnk7vdXmTs2FJmYWkrcUIIT5
         ff9QMDc+LGx7anFKY+XQGXdyw5kOnJzQCbQfNx7zdVJ8+vsK0one5y/UuY75n1XUhKdC
         ETSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738111537; x=1738716337;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZ6odtBYi07ZEaJT5jmkk2xI2bqUgFfyGQKpSdf1RQA=;
        b=Oiha61ehItPlkpPdYLkjGIef0Oc0OacvrcwgK34fqksSuj9XH196r2d3MMH8A7JyLK
         Uykth7uNvvkwzbcxAyG7GQgxm3mWqbdHGyXOdys1bDw0GR1ENGfKJ9Ij0fUrg3dlgkQx
         9h5TGq96jVY7vg6DUib5Iv6v5/9P+qgvltjViz59/q9tzniy/J88oZDpA/xQ5TXxkQVy
         5RmPykYEvIS6+BFRvmd14NSqCj/elrCvpuFTX7lD+HiyVHgVSCeHc3ylgo9bF5YfIK4e
         mRKv1ADx9/Qh3Z+KBrv/NA374LVcqv8HiuYapBfSPKd2WC2p2MYskIUYHOZemx0ebAYg
         dXUg==
X-Forwarded-Encrypted: i=1; AJvYcCWM0x4I7tuzFO58AZjeiO4Yrw3G3JAsCWYv1Q26OK9sJWXu/HB9dCUd2XHHtKttK0Ou8x9SYSG+OLr2@lists.linux.dev
X-Gm-Message-State: AOJu0YyV6wX9HkIrUYZZKMh2fpa1lkwM5iFeiItlkcs4oynhLEUqYl5Y
	vdBFr8PsOZJuHEja01+rayRyfcUK+u8x22xHvvFe4jO82dxOKE4r644xEVu9kiZHquSZ49pMuAM
	iZA==
X-Google-Smtp-Source: AGHT+IGUP7cTlYLUsdiCh1cUwyR9Xs1cGb2+FTTWMwVhzwSd6mM7QistHeckm+JJHTfvTgWOOtlxGKeXAgM=
X-Received: from pfbea10.prod.google.com ([2002:a05:6a00:4c0a:b0:728:e508:8a48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:1e1:b60c:5bcf
 with SMTP id adf61e73a8af0-1ed7a6b1589mr2529311637.32.1738111537075; Tue, 28
 Jan 2025 16:45:37 -0800 (PST)
Date: Tue, 28 Jan 2025 16:45:35 -0800
In-Reply-To: <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250128213652.1880545-1-vannapurve@google.com>
 <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com> <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
Message-ID: <Z5l6L3Hen9_Y3SGC@google.com>
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	kirill@shutemov.name, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025, Vishal Annapurve wrote:
> On Tue, Jan 28, 2025 at 2:08=E2=80=AFPM Dave Hansen <dave.hansen@intel.co=
m> wrote:
> > Do you have any thoughts on why nobody has hit this up to now? Are TDX
> > users not enabling PARAVIRT_XXL? Not using ACPI?
>=20
> This has been a long-standing issue which would show up visibly with
> certain workloads where vcpus hit idle loop quite often during the
> runtime. I was only able to recently spend some time towards
> understanding the cause properly.

...

> > > @@ -1083,6 +1089,15 @@ void __init tdx_early_init(void)
> > >       x86_platform.guest.enc_kexec_begin           =3D tdx_kexec_begi=
n;
> > >       x86_platform.guest.enc_kexec_finish          =3D tdx_kexec_fini=
sh;
> > >
> > > +#ifdef CONFIG_PARAVIRT_XXL
> > > +     /*
> > > +      * halt instruction execution is not atomic for TDX VMs as it g=
enerates
> > > +      * #VEs, so otherwise "safe" halt invocations which cause inter=
rupts to
> > > +      * get enabled right after halt instruction don't work for TDX =
VMs.
> > > +      */
> > > +     pv_ops.irq.safe_halt =3D tdx_safe_halt;
> > > +#endif
> > The basic bug here was that there was a path to a hlt instruction that
> > folks didn't realize. This patch fixes the basic bug and gives us a nic=
e
> > warning if there are additional paths that weren't imagined.
> >
> > But it doesn't really help us audit the code to make it clear that TDX
> > guest kernel's _can't_ screw up hlt again the same way.  This, for
> > instance would make it pretty clear:
> >
> > static __always_inline void native_safe_halt(void)
> > {
> >         if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
> >                 tdx_safe_halt();

This incorrectly assumes the hypervisor is intercepting HLT.  If the VM is =
given
a slice of hardware, HLT-exiting may be disabled, in which case it's desira=
ble
for the guest to natively execute HLT, as the latencies to get in and out o=
f "HLT"
are lower, especially for TDX guests.  Such a VM would hopefully have MONIT=
OR/MWAIT
available as well, but even if that were the case, the admin could select H=
LT for
idling.

Ugh, and I see that bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests"=
)
overrides default_idle().  The kernel really shouldn't do that, because odd=
s are
decent that any TDX guest will have direct access to HLT.  The best approac=
h I
can think of would be to patch x86_idle() to tdx_safe_halt() if and only if=
 a HLT
#VE is taken.  The tricky part would be delaying the update until it's safe=
 to do
so.

As for taking a #VE, the exception itself is fine (assuming the kernel isn'=
t off
the rails and using a trap gate :-D).  The issue is likely that RFLAGS.IF=
=3D1 on
the stack, and so the call to cond_local_irq_enable() enables IRQs before m=
aking
the hypercall.  E.g. no one has complained about #VC, because exc_vmm_commu=
nication()
doesn't enable IRQs.

Off the top of my head, I can't think of any flows that would do HLT with I=
RQs
fully enabled.  Even PV spinlocks use safe_halt(), e.g. in kvm_wait(), so I=
 don't
think there's any value in trying to precisely identify that it's a safe HL=
T?

E.g. this should fix the immediate problem, and then ideally someone would =
make
TDX guests play nice with native HLT.

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 2dbadf347b5f..c60659468894 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -78,6 +78,8 @@
=20
 #include <asm/proto.h>
=20
+#include <uapi/asm/vmx.h>
+
 DECLARE_BITMAP(system_vectors, NR_VECTORS);
=20
 __always_inline int is_valid_bugaddr(unsigned long addr)
@@ -1424,7 +1426,14 @@ DEFINE_IDTENTRY(exc_virtualization_exception)
         */
        tdx_get_ve_info(&ve);
=20
-       cond_local_irq_enable(regs);
+       /*
+        * Don't enable IRQs on #VE due to HLT, as the HLT was likely execu=
ted
+        * in an STI-shadow, e.g. by safe_halt().  For safe HLT, IRQs need =
to
+        * remain disabled until the TDCALL to request HLT emulation, so th=
at
+        * pending IRQs are correctly treated as wake events.
+        */
+       if (ve.exit_reason !=3D EXIT_REASON_HLT)
+               cond_local_irq_enable(regs);
=20
        /*
         * If tdx_handle_virt_exception() could not process
@@ -1433,7 +1442,8 @@ DEFINE_IDTENTRY(exc_virtualization_exception)
        if (!tdx_handle_virt_exception(regs, &ve))
                ve_raise_fault(regs, 0, ve.gla);
=20
-       cond_local_irq_disable(regs);
+       if (ve.exit_reason !=3D EXIT_REASON_HLT)
+               cond_local_irq_disable(regs);
 }
=20
 #endif
