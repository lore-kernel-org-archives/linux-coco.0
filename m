Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901D84A5A
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724080; cv=none; b=TzLfTnuDqjn0/iW0Nlr2DyW8GCRDYj1+eOKUhEd/BcyBBUuvEFntK/AfPpzSZkYdNywcZwhMvi9+FoOMuRawWiWoB98nEC++2N/7nRWvqVZVvxc72X6xKTHF3tXPiibZKoIXSPkTm0vM6dmm9yELhCNJ+N8x4qEm0Z9v0KxadeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724080; c=relaxed/simple;
	bh=0eUhMLf/lXtw7fi1pCpvMFRFl8v2u9bNlXmr0OzY3oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYYjOchwu9021x4d6nPVZlBllnWCBWaw3fU6GhqUUbPLyReLG+J5dqeC6YVUHWSNxIiHbTFYrFwnpV/8QMoaLAXKbujIIgLHBG/rYK/98914z23Oo5VEgEqol9dTCmgLUxLrO4z4HQVz0vJ/2ukvP7Su9exNRe5etrMgWnzXRnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=FEW3EsS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FEW3EsS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F05C43399
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 18:01:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FEW3EsS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706724076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQyfAdKdvX1lwYuR2vTRqcxLDSiXD9PMYkYaLeRDE7o=;
	b=FEW3EsS7wgJn8hINs3SojRH2rRwpEr3WURmVVC2d4RV5CGPBKqROdOkAaaBF7ZSeGC4bJS
	vOTsrVYIaAIvMEMFIMfOQR/ohjD+oflDm4BCRKASkxshAy5y+r4rChDsyTKFF2o3nAm4dL
	8sdGoZRuPDr3QsR+Q9Y20VPiTHwjaaA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3049518 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 31 Jan 2024 18:01:15 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-603fdc46852so256957b3.2
        for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 10:01:15 -0800 (PST)
X-Gm-Message-State: AOJu0YxFPVZjQzicyaEsaAXX7Otk3l5TyvJ+Bt3TuOkGjcCCaURwXj+b
	p5DTFmnm0w++3mfkLx5EwkeMNxlLyrm73DJhUVyCb59330qPZUpNkYZThDNCI4Jmr4HT0foBVs2
	wzdl1wLl+AEc2UfT3o18Z/fODZg0=
X-Google-Smtp-Source: AGHT+IECgvymPYPkBj4ahRNxSJ8gXrf+Fk5HsL+Csr7gjSrW8v6jpyj42AckhAU/zkDK/q5b/VHwyUTKcVg0guebUt4=
X-Received: by 2002:a25:6a56:0:b0:dc2:a0d:f5f4 with SMTP id
 f83-20020a256a56000000b00dc20a0df5f4mr2261302ybc.7.1706724074376; Wed, 31 Jan
 2024 10:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHmME9pOt=uEmuBzBpgUHw9DqAD2FZTZ3v53AOZbQ3Cd2p97xQ@mail.gmail.com>
 <DM8PR11MB5750E38A8B2BCE66AF7F9812E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAHmME9qMO7=RDR60bKJvpDTRokcKed_i0+7BbFD53_7o2OJ6-g@mail.gmail.com>
 <CAHmME9rum4uwSNFd_GkD9p_+vN4DBxA=feZX7k9RvugFZsZNJg@mail.gmail.com>
 <DM8PR11MB5750797D0B9B8EB32740F55DE77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAHmME9oC=GE-7QS2m9FA5cs_ss+tQgB9Pj3tKnTtMMFpQmUshg@mail.gmail.com>
 <DM8PR11MB5750B861F7A105886AA5FCE4E77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAHmME9oJvbZgT4yT9Vydc2ZQVSo3Ea65G5aVK7gFxphkV00BnQ@mail.gmail.com>
 <20240131140756.GB2356784@mit.edu> <Zbpc8tppxuKr-hnN@zx2c4.com>
 <20240131171042.GA2371371@mit.edu> <DM8PR11MB5750C7D16DC566CD1329D5A5E77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5750C7D16DC566CD1329D5A5E77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 31 Jan 2024 19:01:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9q-eUXnXnpaDu0VOQemOYysst7SaJ-=b8-vCFP9h50Szg@mail.gmail.com>
Message-ID: <CAHmME9q-eUXnXnpaDu0VOQemOYysst7SaJ-=b8-vCFP9h50Szg@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kalra, Ashish" <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 6:37=E2=80=AFPM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
>
>
> > On Wed, Jan 31, 2024 at 03:45:06PM +0100, Jason A. Donenfeld wrote:
> > > On Wed, Jan 31, 2024 at 09:07:56AM -0500, Theodore Ts'o wrote:
> > > > What about simply treating boot-time initialization of the /dev/ran=
dom
> > > > state as special.  That is, on x86, if the hardware promises that
> > > > RDSEED or RDRAND is available, we use them to initialization our RN=
G
> > > > state at boot.  On bare metal, there can't be anyone else trying to
> > > > exhaust the on-chip RNG's entropy supply, so if RDSEED or RDRAND
> > > > aren't working available --- panic, since the hardware is clearly
> > > > busted.
> > >
> > > This is the first thing I suggested here:
> > https://lore.kernel.org/all/CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuO
> > p1CrHzRA@mail.gmail.com/
> > >
> > > But Elena found this dissatisfying because we still can't guarantee n=
ew
> > > material later.
> >
> > Right, but this is good enough that modulo in-kernel RNG state
> > compromise, or the ability to attack the underlying cryptographic
> > primitives (in which case we have much bigger vulnerabilities than
> > this largely theoretical one), even if we don't have new material
> > later, the in-kernel RNG for the CC VM should be sufficiently
> > trustworthy for government work.
>
> I agree, this is probably the best we can do at the moment.
> I did want to point out the runtime need of fresh entropy also, but
> as we discussed in this thread we might not be able to get it
> without introducing a DoS path for the userspace.
> In this case, it is the best to only loose the forward prediction propert=
y
> vs. the whole Linux RNG.

So if this is what we're congealing around, I guess we can:

0) Leave RDSEED alone and focus on RDRAND.
1) Add `WARN_ON_ONCE(in_early_boot);` to the failure path of RDRAND
(and simply hope this doesn't get exploited for guest-guest boot DoS).
2) Loop forever in RDRAND on CoCo VMs, post-boot, with the comments
and variable naming making it clear that this is a hardware bug
workaround, not a "feature" added for "extra security".
3) Complain loudly to Intel and get them to fix the hardware.

Though, a large part of me would really like to skip that step (2),
first because it's a pretty gross bandaid that adds lots of
complexity, and second because it'll make (3) less poignant.

Jason
