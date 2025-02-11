Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8327291F
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739317053; cv=none; b=UHLNVkxJuRonLlG19OpR2ubp3MlaHWMX6Fc4XI6Bm+girH4AIiVoNhiponBgswMgBRiO3Zubc7+VsBYv56IvRQcfUq+KscB+ywHjGlbfAUBFre6/Flyh8bGngxHqYp9ApCcstF9tsIdY/96BvSmcuQ79HlhVqSyo0f61i0M0SAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739317053; c=relaxed/simple;
	bh=GutEcZz61gwify1yCL/KrmgOIzRRqXpILaGYVs/GWDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaRBITeZoAsQGYpEhP3ufoTTy8lJKcgMfndhj+zmwZ2ZWc1V/XaYqHAXrruwfQlT0X1GEvu//Qmt5+jiodf3qDcYWS1GXEYtvE8xJYtulGDjtBlu4Nx3Twjhp7vKTK/yrSi1MBP9caGZHj3OZ3Ik6PhwXYhmj9d8tgIb/Dyh99Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W05HBlJl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W05HBlJl"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5440f27da4fso3163e87.0
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 15:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739317050; x=1739921850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSbvnItNGBxBKAvRaSMscNhWBRYdPAos9+Z7zPAciRI=;
        b=W05HBlJlGxZA0KGNU3NaVqdT6+Cm67QzvrtU1hVHhXrDP1UmzJLe4hwVkA2lFnFr7x
         BWXvYeAjlVfPtVbRZvFRQ7+NEtz4btXhFhna+fGNPJa9AILupJM6DFHvTMHnoA01KolW
         WjO6/xbPKiJEtkTZwrrn4v70i+xAlZw7suHDxoDgSLJgBmcfIpoWROO40tJNiFAk4WvA
         lvlw1X5UYB4jgtHk4iaPv1HoqjUo8EOmSxOIl9mb1+DScRARj9j2axN8Wuv2AL7qqema
         ZY7JhTk4VuMmzm0OQHFM8R9CbgkehUrZauTIXLjIVg5sTEN4t1qeDJ37DpYlCt9P9SEi
         IybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317050; x=1739921850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSbvnItNGBxBKAvRaSMscNhWBRYdPAos9+Z7zPAciRI=;
        b=K6vc8kPRDlMkSASKQctCovZMZsgY6rFaT44SH+eKQHftYRtnFNPJO3xXOswPHr+q7i
         6QldEdHbK37unYqMFQUy3jv6h+zRPDclTDohxsNXv56pBfn1jQx2EOeQ7On5Vew+mpVI
         VYFVeQApbrOUWrl3L1FKDOyL3jX6aWw51FmB1HohdjaiONBEuOar7nbQQGV2H9HE/QlF
         aOYDCzow71TWyH3yRPHUNR4cWOqnN/IuCrhF0wXwUnnl7dCaf5xqIuDtPuoqOKrGE1Wy
         GnOnNwUNAcdHo6vMcpBl3nKEM2IKPD0qnPre51SpgzxKDpMRiA5L2x8wB929DAnv2PjJ
         cyww==
X-Forwarded-Encrypted: i=1; AJvYcCVhNn5dVaYM2GnzDbfBpL45bsmcmMfsxVfHU1vO4gshR0OeONBz4Flm8JVV2AyJCDRRTqB0eSrgGFzW@lists.linux.dev
X-Gm-Message-State: AOJu0YzVJ94XpmKza0uZsqqvFtpz5M1YfOZVhDi36VfUJXehvzpoKCOv
	smgIzbLTiDXXASCRLTRpmWsCXKkQIAwR+w9+gaeABy9qMD5/DhrHQYrTBicMFtVubM9psHeqxEW
	ic8KonEf9xawc1VFOfNQiqPnUkt/ziXYE7Nw6
X-Gm-Gg: ASbGncsqwiRpinZcUoL+08pKlFLyBZdUWeebq8CY+Q1gSSpibiPKL/ERj0VWxQsTa3r
	Jdmbbe5Jt/AvczT/XK0Szoo4NbMgvQiR+jSAlFYiUs0bL2aGH4cLi32WA9uUwencc1PN5NL3YEt
	yXRZ0UJRtA2eYv0qNP0+185K/qnZbiLA==
X-Google-Smtp-Source: AGHT+IFwqfZpukbm59rOXt6h263eOHCDjc136zYAOcXQHTigPOGAqt3tg2yJH93apvYN9rjDIs6HzHeYOQ9BeM6qfi4=
X-Received: by 2002:a05:6512:3d90:b0:545:34e:16c0 with SMTP id
 2adb3069b0e04-54518de9606mr38355e87.5.1739317050020; Tue, 11 Feb 2025
 15:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com> <wra363f7ye6mwv2papahmpgmybi45yqyzeohunbqju3zsf22td@zcutpjluiury>
In-Reply-To: <wra363f7ye6mwv2papahmpgmybi45yqyzeohunbqju3zsf22td@zcutpjluiury>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 11 Feb 2025 15:37:17 -0800
X-Gm-Features: AWEUYZl70YOalrJ-dWWuIpBvrvuQpb_FScJ4zAQWzJRP5MMlca2CNQsA8FuLHfY
Message-ID: <CAGtprH9yekaDTCn0P83k221sW2DoXL5AwKLmD54Pv=PmUPU6Aw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	kirill@shutemov.name, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:32=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Thu, Feb 06, 2025 at 10:27:12PM +0000, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shado=
w
> > so IRQs need to remain disabled until the TDCALL to ensure that pending
> > IRQs are correctly treated as wake events. So "sti;hlt" sequence needs =
to
> > be replaced with "TDCALL; raw_local_irq_enable()" for TDX VMs.
> >
> > Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> > prevented the idle routines from using "sti;hlt". But it missed the
> > paravirt routine which can be reached like this as an example:
> >         acpi_safe_halt() =3D>
> >         raw_safe_halt()  =3D>
> >         arch_safe_halt() =3D>
> >         irq.safe_halt()  =3D>
> >         pv_native_safe_halt()
> >
> > Modify tdx_safe_halt() to implement the sequence "TDCALL;
> > raw_local_irq_enable()" and invoke tdx_halt() from idle routine which j=
ust
> > executes TDCALL without changing state of interrupts.
> >
> > If CONFIG_PARAVIRT_XXL is disabled, "sti;hlt" sequences can still get
> > executed from TDX VMs via paths like:
> >         acpi_safe_halt() =3D>
> >         raw_safe_halt()  =3D>
> >         arch_safe_halt() =3D>
> >       native_safe_halt()
> > There is a long term plan to fix these paths by carving out
> > irq.safe_halt() outside paravirt framework.
>
> I don't think it is acceptable to keep !PARAVIRT_XXL (read no-Xen) config
> broken.
>
> We need either move irq.safe_halt() out of PARAVIRT_XXL now or make
> non-paravirt arch_safe_halt() to use TDCALL. Or if we don't care about
> performance of !PARAVIRT_XXL config, special-case HLT in
> exc_virtualization_exception().

I will post v4 with the patch [1] move safe_halt/halt out of
PARAVIRT_XXL included as the next step.

[1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanarayanan.ku=
ppuswamy@linux.intel.com/

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
