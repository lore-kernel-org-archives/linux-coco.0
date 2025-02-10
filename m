Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3FD25B66E
	for <linux-coco@lists.linux.dev>; Mon, 10 Feb 2025 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210900; cv=none; b=LtlvQzuasSyZ4XoEIbkpPwu+STPmKzIoVkJ4OXIfM070YYNEj9Sopj8wYC1drFygnPqTWxfR65YbS3q6OKk044JtofvFx8ypwpVuh4UlyAM53CeR3Pw8DeeaffLwZc7wjRi5QCmo0Xptuu5EU4iUyUwGsNxRAt0aQAgKi7MAHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210900; c=relaxed/simple;
	bh=2TtPvP50kSHzT7tkM6+GtK/X7cM/bySGkYO5MxVxTao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESVHPq0QNMiglSUQPoS/75vjiehJVLuPbHo7lgZQRdINBDXW3wkY+0QKYQi97bJOj2JA4xE2ZOXmDXM7T3hW8Frmqn/cjX8Qahqx6jGrMyoeSbQthBAzBZCSKRmuSJ9Ej2Dw/JzY1zA/aKUdT/3oniyX6JVP9h07Kbd26mW8Eak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qu0xHqNU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qu0xHqNU"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-544043a21eeso131e87.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Feb 2025 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739210897; x=1739815697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY81El80qf9jAQEoVg2pi4Od5P6ae28aqttIokpPNQA=;
        b=qu0xHqNUnbTwaMg8BQmh3Niw8kJskqlleSoD12wcVZxUP8UetOVJi+BfuE0pO1doZT
         IBzJqcqr9jLqgaodJHyjn7Rxdp2YEzH30vw3Cynf3Xw90WJw3w7rPG6kplUvSZenlIbS
         uGiY1W8/1us1GiPZo1Cn3YygUEupsXTnmkvaOQwmo5+9VeV8OwU/UVx9fASM44b7ppu+
         E5SSBAyPtOR2mu3hsLrChcOJNzbe6C6j/WnQMGBNuD7Kym1BSlOt37JHLzI1/GeFq7Gb
         K16BNu4mPV5tN0ETJQ+Fo6D8s820KFyjL5cMTVmN4Z4LnffJQUuXia5GmE8TrYMWjOMU
         IFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210897; x=1739815697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY81El80qf9jAQEoVg2pi4Od5P6ae28aqttIokpPNQA=;
        b=NiBogiKbk3GYc+G6XovPM/SI+0pEDjb26dd33dOAPsMOcFDq6JbDKflT9YwwXQwG+V
         J/XvODuWuy3L+jILQxe2qizcSvjXm+CfxsB3y2X9yri/x0D9i54w5p3COnWo7Fe4Z42L
         d9YvpenC0oxssk+TTopQBg2WHUfjwT5LRduXiXoyDnTRFbIoyv4epQaH06CCHj7CZpOV
         ABWqkbh5DdTpzBCibcCzQDLTAN02WhxaBtDN18LrQW9djGtqn+9os+s+ehpZqC86yC6w
         TYSNslYLlgs0nVhb/dO4JmXI/EUvug3G15We3strqgyR6P6MYVsjMGbyDDfsgwznOmY3
         f+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXSzhfEE56QJgxl/YxrrbAt0cKk/Lz7k5j01SS4cGqwYPje+KHsJfWsHPqbO1+a00evOzs8ndC21wwF@lists.linux.dev
X-Gm-Message-State: AOJu0YxM7uI3xsq93PbFCcwvAx2YqyYmM6CpsKdMXgWSXvG7ymQ/JPk4
	SKFIGMEw+659HmCX2GT4hu9F+rME+eMW4iK7+q25BxhjiDcSsmVa2nSNxy9FENjqtMse/f/eyID
	Y/d2x6DKsitUIe+ZfRdUV2Ii1wr/TOHNdk0aj
X-Gm-Gg: ASbGnctt7vQwKqJLwjVr6WoUEya7Xb9b+9vYbDdrTH7iIQYs1xZGP4NwP4VCmGXX0fU
	qeEN4mG6D01MkFZ64WDWsinpfd01ytbFDeAIgNePII95tZcgce9AY8FS8AjQQbeIaAPEbqHgbrk
	jrQ2n6Qj0hHWyXdebEjbL0jquCfeBfTA==
X-Google-Smtp-Source: AGHT+IEQ0ef+m0AldXUWYxdphrWb1Y+cg1qk04ttfFfh49scXV0ClP0LU7xJYgLk7R8kmb1GlW+DJtnurcrGSpm+cjQ=
X-Received: by 2002:a05:6512:b9b:b0:543:e496:81d2 with SMTP id
 2adb3069b0e04-545045437f8mr414613e87.4.1739210896652; Mon, 10 Feb 2025
 10:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com>
 <20250206222714.1079059-2-vannapurve@google.com> <Z6YlTG3QV_Pv6nRo@google.com>
In-Reply-To: <Z6YlTG3QV_Pv6nRo@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 10 Feb 2025 10:08:03 -0800
X-Gm-Features: AWEUYZlh8FYiLO34fdk4pxnYTBPzAVvxgBUi3fK_ZQnbfSispqIxfJvp5sRmnEU
Message-ID: <CAGtprH8A8zLLPVUdRjy179Rn=MtwzSUk8UDbR+XPws2+J4h-hw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during
 HLT #VE handling
To: Sean Christopherson <seanjc@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:22=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Feb 06, 2025, Vishal Annapurve wrote:
> ...
> > ---
> >  arch/x86/coco/tdx/tdx.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 5e68758666a4..ed6738ea225c 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
> >  {
> >       const bool irq_disabled =3D irqs_disabled();
> >
> > +     if (!irq_disabled) {
>
> Wrap the check with WARN_ONCE(), doing so adds an unlikely to the <drum r=
oll>
> unlikely scenario.
>
> > +             WARN_ONCE(1, "HLT instruction emulation unsafe with irqs =
enabled\n");
>
> Newline is redundant, the WARN does that for you.  IMO, it's also worth a=
dding
> a comment, because this is like the fifth time "safe halt" has come up in=
 the
> context of TDX.
>
> E.g.
>
>         /*
>          * HLT with IRQs enabled is unsafe, as an IRQ that is intended to=
 be a
>          * wake event may be consumed before requesting HLT emulation, le=
aving
>          * the vCPU blocking indefinitely.
>          */
>         if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
>                 return -EIO;

Ack, will integrate this feedback in v4.

Thanks,
Vishal
