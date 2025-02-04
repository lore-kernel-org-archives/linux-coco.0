Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617222185B4
	for <linux-coco@lists.linux.dev>; Tue,  4 Feb 2025 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695143; cv=none; b=AQ7Gjb2G3r/Kd+QsoKY9Dnt4e78z2WJdrThcCdYIkdUlEQSZHDHhpaVuLfYAO3hEmXIcY1b7FwsXYchULz2m5viUnjLzuNtUlxDYUV7aEshRUnPDybq3cSscmt6RFc500hW9FTyKZ4uRaDiOcUYspDeNAAE2ubOkdl9hM/vKcj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695143; c=relaxed/simple;
	bh=zbnqzd6XkDlUkXnIqmyVov9gz3edxYuX6M0f9ImDYJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxKRBuqtAHOazCzMZP+o0RgwZuutPlMCXu/5OgOFwymImIZ8LtTXOB07R+mt5nL7iEG8hhBPwczunNqWbvf/MKwQibxPzDzkjVDYR5/nkTg3MBDs3f4OQfWqZS3t4JwUq5cVYRIl9zVbWowgP35DboM7BHdQEmBz87SuNgfLNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jeeIPnJI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jeeIPnJI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so9791e87.0
        for <linux-coco@lists.linux.dev>; Tue, 04 Feb 2025 10:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738695139; x=1739299939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFpEwLn/dC0QDTCh8cN9pGGSIe7PpPg7IM5j/w3xtPA=;
        b=jeeIPnJIPCgCLmAQbRG2kKI/YSosDsJAPoIJTZJcFT63wqFpd9N44ePDLvbdHpqAMK
         pEggTO2zhMJ3qcU3bD6ciTQ3Hdxbo146SWLMstacmo7h24hJ0lxWvRnF2sbn4Vl3ikgw
         pEIUjSvikaiV6C7WVfvZ5MbG8gnIMt2FTIzX5TAjLsD6LAwNymfFZr6tmsEbTbbg485P
         ySte1q6gEq0H2BImZthJOUlhpZyOjD15ASLanj4O2IhHwSHTsc9ip621w4VDo/T6gs+C
         09lpj1rhcAFpHoHJKUBgkBzGIGVTD/rhttHQ6l5r00v15yqQL9F0ovmhv5KrXIy+uAE4
         eBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695139; x=1739299939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFpEwLn/dC0QDTCh8cN9pGGSIe7PpPg7IM5j/w3xtPA=;
        b=YyJ9gPBXxejtCJ3a487JlbfbsuszhhJ9Oj+yr7gm4g3C8bM4y6Y5Ui//rr32hQzw1Q
         3XrQ21waOdt2cM1dxnS+2gLBssNTHH/btFp4QVWDWwUH3EbKWBG+8aZ9173+LwD/QtF9
         /9m9YIzpRuhmo71/cNNt6DGyUMwPmIHk1BJ/9MVx9jFGXWKL+bHt8Y6jfK8+K1qgB+tq
         qlBw/Av/NL/4Q5MRmUaikKwmkVc6cUNTK7/9aChP+lLO0BN5CLe07SkOClOjU2Q1abWj
         EHAe7e1KWSsbyqJQNOzRnSaTb40hK06r761MedavD0+dZcZ9/xpnsYU+tJCBBqpGroqa
         1o7A==
X-Forwarded-Encrypted: i=1; AJvYcCWKHfcJI20pd6bI419/019s05PkwCAHtaunkmsT8gPr3SOJChxnpb0HW0g1du7ntdTBySqHu587tFs2@lists.linux.dev
X-Gm-Message-State: AOJu0YzEC1o+7Feib/dEvAr4Q4YiG6RjMDwS8YBpeVbFpqKuZOkKTSWH
	c6iI3m7y07ZPKiux/oIubFEv+iyKjvmmWfr4knLKX6yk9juGZEeEyZ154ZHVgY7its9klF8DpST
	5ytJv9Cll5DfbAL5Gf/ItLchqy1oH/tVP5NdQ
X-Gm-Gg: ASbGnct55kqnBqR4DyNsL9fiWqmD/bTnRCr0NdIxT6K+B0fqoWX0Pufav10fujBQAqr
	/0szsu3OdMawZVORTHxlO5SKRwrkArfts+Admxg0NGgIzkOKV4vU0yTWeONJtygMqm/fm9e+7el
	Et7MPDI+ECYqP7nl4Nf7EeC1aJ5he7
X-Google-Smtp-Source: AGHT+IGa5r4vzVW+ObuRphdYnQxEuke4nepjoCC+Mwq/AxH5MPhY3uiQh6F6cWhaR3TVphiWxYmTKZAgQ7JaxJnMyh4=
X-Received: by 2002:a05:6512:2398:b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-54400bd9244mr277014e87.3.1738695139002; Tue, 04 Feb 2025
 10:52:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com> <054b7cab-4507-48f8-9c0a-d400779f226f@intel.com>
In-Reply-To: <054b7cab-4507-48f8-9c0a-d400779f226f@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 4 Feb 2025 10:52:07 -0800
X-Gm-Features: AWEUYZnozqobmK0OI4oKOR1_hLIJMHKZjhXau6ZWzoBrfPmSooIgx3fqTA3GJVk
Message-ID: <CAGtprH9r159qjAU8E2MHMAhKGjJmh8JTuJMqq345v4Bqzc-m9Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	kirill@shutemov.name, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 9:32=E2=80=AFAM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> I think this is the right fix for _now_. In practice, Vishal's problem
> only occurs on CONFIG_PARAVIRT_XXL systems. His proposed fix here does
> not make TDX depend on CONFIG_PARAVIRT_XXL, it just provides an extra
> override when TDX and CONFIG_PARAVIRT_XXL collide.
>
> This seems like a reasonable compromise that avoids entangling
> PARAVIRT_XXL and TDX _too_ much and also avoids reinventing a hunk of
> PARAVIRT_XXL just to fix this bug.
To ensure that we spend a bit more time here, would folks be ok with
making TDX depend on CONFIG_PARAVIRT_XXL as a stopgap until we have
the long term proposal Dave mentioned below to cleanly separate
"pv_ops.irq.safe_halt()" from paravirt infra?

>
> Long-term, I think it would be nice to move pv_ops.irq.safe_halt() away
> from being a paravirt thing and move it over to a plain static_call().
>
> Then, TDX can get rid of this hunk:
>
>                 pr_info("using TDX aware idle routine\n");
>                 static_call_update(x86_idle, tdx_safe_halt);
>
> and move back to default_idle() which could look like this:
>
>  void __cpuidle default_idle(void)
>  {
> -        raw_safe_halt();
> +        static_call(x86_safe_halt)();
>          raw_local_irq_disable();
>  }
>
> If 'x86_safe_halt' was the only route in the kernel to call 'sti;hlt'
> then we can know with pretty high confidence if TDX or Xen code sets
> their own 'x86_safe_halt' that they won't run into more bugs like this on=
e.
>
> On to the patch itself...
>
> On 1/29/25 15:25, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via tdvmcall. This process renders HLT instruction
> > execution inatomic, so any preceding instructions like STI/MOV SS will
> > end up enabling interrupts before the HLT instruction is routed to the
> > hypervisor. This creates scenarios where interrupts could land during
> > HLT instruction emulation without aborting halt operation leading to
> > idefinite halt wait times.
>
> Vishal! I'm noticing spelling issues right up front and center here,
> just like in v1. I think I asked nicely last time if you could start
> spell checking your changelogs before posting v2. Any chance you could
> actually put some spell checking in place before v3?

Yeah, will do. I incorrectly thought that codespell runs by default
with checkpatch.pl.

>
> So, the x86 STI-shadow mechanism has left a trail of tears. We don't
> want to explain the whole sordid tale here, but I don't feel like
> talking about the "what" (atomic vs. inatomic execution) without
> explaining "why" is really sufficient to explain the problem at hand.
>
> Sean had a pretty concise description in here that I liked:
>
>         https://lore.kernel.org/all/Z5l6L3Hen9_Y3SGC@google.com/
>
> But the net result is that it is currently unsafe for TDX guests to use
> the "sti;hlt" sequence. It's really important to say *that* somewhere.
>
Ack.

> > Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests") already
> > upgraded x86_idle() to invoke tdvmcall to avoid such scenarios, but
> > it didn't cover pv_native_safe_halt() which can be invoked using
> > raw_safe_halt() from call sites like acpi_safe_halt().
>
> Does this convey the same thing?
>
> Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> prevented the idle routines from using "sti;hlt". But it missed the
> paravirt routine. That can be reached like this, for example:
>
>         acpi_safe_halt() =3D>
>         raw_safe_halt()  =3D>
>         arch_safe_halt() =3D>
>         irq.safe_halt()  =3D>
>         pv_native_safe_halt()
>
> I also dislike the "upgrade" nomenclature. It's not really an "upgrade".
Ack.
>
> ...
> > @@ -380,13 +381,18 @@ static int handle_halt(struct ve_info *ve)
> >  {
> >       const bool irq_disabled =3D irqs_disabled();
> >
> > +     if (!irq_disabled) {
> > +             WARN_ONCE(1, "HLT instruction emulation unsafe with irqs =
enabled\n");
> > +             return -EIO;
> > +     }
>
> The warning is fine, but I do think it should be separated from the bug f=
ix.
>
> >
> > -void __cpuidle tdx_safe_halt(void)
> > +void __cpuidle tdx_idle(void)
> >  {
> >       const bool irq_disabled =3D false;
> >
> > @@ -397,6 +403,12 @@ void __cpuidle tdx_safe_halt(void)
> >               WARN_ONCE(1, "HLT instruction emulation failed\n");
> >  }
> >
> > +static void __cpuidle tdx_safe_halt(void)
> > +{
> > +     tdx_idle();
> > +     raw_local_irq_enable();
> > +}
>
> The naming here is a bit wonky. Think of how the call chain will look:
>
>         irq.safe_halt() =3D>
>         tdx_safe_halt() =3D>
>         tdx_idle()      =3D>
>         __halt()
>
> See how it's doing a more and more TDX-specific halt operation? Isn't
> the "idle" call right in the middle confusing?
Makes sense.

>
> >  static int read_msr(struct pt_regs *regs, struct ve_info *ve)
> >  {
> >       struct tdx_module_args args =3D {
> > @@ -1083,6 +1095,15 @@ void __init tdx_early_init(void)
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
>
> Just like the changelog, it's hard to write a good comment without going
> into the horrors of the STI-shadow. But I think this is a bit more to
> the point:
>
>         /*
>          * Avoid the literal hlt instruction in TDX guests. hlt will
>          * induce a #VE in the STI-shadow which will enable interrupts
>          * in a place where they are not wanted.
>          */
>
>

Ack, will take care of these comments in v3.
