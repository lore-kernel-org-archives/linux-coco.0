Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EB11AA791
	for <linux-coco@lists.linux.dev>; Mon, 12 May 2025 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087312; cv=none; b=FD3/Odoh/yLUkfUYWY7TSVUigZuR7ozlC8qusKe+9zj7nE0+IO6w+gkttEk82Yy5IOVj3idebBZcLNI/Yv1bJpqrdAsL3r3RPCEB3rhzql7YuqN7/g7VpF5FNNsq7jSuaJyTOZXYVU+vXne5vMUyQiQdFwZAllmXZanfu3nQLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087312; c=relaxed/simple;
	bh=rHfSaTbnyI9XoypCkJo/iUq/Y4OjgIW4d0dEWEOb4WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKOa0pCEgu+aAUm0TPbgdFJJv/5OYkxd/3zoWusrrq4rXgCF6S4Q/paFtiJXPXPca/gOWdeNyH/Upx0+G52OL2OfamUXH34pcLEwmjR7H+xjkJaMWFCa1ULiyB52gCJBtv00pMTvfVWZ57496Dp9c5D4PLiK3Lwc8fZaQOaCVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JoiNq6Ed; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JoiNq6Ed"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a338b1ce5so45981497b3.0
        for <linux-coco@lists.linux.dev>; Mon, 12 May 2025 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747087309; x=1747692109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKie0IlRkp83iNNzrci+462IuBHk3Z5i8ViXJGbM2zI=;
        b=JoiNq6Edml3bThhd8XyhFMopYpg638CrxsYJ4IcPwd7guVZysf7fVlQU5oSIXE+S/G
         HuCWDOppB3vaVpIF26GJQNNJKG93YdcqUdq39lx/I5U/MIa2CUKLmSbbholkxcq8TURC
         rVCrBGhkn/I2STAPfUNLJy5mMeZQwpR2hsLUe4laaAqAgostW90nVLIKYdLkq5JIVTNl
         wEg9mO2q0te6HbCuOmVXH4h1/9c7Y2uySim4H8Tzm53QtVjWPi+/bmreoTEFVDltTM+s
         m4z9dO84B1mdOuNtMBa1v7X2PBKALQUzHYE/3tQuDfiEmGQrmZZtccAXfVUjM5IGLv8z
         ub7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747087309; x=1747692109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKie0IlRkp83iNNzrci+462IuBHk3Z5i8ViXJGbM2zI=;
        b=fSASpVXGnyx580xoABEtoyzIgHEpcfW6QE+w+AGxHBkW+hbqoeue+jj7+WAjz9e0VP
         anDR5NNlK8jI+92xvcB0wUFbgrEYJTa5Yn9UgXkaECs3kBdKFNap+aSdNvNGOmAiSB1s
         2Va2Oz2ACO9y9T3dAjiEF+GcXNf1zicFNP3aza30DVjj3P0GSNCL+uY5YT82q6/uEFHB
         EJxjA+/ZuUsvJjBkSEoNt0yTy9zX+RBxp6q/BPABwO7bQapDsDvyKIg5rgDdRW86Z3iY
         zoqM5CsUyxa5N9fyeshlui8wUBp7h4ofB45+EZaRsNiDeQej87urzJYfw5En+/TYtwBF
         6f6A==
X-Forwarded-Encrypted: i=1; AJvYcCUme7gXiN5qQxHOMk3wcmNwtLcSdv7MFYOIcVRNicCC6eG3BXphex2SvYkc9mm4C54/o+3uk5rACIer@lists.linux.dev
X-Gm-Message-State: AOJu0YyYZlUJ0USuyE6yzyAJrW9goOc7s9suyQP9U2q2dDoPRn+RGS7+
	X2UN3VIK80p1+jyXhj9F7X69+zZa0tQYTZ5qo7AFcVt8I7xuW2onKYoI+xD4MM4red38HyETaVf
	ghikSXvhugpH7olnr9hWS6FYytySzxLwWAyM1
X-Gm-Gg: ASbGncsl2NOrRtJgsGgd0a6Uq6YvJ/LSgeuwNfndFHYGcrvEg0cWw8UqAOmmcYTignd
	YY8/sGXzdBrFi8HENS2tpJiDIaxycB/17P9VNEp2bM02tgnX4GY3fzsWmN07XBwaWmSp+BcZ3vF
	d3ccLE2xE8aZXNlpoQlnUV+OjWLTPKDfT1
X-Google-Smtp-Source: AGHT+IFOMIsPRB6N77R/jqBwaSjy0jmjto+6IHP1IR9XhbZIQXfDLlpLMX4TWO85MDI4QzsKiGldRFQrkRYAnblk9Us=
X-Received: by 2002:a05:690c:4b0f:b0:706:ac56:825f with SMTP id
 00721157ae682-70a3f9ec8e0mr191260187b3.5.1747087309387; Mon, 12 May 2025
 15:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321102422.640271-1-nik.borisov@suse.com> <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
 <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch> <68226ad551afd_29032945b@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <68226ad551afd_29032945b@dwillia2-xfh.jf.intel.com.notmuch>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 May 2025 18:01:38 -0400
X-Gm-Features: AX0GCFtgJv-4_VcLPYA2b-6hwyHqoFeVQTahFrJ-tcQAIU0sDVq-uYd-lD9xr08
Message-ID: <CAHC9VhSyz2MqMjnHFbTiMqYvhAFZf162ZabnSsyyCQEZj-V9=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Dan Williams <dan.j.williams@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, linux-security-module@vger.kernel.org, 
	serge@hallyn.com, kees@kernel.org, linux-kernel@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 5:41=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
> Dan Williams wrote:
> > Paul Moore wrote:
> > > On Fri, Mar 21, 2025 at 6:24=E2=80=AFAM Nikolay Borisov <nik.borisov@=
suse.com> wrote:
> > > >
> > > > This simple change allows usecases where someone might want to  loc=
k only specific
> > > > feature at a finer granularity than integrity/confidentiality level=
s allows.
> > > > The first likely user of this is the CoCo subsystem where certain f=
eatures will be
> > > > disabled.
> > > >
> > > > Nikolay Borisov (2):
> > > >   lockdown: Switch implementation to using bitmap
> > > >   lockdown/kunit: Introduce kunit tests
> > >
> > > Hi Nikolay,
> > >
> > > Thanks for the patches!  With the merge window opening in a few days,
> > > it is too late to consider this for the upcoming merge window so
> > > realistically this patchset is two weeks out and I'm hopeful we'll
> > > have a dedicated Lockdown maintainer by then so I'm going to defer th=
e
> > > ultimate decision on acceptance to them.
> >
> > The patches in this thread proposed to selectively disable /dev/mem
> > independent of all the other lockdown mitigations. That goal can be
> > achieved with more precision with this proposed patch:
> >
> > http://lore.kernel.org/67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.co=
m.notmuch
>
> Just wanted to circle back here and repair the damage I caused to the
> momentum of this "lockdown feature bitmap" proposal. It turns out that
> devmem maintainers are not looking to add yet more arch-specific hacks
> [1].
>
>     "Restricting /dev/mem further is a good idea, but it would be nice
>      if that could be done without adding yet another special case."
>
> security_locked_down() is already plumbed into all the places that
> confidential VMs may need to manage userspace access to confidential /
> private memory.
>
> I considered registering a new "coco-LSM" to hook
> security_locked_down(), but that immediately raises the next question of
> how does userspace discover what is currently locked_down. So just teach
> the native lockdown LSM how to be more fine-grained rather than
> complicate the situation with a new LSM.

Historically Linus has bristled at LSMs with alternative
security_locked_down() implementations/security-models, therefore I'd
probably give a nod to refining the existing Lockdown approach over a
new LSM.

Related update, there are new Lockdown maintainers coming, there is
just an issue of sorting out some email addresses first.  Hopefully
we'll see something on-list soon.

--=20
paul-moore.com
