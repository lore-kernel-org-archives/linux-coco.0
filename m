Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A83CBE84
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368360; cv=none; b=YVZbAPCMS8yHmOXWezUJ5rDI/pkGW2F1x2R0f03M44YIg7X4e2ZO6oFetyHo/MncM7VjcEh/nliRutqu0yldbOZrIuxGw7AH4plqYYelovBYV1TZ7nMJ960lug62kHNyz+EIvicejBpSo297fJsN/eUAIs0cXd/NO/w1+DpJhhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368360; c=relaxed/simple;
	bh=0rVVosXepCYQeGWe7dkZUA8zbJznpObfcXBvPIXEpbY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ck6wrhJlFdXDV8iIio7MuDMKd/rd20MWZH2iRSbYCKUHTeacke3OlWPPXcdlm4V2yLWypvsUFkVnU7UdIXjgPqZyd0Su+LZCAS8OgF6bQWSu/eAzmebFJ/KL1kyFTBtOEICHcXj+qJzTfbnba7okUPkihbTe2CaSllUj58VRDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmQGIKsE; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmQGIKsE"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso3141584b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368358; x=1779973158; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqcHY/DvmkAZ9QjHGP0kTeF7mk7WkCMN/ZHV20HdBXo=;
        b=OmQGIKsE89QeeEVCMAkhpEep014jMePmLgZ09K06BvS2ZfzRAPpUMnduv/y5hHD0bn
         Xg4wu7cVjY6IUoQCzG4CgTQLGhETp6UTpZPTdsjHnHd4k04P22GIPZdU5x/H/SsBqMS3
         rz13kAeyoRerlLGErGF4RhItPCJQBXngGfg5Eln8yQkVOoHiLtHCtPUYpD+SltAwz2BN
         kKDfxhgXyzPufaAAi4LVVSiOlOBI6ilL+wCao5lyZNUjzxHMS4MVje8DgFMWy6a7f7lX
         QGhzIHAFk++ia6QTxtRotM+fx1iwgbY3v0LzX1DM19X6RO1xdD4utmvLWnzI7+5rXZMC
         iaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368358; x=1779973158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GqcHY/DvmkAZ9QjHGP0kTeF7mk7WkCMN/ZHV20HdBXo=;
        b=ekFjZPFon3TuAxUMtPA8TQ7ill8VLFy0ATTKKJGQmmjErOZ8Gz1JUu/We7Mu1SU/kw
         z/daOO56nWC1UBhXaf49ued610i+o0xAHboyQt09JMgdNLXKqkjAeMllnVbC5/mgWfzD
         lMJN3ICRtgAqRBUx27bA9HR/Akb1XifyH/KWKil96cY31Vb4UderFjVigJCCFy2/gshS
         cxn5kccN0vmKh8ICqnEMD0La9m3MvpyY4IQi6lX2dFtUpX+GPPRP7CAmZ86PFZAHZCJf
         SuubkseiuiRWCtXK7ssKqaK7u0o02bx2hcMVT4Owm3ot6Ld7AAkoxFpSgecgoKB0Mu95
         5USg==
X-Forwarded-Encrypted: i=1; AFNElJ/6qlQ0/3cye4r+QcC3+GaM1O7qiQczOxnS4zj/L7NxWbHqPaeZ2MUYs3czyxbgQMWVSMlGLcZcmdhS@lists.linux.dev
X-Gm-Message-State: AOJu0YwOoOo3KJF3qR8yZEG+N2xe9V8d+NSu8kPdvJLITRm1RnlB63Jl
	z+W5HZvxmf+qKJZ3qSNGVYVxF/MtaWyQstQufrOipxNVYcg3kGGPVSAMgMhvUARnbkcSunDZ9Nk
	gJ0cBOg==
X-Received: from pfdc18.prod.google.com ([2002:aa7:8c12:0:b0:834:df9e:8e02])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4655:b0:82f:de7:d29
 with SMTP id d2e1a72fcca58-8414ae013a1mr2977074b3a.31.1779368357753; Thu, 21
 May 2026 05:59:17 -0700 (PDT)
Date: Thu, 21 May 2026 05:59:17 -0700
In-Reply-To: <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-28-seanjc@google.com>
 <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
Message-ID: <ag8Bpc_uVNrNWqfX@google.com>
Subject: Re: [PATCH v3 27/41] x86/kvmclock: Enable kvmclock on APs during
 onlining if kvmclock isn't sched_clock
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.e.
> > kvm_setup_secondary_clock(), a dedicated sched_clock hook that will be
> > invoked if and only if kvmclock is set as sched_clock, ensure APs enabl=
e
> > their kvmclock during CPU online.=C2=A0 While a redundant write to the =
MSR is
> > technically ok, skip the registration when kvmclock is sched_clock so t=
hat
> > it's somewhat obvious that kvmclock *needs* to be enabled during early
> > bringup when it's being used as sched_clock.
> >=20
> > Plumb in the BSP's resume path purely for documentation purposes.=C2=A0=
 Both
> > KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and it's
> > not super obvious that using KVM's hooks would be flawed.=C2=A0 E.g. it=
 would
> > work today, because KVM's hooks happen to run after/before timekeeping'=
s
> > hooks during suspend/resume, but that's sheer dumb luck as the order in
> > which syscore_ops are invoked depends entirely on when a subsystem is
> > initialized and thus registers its hooks.
> >=20
> > Opportunsitically make the registration messages more precise to help
> > debug issues where kvmclock is enabled too late.
>=20
> That's a hard word to type, isn't it?

Heh, you have no idea.  I've been "this" close to creating a VIM binding fo=
r a
while, it is time...
