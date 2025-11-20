Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4019E97A
	for <linux-coco@lists.linux.dev>; Thu, 20 Nov 2025 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763681947; cv=none; b=RB9sDkg9MDLW5axcCFeMWuSriR+r1v/nW+fSRP15nSTfDny973UxXjZ93MYgsHfifcVuZEeqbGs2DETcg2RUd+2ZiyyYKLiLUCDPHF6T20aku9L1vul7lYdWftVwaAAv2oSYQsjlZE74iFyNZURsD/f6QUHPc+2ZtbQECdfcmFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763681947; c=relaxed/simple;
	bh=ZYNmZYllRTNWBYe7ZOvlJyMeCa59bMMBL1B+TkW3XaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obTY77G+S/lP5zA/XNwv7YHg7dG/sefT91QhukvMzJ2cISnaWbkHZIJ7lEJhsLGzYItiE/1gzgegYt+u/yjTyhCvhjukaBftFf5JGB5V8BCeE2JVH66+jl0Ue3G9ySGMrRCEoRGdvC7ujrvjj2ewmUYBq9+TXEg9I3jujbboaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nnhdfZXh; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nnhdfZXh"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ed67a143c5so123201cf.0
        for <linux-coco@lists.linux.dev>; Thu, 20 Nov 2025 15:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763681944; x=1764286744; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L6JWUodgb4X/+CMP4H+UWVqcxUy2vI0R2D+TXzVPJs=;
        b=nnhdfZXhkSvAycJLwSWahib3MHrSktZ0hvRqhamwQ08O+z0ObaU9bRrhqGUloYpoXa
         0cyKbPD8s+d0RtD4sK/rhrHka+QiG0bswyJRoHNtEyNp/A8U/MEILh5dWQswc2w3xNjI
         d99ZeF1XlqrMIWFNHVu3iH0zNYvpwYh33chxUjwSmpLpHZdyBjb9uge+pU21ypiV28tS
         SvXmfRcfG2DWG5KaYIK9uaolRWOfaohSxikJ+ACQ73/HLJU4hoFYerTRAbRPjuBB9Vxc
         t2Wx/0ZXm+Q814s8Z7eJZLhcv0ETcSBz0RrJideXSGunDeb9rjkqBKsUKYiN5mabyuc7
         onuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681944; x=1764286744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1L6JWUodgb4X/+CMP4H+UWVqcxUy2vI0R2D+TXzVPJs=;
        b=bT9dj8pisrcDJNONxXsa5crGoMomNdm1WaMGF9D1fNdf5pcihH3Ji7JK5v5/rF1VDj
         y9samZp88eVu5Qogeh4jVa6VjLdYN9Yszzmi9giG4a1AXBXpXIC1XqwbyuGo8x2dpEEY
         lC/x4NVurhtKrg/kM7/JKwzwAbpmZdce/slwpNFaxl9BOmH2PuO9E4GCMYVKew1pv4So
         udraXLxeRKS8j5UX6D/yvsnEh5NplimPDI9D0eyeCA2mFCU155zDgQBHF0er5QK2NHGZ
         nlq6UzaWreSv+/0XX2kf+mwiHuR55JYljrspvvsQicKfHvDpKVYC+0qJwJknCIB7OiBF
         OzOA==
X-Forwarded-Encrypted: i=1; AJvYcCX6XazxdarMtljMz3LEP4ETt0lP1V80H+iY6W3tnyDcSr/dME1jty23HOdMCARO+ZoTmYiqBq6qZD3V@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6t666xHtkmFSE1xkb0+x/KmbXF5N3XfHX5h28RXEDYfwZ56XO
	8k1zCxWvGTnTqmFfJB+3xvGgkKRlZr90eieJdb7kHFBOep1KkRkstuYqCaFfE134O8hkpfmCilY
	aPt/QPeqxBI8vecNkUknlrhoWjfhKABI6KWNcPFj5
X-Gm-Gg: ASbGncvd9FaGxn9Kr+cnqQva8jjMdTRxWYXMTOWz0bhtorBqrDeaTXKL7A+E6M7Y2Zj
	O2GXzFJpiSc1DLAgvf5ETeM+6Wdro6vCMd7oSIKcRg9WfWWt/7Zs+OhHs2NU1ecjNqlDvKBhhpP
	VXS1RKZjx5p+9EzrlKJ5G9X38TQWL+jAWPdOGmzjpXPtS2b7TeHmoaCbNL/Lx+tsvD2Yy/8J77z
	NSf+rX9RgYh+COagS6DMZBjU8h4TkE+6/wSmC7E/FCjHmRdDuav3wfehCaaSCwNrazW5yUW6GYW
	Lec7V9B7R65YQdOFCpgKZKdjvqnBDNl963OYcQ==
X-Google-Smtp-Source: AGHT+IGj84QICUXq2h7R5ub7llGnDsdYYfOk39nSSR5CMASOjcU3g5PeysqoaK8Kmj6jYMLMgoz7EiRsn57FZfGG77c=
X-Received: by 2002:ac8:57cd:0:b0:4b7:a72f:55d9 with SMTP id
 d75a77b69052e-4ee58751331mr707941cf.13.1763681944329; Thu, 20 Nov 2025
 15:39:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch>
 <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch> <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
 <aQFmOZCdw64z14cJ@google.com> <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
 <aQIbM5m09G0FYTzE@google.com> <CAGtprH_oR44Vx9Z0cfxvq5-QbyLmy_+Gn3tWm3wzHPmC1nC0eg@mail.gmail.com>
 <aQQkrx2hXkPdcifr@intel.com> <CAAhR5DE=Y_uU1N6NczvZ9AJ0C7K_KNU-9Y4bBcQLkoXUDkp9kg@mail.gmail.com>
 <aR6BRVAB6ANVLduo@intel.com>
In-Reply-To: <aR6BRVAB6ANVLduo@intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Thu, 20 Nov 2025 17:38:52 -0600
X-Gm-Features: AWmQ_bkeh2haCrKjsgYJSoxZA2hXaW8IhyVOKxKBFn8gnE3k0_YSSAavLHF-F8k
Message-ID: <CAAhR5DF1=iOMFXLsnYjgh2hxYPLLACAt3eUFciwDadeMDv4Kkg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, Sean Christopherson <seanjc@google.com>, dan.j.williams@intel.com, 
	Erdem Aktas <erdemaktas@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 8:47=E2=80=AFPM Chao Gao <chao.gao@intel.com> wrote=
:
>
> On Wed, Nov 19, 2025 at 04:44:50PM -0600, Sagi Shahar wrote:
> >On Thu, Oct 30, 2025 at 9:53=E2=80=AFPM Chao Gao <chao.gao@intel.com> wr=
ote:
> >>
> >> >A reference patch we tested for "Avoid updates during update-sensitiv=
e
> >> >times" and one caveat was that
> >> >/sys/devices/virtual/tdx/tdx_tsm/version was not available post updat=
e
> >> >failure until a subsequent successful update:
> >>
> >> I also tested this. It works well to prevent updates during TD build, =
so,
> >>
> >>   Tested-by: Chao Gao <chao.gao@intel.com>
> >>
> >> And I can integrate this change into my next version if you don't obje=
ct.
> >>
> >> Regarding the caveat, could you check if the diff [*] I posted earlier=
 this
> >> week can fix it?
> >>
> >> [1]: https://lore.kernel.org/linux-coco/aQAwRrvYMcaMsu02@intel.com/
> >
> >[Now in plaintext]
> >
> >I tried testing it with the 1.5.24 TDX module and it sometimes fails,
> >but the failure does not appear consistent.
> >
> >I added a local change to add the
> >TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE flag when calling
> >TDH_SYS_SHUTDOWN and TDH_SYS_SHUTDOWN fails as expected if a VM is
> >under build:
> >[ 1224.571177] virt/tdx: SEAMCALL (52) failed: 0x8000051200010000
> >
> >But then sometimes trying to finalize the VM fail with the following err=
or:
> >[ 1230.915145] kvm_intel: SEAMCALL TDH_MR_FINALIZE failed: 0x8000ff00fff=
f0000
> >[ 1230.948264] kvm_intel: tdh_mng_vpflushdone() failed. HKID 3 is leaked=
.
> >
> >At this point the module seems to be in a broken state and trying to
> >create more TDs will fail:
> >[ 1543.745606] kvm_intel: SEAMCALL TDH_MNG_CREATE failed: 0x8000ff00ffff=
0000
> >
> >Trying to update the module will fail shutdown with -ENODEV
>
> Can you apply this incremental change to see if the issue gets fixed?
>
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seam=
ldr.c
> index e525bbd16610..f0bea1fecc52 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -317,8 +317,9 @@ static int do_seamldr_install_module(void *params)
>                                         tdx_module_set_error();
>                                         print_update_failure_message();
>                                 }
> +                       } else {
> +                               ack_state();
>                         }
> -                       ack_state();
>                 } else {
>                         touch_nmi_watchdog();
>                         rcu_momentary_eqs();
>
>
> The problem is if the failing CPU is the last one to ack the TDP_SHUTDOWN
> state, the state will move to TDP_CPU_INSTALL state. Other CPUs may proce=
ed to
> install the new module before seeing tdp_data.failed. This disables TDX I=
SA, so
> any subsequent SEAMCALLs get 0x8000ff00ffff0000.

Thanks, I ran a couple dozen updates while TD was being built and
couldn't reproduce the issue with the new fix
