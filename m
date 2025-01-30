Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2341EEA38
	for <linux-coco@lists.linux.dev>; Thu, 30 Jan 2025 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257893; cv=none; b=oB4r3H+Ej0Lmo1enfBZfSaXO/kE5Fj1R94DbEZW20DL7TJ+G0efRql4ZoJeCAIb+vTYvksJ5Md2gM4vNqu8mFMGuC4C9lDnXEVjzBqpq0TblE03zUmOYqN+VrqzJXiFLieFrrGto9qDC5sc7sCW9fMYzqoLZf2IA6L/XAJpR0T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257893; c=relaxed/simple;
	bh=16Rtl0kPvK8LvctNGEQQq5RSVYBc2bMyshwhKZStO/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=in//G0QIdV//1hUROUCewRY8rflHjARYYWZnzZhtlTbjV6r3ndBeRimOjnq/53CZAskYWgqFRI7eMawW/zpWMMHMIIzKw3Yjt6IiOabABsuX/sA9ByPL0ZKOfXkmS+QVWzKoMZEKCIShfDMs00WulsJMDqnM6un/uKciWt4SpuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vauTRZ6h; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vauTRZ6h"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so8341e87.0
        for <linux-coco@lists.linux.dev>; Thu, 30 Jan 2025 09:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738257889; x=1738862689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytbv10R47zKrtdNtXLC6q54yc2GgqTDFS/Rjg6hjIts=;
        b=vauTRZ6hph7EsSug7tWwJaOtekSn5YLf8n+Cj/vGE1lajLVSMf8qsdl1OYToupqlvv
         YbVGFUYimt6bDR6z8tlFu/nBqra/3ikZUPBfbOwt6iDbMAJqAezsFjTFX44dPZ6GVnyI
         qof2U6+CMUVMxww6NUg+e4cb4kuRi7L0GwNT+CbugnlCFYP2ForP/+Ptmnluvd8Tzpud
         wJ2G9zzzZX+LroBwpHk7P5P1uG/b/7DeQVXs1Z6gEgsp6Dd6HURnfRBlbUABGqZz8QIz
         9Q30hSgrAS665+GtAjquJVMduNyOaHSYz69WqNpnBXJYjOVQT7JsGtT+Aj8YL2c/IOkW
         VfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257889; x=1738862689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ytbv10R47zKrtdNtXLC6q54yc2GgqTDFS/Rjg6hjIts=;
        b=NqOCs9lvVFD9dw/iDHrdv12ym8gF75IVhS32YuETeI24u0LkDbTGe/1Y56K8DeWSb4
         KGMbYlGUEyGwIxsETtbkhYa51n5QMzIqU38oOqFHCSXF3CI6Bc1UJQi2v3+UHSTftXUb
         NvuIwYm7dHoNjSQHi7RfoZVgpZ0F5Moig6M1SA7uZpBSV8JAZ8rQJm97GUoD+nX6EW3J
         BNjPUA0ZRo4j5KZJL1/zL958zrf+dVfqSBb//tAFPDDeAwxKiHB6utx5o3qhzvHSx8Qk
         KrNi5hqQ4sgASLyaWfAr0d6sh4Mbso8EHPMqbE1dmlXG1viHFdgaLO9cXvI2or+V/SMO
         6pVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIaYReHR1IxL/uUeHxI9atv05GQXZfVduaAwnwxEyH5+I3iH+VJxgvyxs+0KQ0Qlw31S/ZgtGVrokw@lists.linux.dev
X-Gm-Message-State: AOJu0YzFx/Xx8GsOO4x4ymuHsvoYR4/yUDrUbXDsYrR1/PDcHmdI+CN/
	KCxlt+fFDVG+2jWFRguQjpehVVCKUaZjxu8rr++YJsT7Gazf34NpGpbdf4PXWbZDQktLPckP5Fh
	/aF2Dri0r4fINjO1xJE5Va2LCs2ENHZzMnaQ6
X-Gm-Gg: ASbGnctgCVbRKxKRr/aGJFDxDet7xr1ZUCYuch2rx2Klg+GsNyxXGKAp2RISzZAd6mA
	ILg2yOw/Oapjlb4FvUmmjSmBljfKy00cqCdQIExato5v/nPZZ2AYafn6/ADTWudzMADXMpQUnX8
	aPby73OZUnLxkjV9IUmmHe7mq1Ot2u
X-Google-Smtp-Source: AGHT+IHGXjIuGHyYvinkolLHPrB3xKTIatYLtgB6dOgTWRUiuCvNPBN2nPJMZxKUNI9gZitDAU+5h28oeYpNufGjIpI=
X-Received: by 2002:a05:6512:3c82:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-543eb8e03e7mr233434e87.7.1738257888583; Thu, 30 Jan 2025
 09:24:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com> <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
In-Reply-To: <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 30 Jan 2025 09:24:37 -0800
X-Gm-Features: AWEUYZkAZWEN20O-bM6sJUmh4IpRXLFoLT5nGRGgfa0BYJKZf8LxMQCmXFRJV9E
Message-ID: <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 1:28=E2=80=AFAM Kirill A. Shutemov <kirill@shutemov=
.name> wrote:
>
> On Wed, Jan 29, 2025 at 11:25:25PM +0000, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via tdvmcall. This process renders HLT instruction
> > execution inatomic, so any preceding instructions like STI/MOV SS will
> > end up enabling interrupts before the HLT instruction is routed to the
> > hypervisor. This creates scenarios where interrupts could land during
> > HLT instruction emulation without aborting halt operation leading to
> > idefinite halt wait times.
> >
> > Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests") already
> > upgraded x86_idle() to invoke tdvmcall to avoid such scenarios, but
> > it didn't cover pv_native_safe_halt() which can be invoked using
> > raw_safe_halt() from call sites like acpi_safe_halt().
> >
> > raw_safe_halt() also returns with interrupts enabled so upgrade
> > tdx_safe_halt() to enable interrupts by default and ensure that paravir=
t
> > safe_halt() executions invoke tdx_safe_halt(). Earlier x86_idle() is no=
w
> > handled via tdx_idle() which simply invokes tdvmcall while preserving
> > irq state.
> >
> > To avoid future call sites which cause HLT instruction emulation with
> > irqs enabled, add a warn and fail the HLT instruction emulation.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > ---
> > Changes since V1:
> > 1) Addressed comments from Dave H
> >    - Comment regarding adding a check for TDX VMs in halt path is not
> >      resolved in v2, would like feedback around better place to do so,
> >      maybe in pv_native_safe_halt (?).
> > 2) Added a new version of tdx_safe_halt() that will enable interrupts.
> > 3) Previous tdx_safe_halt() implementation is moved to newly introduced
> > tdx_idle().
> >
> > V1: https://lore.kernel.org/lkml/Z5l6L3Hen9_Y3SGC@google.com/T/
> >
> >  arch/x86/coco/tdx/tdx.c    | 23 ++++++++++++++++++++++-
> >  arch/x86/include/asm/tdx.h |  2 +-
> >  arch/x86/kernel/process.c  |  2 +-
> >  3 files changed, 24 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 0d9b090b4880..cc2a637dca15 100644
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
> > @@ -380,13 +381,18 @@ static int handle_halt(struct ve_info *ve)
> >  {
> >       const bool irq_disabled =3D irqs_disabled();
> >
> > +     if (!irq_disabled) {
> > +             WARN_ONCE(1, "HLT instruction emulation unsafe with irqs =
enabled\n");
> > +             return -EIO;
> > +     }
> > +
>
> I think it is worth to putting this into a separate patch and not
> backport. The rest of the patch is bugfix and this doesn't belong.
>
> Otherwise, looks good to me:
>
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.i=
ntel.com>
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

Thanks Kirill for the review.

Thinking more about this fix, now I am wondering why the efforts [1]
to move halt/safe_halt under CONFIG_PARAVIRT were abandoned. Currently
proposed fix is incomplete as it would not handle scenarios where
CONFIG_PARAVIRT_XXL is disabled. I am tilting towards reviving [1] and
requiring CONFIG_PARAVIRT for TDX VMs. WDYT?

[1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanarayanan.ku=
ppuswamy@linux.intel.com/
