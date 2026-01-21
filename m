Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4E2D9492
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011639; cv=pass; b=c/bkfSwSUcdBZd13DC85wlgJKVSAvRiIi01kYJkYpy3epkftjnp3bRLyuX5BxFXJwSm+7hmvBix5wtJu+TIP6vLBYNLfV6QhIKgAChMLKKM+Z8KdEXywR1twqy25qJDpUc+zcr6++5KeuEQ38XN28JRHUWAHmKLRboi7C+VRTuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011639; c=relaxed/simple;
	bh=O9bVUzZZnkzgfEtkxw3GbxYH81RMZu9xV9iJqwWz8gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjFAssvthC5b6gwk+YPWBJP1/83jUjX+1aS4TCqbduQiUFd87Si0/SyPBL0Qo9RBRUEMzkv/J1uBHkt/Nj3DyiLyg6ocLJ/BM5My+PO9sbXX+PVVg9QjKjvh9q4tILS/PbVFM5KC2jdI+WS8o/SQUVMFGTbR9V7vi6eZ9TURvQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fppoUtWI; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fppoUtWI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so18611fa.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 08:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769011636; cv=none;
        d=google.com; s=arc-20240605;
        b=aDDwSKcsPsYqhNVSBCxKuEcgEle0MZBBR9OCiI9cnHU89ITAr9c5RxqzIFaAwLbSpk
         TgFR6/nZ+PvfkL7wFEdRZVDfC4VOffe4PHCWqI8IaFAF2g7m2zUe4O3t7Af8u9OOz/yO
         cPV7BlDHwjanhxutlScM0YOLb5lNZlgSemUGrP9oawe2GacdruasO+Gnmw3V2vOVql8w
         kgFDj/BghUJ89x9b8UQ0qTVAgu2pVzXdX47Lp/gmrTqxzb9TZgkwGVhmalpIIePx+mQ3
         uoXiz0NgYahSG+tnnYWFVGC7874ltIVDirVT+RxoPvWlaegmrFtbzUvn11GJim3I3hHD
         CwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SB7bAJoldPBwYI79q1/4iYN51POyazk8FKsp/t3KB+s=;
        fh=kTQdIHzFVaDPE52Ld3OEFVa1JPw2pMZwmLpl9rlgUrE=;
        b=MSId8AojHmAOJ27KOyDn7TvodWFAG31ByAWCyQ3C5vaH6gdcE501t4UCqthT+gUCUM
         JfExITqHmTiQjhmhAsIK/gz56xMy1zUYJRt45E3S1/oJisSES+7VAeODQPczFWgn42ZS
         E8WCHQ4NF2s7hayI4UwS6sr9bMCXAVPzQCG022JrVSw5ZvSihreLYfFyWAdaC/s08EZt
         43/y7JEcoJVFQLgzT5DYHCD3naSo+6wimB4FjV9KGzttqAbIST7+Z0NTvRxq0Z2KsSqB
         iBCis7A/qrLJA3Sw85UjzYfKes9Uh9Slz+Y52/1XUrB+YzLJkPVsKcOtUi9+K4H2xPEP
         RU7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769011636; x=1769616436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB7bAJoldPBwYI79q1/4iYN51POyazk8FKsp/t3KB+s=;
        b=fppoUtWIZlB0Dab7apUBmn05pJd6byHd1Y0MOgRzQnl/L5eZludngisktPts9wiJMe
         qUfChlp7xYQ2ySCQGt3RR+ekWXnjoNnxvIIsKiZFeglY1Y0ZXvJ6S2jM44t6lu3lNFZJ
         LP31eTJzAj7SnR+wfU3u2pbj6PEEDBPMB3sCxwxkcPwjNGlxfKJD8RTmytZOcnneXqeM
         CcE2afRaUtPhup4D0nHiLxMjiIoVgSaVsOdZv/bcem+UoKQH8sYRuCvYm+2eiq6HpL7s
         2pIf+8l13VWezbMe7cXAr7F8wDZSFy/NngpUv5zq3jsuVgDN3ISSncUr0sXw29I1zAxB
         KY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011636; x=1769616436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SB7bAJoldPBwYI79q1/4iYN51POyazk8FKsp/t3KB+s=;
        b=DOLY1G5uVy+FeGigZpQ9IofJKn61xBOfc7P6r48tNzJCM3c1Wi5ijatSLbjPMO0VhI
         4bCxY7YraDEjtvUF3k0VQuCHj9hSeZQoZtgQ3QqKqTXx+elfmMTBZkUoPd15jZkdU+VM
         ddJl+vpZOQOPUoRWNSZYetyRtayTMqoLa2dVvWBXStPeXXQO7ewuqUgRvU9ObvjMrVcJ
         NV3ai+094fcI3Le3DUiPcb0khvIsVpeYrOX36uwaTzQz8KYlQGgGReYZdH3wp24eWDJs
         4soXV730YN6F8dh6jWMuAK0qMkn/uIS+e5FK6vPCZ0/dLqm9NNVh6GVYfSZt7Vo4Ltc0
         E2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXVgmCbxKcyz6EIogvjeud9GIHhj6ouu1Acs0FB6r1tMt8qNOF9J2T+jrD01sy2NGIM7Y/DGOYSAAPD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7epG2CtJt8og6PROf87imnQrKsAZ0pre0p4jwX1UXG1Y1j7XR
	DUgHDqDt1pS4fe2sputuaNTIDTOf6jc2RFHVogSIHIDWXfjwhiD0jxnjG0e/w56AiofoGCJmAa1
	rfFu1NtrnY4n0XbbD+ky0FCivGob5kgE=
X-Gm-Gg: AZuq6aK4P0P1qGjGL+FeQ4sUJYA/6gYamzSJLChpmXBAh9uVZqLoQLCHQeNPT4Smmq1
	bSr9cAtbkV2KAWjropvGdVVf991m7U9YHJw4hMvx02RIe8OuOE5987vSAXtskDu3awhvv/dBxNu
	8R+6CuKO6rfMVgxgLxvdFadnDK7WeQ97dRNM00hTZX/Jbvp77HdDz6dYCIrm6EpebRCOPoRhEBZ
	ULNEyh6jFj/O6YJlYFakNPrvS9GiQPUH94/0GLAyhfn/GXNbFmzwyFZjmUiMoxRCrnsd+ABP07s
	HIvXokVK9mtAxgDWf1jeh1fZvrTWIg96lDbBcA==
X-Received: by 2002:a05:651c:a0a:b0:383:558e:97b9 with SMTP id
 38308e7fff4ca-385a54ce066mr20184601fa.39.1769011635635; Wed, 21 Jan 2026
 08:07:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-12-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-12-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 17:07:04 +0100
X-Gm-Features: AZwV_QgNw7J0XsdAP3q7wdyB6KkxZfzFVNbAsOxMA0F7f37b0a4Wx82HMgKgc38
Message-ID: <CAFULd4a2wXkA0dBVzZnJomsghi8X0i98LfaJ7TTdVQgJzF65dw@mail.gmail.com>
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

On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> All supported versions of gcc support __seg_fs and __seg_gs now.
> All supported versions of clang support __seg_fs and __seg_gs too,
> except for two bugs (as of clang 21, at least):
>
> 1. The %fs: and %gs: prefix does not get emitted in inline assembly.
> 2. An internal compiler error when addressing symbols directly.
>
> However, none of these are required in the boot code. Furthermore,
> this makes it possible to remove the absolute_pointer() hack in the
> fs/gs access functions.
>
> This requires adding a barrier() to a20.c, to prevent the compiler
> from eliding the load from the aliased memory address.
>
> Remove the unused memcmp_[fg]s() functions.
>
> Finally, ds() is by necessity constant, so mark the function as such.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/a20.c  |  1 +
>  arch/x86/boot/boot.h | 81 ++++++++++++++------------------------------
>  2 files changed, 27 insertions(+), 55 deletions(-)
>
> diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> index 3ab6cd8eaa31..52c3fccdcb70 100644
> --- a/arch/x86/boot/a20.c
> +++ b/arch/x86/boot/a20.c
> @@ -63,6 +63,7 @@ static int a20_test(int loops)
>         while (loops--) {
>                 wrgs32(++ctr, A20_TEST_ADDR);
>                 io_delay();     /* Serialize and make delay constant */
> +               barrier();      /* Compiler won't know about fs/gs overla=
p */
>                 ok =3D rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
>                 if (ok)
>                         break;
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index b4eb8405ba55..4d3549ed7987 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -45,7 +45,7 @@ static inline void io_delay(void)
>
>  /* These functions are used to reference data in other segments. */
>
> -static inline u16 ds(void)
> +static inline __attribute_const__ u16 ds(void)
>  {
>         u16 seg;
>         asm("movw %%ds,%0" : "=3Drm" (seg));
> @@ -54,7 +54,7 @@ static inline u16 ds(void)
>
>  static inline void set_fs(u16 seg)
>  {
> -       asm volatile("movw %0,%%fs" : : "rm" (seg));
> +       asm volatile("movw %0,%%fs" : : "rm" (seg) : "memory");
>  }
>  static inline u16 fs(void)
>  {
> @@ -65,7 +65,7 @@ static inline u16 fs(void)
>
>  static inline void set_gs(u16 seg)
>  {
> -       asm volatile("movw %0,%%gs" : : "rm" (seg));
> +       asm volatile("movw %0,%%gs" : : "rm" (seg) : "memory");
>  }
>  static inline u16 gs(void)
>  {
> @@ -76,96 +76,67 @@ static inline u16 gs(void)
>
>  typedef unsigned int addr_t;
>
> +/*
> + * WARNING: as of clang 21, clang has the following two bugs related
> + * to __seg_fs and __seg_gs:
> + *
> + * 1. The %fs: and %gs: prefix does not get emitted in inline assembly.
> + * 2. An internal compiler error when addressing symbols directly.
> + *
> + * Neither of those constructs are currently used in the boot code.
> + * If they ever are, and those bugs still remain, then those bugs will
> + * need to be worked around.
> + */
>  static inline u8 rdfs8(addr_t addr)
>  {
> -       u8 *ptr =3D (u8 *)absolute_pointer(addr);
> -       u8 v;
> -       asm volatile("movb %%fs:%1,%0" : "=3Dq" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_fs const u8 *)addr;
>  }
>  static inline u16 rdfs16(addr_t addr)
>  {
> -       u16 *ptr =3D (u16 *)absolute_pointer(addr);
> -       u16 v;
> -       asm volatile("movw %%fs:%1,%0" : "=3Dr" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_fs const u16 *)addr;
>  }
>  static inline u32 rdfs32(addr_t addr)
>  {
> -       u32 *ptr =3D (u32 *)absolute_pointer(addr);
> -       u32 v;
> -       asm volatile("movl %%fs:%1,%0" : "=3Dr" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_fs const u32 *)addr;
>  }
>
>  static inline void wrfs8(u8 v, addr_t addr)
>  {
> -       u8 *ptr =3D (u8 *)absolute_pointer(addr);
> -       asm volatile("movb %1,%%fs:%0" : "+m" (*ptr) : "qi" (v));
> +       *(__seg_fs u8 *)addr =3D v;
>  }
>  static inline void wrfs16(u16 v, addr_t addr)
>  {
> -       u16 *ptr =3D (u16 *)absolute_pointer(addr);
> -       asm volatile("movw %1,%%fs:%0" : "+m" (*ptr) : "ri" (v));
> +       *(__seg_fs u16 *)addr =3D v;
>  }
>  static inline void wrfs32(u32 v, addr_t addr)
>  {
> -       u32 *ptr =3D (u32 *)absolute_pointer(addr);
> -       asm volatile("movl %1,%%fs:%0" : "+m" (*ptr) : "ri" (v));
> +       *(__seg_fs u32 *)addr =3D v;
>  }
>
>  static inline u8 rdgs8(addr_t addr)
>  {
> -       u8 *ptr =3D (u8 *)absolute_pointer(addr);
> -       u8 v;
> -       asm volatile("movb %%gs:%1,%0" : "=3Dq" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_gs const u8 *)addr;
>  }
>  static inline u16 rdgs16(addr_t addr)
>  {
> -       u16 *ptr =3D (u16 *)absolute_pointer(addr);
> -       u16 v;
> -       asm volatile("movw %%gs:%1,%0" : "=3Dr" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_gs const u16 *)addr;
>  }
>  static inline u32 rdgs32(addr_t addr)
>  {
> -       u32 *ptr =3D (u32 *)absolute_pointer(addr);
> -       u32 v;
> -       asm volatile("movl %%gs:%1,%0" : "=3Dr" (v) : "m" (*ptr));
> -       return v;
> +       return *(__seg_gs const u32 *)addr;
>  }
>
>  static inline void wrgs8(u8 v, addr_t addr)
>  {
> -       u8 *ptr =3D (u8 *)absolute_pointer(addr);
> -       asm volatile("movb %1,%%gs:%0" : "+m" (*ptr) : "qi" (v));
> +       *(__seg_gs u8 *)addr =3D v;
>  }
>  static inline void wrgs16(u16 v, addr_t addr)
>  {
> -       u16 *ptr =3D (u16 *)absolute_pointer(addr);
> -       asm volatile("movw %1,%%gs:%0" : "+m" (*ptr) : "ri" (v));
> +       *(__seg_gs u16 *)addr =3D v;
>  }
>  static inline void wrgs32(u32 v, addr_t addr)
>  {
> -       u32 *ptr =3D (u32 *)absolute_pointer(addr);
> -       asm volatile("movl %1,%%gs:%0" : "+m" (*ptr) : "ri" (v));
> -}
> -
> -/* Note: these only return true/false, not a signed return value! */
> -static inline bool memcmp_fs(const void *s1, addr_t s2, size_t len)
> -{
> -       bool diff;
> -       asm volatile("fs repe cmpsb"
> -                    : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len=
));
> -       return diff;
> -}
> -static inline bool memcmp_gs(const void *s1, addr_t s2, size_t len)
> -{
> -       bool diff;
> -       asm volatile("gs repe cmpsb"
> -                    : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len=
));
> -       return diff;
> +       *(__seg_gs u32 *)addr =3D v;
>  }
>
>  /* Heap -- available for dynamic lists. */
> --
> 2.52.0
>
