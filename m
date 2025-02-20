Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B811DED6F
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740095476; cv=none; b=L52FQdYXVxvzNlhFvhZS1m0Utp0nN5i7fCYNwyt3F/xm/YydRcsSWoi7cPwQxDyjwayeUnR8j9CmZb8AAzbrUbnYrWJ++9pXW82tgwmCz665K0tT6N9ZAutTqEJGpWOL+gXN9YjZkQdRFfoNLOUXQ900vYw/ySb2FkvkPER7ymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740095476; c=relaxed/simple;
	bh=UdWhNOUBSdT4syJ+kosIuq0AfZUSJ0WGNQkI3p+ncvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI9dN44WnCO+t6vr+oiFSwYWVSBtB2JkF/cZc8UdsuR2IsLbmyNQsaYkIPqeHc+2Uh/K9BuYDcjvnxhC8bQSQqEAUq187xJbt5GHrSNZ9kZOWRT9vwZXuTnSjf+DBGa+0z/9Y391fK2S3Pqjq4pr8/DVOBJKwGRBDXotYQrpUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYqJVCB6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYqJVCB6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461a3a03bdso1389e87.1
        for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 15:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740095472; x=1740700272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF2FkYUFOzGpOUac93fgsUwfXQ+Ch5dCBcOjNCGwr4o=;
        b=dYqJVCB6xU9HEsdpKeQoYHR8BZO6QoDtl255pkj6PaAi21Fhxn+QkUA1PtNLQfXQj2
         3sxnbNNjuhUId5Sn4XYGwcEG+3snGyu1cf9D+D/C7pcUN//9IcmZQU29+Hw1QzVsS+qy
         54mDj6DE91eumNKrciWz2Wc6NTiQpLar/ZlqVqSTMsUphgGSPW6jcVCNzREBRcFLv+Ot
         4wN/7o5kHjP0S8KMOSatEPfyB/tJknnDF7KScZm7i7FEkgA1N6fmsL5xCYtLCbyBXYre
         ZVLtFTjkR6819UDrlORL81RjBMDXuabcmYrs2yAZmg6bhvDoKjCh0NFBdKK5v3Tgi8s+
         mzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740095472; x=1740700272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF2FkYUFOzGpOUac93fgsUwfXQ+Ch5dCBcOjNCGwr4o=;
        b=HD5MAshmcrc29aK9bW8/orotp/wqp5PgUoUd1jcJK23jpn38elgwfqXsKoarS1aMJd
         Es1rNHG3SV5jbDRX8yJ7UTUO2DAsEhUA1IZyPdMFJAK0LAwM4sjo3SBfxOKVBSIZzQCg
         rJCJ94weezHBXiMxmSsr5wXIhvqzC88/UvzYSGfrLYGj+JOa5D3eufYAvEav1xRJ5pYa
         c0cI0nNsDxRxHj7xmqnKoX9ms5Iw2HiCqIyMFR53E25aEi69nA2SeT4+i4yzO/dkNaQx
         tCO+Oj5g5cj5txzb5mbFadm7rF7EtHIoAGyZesc/92rdZbrOcC81cOAHq1792+jbNymK
         yCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD6hOwbzGyHwG7jcGbne2vGZbVw9Kax/d5T0+uAnHbFMq8eXGTqF/DOxMevxnHPXOT44gy7iRpE7pS@lists.linux.dev
X-Gm-Message-State: AOJu0YydWEaviXb+MpwMQZ3CxHcIRh+pT2R8swCUXU5/MyeEzGlQGRFm
	d44/AiG3mcChSRvcZ9C7gcWFptPtbfSIEOicpxCk0dEx4gTlZdm4VXUB21twDM3K4ZCQHVKcmKx
	R9iz8B0Skx+qC/dYUdJncSNUSk34IG5kxpJd3
X-Gm-Gg: ASbGnctVj4XkG7DAG+Sd4pzbCD/9cKA489XNVq5HrnigI1lEF+S82+jfhv7w9pU7Tj+
	zzl5jjHkKLVJIrwq4DoChAhjky/uv2FLKIw2WJ3oDMCHzVEzFLfses0/WnQ8QiZbw/RzxB//ERq
	LRS3Tfvm/i+D23WrfVgCvAaqR3GWa8
X-Google-Smtp-Source: AGHT+IHNrahV1BDNb6HGmIpADFoAfSxQLvTQMK+ss0Zxtwi9sdNu6MrrXOWs+BR87xWGqTxyWHbSATFC1ErU9+Atf8g=
X-Received: by 2002:a05:6512:eaa:b0:543:e5ac:8ba9 with SMTP id
 2adb3069b0e04-5483912c478mr118346e87.6.1740095472207; Thu, 20 Feb 2025
 15:51:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220211628.1832258-1-vannapurve@google.com>
 <20250220211628.1832258-3-vannapurve@google.com> <9053a4ef-2de6-47b4-a2f7-62d3ded24cfa@intel.com>
In-Reply-To: <9053a4ef-2de6-47b4-a2f7-62d3ded24cfa@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 20 Feb 2025 15:51:00 -0800
X-Gm-Features: AWEUYZnHtnB_aHba-KEBGxrwDPSTc-BtBIYPfsyILXR2O2qhE2mk2NxqrmEtVUY
Message-ID: <CAGtprH_z=4nsDj2GSnCrhwQkKESBqLTcUK3aNZO+2BzMc7P00g@mail.gmail.com>
Subject: Re: [PATCH V5 2/4] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	jgross@suse.com, ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 3:00=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/20/25 13:16, Vishal Annapurve wrote:
> > Direct HLT instruction execution causes #VEs for TDX VMs which is route=
d
> > to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shado=
w
> > so IRQs need to remain disabled until the TDCALL to ensure that pending
> > IRQs are correctly treated as wake events.
>
> This isn't quite true. There's only one paravirt safe_halt() and it
> doesn't do HLT or STI.

pv_native_safe_halt() -> native_safe_halt() -> "sti; hlt".

>
> I think it's more true to say that "safe" halts are entered with IRQs
> disabled. They logically do the halt operation and then enable
> interrupts before returning.
>
> > So "sti;hlt" sequence needs to be replaced for TDX VMs with "TDCALL;
> > *_irq_enable()" to keep interrupts disabled during TDCALL execution.
> But this isn't new. TDX already tried to avoid "sti;hlt". It just
> screwed up the implementation.
>
> > Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
> > prevented the idle routines from using "sti;hlt". But it missed the
> > paravirt routine which can be reached like this as an example:
> >         acpi_safe_halt() =3D>
> >         raw_safe_halt()  =3D>
> >         arch_safe_halt() =3D>
> >         irq.safe_halt()  =3D>
> >         pv_native_safe_halt()
>
> This, on the other hand, *is* important.
>
> > Modify tdx_safe_halt() to implement the sequence "TDCALL;
> > raw_local_irq_enable()" and invoke tdx_halt() from idle routine which j=
ust
> > executes TDCALL without toggling interrupt state. Introduce dependency
> > on CONFIG_PARAVIRT and override paravirt halt()/safe_halt() routines fo=
r
> > TDX VMs.
>
> This changelog glosses over one of the key points: Why *MUST* TDX use
> paravirt? It further confuses the reasoning by alluding to the idea that
> "Direct HLT instruction execution ... is routed to hypervisor via TDCALL"=
.
>
> It gives background and a solution, but it's not obvious what the
> problem is or how the solution _fixes_ the problem.
>
> What must TDX now depend on PARAVIRT?
>
> Why not just route the HLT to a TDXCALL via the #VE code?
>
>

Makes sense, I will update the commit message in the next version to
clearly answer these questions and address the above comments.
