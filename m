Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3322F1D5150
	for <linux-coco@lists.linux.dev>; Sun, 13 Apr 2025 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572321; cv=none; b=q/HjIyL56ahAPRJIAAbpH6kqtbov9Eto/D2qdw/6f+4LAXsrSm47aY75OSDeGXI2hSk9Ttwg394HNexaOfDkEvvFIx7YhwADZCQiDigiMic+d9ERk7eZpnhRUDU+pSUJmXvapPkU2G3OCHIUHiVbhVg6foz2qPIYQAlKJv6qfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572321; c=relaxed/simple;
	bh=cgoVDjX9IT6EtA89494TbMxqJl0RE2iUlZQmz+9vkuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asynN7nu1ICOeSzUkEJ2txLy9iplGcW8XXXi2Sl4V0Fo49cp/5oMBDusnlMi2aLmbqtYAls+PJYoqSWjpcfNk6zejsB1RzdLCTXjVeQTaHzL60HVi78CQZvq30E3xIo+zRGf/z8mKJ8HvIBtN58cAn6ZNR52ou8FGub8yqSsSIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FPkKzYEI; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FPkKzYEI"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e63504bedd0so2265473276.0
        for <linux-coco@lists.linux.dev>; Sun, 13 Apr 2025 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744572319; x=1745177119; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq26RbuqV8heXEFnUrcIAdRGV+/86EMAIyh2oJSHIJI=;
        b=FPkKzYEILKEi9Y/BxgYYmOgSB2hlPye/MuPcTyeqg4zD7Tc2hNT+ydYzt6q6KZei/J
         excbR3onFxCkOoBQo9zbQB6e1KegoBj1dKay4LWO7LiCAJgmPs5jLu6oDi3yAIj2L73y
         SV877G5rAStZgRNe3vPOtDF0HC0lV8XwxGTvlBW3USLzM/lh3xFvPvRgi6DCwt8cueUI
         efwN13TPu26mZvRe3Y12CcjhEEVwrEjWxQEf00yw6NcVBzWkWcFqG/6p+j6BA2tqPwz+
         /0+iA4W8Dg/ziBHlDxId+A3Riubh4nnHvkilAbY+HKeMWu/h79cxKMrx/d6LEERJv/Lc
         cI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744572319; x=1745177119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq26RbuqV8heXEFnUrcIAdRGV+/86EMAIyh2oJSHIJI=;
        b=qCYKabQLnJpGy543VdlGb7SCKeCQ8GJkv7X5aORk9I5DAiAvsaHXLKWxil5eTKQJt2
         IZuZ9gLeDN5MKWzQ5R4DiJfCZ1BG8lQ8fhcCB8PeZ9HFQtbGLu61rnB91eNhQgvRfuVJ
         gfPiql/tzReOgnJPxFRVYpfQfufulcol2v+kf3qq0lsZu5ihSG+4M3p2o8OQLQi64g77
         j2dFkpcuqYTXDyG1/mVsNjlZibqH62cL2NMmT+BFr+i61XiQvSVOm1KUPfb05n0n4Uvq
         RmzJ0hSg7m7ymbJSiJi9cOsU1KKi7lT0oBAHNjeZ1dcsXv9/2SR0jowCkr5m0VE+W6Aw
         +8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCW+ygvFwPPs1wRjIvC/4Wqbd0/YNGwoKS6Ildb8akaVMFr3A78PB4cCQY9Tz96SUL4CSSkwMDVMjZum@lists.linux.dev
X-Gm-Message-State: AOJu0YwIMAdsRFsmaRbe320sN+Kjwgo2rdawk+hsdLh/57l6gIQUDZN/
	IDvDINSwPdEEVNso2eT0ytHFMC7eHPkPhLU7EoGrczerdEBGujTVQP1S8p5qM2M8yr8MW2wI0cz
	0yUpGPl4htb8WShi01VeovVS1YVw171lLCCEt
X-Gm-Gg: ASbGnctATELTUsz4cfJCcFP0shpV40hzfvqPjIGxjyrE/WRrgkIiVCe5F4BSJwUpJdz
	maASFQEHl7eucVc6kh0imAaNtsdaLOAeAWHxyyxlxFXWS1masd2fxnA7uUPfWacNXLfkZ1WXiD1
	59I9YKsztJU1DkYfQle/iLZCxpAo0PeXCy
X-Google-Smtp-Source: AGHT+IEK3FZOyF5DkkCwjbI6gGNlgoKbpro7f3xzWGq57ut4TKBLbfWVw1Qp6lUKEtjw+o5HwzHf67W/QIFHUN1a7Do=
X-Received: by 2002:a05:690c:4901:b0:6f9:b0a6:6a15 with SMTP id
 00721157ae682-70559ab718cmr165647647b3.38.1744572318910; Sun, 13 Apr 2025
 12:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321102422.640271-1-nik.borisov@suse.com> <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 13 Apr 2025 15:25:08 -0400
X-Gm-Features: ATxdqUFFPMWUt_uYVOB3P94cPJvgJmNzGSw0uhdEvSDjwZkXZa-eQQ48N-qvI6I
Message-ID: <CAHC9VhS97RWMYmCOQVCZPUUCxdMXPMzM3R0z_U4zJQNe40M4BA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-security-module@vger.kernel.org, serge@hallyn.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:13=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Fri, Mar 21, 2025 at 6:24=E2=80=AFAM Nikolay Borisov <nik.borisov@suse=
.com> wrote:
> >
> > This simple change allows usecases where someone might want to  lock on=
ly specific
> > feature at a finer granularity than integrity/confidentiality levels al=
lows.
> > The first likely user of this is the CoCo subsystem where certain featu=
res will be
> > disabled.
> >
> > Nikolay Borisov (2):
> >   lockdown: Switch implementation to using bitmap
> >   lockdown/kunit: Introduce kunit tests
>
> Hi Nikolay,
>
> Thanks for the patches!  With the merge window opening in a few days,
> it is too late to consider this for the upcoming merge window so
> realistically this patchset is two weeks out and I'm hopeful we'll
> have a dedicated Lockdown maintainer by then so I'm going to defer the
> ultimate decision on acceptance to them.

FYI, I expect we'll see something on the mailing list related to this soon.

--=20
paul-moore.com
