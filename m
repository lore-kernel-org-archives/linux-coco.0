Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6EC3EFD14
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370716; cv=none; b=hJOv0XQh+G4IZnbl24+pu+FAxpRRl2nWMhx6p5HptXalXBjR5aUjuAGk5Cf+Ma+nBO+mK2mo7DP51UQpsK5IQ0QaLs5TdBeI5FVaA1B8mi0g0A2PYuK8UMY/MGs0+WMcbkj/72mR/cZ15Xjhj48ABPvCfNPWUYS5w6GYU9fqG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370716; c=relaxed/simple;
	bh=rZ1N/KoZeh9+iAw5VzELz8I+bOlFA8dDM2e99AiyYKk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gg7ABZSCLZ7R8FjMuSHzn4PmQlN+bWSSxhg9EME1P73bw6Lrgmuc96xC+uU88luhw5OvcvK4R3b33uA9Rvc9yHEcX61LpH/1aToWDQw2QWNrzJYRMJJD7l/5ClNHaciMje/DOyS0JiO386k+Qf4iqOMSOpAC9mDJnoTHa6bHB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQJXDqD9; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQJXDqD9"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82ac893940so3036301a12.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779370714; x=1779975514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbJ4F8kl/6/QcBmB9dNne3NQOqe79KuT470iYfI7huM=;
        b=kQJXDqD9YuK/zK0M0cFNFd3/kmz0GB41I/ARrqfu2s+E2zydJMBBoqrQicxgfi6KxK
         W8UQUUV11Onoe5x2gv+aVhQWfJKDLDPsp0DakqFvS+et2Q/95zzYc4ie616MWv93Ap6G
         wsUUpLTNeye1qT7723eoYNTXFtj3BzJUSAhZi9fHIvwXw/hWuEWcjE+HaB0ZL+LiAXWR
         z2SRlVdf+pO6Dhs5MoA80QClp+Srk9Oe2uXtvarMEdmIHoetWfnBiDElKH/hPg+IpEa2
         NfwH/neXfyUqoGhYhhlaOABNo7cQ5rOEYMWN0JdvWtHunMvnMC3xpeWw6D7WK4WdxYfu
         DWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370714; x=1779975514;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jbJ4F8kl/6/QcBmB9dNne3NQOqe79KuT470iYfI7huM=;
        b=ntUOF/CL2dM7pMueN840Z4x2JPk6TxtVJcwAlgapLqLPWS8fgkLQgmlyiAokO6a8Os
         nKWvZGLECW2ScJercRDkakjk+2FBEuvdsCHqnqpYhCoeQrSAkIAGeYePhMJqvuHm+KaG
         mnjMgkciFSoGZvsR3qb7NLif/FpBsznAvdJ6rzMzABsvkAW4v7qLWe/tzKO1I/UdZIfF
         hh5WK2qN0ekZBmYLvebVP60V8RPQVbbqSMUXYQElC3jVjx/VZnnTxLta8qW01qo9xs8N
         j6/mD1saJKWihAO/451MN+hiE1LoUa7RMVaCNaYlp92qAyzDA7wSH1GQb+WVF2t5bVmI
         ASyw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZS5bPZjBOuYMb5ZoDw3rShLC4fOVvNfI0vX1+ae9/jbX7/dEigfXYlcWp62eqltCPaitVUp2x9ykK@lists.linux.dev
X-Gm-Message-State: AOJu0YwHNo9uYo3bTTl4UJBz2cdbdrqbbCsObUdmu+4nEh9hA75857Xb
	GBzkVHk4jPyCjqS80durMiIN32qwFpH+LJWVPj7zQ2l8LTrDD62WAwrRO5wKSR2fDlJUHMxJCMe
	1MvqlPA==
X-Received: from pfbem15.prod.google.com ([2002:a05:6a00:374f:b0:83d:3c25:eb8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c8c:b0:827:3b1b:43e6
 with SMTP id d2e1a72fcca58-8414acc6e8emr3123916b3a.21.1779370713612; Thu, 21
 May 2026 06:38:33 -0700 (PDT)
Date: Thu, 21 May 2026 06:38:32 -0700
In-Reply-To: <20260521131019.GI3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-28-seanjc@google.com>
 <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
 <ag8Bpc_uVNrNWqfX@google.com> <20260521131019.GI3126523@noisy.programming.kicks-ass.net>
Message-ID: <ag8K2FRGcoEa-D2Y@google.com>
Subject: Re: [PATCH v3 27/41] x86/kvmclock: Enable kvmclock on APs during
 onlining if kvmclock isn't sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Juergen Gross <jgross@suse.com>, 
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

On Thu, May 21, 2026, Peter Zijlstra wrote:
> On Thu, May 21, 2026 at 05:59:17AM -0700, Sean Christopherson wrote:
> > On Thu, May 21, 2026, David Woodhouse wrote:
> > > On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > > > In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.=
e.
> > > > kvm_setup_secondary_clock(), a dedicated sched_clock hook that will=
 be
> > > > invoked if and only if kvmclock is set as sched_clock, ensure APs e=
nable
> > > > their kvmclock during CPU online.=C2=A0 While a redundant write to =
the MSR is
> > > > technically ok, skip the registration when kvmclock is sched_clock =
so that
> > > > it's somewhat obvious that kvmclock *needs* to be enabled during ea=
rly
> > > > bringup when it's being used as sched_clock.
> > > >=20
> > > > Plumb in the BSP's resume path purely for documentation purposes.=
=C2=A0 Both
> > > > KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and =
it's
> > > > not super obvious that using KVM's hooks would be flawed.=C2=A0 E.g=
. it would
> > > > work today, because KVM's hooks happen to run after/before timekeep=
ing's
> > > > hooks during suspend/resume, but that's sheer dumb luck as the orde=
r in
> > > > which syscore_ops are invoked depends entirely on when a subsystem =
is
> > > > initialized and thus registers its hooks.
> > > >=20
> > > > Opportunsitically make the registration messages more precise to he=
lp
> > > > debug issues where kvmclock is enabled too late.
> > >=20
> > > That's a hard word to type, isn't it?
> >=20
> > Heh, you have no idea.  I've been "this" close to creating a VIM bindin=
g for a
> > while, it is time...
>=20
> 'z=3D' not good enough?

You people and your fancy ways.  I'm just happy I can get in and out of the=
 editor :-)
