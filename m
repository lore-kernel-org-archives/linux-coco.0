Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6D1292F2
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556991; cv=none; b=b0oHINdfU9Z9nF0DDOQSKdZKqQYLBHj6oyP8mHa1DkM1cQlUb34tllu69WdWH7T441ell057MikZkOienp68MVsjdQDlK5s1ViV3Th1s7NjWebm7/5fTxQQYTO2DvZaYwBtpxdE8i+5srG22PzmLw32PxZHCpZs19XlWJQ9q+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556991; c=relaxed/simple;
	bh=+8hQKDSkHaa77sJeJopkoKcCu7Z0DboOb3oS5bU8/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyhVbJGrLR+pDNbWhwC1xSnsA8/Z7fPajBszEXmT0Uto6N7hw31cg4bSoxI2DdyQyedz7qArJxoovZc7qupCMTHk3aJsoEo6AWRpj/SUPXD4qh+Q8hD3hTVf2m63bjNWgatmQLe/L+FYKng1/U24LtlXIGpjujJcl3fUVzMa2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=RqA7nEUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RqA7nEUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92268C433B2
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 23:09:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RqA7nEUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1708556986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QLNawNQWiBsuKTXbumMmGwOiMc7OejQSxxYtknrm60=;
	b=RqA7nEURBFor9ErOu0KNR3JZk+UH1z8rqNUl3NvbkTF9lc/6fugUXpbH4U9Ev3QVybI5Cw
	Uf9ZW1Fw0coAohGkOBiHfijNzVqJwooW8DFIUUSyMERLPUk6EX/GH3jjCFKGk1ygyA5u0/
	aWwrGNaoDsL47Yg6B2lj13UuzcLExAc=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb588e3a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 21 Feb 2024 23:09:45 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60821136c5aso30655867b3.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 15:09:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaM+yhd0KVSzxace7Z0Rjk4K37jcOq0Vgxq2twGb3hSLwG0a+PfG8msgrtWmPf7Wjfv7AQHszwnxJNrOuvLWat/DncZ2rf/zK1mw==
X-Gm-Message-State: AOJu0YybnxDkZUOicl/06AU7dDidOL/6unwj5NUPO8B6v2F8hPVmnZ/X
	j0042C/W2aRMHxlfA3gEr0zHZn+l6Fupt9SkLfX73wTWRFIOvYUuFmL7fGekRNUYluflnE3qWB/
	UIowHFtQ+SaJ57/BU6c1azvj9llQ=
X-Google-Smtp-Source: AGHT+IHP5cV4M4Gq8D9U6OfE4bQYwP/OeSmqy/RUl+EOkwpcupTlK4dXZciVramz/Ff3gTj3EXEnhS8DzXNQ25FOo3c=
X-Received: by 2002:a81:7c55:0:b0:607:910c:9cb3 with SMTP id
 x82-20020a817c55000000b00607910c9cb3mr19268302ywc.36.1708556984269; Wed, 21
 Feb 2024 15:09:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240221123248.25570-1-Jason@zx2c4.com> <eada8acd-9341-401b-b6c9-a05848eb91d6@intel.com>
 <CAHmME9o75KzsfMRDtr2K0+N-UM-MX7MWL4AZhy27CedZRNd2Tg@mail.gmail.com> <7a8c04bb-214b-4031-bdd6-59dad62f88a7@intel.com>
In-Reply-To: <7a8c04bb-214b-4031-bdd6-59dad62f88a7@intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Feb 2024 00:09:32 +0100
X-Gmail-Original-Message-ID: <CAHmME9rCQgY_DMmpOEJWO8qytNw3ErJNy9L-E7WzEKYHVyqCHA@mail.gmail.com>
Message-ID: <CAHmME9rCQgY_DMmpOEJWO8qytNw3ErJNy9L-E7WzEKYHVyqCHA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/coco: Require seeding RNG with RDRAND on CoCo systems
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 11:47=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
> OK, so we're trying to get 256 bits of seed data from RDRAND?

Yes. This fills a 32-byte buffer of longs up with output from
arch_get_random_longs().

> But no pattern I could discern.  Did you mean something different by
> "platform drivers"?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/um/kernel/um_arch.c#n413
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/char/random.c#n655
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scr=
ipts/gcc-plugins/latent_entropy_plugin.c#n90


> If we're going to have arch/x86-specific crud, it would be great to make
> it obvious and straightforward to those of us simple folk that are
> familiar with arch/x86 code.

If you insist, I'll stick a local `enum { RANDOM_BYTES_COUNT =3D 32 }`
in that function or something. Seems unnecessary to me but if that's
what you need no problem. Would that suffice? Or a different variable
name? Or a comment on "what is 32 about?"

Jason
