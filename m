Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB731D554
	for <linux-coco@lists.linux.dev>; Sun, 26 Oct 2025 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516128; cv=none; b=OJBkxJrQxB+UwmkggZEF94SATtTJTnAOV0XDIhGgoy2n2pQhS5DDqY21CmjjONT8BeFzR//9yihbVVyno3+iAlzl8RIB4tiIwOlBogNd5eutcGRT/poupLUcu9GLgyCJzcn14O0+Z2Kr9TNSQdVWyGuhu9WGKifNHWZUpxI4gds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516128; c=relaxed/simple;
	bh=3+fgENP1ZH4cyV41Y+zrMzSCQC/sRXBIU0RStkeCUOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcdE+AY5JCbX8KOOTImrdS3PBKWkbdvYiAFkvcQq9EsvsYXk1luzqjEzREYlxLd1CRuMusxAiTDtL3gnsUfVlyHhUmHlNWE/OFQcYO9CBAL8leO5a0lZ6J5Iqgg19PlXZMc2Xzh08UtVlq3urOlaR/8dTw9KybWju85aazx1TLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PZYfjPOE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PZYfjPOE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27d67abd215so256845ad.0
        for <linux-coco@lists.linux.dev>; Sun, 26 Oct 2025 15:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761516127; x=1762120927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+fgENP1ZH4cyV41Y+zrMzSCQC/sRXBIU0RStkeCUOw=;
        b=PZYfjPOELQ980nokOWUv2yG+uFAATzLupY/P4Xi9JIleh2TFQtIDLLTVhlJARRqi1w
         azlu0E4DCboJJV9zyGviisiEkLY65io0Sc52OFuma3XOITb1iXmek9AbbK5MUmItpHJ7
         Vo3KDUDEW34lJRtZ3K4BJQH7ecGKdYqVINeZvZj4ypUt7vTJ9J/rcjnKsD9nL3hXwwo8
         Fm57N950rhD4fq3oa04/Wq2UZ1yvOOTUtjTa3FWOUcf9IW/rWiO51pD3BY+14lsZpmLG
         LaRqpdDI+6GIui4YRirTw6ulKPd4bR8Whawl3Yk5RA3GNlxsudqjo20mgr0kN3QrMOxd
         yDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761516127; x=1762120927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+fgENP1ZH4cyV41Y+zrMzSCQC/sRXBIU0RStkeCUOw=;
        b=HxhzKBlq4oFr/3egoNms8JbJ4OVpzxF56CPwthqJXveZi2BM8m5Vxne4ySfsv3rDMT
         jS1Ir3unE19CqavYlqvmBhMrYRAIi2WrO6KidDF7HbQLDxXlMYzuLdv5x2e1+DwTr8DC
         42K6qsq4xJS9cBZcR0RpAseF69pbyxr9OUl8inaOu6ZrOqZEN7IeyM9CtSK0NLH6HwYA
         369fi6nZxjZls4a0s5kSpl85o6Ry6uN8eu3pydPssMF7eR/kcJfqnUi4Doelo2BkWyuY
         tM6mZSR0nmX6ji2KnwvhgQM1Xz7wto4piiZbuPKVvlM2yPxm0BZJZ4B78U7bCatrGQ29
         eFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwL6Mp1cWIelw83HXWLiiceYPyVbJbajqL6IBE2x9e9KflM9PlVWCjlr0Bojdnbe2ycFabj8Ztcv90@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn/BBjHM+FnkFwJsfcR7O+1WmdYmPWD1pXTon4ZOp7gWjw4ujg
	F9JK7Qt7ofanz9ssFXoPOg/jf0CWk49yZG6FVoMw6oluAWsqvvwO2kLdhuKUrozoJdokw3v2y8+
	Y/A/il0ZMSfraCo2VFL32ioEryUNl1y3pjCI2oe/w
X-Gm-Gg: ASbGncs8oTE+sxomx2hmsDayb1J0ehszD8+3z6518OoLuvO/l3W3sYxWhrUJo4QTZsa
	mIw2d4RWlg4e6vjRv5EFLRnsVNowOseORtecZeCWxihLubQ+gcHZLLzJ0ytzJmBfrGeCfvp9gcS
	oNpZUS69ZePdqDFVUPLzj0Dz1BNyEWJUg9tIKXes2Rqt4rSmE9BDpfGy94nT38zi+lP+AkRVqrk
	qFL6NJQumDq4o1wdYcCgmHdBQXwBgbSEHe/qWqsYkyZT2b3TWnSGZQnVVkPqQdOkLA6fM07fOX7
	qFTKBj46bsM3fvzI8xuYPnXn7g==
X-Google-Smtp-Source: AGHT+IHx53+OT/iU5ncrV7eLgcmP7WB6YYEN+QheTqXjctli+ZTT136PerVE69TnyO4Xpuz74P93dggE62/a9ay0GUE=
X-Received: by 2002:a17:902:d2cb:b0:292:64ec:e0f with SMTP id
 d9443c01a7336-29497c21fb6mr5956275ad.6.1761516126042; Sun, 26 Oct 2025
 15:02:06 -0700 (PDT)
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
 <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch>
In-Reply-To: <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sun, 26 Oct 2025 15:01:52 -0700
X-Gm-Features: AWmQ_blT1zj6KKe0CRTsU1n5euwANUl1olNBkqvjxuYAuzV9TOvr6vNZnzbUBTw
Message-ID: <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
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

On Sun, Oct 26, 2025 at 2:30=E2=80=AFPM <dan.j.williams@intel.com> wrote:
>
> Vishal Annapurve wrote:
> > On Fri, Oct 24, 2025 at 6:42=E2=80=AFPM <dan.j.williams@intel.com> wrot=
e:
> > >
> > > Vishal Annapurve wrote:
> > > > On Fri, Oct 24, 2025 at 2:19=E2=80=AFPM Dave Hansen <dave.hansen@in=
tel.com> wrote:
> > > > >
> > > > > On 10/24/25 14:12, dan.j.williams@intel.com wrote:
> > > > > >> The SGX solution, btw, was to at least ensure forward progress=
 (CPUSVN
> > > > > >> update) when the last enclave goes away. So new enclaves aren'=
t
> > > > > >> *prevented* from starting but the window when the first one st=
arts
> > > > > >> (enclave count going from 0->1) is leveraged to do the update.
> > > > > > The status quo does ensure forward progress. The TD does get bu=
ilt and
> > > > > > the update does complete, just the small matter of TD attestati=
on
> > > > > > failures, right?
> > > >
> > > > I would think that it's not a "small" problem if confidential
> > > > workloads on the hosts are not able to pass attestation.
> > >
> > > "Small" as in "not the kernel's problem". Userspace asked for the
> > > update, update is documented to clobber build sometimes, userspace ra=
n
> > > an update anyway. Userspace asked for the clobber.
> > >
> > > It would be lovely if this clobbering does not happen at all and the
> > > update mechanism did not come with this misfeature. Otherwise, the ke=
rnel
> > > has no interface to solve that problem. The best it can do is documen=
t
> > > that this new update facility has this side effect.
> >
> > In this case, host kernel has a way to ensure that userspace can't
> > trigger such clobbering at all.
>
> Unless the clobber condition can be made atomic with respect to update
> so that both succeed, the kernel needs to punt the syncrhonization
> problem to userspace.
>
> A theoretical TDX Module change could ensure that atomicity.

IIUC TDX module already supports avoiding this clobber based on the
TDH.SYS.SHUTDOWN documentation from section 5.4.73 of TDX ABI Spec
[1].

Host kernel needs to set bit 16 of rcx when invoking TDH.SYS.SHUTDOWN
is available.

"If supported by the TDX Module, the host VMM can set the
AVOID_COMPAT_SENSITIVE flag to request the TDX Module to fail
TDH.SYS.UPDATE if any of the TDs are currently in a state that is
impacted by the update-sensitive cases."

I think the above documentation should replace TDH.SYS.UPDATE with
TDH.SYS.SHUTDOWN IIUC.

[1] https://cdrdv2.intel.com/v1/dl/getContent/733579

> A
> theoretical change to the kernel's build ABI could effect that as well,
> or notify the collision. I.e. a flag at the finalization stage that an
> update happened during the build sequence needs a restart. This is the
> role of "generation" in the tsm_report ABI. As far as I understand
> userspace just skips that ABI and arranges for userspace synchronized
> access to tsm_report.
>
