Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3848405C
	for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761256862; cv=none; b=PNORXe1cN3Cvy5IolPhcs6Gj/XKdL1nDMQQHBVTKKeQLsq9iU2zrs0+DNMgC1pQd6G0EADzJuOX5THvA/rpLSLLwthw+VvpxLMmtY1/A/yfYzO1TApwPeKqdHY40QDsjTeuTAczCLlVLBFFvbqENtOhi1vchH6Wo44g6FVYDLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761256862; c=relaxed/simple;
	bh=fSsdRWecqQa6nNgrFLCmMLEOAUbyDJ50RnVjL+MYgvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOdVP5l15ldTw4u2BFmp1wDb1I/hdw3NrnWMWu+9m+M4klg8SFI/bPVDar477zr3KwPzX6tTKF/3TmEgTR3FqTWXl8nddiEeStzjXspTsQTvpOJRj77eI8c/TLql18+T8HnNbweQY+49w6sesYqag0hFkGfxOMan7i27DH24ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sf1jvY5A; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sf1jvY5A"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290d48e9f1fso34905ad.1
        for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761256860; x=1761861660; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK4oKnHNzcuq0rwncmx4pYGQWpDWxT04xX+7yY0pJF8=;
        b=sf1jvY5AlCDtmiYSY2O3NaIZqcDUp0ZVs3XKYcNb9XODZNcmCsIgw7HRf7EJDpI7VZ
         ZM1xZOElWcHnUf98vq6W8E1e1QV5teZjwvGZ5yM1iA/091tpexrPIoJa9361BfzMREr8
         82nF7iBj/dqAPB1mIcfjNKtGptJ0d11SxYhyPkHpF/PdVuoWE7PYGcuCbaMwvxe1aDYb
         NjtjJvZPSbXGGOFqX64YOn8YhlZMhLtYPTJGL/3W8zeht3Btjr3U/egchtsEIaJ/YWyg
         C9TKRBWV7aIiyblXlQDKg5kYQkWfQkg0vF37imoXFyABRmTS0cJjNOA8wZIPnug2g8x7
         KheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761256860; x=1761861660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK4oKnHNzcuq0rwncmx4pYGQWpDWxT04xX+7yY0pJF8=;
        b=TBhqsjAkQHnVTe9u6VTV0tB0iFmMabPvs5RO78clyP37L3utcMwrNaGA/p16jYernL
         C2DzNW11sxHOSyC35TPD1nJ7ShtZXteWDgxLX8iVY7KDefrQdZ5g1gFBVASyjwLHqlQy
         9GxnWqFSCVvTPgtFmqoAlX3DaMMF1+odGqV47sJRLE/YbWQm1KaiMy9m5yrD3lYaw54t
         U/wpLK7aVAac1pkH6OLDLu9LKAz+addDpwiDGtx8V2XecgHIlRSheb7DffWsrPaYG4pB
         7FyMsa9VdDYIROn2oxUxDaa30L2FFVZfnl86+jIr4twuq/+gJfm7Anbf1EYcINCVzAcS
         Su0w==
X-Forwarded-Encrypted: i=1; AJvYcCWaNjg3ibKbqt1hQz4Ptp1/K/RJ7tdQnHoLkquvr1uHPYKdEJy1IGYKBisphtivKZSSccfQ2uQk3gEi@lists.linux.dev
X-Gm-Message-State: AOJu0YwxOFISsv94y5/vsBMVgSEeQIor1aSg9orZkwlsOM04zKvnwYES
	cq2Vz7hPfW+8zUGITkXHOMcZbdBD0AcnWnWhOTlDtlfgBMZddrn02r/7M1P3sPSjxSR78/pL53q
	Pus02cyeAGdC2e2jlWkQ5eL+iJracmJq5Vc46eGWd
X-Gm-Gg: ASbGncsQix239tJH2X3HuVrenZS2jlksPQ/iHcBv1dfwrXFv1K5rvNX2hNB17MrgnfM
	ihOBkrhDhPooMzSF/u2haqVRW+kWwQCxQ0fc1gHes/Uj7SF6BXyPnQYaJ98WoYybToDdKzlXsUn
	iJTXOl6MF0UIIiFWSSM+LXvBWj+lcqXcIQ6thnOsOPsqCl3SFdUnOr6BkywbCphRwE9N1xtFC1q
	L19K0P4Ye861+snxx7wUkx6QWuuCw1yW3HpDuziAt9WGJp3RVCyniZMAtSrEGt4M5wcBl9ACjnI
	gN7ytsuz8yFhRQHzaLHL4aYIosv+VDhIR3PLlmU=
X-Google-Smtp-Source: AGHT+IHz6r7O35iYyVRRBZJLFA/qCXABDW4tGQEbAQ+cdGVt03tHSYlQ4wP2Y0e+2Ox9XlZzezDFi6Kw4IgvUynJ1yg=
X-Received: by 2002:a17:902:f542:b0:290:dc44:d6fa with SMTP id
 d9443c01a7336-294896994b2mr1236445ad.16.1761256859241; Thu, 23 Oct 2025
 15:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
 <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com> <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com>
In-Reply-To: <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 23 Oct 2025 15:00:43 -0700
X-Gm-Features: AS18NWCc7EBWpHeHGZgKjL9rt91xyVTzV83dAB2GikFO-hGA2BC5MLJCuOQbeH4
Message-ID: <CAGtprH89JhD+sPStX=aOSRh5B0WMaiBZcA2hC0p0-AzbGkyheA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Dave Hansen <dave.hansen@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "sagis@google.com" <sagis@google.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:10=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 10/23/25 13:31, Vishal Annapurve wrote:
> ...
> >> Admin logic to update TDX modules can be designed to either retry
> >> failed TDX module updates or to be more robust, adds some
> >> synchronization with VM creation attempts on the host. i.e. I think
> >> it's fine to punt this problem of ensuring the forward progress to
> >> user-space admin logic on the host.
> > Discussed offline with Erdem Aktas on this. From Google's perspective
> > "Avoid updates during updatesensitive times" seems a better option as
> > I mentioned above.
> >
> > To avoid having to choose which policy to enforce in kernel, a better
> > way could be to:
> > * Allow user space opt-in for "Avoid updates during updatesensitive tim=
es" AND
> > * Allow user space opt-in for "Detect incompatibility after update" as =
well OR
> > * Keep "Detect incompatibility after update" enabled by default based
> > on the appetite for avoiding silent corruption scenarios.
>
> I'd really prefer to keep this simple. Adding new opt-in ABIs up the
> wazoo doesn't seem great.
>
> I think I've heard three requirements in the end:
>
> 1. Guarantee module update forward progress
> 2. Avoid "corrupt" TD build processes by letting the build/update
>    race happen
> 3. Don't complicate the build process by forcing it to error out
>    if a module update clobbers a build
>
> One thing I don't think I've heard anyone be worried about is how timely
> the update process is. So how about this: Updates wait for any existing
> builds to complete. But, new builds wait for updates. That can be done
> with a single rwsem:
>
> struct rw_semaphore update_rwsem;
>
> tdx_td_init()
> {
>         ...
> +       down_read_interruptible(&update_rwsem);
>         kvm_tdx->state =3D TD_STATE_INITIALIZED;
>
> tdx_td_finalize()
> {
>         ...
> +       up_read(&update_rwsem);
>         kvm_tdx->state =3D TD_STATE_RUNNABLE;
>
> A module update does:
>
>         down_write_interruptible(&update_rwsem);
>         do_actual_update();
>         up_write(&update_rwsem);
>
> There would be no corruption issues, no erroring out of the build
> process, and no punting to userspace to ensure forward progress.
>
> The big downside is that both the build process and update process can
> appear to hang for a long time. It'll also be a bit annoying to ensure
> that there are up_read(&update_rwsem)'s if the kvm_tdx object gets torn
> down during a build.
>
> But the massive upside is that there's no new ABI and all the
> consistency and forward progress guarantees are in the kernel. If we
> want new ABIs around it that give O_NONBLOCK semantics to build or
> update, that can be added on after the fact.
>
> Plus, if userspace *WANTS* to coordinate the whole shebang, they're free
> to. They'd never see long hangs because they would be coordinating.
>
> Thoughts?

Yeah, this approach sounds reasonable.
