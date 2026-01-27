Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B227FD74
	for <linux-coco@lists.linux.dev>; Tue, 27 Jan 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769478286; cv=pass; b=kZN3hVuBJY0G7Guq6WeuQxqkvvbKkLtH4z8r1en8ksgGgBRbkbXDCAmuYAwGDpGuwW0aI+pI5vvTjWRoxu/ergiSGGWoM2E8fepIkRNhbV6N+D0YdH4tABHSJwlkr/J2LbQxoCh22OlZjkNpxlZ6mcEYTRpd8FBgUEObES8zBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769478286; c=relaxed/simple;
	bh=kIT+5wixmIcRm22vKd5JKkjcJAmwQNb792gk0GwMjsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldfeKvA6d4IcHKrABZqbDEKg+0mW/yVhLWRN8uM0dbLYGPrWFNAqZjwxDl3/bsUsjJ0SnrGH9lk0M5ugd5ILQ82KkoK/YWHHWg/sXipTc6kCW59X7OSSAhW0rlqkorl0NCSLgLU7q2jem1ZxMvb+K2jVMlxh/2ZfE4TMhrWwaPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MvBcDtxU; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MvBcDtxU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8863db032dso587689666b.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 17:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769478283; cv=none;
        d=google.com; s=arc-20240605;
        b=iq5LC9BUwhWCfhJBoODGysDkg4OuCuGLS2XJO9Nm5+hLBEXiaECnsO7GeW/At8oujO
         FEnDwdOpRb3ih9eSfym0M/uK7/KtnqwBt+VPX3t0mpzAOnC5MTJYT0T9rf7rjPlPdiWS
         TxBH/5BT6KJI34RdWLjrA0bGte/Gq7tXFYPd+Ig3lOUpqo66RlgMe7XUKtnV6Tt1Jra+
         9EQ9LX7zlH6V/p/oDjNKM4QfkOZy2ALGUqQvRUVtE84xarz1mYoFVG/tbSunNGD/Q99S
         dOKtLRJ2S4lxRMDwXYI9Vs0Pq8yIrEwfGwGtjfw0cajC3qgW9tz9XbbMfC8qMWi938em
         GcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kIT+5wixmIcRm22vKd5JKkjcJAmwQNb792gk0GwMjsY=;
        fh=tTOq3/7qX8LXVg0ZcouRhZJKCV+VeSVmE29RyzvtGWA=;
        b=CBPixlJ9cQPGaT9cr5yPLLOnHpMXGYH374M449eL/VXjAh4k9e7UoCgKp179zwDfPv
         m5+9tVENWNANmSERe3uZELyoIezokRrV0XGXFtOKhL/KXq67Rv5uTqULUPPM2gV2L3Eq
         0o0InVcYYYl9j7Ppa1NFAB+UOn/BAbKoJuSCFW5w1B9sm8/cIeRp7G4ngKt9OWoLC8Vr
         BBVpObbmGxNN8W4+C9ozb0kNX84yd7gQ4q1WALU+DD/gKxN9ePnmIBf2N4/s/6EbvZ58
         KEWwWsCWNZw7vrWnMMAwPZFyFzvMEdG25fJCICJVtQHqJgBRh+1rtzc3p1unVUx9y0WX
         c5nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769478283; x=1770083083; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kIT+5wixmIcRm22vKd5JKkjcJAmwQNb792gk0GwMjsY=;
        b=MvBcDtxU3CXpTp+nYF1pHzJCMZc/6+9+B9fsjHixukq4hjXYzKaUFa+P3D6fqz9ca3
         2Wk45YX+9BLT1tmai3VKe9avyIx7sTWwHwEo0vtc/EGKbiEzfqVcta5YqaYsB7yU7Zk6
         fYyiZTDt5IhpkNYKq7mCu8RPB/h0oKzMaaGAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769478283; x=1770083083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIT+5wixmIcRm22vKd5JKkjcJAmwQNb792gk0GwMjsY=;
        b=SFM5sIK90CDAJjQuIwzF0p+2zbPxUCGUmEw3Cr0RWGzKiIgZR/+N0KUU3zcWH6NOlG
         G0LRLmkM2F1/DVm/FUbcA0M0+gBr8sSWwGRwGVWe0nkqMz7ICJCKhgPR53KMpaMIS8vd
         LumpWRbF9OAkhbTyHPUqagalGbwX590kWt/ZN+YdDjtb1XXX3ZG5n6MASfgUIcE04Qym
         qdpnEh90GBEwaSDaLUg8WgRBWqwayADQMlGt3ciQF6FzrXeDTQUR+qW5bLrmdTyFcdcI
         yl6fKlrhDuB8Gbq8v9owFkgM1RxNsik3BNRdxElCwC9S0k/3Tgt3Rvvgv1N4tKvGvxNV
         lNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTjRHHthzDpdq+4Meac0xMRAvhRSrDd99lCNfsnUh/g8MLMbesbm15xduPHB6qH/+LUJYVFJByc2rY@lists.linux.dev
X-Gm-Message-State: AOJu0Yxawx3XORLPS0lwhsFS+J6LQucJXWaEpvvEoCSNmk3uXWBC8Tmi
	K/Sv693vPo5cWBM5fL3FMaqfWH2KA4GiG9mG9AneR2PXNomy/tThuApye5BE/eLied5cnwEt2C2
	JF1vSX8P58QVxuJ13CxiyA72eBzB2fs0j9g0uvibTKc6uh5IGd9KLGA==
X-Gm-Gg: AZuq6aL4LE0HVjgG1Cwt4vQLR1EOxIkZkL/ShJjPi1h6EmwogUvvD/bp7A9wGReEREd
	uKArbxBxHeozLpS1Y0uDGLZild2bxmy/QL9tVvpWgv1eM16JQKLL7/BBbPuAiQX+ke3POAhUUf8
	ZfRtP3lfNwd4sfk1hZL80IZLWY7L6+0GE3x6ZZJloZtX2TSe/H0VfSwBDQLpH1soitSVCKvdD3c
	5TIMTAJRw5nZVO0y+aok8CSPlqqO0MAp9JaoLxvsxDEoqM6cVjJg8BB6SzvjE8+MaBrRKNK
X-Received: by 2002:a17:907:7287:b0:b88:5b35:914b with SMTP id
 a640c23a62f3a-b8dab3d056bmr13999166b.59.1769478283139; Mon, 26 Jan 2026
 17:44:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
 <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
 <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com> <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com>
In-Reply-To: <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Jan 2026 14:44:43 +1300
X-Gm-Features: AZwV_Qi1U2CQ2Mp1BJFd56Wa1poDStxY5LbrrPglXbP_K0sU6fNMOPVaZzZydIM
Message-ID: <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org, kees@kernel.org, 
	linux-coco@lists.linux.dev, mingo@redhat.com, nathan@kernel.org, 
	peterz@infradead.org, pmladek@suse.com, rick.p.edgecombe@intel.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Tue, 27 Jan 2026 at 11:21, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 2026-01-26 13:19, Simon Glass wrote:
> >>
> >> Including the EFI stub doesn't mean using EFI to boot is required.
> >
> > Yes, understood, but it adds bloat. More importantly it will lead to
> > people assuming that the stub is always used and thus unwittingly blur
> > the boundary between the stub and the kernel itself.
> >
> > What is the actual need for this?
> >
>
> I would argue that the opposite is more likely: someone inadvertently builds a
> kernel without the stub, the bootloader goes down a legacy support path and
> things seems to work... except for some platform subtleties.
>
> The bloat is there, but it is small and is only in the on-disk kernel image;
> it is zero at runtime.
>
> As such, I don't think this option is a particularly good idea anymore. If
> necessary, it could be hidden behind an EXPERT option, but I first wanted to
> see who if anyone actually cares in a meaningful way to maintain this option.
> Every option, after all, adds maintenance burden.
>
> Note that the BIOS stub is unconditionally compiled and included, and that has
> not been an issue.

What is the maintenance burden here? I could potentially take that on,
but I would first want to understand what is involved.

The use of the word 'legacy' worries me too. Is this patch a step
towards removing the non-EFI path?

Regards,
Simon
