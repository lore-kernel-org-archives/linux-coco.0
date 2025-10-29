Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25FD2D8390
	for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 00:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699389; cv=none; b=L2ZmCmsTBMo145DABtnb+P0ZysvxaTIetdsoxevgFmsGF1FfBhiwRHTmMwbYFaQ6Fk6OyYdokTy0Ceb/G4CYXkPwkXYwFWtNFTTiW6LTDwHaGTtJqmwOiqSceBw+hhXhkvFZAehdVHE43VecUQ/nohxPl16ZNjoI+LFHdQ1bI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699389; c=relaxed/simple;
	bh=h/EPR5R47qLSS906RL+S0spd7IC9iAe0ya9Jgl77/eI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FZTX2u8m8oxz2nHk/j2H262lif9H8HhfN3bT/S1wCwxEYfWjvCtyTUuIBi0MTBZeuKJgWNOrKHyLGap9+rSEmCmAd0LJjX+enRv/k7R9aPDqXPemQ/ha8UBC1uWgMaZlvw3RQ0Ks1v4jtDkbpH8+rJW3oQIW9ITVVlRC7SSY/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=odJxsTH5; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="odJxsTH5"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b62ebb4e7c7so5212018a12.3
        for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761699387; x=1762304187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upoMfybmbc/1ds2YKNLV5b3LJhcfmEcs/moGK/drz3I=;
        b=odJxsTH5e6bVIIGTTnXgG3yTqqmihGyiKXDRlryIFJ87hU+2z7iELx+BKV0u9UOp6Y
         DckWmQy7aTX0PYDfVTSnr3AfHUAssZqwBKZ5k6KM+Fk+pjnYi/NvF3hTJnIKnzzA+3NA
         gl8OScUwCUTeGSYg92S56mFtK/LxoLOvMnNjrBwlipgXS2k1l2gpoPEGskAanXp2Ncjt
         AXh1qTzdtimHdOFDiq7D0L5GHi3OSn41JnMo8JMcb4IbX/qfa1qpoR1MO5tMIIEHMMr9
         lhGCFKuMlsIoD8ce3Ora76wxjmWU47skuyslzW3jw/oXh/TgC6mH3fljH54uA07u7En8
         ga5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699387; x=1762304187;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=upoMfybmbc/1ds2YKNLV5b3LJhcfmEcs/moGK/drz3I=;
        b=e8Ht01woh+J4Se/7aLGRqq2HoNpf8nDvUWW4Ocjq6fKgAQn1zgRG1QRQyrDCgX4Sts
         xR5Yf9HU2QvRhU/pceA1BQ5SHg9mcIXPCKC+xeV5X0ka7nDZ7uSbiHNb4i0oyuKQPIGs
         IqUo7rNtDUV74RtbVId0waJREpYpX3KVlaUcwUbxrczAX5r1jMGh7CoTui9MJP+O4CTl
         NgZLenZjvxkmemNeTXF7lo+o06rfFzOO/H3ZeP5stkAvEf1xs+rJ8+lzgwiBW0Klw1Cb
         DyBgRLydrng5y2cO+9af16vapyNYbhA12Zy2uXQXKeYRsMq3FMQ784FlKatdc9Zj/Cr4
         TCYw==
X-Forwarded-Encrypted: i=1; AJvYcCU2E3SByczBidBSpSvmrBEu5AbtDvVmukvTlKEM7HLklwmYt/xuklhDbxZJfJ66miBcKg4h6+Kz77U6@lists.linux.dev
X-Gm-Message-State: AOJu0YyxYB9cT2sbnh6PksjvdtoRNwZF88U9G2Eyb0nQNBzvNCCYVZ01
	zTBZloM8ui97labam0x3P5NWmHzA9Jb2REs4110OYd7SMOLolLq8AAzcMzcqnQkvJPfjskI+tN0
	UX0sCMw==
X-Google-Smtp-Source: AGHT+IF+uxnoaodwmY/BiGEU5Z7mQidEmCh9G0+H4xmKLgoqPmRen8KmIjN2RVaOC05lHdTEPvjF5gcEGj4=
X-Received: from pjha4.prod.google.com ([2002:a17:90a:4804:b0:33b:cf89:6fe6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57c4:b0:33b:c995:5d92
 with SMTP id 98e67ed59e1d1-3403a2aab6dmr1121219a91.32.1761699387051; Tue, 28
 Oct 2025 17:56:27 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:56:25 -0700
In-Reply-To: <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <10786082-94e0-454e-a581-7778b3a22e26@intel.com>
 <CAGtprH8AbW4P2t-wHVcTdfLwf3SJK5mxP1CbsMHTgMYEpLiWjQ@mail.gmail.com>
 <68fc2af6305be_10e210029@dwillia2-mobl4.notmuch> <CAGtprH8-UGFkh4NmuY1ETPYmg7Uk+bm24Er2PPxf8tUOSR_byQ@mail.gmail.com>
 <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch> <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch> <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch> <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
Message-ID: <aQFmOZCdw64z14cJ@google.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
From: Sean Christopherson <seanjc@google.com>
To: Erdem Aktas <erdemaktas@google.com>
Cc: dan.j.williams@intel.com, Vishal Annapurve <vannapurve@google.com>, 
	Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025, Erdem Aktas wrote:
> On Mon, Oct 27, 2025 at 7:14=E2=80=AFPM <dan.j.williams@intel.com> wrote:
> >
> > Vishal Annapurve wrote:
> > [..]
> > > Problem 2 should be solved in the TDX module as it is the state owner
> > > and should be given a chance to ensure that nothing else can affect
> > > it's state. Kernel is just opting-in to toggle the already provided
> > > TDX module ABI. I don't think this is adding complexity to the kernel=
.
> >
> > It makes the interface hard to reason about, that is complexity.
>=20
> Could you clarify what you mean here? What interface do you need to
> reason about? TDX module has a feature as described in its spec, this
> is nothing to do with the kernel. Kernel executes the TDH.SYS.SHUTDOWN
> and if it fails, it will return the error code back to the user space.
> There is nothing here to reason about and it is not clear how it is
> adding the complexity to the kernel.

Userspace needs to reason about error codes and potential sources of those =
error
codes.  That said, I agree that having the kernel set AVOID_COMPAT_SENSITIV=
E by
default (I vote for setting it unconditionally), doesn't add meaningful
complexity; the kernel would just need to document that the update mechanis=
m can
return -EBUSY (or whatever), and why/when.

For me, that seems far less daunting/complex than attempting to document wh=
at all
can go wrong if the kernel _doesn't_ set AVOID_COMPAT_SENSITIVE.  Because I=
MO,
regardless of whether or not the kernel sets AVOID_COMPAT_SENSITIVE, the ke=
rnel
is making a decision and defining behavior, and that behavior needs to be
documented.  If AVOID_COMPAT_SENSITIVE didn't exist, then I would agree thi=
s is
purely a userspace vs. TDX-Module problem, but it does exist, and not setti=
ng the
flag defines ABI just as much as setting the flag does.

The failure mode also matters, a lot.  "Sorry dear customer, we corrupted y=
our VM"
is very, very different than "A handful of machines in our fleet haven't co=
mpleted
an (optional?) update".

> > Consider an urgent case where update is more important than the
> > consistency of ongoing builds. The kernel's job is its own self
> > consistency and security model, when that remains in tact root is
> > allowed to make informed decisions.
> >
> The whole update is initiated by the userspace, imo, it is not the
> kernel's job to decide what to do.=20

I think you and Dan are in violent agreement.  I _think_ what Dan is saying=
 that
the kernel needs to protect itself, e.g. by rejecting an update if the kern=
el knows
the system is in a bad state.  But other than that, userspace can do whatev=
er.

AFAICT, the only disagreement is whether or not to set AVOID_COMPAT_SENSITI=
VE.

> It should try to update the TDX module and return error code back to the
> userspace if it fails.

+1.  Unless there's a wrinkle I'm missing, failing with -EBUSY seems like t=
he
obvious choice.
=20
> > You might say, well add a --force option for that, and that is also
> > userspace prerogative to perform otherwise destructive operations with
> > the degrees of freedom the kernel allows.
>=20
> IMO, It is something userspace should decide, kernel's job is to
> provide the necessary interface about it.

I disagree, I don't think userspace should even get the option.  IMO, not s=
etting
AVOID_COMPAT_SENSITIVE is all kinds of crazy.
