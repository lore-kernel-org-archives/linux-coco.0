Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1A8063A
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529782; cv=none; b=K+P8ctS/u/WWCsxlNpsfQ8Uy3hv8RZfq8PsDTN+QG3UNYX07ClqaL0CTuY+a4HafCXqgEirTJMdYgkn2FKrCyFUD1tgfi2OG0T6zb285PeNqMzjUMSeb6t7hJLnW5yfvHwzpusguAeWEzl/lvPmb08XT49vMPOjIoxdY4kLmxLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529782; c=relaxed/simple;
	bh=jz7bQ0RRoK61Cw9zhVIJUimC34X5/mo8M/CW0Rqtf2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sE7j8q5DAkwubBgWp60IjI3HLPeiVvlP/4k1e1rldgkC1HTLXAD340B0q9TXdtGjpECZnYUg0D+Z4VK29jz1ROputhJw4mEsul5qD/ith9GCPmAsYhP+9m2sPu5lOKMqrFBxjeYdlGvPRNQkIyZQH3hUNUUBjehHq98r2TOZ/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Zx1Zs1O5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Zx1Zs1O5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B9C43399
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 15:36:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Zx1Zs1O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1708529778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz7bQ0RRoK61Cw9zhVIJUimC34X5/mo8M/CW0Rqtf2w=;
	b=Zx1Zs1O5ujVUoTHOMHyBIbnhk27rbBywt9qN1CgWqcKFNh/IPkZHd87jgE1xvlWnSLebcp
	FD+V4dE/VFRoRia5T2w0J0Tw8d/+vMrc+guB7CLS+wPMyC05Ilmc4ak8zr04RpBKOmdz6Q
	5zWraoy8GhIea1F98pqQ+mS1gGezijo=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8673497c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 21 Feb 2024 15:36:17 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60853ad17f9so30621847b3.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 07:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXXzpMWyJ7kB5pYnS4IdXHdcNKcGMGcqKsPjXVs0MdkMgWcHLDySbgQKlP2q4OQXMm3Cn0gs3Z0ha7ejmAK/rAw0PuHu6ndVxyoQ==
X-Gm-Message-State: AOJu0Ywn4k0NtVl1YA41L6ATQXgShODUQgMrJBHYNNOw/MMesmqgfqGe
	bzxdAs8Vm/5yuPYM6K3HTUJOML9CgLd6TGTWamGpZoZI3vz5EsK/aQ2KP/9b/nIUtYedt01Gk1i
	+0Y28VSM/w1lceFVKQnE0OD5NcCc=
X-Google-Smtp-Source: AGHT+IEsVdtIcMbXk+wPT6SZPtutgQaNIU1JGngGnegEtXVIhAaP2QEbpBeZUGbXZ8l2NwEPOjdcpbSY0/xQ3aAXUNY=
X-Received: by 2002:a81:df02:0:b0:608:8d57:368c with SMTP id
 c2-20020a81df02000000b006088d57368cmr840841ywn.49.1708529775977; Wed, 21 Feb
 2024 07:36:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240221123248.25570-1-Jason@zx2c4.com>
In-Reply-To: <20240221123248.25570-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Feb 2024 16:36:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9r-W5UEok=EsD56grZ_Fy_nJ4u2sUp1CHw0A0F6=CCjmQ@mail.gmail.com>
Message-ID: <CAHmME9r-W5UEok=EsD56grZ_Fy_nJ4u2sUp1CHw0A0F6=CCjmQ@mail.gmail.com>
Subject: Re: [PATCH v3] x86/coco: Require seeding RNG with RDRAND on CoCo systems
To: x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 1:33=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> There are few uses of CoCo that don't rely on working cryptography and
> hence a working RNG. Unfortunately, the CoCo threat model means that the
> VM host cannot be trusted and may actively work against guests to
> extract secrets or manipulate computation. Since a malicious host can
> modify or observe nearly all inputs to guests, the only remaining source
> of entropy for CoCo guests is RDRAND.
>
> If RDRAND is broken -- due to CPU hardware fault -- the RNG as a whole
> is meant to gracefully continue on gathering entropy from other sources,
> but since there aren't other sources on CoCo, this is catastrophic.
> This is mostly a concern at boot time when initially seeding the RNG, as
> after that the consequences of a broken RDRAND are much more
> theoretical.
>
> So, try at boot to seed the RNG using 256 bits of RDRAND output. If this
> fails, panic(). This will also trigger if the system is booted without
> RDRAND, as RDRAND is essential for a safe CoCo boot.
>
> This patch is deliberately written to be "just a CoCo x86 driver
> feature" and not part of the RNG itself. Many device drivers and
> platforms have some desire to contribute something to the RNG, and
> add_device_randomness() is specifically meant for this purpose. Any
> driver can call this with seed data of any quality, or even garbage
> quality, and it can only possibly make the quality of the RNG better or
> have no effect, but can never make it worse. Rather than trying to
> build something into the core of the RNG, this patch interprets the
> particular CoCo issue as just a CoCo issue, and therefore separates this
> all out into driver (well, arch/platform) code.
>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Also,

Cc: stable@vger.kernel.org

At least, I think that's probably what we want, though I don't know
what version range is relevant for CoCo.
