Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2854438B
	for <linux-coco@lists.linux.dev>; Sat, 25 Oct 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761393707; cv=none; b=sHeughXKXoIrqx7sirJy3jt5Ls5NAcm6bH5av6vnOrpis1Wa53kGgGBtfzEhKGj3M1ttXtnw1Nv49Q/mWHW6MLn7AxX9MmspdKQZCGmvMF70WWsnV/8Yl9kf5uxYahtyHNGFv2Hpre3tKhq6m+YJO6nE/+T3LuDQTDenKpnXuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761393707; c=relaxed/simple;
	bh=Ujk6iqU9KVQba16+hYEER1mwVvVVDjpdFhZvHMW80rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nj/XQpPUmic0j7HuD3Ek24poV/a8XXW9QHKjNUiYDuPv2seCXUi8iOLp6Ak7HwdY2+DF9OntknMo3yHRZBru5Ni43w5oc/zcunXdiT9Ua28S8wIbk4RguBrijcECsqRMXjv3f+L0FqyShV2iWae5/1+ihR73H3BqTYaaGAQ3UKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gOd744Ls; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gOd744Ls"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-290da96b37fso92965ad.1
        for <linux-coco@lists.linux.dev>; Sat, 25 Oct 2025 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761393702; x=1761998502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UizpXQElhPRHwiW9M8i1Z/oMEyZZiusg6Iw3HkMKgh0=;
        b=gOd744Lsna8d0Umt6oaL6z4O7Q44hOSpieGRj3hvJFauXhDBn5tlBvbJ6tYTbYz7Cf
         7qzMVh9AFGmfIKqco8VurPh/Jl+7/tIyytNJHm8n5XSsun0EbORRMaknw1TT6dPINVpF
         kIi/q+Q0u5TiN+kfdb+BKbK/AksAZwXeiEFFG8rvGdwf9fg6IRQfi0Cf20VMHhfDyTqu
         23Qj+8jvyNPnr/A+YzFD8S+04HoSkrayccVahQOtq3pCtlvrulI4VGTY5rY2FBoAbG2b
         Zy3UnBAerPcK12niBgHHgOesrNGMMmg+LxHBcLlv0YUU1S5sMtQ+bya31C8Vq397pXLh
         +/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761393702; x=1761998502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UizpXQElhPRHwiW9M8i1Z/oMEyZZiusg6Iw3HkMKgh0=;
        b=ZHgOYwaU+xH86DO74+29ka6SG0DJf7tQ7S20sT4NoID4cQKmQoorluALchRMrCJ2Ye
         QZapD7NJZEPX0DWC4eIkgYneaXTJTMgfmDdc6ZbgfCCh0zlydOFsD/XWQ14D+ui/rU6x
         kxCIPeW0eJhD+ogdCt7Tw/4yLvLcvuEZqgaOTEwzAwAiBx0Ypm0jJBu3T7vh2esLRlGY
         uxJE3dcvcXY55CjLFSuwzaj7Q9JobgfmLw4V3DZrQgCI1txrm5sYR0TqgpR/1xkzZQ/S
         FwHUmqgO7mckS7Xip5dUxz5xvLSMp3aQkRMP5Va60cdRwQp2StJeL6aWKLAoXmNDyz0+
         kxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtnlQBQN6TAtAwqXCVm+6/yJ1ed6vT4GWl9k4hCW43bl7M40pEkWqoUyNeQZMQyGW8duYwgfjhK05@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkvb/KPCnNXgijOFNOv+YdWM1PNqLFprSQgxXOVhmMlNGTBZI2
	xAvTCEOt/stiyojRrsjSvfHEAE6ek9gEvvq1UBz/XgIHbvV//U5tjkS6MLf0GL0H5m2fy+nCwrx
	ocqLHQC2SEoTf3obHccucLFsWhTmVYmGxQiU2MR6X
X-Gm-Gg: ASbGncvlTcXsVOLBFAiguc5E5Vfztrg1Be/ODz0IY4JN3lqv1Wst+VVBypv1RcmoeV2
	qUGs9jVE3nAyJybd1MWlGVsW7nvtdXB72uENXLpUXZWSrkF6QhUwAopjl0NI/28neVWzX3Uy120
	Lyd9esRBtDhP6ZDQO4wE9NR7QkxZG4UuI2UFLcTIJRWKzpgfmKbR/couTnpnENQB/R1Im6vYyLW
	YAdMJY/w0Qh6SkIdx5I/XXstY51jmsMK9UQRfipPBIcApase4yPVH3dz4Yic137Jc+4BA7htDxu
	4eYQ9PgX5Kf/wRt8hKs15gdOWwc=
X-Google-Smtp-Source: AGHT+IEI2TSIun1IQZ8gSsT/X/tnWJAFJ2FTuEjF7iDh6pIoKmtjLLDyAcns7/bM8l2+hr917GxvO4CZCLFjLdxLWAI=
X-Received: by 2002:a17:902:c951:b0:290:be4a:40d2 with SMTP id
 d9443c01a7336-29497dd75e0mr2938595ad.13.1761393700674; Sat, 25 Oct 2025
 05:01:40 -0700 (PDT)
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
In-Reply-To: <CAGtprH8-UGFkh4NmuY1ETPYmg7Uk+bm24Er2PPxf8tUOSR_byQ@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sat, 25 Oct 2025 05:01:26 -0700
X-Gm-Features: AS18NWBG8_jgcTaN3yRxZ4uL7cLH-mCOXBGmB6GYKsB1rQG36As2Sx9bgP6jg5E
Message-ID: <CAGtprH9pBFENEOs7fcu-UMwU6Eiygw3h8L_Yxvc5S4mNsZvPxA@mail.gmail.com>
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

On Sat, Oct 25, 2025 at 4:55=E2=80=AFAM Vishal Annapurve <vannapurve@google=
.com> wrote:
>
> On Fri, Oct 24, 2025 at 6:42=E2=80=AFPM <dan.j.williams@intel.com> wrote:
> >
> > Vishal Annapurve wrote:
> > > On Fri, Oct 24, 2025 at 2:19=E2=80=AFPM Dave Hansen <dave.hansen@inte=
l.com> wrote:
> > > >
> > > > On 10/24/25 14:12, dan.j.williams@intel.com wrote:
> > > > >> The SGX solution, btw, was to at least ensure forward progress (=
CPUSVN
> > > > >> update) when the last enclave goes away. So new enclaves aren't
> > > > >> *prevented* from starting but the window when the first one star=
ts
> > > > >> (enclave count going from 0->1) is leveraged to do the update.
> > > > > The status quo does ensure forward progress. The TD does get buil=
t and
> > > > > the update does complete, just the small matter of TD attestation
> > > > > failures, right?
> > >
> > > I would think that it's not a "small" problem if confidential
> > > workloads on the hosts are not able to pass attestation.
> >
> > "Small" as in "not the kernel's problem". Userspace asked for the
> > update, update is documented to clobber build sometimes, userspace ran
> > an update anyway. Userspace asked for the clobber.
> >
> > It would be lovely if this clobbering does not happen at all and the
> > update mechanism did not come with this misfeature. Otherwise, the kern=
el
> > has no interface to solve that problem. The best it can do is document
> > that this new update facility has this side effect.
>
> In this case, host kernel has a way to ensure that userspace can't
> trigger such clobbering at all. That IIUC is "Avoid updates during
> update sensitive times". Best kernel can do is prevent userspace from
> screwing up the state of TDs.
>
> >
> > Userspace always has the choice to not update, coordinate update with
> > build, or do nothing and let tenants try to launch again.  Userspace
> > could even retry the build and hide the tenant failure if it knew about
> > the clobber,
>
> IIUC host userspace has no way to know if the TD state got clobbered.
>
> > but be clear that the problem is the clobber not the kernel
> > doing what userspace asked.
> >
> > The clobber, as I understand, is also limited to cases where the update
> > includes crypto library changes. I am not sure how often that happens i=
n
> > practice. Suffice to say, the fact that the clobber is conditioned on
> > the contents of the update also puts it further away from being a kerne=
l
>
> The knowledge of things getting clobbered are well much further away
> from userspace.
>
> > problem. The clobber does not corrupt kernel state.
> >
> > > > Oh, yeah, for sure.
> > > >
> > > > If we do _nothing_ in the kernel (no build vs. module update
> > > > synchronization), then the downside is being exposed to attestation
> > > > failures if userspace either also does nothing or has bugs.
> > > >
> > > > That's actually, by far, my preferred solution to this whole mess:
> > > > Userspace plays stupid games, userspace wins stupid prizes.
> > > >
> > >
> > > IIUC, enforcing "Avoid updates during update sensitive times" is not
> > > that complex and will ensure to avoid any issues with user space
> > > logic.
> >
> > Userspace logic avoids issues by honoring the documentation that these
> > ABIs sequences need synchronization. Otherwise, kernel blocking update
> > during build just trades one error for another.
>
> Kernel blocking update during build makes the production systems much
> safer and prevents userspace from screwing up the state that it has no
> way to detect after the fact.
>
> >
> > Treat this like any other userspace solution for requiring "atomic"
> > semantics when the kernel mechanisms are not themselves designed to be
> > atomic, wrap it in userspace synchronization.
>
> In general if this is something userspace detectable I would agree,
> TDX module is the closest entity that can detect the problematic
> sequence and the host kernel has a very simple way to ensure that such
> a problematic sequence is not at all allowed to happen by toggling
> some seamcall controls. It would be very helpful IMO to ensure that
> userspace is not able to screw up production workloads especially if
> the mess is not all visible to userspace.

Detecting is one thing, undoing the mess is disruptive and not easy to
orchestrate in this case.
