Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76642B72B
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985815; cv=pass; b=AkoZccpDOaaA9fhgCiiZKNLp1xSFkba/IOFoTab0PasDDnVIAzIbZYYSZHd9oZpVYbubwaxWgSChGU1mUgFUqPkh4i2HQ1iN3UOFm5Og+of+3xFv3nE+cjntextqQQwEPnBpFR2LSocoBhm1r4J9qpt5BTEdAVHzsrsrmZfxGvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985815; c=relaxed/simple;
	bh=9vn2qNqGWg03S+X3HaE1FJvm4LXhKw1zHxj4ImkoA8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4ZP7SuQmxCsRIXCWHNnSMKCQN+12CUG1uMVZ5N0zwsg8+teCATGwCzyZyt5QmTncs2hTGipiubMvkLoCBr/yGGOE9lbeYfruUK/b8O3HuwyId0PGtMqsdTVbqWSGYepgQrM3Yk8aEH+ULfSQfAbRIcLfdfPxF8fjlcJPMGkCRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiE1fIRa; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiE1fIRa"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382f9930e54so5638441fa.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 00:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768985811; cv=none;
        d=google.com; s=arc-20240605;
        b=MFxeqCs+DmjzMnEH1n8lT2a550PPu8O+1ceigf9l/KuI0EAX63skPO56xtUYFBAvQC
         YWW0RqTCc8t8IzAlf+ZcB9kFbAp1YHBYUzpuZpDZN4zvp7dT9wsqgK2ZTdeO8jRRhcnD
         SQs8P3n9x853Ea++R+p3ItCXP4e3Dstv0keoVmEgGyLKdvMHffp+ZLWtDJLAg0fRgudl
         Wbih3fTt3UV9rSDtjbXejb0CkRnbkEj8gNiLr9SvNdjG5nTBWyZWx1iSSeqyLfKSvZPP
         J/PxDXUrWICz4UbP4y1HDAW74wF4bDnZjX/Da0yZ+/+zHTFmywZeWjeXQfgJU0wZJIqh
         bCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9PPag0kSL60ABbrdX7dkw/VrGoGbEW09kv/ej4VWT30=;
        fh=ygbp3R7DUQ7VWPms+vw+5POqs7DJfKtSyBCooG/T5dA=;
        b=dYi9ebmSK+CGIyVGIgOpBhxSzZVvALziP4VB6te/V3eZImiZMhRvGNlUwIYrMcxDUU
         4Ko+MiYtWmC25EJQ9S4d2ElVWQn2/t8/wz13f2ufVf+3od7F5m87+uYoktJGnsCZuZBL
         PFeOgpZxuubUTzDoj2hLUDpqABKpDe7PggvEIs2XZ9EZZxbRho/oja+Mi5Vui3Nvqrp9
         uj9gEEtN9UM6YEbFvspRaeiyEgdfvFucYEKqnh17X5Tz3qUxAB/Af01AVt+QslsJX0z3
         tYFV26gwVG+OjdhCqJTQZY5m5KBx3DHOR/OufEh6w9KAoHyrwLfBa0DRgewInCiLCgXQ
         xlBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768985811; x=1769590611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PPag0kSL60ABbrdX7dkw/VrGoGbEW09kv/ej4VWT30=;
        b=GiE1fIRaUGhjoy5SelluMd+SFdRmJFQOkYty5GFdaq3BbwBo73ksr/3xoCyzQWg/bb
         bmdXZDEFPsT6ehgyX+TBn08VBMSLG0hxCtv6EnUwjdtN8QmJ3dy3rgf7NLEECGHI8oPl
         PuxGQJlBFfeDAjpQVnfRZTl4Wq2EDZo4qY1PGp6L9At5jO9qq085jJPzLvUyM7yxCgKc
         Hvprlv93PGmI45HGOU+AV0GLqMsSPh+HITaCWFIfeOwA5rnKqwWHWzHni6g4pbS9xksz
         rX8OPe7TGxZEZJKRBM94RbV0U9aE6Vg0BH8hgyQ/k6U67He3NT/9nEKLEE7kN86kTdNb
         SbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985811; x=1769590611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9PPag0kSL60ABbrdX7dkw/VrGoGbEW09kv/ej4VWT30=;
        b=hL0WrWhkAa/fcs45efT2fIsdGo+wjrjrvFk4/ZWd5xWlf44Scjp0eTyQOtIJ9PfmOQ
         DFmGt4CPG0IRMUEHYM/Ed8ZPxOexmwb8h/tVUHiDYRdatuZ1kgJ7tGWYB+T6wQGoqFrP
         i3fUMZhcBYwbMiPzb86NltfDgdnPhUm8y6ghxlynQ4Bo57yoWiM0GGQtUsvLBMyQxbXW
         7SFyIkE8+1pXIz4W+DSgyQqaGBwpxS8vw3zaQGa1toOxQZJWvvcVNBd4rQRNsl8qgZfi
         8PLbo9vG3yUdOqrkhFbCnLOUEh4nRXveiAaTuZJuNkq/bqN6pwdwOOkqI8m/nbctXjci
         CXWg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGycI3pj5227HrqjQM4VzOtdkTRPVvZszU1JsWU0mfvGmVHVycRKCc+Ql7GjXCHda0hbvLuZIcjJ3@lists.linux.dev
X-Gm-Message-State: AOJu0YxTXlnaYyXLWY4XAzc9yvlrduEvGntnb0rWuaWoVmMPt9qXyTBk
	J9KlfCxxxF7utzZE3hHw7t4jdBf1kuhn2xaX0R3aZ32dJfo899Rsa4xs4nm0575O+WPmJ+qwfUg
	b2R9hPe+Ej3QdPLhzHIfvJvKfrwVGnD0=
X-Gm-Gg: AZuq6aKPPJA9DJws0J0vukWUOVKkYKX0gYHHvLK6d+15E2HbmJc/FHuZhsQO8jHaFf4
	IPX72pjUMKnkTQ4BxAIga4Ui9TbVyLezuhcrB9A5LU8UtSTUfbzqAzB8wW+i2kP0sy48qu9k1a1
	a/l9yyqY2paIkozYGuUBca1OTvxK8JPz91Y6ESI33ZHb9d4k8pM4xn9tMv0X629qUcWRdyTAF5P
	hn6xu7O8kLZdCfKNo0GbqNfLz5T5TrsTVZ2PGU4yUmOPc0mc+InvcXGrB65dj9QHp5SWt2wKDJB
	+g9yOoPdkQNSG0b4YXtm8Y1KVjulqYiTvhpYRw==
X-Received: by 2002:a2e:a983:0:b0:383:24fe:4e9e with SMTP id
 38308e7fff4ca-38384cc5b00mr76474191fa.5.1768985810512; Wed, 21 Jan 2026
 00:56:50 -0800 (PST)
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
Date: Wed, 21 Jan 2026 09:56:39 +0100
X-Gm-Features: AZwV_QhIPQb_pUH6DY8VsbzNRzAX3X5gI5dg34dWlkn41exSg2sX1xCb9JmPXas
Message-ID: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
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

This particular issue is not due to the compiler not knowing about
fs/gs overlap (if the compiler determines that write and read are to
the same non-volatile address, it would simply remove both, load and
store), but due to the compiler performing load hoisting and store
sinking from the loop. The compiler considers these two addresses as
two different addresses (they are also defined in two different named
address spaces), and optimizes access to them. So, without barrier(),
it simply loads the value from A20_TEST_ADDR and A20_TEST_ADDR+0x10
before the loop, resulting in:

  9:   65 8b 0d 00 02 00 00    mov    %gs:0x200,%ecx
 ...
 16:   64 8b 35 10 02 00 00    mov    %fs:0x210,%esi
 ...
 28:   83 ea 01                sub    $0x1,%edx
 2b:   74 0a                   je     37 <a20_test_ref+0x37>
 2d:   e6 80                   out    %al,$0x80
 2f:   89 d9                   mov    %ebx,%ecx
 31:   29 d1                   sub    %edx,%ecx
 33:   39 ce                   cmp    %ecx,%esi
 35:   74 f1                   je     28 <a20_test_ref+0x28>

The solution with barrier() introduces memory clobber between store
and load, so the compiler is now forced to load and store the values
due to the side effects of the barrier() inbetween. This kind of
works, but is just a workaround for what really happens. In reality,
the value at the test address changes "behind the compiler back", IOW
- variable=E2=80=99s value can change in ways the compiler cannot predict.

My proposal is to use a volatile pointer to an absolute address, so
the unwanted optimizations are suppressed. The generated code is the
same as with barrier(), but now the code tells the compiler that every
read and write to this address must happen exactly as written in the
source code. Before your patch, the accessors were defined with
volatile asm, and this is the place where volatile qualifier matters.
So, my proposed code would read:

#define A20_TEST_ADDR    (4*0x80)

#define A20_TEST_GS (*(volatile __seg_gs u32 *)A20_TEST_ADDR)
#define A20_TEST_FS (*(volatile __seg_fs u32 *)(A20_TEST_ADDR+0x10))

static int a20_test(int loops)
{
    int saved, ctr;

    set_fs(0xffff);

    saved =3D ctr =3D A20_TEST_GS;

    do {
        A20_TEST_GS =3D ++ctr;
        io_delay();    /* Make constant delay */
        if (A20_TEST_FS !=3D ctr)
            break;
    } while (--loops);

    A20_TEST_GS =3D saved;
    return loops;
}

BR,
Uros.
