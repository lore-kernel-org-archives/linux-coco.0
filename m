Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E347DFA9
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989843; cv=pass; b=bxcLOj4pdA7bqwusZpFqGT2uylwqTPEayspKaekhZGGw1ladCbMdsfIRh44YXNI/rj54WT3GCjr64fBpbnM8uhrbiJgolqFzPfIRIvi5PE8UP5AzQ4/j1fLq9LKs2a+pteCm9j80U3ieVPpGtVHMiOiZjzhzWXj5rEdr5DDZrtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989843; c=relaxed/simple;
	bh=YYExVy6YkadGUGd0FgrZ0uReafCGVxnavblrknFCTRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLkBEnTaAIBWpfUJUCzL9E5QzRLGxG5qo9g5vDzvCK1H3uXI+RiTM+9gYhB5MkZcjdYij4NJc576DpAAJPIxfKVhmzAcSuAw2Yz/2Je2OnlNPybA7IwHI3e6HETY6gTqTjGwXRQwBzhkcoVuJyCwhiTJR8puWBqiK7v7pDFxno8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by65pbfl; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by65pbfl"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dd263bfd3so394778e87.2
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768989840; cv=none;
        d=google.com; s=arc-20240605;
        b=hGj51HzaqoovlEyAZOJdJK/N2hV/As8Udqg8PnAxfyDOz8DBZ6Ggb+TZ0w227Pczmh
         Fm+yb5z1Y39jfNlZ1dF06RvxGSYFLny0pp4SWRa5VDIdwuAKMIw1EFnt6flKrR7Nc/PH
         QeTVIphNdgQZzGb9Wmvv+bndCuePmD6l72pGgiI/39PthQDeWs4P8bMbkAE0K7kCS8wC
         cp4znb33bRViDoIeewlGJuu/nLfbXGg5VABkpwfMVqhc2ivjVCIiSEETI/jKHGveuam4
         WcE+XcSsGa50o/fczN/yKVcLQ5JQgTvlEQptp29nxggrkVrtjawZz+zyzZj8bab/Gx3D
         SulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAWxpn1lfa3jIQMSgrdFcRFkbEKSjzcUYPwpRGge2ow=;
        fh=VUVtDlpSZ7iD0XPGkyU37h4fhCrSFwvAlNF9RZ9ALWs=;
        b=XuGlPfeTjmH61iJgCbXkn8lwyFE3jH/P9gL+WWczehszSxUSKiXu2LgoiQP5ER8pT7
         lO6Yc1UAfrtUNL6jLyBu9vmgwsBLj49dEfaa8qG7+P8UpDxGX6/SZfdRSs7lVu4wcBnq
         B69zoxWBUDJBeXukPmkhYRxopfBuZbNkrkhDKvYiq8cWUaA//dTyk1k5DXdd8jbLem1j
         iMeZpw5i3hI8pX6HO6T3WZseT5i4h1bhRKyZDiCQ2veMs1RiEPoV4VIPNXHMF8Lrmvk/
         Y04g89E6Q9cOOzn7/XSAH69lgO1npemj9JpmMKzMXKhC0MkmFrrtyEFaHDlTSxnvvfiP
         uxPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768989840; x=1769594640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAWxpn1lfa3jIQMSgrdFcRFkbEKSjzcUYPwpRGge2ow=;
        b=by65pbflDIPyTkK9ZdjoSjINQ7OFz1Kvf3A8nWekoqbkgkNGuZSqo1jRcjR2ap5Y/y
         Okq8elb1GJimIAfzQqhiwROltlUBiQFyqS2rjY+GODqYP3KPtT0u1pSVZI5+6KupcEWS
         R+MWdDBcVMXhfwAlmuGkFmLHwnc95UNiFs2HuJpSthLfZalYQSqzW3A3YOTmHgBq/KRh
         NYVHbCLwXwjHEteMmBRIpwDVRTSBNNqAlvY4sws9v2PEw99x0xYaFEpgk9tixu96LAxp
         kiloc8rEUMLZyud8LZFlNZcOqk2kNDd3en4asiKx79oFtM1le2B2gWOXyhARA0I5vSHt
         S0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989840; x=1769594640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uAWxpn1lfa3jIQMSgrdFcRFkbEKSjzcUYPwpRGge2ow=;
        b=deo/fxCWjsd0KmnADHueW373JzB5FTCeb0EbhUwRo/Xe9aVaYyWfzVnzNrNta/9Ejj
         RCWSJFHaR+ceuZ+xD/LpcZOL8JJD2SOpW0Vcioc5CxLsBVAlCQMOqBdBfLU8ezaT8+ZM
         LlVdktjHkrTIlnooRfWBVBBezlmF3WMGXAFB4nG6L6ha137CvekCgS+g2AM/cdhp8fcp
         k1SvcCjMTgUxNU6FWNcfPNTBvQJ/0n4pDld6VXy0BLKAeo1EqkQkj5DLOkKipcC76pUv
         8uI2izMzHOsgHokXWMQ6FDBjOL84/SjCWjsZPY5A0SWYCUq/s1Jw+cVKFGu7lJoraO+a
         HjdA==
X-Forwarded-Encrypted: i=1; AJvYcCXmLWKe++opTZ8BPDghTLhEL7P25lTRwzpqMm6MeugURmylUzBFjgZ7fK1ApIeOJp139ZYfGMQZe9Ii@lists.linux.dev
X-Gm-Message-State: AOJu0Yzikk6B3voZQANt0SrGKWGpSbbjqUSuAgUfGUPqsQ3hKSCnX0Zs
	X6Eil6ooRB5P028bSCuCE8Zc8YWGG1Qr7ZKuvBYamZQf0svN5SDSNDyUpQPlYqar0BZKVjYqT6W
	zhq7j1a6/jVFo7YUL/J0Efxf76YVesoU=
X-Gm-Gg: AZuq6aLg7RHz0ud1UK328NMFVucLWPmuVNrSn44dZswNm0vOhufOEpu0d24eqk7vY3w
	COmsIFDl7oM2TfMXg1Nx4z5/AXQAYBdjA2rBrJPv2HS6EGywkeKzQ8auA6glxzZ+IhtYGPMQiL1
	Azdl+PyUItbBykCcHIYyio4buWqynfQd0phi1RdCCHam1p1wEUiZ8jXblrPgOr8FeROJ8QCb3/N
	MrBZxOPnyo5NxfnqUsESluBOOTcyOop9PoPf2sos1sm5+vgLCU3TP03uavvUQsST6m48WaE+sCI
	dRI+pUgwr85XQtxqiBBVAGuMC+6Hur334qvGRA==
X-Received: by 2002:a05:6512:15a6:b0:59b:6fa8:bc68 with SMTP id
 2adb3069b0e04-59baffe8e7cmr5856401e87.52.1768989839812; Wed, 21 Jan 2026
 02:03:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-3-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-3-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:03:48 +0100
X-Gm-Features: AZwV_Qj_jv5cF7_3VldGSiBqKdIIA42d37gSsFQt-w0PnnDnPUIVwTaoXd29s9Q
Message-ID: <CAFULd4b+co40kxWbjuY4C_uGB9MukSNKdB1t7umqtpWVNEzxKQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/14] x86/realmode: make %gs == 0 an invariant
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
> When accessing data that is not "near", either only one segment is
> used or one segment is always zero. Leave %gs =3D=3D 0 at all times
> throughout the C code; this reduces the number of segment loads
> needed.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/a20.c               | 11 +++++------
>  arch/x86/boot/header.S            |  3 +++
>  arch/x86/boot/regs.c              |  3 ++-
>  arch/x86/boot/video-bios.c        |  5 ++---
>  arch/x86/boot/video-mode.c        |  5 ++---
>  arch/x86/boot/video.c             |  7 +++----
>  arch/x86/realmode/rm/wakeup_asm.S | 10 ++++++----
>  7 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> index bda042933a05..3ab6cd8eaa31 100644
> --- a/arch/x86/boot/a20.c
> +++ b/arch/x86/boot/a20.c
> @@ -56,20 +56,19 @@ static int a20_test(int loops)
>         int ok =3D 0;
>         int saved, ctr;
>
> -       set_fs(0x0000);
> -       set_gs(0xffff);
> +       set_fs(0xffff);
>
> -       saved =3D ctr =3D rdfs32(A20_TEST_ADDR);
> +       saved =3D ctr =3D rdgs32(A20_TEST_ADDR);
>
>         while (loops--) {
> -               wrfs32(++ctr, A20_TEST_ADDR);
> +               wrgs32(++ctr, A20_TEST_ADDR);
>                 io_delay();     /* Serialize and make delay constant */
> -               ok =3D rdgs32(A20_TEST_ADDR+0x10) ^ ctr;
> +               ok =3D rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
>                 if (ok)
>                         break;
>         }
>
> -       wrfs32(saved, A20_TEST_ADDR);
> +       wrgs32(saved, A20_TEST_ADDR);
>         return ok;
>  }
>
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index 9bea5a1e2c52..bda20395658f 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -596,6 +596,9 @@ start_of_setup:
>         shrw    $2, %cx
>         rep stosl
>
> +# The C code uses %gs =3D=3D 0 as invariant
> +       movw    %ax, %gs
> +
>  # Jump to C code (should not return)
>         calll   main
>
> diff --git a/arch/x86/boot/regs.c b/arch/x86/boot/regs.c
> index 55de6b3092b8..54d6dfd129c5 100644
> --- a/arch/x86/boot/regs.c
> +++ b/arch/x86/boot/regs.c
> @@ -22,6 +22,7 @@ void initregs(struct biosregs *reg)
>         reg->eflags |=3D X86_EFLAGS_CF;
>         reg->ds =3D ds();
>         reg->es =3D ds();
> +       /* The input values of %cs and %ss are ignored by intcall() */
>         reg->fs =3D fs();
> -       reg->gs =3D gs();
> +       /* %gs =3D=3D 0 */
>  }
> diff --git a/arch/x86/boot/video-bios.c b/arch/x86/boot/video-bios.c
> index 6eb8c06bc287..e8be64424a40 100644
> --- a/arch/x86/boot/video-bios.c
> +++ b/arch/x86/boot/video-bios.c
> @@ -73,7 +73,6 @@ static int bios_probe(void)
>         if (adapter !=3D ADAPTER_EGA && adapter !=3D ADAPTER_VGA)
>                 return 0;
>
> -       set_fs(0);
>         crtc =3D vga_crtc();
>
>         video_bios.modes =3D GET_HEAP(struct mode_info, 0);
> @@ -105,8 +104,8 @@ static int bios_probe(void)
>                 mi =3D GET_HEAP(struct mode_info, 1);
>                 mi->mode =3D VIDEO_FIRST_BIOS+mode;
>                 mi->depth =3D 0;  /* text */
> -               mi->x =3D rdfs16(0x44a);
> -               mi->y =3D rdfs8(0x484)+1;
> +               mi->x =3D rdgs16(0x44a);
> +               mi->y =3D rdgs8(0x484)+1;
>                 nmodes++;
>         }
>
> diff --git a/arch/x86/boot/video-mode.c b/arch/x86/boot/video-mode.c
> index 9ada55dc1ab7..e5b9bc96bd42 100644
> --- a/arch/x86/boot/video-mode.c
> +++ b/arch/x86/boot/video-mode.c
> @@ -119,9 +119,8 @@ static void vga_recalc_vertical(void)
>         u16 crtc;
>         u8 pt, ov;
>
> -       set_fs(0);
> -       font_size =3D rdfs8(0x485); /* BIOS: font size (pixels) */
> -       rows =3D force_y ? force_y : rdfs8(0x484)+1; /* Text rows */
> +       font_size =3D rdgs8(0x485); /* BIOS: font size (pixels) */
> +       rows =3D force_y ? force_y : rdgs8(0x484)+1; /* Text rows */
>
>         rows *=3D font_size;      /* Visible scan lines */
>         rows--;                 /* ... minus one */
> diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
> index 0641c8c46aee..09b810faa5c0 100644
> --- a/arch/x86/boot/video.c
> +++ b/arch/x86/boot/video.c
> @@ -79,12 +79,11 @@ static void store_mode_params(void)
>                 video_segment =3D 0xb800;
>         }
>
> -       set_fs(0);
> -       font_size =3D rdfs16(0x485); /* Font size, BIOS area */
> +       font_size =3D rdgs16(0x485); /* Font size, BIOS area */
>         boot_params.screen_info.orig_video_points =3D font_size;
>
> -       x =3D rdfs16(0x44a);
> -       y =3D (adapter =3D=3D ADAPTER_CGA) ? 25 : rdfs8(0x484)+1;
> +       x =3D rdgs16(0x44a);
> +       y =3D (adapter =3D=3D ADAPTER_CGA) ? 25 : rdgs8(0x484)+1;
>
>         if (force_x)
>                 x =3D force_x;
> diff --git a/arch/x86/realmode/rm/wakeup_asm.S b/arch/x86/realmode/rm/wak=
eup_asm.S
> index 02d0ba16ae33..a8a8580158d7 100644
> --- a/arch/x86/realmode/rm/wakeup_asm.S
> +++ b/arch/x86/realmode/rm/wakeup_asm.S
> @@ -70,15 +70,17 @@ SYM_CODE_START(wakeup_start)
>         movl    $rm_stack_end, %esp
>         movw    %ax, %ds
>         movw    %ax, %es
> -       movw    %ax, %fs
> -       movw    %ax, %gs
>
> -       lidtl   .Lwakeup_idt
> +       xorl    %eax, %eax
> +       movw    %ax, %fs
> +       movw    %ax, %gs        /* The real mode code requires %gs =3D=3D=
 0 */
>
>         /* Clear the EFLAGS */
> -       pushl $0
> +       pushl   %eax
>         popfl
>
> +       lidtl   .Lwakeup_idt
> +
>         /* Check header signature... */
>         movl    signature, %eax
>         cmpl    $WAKEUP_HEADER_SIGNATURE, %eax
> --
> 2.52.0
>
