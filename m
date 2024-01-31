Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D167AE7C
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706706392; cv=none; b=kkAGuET7oXKP/Vn1cHATMx8SFHTQ0Vfpwb+SIKKgsDhWiYwMFOQaG7a27se0V/MsLvjZ2yPmKGBpN9ZSAE6TEP3LQ9wjMsnlRzhLYBGphzjXCiL9HRPcopd0dt+ek4rBP/vLJ11u4gMNj4d9oUhbTjCwDDMfivY/1yTnPWGNU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706706392; c=relaxed/simple;
	bh=JMBL4IgJh6FN7pNaSkp+l1vIL/LpjvsQZz9Cc9BlkHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWTgWkFhX8Eh2roVBmWlm5Q+OfoyZoGegRv13n/+Rp8Zq1V//xvFB9L7nLd0UnAu4CTYYOgYlrssUkRvta8/L7uQxoIgObBjYICiABmPMBPPjW1R0dR0auVHEKp8SqiPyn3+XpM0UlI6Dbz6KRtT2HNyeJAu+1cfwJGhIwJ2Foc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=S/KhLrMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="S/KhLrMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04E1C43390
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 13:06:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="S/KhLrMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706706387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMBL4IgJh6FN7pNaSkp+l1vIL/LpjvsQZz9Cc9BlkHY=;
	b=S/KhLrMcZXz9d8cswaZ09ypkUDyHrDczczH0oWxpLRDNdvNYObLxIlqHNHIjQgjnQ5P8lT
	dsxvdTDHKBXOsv6jqQauHHYPxi8m1VU7OIq71YHvhJ5ZAFb1WT3gIkz3JChTTW5rkR4H0X
	GmtG2pK6O0UYp4SpoBaJXMrSjCNpCmw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8efdac1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 31 Jan 2024 13:06:27 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed179f0faso675054276.1
        for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 05:06:27 -0800 (PST)
X-Gm-Message-State: AOJu0YwZcZqCHHEu3r+zWdjHWjzGOdHFW619X/qaSA+wHCoQVbRPaXrB
	KtbrWz2Lybpjp4XG9k6Td92YQCRFgavqAleGEDj5kGTXkynw1/DwhxYw6Qkv4hXFln5O+Bk84MD
	eVHrIlx1dmqPxQSJ4kDB1LKEBBGw=
X-Google-Smtp-Source: AGHT+IECjO87DEo81/cO9y6afveELLDn162ICBU2lZW6q6aRJGKBPIWUj+HGRiv/ZvxBvvVPJiC2HvUdgBQDISUTJZw=
X-Received: by 2002:a05:690c:d17:b0:5ff:8ab2:89a7 with SMTP id
 cn23-20020a05690c0d1700b005ff8ab289a7mr2802145ywb.4.1706706385220; Wed, 31
 Jan 2024 05:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
 <20240130083007.1876787-2-kirill.shutemov@linux.intel.com>
 <CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuOp1CrHzRA@mail.gmail.com>
 <DM8PR11MB57507611D651E6D7CBC2A2F3E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <88a72370-e300-4bbc-8077-acd1cc831fe7@intel.com> <CAHmME9oSQbd3V8+qR0e9oPb7ppO=E7GrCW-a2RN8QNdY_ARbSQ@mail.gmail.com>
 <Zbk6h0ogqeInLa_1@redhat.com> <DM8PR11MB575052B985CA97B29A443F9AE77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB575052B985CA97B29A443F9AE77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 31 Jan 2024 14:06:13 +0100
X-Gmail-Original-Message-ID: <CAHmME9ps6W5snQrYeNVMFgfhMKFKciky=-UxxGFbAx_RrxSHoA@mail.gmail.com>
Message-ID: <CAHmME9ps6W5snQrYeNVMFgfhMKFKciky=-UxxGFbAx_RrxSHoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/random: Issue a warning if RDRAND or RDSEED fails
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kalra, Ashish" <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:17=E2=80=AFAM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
> This matches both my understanding (I do have cryptography background
> and understanding how cryptographic RNGs work)
> and official public docs that Intel published on this matter.
> Given that the physical entropy source is limited anyhow, and by giving
> enough pressure on the whole construction you should be able to
> make RDRAND fail because if the intermediate AES-CBC MAC extractor/
> conditioner is not getting its min entropy input rate, it wont
> produce a proper seed for AES CTR DRBG.
> Of course exact details/numbers can wary between different generations of
> Intel DRNG implementation, and the platforms where it is running on,
> so be careful to sticking to concrete numbers.

Alright, so RDRAND is not reliable. The question for us now is: do we
want RDRAND unreliability to translate to another form of
unreliability elsewhere, e.g. DoS/infiniteloop/latency/WARN_ON()? Or
would it be better to declare the hardware simply broken and ask Intel
to fix it? (I don't know the answer to that question.)

> That said, I have taken an AR to follow up internally on what can be done
> to improve our situation with RDRAND/RDSEED.

Specifying this is an interesting question. What exactly might our
requirements be for a "non-broken" RDRAND? It seems like we have two
basic ones:

- One VMX (or host) context can't DoS another one.
- Ring 3 can't DoS ring 0.

I don't know whether that'd be implemented with context-tied rate
limiting or more state or what. But I think, short of just making
RDRAND never fail, that's basically what's needed.

Jason
