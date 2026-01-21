Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB73A1A36
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990292; cv=pass; b=RP4dtqzCcDOCcRQ2wrcka5B4h4aybgJhLGDBFPXq/5CQUVXRA7/xp7RFzwn03jIagobWJcHTvq0z/jINxReJCsHKqEeWhyUILvO6ZvC0qkSHk6hrjrpsZn9PNrNm9Kvw4Bi1vNoAVgA2gZvAaA9G0Qfotoln20GMZFlpQAceII0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990292; c=relaxed/simple;
	bh=LAQkIHjFI/vKFRAx3oiZExV0U1BTsGNV9nh71c33m0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOQr1C9tHqujWTnSgdU0mT0XiKU4ruLX+ehYvOn734CqWLXGaNq63HahJeKF5JCBUjp8yogpwQBDvF0r4sIhaLzcmKAY3yeFFvvEHlhMyiltZyXFVNqkW/vYeltpCt4es2AFfxFaXLFJMKYAGQmvXL0HgPcqg5P7k5I5TTKp+gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/P/KECU; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/P/KECU"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so6909203e87.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990288; cv=none;
        d=google.com; s=arc-20240605;
        b=SOyPdRnwDwp2fV1aC3r4nWUFFOUGkUZLacFAwNW9eKeXx2mg140LSgjYVW8A5Q+LnF
         JDqE+wHXxttT2z6HlLQRyBBSmBXQKTclHcmKk4IplVadSuLOotGDk78N8XeRjhkTbBnI
         qzydbTO8EWAF+v8BrV0EK+/BYekHADlbFhGpIeZHeVJlNcJlPJNiLTQbsNC/BSFPxkwA
         jRIm2/vMHo6cVmuMFGlD9YR3P67I0mcSnXhfYthYBN5e/W44D/2nvtrTNl2zvYOavMmL
         YQjVeRsY3l/KgRsgZ8VaAa0xixK+Ji09nrqEJFPLqL1Y1wCU50M3RRaZGJDRaatrsB/M
         GhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R1wgIAPoJjs91MjfpvLm5FGL+ampCtfGrxDGPII/9OU=;
        fh=U4CB5+fsqt9gngh4z32LGUCl2BT+PxaHbr3lRYJWT4s=;
        b=SPQnelUYi3F1sqcCdeXU8aydInvRXSJnjGq8gKUFjqKD1+dRLJRlxfHV7wzoQMkyUG
         S5sHMIm5xDYXoXgPAPpuj6gUztK77CyRloAS6Ft7mknR5KBNgobQl+RtD02EM/fccRmB
         3n93JHyQho+M1+U4siA6/9NV/oOhpLSRim6u4x73560a+sWZeQB2EFjfDi2Gwz7qy6Vk
         +sswHlhLw3TSTUuCWE+mXzRQE44zEdxpw5//6DU+wn/WTwrwBXni4lSkrclz4eOk//gf
         cV+wd2u8QPhOEc+eg2Qsh3AGPBhu5F39wJgdnglzpY9pGqd2dVaqz9sujDgFytQF1uv0
         VAIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768990288; x=1769595088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1wgIAPoJjs91MjfpvLm5FGL+ampCtfGrxDGPII/9OU=;
        b=j/P/KECUf3ggFp0B7LV0+vmiErKf4fI6D41URZiUAgC+nxe0O/VROqnZU60FryOiYs
         s6XdOv8ABPqE4YqR0cr3TYAMYwVeSsR6mB77/Lh7MHyn+/zY6gtP4eGJwfz+ThhcsAcm
         S6rjZU6oYw3g+uC7zgz7mcyE7ThwZNvC1ZZXGD/OYFecQGcXEK4u7iaUk4IZeO1UyQbp
         mW0kuupFnQCrJsHti7SyaW3xQB7TMRp//fSvHl409ZjQo0y/TWw4/tKAcXWKbzXEd6/8
         AV/ZWzSakYUWetKxqAFR85JOR1FeATyQquXUoMcN5/9mN+98b4eeiC+o3KtXVCxBkmuW
         765A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990288; x=1769595088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R1wgIAPoJjs91MjfpvLm5FGL+ampCtfGrxDGPII/9OU=;
        b=eudGS55NoMmMYQGJsndk1MpS04e9cL2dv7pdLqchFwLmemtl0sleEpgmZAprQgRttn
         izslLJxGJJQ1kGGPCYRJW5hIDsTQEdoh3TRCv8LlOUMNUAfDISdM1Qj6YGL6tX8DhngM
         33TmNc3/2tvzQCu2oGWO1/vAdSh5ltiXTge9ramuoHUy2Cs3sd2woh4pmHXtANRB2Q4N
         aDp607LMlcphyfxoohHDql4XWvTELB3qvWuajPNppV6JVFqT5yjApuZL3UKfuCvgDYmY
         NofCLC7QQExF85CSwj6VKZxJnjT2ye7THNYCPb7OnsAtVxlvsqBuo7Eo2ksw4rhqVpSQ
         wwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ey9j0RMaB9Hma9Jv+a2nNsVroZGddrL3Au4rVxQzRLCtQYMooDEnXyc/+TkF+Zq5i3NmbOQF5uuf@lists.linux.dev
X-Gm-Message-State: AOJu0YzjnA86x/Da0DBZgSmntALuUrhiOCDe4I+LZrj3RQxe/0IX6vkG
	cCl7JB+Z6BiKhFjiFospwG91zbJZ4dTo3u1BHY6JKjEcCAeSlSXRmIEHSw+O9Qj9koJ3ka982sP
	K4qo7+YeI1Wfb5bXS5z4MXkZSLkQeBrs=
X-Gm-Gg: AZuq6aJ2wjOLLCd5ilxqLxbUZ/CZ1tw4vtKofge8bS6uoRIGYKNxywlqyS0ZeyffSGi
	QS10vK8VttzuBEsq5dsxlXtBNoE+TXCV0gVQJgMgpfselg7i0RK7IPaOC/G5R0Z+6BXMBsvoWML
	mq+zh6K29YyYfAdKuiHAoXgPmFyYCSt2K+KFkS2Qxl+GkdzcAuues+VTyieqJeuY/yQ9vjWzjX6
	CfGweumEbn11hB5CbXf1l0GE8bHo7wVNx2aUjTcrIq1jlnx2kqVtSpp+Ypd7UrkNz2+dxS1eyLi
	HAB10ROr1heh21sMU9v0OgYGH/y7VGF4dfMZ2OwGiLVQ0prj
X-Received: by 2002:a05:651c:220f:b0:382:fb5b:38f5 with SMTP id
 38308e7fff4ca-385a541b478mr17599081fa.12.1768990287911; Wed, 21 Jan 2026
 02:11:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-14-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-14-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:11:15 +0100
X-Gm-Features: AZwV_QhCQS39L7daOcUMXV-KDAhNJ2hJ01n7XWshBKn4Uik5FdPqBzCLfE_GvRo
Message-ID: <CAFULd4b8de+uEtwYBNNip9raVp1y-CcxO3BX7NrWDVHHVSmsnQ@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] x86/boot: simplify x86/boot/cmdline.c by using __seg_fs
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
> arch/x86/boot/cmdline.c is compiled in 16, 32, or 64-bit mode. In the
> 16-bit case it needs to access an out-of-data-segment pointer.
>
> This has been handled in the past by using a *really* ugly wrapper in
> the 32/64-bit code combined with an inline function in the 16-bit code.
>
> Using __seg_fs for the real-mode case allows for a much cleaner way of
> handling this difference. Futhermore, moving the code for typing and
> obtaining the pointer into cmdline.c itself avoids having to create
> and push an extra argument, which is particularly inefficient in the
> real-mode code as it requires a range check and pushes the argument
> count past 3. Furthermore, co-locating this code with the user makes it
> a lot clearer what the constraints are on this code, even though it
> means using #ifdef _SETUP.
>
> Instead of limit-checking the command line to the real-mode segment
> limit, limit-check it to COMMAND_LINE_SIZE (which is always less than
> 64K, and thus automatically incorporates the real-mode segment limit
> check.)
>
> If compiling for 32 bits, trying to add ext_cmd_line_ptr in
> get_cmd_line_ptr() is futile as unsigned long, and pointers, are only
> 32 bits wide. Instead, limit-check the command line pointer and fail
> if it is >=3D 4 GiB, just as the real-mode code fails if the pointer is
> >=3D 1 MiB.
>
> Since the kaslr code depends on get_cmd_line_ptr(), retain it as a
> global function.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Acked-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/boot.h               | 23 +--------
>  arch/x86/boot/cmdline.c            | 79 +++++++++++++++++++++++-------
>  arch/x86/boot/compressed/cmdline.c | 29 -----------
>  3 files changed, 64 insertions(+), 67 deletions(-)
>
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index 584c89d0738b..8512db8b3f8e 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -216,27 +216,8 @@ struct biosregs {
>  void intcall(u8 int_no, const struct biosregs *ireg, struct biosregs *or=
eg);
>
>  /* cmdline.c */
> -int __cmdline_find_option(unsigned long cmdline_ptr, const char *option,=
 char *buffer, int bufsize);
> -int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *op=
tion);
> -static inline int cmdline_find_option(const char *option, char *buffer, =
int bufsize)
> -{
> -       unsigned long cmd_line_ptr =3D boot_params.hdr.cmd_line_ptr;
> -
> -       if (cmd_line_ptr >=3D 0x100000)
> -               return -1;      /* inaccessible */
> -
> -       return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsiz=
e);
> -}
> -
> -static inline int cmdline_find_option_bool(const char *option)
> -{
> -       unsigned long cmd_line_ptr =3D boot_params.hdr.cmd_line_ptr;
> -
> -       if (cmd_line_ptr >=3D 0x100000)
> -               return -1;      /* inaccessible */
> -
> -       return __cmdline_find_option_bool(cmd_line_ptr, option);
> -}
> +int cmdline_find_option(const char *option, char *buffer, int bufsize);
> +int cmdline_find_option_bool(const char *option);
>
>  /* cpu.c, cpucheck.c */
>  int check_cpu(int *cpu_level_ptr, int *req_level_ptr, u32 **err_flags_pt=
r);
> diff --git a/arch/x86/boot/cmdline.c b/arch/x86/boot/cmdline.c
> index 21d56ae83cdf..3f31fcbed673 100644
> --- a/arch/x86/boot/cmdline.c
> +++ b/arch/x86/boot/cmdline.c
> @@ -11,12 +11,59 @@
>   */
>
>  #include "boot.h"
> +#include <asm/setup.h>
> +#include <asm/bootparam.h>
>
>  static inline int myisspace(u8 c)
>  {
>         return c <=3D ' ';        /* Close enough approximation */
>  }
>
> +#ifdef _SETUP
> +typedef const char __seg_fs *cptr_t;
> +static inline cptr_t get_cptr(void)
> +{
> +       /*
> +        * Note: there is no reason to check ext_cmd_line_ptr here,
> +        * because it falls outside of boot_params.hdr and therefore
> +        * will always be zero when entering through the real-mode
> +        * entry point.
> +        */
> +       unsigned long ptr =3D boot_params.hdr.cmd_line_ptr;
> +
> +       /*
> +        * The -16 here serves two purposes:
> +        * 1. It means the segbase >=3D 0x100000 check also doubles as
> +        *    a check for the command line pointer being zero.
> +        * 2. It means this routine won't return a NULL pointer for
> +        *    a valid address; it will always return a pointer in the
> +        *    range 0x10-0x1f inclusive.
> +        */
> +       unsigned long segbase =3D (ptr - 16) & ~15;
> +       if (segbase >=3D 0x100000)
> +               return NULL;
> +
> +       set_fs(segbase >> 4);
> +       return (cptr_t)(ptr - segbase);
> +}
> +#else
> +unsigned long get_cmd_line_ptr(void)
> +{
> +       unsigned long ptr =3D boot_params_ptr->hdr.cmd_line_ptr;
> +       if (sizeof(unsigned long) > 4)
> +               ptr +=3D (u64)boot_params_ptr->ext_cmd_line_ptr << 32;
> +       else if (boot_params_ptr->ext_cmd_line_ptr)
> +               return 0;       /* Inaccessible due to pointer overflow *=
/
> +
> +       return ptr;
> +}
> +typedef const char *cptr_t;
> +static inline cptr_t get_cptr(void)
> +{
> +       return (cptr_t)get_cmd_line_ptr();
> +}
> +#endif
> +
>  /*
>   * Find a non-boolean option, that is, "option=3Dargument".  In accordan=
ce
>   * with standard Linux practice, if this option is repeated, this return=
s
> @@ -25,9 +72,9 @@ static inline int myisspace(u8 c)
>   * Returns the length of the argument (regardless of if it was
>   * truncated to fit in the buffer), or -1 on not found.
>   */
> -int __cmdline_find_option(unsigned long cmdline_ptr, const char *option,=
 char *buffer, int bufsize)
> +int cmdline_find_option(const char *option, char *buffer, int bufsize)
>  {
> -       addr_t cptr;
> +       cptr_t cptr, eptr;
>         char c;
>         int len =3D -1;
>         const char *opptr =3D NULL;
> @@ -39,13 +86,12 @@ int __cmdline_find_option(unsigned long cmdline_ptr, =
const char *option, char *b
>                 st_bufcpy       /* Copying this to buffer */
>         } state =3D st_wordstart;
>
> -       if (!cmdline_ptr)
> -               return -1;      /* No command line */
> +       cptr =3D get_cptr();
> +       if (!cptr)
> +               return -1;      /* No command line or invalid pointer */
> +       eptr =3D cptr + COMMAND_LINE_SIZE - 1;
>
> -       cptr =3D cmdline_ptr & 0xf;
> -       set_fs(cmdline_ptr >> 4);
> -
> -       while (cptr < 0x10000 && (c =3D rdfs8(cptr++))) {
> +       while (cptr < eptr && (c =3D *cptr++)) {
>                 switch (state) {
>                 case st_wordstart:
>                         if (myisspace(c))
> @@ -97,9 +143,9 @@ int __cmdline_find_option(unsigned long cmdline_ptr, c=
onst char *option, char *b
>   * Returns the position of that option (starts counting with 1)
>   * or 0 on not found
>   */
> -int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *op=
tion)
> +int cmdline_find_option_bool(const char *option)
>  {
> -       addr_t cptr;
> +       cptr_t cptr, eptr;
>         char c;
>         int pos =3D 0, wstart =3D 0;
>         const char *opptr =3D NULL;
> @@ -109,14 +155,13 @@ int __cmdline_find_option_bool(unsigned long cmdlin=
e_ptr, const char *option)
>                 st_wordskip,    /* Miscompare, skip */
>         } state =3D st_wordstart;
>
> -       if (!cmdline_ptr)
> -               return -1;      /* No command line */
> -
> -       cptr =3D cmdline_ptr & 0xf;
> -       set_fs(cmdline_ptr >> 4);
> +       cptr =3D get_cptr();
> +       if (!cptr)
> +               return -1;      /* No command line or invalid pointer */
> +       eptr =3D cptr + COMMAND_LINE_SIZE - 1;
>
> -       while (cptr < 0x10000) {
> -               c =3D rdfs8(cptr++);
> +       while (cptr <=3D eptr) {
> +               c =3D *cptr++;
>                 pos++;
>
>                 switch (state) {
> diff --git a/arch/x86/boot/compressed/cmdline.c b/arch/x86/boot/compresse=
d/cmdline.c
> index e162d7f59cc5..0d9267a21012 100644
> --- a/arch/x86/boot/compressed/cmdline.c
> +++ b/arch/x86/boot/compressed/cmdline.c
> @@ -1,32 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include "misc.h"
> -
> -#include <asm/bootparam.h>
> -
> -static unsigned long fs;
> -static inline void set_fs(unsigned long seg)
> -{
> -       fs =3D seg << 4;  /* shift it back */
> -}
> -typedef unsigned long addr_t;
> -static inline char rdfs8(addr_t addr)
> -{
> -       return *((char *)(fs + addr));
> -}
>  #include "../cmdline.c"
> -unsigned long get_cmd_line_ptr(void)
> -{
> -       unsigned long cmd_line_ptr =3D boot_params_ptr->hdr.cmd_line_ptr;
> -
> -       cmd_line_ptr |=3D (u64)boot_params_ptr->ext_cmd_line_ptr << 32;
> -
> -       return cmd_line_ptr;
> -}
> -int cmdline_find_option(const char *option, char *buffer, int bufsize)
> -{
> -       return __cmdline_find_option(get_cmd_line_ptr(), option, buffer, =
bufsize);
> -}
> -int cmdline_find_option_bool(const char *option)
> -{
> -       return __cmdline_find_option_bool(get_cmd_line_ptr(), option);
> -}
> --
> 2.52.0
>
