Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEA313E0F
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990145; cv=pass; b=XpD9Tjv1tEDUkKI6hOn9NBi2YqB1jrC2YikgXy77lKkxaacpFcgtq08mvHJ2KuoUeARggb6oHLqY0tpUzcREHdI03Gzdvo5MOCJrl11AGe3BZPh/N44Q69Trghd2+9K0RAhl1r7Hly2cz5PiwI/Uc3XxUkPnqnixMzZOYZCC5Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990145; c=relaxed/simple;
	bh=yZ9CZVHS0xRQocUBe137DSCjtAipZz7OUlqMHQrI7ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcM2eIH+VFTqTjFAHNhiXx0xL0caEyD9IIFSHp7At+HyzoYqkoVnf5HMr8tIaTzAe1Mo/tFbF8iVW2VraRj5ydulh2i1plxvcaKbUY4RHG8qTfxyrHj0zDYQaFpQ7YnEuRJK8pvH2AMMqQMYwPb4PyYMEpRoln71Q1Su+SSoEiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgNLf3uE; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgNLf3uE"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-383153e06d1so52673171fa.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990141; cv=none;
        d=google.com; s=arc-20240605;
        b=ao88QEvxbM/uuFOQHbB3uRqVWiLnGXlMMDWtew5kBAdBblMu1i7TrBN7gY6+QRYXr2
         1EN7M50Fm4A9YpOGurbTE9TYY6v638CnP9gHJqoxirNvzB2Z134pdo3zQ1PyuNTs82MM
         YlXTQ1SyQq7m0MPeoc872ewh5G1WthcPP7SK3yp953KNecyd7F3tcpZdCv3xOky8Vpu9
         xiQcsZyevlrYjtCsembK0RhrFvnVL6cCdYSFRBrhPV4Y6VTGY6/dO1kok4QBnlCz7bum
         395Wafh8gFLUv6qhudYwT222RDAm/WUvI4wvlY8uPO/9gepc1w+8EfZEAVfm6i9mMWAE
         Z+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAUfLxYpwgQPjLiHQ82zu3snrVzwIq78vo3UGzNr5eA=;
        fh=y7qzkLgpaPIonRETrBHI12IRnw7fa9K4FKdRk99cg64=;
        b=hdMjLbdIkQVjKeG3i5oQCCAlZeuTJNyMLm4ZixnYW43NSCEUjenuzrrhJjRZD8Rdsm
         B91hv1YmxgjkAfNOUbXhumTKK640cJ2ptBBzEVEyaKiFFVuChb7v1/kf9IjgfWcRcL0Y
         +8918X/qVhNiEL8/2D2sg85iyvBpTLPVxyEaCxbMyZSLikyEwIqix83yHyhK822w9pTs
         54hqhNmuWmNfKCyzAnmaha8OTXSC28sAHhoqsQD2MNEQEtegPqiu2iBOyJDnUrsTb6tP
         cR5vl8TllZTvJl6ZmHAm9MC3zZ4OSHXNNQEbRdHNc6kPBonqTMGQWDE4TPrdbw9XHJmz
         1IJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768990141; x=1769594941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAUfLxYpwgQPjLiHQ82zu3snrVzwIq78vo3UGzNr5eA=;
        b=kgNLf3uEKsjLYCrD9rJ/Qv94rWjZwsn79i2whfxlT5KrCO4Q8Ve8DBSX8NHnwHMrMZ
         +5XKRLvRgHES2TDgDMVSXPOPJVzKqX10sPtM1heqEWfUf5bfk32kHfQffMHJUQ7O//3c
         PVRPJYlypWQbCBzXaTQQ0S0zZ4DOllxx7rKLxEaCfSNNpm1YwsevTcoh+LRkrA0Zb24X
         OhqS/lfOlPt9kYLHHV+WM9nzb5Ti49hJPaO4OF1s4O821TDZAR1IGFh4bxUS39Qyb8Vl
         R9Qux81fBznEVwxOhys7TIa+zxoKpDjRjDuuOLdGHk5ifaxbNqH9MZqHpgFNK4ncO75X
         bmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990141; x=1769594941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAUfLxYpwgQPjLiHQ82zu3snrVzwIq78vo3UGzNr5eA=;
        b=HlLbl9Lq+PPn5DW/bCLvAHQS3kQqethe/8WaIFTLYKEdkQ0rCkYpe35iL+4u8imfb+
         aHekf9E0Eh4SR9gs82VgwIdnYwhgyNI1oNrZpKihB7E0DwFfE4me5zl7O6KMIUHrFKjJ
         AovCJ+95t8El4hsQqLYiShI1BifOQxAeD5jFoIuKeyvLZlBRAf8ctkvFFfkHzX2+l9qs
         UAcJdlD6MzTzGQOnzxS1HSx1Stl6ZnERxXxhrsuBkRIH1FeIfHNfTcJdqd2jjm8u8UW9
         Zaphg71C7VzoS6L01rIqihkxzjBFUFur5p5AFHxPtAOER2NBs6j95PbcfsVE2M6I+Gl/
         Q2sA==
X-Forwarded-Encrypted: i=1; AJvYcCWNT1eAAYuYFjXcHJHA5AR3gsYCpwrYP9CUOp5HkXHgk/kDOvW+x4iHNigTrMAl8Ti5qoBYUJCAbauL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2rx0Vuatsz9ZZ3D4fjZDVVviUklA58m4SgGT1q2a792nrRcpn
	fJbNgd+GqLoxgBpvN18qBpiAycsFzjv9bdRVLWgF37En/C4UDoXgJ9Lmi5K39T+DeQCUzcwuGZS
	KZqVhSkgtSqn43Wg2U1r8imQ85ya/OnE=
X-Gm-Gg: AZuq6aLD4Ed+rp65ykgwX4pUOaRPJzj3R1mvtugSU49le7dMDI8YZkpfOErQS4RRFQX
	m/CadfHmtt2R3S2xD9AMZ5t8Qnaq6vupxjSq2pQAse5Mx1gu3fG1FJdlSpndG7VpTTpCP7sYr+A
	SkPgvZx701/LqedtF1M8hyucQPpOrSaN1xGTykdJ8ST38QQDQfwx5PhwkYE//COhYQoha0fXEYL
	rL1tMndhujtklrC79AeSbhL7wuiVJ4q+pFXeV4uRsslmwRhTxKhpvvJVm/j7kAkzxaakx1F2nvk
	O9HbGNQ2+GEebzPZrlYgzRivTGSxXTiHjvJHBRB8WcNfAxFg
X-Received: by 2002:a2e:be08:0:b0:37b:9a67:bb66 with SMTP id
 38308e7fff4ca-3838432e119mr62319431fa.38.1768990140808; Wed, 21 Jan 2026
 02:09:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-8-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-8-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:08:48 +0100
X-Gm-Features: AZwV_QhIcqkA9xrUpo-uFgwoPgevLbO1r9lMt36YLWOb3l1Rf2xUulFN9ddKZRs
Message-ID: <CAFULd4bzcTnaS81Xy8-bEXFCyV1e_P6eusFV+_xPo6Vb-bct1A@mail.gmail.com>
Subject: Re: [PATCH v1 07/14] x86/boot: factor out the 16-bit startup code
 from header.S
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
> Move the 16-bit startup code to its own assembly file, instead of
> mixing it into header.S. header.S is now a pure data file.
>
> This also means the .code16 directive is no longer needed for this
> file.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/Makefile  |   4 +-
>  arch/x86/boot/header.S  |  91 +--------------------------------
>  arch/x86/boot/start16.S | 108 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+), 91 deletions(-)
>  create mode 100644 arch/x86/boot/start16.S
>
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 3f9fb3698d66..d7944bf196b9 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -22,8 +22,8 @@ subdir-               :=3D compressed
>
>  setup-y                +=3D a20.o bioscall.o cmdline.o copy.o cpu.o cpuf=
lags.o cpucheck.o
>  setup-y                +=3D early_serial_console.o edd.o header.o main.o=
 memory.o
> -setup-y                +=3D pm.o pmjump.o printf.o regs.o string.o tty.o=
 video.o
> -setup-y                +=3D video-mode.o version.o
> +setup-y                +=3D pm.o pmjump.o printf.o regs.o start16.o stri=
ng.o tty.o
> +setup-y                +=3D video.o video-mode.o version.o
>  setup-$(CONFIG_X86_APM_BOOT) +=3D apm.o
>
>  # The link order of the video-*.o modules can matter.  In particular,
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index d74db02928e6..10b2971320f3 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -25,7 +25,6 @@
>  #include "voffset.h"
>  #include "zoffset.h"
>
> -BOOTSEG                =3D 0x07C0                /* original address of =
boot-sector */
>  SYSSEG         =3D 0x1000                /* historical load address >> 4=
 */
>
>  #ifndef SVGA_MODE
> @@ -39,8 +38,6 @@ SYSSEG                =3D 0x1000                /* hist=
orical load address >> 4 */
>         .set    salign, 0x1000
>         .set    falign, 0x200
>
> -       .code16
> -
>  # EFI PECOFF header ####################################################=
######
>
>         .section ".header", "a"
> @@ -277,6 +274,7 @@ type_of_loader:     .byte   0               # 0 means=
 ancient bootloader, newer
>                                         # assigned ids
>
>  # flags, unused bits must be zero (RFU) bit within loadflags
> +               .globl  loadflags
>  loadflags:
>                 .byte   LOADED_HIGH     # The kernel is to be loaded high
>
> @@ -301,6 +299,7 @@ ramdisk_size:       .long   0               # its siz=
e in bytes
>  bootsect_kludge:
>                 .long   0               # obsolete
>
> +               .globl  heap_end_ptr
>  heap_end_ptr:  .word   _end+STACK_SIZE-512
>                                         # (Header version 0x0201 or later=
)
>                                         # space from here (exclusive) dow=
n to
> @@ -551,89 +550,3 @@ kernel_info_offset:        .long ZO_kernel_info
>  end_of_bzheader:
>
>  # End of bzImage header ################################################=
######
> -
> -       .section ".entrytext", "ax"
> -       .globl start_of_setup
> -start_of_setup:
> -# Force %es =3D %ds
> -       movw    %ds, %ax
> -       movw    %ax, %es
> -       cld
> -
> -# Apparently some ancient versions of LILO invoked the kernel with %ss !=
=3D %ds,
> -# which happened to work by accident for the old code.  Recalculate the =
stack
> -# pointer if %ss is invalid.  Otherwise leave it alone, LOADLIN sets up =
the
> -# stack behind its own code, so we can't blindly put it directly past th=
e heap.
> -
> -       movw    %ss, %dx
> -       cmpw    %ax, %dx        # %ds =3D=3D %ss?
> -       movw    %sp, %dx
> -       je      2f              # -> assume %sp is reasonably set
> -
> -       # Invalid %ss, make up a new stack
> -       movw    $_end, %dx
> -       testb   $CAN_USE_HEAP, loadflags
> -       jz      1f
> -       movw    heap_end_ptr, %dx
> -1:     addw    $STACK_SIZE, %dx
> -       jnc     2f
> -       xorw    %dx, %dx        # Prevent wraparound
> -
> -2:     # Now %dx should point to the end of our stack space
> -       andw    $~3, %dx        # dword align (might as well...)
> -       jnz     3f
> -       movw    $0xfffc, %dx    # Make sure we're not zero
> -3:     movw    %ax, %ss
> -       movzwl  %dx, %esp       # Clear upper half of %esp
> -       sti                     # Now we should have a working stack
> -
> -# We will have entered with %cs =3D %ds+0x20, normalize %cs so
> -# it is on par with the other segments.
> -       pushw   %ds
> -       pushw   $6f
> -       lretw
> -6:
> -
> -# Check signature at end of setup
> -SETUP_SIGNATURE =3D 0x5a5aaa55
> -       cmpl    $SETUP_SIGNATURE, setup_sig
> -       jne     setup_bad
> -
> -# Zero the bss
> -       movw    $__bss_start, %di
> -       movw    $_end+3, %cx
> -       xorl    %eax, %eax
> -       subw    %di, %cx
> -       shrw    $2, %cx
> -       rep stosl
> -
> -# The C code uses %gs =3D=3D 0 as invariant
> -       movw    %ax, %gs
> -
> -# Jump to C code (should not return)
> -       calll   main
> -
> -# Setup corrupt somehow...
> -setup_bad:
> -       movl    $setup_corrupt, %eax
> -       # Fall through...
> -
> -       .globl  die
> -       .type   die, @function
> -die:
> -       calll   puts
> -1:
> -       hlt
> -       jmp     1b
> -
> -       .size   die, .-die
> -
> -       .section ".initdata", "a"
> -setup_corrupt:
> -       .byte   7
> -       .string "No setup signature found...\n"
> -
> -       .section ".signature", "a"
> -       .balign 4
> -setup_sig:
> -       .long SETUP_SIGNATURE
> diff --git a/arch/x86/boot/start16.S b/arch/x86/boot/start16.S
> new file mode 100644
> index 000000000000..3381dc0f4065
> --- /dev/null
> +++ b/arch/x86/boot/start16.S
> @@ -0,0 +1,108 @@
> +/*
> + * start16.S
> + *
> + *     Copyright (C) 1991, 1992 Linus Torvalds
> + *
> + *     Based on bootsect.S and setup.S
> + *     modified by more people than can be counted
> + *
> + *     Rewritten as a common file by H. Peter Anvin (Apr 2007)
> + *
> + * BIG FAT NOTE: We're in real mode using 64k segments.  Therefore segme=
nt
> + * addresses must be multiplied by 16 to obtain their respective linear
> + * addresses. To avoid confusion, linear addresses are written using lea=
ding
> + * hex while segment addresses are written as segment:offset.
> + *
> + * This code must *immediately* follow the bzImage header, so DO NOT
> + * add alignment directives anywhere in the .entrytext section!
> + */
> +
> +#include <asm/bootparam.h>
> +#include "boot.h"
> +
> +       .code16
> +       .section ".entrytext", "ax"
> +       .globl start_of_setup
> +start_of_setup:
> +# Force %es =3D %ds
> +       movw    %ds, %ax
> +       movw    %ax, %es
> +       cld
> +
> +# Apparently some ancient versions of LILO invoked the kernel with %ss !=
=3D %ds,
> +# which happened to work by accident for the old code.  Recalculate the =
stack
> +# pointer if %ss is invalid.  Otherwise leave it alone, LOADLIN sets up =
the
> +# stack behind its own code, so we can't blindly put it directly past th=
e heap.
> +
> +       movw    %ss, %dx
> +       cmpw    %ax, %dx        # %ds =3D=3D %ss?
> +       movw    %sp, %dx
> +       je      2f              # -> assume %sp is reasonably set
> +
> +       # Invalid %ss, make up a new stack
> +       movw    $_end, %dx
> +       testb   $CAN_USE_HEAP, loadflags
> +       jz      1f
> +       movw    heap_end_ptr, %dx
> +1:     addw    $STACK_SIZE, %dx
> +       jnc     2f
> +       xorw    %dx, %dx        # Prevent wraparound
> +
> +2:     # Now %dx should point to the end of our stack space
> +       andw    $~3, %dx        # dword align (might as well...)
> +       jnz     3f
> +       movw    $0xfffc, %dx    # Make sure we're not zero
> +3:     movw    %ax, %ss
> +       movzwl  %dx, %esp       # Clear upper half of %esp
> +       sti                     # Now we should have a working stack
> +
> +# We will have entered with %cs =3D %ds+0x20, normalize %cs so
> +# it is on par with the other segments.
> +       pushw   %ds
> +       pushw   $6f
> +       lretw
> +6:
> +
> +# Check signature at end of setup
> +SETUP_SIGNATURE =3D 0x5a5aaa55
> +       cmpl    $SETUP_SIGNATURE, setup_sig
> +       jne     setup_bad
> +
> +# Zero the bss
> +       movw    $__bss_start, %di
> +       movw    $_end+3, %cx
> +       xorl    %eax, %eax
> +       subw    %di, %cx
> +       shrw    $2, %cx
> +       rep stosl
> +
> +# The C code uses %gs =3D=3D 0 as invariant
> +       movw    %ax, %gs
> +
> +# Jump to C code (should not return)
> +       calll   main
> +
> +# Setup corrupt somehow...
> +setup_bad:
> +       movl    $setup_corrupt, %eax
> +       # Fall through...
> +
> +       .globl  die
> +       .type   die, @function
> +die:
> +       calll   puts
> +1:
> +       hlt
> +       jmp     1b
> +
> +       .size   die, .-die
> +
> +       .section ".initdata", "a"
> +setup_corrupt:
> +       .byte   7
> +       .string "No setup signature found...\n"
> +
> +       .section ".signature", "a"
> +       .balign 4
> +setup_sig:
> +       .long SETUP_SIGNATURE
> --
> 2.52.0
>
