Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202A28000F
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011455; cv=pass; b=T8LcGYincCpGleln2gUcWyxcE9PnKEvyjsZ1pwff3m2hZYIVrnDo7jbsRwP/RHl4hpX6/cTw+RvnfDmPlLv/H4udkdGITUN8MfoXrqtV/Bsj+ty+44SBClF+Kywr3Fsk9Fhzzr1ArJPAq4bIS/SZzNq1Yds6ole3tt6q8UdKLzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011455; c=relaxed/simple;
	bh=iLxHiR8MPtOb1yPejw0rq563JxGKDja5t9Vl8qZuSM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HE+fiZLhJUZ9NQ4LEJmdeG1mOWZ5XZ7TfrwqsiwZVavDaEHDpRQOg4/BhB4i7Vzzm6l6jkckmRhHRQ040UTJTlTgHhPdAv0g9tRVqitY0ZKMGRH0hlEuMU9U/7DSPcA1K2jXUmYbjFuBV9ZHyq/lyJ6ak209Z0z+YgSv4CLO2ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj3+jc9a; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj3+jc9a"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso772276e87.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 08:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769011450; cv=none;
        d=google.com; s=arc-20240605;
        b=O87f+BGk/Afck76aCBsdkzrX/0+Qj0+/tD7OHqhuD7Nh4k31a/33mjS9dvnDWQgs05
         BTGEwthUlRLJeY8k09xioHGaVlIXKrvFkU7CJaO2QPEW4fGFp17fy8fs7HoGAPGW/sv+
         WG4IcG302c/ElkVnntpugp5MfcCvdpcd4xa59gmUGZdcORFUKlxKwB4J4UAAY70egK+8
         jHPnUSZb38dZ5R/Ss7DL1BwDc4Lr1UyI1gnIVRXHZ+056H7IET32HsXENYSiXxc4l61b
         AWVkC22Kkg8FAhIxqqhie0SiZRnA2WlooAYdk1AvuYbXRhZYxU6qVznXa9PKod/OtenD
         D7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9zPJLyCTD4n7afqiX9aOIhe2mvl0FtEfrGSfnwCo5Uw=;
        fh=KQA+Nk7Ik/ZCx93+hg+SQ7Kb4Z2oJkDlgyKz9sT/+i8=;
        b=CO8Yotuj1aiD0WuCcxEr9Swvq02rY8aLKLoZLEsFALTGU8c2urLp28E9fBzJ1f9ZqL
         MHw8xhWX7hsMT2yqfm5Kopxn7UbnQFvuum9tHMA2wC1cK/0uYz2sl37n8v0UGOVIziM6
         OhMcKQDXyW4GSxwAIBXw7hjK7KZgx8bAJPbQAt/1B9WjoEnIp3HyKbb/aTw2XozZXDjD
         kcVXNi9j/qYYgWsZL/+hx5dLeXMLxjUHz5GSuBMHnYP7V0thK5bKgFiZ3Be3hw51lqOg
         qlkZcAeapaIA4w13itEtRbgvP7YXprhb30T+42SU9tFTf93PmzilMgmGvtDQxqH4pkK9
         V/Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769011450; x=1769616250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zPJLyCTD4n7afqiX9aOIhe2mvl0FtEfrGSfnwCo5Uw=;
        b=Bj3+jc9azmVZhg9a/scXkEOsqMNTnCdliDY8nKnBxCrv6vms6bY3Byr2V/PWzxj5S8
         dWioPnzoRteXjqTbJEkQ4LDOVZNjGX7famth4UcxUdJ8VsjUXm1lsyibCkyPAd3VAjIg
         T7STF4nD6FGAxNkZ0hha/neY7aePiS1T4sYRYoYE2laU+XOlXuAy9nHN34ImM5dBfvul
         oyFcaI2OXgqzG5sfKq22Ch+uCk3qGerGOA+EZSWIdTcirmbcy7rwL0NJpMr9tGrpOgo+
         G4Y4rCrNNdt6z7mAZ6xHcRHuwPs5zt0DGydDK5bCtBJeBxji+mHL/Me4vBYyHos0RH6j
         2FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011450; x=1769616250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zPJLyCTD4n7afqiX9aOIhe2mvl0FtEfrGSfnwCo5Uw=;
        b=k2jY5EzI/qjpmhH/pQVqRHOziKiCSUibSweGOPQeO/1jIXg0z/sWbB0UG0O0L+K5jp
         tFOwC/voHAlGW6Xr5O/ffEjD0LyKfO0FMIhW03xQbWWUE0bZ+DWZSs98wZaDjiw2gIgv
         thNylZscqEFH0LoHlg+rkBZhM/AspK9QUzlrzntdmAwre2221zUim0y+E1vFDjUeKi1h
         x+nBR5D4uLN8+zRfzc1HQ+vQZHCtissZLshU6dPXdsI6Ue0xWwSWZChhn6+Zcd3hIajn
         r8OuN6yrrtk57lcw9oOzVPmTfyYDmx/YvZYUxar6wB+2MRmMlX67kahZn0fx3mSASdsf
         treg==
X-Forwarded-Encrypted: i=1; AJvYcCVmuaywEqIJJSkS022D+uqgJxQbQXxNokGwevvDDzNi2GQyboDIgodrOOlfMWCWlHWWIWA1Hdx3pS3N@lists.linux.dev
X-Gm-Message-State: AOJu0YywxMAvE8NkJl4ln5a9QM3sHpEToQFDI8Mu3Iasfv6iWQp7RJQP
	lMnzj/anTotvLSkyjFIG5PQa6eK7Dy/iWrPnXovp5hlmP+iGoA3530DHrYfObO74E+CTYKC94WJ
	TBbWHN7TIX13531D/rJcjBI8dxEJaM4A=
X-Gm-Gg: AZuq6aJkb5vqfwzsRNJIQ0NjoF25+l5Fi/etWpK8yUEUUAyR745grv9FakY26RT1KWq
	vdBGAuV0zYnenj/js2Na85rDH2km2CGa6NFgXm7QAO2yIF9cZBVv/WngPhwEjhikawVQcd+wF5K
	vJ8OzT3+s2cgM7q/2BlIG0qGqciNaXYh+VWBMoPiAYv8/wI5xsX8RcBvjrZa4kr/K7KRuQ7x8Ig
	aOvnHujiveZvCHb696FkxtfscwK8QrYf+xnqkrqHLkNWAZQ53yZX1e/MTtxMp7k9f0x5gq1Ta2/
	BpIpjwUsDNtsNgoeuxti4aaoIvYfkZzsJ1tJrw==
X-Received: by 2002:a05:6512:3c9e:b0:59b:b3dd:4618 with SMTP id
 2adb3069b0e04-59bb3dd4698mr5603516e87.10.1769011449756; Wed, 21 Jan 2026
 08:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-12-hpa@zytor.com> <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
 <4E5A81C0-1938-4FB0-A0ED-2CCF03B9C480@zytor.com>
In-Reply-To: <4E5A81C0-1938-4FB0-A0ED-2CCF03B9C480@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 17:03:56 +0100
X-Gm-Features: AZwV_QiCut0yE1-lgSJtG6xGD53bu1VEaJoM7_9UA5E1HbBhsAV80Q_M4BXA5Nw
Message-ID: <CAFULd4ay9rcjx_5V5E+f7wCcUQpei85iOwwLrwgYgCmbFiaXWw@mail.gmail.com>
Subject: Re: [PATCH v1 11/14] x86/boot: use __seg_fs and __seg_gs in the
 real-mode boot code
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 4:14=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:

> >My proposal is to use a volatile pointer to an absolute address, so
> >the unwanted optimizations are suppressed. The generated code is the
> >same as with barrier(), but now the code tells the compiler that every
> >read and write to this address must happen exactly as written in the
> >source code. Before your patch, the accessors were defined with
> >volatile asm, and this is the place where volatile qualifier matters.
> >So, my proposed code would read:
> >
> >#define A20_TEST_ADDR    (4*0x80)
> >
> >#define A20_TEST_GS (*(volatile __seg_gs u32 *)A20_TEST_ADDR)
> >#define A20_TEST_FS (*(volatile __seg_fs u32 *)(A20_TEST_ADDR+0x10))
> >
> >static int a20_test(int loops)
> >{
> >    int saved, ctr;
> >
> >    set_fs(0xffff);
> >
> >    saved =3D ctr =3D A20_TEST_GS;
> >
> >    do {
> >        A20_TEST_GS =3D ++ctr;
> >        io_delay();    /* Make constant delay */
> >        if (A20_TEST_FS !=3D ctr)
> >            break;
> >    } while (--loops);
> >
> >    A20_TEST_GS =3D saved;
> >    return loops;
> >}
> >
> >BR,
> >Uros.
> >
>
> I disagree with that being the preferred solution, and it isn't really th=
e Linux style.
>
> Not only does it require making more changes to the macros, but the barri=
er() construct is well established in Linux as the way to indicate that a m=
emory variable is subject to examination and/or modification by another sys=
tem agent, while still being a memory variable.
>
> It also generally produces better code.
>
> So no, your analysis is, in my opinion, incorrect in light of the way the=
 Linux memory model is already used.

Thanks for explaining to me the Linux way! If this is the case, I will
withdraw my proposed solution.

Best regards,
Uros.
