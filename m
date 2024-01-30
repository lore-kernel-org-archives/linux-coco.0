Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF614E2C2
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706636971; cv=none; b=TYoiPBErLCjuUWZM0gGPkmej90MHq11u6L98WMRsN1XfiC8ZdC8p4qDBaTnVK7M7A6ph7PZ4rsta59W19LU86kPGNitKBm104etQAzqkF4Xj4r72yg3KQ3fhUnkEAoudan7eJl5UJc4tBymN65kOVy3ZdnJBOE9hCAxSJSiAge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706636971; c=relaxed/simple;
	bh=uUolOJPs7PcsSO8pX6bnVtt9RGczJbbnLYDex4l5IPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XECx4Lkt0mlEGAV3T6S9T4jFLcUbyw/3ret4uWt0pXrPKCWsIMmIwgq5l9FpBvsoNmYLf5oFV1jDuJEe5GUD9TNJWSWu9kCFe8VO7g4OKeuI9N+1CG7l2DVmGySuXrJ/6GpUc7BE4YokvmJ0heOkjNeK6MRNbPmuA25X6SeL7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=QLns9Msc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QLns9Msc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C168EC433F1
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 17:49:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QLns9Msc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706636969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Knx9g79k0rFxrK4L1nPhOd7Un1aev4/x+NEZ8GHY+I=;
	b=QLns9MscGQmVoACuv2uspShTKMDkajWEaBYNs7p7q2oZqi1c0G9FrVagelZnN2eaaVlvfv
	bPyriKjNW/AW8xUs3jOXFETzY0+3w2jBRclQTQUoUt7UILIR9l1PbE+bcb3LOvR/7St2AI
	x4oiShZ71ZgI+Cy/z5LWZTD4oo43xgU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16f6e1c8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 17:49:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-602c714bdbeso411557b3.1
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 09:49:28 -0800 (PST)
X-Gm-Message-State: AOJu0YyujGzwDD2xNFTv27Ml5+w9pHuuQ74QIsQA+DEfRHoozi/DDlmr
	ZbaLpM6xo57vZT65JfrtbuKmko7i9R7afYbzk1oRLSJx9F+MwOXyOFN3fV3HmNRj/n+FwpNWEIU
	kydP6YkJ3tfOmgwXo/ShIFOM1h+o=
X-Google-Smtp-Source: AGHT+IEkQ6Cnv5sCPYflR4LrOtKu6FC4QUWbNjKBLu9x86naZqJGBC0K6T9RRaFbxh0uBfSBOld/mcfsb/7Wot5OKTo=
X-Received: by 2002:a81:b544:0:b0:5ff:9565:6f59 with SMTP id
 c4-20020a81b544000000b005ff95656f59mr1254324ywk.3.1706636967028; Tue, 30 Jan
 2024 09:49:27 -0800 (PST)
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
 <88a72370-e300-4bbc-8077-acd1cc831fe7@intel.com>
In-Reply-To: <88a72370-e300-4bbc-8077-acd1cc831fe7@intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 18:49:15 +0100
X-Gmail-Original-Message-ID: <CAHmME9oSQbd3V8+qR0e9oPb7ppO=E7GrCW-a2RN8QNdY_ARbSQ@mail.gmail.com>
Message-ID: <CAHmME9oSQbd3V8+qR0e9oPb7ppO=E7GrCW-a2RN8QNdY_ARbSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/random: Issue a warning if RDRAND or RDSEED fails
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, 
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

On Tue, Jan 30, 2024 at 6:32=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 1/30/24 05:45, Reshetova, Elena wrote:
> >> You're the Intel employee so you can find out about this with much
> >> more assurance than me, but I understand the sentence above to be _way
> >> more_ true for RDRAND than for RDSEED. If your informed opinion is,
> >> "RDRAND failing can only be due to totally broken hardware"
> > No, this is not the case per Intel SDM. I think we can live under a sim=
ple
> > assumption that both of these instructions can fail not just due to bro=
ken
> > HW, but also due to enough pressure put into the whole DRBG constructio=
n
> > that supplies random numbers via RDRAND/RDSEED.
>
> I don't think the SDM is the right thing to look at for guidance here.
>
> Despite the SDM allowing it, we (software) need RDRAND/RDSEED failures
> to be exceedingly rare by design.  If they're not, we're going to get
> our trusty torches and pitchforks and go after the folks who built the
> broken hardware.
>
> Repeat after me:
>
>         Regular RDRAND/RDSEED failures only occur on broken hardware
>
> If it's nice hardware that's gone bad, then we WARN() and try to make
> the best of it.  If it turns out that WARN() was because of a broken
> hardware _design_ then we go sharpen the pitchforks.
>
> Anybody disagree?

Yes, I disagree. I made a trivial test that shows RDSEED breaks easily
in a busy loop. So at the very least, your statement holds true only
for RDRAND.

But, anyway, if the statement "RDRAND failures only occur on broken
hardware" is true, then a WARN() in the failure path there presents no
DoS potential of any kind, and so that's a straightforward conclusion
to this discussion. However, that really hinges on  "RDRAND failures
only occur on broken hardware" being a true statement.

Also, I don't know how much heavy lifting the word "regular" was doing
in your original statement. Because my example shows that that
irregular RDSEED usage from malicious users can hinder regular users.
If that also applies to RDRAND, the "regular" makes the statement not
as useful for taking conclusive action here.
