Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91F3C0083
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988467; cv=pass; b=gDNct4DJQVsFtNywjGr/zXc+iGAn7HTpFuqMzLoKWeVDB1lLsH/A8y5y9r+Pv/zlG4eXRY18PJUCwGMeS5r3Un77G/wzlhNhsZ4YRwG9W0tyAtSE8vLOW6+Y1k47QHQnz4e6iWfP3M0okOWvB3obQs+kMrpPPJY6tZgvhrmyvOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988467; c=relaxed/simple;
	bh=VpIwe/CQLKvWS2zi91j3u2Xg+rTb0WMsOyNWy715vt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeyy2CfmH+7Imk9/cXVA8O7U8Jl1E+D45LDYsImSMuT0lj2grBhBxeHQTGUPUJNyhkjw+GoY7ErMWBUGRj0fSWxubxSRcGJ+vbaLZ3aHcMWwgtMrrjXzGsJTNtkCrci7GPZHKYCqPl7b25nf0LUnM4iDYwK/Cg4Tj+6TLEoiBKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3zgwTQc; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3zgwTQc"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38320cd563aso10431561fa.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 01:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988463; cv=none;
        d=google.com; s=arc-20240605;
        b=j3WNl9j2vKkSxthM3R0G2CsLuctLN6SR2ph+jxKW1DxiYsSfE/IbbNYOvWZ+AtfDmK
         qdcEOSRVjMBsSxlsUsR60dcZicrCovUzWCvgS+f5GfjESOig462mnGW2B05BEm580o+E
         mWz4AlrnbSbb8Mdy/RjWbJ0rLVc4ijWueZyqduIKcmoiE5D8QEOlfmO1accy880On09p
         uYR3BxjELYHdLEjP+bvG0XMaU4lGfEd8/oGNYkn1mimyoJ4yporFJw3GErJWv+maE8Ly
         JT9SmacanaktYlk/hTOa5NbQkEz81FgvnxTgKZvnE+VLWCgiO44CuVoHbstNBKdRCOgL
         byYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AZDCEPFtSgAx+SG66A2Sxj0xadjOlB1ZHnC3zfd4byY=;
        fh=n2aeKmPhN/U5G0KObwNWB5h6LgZRTTa1ppYzg/NvfIE=;
        b=ZL1oQxKhYliO0Wsv8cfV04Z0Ybqf0vf0BbhUnl4zdadCJuAVb9Fd6arDWHlnFSRa3r
         T2nM8fTC1ueShpe+7FXSN4rQiiAZMa4pl83EWAICF0uwdmweKYgqsrZr6Qg2dlCZGVC1
         ToeMNjqE9CksFiOVR21hBUDPPPv6HOoRuujZNjT/z/YMwjWE+OrLXzSWnLHQvLXAHgWR
         CfHkYknICsRczG+Khv43uKq6QZYs9wtlpPjaaleXRx5A80cHZj5DjueykLKWNy1lt4cl
         3xAX2VnuhgNMCOb51iQ0eSw+UJOy4ya30nf0m4mP4SfsVPSD4uqPe3VABd+7UQQ9Ug8M
         tXaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768988463; x=1769593263; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZDCEPFtSgAx+SG66A2Sxj0xadjOlB1ZHnC3zfd4byY=;
        b=g3zgwTQcqs6V8IGY3qbQebuAgJoEcjpJcPkQbI34/bNQJk0IhRYedJye6SomG1fjWt
         /4tg3Bfw3KQK8dtyMLkXiCpqtenBkiBdo6oZGhI1V4wtYMB5744gOhEZ1qRPyp43OXqW
         NiQVtn27TgJpj5YasHvdbZIOB1/8q6GAxPhrgc2bAYUxgbdyEqdQgO1hswXtKAkMXXfg
         2S2/oRH3gzpErBV0zkVqlcvvyaxiUE54SoqeAH2nltOSwWh6UHbCVXow9uNBhgVuu/zC
         Q9+71r09tBgimJYVndtrbI69lEYvQJ1cuvxjiqY3CYclv0TwLR3koUNNq8py25Yv3qbT
         p0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988463; x=1769593263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZDCEPFtSgAx+SG66A2Sxj0xadjOlB1ZHnC3zfd4byY=;
        b=mLAz1ZJi2n+UuyHbbG+9AIO2Bg+ctz5L/iTc3KoKSWwgiug+ri9aKmQh1HdqYDj6fD
         lEGU95xQOMqVziBwE5hdmHgix3D9cWIp/PiCe7ikdNu8LMLzbJlM31PG2tb+leO31nzq
         vrRUbLkiQ56ICf7jqXMCOiTuN/SVdw+E/J5i7yRKyAdaJ71T6iHd8yiIz0cgL0EouhJz
         E5LxEmoN6eB4FWNxP5jARgrpcwWw2i9XAVcucgMQA+RgBlF602Y5mXaZU3cSCNKPNged
         JjQEaV/Sn2iVrATIMWYkHd/jl/k3Hf+bC7IUMEHQqKLMagSznFRMg/pyCzXb76jC9nc2
         HPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUViYtYdfwC3BY/7bOUIsfxUgzy3zKbrG/gFW/gIUO7r3KiekRupdI4wPBS0/wS+CbsbTOtpx/UhYek@lists.linux.dev
X-Gm-Message-State: AOJu0Yylg0KMuGuc0LY0g3VyVKEngfsFjBinBiQMxXZgu+ApXzOiswy7
	Dx2fJarUd/i0rUyaAfDgCAM1r2SPU8CLTBYSTgpIBsD5UjGLWOuosXn29EIK5A/5PqL4VkA2lOm
	/DzOabYo8KM8RSKOCJPFd0Kk6cEoz65kRNnB1u7c=
X-Gm-Gg: AZuq6aJPkoJHcP9yk2tPmkwkup3HDu3tSuz8Z/EJwoNZHJkwoeXRbora7OO4YSmMA6o
	hwGb1rndlKbfvGYIIm7U5rfx7Yv9sbuV+xmdXE2fQRvpVluaWDmiNbP+8CX5MjHVOA1Wr158o2R
	d7HZVEG0rxdeYW/yYQKnBAu1D7kNvFKNDgxYmshy7VM+mW3ZBYwUMmK9fkrM00x7P0JFiVmknb3
	NRm0+EZx14vg8P1eV3wZlnW5JNcRT7XfQhaWMuK6JdTCoq3UD678SZK6MmBYvG9vQl3aH/7BPbx
	OgESWLXokK8kjvQJYb0kmhgJJma9QxkqjrM/cg==
X-Received: by 2002:a05:651c:19a1:b0:383:1cd4:db8c with SMTP id
 38308e7fff4ca-383842f5f8bmr70375811fa.33.1768988462866; Wed, 21 Jan 2026
 01:41:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-12-hpa@zytor.com> <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
In-Reply-To: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 10:40:50 +0100
X-Gm-Features: AZwV_QjIbmYczWWD87ZMwZKdJ7nxfuzPXc318tIIzZ5uurqspu1pXYYR2bdsFF0
Message-ID: <CAFULd4aFmHPUH4p4Up6+7ph95hcHxbJc87w7KDS23D6SKK7jUQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/14] x86/boot: use __seg_fs and __seg_gs in the
 real-mode boot code
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: multipart/mixed; boundary="000000000000f1083a0648e2b892"

--000000000000f1083a0648e2b892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 9:56=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wr=
ote:
> >
> > All supported versions of gcc support __seg_fs and __seg_gs now.
> > All supported versions of clang support __seg_fs and __seg_gs too,
> > except for two bugs (as of clang 21, at least):
> >
> > 1. The %fs: and %gs: prefix does not get emitted in inline assembly.
> > 2. An internal compiler error when addressing symbols directly.
> >
> > However, none of these are required in the boot code. Furthermore,
> > this makes it possible to remove the absolute_pointer() hack in the
> > fs/gs access functions.
> >
> > This requires adding a barrier() to a20.c, to prevent the compiler
> > from eliding the load from the aliased memory address.
> >
> > Remove the unused memcmp_[fg]s() functions.
> >
> > Finally, ds() is by necessity constant, so mark the function as such.
> >
> > Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> > ---
> >  arch/x86/boot/a20.c  |  1 +
> >  arch/x86/boot/boot.h | 81 ++++++++++++++------------------------------
> >  2 files changed, 27 insertions(+), 55 deletions(-)
> >
> > diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
> > index 3ab6cd8eaa31..52c3fccdcb70 100644
> > --- a/arch/x86/boot/a20.c
> > +++ b/arch/x86/boot/a20.c
> > @@ -63,6 +63,7 @@ static int a20_test(int loops)
> >         while (loops--) {
> >                 wrgs32(++ctr, A20_TEST_ADDR);
> >                 io_delay();     /* Serialize and make delay constant */
> > +               barrier();      /* Compiler won't know about fs/gs over=
lap */
> >                 ok =3D rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
> >                 if (ok)
> >                         break;
>
> This particular issue is not due to the compiler not knowing about
> fs/gs overlap (if the compiler determines that write and read are to
> the same non-volatile address, it would simply remove both, load and
> store), but due to the compiler performing load hoisting and store
> sinking from the loop. The compiler considers these two addresses as
> two different addresses (they are also defined in two different named
> address spaces), and optimizes access to them. So, without barrier(),
> it simply loads the value from A20_TEST_ADDR and A20_TEST_ADDR+0x10
> before the loop, resulting in:
>
>   9:   65 8b 0d 00 02 00 00    mov    %gs:0x200,%ecx
>  ...
>  16:   64 8b 35 10 02 00 00    mov    %fs:0x210,%esi
>  ...
>  28:   83 ea 01                sub    $0x1,%edx
>  2b:   74 0a                   je     37 <a20_test_ref+0x37>
>  2d:   e6 80                   out    %al,$0x80
>  2f:   89 d9                   mov    %ebx,%ecx
>  31:   29 d1                   sub    %edx,%ecx
>  33:   39 ce                   cmp    %ecx,%esi
>  35:   74 f1                   je     28 <a20_test_ref+0x28>
>
> The solution with barrier() introduces memory clobber between store
> and load, so the compiler is now forced to load and store the values
> due to the side effects of the barrier() inbetween. This kind of
> works, but is just a workaround for what really happens. In reality,
> the value at the test address changes "behind the compiler back", IOW
> - variable=E2=80=99s value can change in ways the compiler cannot predict=
.
>
> My proposal is to use a volatile pointer to an absolute address, so
> the unwanted optimizations are suppressed. The generated code is the
> same as with barrier(), but now the code tells the compiler that every
> read and write to this address must happen exactly as written in the
> source code. Before your patch, the accessors were defined with
> volatile asm, and this is the place where volatile qualifier matters.
> So, my proposed code would read:
>
> #define A20_TEST_ADDR    (4*0x80)
>
> #define A20_TEST_GS (*(volatile __seg_gs u32 *)A20_TEST_ADDR)
> #define A20_TEST_FS (*(volatile __seg_fs u32 *)(A20_TEST_ADDR+0x10))
>
> static int a20_test(int loops)
> {
>     int saved, ctr;
>
>     set_fs(0xffff);
>
>     saved =3D ctr =3D A20_TEST_GS;
>
>     do {
>         A20_TEST_GS =3D ++ctr;
>         io_delay();    /* Make constant delay */
>         if (A20_TEST_FS !=3D ctr)
>             break;
>     } while (--loops);
>
>     A20_TEST_GS =3D saved;
>     return loops;
> }

Now also in the form of the attached patch vs. yout git hpa/boot2
branch, tested with gcc-15.2.1 and clang-21.1.8.

BR,
Uros.

--000000000000f1083a0648e2b892
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mkntf9f90>
X-Attachment-Id: f_mkntf9f90

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvYTIwLmMgYi9hcmNoL3g4Ni9ib290L2EyMC5jCmlu
ZGV4IDM4YTFjYWQ4YTU1My4uZmY1MWIwY2U0ZGZkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9ib290
L2EyMC5jCisrKyBiL2FyY2gveDg2L2Jvb3QvYTIwLmMKQEAgLTQ4LDggKzQ4LDkgQEAgc3RhdGlj
IGludCBlbXB0eV84MDQyKHZvaWQpCiAgICB1c2VkIGFzIGEgdGVzdCBpcyB0aGUgaW50ICQweDgw
IHZlY3Rvciwgd2hpY2ggc2hvdWxkIGJlIHNhZmUuICovCiAKICNkZWZpbmUgQTIwX1RFU1RfQURE
UgkoNCoweDgwKQotI2RlZmluZSBBMjBfVEVTVF9TSE9SVCAgMzIKLSNkZWZpbmUgQTIwX1RFU1Rf
TE9ORwkyMDk3MTUyCS8qIDJeMjEgKi8KKworI2RlZmluZSBBMjBfVEVTVF9HUyAoKih2b2xhdGls
ZSBfX3NlZ19ncyB1MzIgKilBMjBfVEVTVF9BRERSKQorI2RlZmluZSBBMjBfVEVTVF9GUyAoKih2
b2xhdGlsZSBfX3NlZ19mcyB1MzIgKikoQTIwX1RFU1RfQUREUisweDEwKSkKIAogc3RhdGljIGlu
dCBhMjBfdGVzdChpbnQgbG9vcHMpCiB7CkBAIC01NywyMCArNTgsMjIgQEAgc3RhdGljIGludCBh
MjBfdGVzdChpbnQgbG9vcHMpCiAKIAlzZXRfZnMoMHhmZmZmKTsKIAotCXNhdmVkID0gY3RyID0g
cmRnczMyKEEyMF9URVNUX0FERFIpOworCXNhdmVkID0gY3RyID0gQTIwX1RFU1RfR1M7CiAKIAlk
byB7Ci0JCXdyZ3MzMigrK2N0ciwgQTIwX1RFU1RfQUREUik7Ci0JCWlvX2RlbGF5KCk7CS8qIFNl
cmlhbGl6ZSBhbmQgbWFrZSBkZWxheSBjb25zdGFudCAqLwotCQliYXJyaWVyKCk7CS8qIENvbXBp
bGVyIHdvbid0IGtub3cgYWJvdXQgZnMvZ3Mgb3ZlcmxhcCAqLwotCQlpZiAocmRmczMyKEEyMF9U
RVNUX0FERFIrMHgxMCkgIT0gY3RyKQorCQlBMjBfVEVTVF9HUyA9ICsrY3RyOworCQlpb19kZWxh
eSgpOwkvKiBNYWtlIGNvbnN0YW50IGRlbGF5ICovCisJCWlmIChBMjBfVEVTVF9GUyAhPSBjdHIp
CiAJCQlicmVhazsKIAl9IHdoaWxlICgtLWxvb3BzKTsKIAotCXdyZ3MzMihzYXZlZCwgQTIwX1RF
U1RfQUREUik7CisJQTIwX1RFU1RfR1MgPSBzYXZlZDsKIAlyZXR1cm4gbG9vcHM7CiB9CiAKKyNk
ZWZpbmUgQTIwX1RFU1RfU0hPUlQgIDMyCisjZGVmaW5lIEEyMF9URVNUX0xPTkcJMjA5NzE1Mgkv
KiAyXjIxICovCisKIC8qIFF1aWNrIHRlc3QgdG8gc2VlIGlmIEEyMCBpcyBhbHJlYWR5IGVuYWJs
ZWQgKi8KIHN0YXRpYyBpbnQgYTIwX3Rlc3Rfc2hvcnQodm9pZCkKIHsK
--000000000000f1083a0648e2b892--
