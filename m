Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F82DECC2
	for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761695337; cv=none; b=K9PEJvCWk7l0rxBMlcK1G5PS+h/u5y/MBe+43WbXu/CLTO6ek5FjP7QFHWQxnVZpIk+XqBRawPc5ep+UH0VOc3orGihwIH6ebImOV4krD7s7QlpnCJqYkD3D9sA9pOpJuJqncTEh69ysg4ihmncs9jy8irpmJ2eCXkLFUNtpyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761695337; c=relaxed/simple;
	bh=ZbT2A+Vw6lNOZ/qUmwMRZ8Kq1LUvWqnlxqNJAqgnSss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zy335L70cHm1t/8l1UnckJrLaTxMR936utuJ9EWNQ/MPp07FHNqyYeAtY++ZYpPbC76Imm8CF6wjzhNwwUVfZPbqC64S7KVyZMRI+4jmCHXkAbN4mYyGQhBmvB/7SIudld9VmUzxTg68m5vEPR2gm5NSUrFkV8CnMP9JZKyvzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dmzjAU5z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dmzjAU5z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eeafd4882so95615ad.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761695336; x=1762300136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbT2A+Vw6lNOZ/qUmwMRZ8Kq1LUvWqnlxqNJAqgnSss=;
        b=dmzjAU5zlUWHmorVDjIUAWlkiNlfgYwSPor9Sc+cw3INSiKZ9wokxYeWnkIDHH9xyz
         m/JH9UhBc22RmWNItu+XRkX9XYv89TOUoVxXmXE0qRgtPU8T4QacpzxBWmiVj7nRfGeJ
         O1Di1jfjzi9RSCnGb9qc75MrOZo5jknHraAtRWEexnKXh8D1UOUECciu96wiv+tI7jed
         kg03NqpED8e/9xxRhy+UJikNvy9irvmrtL2enDepkml+vjRwKZUVSEBETjjjB/OPo9yt
         OHgiDa2yCABG8KRxDyrhQwge3PH1A/KTUSKFxjAckH5OdDOXbU0QmrGkTSwPHmU8evG8
         VWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695336; x=1762300136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbT2A+Vw6lNOZ/qUmwMRZ8Kq1LUvWqnlxqNJAqgnSss=;
        b=aBzWUDXOPk7DaC76FisX89oiT8efnSvUFtL7rLexRT4LyCEP1tiEQ5659NGFD7geT6
         K6LzVg/sE+MiAo+zgrJQrBQQ14ovSjr2vP72JASFbgC5A0N8UEcyv/GSU/GdpCJUQFmm
         Pnc8pB3wUcmYvXILIIOHOYTidUorzTEArHD8f4+IzTn57/n0w9rpf5Yi+zQ7n2gl0aCZ
         mbsi4NQHBfn1CIsXTVecG0t0z+s20N6GhdeS039By/s7fdWJ8JofE7sHbxjGK4Va3GJX
         vnyIH/sH/JPlVjA1z5zlc2VbUmmbddiW6Uo0O/uavqzJMe8cylmUBxCy43OKkwTN01ZA
         RkPg==
X-Forwarded-Encrypted: i=1; AJvYcCU3B0tk2SfPkKVPq1T3IUOr6mbqpEB1kVSrjMVr1w6YpmRv1b9E0cDX2F5q4626OSdfuqJRt/MV1x1o@lists.linux.dev
X-Gm-Message-State: AOJu0YwxOdZllr1jYGEl0xB1mMjyCEHjY3NLfEl7nnwuqIfLYMWrTTgq
	DxghFKtoQZ4abuxTT5ibbZ+mHQtab2i0QvFg2X7K4f+Y9Ew/TPaBKHbWbZ2MGcbe52EJaVhpJjp
	BbHeLSZMq/r+gtD1A6MuhQR4P8P9zK/chesx5xznW
X-Gm-Gg: ASbGncu98Ym79zeIXF3qkUZAK1vscx+9t4rcbVLyK/rAtlUMT0IFpLkdVoQCUnHG0Yp
	ujPIG2g3B04ddFneqxTFe3EVHd9KVWqrOgciGKf8KtaoCNN+Eg/Mnpzk3CJ1IDJWMLOk6p3Sj5Q
	1EZe/Jgodt+vGLdohnPBqTyextnocz/LXM8VAe3Su0G2veSjaJa9nI+mD0vKPsgdoM4uzTej6G+
	KhkgCIQu5tf6OGDc9TplKsYLq8StMtpBxcDhDmdlI5mgS+qhX/LVLaC5J0i3RxSoK8PAq5Dh1jh
	5czx6N1ojWE1
X-Google-Smtp-Source: AGHT+IEH1HYet/cTCj2aXSyyZiV9HwWqewoRD3tX+XWKyrvQKLMujhqSX93kDRTXrgJqgzxFO2H9Rtj07lfRGWZ366k=
X-Received: by 2002:a17:902:e5c6:b0:270:bd33:f8d0 with SMTP id
 d9443c01a7336-294de75d9f2mr2463525ad.14.1761695334995; Tue, 28 Oct 2025
 16:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
 <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com>
 <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com> <aPsuD2fbYwCccgNi@intel.com>
 <ca688bca-df3f-4d82-97e7-20fc26f7d69e@intel.com> <68fbd63450c7c_10e910021@dwillia2-mobl4.notmuch>
 <2e49e80f-fab0-4248-8dae-76543e3c6ae3@intel.com> <68fbebc54e776_10e9100fd@dwillia2-mobl4.notmuch>
 <10786082-94e0-454e-a581-7778b3a22e26@intel.com> <CAGtprH8AbW4P2t-wHVcTdfLwf3SJK5mxP1CbsMHTgMYEpLiWjQ@mail.gmail.com>
 <68fc2af6305be_10e210029@dwillia2-mobl4.notmuch> <CAGtprH8-UGFkh4NmuY1ETPYmg7Uk+bm24Er2PPxf8tUOSR_byQ@mail.gmail.com>
 <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch> <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch> <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch>
In-Reply-To: <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 28 Oct 2025 16:48:42 -0700
X-Gm-Features: AWmQ_bmtZqgTQwT0jpqG7SIdFIelXscyZJ7yedZ8yMDeBBP-fQ391CU839cFBM8
Message-ID: <CAGtprH9HnuDy4TDZ145-a0LWs7Y=94RSiEkTR++e1Ws6wLUbQw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: dan.j.williams@intel.com
Cc: Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	"Reshetova, Elena" <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 7:13=E2=80=AFPM <dan.j.williams@intel.com> wrote:
>
> Vishal Annapurve wrote:
> [..]
> > Problem 2 should be solved in the TDX module as it is the state owner
> > and should be given a chance to ensure that nothing else can affect
> > it's state. Kernel is just opting-in to toggle the already provided
> > TDX module ABI. I don't think this is adding complexity to the kernel.
>
> It makes the interface hard to reason about, that is complexity.
>
> Consider an urgent case where update is more important than the
> consistency of ongoing builds. The kernel's job is its own self
> consistency and security model,

I would consider the TDX module as more privileged than the kernel
itself in certain aspects. So it's not fine to expose an ABI to
userspace which affects kernel state consistency, but it's fine to
expose an ABI that can affect TDX module state consistency?

> when that remains in tact root is allowed to make informed decisions.
>
> You might say, well add a --force option for that, and that is also
> userspace prerogative to perform otherwise destructive operations with
> the degrees of freedom the kernel allows.
>
> I think we have reached the useful end of this thread. I support moving
> ahead with the dead simple, "this may clobber your builds", for now. We
> can always circle back to add more complexity later if that proves "too
> simple" in practice.
>
