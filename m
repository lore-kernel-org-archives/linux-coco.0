Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC147D941
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990071; cv=pass; b=WebLwso/u283VDvaJHqwZN8bdcdEN7ZMFZ44RyA41iAHJXJUneOaLoTdjjaZaYT0FrLx8yqzG3+i1AEMqCHyCWZUql74KnfsUh4eYVPe9I2Xx0mp5bcVxxNF/m8bwL8f9xBtpbXm7fHyybMSAcF/QTEOtnUZ7B8RayLR39sXSpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990071; c=relaxed/simple;
	bh=5AUtU658vyVtNPsjPUYpP3a7ezjRsbPOhNS0IJ/08c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKFUZow+g3+ms78ykFHVyvXZPeL+skkcyRBNBxI50gBaXx/OXKkDQvuMZ3w5akjAHj64hLacIV1Balqew4AdhT2PFabrz+hxeWzPBKXiG0HGTkJfh4kriwwYmnut+pTzUUiULKffKTn9YS8XZG1iiDXfjcXhkTtjNq9bZ6wQUHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hL6Knaxp; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL6Knaxp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b7be7496dso6629574e87.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990068; cv=none;
        d=google.com; s=arc-20240605;
        b=W+69qmA/C+MsiO3u7zJAYuVo2/eVw1QSDqn+xKVPAkLLrneK+AV0beWV43YdtJj2Jn
         EN/yKM5eNVEeAnLUyteQ4BLPe5BsZJ2FhBJn+a9L8ejUqrXMYlo5Ty5cTaBOzN6vQLxG
         Kx4kjiSNiOxKN0fma2pkpRyk3xrYlRyh/5emEl/4QMUj6Hr8CKW+ERGThv0nk5HuCGs/
         g6kTXyTRFIeAQP19pPUGA/9V+TDsHFlSqlOpCoYmOgingt3lXn581k8xH1p8GTmAo7dY
         0FazgPGiBPxftolKqhbycSNHfAwBMpFmOTmLyLuOfKPAdgT4OKWIkHSFO4WQXApFjKYw
         6AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hiRLmK6Q990yX//nYe/Uh/BNxOq3hEk2Y/UxOdbwpDw=;
        fh=lDFPIav6HoRCH2ZZ+9b2BIU4srOaBFGW0fP+NhO6Hpg=;
        b=D7Irz3pwtuttBzTPTz8OfyTta3AVh5t18WqMiWN19EH8uGAlDD2WftbegRipgea5Vm
         JMqyQGh6sf0Nrhnjhgypt/SQnlXB2Vs+f191uXvyTQi4IxbWFDZetFKL29Y2CQ2pfrG2
         a1zcAzDLTXf1GHblXxrzN/JMs0ZzbVZBMcHm7JJjDHqmLQcOhMvNHLeSRMvEbtNyQZTX
         krJmR4mpf2AkEr9DX8OA9qjzvDXNGysyOhHOibBNrYhljfZA9y0cpyMRBxJXwq1gpB4c
         ecjy6qNQhc9Xz+IOgpPnPrGEbMj5WEcpnCFHS3zRikiP9dE0xPIj6YWNftPNDA2swvBf
         ZL6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768990068; x=1769594868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiRLmK6Q990yX//nYe/Uh/BNxOq3hEk2Y/UxOdbwpDw=;
        b=hL6KnaxpPTTBnYGNfld/HBQrpld9eg1f+F9NVTfCfqr+ICUV7x7cNN2GYBJieh5SEh
         avwPi/7RVUiIxiSRrmHL6dB6RhxgXrGUwxxMrylOhJl3wMBRHX+18z2ZDip8yJntiwHP
         nLvNiAYXLSTsiCtrBjG9OQCndz/qr3B/N+CLr/Dwqp3PIhowEhyEFpnxuVjJ/RktJia0
         3YqSOKrQMVr65Em0RjizMy/dKHzWZcF6HoxmbSzEaoEMsk0WqvEcfBwAdzGmIdmXSK+W
         GkIf4yWGjyv92joUDkDmxpWcN6IN8CIdSD96ykVhIwlYRqcab8EVnqypVjbI75k4QFD1
         0XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990068; x=1769594868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiRLmK6Q990yX//nYe/Uh/BNxOq3hEk2Y/UxOdbwpDw=;
        b=mAN++PQC5CNc4T7ruTNiBXhUpXtffQExupiKtKHg2tIJmMqXbvxVFaiiTw4TLTrI0g
         1JStwIYdW60xRRcTxVZZjGUzPhobaASqVkj29wNthvbcA+Ljf4nc0Pot6Np0U7hr87p2
         wQ+xBXdyF7oSoyqxYaueaLCLWqUa4nrW7SbIb7eSL7kc+TDB8qoooSycuydr4D/XBRy1
         JTNB6IlpIl6zVz2PdZdkNmyymGOVdEwZUiX1X7CCH6KiSuPhkmLxNTmtGLxOaJJIbDw2
         pLPQ4wvthr5Cq2H9iDAm+yLvZqKwLq/+njyEbOc42KNKENxOnSIke8vX0eqBBFL7RL4m
         SXFg==
X-Forwarded-Encrypted: i=1; AJvYcCUJZVPQHC+hbNNexwxBtyBO2l6IjQwdt9Yy4bxbB6bBUVcdh/q5wmD/P1EEmdsXsAnXwp9k1OfeD6au@lists.linux.dev
X-Gm-Message-State: AOJu0YyWM1JdrF4GDcInqXs39lWEC+reywu+ftaf+LHYCUC7uFW4Llcd
	z3+P5htKkaMH2ENMNHknouzORRHj3/rlhfE9B/pXJSJhDntAkRzHPXHRng76yP67qvIXkAkzhG5
	TEDxBSqn7t0Q2PoL7QMN4uMUahsuUUko=
X-Gm-Gg: AZuq6aKTmwtcPIArf2UF3UIk7aVnFGfJXiuPIFIlMvfmfkWs0zPdLVvSdjp9nh8M6R0
	Dq7oPvthO6EZwdP/IgJaTu4ZbCEIE59iKHyBclzs1drwxkWVxjSZZoVGx9lC5qctHWNT8IaQXIf
	9Ycy1qyCLVGjIKG4hMFfesNEtAOQK2VKdv5AfaaZHmiD7/7sCGUkoPxyKS8a8xwi4fHdylhSgDX
	HPegz3sFIKAC28FZS7CQIXm9cIkF1gBypCKxLsyLIU9lw8bUiY3p+bRhceRuGESekaUm4LuXNaP
	Pdy+CUKr10DulaEGZccxMIz5SXdsEGk26TSynA==
X-Received: by 2002:a05:6512:b12:b0:59d:ce99:762f with SMTP id
 2adb3069b0e04-59dce9977c2mr793459e87.26.1768990067773; Wed, 21 Jan 2026
 02:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-6-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-6-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:07:36 +0100
X-Gm-Features: AZwV_QhSeYa8isMlYO0rjKBAefVAEz9KNQmUZpK2k2QYX91mk8oD4xJF9aDrpYo
Message-ID: <CAFULd4Ynf7SqhidfDurgW5LcQ3jTNgGEVexmdGMpkznjd84CUg@mail.gmail.com>
Subject: Re: [PATCH v1 05/14] x86/boot: call puts() from within die()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> Every call to die() has a call to puts() in front of it, which adds
> unnecessary code bloat. Move the puts() into die() which, being a
> noreturn function, is terminal and allows the compiler to not generate
> unnecessary code around it.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/boot.h   | 2 +-
>  arch/x86/boot/header.S | 5 +++--
>  arch/x86/boot/main.c   | 6 ++----
>  arch/x86/boot/pm.c     | 6 ++----
>  4 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index 1f2b7252e387..b4eb8405ba55 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -280,7 +280,7 @@ void console_init(void);
>  void query_edd(void);
>
>  /* header.S */
> -void __noreturn die(void);
> +void __noreturn die(const char *msg);
>
>  /* memory.c */
>  void detect_memory(void);
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index 85a21d576f5b..5a54d33e51c2 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -611,14 +611,15 @@ SETUP_SIGNATURE =3D 0x5a5aaa55
>  # Setup corrupt somehow...
>  setup_bad:
>         movl    $setup_corrupt, %eax
> -       calll   puts
>         # Fall through...
>
>         .globl  die
>         .type   die, @function
>  die:
> +       calll   puts
> +1:
>         hlt
> -       jmp     die
> +       jmp     1b
>
>         .size   die, .-die
>
> diff --git a/arch/x86/boot/main.c b/arch/x86/boot/main.c
> index da01ade4959e..ad8869aad6db 100644
> --- a/arch/x86/boot/main.c
> +++ b/arch/x86/boot/main.c
> @@ -143,10 +143,8 @@ void main(void)
>         init_heap();
>
>         /* Make sure we have all the proper CPU support */
> -       if (validate_cpu()) {
> -               puts("Unable to boot - please use a kernel appropriate fo=
r your CPU.\n");
> -               die();
> -       }
> +       if (validate_cpu())
> +               die("Unable to boot - please use a kernel appropriate for=
 your CPU.\n");
>
>         /* Tell the BIOS what CPU mode we intend to run in */
>         set_bios_mode();
> diff --git a/arch/x86/boot/pm.c b/arch/x86/boot/pm.c
> index 5941f930f6c5..3be89ba4b1b3 100644
> --- a/arch/x86/boot/pm.c
> +++ b/arch/x86/boot/pm.c
> @@ -106,10 +106,8 @@ void go_to_protected_mode(void)
>         realmode_switch_hook();
>
>         /* Enable the A20 gate */
> -       if (enable_a20()) {
> -               puts("A20 gate not responding, unable to boot...\n");
> -               die();
> -       }
> +       if (enable_a20())
> +               die("A20 gate not responding, unable to boot...\n");
>
>         /* Reset coprocessor (IGNNE#) */
>         reset_coprocessor();
> --
> 2.52.0
>
