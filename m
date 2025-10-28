Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7E1BBBE5
	for <linux-coco@lists.linux.dev>; Tue, 28 Oct 2025 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761612166; cv=none; b=bz6g+3qv1RVlfHhc75IRc0JTYUe03jgTXVbblBmwARkAX+746yH3PS/jTST0M36nM1Ac6Y6qBIoGwEH7heQhjQ1gAn8Hmezz1bGALvnBa433YS8GdcAhjBsiRLsTXqcQt3fP9AyHkac2h/vQ1yYqVwANz4sGMr8f8RZYyauN+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761612166; c=relaxed/simple;
	bh=oRtsjVcJ/A8fEEsNtN0vYPNz4dkLNcetcREgBeg4ewU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYEJ6HLMjeLUZQg+owe34uQ9Q2Daq3/Ie+3Bnyd0sR/csCGV7cUu/C4i5Jv/Mv4wX0gn+yLook2/H78BtR3iRc87UI13pxCbzkLJ+wbkQ7MENdUqEpvyVWAvgNco0aeON2a+zVju63dEZOcfc8cE/3Z1CiM8MaLk63mvdkuSmvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K54BLwwA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K54BLwwA"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592efe88994so2373e87.1
        for <linux-coco@lists.linux.dev>; Mon, 27 Oct 2025 17:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761612163; x=1762216963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRtsjVcJ/A8fEEsNtN0vYPNz4dkLNcetcREgBeg4ewU=;
        b=K54BLwwA39KVnymUCoXgwz8bQmBh5pEKYaOnUg6qpLdE3tvX5OgV0Zp0AqRbLTQj9f
         YtCUCzrMsr9jB5tHP4WpmJsE8wYaxrUIfISqqwNw6o5FGSUGiCZVkPhNmUwLV+gHDImk
         PjY6s+C9uOr9tu9Uhkq+bGCCQ1Pbbaz/PMrkkBg6d/Y/bY3To60f2kbmzNHtVKpTHmQ6
         lP/CKXOaCYATUqGYz/4awTuU34wMhc7uB+TdDh5ps+qa+m7FA8Evr5I+agthRkW2r8gD
         iLc4rBTX7LOV2K5eEQBvZ6ZQgOSnd8RTRO76u/1KS63xS/uKH25DDyA6cK4yMVlX/U5v
         FWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761612163; x=1762216963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRtsjVcJ/A8fEEsNtN0vYPNz4dkLNcetcREgBeg4ewU=;
        b=SZMOAEDD4Xf7A7EvtNh8dDiYEXb6bPi2J2pHg6thG9f0MUuo/SjPqdsZUvH8Dvi2cA
         IyVNitAjII1XIVhJOgTbzO2JrvqIjcI2BuTeXPsMjDUzdu6PlATR3C0LENL+iV72uKKY
         jBG73QLV+ZGMiSJB5J8aTW3zSFuNrJe2sRRuzi3E0TpNTrdHscUExOWUy0a3MOHh27UI
         xsMvznwgyVjY7S4O3Aq4N+2VkU542qkObcAM9D7K/duKfuj8lUMdWEKhNsE7O/caAyYU
         hiHr702DcaYN8aba0ij9mx+ShGEoFHJapgktUjdcRxX+btGR5WQhvyKMhMfXEKUBxWWf
         bGdg==
X-Forwarded-Encrypted: i=1; AJvYcCX5+kJMa8nyepovjOGrF6OB72SA9HPs7B38HQ3YxoNPFYLAm8DmCZRP9HUXHyLN3syhWpwImjFLU2M5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+LN9m+mGTZVpk8uop6vudvyXal8+4nJr9KqT5GG1CaR66nKDe
	VNp0NDDbpo4GEeNuIoKEq93tduCEXwYtZbOFKNVFPOpvHDfcvrRNeMgSG7yYFjc+yhxLDPe4SXQ
	3WzTKacCVAUwZZZpAEbmgXAg6oS39eGASoimzEkAr
X-Gm-Gg: ASbGncsxhXc8GXRkf55QEFQ4ZfAIwgFPcNQ9PYwQ8N0Gr3RtGWB0DeCoW3ABApCHjM0
	CM+FtTqvnia/13il4VSQ0lIc23TXHEb1tJq893LtRc2ZJGxsiuLknba7YoCine0uXdRrPETSZrh
	+S6+3+1ZNtMdA6/oYnXrTWL9NI/ER674+9nNGFdfxjKRFpzzUFh9g3dpRh1jPVy8djFRVlh8lTh
	tHJVp4FJuEIp1eGBRD4nMc1zk4mOwABPHW0pAC1iIk2pjMkKxjEZtPzmxp5wc31JBvAcMCgJEGs
	Lstt0wUEIYmAoDxFjQ==
X-Google-Smtp-Source: AGHT+IFw2bXIFgS8L/YVVeC33nm+UNrZcFgq5PEguvjPBESW3pE71lH4QTQVICsX7/B6/DuEYo7ofU65s8tSDuAUZu8=
X-Received: by 2002:ac2:4189:0:b0:591:d7cb:ac2f with SMTP id
 2adb3069b0e04-5930ff5faafmr97301e87.7.1761612162578; Mon, 27 Oct 2025
 17:42:42 -0700 (PDT)
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
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch>
In-Reply-To: <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 27 Oct 2025 17:42:12 -0700
X-Gm-Features: AWmQ_bkOvNOoyYYGvZvdTfXeutFda2xaA6pWnjheLCpVly0yu6n27cY5_y3tmEw
Message-ID: <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
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

On Mon, Oct 27, 2025 at 11:53=E2=80=AFAM <dan.j.williams@intel.com> wrote:
>
> Vishal Annapurve wrote:
> [..]
> > > A theoretical TDX Module change could ensure that atomicity.
> >
> > IIUC TDX module already supports avoiding this clobber based on the
> > TDH.SYS.SHUTDOWN documentation from section 5.4.73 of TDX ABI Spec
> > [1].
> >
> > Host kernel needs to set bit 16 of rcx when invoking TDH.SYS.SHUTDOWN
> > is available.
> >
> > "If supported by the TDX Module, the host VMM can set the
> > AVOID_COMPAT_SENSITIVE flag to request the TDX Module to fail
> > TDH.SYS.UPDATE if any of the TDs are currently in a state that is
> > impacted by the update-sensitive cases."
>
> That is not a fix. That just shifts the complexity from build to update.
> It still leaves update in a state where it is not guaranteed to make

IMO, there are two problems here:
1) Giving a consistent ABI that leaves the responsibility of ensuring
forward progress by sequencing TD update with TD build steps with
userspace.
2) Ensuring that userspace can't screw up the in-progress TD VM
metadata if userspace doesn't adhere to the sequence above.

Problem 2 should be solved in the TDX module as it is the state owner
and should be given a chance to ensure that nothing else can affect
it's state. Kernel is just opting-in to toggle the already provided
TDX module ABI. I don't think this is adding complexity to the kernel.

> forward progress. The way to ensure forward progress is the same as
> ensuring build consistency, i.e. sequence build with respect to update.
> The kernel sheds complexity by ether making userspace solve that
> problem, or motivating a real fix in the TDX Module that obviates the
> AVOID_COMPAT_SENSITIVE case.
