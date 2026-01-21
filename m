Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43CF3D3486
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990249; cv=pass; b=R+Wr0wlEfSfS/un5PdsqW72zuKYFMlqMI/OkBPOgS3DKAaIqxXGuJhCW2sxnzSgqc/BVjsDDckW9QXZJxP2ADMQXSSrJL4seLJ9PgiQB2Icd4hDuNg9eGcS5oEKcqd8Wz9UpLD6p7lbQpru/iGEK+lDkmRKzMDXKJgZt4kzzwUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990249; c=relaxed/simple;
	bh=UdIsy29VXZ1BOjfwxyDPtizMIY76gRC5mLCukWbkCQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRQjbWbxXEHBLAxD+SZuiGLdj9qR523xCLRoQXTBVActRw4357sQCxCoQ0ZPT+H/SI/Ar9IMO0VU7G7tzmcA4SJcwqB1XdERF4Jqo8u5hXiI3kldDWLE6QiuvsSJE6d0G4nwfCQKeL8MI+tuz6kRKUYvLQROAcWHpXZLKN0Nv1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ryak9Ut3; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ryak9Ut3"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382fceabddfso57194391fa.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990246; cv=none;
        d=google.com; s=arc-20240605;
        b=O+Cygs0tf1112HWr+KzpZG0zdSlOy1ey67W8wu6qm+4dg4cqwveJecebo1gPnwXuVG
         lMH5PHWMAs4OeJycWRDHv3S7fn2gSR3OnQKPRyhmDOz60aL783UkP+6vzskJMTjXwmN3
         6m2e/y2NkI4hyOewlk1XylSy8ngnp8RivCC2YSSFkEgsdhErcKJ7tjbQ2AFcqViSJq6T
         GaUAMtDI72Nzt8lqpnAhnili4jAWnGs5yzlZlQu2lVKME9adRnN2zc3QzS2w6c6NqvLP
         jf9+dxTRlWdKLmo1P5RGKxsmQcYuCjOnrgvGf33vD8Hc5EKqgag8OcyFMaIjKH7EOtE7
         9qrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYjO4Ngj7E372AJNbyrOUvLXaZbFQuMGG5xABeFY7VA=;
        fh=gyQqsAio76mzOxii7WTwY7iTz9j1Nepqput5SPIWJ8A=;
        b=MLPRJF9tTxvVuWsu8elX+/gJKUa9WUBXbWd9VdCe/SLXlNxgPCuTquREX9biNQaRlG
         HzRyio4pxAyEPlxhmRbef+bd5PTFcF5Ba1/or4ACz8GPr8Xgx37BLOwcw6vPM7goN64r
         UAWZy58RHNRSst4u3aa3hg77enrBc4R1c7cS0o8+QlK+RPR3hGzCphV1dqjyUAsjr9L+
         zOdx3QxkiDJE2ajgFNhXQPaN5FAYEpyCYzItpDU+q8tEKGD92hpU8OeC+/9cEpjrK9pY
         y875QO3OwcDen9bkJqb9pwHYE29+kZ/v0vdKantEYQpzx3P1E77tfnEk1yue2c02gjMR
         /guw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768990246; x=1769595046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYjO4Ngj7E372AJNbyrOUvLXaZbFQuMGG5xABeFY7VA=;
        b=Ryak9Ut3xWCydQ/0OpacN2TwZxRN3PyElJ71iTDvuzv0NoVWiSk1LCgcdDyuIH5cZH
         cSYDSo1isoM+UZQbjDoRdnbhlbx4hFM9HzNBEIG8cdXKC6WKEFE/+mJXs/TSh0wfdBu6
         H/Em8bRwgZhZLdyBCjs0XIehLyuESeXQvHTMQERYQdtWVE6YGH+fdVyC3WlVkpEygrPf
         4iK/x+AVcb5+MVGut+mgweEq6BW/sCjtLc8bm02cW7O7ACRcUPG2q/mFG8cSrWUU1UZ1
         u1QkpwleMFv/NJbVIBLssALsm6n97QSEPc8043LhVGHIkQTQeNG9zvSplKZAenYtbJ7a
         FbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990246; x=1769595046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYjO4Ngj7E372AJNbyrOUvLXaZbFQuMGG5xABeFY7VA=;
        b=GIx+AFb+6r9de7wtHqpLY38L0gJGoR1d+BIXNpKsGW+jxp2IQ6xgTTr4XWI8c9MUy2
         V6UeK5r7xbFVjxO6kW6TMTouzL+VqE70F7g5mVICkBWSonKkTKWYrk2rDA8LXhu3tUqh
         a3pESjAoIM9HP6bW9U6cThitmADWBUqM9JlwA1dONyBK7iwKKTZJzwUWnjjMv7IBAbsU
         hvbY9fR3ptnz9JoHeE4UgSFtSvs1pyeWpyVqjqqZPLAIdfQCN0rIBhluJ0AoeE3yLfW1
         1E9szFGsTnaEtc0H+ZLNvFBuV0riYv3Ee21XaFTh82DTP6dhK9/kfaqvHWonrxxxqhJD
         cBvw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QCBvU2FcjAjsK72jXF1d84FDFIQo2i8RyoWSQTMTsab2FficR0BzwfVQlnGreqFgmHUFSdKuqk84@lists.linux.dev
X-Gm-Message-State: AOJu0YxymE4KJjlUluWl/dT5W2NvFGttZSJ1z06HTGBrHNGu/u+06U+e
	EPfom19tIdZTo1RfryoH3lZdvq1YC90T4nKPQPCUn2P+y8gPOWzFpivwXhz2Lcwh08Naz032Aj6
	Iu3XBtRZF24gz3jGM8vsnaLNTxy+sHrg=
X-Gm-Gg: AZuq6aKIlvUgzvPCouBBPDeXgA+YgwAmekEc04msf9jABPGkm0qhyJEs2H0tcs0ECnL
	+HNp7Y8Zp+OJnLWXurykNSakh127hpT3sNb7wHZ0CrkY76Wjyf2qV8EPyE8bMWgFpySiSjXv5Vc
	cSFG+9pBx8xIIeFxe71eHvmH1yjRbvuVUrJhCc1od7GBRNnr/F/ZXSseL7U1fZ7I3w9la94gmxf
	d6+s12falv7amApLPxDQizWDrVKHY3Jg45yWRUIhHRWIyiQAaDoJXeMIZgO8afTsXiVBxVzTN8V
	Jx5bDkgLdGcbO4ENoKZShc9p/kyyxbs3faTmaw==
X-Received: by 2002:a05:651c:2107:b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-385a54a1ee8mr20931531fa.33.1768990245531; Wed, 21 Jan 2026
 02:10:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-13-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-13-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:10:34 +0100
X-Gm-Features: AZwV_Qh6_9CUfGrzLWmqcpFPSUPj81HTXc9K7ptM-vCIbOHebs7cK7-l1LKPkvU
Message-ID: <CAFULd4Z+fhbqMmA_OcmuC3qs98iihAyGN3-ktikbpGAt6xWAAA@mail.gmail.com>
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code generation
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
> Do some minor tweaks to arch/x86/boot/a20.c for better code
> generation, made possible by the __seg_fs/__seg_gs changes.
>
> Move the die() call to a20.c itself; there is no reason to push an
> error code upwards just to die() there.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Acked-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/a20.c  | 24 +++++++++++-------------
>  arch/x86/boot/boot.h |  2 +-
>  arch/x86/boot/pm.c   |  3 +--
>  3 files changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> index 52c3fccdcb70..38a1cad8a553 100644
> --- a/arch/x86/boot/a20.c
> +++ b/arch/x86/boot/a20.c
> @@ -53,24 +53,22 @@ static int empty_8042(void)
>
>  static int a20_test(int loops)
>  {
> -       int ok =3D 0;
>         int saved, ctr;
>
>         set_fs(0xffff);
>
>         saved =3D ctr =3D rdgs32(A20_TEST_ADDR);
>
> -       while (loops--) {
> +       do {
>                 wrgs32(++ctr, A20_TEST_ADDR);
>                 io_delay();     /* Serialize and make delay constant */
>                 barrier();      /* Compiler won't know about fs/gs overla=
p */
> -               ok =3D rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
> -               if (ok)
> +               if (rdfs32(A20_TEST_ADDR+0x10) !=3D ctr)
>                         break;
> -       }
> +       } while (--loops);
>
>         wrgs32(saved, A20_TEST_ADDR);
> -       return ok;
> +       return loops;
>  }
>
>  /* Quick test to see if A20 is already enabled */
> @@ -125,7 +123,7 @@ static void enable_a20_fast(void)
>
>  #define A20_ENABLE_LOOPS 255   /* Number of times to try */
>
> -int enable_a20(void)
> +void enable_a20(void)
>  {
>         int loops =3D A20_ENABLE_LOOPS;
>         int kbc_err;
> @@ -134,30 +132,30 @@ int enable_a20(void)
>                /* First, check to see if A20 is already enabled
>                   (legacy free, etc.) */
>                if (a20_test_short())
> -                      return 0;
> +                      return;
>
>                /* Next, try the BIOS (INT 0x15, AX=3D0x2401) */
>                enable_a20_bios();
>                if (a20_test_short())
> -                      return 0;
> +                      return;
>
>                /* Try enabling A20 through the keyboard controller */
>                kbc_err =3D empty_8042();
>
>                if (a20_test_short())
> -                      return 0; /* BIOS worked, but with delayed reactio=
n */
> +                      return; /* BIOS worked, but with delayed reaction =
*/
>
>                if (!kbc_err) {
>                        enable_a20_kbc();
>                        if (a20_test_long())
> -                              return 0;
> +                             return;
>                }
>
>                /* Finally, try enabling the "fast A20 gate" */
>                enable_a20_fast();
>                if (a20_test_long())
> -                      return 0;
> +                      return;
>         }
>
> -       return -1;
> +       die("A20 gate not responding, unable to boot...\n");
>  }
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index 4d3549ed7987..584c89d0738b 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -167,7 +167,7 @@ void copy_to_fs(addr_t dst, void *src, size_t len);
>  void *copy_from_fs(void *dst, addr_t src, size_t len);
>
>  /* a20.c */
> -int enable_a20(void);
> +void enable_a20(void);
>
>  /* apm.c */
>  int query_apm_bios(void);
> diff --git a/arch/x86/boot/pm.c b/arch/x86/boot/pm.c
> index 3be89ba4b1b3..e39689ed65ea 100644
> --- a/arch/x86/boot/pm.c
> +++ b/arch/x86/boot/pm.c
> @@ -106,8 +106,7 @@ void go_to_protected_mode(void)
>         realmode_switch_hook();
>
>         /* Enable the A20 gate */
> -       if (enable_a20())
> -               die("A20 gate not responding, unable to boot...\n");
> +       enable_a20();
>
>         /* Reset coprocessor (IGNNE#) */
>         reset_coprocessor();
> --
> 2.52.0
>
