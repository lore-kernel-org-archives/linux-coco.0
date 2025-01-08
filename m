Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E918259490
	for <linux-coco@lists.linux.dev>; Wed,  8 Jan 2025 03:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305585; cv=none; b=TXa8bMT/ptc6GiJW9+77s8sPXzpFejTiykq5vD+6tqeO6jyEdLpIR/TxShceTVzBSmEANRTXyV3VT3KU1tUsh3SS98w9yd2vagqWEWGeRjw4mMawuk6M0eGne+L+WFqgalj6R06+/RArsM5+hfulYU+lm3sGPWbOt4D/TRVlqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305585; c=relaxed/simple;
	bh=3icb+bsSKumu8XJSMTEpIOx6W0hq0nxXFe5Pq9bIM18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvCQVrRykFOuC3ZtOSjM4Fk5SbRokqLg1MO36RaYwvq55LN4RYHsFVGC+Y/2O0+jEylN+GiiGaqJU4gekf4G7ni4pZl0Fyq2sy0TDoh82ZKS9Pbo9xZCxUHj0QLt+x7fsaFVoW01LH4zIvJSbjOaPn8LYRQ5UqNcB/sdsd+TVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dk+Ctgah; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dk+Ctgah"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso30014437a12.3
        for <linux-coco@lists.linux.dev>; Tue, 07 Jan 2025 19:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736305581; x=1736910381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyufpv6roPjBF5s9DOcZCzPFDzdIdzRLScGnJY6bh/E=;
        b=Dk+CtgahBLXPXSdECLE/1KYd2Y6//TqVMUuo3rfzHiXE13lAzfAemEyZlR9AzXDNBr
         9GKwFy1L+od871+bxAOH9qhNrMlFu8urAVNhsQoSLCNeI1vzGWrrJ+WHJx6goCN+Tn1W
         1wHWBfxkkN4BfLt5K+kBIGnq3VMRFmtvcPYx86JaIsho/Hz67NNRSt1oQNgiwJj8O7cv
         q3nzkKUWQ/l7MDGVhAOI8R3lkixe2JVik7r5jgVKZMoiAoJKmYHjRrXqJjb30auGU/PD
         whXD/haZkIh9TLzBw4VCvF2/XTj5UXcMxS7MjyyfsoMoJfmKU4gyLlmR7aPyBJqvSERN
         wg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305581; x=1736910381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyufpv6roPjBF5s9DOcZCzPFDzdIdzRLScGnJY6bh/E=;
        b=jBcFHsixUumbfYoA+/D/HjHPJ+bjhZalbiiq6Nv2Fg2ZZeyMWbCj17GMJFARABxF0u
         4F6rnwYt+sYDeA4y6AvjHUfhB0dBnpBu6Nrsgz4QLj8FYjUms8bemJ5RPm/QgFoaIOro
         hOvcACGm6lAUF+db3qsx98lZqKS7sPWc7xyk9SZh8syUpXTjZATuorpYQ6n2HjNgmyk5
         WR4M5+xlGF5Te+0VZ7RFrawiPWq7CXnURHh/kVlAk8rbyBKMY4PrtFqMVMieSpprQizi
         te4/QNlRZAFz8UxuB0xrWjXF9bhqTpmM0QeOuI6JxlVVsz/Ao/6JiM1TS2q2BgJVlVrr
         3DrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVq1UVDjr7emMwJbNhhSKgRLTGJqeyQebJxY2zVV3D+CtxxM/11iiMMbxGxqZlcquk01eYOfjbrqe5@lists.linux.dev
X-Gm-Message-State: AOJu0YzX6kE/9iDlBgrJNkIjVpKdED+4UslFSPJl6RZbF8rC1nRtUFLs
	FZEhw8ngOLgZ3tsuCkE/hDJEpkxUoqrO00qYXsE6eAEF5fo1UKKDdslHuz9zXO3XaoeSMLtPUef
	W31kf4yqz0tXX8rJriuJnE4fkXhWTrqs1Z24F4YDCppBEbVtOlQ==
X-Gm-Gg: ASbGnctKArRwUf6G8PF2DILbIKRihwV64vn/YtX62r5ZArJT+QnDtDNKj9w1mQiHh3E
	yhPXR2Qb5iMJnZ6hMWmMS+qVS86gVWK7sZjrBPg==
X-Google-Smtp-Source: AGHT+IGpbO7HEym3YeVDMbGqbxSCcyPeE5Wbqm4nHnuhZBl3j3h1VJ/jx/KhlgJ9OZW/Fp8jBaiRFFFsYD7zUc5wlGk=
X-Received: by 2002:a17:906:4788:b0:aab:9842:71fe with SMTP id
 a640c23a62f3a-ab2ab6fd650mr90662566b.13.1736305581377; Tue, 07 Jan 2025
 19:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z31OYDtmN3DRe3oN@8bytes.org> <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
 <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
In-Reply-To: <06c94a892ce95aa043b6afaf3e61f8ee2b3010e8.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 7 Jan 2025 19:06:10 -0800
X-Gm-Features: AbW1kvYazE1hR4wplISilgqH2QkNY_LX3RDcybIk_QqiIKpweOfQaao0fepZG2Q
Message-ID: <CAAH4kHYn0vW2ODa_co+0pzfbuCM27LRUySk0XrKBNgQYqU+-iw@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, 
	svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 3:08=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2025-01-07 at 08:26 -0800, Dionna Amalie Glaze wrote:
> > On Tue, Jan 7, 2025 at 7:55=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8byte=
s.org> wrote:
> > >
> > > Hi,
> > >
> > > Happy new year everyone!
> > >
> > > Here is the usual call for agenda items for the first SVSM
> > > development
> > > call in 2025.  Please send me any agenda items you have in mind or
> > > raise
> > > them in the meeting.
> > >
> > > I have one item on the agenda so far:
> > >
> > >         * IGVM support for QEMU.
> >
> > Regarding this, I'd like to make sure we cover the topic of MSFT
> > donating the IGVM spec and implementation to the CCC for appropriate
> > open governance.
>
> The spec isn't really separated from the code: it's all one thing.  I

For now, though for disparate implementations across openvmm, qemu,
Vanadium, EC2, we should expect implementations to diverge without a
forum under a body like the Linux Foundation for folks from different
companies to meet in a legally-blessed way. I asked for a way to
bundle signed reference values to be added to the spec last year, and
I can't easily propose an implementation without director or VP
approval.

> think in principle this document along side code is a good thing and we
> want to keep it that way, so you're in effect asking to move this
> entire repo:
>
> https://github.com/microsoft/igvm
>
> The IGVM format is designed to be useful beyond simply confidential
> computing for multiple different virtual machine images, so even if we
> were to move it, I'm not sure the CCC would be the best place to
> guarantee that universality.
>
> >  We're institutionally blocked without a significant approval chain
> > to provide code to competitor companies.
>
> This sounds a bit like an internal Google problem; I may be able to
> help you with this, but I think it's been a while since I engaged
> Google legal on open source.  However, the main argument for you to
> deploy is that for open source the whole point is to collaborate with
> your competitors in the open and you should be empowered to do that.
>

I understand. But see below that I don't often get a "yes" to these request=
s.

> >  Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
> > inversion of power, even with the MIT license.
>
> You mean simply by hosting it under our external github account?  It's
> where we incubate all our open source projects that accept outside
> contributions (and where we hope to openly demonstrate stewardship
> worthy of community trust) and I believe Google does something similar.
> All corporations tread this fine line: if the project accretes a
> vibrant community, we'd likely be happy to move it elsewhere, but we
> equally don't want to be accused of simply throwing code over the wall,
> which is why we incubate projects to see how they progress.
>

:) I expected a "go kick rocks".
It's commendable, what Microsoft has done for the past 6 years at
least with openenclave, openhcl, openvmm, igvm, etc.
I've barked up that tree here for 7 years and been told no, open
source good will isn't dollars.
I personally agree with everything you said, but had to ask for the
company line.

> Regards,
>
> James



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
