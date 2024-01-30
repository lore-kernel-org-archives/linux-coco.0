Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A06D1B1
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706623592; cv=none; b=hHb4gsRvfcZT6V5qUwkJWcYx+clzVtVnJVq1xDr2Cxk+O4n74MFs2HUnLvVEs1eTDUpBncsinhpsAk18uVGuUmLQyDmre91AThJmVXUzTEznUBW3eBYs0GnsvX3ckT5+YqwFbMpcOVd2EIIv1GC9yBM1+/o+n2QkFXx3WKGJLtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706623592; c=relaxed/simple;
	bh=rGPKHFYctFgJTSDAEL8ugysx0wg7XcdedZQnDgXkEiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgIEPBOVO2xmKFQleHXk0zzuRcYZhlqJn9wPNC67lQJRQkczl2MDnoXvOB3FWNK4099V7zXoP3DBthvdalNhWBjgjI3+/uaKFz7ExTTdfOmo77Anai8yAVTmEJ83ye+bA9CAR7UpWNB/rZhEP9EcUrKS3uLy8UdryfmBp1sYm+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=CSfSNK6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CSfSNK6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FFEC43394
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CSfSNK6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706623588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGPKHFYctFgJTSDAEL8ugysx0wg7XcdedZQnDgXkEiw=;
	b=CSfSNK6O9igpN6XJ70K68Ikt0eGMGfHtl3l7/yZ60E7GofVY7n+dxrcaLd6zyAga9miGfw
	zqK4pveEbmw40oYk6UcxJWai/wOIPwM/WikcEmZY8nHwStw9EIyaYdoBtRM11suhZAuPx5
	jm5B/uqesrnSq+jDMX4iiM/Fi7VG9xM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1190f3c9 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 14:06:28 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-602d2e67217so41026797b3.2
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 06:06:28 -0800 (PST)
X-Gm-Message-State: AOJu0YwC/TpxsNbPhFM31opYx284xQzmSvPzWX2qfIzNkWB23YnCrPfQ
	FE/GLCloX710OW5u33rt7K/sbKCfzWtzMfWAte+iJJouRhxjbli8xTZHpzk+SrnE9e3XOoEcycj
	psJuobhxj1qHzumZeNaptz2eDsuI=
X-Google-Smtp-Source: AGHT+IHp2RV26oHQ6aA9DH+78zuence6Rgc81OpkDg7yYJXrbPKDi9GckbwZEPtjem4X+5pqnPR4FhGdj0c1T/oGk5o=
X-Received: by 2002:a05:690c:3508:b0:5ff:682c:6c1b with SMTP id
 fq8-20020a05690c350800b005ff682c6c1bmr7742121ywb.43.1706623586675; Tue, 30
 Jan 2024 06:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
 <CAHmME9pOt=uEmuBzBpgUHw9DqAD2FZTZ3v53AOZbQ3Cd2p97xQ@mail.gmail.com> <DM8PR11MB5750E38A8B2BCE66AF7F9812E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5750E38A8B2BCE66AF7F9812E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 15:06:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9qMO7=RDR60bKJvpDTRokcKed_i0+7BbFD53_7o2OJ6-g@mail.gmail.com>
Message-ID: <CAHmME9qMO7=RDR60bKJvpDTRokcKed_i0+7BbFD53_7o2OJ6-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
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

On Tue, Jan 30, 2024 at 2:10=E2=80=AFPM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
> The internals of Intel DRBG behind RDRAND/RDSEED has been publicly
> documented, so the structure is no secret. Please see [1] for overall
> structure and other aspects. So, yes, your overall understanding is corre=
ct
> (there are many more details though).

Indeed, have read it.

> > So maybe this patch #1 (of 2) can be dropped?
>
> Before we start debating this patchset, what is your opinion on the origi=
nal
> problem we raised for CoCo VMs when both RDRAND/RDSEED are made to
> fail deliberately?

My general feeling is that this seems like a hardware problem.

If you have a VM, the hypervisor should provide a seed. But with CoCo,
you can't trust the host to do that. But can't the host do anything to
the VM that it wants, like fiddle with its memory? No, there are
special new hardware features to encrypt and protect ram to prevent
this. So if you've found yourself in a situation where you absolutely
cannot trust the host, AND the hardware already has working guest
protections from the host, then it would seem you also need a hardware
solution to handle seeding. And you're claiming that RDRAND/RDSEED is
the *only* hardware solution available for it.

Is that an accurate summary? If it is, then the actual problem is that
the hardware provided to solve this problem doesn't actually solve it
that well, so we're caught deciding between guest-guest DoS (some
other guest on the system uses all RDRAND resources) and cryptographic
failure because of a malicious host creating a deterministic
environment.

But I have two questions:

1) Is this CoCo VM stuff even real? Is protecting guests from hosts
actually possible in the end? Is anybody doing this? I assume they
are, so maybe ignore this question, but I would like to register my
gut feeling that on the Intel platform this seems like an endless
whack-a-mole problem like SGX.

2) Can a malicious host *actually* create a fully deterministic
environment? One that'll produce the same timing for the jitter
entropy creation, and all the other timers and interrupts and things?
I imagine the attestation part of CoCo means these VMs need to run on
real Intel silicon and so it can't be single stepped in TCG or
something, right? So is this problem actually a real one? And to what
degree? Any good experimental research on this?

Either way, if you're convinced RDRAND is the *only* way here, adding
a `WARN_ON(is_in_early_boot)` to the RDRAND (but not RDSEED) failure
path seems a fairly lightweight bandaid. I just wonder if the hardware
people could come up with something more reliable that we wouldn't
have to agonize over in the kernel.

Jason
