Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C713DBA4
	for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 20:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707941095; cv=none; b=qo4HQSjGw4bZmcGM9bOeKgqpkSCUAiaoATvsV9nXDkO1vrsU1zf4TjpLS31xuGk5PbKGgMFWQubaLwWfVCFoWdClGmU5I7uiRDcMg+GHpqCZzcG4SSslnIb2FaX3jVKOZYThL33Q629n5WT6h+TjLVJmIGj1Ea+cJIQjY9RQYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707941095; c=relaxed/simple;
	bh=EmRJjqQ8kq8Q517ggR5Et3Bsjp0miAQElJf6USkOlmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAUqj5JN4dunnaq6X0ATtgTWU18tRwOPAG3XRNbkm7ifo1UnBSMi23+OEkkvUK8qPAPf6x5sEfVcXLdAIMlcDFLd6IYiNTdIt0hAWLP/XMUIvjC5nEDZQeEETNUrHl1sOlDc6Y5oV6y0BUocn46dLEC8aogCt+bCnpKmy/fsZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=elxhgghY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="elxhgghY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B653C433A6
	for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 20:04:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="elxhgghY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1707941089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmRJjqQ8kq8Q517ggR5Et3Bsjp0miAQElJf6USkOlmM=;
	b=elxhgghYeksiMtISct//teZsJdLLTtzGPgRYmvd+NlaMafLc2fICeuJXv/sqWHWhBYfW9/
	/J1IuUKpPCwfNrzT9mmjfwuF0+kXSCGylt8f/fFZjMJQ3N3JdA5QM0ED1d2JhiPm5gIUNV
	zJFG3dXTfi9wWyR6mT0scqB94EYvR4Q=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8896f8f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 14 Feb 2024 20:04:49 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db3a09e96daso45631276.3
        for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 12:04:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyRtZOx++sa0SMykeabZ0JOJNpi+fwDm4y/PT/wQd9Z+v/Gnylgbp+8PyLFsGiabKPJbMbYF6zVLIldeOzMdnAaEPjEdbSBmj2eQ==
X-Gm-Message-State: AOJu0YxhnczRUaVYbSwPc5Fc3f0x1G8QC0yfn88uT+zX5aTDPrk9pVe7
	17uLAszSrB1WhDftJ2td55Cd66f9BCJkCNJ6J3LnwjNXIpak1FQdCqS07uXcMy/0MwIGjCvxOTl
	AYWGwCitbgiU7fIjIZLLX+xY7PBA=
X-Google-Smtp-Source: AGHT+IEcqWl0JkANdKZVhZd+f9FiDC4nUDnpyeEYWGflrPoPYZrWRoxvuBlK2mo4xK3mkjIb87TqeyWlIezulCVBzTY=
X-Received: by 2002:a81:93c6:0:b0:607:57c4:6a8c with SMTP id
 k189-20020a8193c6000000b0060757c46a8cmr3719576ywg.43.1707941087295; Wed, 14
 Feb 2024 12:04:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHmME9oJvbZgT4yT9Vydc2ZQVSo3Ea65G5aVK7gFxphkV00BnQ@mail.gmail.com>
 <20240131140756.GB2356784@mit.edu> <Zbpc8tppxuKr-hnN@zx2c4.com>
 <20240131171042.GA2371371@mit.edu> <DM8PR11MB5750C7D16DC566CD1329D5A5E77C2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAHmME9q-eUXnXnpaDu0VOQemOYysst7SaJ-=b8-vCFP9h50Szg@mail.gmail.com>
 <20240201045710.GD2356784@mit.edu> <CAHmME9oqM2a766dBK22-yKr8=2-icg=UkQzmBOF8G5Zh_Y9E9w@mail.gmail.com>
 <DM8PR11MB57505F657A8F08E15DC34673E7422@DM8PR11MB5750.namprd11.prod.outlook.com>
 <DM8PR11MB57503A2BB6F74618D64CC44AE74E2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Zcz2r51Tbb44ywjl@zx2c4.com> <696a5d98-b6a2-43aa-b259-fd85f68a5707@amd.com>
In-Reply-To: <696a5d98-b6a2-43aa-b259-fd85f68a5707@amd.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Feb 2024 21:04:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9pzOTdkNr=mM7yKKqLWApQ5cxjvb7R9C2eQ2QFeUEqT6A@mail.gmail.com>
Message-ID: <CAHmME9pzOTdkNr=mM7yKKqLWApQ5cxjvb7R9C2eQ2QFeUEqT6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
To: Tom Lendacky <thomas.lendacky@amd.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	Borislav Petkov <bp@alien8.de>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Sean Christopherson <seanjc@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Wed, Feb 14, 2024 at 8:46=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
> Don't forget that Linux will run on older hardware as well, so the 10
> retries might be valid for that. Or do you intend this change purely for =
CVMs?

Oh, grr, darnit. That is indeed a very important detail. I meant this
for generic code, so yea, if it's actually just Zen3+, then this won't
fly.

AMD people, Intel people: what are the fullest statements we can rely
on here? Do the following two statements work?

1) On newer chips, RDRAND never fails.
2) On older chips, RDRAND never fails if you try 10 times in a loop,
unless you consider host->guest attacks, which we're not, because CoCo
is only a thing on the newer chips.

If those hold true, then the course of action would be to just add a
WARN_ON(!ok) but keep the loop as-is.

(Anyway, I posted
https://lore.kernel.org/lkml/20240214195744.8332-1-Jason@zx2c4.com/
just before seeing this message.)

Jason
