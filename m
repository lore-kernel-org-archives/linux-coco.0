Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3492EFDA4
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008484; cv=none; b=ADII18Dgwqu0KW4cluOvrnENcIN14fZNkpJ00eOYdwO4oael40aQU/rD9AGlEgJHRWUtX5bYRhsVLgQu8qjfbxZ4rZmH/Uqinn7b1pqzM2VOoN5XYMpOX72AwGYWiVkJBnOy5XOtGNAnGg78dPX2ibe9GQqAR6BiRXp3w3MOBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008484; c=relaxed/simple;
	bh=V4mws1ELGO+2X7x5lj2/6ok5vB1ZrD0GHTSPXOewVts=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=r3g/E/5e8aMfGkEBS4vHKHCV7wQrNnjFokPvdcOuDy/8MFY+m3sQbTzirQO7/Jqd/yoWofAXid3aKB5EPoLvllKCkBcGwoT6umthMMb/OVYJydZdx8vTkv/+6fomGvwFeBY4PbrpFaGnzrNog+xYebmiupOciFLwW3o9ATgHh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=AhHrzlle; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="AhHrzlle"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60LFDsmQ1684371
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 21 Jan 2026 07:13:54 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60LFDsmQ1684371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769008436;
	bh=IpXxBlbMz7rnEaLEX9aQUp1lKL2sUkRijnj4JyuWFIs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=AhHrzllexdfKs7blmJGt7Esoz6iLRF/gvGNZQ5T/TBpYYExy9KJs2oziBbT/cF9Lu
	 FGPOw1kie56s4kgQ5hqErO8WtOmUoP8YVJICUFeNuXzZ6zvQAsvx9Nn5IMD4AYlw9B
	 mZLLmZqR5DdmF/+CYOAiV6uXkWpnWqaqkfg/TWbL2jXgkKV07wbqYXSMeT6Swo6Lr8
	 c8edn3EPL0PwC/3QFoRguX/hU2i0GS/ypL7hIBhlXrVXXk6DptRJwivnrf+Z7Z2fqL
	 Ja0La8UiLc5BYRVKb+b7/Cx9/NZQNhQx+3FCOs7LpmZslSheeYlmTCosrzbw0RfBCj
	 Tr6bBAmC6rsWw==
Date: Wed, 21 Jan 2026 07:13:49 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
        x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_11/14=5D_x86/boot=3A_use_=5F=5Fseg=5F?=
 =?US-ASCII?Q?fs_and_=5F=5Fseg=5Fgs_in_the_real-mode_boot_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com> <20260120195407.1163051-12-hpa@zytor.com> <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
Message-ID: <4E5A81C0-1938-4FB0-A0ED-2CCF03B9C480@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 21, 2026 12:56:39 AM PST, Uros Bizjak <ubizjak@gmail=2Ecom> wrot=
e:
>On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=2Ecom=
> wrote:
>>
>> All supported versions of gcc support __seg_fs and __seg_gs now=2E
>> All supported versions of clang support __seg_fs and __seg_gs too,
>> except for two bugs (as of clang 21, at least):
>>
>> 1=2E The %fs: and %gs: prefix does not get emitted in inline assembly=
=2E
>> 2=2E An internal compiler error when addressing symbols directly=2E
>>
>> However, none of these are required in the boot code=2E Furthermore,
>> this makes it possible to remove the absolute_pointer() hack in the
>> fs/gs access functions=2E
>>
>> This requires adding a barrier() to a20=2Ec, to prevent the compiler
>> from eliding the load from the aliased memory address=2E
>>
>> Remove the unused memcmp_[fg]s() functions=2E
>>
>> Finally, ds() is by necessity constant, so mark the function as such=2E
>>
>> Signed-off-by: H=2E Peter Anvin (Intel) <hpa@zytor=2Ecom>
>> ---
>>  arch/x86/boot/a20=2Ec  |  1 +
>>  arch/x86/boot/boot=2Eh | 81 ++++++++++++++----------------------------=
--
>>  2 files changed, 27 insertions(+), 55 deletions(-)
>>
>> diff --git a/arch/x86/boot/a20=2Ec b/arch/x86/boot/a20=2Ec
>> index 3ab6cd8eaa31=2E=2E52c3fccdcb70 100644
>> --- a/arch/x86/boot/a20=2Ec
>> +++ b/arch/x86/boot/a20=2Ec
>> @@ -63,6 +63,7 @@ static int a20_test(int loops)
>>         while (loops--) {
>>                 wrgs32(++ctr, A20_TEST_ADDR);
>>                 io_delay();     /* Serialize and make delay constant */
>> +               barrier();      /* Compiler won't know about fs/gs over=
lap */
>>                 ok =3D rdfs32(A20_TEST_ADDR+0x10) ^ ctr;
>>                 if (ok)
>>                         break;
>
>This particular issue is not due to the compiler not knowing about
>fs/gs overlap (if the compiler determines that write and read are to
>the same non-volatile address, it would simply remove both, load and
>store), but due to the compiler performing load hoisting and store
>sinking from the loop=2E The compiler considers these two addresses as
>two different addresses (they are also defined in two different named
>address spaces), and optimizes access to them=2E So, without barrier(),
>it simply loads the value from A20_TEST_ADDR and A20_TEST_ADDR+0x10
>before the loop, resulting in:
>
>  9:   65 8b 0d 00 02 00 00    mov    %gs:0x200,%ecx
> =2E=2E=2E
> 16:   64 8b 35 10 02 00 00    mov    %fs:0x210,%esi
> =2E=2E=2E
> 28:   83 ea 01                sub    $0x1,%edx
> 2b:   74 0a                   je     37 <a20_test_ref+0x37>
> 2d:   e6 80                   out    %al,$0x80
> 2f:   89 d9                   mov    %ebx,%ecx
> 31:   29 d1                   sub    %edx,%ecx
> 33:   39 ce                   cmp    %ecx,%esi
> 35:   74 f1                   je     28 <a20_test_ref+0x28>
>
>The solution with barrier() introduces memory clobber between store
>and load, so the compiler is now forced to load and store the values
>due to the side effects of the barrier() inbetween=2E This kind of
>works, but is just a workaround for what really happens=2E In reality,
>the value at the test address changes "behind the compiler back", IOW
>- variable=E2=80=99s value can change in ways the compiler cannot predict=
=2E
>
>My proposal is to use a volatile pointer to an absolute address, so
>the unwanted optimizations are suppressed=2E The generated code is the
>same as with barrier(), but now the code tells the compiler that every
>read and write to this address must happen exactly as written in the
>source code=2E Before your patch, the accessors were defined with
>volatile asm, and this is the place where volatile qualifier matters=2E
>So, my proposed code would read:
>
>#define A20_TEST_ADDR    (4*0x80)
>
>#define A20_TEST_GS (*(volatile __seg_gs u32 *)A20_TEST_ADDR)
>#define A20_TEST_FS (*(volatile __seg_fs u32 *)(A20_TEST_ADDR+0x10))
>
>static int a20_test(int loops)
>{
>    int saved, ctr;
>
>    set_fs(0xffff);
>
>    saved =3D ctr =3D A20_TEST_GS;
>
>    do {
>        A20_TEST_GS =3D ++ctr;
>        io_delay();    /* Make constant delay */
>        if (A20_TEST_FS !=3D ctr)
>            break;
>    } while (--loops);
>
>    A20_TEST_GS =3D saved;
>    return loops;
>}
>
>BR,
>Uros=2E
>

I disagree with that being the preferred solution, and it isn't really the=
 Linux style=2E

Not only does it require making more changes to the macros, but the barrie=
r() construct is well established in Linux as the way to indicate that a me=
mory variable is subject to examination and/or modification by another syst=
em agent, while still being a memory variable=2E=20

It also generally produces better code=2E=20

So no, your analysis is, in my opinion, incorrect in light of the way the =
Linux memory model is already used=2E
