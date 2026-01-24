Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DB1A275
	for <linux-coco@lists.linux.dev>; Sat, 24 Jan 2026 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769298634; cv=none; b=Ay5S7hUux85MC369BMQjRncCb94oQp2gFuLvF+8vWGak1Ez084yI3JSdRbolBCzy3VC7HXWzxvlM523o35Wzquibc6+FabGwj8gU9Lkj3j6IVLVcINQPbsM/AEJ9HVAWQ3s/qotMGa5FYcVv2V3NgQ6FR9jkmUmTWPQZhNFId/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769298634; c=relaxed/simple;
	bh=jQJ+DmEwZIHiVdra1XscjqRFeO07sVVWfZRod1d2OgA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ceNqZ+0l+SQw5l0cfzO8cA/vCyob345kN/0s1clm0y1JDTuzhsyC+ryYMpeLnFiqqheDcrpgNNHWDIaUwrStf8lG6WrqIGUALZDDyCuk3+5Sf1ynqGlECJAJ/IqGBi1GOeUDeh9ojDU10wc0UE4Z1hAp+xkTqSE7nV+oGd1RQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=g/Ecj1sN; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="g/Ecj1sN"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60ONeosd2203461
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 24 Jan 2026 15:40:51 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60ONeosd2203461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769298053;
	bh=J5lSX7Gl219//MFEq3UIC0LRkA9Gw/LIxa+cv4x6pis=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=g/Ecj1sNdpSlJP2png+1PyWAYxnJeUsut7L7SNWQU5cA/nVi6nkUhwouKtnsClu6a
	 zM/Q29pmJHrGolAbfVbUCAVq/vVY5XieCde4vmgWlr/YKaB3xYTbiNaHhGIetpObHq
	 3/ITQHAVlegM50QqZPwuvEnqMkUg1m0COpFmBxxqxKrKeKZAkeGLd9316ib2AXO6Mq
	 Mt3+5nwhC5kbMYUJ3aseHbe+rAGwUCQ0lYdW4NUkAwFahhghOsHUrerfAKftvC+XbD
	 HNFm0Uxh8lGzJ7pLemANYTGbTEjx1LT2zRyx4r0CRPAtJFbdIgLhMhv9qrsUVE7bTH
	 TFPVkzITJXTYQ==
Date: Sat, 24 Jan 2026 15:40:44 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
        x86@kernel.org
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code generation
User-Agent: K-9 Mail for Android
In-Reply-To: <48826D19-02E6-49D9-941C-C5C374CD1524@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com> <20260120195407.1163051-13-hpa@zytor.com> <20260121114911.6adc2838@pumpkin> <alpine.DEB.2.21.2601240244460.6421@angie.orcam.me.uk> <981124b5-040e-400b-9912-15a65fdfdfdd@zytor.com> <20260124230741.2b94b14c@pumpkin> <48826D19-02E6-49D9-941C-C5C374CD1524@zytor.com>
Message-ID: <60A7475A-6C11-4070-9044-C6A64CCB4337@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 24, 2026 3:16:18 PM PST, "H=2E Peter Anvin" <hpa@zytor=2Ecom> wr=
ote:
>On January 24, 2026 3:07:41 PM PST, David Laight <david=2Elaight=2Elinux@=
gmail=2Ecom> wrote:
>>On Fri, 23 Jan 2026 20:24:55 -0800
>>"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>>
>>> On 2026-01-23 19:00, Maciej W=2E Rozycki wrote:
>>> > On Wed, 21 Jan 2026, David Laight wrote:
>>> >  =20
>>> >> No loops needed=2E =20
>>> >=20
>>> >  A loop is needed because there can be a considerable delay from iss=
uing=20
>>> > the I/O request to flip the A20 gate till the circuitry responding=
=2E  This=20
>>> > is particularly true with the command issued to the 8042 device, whi=
ch is=20
>>> > a microcontroller running its own firmware that needs it time to pro=
cess=20
>>> > an incoming request to drive one of the microcontroller's GPIOs=2E  =
There=20
>>> > was a reason for port 0x92 circuitry later added to the PC architect=
ure=20
>>> > with the IBM PS/2 being called the "fast A20 gate"=2E
>>> >  =20
>>>=20
>>> Indeed=2E I thought I had responded to this already but I hadn't, appa=
rently=2E
>>>=20
>>> Note that the "long" delay is 2^21 loops! That number wasn't taken out=
 of the
>>> air, either; we found machines that actually needed that many iteratio=
ns=2E
>>
>>Ok, so you need a loop because it might take ages for the value read fro=
m
>>0x1000200 to change=2E
>>But there is no need to keep changing the value=2E
>>The comments in the code don't really stress that=2E
>>
>>> In the case where A20 is enabled already, the loop terminates on eithe=
r the
>>> first or second iteration (the second iteration is when the value at 0=
x1000200
>>> is exactly 1 higher than the value at 0x200=2E
>>>=20
>>> Modern machines (Nehalem+) already have A20 enabled, and most machines=
 of the
>>> i686+ generation implement int 0x15 function 0x2401=2E
>>
>>I know some of the history=2E
>>And just read some more of the gory details=2E=2E=2E
>>
>>A20 being disabled is there to make a 286 compatible with the older 8086=
 PCs
>>and any software that relied on address wrapping (rather than using it t=
o get
>>an extra ~64kB in real mode)=2E
>>That would be for dos and win 3=2E11=2E=2E=2E
>>
>>The only 8088 and 286 cpu I used were on IO cards=2E
>>
>>>=20
>>> 	-hpa
>>>=20
>>
>
>No, there is a reason to keep changing the value: you have no idea what i=
s currently stored in that memory, *and you have no way of knowing*=2E
>
>Whatever value you write might purely accidentally be the value that alre=
ady is stored at that memory location=2E
The other thing about this code is that performance is irrelevant =E2=80=
=93 it is a busy wait loop! =E2=80=93 but consistency (hence the io_delay) =
and code size matter=2E
