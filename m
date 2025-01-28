Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA41D6193
	for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738105857; cv=none; b=mx88g9oWKUPQjeuZItErmy9u64TNBRRZCL7gxRwsvxMnzpkwT4cLfKGTKeCtYhj7a6EGDbfPE1yDbjYvVxPavEoRBPl0eSxkNiTb8fxzkN9b0H7RFJGNFuL4oLQmCILYXG86xMAqcKr7P94cktrM2mbU2F0ye1guT751no9VfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738105857; c=relaxed/simple;
	bh=MNP3mXhQarid3ub5H80lrXqLbTuYpmiWSzAXUI9X7PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOtRxiMw9wCOyLmqvEQTeVg6OQ3Rgnd+nylhIDB0UwzjXgfdjyYXum/6Z94uw7F/7sKXiw+nfRiKJlBkOl1VHVHOJPWP4oTOQ5w+3dRLuKu521lnvKRoU3cc7du6D8ZzChYDJWSt80QvMaZW0RMB6lakOVIJxq2Nhdd7vD3gklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G9ic1tet; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G9ic1tet"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so13508a12.1
        for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 15:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738105853; x=1738710653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30S4D0hh4slgH4ZDwimyvWHl6AB3y65dPz0b2hgA7g0=;
        b=G9ic1tet+/R9WPcihm36WofqDJmiLLlWRsV7JcfTRygO44xBqlqJsl5LIcpmbePalT
         PNb/58Z0pqpZG7M3HYhXfClMmZ3p5a65xO3Obfn/YrJyZT8ezNeV9JOZ49OrDdZer98j
         5tjCTHzGVD6KW6Ykgufy0AasFhUN6xQ1r5Z0Mzaa5xAh2z7vHZGi5w3NNzg4o4enY4KZ
         1s7AYTDmTO+8F4r/wQTw6EaH/pgt0+w067MY0hGNBjMZL6xywlDrth6rkc1r9Wi/ALaK
         WDylVBh4bRBDXN3gkdA7gf4+APm302eq7SrgGW90QWM0aqiF7a3ZSEqVESjJl3HmQqB9
         7ZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738105853; x=1738710653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30S4D0hh4slgH4ZDwimyvWHl6AB3y65dPz0b2hgA7g0=;
        b=SQkuqur8TvZdVh/J4NOlc582Q/K5rOfituDgzoX9klvRHVWffokxAQvNPCLYCfqT/T
         +KXhu+ON7tdemwAMW/Vjs6HJWJkdIw88hNfI4TJAJUfFcf/mEnRwpLawXBtmNN8qx/xB
         1S4kTf/XZTir4pLbuvHPmrkGFKxgS6um0ZwleKa61zNWuY5RkziVkShD6+C9hNJacDdQ
         yIyej1DEgecypVCF+8ohAItrynYCVsGGh17joViB/twz+jUSJUNio8O3PpzSfPPlhEj8
         elGRFPnjlhZoOqPGTPYr6F5GpF5mlVGND0CbC6ZkY9bZnPFHKNxV3ygdrFKeStfnt/aj
         BCHg==
X-Forwarded-Encrypted: i=1; AJvYcCXQtAt0kT9MHlmjlu+ei14WpSx9I/0ZWvHLBjjU0RHMF0zUnD7zD6TZt7KcicqU15GDVGyeNo7xoxRO@lists.linux.dev
X-Gm-Message-State: AOJu0YxIgXcrvx6IfFiXLYthpJpMHDf+VmyiSkQFsomTLjyusRM9f1a6
	pBCZfZiT0xqsuOBGaUnnYr8J62dQk7ipGXuA4Gm5HYzptirGesvIloRvj1l8iu5lZ11tZWDDLtp
	eV3USVpCRRlpi67OTEGAKv3UqJhKMU3+FNB2J
X-Gm-Gg: ASbGncvbC3QFhZLGjkOybe8CMAUqSdWzOyIuAgkOMhWZ9RQJn321xpJqj0lbhiFgnEJ
	cso+31tzZJN6mTPmqPeCpuOIrR7brTXUkPNQ59BIhPUXCEvna1G/lEn7hFYEZ9GUCn6vG3lSOOd
	/w8PcpS7Gs0UoG7rmtpzhCmFs=
X-Google-Smtp-Source: AGHT+IGPbz93uGpVfh/Ixn4HERBA1PJ2FGVLZbXF2Ya5IhqfnhZyUzj25HM7E5GP/JaQbmDxOkZViBWPWUi9ykUZO9g=
X-Received: by 2002:aa7:c7d0:0:b0:5db:68d3:e8e7 with SMTP id
 4fb4d7f45d1cf-5dc6097ab7bmr16204a12.5.1738105853025; Tue, 28 Jan 2025
 15:10:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250128213652.1880545-1-vannapurve@google.com> <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com>
In-Reply-To: <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 28 Jan 2025 15:10:38 -0800
X-Gm-Features: AWEUYZnr6BalmDJDczp06JqsaAK8ci8DX1jknG7h12z9nntmVUzxD_y9zvF07es
Message-ID: <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	kirill@shutemov.name, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 2:08=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 1/28/25 13:36, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via tdvmcall. This process renders HLT instruction
> > execution inatomic, so any preceeding instructions like STI/MOV SS will
> > end up enabling interrupts before the HLT instruction is routed to the
> > hypervisor. This creates scenarios where interrupts could land during
> > HLT instruction emulation without aborting halt operation leading to
> > idefinite halt wait times.
>
> Could you please break out the spell checker before posting v2? There
> are a couple problems in that paragraph.
>
> > x86_idle is already upgraded to invoke tdx_safe_halt to avoid such
>
> Please add parenthesis to functions() to make it more clear what you are
> referring to.
>
> > scenarios, but it didn't cover pvnative_safe_halt which can be invoked
> > using raw_safe_halt from call sites like acpi_safe_halt (acpi_pm
> > subsystem). This patch upgrades the safe_halt executions to use
> > tdx_safe_halt.
>
> No "this patch", please.
>
> > To avoid future call sites which cause HLT instruction emulation with
> > irqs enabled, add a warn and fail the HLT instruction emulation.
>
> This seems like a bug fix. Shouldn't it have a cc:stable@ and a Fixes: ta=
g?
>

Makes sense to add "fixes: bfe6ed0c6727 (x86/tdx: Add HLT support for
TDX guests)" tag.

> Do you have any thoughts on why nobody has hit this up to now? Are TDX
> users not enabling PARAVIRT_XXL? Not using ACPI?

This has been a long-standing issue which would show up visibly with
certain workloads where vcpus hit idle loop quite often during the
runtime. I was only able to recently spend some time towards
understanding the cause properly.

>
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 0d9b090b4880..98b5f317596d 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -14,6 +14,7 @@
> >  #include <asm/ia32.h>
> >  #include <asm/insn.h>
> >  #include <asm/insn-eval.h>
> > +#include <asm/paravirt_types.h>
> >  #include <asm/pgtable.h>
> >  #include <asm/set_memory.h>
> >  #include <asm/traps.h>
> > @@ -380,6 +381,11 @@ static int handle_halt(struct ve_info *ve)
> >  {
> >       const bool irq_disabled =3D irqs_disabled();
> >
> > +     if (!irq_disabled) {
> > +             WARN(1, "HLT instruction emulation unsafe with irqs enabl=
ed\n");
> > +             return -EIO;
> > +     }
>
> Yeah, this warning is a good idea. But probably best left as a
> WARN_ONCE() so it doesn't spew too badly.
>
> > @@ -1083,6 +1089,15 @@ void __init tdx_early_init(void)
> >       x86_platform.guest.enc_kexec_begin           =3D tdx_kexec_begin;
> >       x86_platform.guest.enc_kexec_finish          =3D tdx_kexec_finish=
;
> >
> > +#ifdef CONFIG_PARAVIRT_XXL
> > +     /*
> > +      * halt instruction execution is not atomic for TDX VMs as it gen=
erates
> > +      * #VEs, so otherwise "safe" halt invocations which cause interru=
pts to
> > +      * get enabled right after halt instruction don't work for TDX VM=
s.
> > +      */
> > +     pv_ops.irq.safe_halt =3D tdx_safe_halt;
> > +#endif
> The basic bug here was that there was a path to a hlt instruction that
> folks didn't realize. This patch fixes the basic bug and gives us a nice
> warning if there are additional paths that weren't imagined.
>
> But it doesn't really help us audit the code to make it clear that TDX
> guest kernel's _can't_ screw up hlt again the same way.  This, for
> instance would make it pretty clear:
>
> static __always_inline void native_safe_halt(void)
> {
>         if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
>                 tdx_safe_halt();
>         mds_idle_clear_cpu_buffers();
>         asm volatile("sti; hlt": : :"memory");
> }
>
> There are reasons we wouldn't want to do that exactly, but I'd much
> prefer something that is harder to screw up than the proposal above.
> Anybody have any better ideas?

All other suggestions look good to me and will incorporate them for V2.
