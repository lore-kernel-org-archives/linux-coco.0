Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7B347BC1
	for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670849; cv=none; b=ayTxbUzI7xzDif7xumNeSDjg71rtode/oqbeY+i0N1rceDcq0fCQU0jxTSSb0wcieQ5PPfymCFyi8vocVxml+FMw9Eugz8FQB4rg1drECgt/u+YMsVJEp5JDOyJQplgMEyob39uvS8RuApJD44cr3eFHGKrBYmmFZueidlqtUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670849; c=relaxed/simple;
	bh=g/uiqEmrptpwYBpoPwnjhOXKojAZx9tL1vVhQ4F/aRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPTMffhXGxqD31IxNmnzkTX0EWNBzOZc64d6p3A+EBl7J4GbY7yL28rC4bu2MVMX3RJIGY8EfRN6bJiOF8MRJyu+JBQiDZcu6gkqVGRQnJicOJ8fBk9AeyRanVK7BFjnlxIP7szxN1kIZbVVsJP/hBGt1zeMDTeag426ISQRLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wbo+PUEK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wbo+PUEK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eccff716f4so13551cf.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761670846; x=1762275646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymhLdUjfEry+7JCcuhj3KWzC+4LjjJWTF7Kjhp6jhjk=;
        b=Wbo+PUEKC8WvT6Xb7qb2omhpBSz0oXJ0EhDTBBmSTlHu6HrH0x6m8ZAvSJzrzkVzgR
         SnUd8Ed77SZ0zoUrkY22V+kAXBROd/akugV0aoKIeiGTd1mfhd1W6suq8dKh0ontL7n+
         zb2QdvURx309lJMqp+kIeJHxeZq44ExSitsDYy1OStcd5P8/1EQN2qVUpnCiUjg/V9XZ
         HW1RR/KthbFegdgAhNOTdgZFZuBxOA/TwBpDW7Fz+tGXaymVyEYOGWvQNA54ptlPkViz
         Ra98BlYNlpyZmmRVwdqT2VJyO5oA+MVNUgGrCgSiUw7vPosVOVPIKUcr8sNDzWrjX5mU
         J98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670846; x=1762275646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymhLdUjfEry+7JCcuhj3KWzC+4LjjJWTF7Kjhp6jhjk=;
        b=eDH1ePfbSurtWy77dOQf8hOZIalH0l61BaZDo4GD2kSqVGcmwrHs8euqVT0JLFInfj
         MTn5qwyS45TdKZ5Y26A22gTVIY8lzvSnNMXCJJVLfnbdhjDQffPbTYK36iZC9XFZfl98
         9LTQm/KITgSIUPJ3p5X2don0841S420kuRP97C0yyWC94EXn6qs3GRPZ6e8m9GBMoaEd
         z/NhTyJxz45txRtaFMT/YnKofWqpUMh8cZAZX0l+w6mLYu+pxm5rVfRlfHWDl3n2Mrmj
         g9XtsRBsxzkIUNWgVdzcNdrpq9W4mevUPEYa1cW6byshcSMyWmJ9tR+ooohdfZs3k0oh
         JMHg==
X-Forwarded-Encrypted: i=1; AJvYcCXAKaVAwpQ/+sPXNxXGXmcX/Cyt2A1WWF2kYXV3LiycCZ/YQnp+9BBQdEq3noQLmtcLtM1Na9i8GwN3@lists.linux.dev
X-Gm-Message-State: AOJu0YxQZgUhtlX8OLAKM4P0O5fYE7FB7anNUEKrpyHzkON9jD9ZMtY2
	K3kZ9KXh9OIwdksTOAKTilFuHNj5RrNWIiSUZmpVSCroBnIM8U8S0yBFX2pK0rF1L0KeuzgHh08
	4mSdLZ0e0mbGE/v52KQTNg694+UIVe1xoxwF6SsGM
X-Gm-Gg: ASbGncuij6O+bvAa9/QWLd4lbVQbKB1L4RCxwyBGuMmbRE5V+IQzK1/XhOMpuRCtzmO
	saGVgTBBGQP54DnaMauAnOA/6RkKXd6hr3Ds3OluAADjrvwY8lCI65q0fKAD+KOazBmxU2Rhz2w
	g2empz+3O24t8pZMzie2CUgYZMl1526nbMUlxolnZiLzri1npXenp3Je2NQq9J28x07dAfx1Gyb
	/RYrqvulFl9rAWt9owVfy13/T0o9TWPZ51Udo8VuGgZhFENEJ0eW+5vtsFtS37C6n62PanNBhPc
	mgG3CD6BleCrByPmquM=
X-Google-Smtp-Source: AGHT+IHyhkm3tR9F0mqv1QXKXIaXgaswMT2j2D1U7qNy7CtaaUGkQn3tCNFrFZZKO8dssK5KR/ucsz9eeFBRSK6LxOY=
X-Received: by 2002:a05:622a:54d:b0:4b7:9617:4b51 with SMTP id
 d75a77b69052e-4ed09f6d3bdmr7041871cf.15.1761670844795; Tue, 28 Oct 2025
 10:00:44 -0700 (PDT)
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
From: Erdem Aktas <erdemaktas@google.com>
Date: Tue, 28 Oct 2025 10:00:08 -0700
X-Gm-Features: AWmQ_bl3mec0vhrtc2OMEcKfy_qXF-d9Dr_bCbW-PlnLUi3AroNlYS0DnjyIPbk
Message-ID: <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: dan.j.williams@intel.com
Cc: Vishal Annapurve <vannapurve@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	Chao Gao <chao.gao@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
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

On Mon, Oct 27, 2025 at 7:14=E2=80=AFPM <dan.j.williams@intel.com> wrote:
>
> Vishal Annapurve wrote:
> [..]
> > Problem 2 should be solved in the TDX module as it is the state owner
> > and should be given a chance to ensure that nothing else can affect
> > it's state. Kernel is just opting-in to toggle the already provided
> > TDX module ABI. I don't think this is adding complexity to the kernel.
>
> It makes the interface hard to reason about, that is complexity.

Could you clarify what you mean here? What interface do you need to
reason about? TDX module has a feature as described in its spec, this
is nothing to do with the kernel. Kernel executes the TDH.SYS.SHUTDOWN
and if it fails, it will return the error code back to the user space.
There is nothing here to reason about and it is not clear how it is
adding the complexity to the kernel.

>
> Consider an urgent case where update is more important than the
> consistency of ongoing builds. The kernel's job is its own self
> consistency and security model, when that remains in tact root is
> allowed to make informed decisions.
>
The whole update is initiated by the userspace, imo, it is not the
kernel's job to decide what to do. It should try to update the TDX
module and return error code back to the userspace if it fails. it is
up to the userspace to resolve the conflict and retry the
installation. If you are saying that the userspace is not trusted for
such a critical action, again the whole process is initiated and
controlled by the userspace so there is an inherent trust there.

Consistency? How does td preserve failure impact the kernel
consistency? On the contrary, bypassing AVOID_COMPAT_SENSITIVE will
break the consistency for some TDs.

> You might say, well add a --force option for that, and that is also
> userspace prerogative to perform otherwise destructive operations with
> the degrees of freedom the kernel allows.

IMO, It is something userspace should decide, kernel's job is to
provide the necessary interface about it.

>
> I think we have reached the useful end of this thread. I support moving
> ahead with the dead simple, "this may clobber your builds", for now. We
> can always circle back to add more complexity later if that proves "too
> simple" in practice.
>
It is not clear how you reached that conclusion. We are one of the
users for this feature and we have multiple times explained that we
prefer failure on update if there is any risk of corrupting some TD
states. I did not see any other feedback/preference from other users
and I did not see any reasonable argument why you are preferring the
"clobber your builds" option.

Also the "clobber your builds" option will impact the TDX live
migration, considering the TDX live migration is WIP, it will be
definitely very hard to foresee the challenges there you are
introducing with this decision. How about TDX connect? Are we going to
come back and keep updating this every time we find an issue?

Since the update process is initiated and controlled by userspace, it
is the userspace application's prerogative to make the informed
decision on whether an urgent update warrants potentially destructive
actions. The kernel's role is to provide a reliable mechanism to
interact with the TDX Module and report outcomes accurately.
 Ideally,  ABI should allow userpace to provide flags which can be
also used to configure the TD preserve update option. If you do not
want to change ABI, you can make those as module param so userspace
can make a decision by itself.


To address some of your previous concerns:
It shifts complexity to userspace which is something everyone here
seems to prefer. The problem is that the TD Preserve update would
corrupt the TDs who are in the build stage (also impacts TDX LM  and
possibly some TDX connect functionalities) and since the TDX module
would know about it,  this will make sure that they will not be
corrupted hence it is a fix for a problem.

TDH.SYS.SHUTDOWN may not succeed due to multiple reasons like
TDX_SYS_BUSY  therefore it needs to handle the error cases anyway and
should return the error to the userspace.
Now userspace can decide whatever logic it has to finish/cancel the
existing tdbuilds and retry the tdpreserve update.

You might be concerned about forward progress. As I said above, there
might be some other cases which might prevent the td preserve update
to succeed so forward progress is not guaranteed anyway and it is not
the kernel's job to figure it out. It will return the error code back
to userspace and let the userspace resolve the conflict.
