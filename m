Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA121B041E
	for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649990; cv=none; b=c3htRYPfP5CEU8hzvZluA/evUNScY696BWOCiB/dW4wI//wnzXPB6eNKz3PEXpWyiKWxaxFZZ0F9CAnQwyD7nIKSewtVQMLLtlYcmfUmPUgNnvkB0zxlsfl9e0ZH++9Wf3/zRdG2JSulTIHG12EzGdYrgTuNbA4gn9X3SsNRXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649990; c=relaxed/simple;
	bh=vfTOYxh/W8fA0AZ1VgdPTr352ErbEQpVq+gf7IEjRQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxZC4eOJr7UExCCerJRaZoczcmbL6BrNuI/R9mfeP+NTsbnBBtHAbuD49qqwA5EpXUHuDO6lCpOpkRKNjxfgpUJ/J2tkR/ls8A/WZw4vWaNnjuOerWTAjL02B1TS8dQYJMYCLOGJ6Y5MlwpKTgCkaL1BbTfdIK+u4hbxq5Imcy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfuSf8NJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfuSf8NJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aab9e281bc0so239263266b.3
        for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 15:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734649985; x=1735254785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD4Thd4KkzdBJGBYH3K6zTCq+7QOeoHZ6dpA6P0m5yE=;
        b=CfuSf8NJ0MsvknOvU8yKxD+UQtwCoIH4K9rU0COC+BSKhODUXWTYO/VNg7RITpiIT7
         YxFK37X0gnQufViLpXAkH7uvAsGbvc38ChOuUvu6RKgsNOkvAPV2TwcfeIAqrxF8v6ef
         GiNwfDpDh2ve0UJU3SsWlGNthzGYzcE7S5M5SsyQ/HXCuxniaVCNMf0MzQ96EO0A7Xhs
         xEElQEf+zieEmW6dx1LtK346kTywn/dtQRt54rr65zgBFDDplElW+YxpGNtnd6M6FBGw
         u+8sRZ0If5K2LoAi3ZmX3y/MMXYLnZRoej6I/03tg9hBkpnS39BU4tS0wxAEJjBJDkMF
         dh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734649985; x=1735254785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD4Thd4KkzdBJGBYH3K6zTCq+7QOeoHZ6dpA6P0m5yE=;
        b=M1UQUUipuYA8bMMSh500iPTbYtIw4FIFSY4P7bxDU29WywWkxEUnY1AnEz4EP20FFz
         zYg6Qw2nQMZ//yr3ib+GuundXV+pwfuk2nMHhraAu4YijumXUAwVCVkwLbpSMVMccIjF
         pw3tjygLIkk+80VlolR8aD2dnOBtTyXms2wSn7q5IAgbJVC0B/U+iJ+QNfBgrw5IX4py
         GcQ4PQ38lq/d524WmxDX496xPtZZtsH21wiTKA7KX5sw1ASoumoP9/FQZWFY5rau44U8
         FEtBUnGZdjLmKDyVehI7adXQq5idcnoyv6/0iPF0ROo+o4TwsYmolRwGwyYDlnaCH1og
         Dh4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp8cPtfp6emdjN0HOVCcaQ20WPwyHTVD/p0l0QGTCvEYMHp9+F1Kd+u1KjXfGi1G2BUMqtFsSyT2ia@lists.linux.dev
X-Gm-Message-State: AOJu0YwscYcSxu73Tg9c7YfEcPVu5g0V/jW1GV4dGedxQx5pcju2nlx/
	sVVqUZjaU8WTTSfzQEV1DT1lN4Y/ryBwcQ7wc0ZeNG3RPZ5Dgl/66VlM0PjoMPbuuCzvTPH6qDV
	nzrkSyr0pfbfeoTyLmpya8wT6NK5lN9Y5Nw4V
X-Gm-Gg: ASbGnctiZYyzf2/MgAn/pwHhQxKhW54RWuTBUOHDgO+rSw5mxItA+kw7IH1TIhSE/Jc
	v4Al5xpNknc3Nc/DhvC7xd/rKS2kf2iNFSC43f8Ar+nfWD3NjMLn0A/j46HjXLsI=
X-Google-Smtp-Source: AGHT+IGAap4dLIZqyAkAJDuWCVAogXcnseA3ZJrMdxYOYUi/GG/q1lfxHW3tUgVkG41qVSJO7JW5GjpL+2yAH21h7CY=
X-Received: by 2002:a17:907:3607:b0:aa6:88f5:5fef with SMTP id
 a640c23a62f3a-aac2c9948d6mr45830866b.32.1734649985445; Thu, 19 Dec 2024
 15:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1734392473.git.ashish.kalra@amd.com> <CAAH4kHa2msL_gvk12h_qv9h2M43hVKQQaaYeEXV14=R3VtqsPg@mail.gmail.com>
 <cc27bfe2-de7c-4038-86e3-58da65f84e50@amd.com> <Z2HvJESqpc7Gd-dG@google.com>
 <57d43fae-ab5e-4686-9fed-82cd3c0e0a3c@amd.com> <Z2MeN9z69ul3oGiN@google.com>
 <3ef3f54c-c55f-482d-9c1f-0d40508e2002@amd.com> <d0ba5153-3d52-4481-82af-d5c7ee18725f@amd.com>
In-Reply-To: <d0ba5153-3d52-4481-82af-d5c7ee18725f@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 19 Dec 2024 15:12:54 -0800
X-Gm-Features: AbW1kvZoEAvkgy4KZcubE0kRWNzUwRqTCGcArrMk-RXVnif4_hRKzZpl9mHjKHc
Message-ID: <CAAH4kHYE6WQ3NXm9iwcf1FJo8SioZCU7iyU6=9omQ8YQb+czCA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Move initializing SEV/SNP functionality to KVM
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 2:04=E2=80=AFPM Kalra, Ashish <ashish.kalra@amd.com=
> wrote:
>
>
>
> On 12/18/2024 7:11 PM, Kalra, Ashish wrote:
> >
> > On 12/18/2024 1:10 PM, Sean Christopherson wrote:
> >> On Tue, Dec 17, 2024, Ashish Kalra wrote:
> >>> On 12/17/2024 3:37 PM, Sean Christopherson wrote:
> >>>> On Tue, Dec 17, 2024, Ashish Kalra wrote:
> >>>>> On 12/17/2024 10:00 AM, Dionna Amalie Glaze wrote:
> >>>>>> On Mon, Dec 16, 2024 at 3:57=E2=80=AFPM Ashish Kalra <Ashish.Kalra=
@amd.com> wrote:
> >>>>>>>
> >>>>>>> From: Ashish Kalra <ashish.kalra@amd.com>
> >>>>>>
> >>>>>>> The on-demand SEV initialization support requires a fix in QEMU t=
o
> >>>>>>> remove check for SEV initialization to be done prior to launching
> >>>>>>> SEV/SEV-ES VMs.
> >>>>>>> NOTE: With the above fix for QEMU, older QEMU versions will be br=
oken
> >>>>>>> with respect to launching SEV/SEV-ES VMs with the newer kernel/KV=
M as
> >>>>>>> older QEMU versions require SEV initialization to be done before
> >>>>>>> launching SEV/SEV-ES VMs.
> >>>>>>>
> >>>>>>
> >>>>>> I don't think this is okay. I think you need to introduce a KVM
> >>>>>> capability to switch over to the new way of initializing SEV VMs a=
nd
> >>>>>> deprecate the old way so it doesn't need to be supported for any n=
ew
> >>>>>> additions to the interface.
> >>>>>>
> >>>>>
> >>>>> But that means KVM will need to support both mechanisms of doing SE=
V
> >>>>> initialization - during KVM module load time and the deferred/lazy
> >>>>> (on-demand) SEV INIT during VM launch.
> >>>>
> >>>> What's the QEMU change?  Dionna is right, we can't break userspace, =
but maybe
> >>>> there's an alternative to supporting both models.
> >>>
> >>> Here is the QEMU fix : (makes a SEV PLATFORM STATUS firmware call via=
 PSP
> >>> driver ioctl to check if SEV is in INIT state)
> >>>
> >>> diff --git a/target/i386/sev.c b/target/i386/sev.c
> >>> index 1a4eb1ada6..4fa8665395 100644
> >>> --- a/target/i386/sev.c
> >>> +++ b/target/i386/sev.c
> >>> @@ -1503,15 +1503,6 @@ static int sev_common_kvm_init(ConfidentialGue=
stSupport *cgs, Error **errp)
> >>>          }
> >>>      }
> >>>
> >>> -    if (sev_es_enabled() && !sev_snp_enabled()) {
> >>> -        if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
> >>> -            error_setg(errp, "%s: guest policy requires SEV-ES, but =
"
> >>> -                         "host SEV-ES support unavailable",
> >>> -                         __func__);
> >>> -            return -1;
> >>> -        }
> >>> -    }
> >>
> >> Aside from breaking userspace, removing a sanity check is not a "fix".
> >
> > Actually this sanity check is not really required, if SEV INIT is not d=
one before
> > launching a SEV/SEV-ES VM, then LAUNCH_START will fail with invalid pla=
tform state
> > error as below:
> >
> > ...
> > qemu-system-x86_64: sev_launch_start: LAUNCH_START ret=3D1 fw_error=3D1=
 'Platform state is invalid'
> > ...
> >
> > So we can safely remove this check without causing a SEV/SEV-ES VM to b=
low up or something.
> >
> >>
> >> Can't we simply have the kernel do __sev_platform_init_locked() on-dem=
and for
> >> SEV_PLATFORM_STATUS?  The goal with lazy initialization is defer initi=
alization
> >> until it's necessary so that userspace can do firmware updates.  And i=
t's quite
> >> clearly necessary in this case, so...
> >
> > I don't think we want to do that, probably want to return "raw" status =
back to userspace,
> > if SEV INIT has not been done we probably need to return back that stat=
us, otherwise
> > it may break some other userspace tool.
> >
> > Now, looking at this qemu check we will always have issues launching SE=
V/SEV-ES VMs
> > with SEV INIT on demand as this check enforces SEV INIT to be done befo=
re launching
> > the VMs. And then this causes issues with SEV firmware hotloading as th=
e check
> > enforces SEV INIT before launching VMs and once SEV INIT is done we can=
't do
> > firmware  hotloading.
> >
> > But, i believe there is another alternative approach :
> >
> > - PSP driver can call SEV Shutdown right before calling DLFW_EX and the=
n do
> > a SEV INIT after successful DLFW_EX, in other words, we wrap DLFW_EX wi=
th
> > SEV_SHUTDOWN prior to it and SEV INIT post it. This approach will also =
allow
> > us to do both SNP and SEV INIT at KVM module load time, there is no nee=
d to
> > do SEV INIT lazily or on demand before SEV/SEV-ES VM launch.
> >
> > This approach should work without any changes in qemu and also allow
> > SEV firmware hotloading without having any concerns about SEV INIT stat=
e.
> >
>
> And to add here that SEV Shutdown will succeed with active SEV and SNP gu=
ests.
>
> SEV Shutdown (internally) marks all SEV asids as invalid and decommission=
 all
> SEV guests and does not affect SNP guests.
>
> So any active SEV guests will be implicitly shutdown and SNP guests will =
not be
> affected after SEV Shutdown right before doing SEV firmware hotloading an=
d
> calling DLFW_EX command.
>

Please don't implicitly shut down VMs. At least have a safe and unsafe
option for dlfw_ex where the default is to not destroy active
workloads.
That's why the 2022 patch series for Intel SGX EUPDATESVN on microcode
hotload was shot down.
It's very rude to destroy running workloads because a system update
was scheduled.

> It should be fine to expect that there are no active SEV guests or any ac=
tive
> SEV guests will be shutdown as part of SEV firmware hotloading while keep=
ing
> SNP guests running.
>
> Thanks,
> Ashish



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
