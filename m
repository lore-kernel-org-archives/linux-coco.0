Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E4372B3B
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309876; cv=none; b=atrK60++TgWAwAS5jh5xDMNaqGf6469AsovFhqz6XhtPbg0QEK4/ILh/60+foPZojN/boLfjURrVcuMTaMpXPS9+QolbG1itXMUB5gShgwr//rBzhqEaJH8s8DerbuMRSGQ1OcHbql/euQ/t7a29K2TYC2EFCCap8u+GfMtpLQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309876; c=relaxed/simple;
	bh=IW0P0lI7zkBdW6OLQZ3hQpRobomfyoPHqaWIuK3lA7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zy/ReFIZXsrZYkwGnaFUE1LulJfqTQdeLO14gkadExNynC7Jd8exwkgQ590tniE+R2c7KE+IrmThgQ+3hMAKIBeSdV+RrUOF6tW4os+T6vbzACEq5os4YtbLoLKjHwn2GPnSnjBEU3LQWEHP+7fIj8BeIbxL5egt7l+dKO8P2gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HZEVfPkp; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HZEVfPkp"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-835423c69ffso2817196b3a.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779309874; x=1779914674; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mknx5aOiI2gHqgCD2H8iHmrBA38hthuUh1cz4/8g/LE=;
        b=HZEVfPkpfD+K+nyBYBQ4FsFvAC/eM5fZlc2KuFdyxeVNWOCObKFqd5WpLHtSI7erEr
         YJnklEIf8j8gc5CGPusHJRmExuji1cP9h4Ajm3+63Z2PrrfnkWv/joyufa842kEvCCUz
         1fRS5CO0IDvUwgaQ1ZF19Tu0dfnrb9+sJc6KepsZv3ejT2bA9BqSUrjctDFABSzARkIm
         trhiKYAfUkSXBxbP6EQWKQCPm6ZaJdf6+0S/lqgWQwWXLOGVJlj48lKqPL5MI8ATgUiy
         60//3AmAKga8zGnxSoGHR0RxKip8VjAszUtkfgXUc/xSnZphFwTYLtoheN8DLuhNb18V
         b9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309874; x=1779914674;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mknx5aOiI2gHqgCD2H8iHmrBA38hthuUh1cz4/8g/LE=;
        b=q1SKaU9nGJAfjfnkCEsXSXGQK1dK13gT04pPHetfQcP7p1y+p5g2iMGbRG7VClTUO9
         M+a0bSnNPGFfgUPy/lwUYVInk4J8gAJUHkWCQY/Bh1yUTAQ0xPakzXW4LY9fuxN1akq0
         DthA5POouE1GAlrQ/0A5q1os0UpYNAvEwZ5LqW6A4agW/kTRXxY7+jfL/SLZIyyJJz+V
         t5gv3XMHenUoirEq20MLaJ/bvGI89+jnH1v7VEDnuyxH5UqYFK/xRV+WSOS0pmvy+gCJ
         7abneSKM8RMEVHW+w5TmX/iOq41YUkLeR8/hA0UCOCHE6hfkJEw5V5faluOUtot5iaiz
         soAw==
X-Forwarded-Encrypted: i=1; AFNElJ9zfGR/q/KYVys6XFzmfMz6XxYy/keOeM4bqgIcDSDKCw5vjDVvB+RNnC9AIw4Ay6Q1hCAOd0pwojc+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9429ittaHk/malAKpz3mKaE/4486nrmlrm0GFk1mSoDHd3zbZ
	5pZX00dC5iGKvSSkssWLPT8vUfw7KmKxDZIeapzVIATjygy6Oovom+sF04PesB+b1Jkw3UEOi28
	gIyyKZg==
X-Received: from pfbmd16.prod.google.com ([2002:a05:6a00:7710:b0:838:4903:1f13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c86:b0:837:eaa9:381f
 with SMTP id d2e1a72fcca58-8414aaf9e7emr187969b3a.0.1779309873801; Wed, 20
 May 2026 13:44:33 -0700 (PDT)
Date: Wed, 20 May 2026 13:44:33 -0700
In-Reply-To: <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Message-ID: <ag4dMc2B3JQi4vxU@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
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

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index b5991d53fc0e..e9e7394140dd 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -321,8 +321,8 @@ void __init kvmclock_init(void)
> > =C2=A0	flags =3D pvclock_read_flags(&hv_clock_boot[0].pvti);
> > =C2=A0	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
> > =C2=A0
> > -	x86_platform.calibrate_tsc =3D kvm_get_tsc_khz;
> > -	x86_platform.calibrate_cpu =3D kvm_get_tsc_khz;
> > +	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz);
> > +
> > =C2=A0	x86_platform.get_wallclock =3D kvm_get_wallclock;
> > =C2=A0	x86_platform.set_wallclock =3D kvm_set_wallclock;
> > =C2=A0#ifdef CONFIG_X86_LOCAL_APIC
>=20
> Can we move those (and maybe everything in the context there too) up
> *before* the check for no-kvmclock at the top of the function?

Oof, I was going to say "no", but disabling kvmclock is exactly the workaro=
und
I've told people to use to get the kernel to use the TSC instead of kvmcloc=
k.

> Probably in a separate patch.

Ya.  I think this?

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 08ee4bc304c8..92a1ebf31e4d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -27,6 +27,7 @@ static int kvmclock_vsyscall __initdata =3D 1;
 static int msr_kvm_system_time __ro_after_init;
 static int msr_kvm_wall_clock __ro_after_init;
 static u64 kvm_sched_clock_offset __ro_after_init;
+static unsigned int kvm_tsc_khz_cpuid __ro_after_init;
=20
 static int __init parse_no_kvmclock(char *arg)
 {
@@ -207,7 +208,7 @@ static unsigned long kvm_get_tsc_khz(void)
                lapic_timer_period =3D apic_khz * 1000 / HZ;
 #endif
=20
-       return kvm_para_tsc_khz() ? : pvclock_tsc_khz(this_cpu_pvti());
+       return kvm_tsc_khz_cpuid ? : pvclock_tsc_khz(this_cpu_pvti());
 }
=20
 static unsigned long kvm_get_cpu_khz(void)
@@ -387,9 +388,39 @@ void __init kvmclock_init(void)
        enum tsc_properties tsc_properties =3D TSC_FREQUENCY_KNOWN;
        bool stable =3D false;
=20
-       if (!kvm_para_available() || !kvmclock)
+       if (!kvm_para_available())
                return;
=20
+       /*
+        * If the TSC counts at a constant frequency across P/T states, cou=
nts
+        * in deep C-states, and the TSC hasn't been marked unstable, treat=
 the
+        * TSC reliable, as guaranteed by KVM.  Note, the TSC unstable chec=
k
+        * exists purely to honor the TSC being marked unstable via command
+        * line, any runtime detection of an unstable will happen after thi=
s.
+        */
+       if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+           boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
+           !check_tsc_unstable())
+               tsc_properties =3D TSC_FREQ_KNOWN_AND_RELIABLE;
+
+       kvm_tsc_khz_cpuid =3D kvm_para_tsc_khz();
+
+       /*
+        * If provided, use the TSC (and APIC bus) frequency provided in KV=
M's
+        * PV CPUID leaf even if kvmclock itself is disabled via command li=
ne.
+        * The PV CPUID information isn't dependent on kvmclock in any way,=
 and
+        * in fact using the precise information is *more* important when t=
he
+        * user has explicitly disabled kvmclock to force the kernel to use=
 the
+        * TSC as its clocksource.
+        */
+       if (!kvmclock) {
+               if (kvm_tsc_khz_cpuid)
+                       tsc_register_calibration_routines(kvm_get_tsc_khz,
+                                                         kvm_get_cpu_khz,
+                                                         tsc_properties);
+               return;
+       }
+
        if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2)) {
                msr_kvm_system_time =3D MSR_KVM_SYSTEM_TIME_NEW;
                msr_kvm_wall_clock =3D MSR_KVM_WALL_CLOCK_NEW;
@@ -424,21 +455,14 @@ void __init kvmclock_init(void)
        }
=20
        /*
-        * If the TSC counts at a constant frequency across P/T states, cou=
nts
-        * in deep C-states, and the TSC hasn't been marked unstable, prefe=
r
-        * the TSC over kvmclock for sched_clock and drop kvmclock's rating=
 so
-        * that TSC is chosen as the clocksource.  Note, the TSC unstable c=
heck
-        * exists purely to honor the TSC being marked unstable via command
-        * line, any runtime detection of an unstable will happen after thi=
s.
+        * If the TSC is reliable (see above), prefer the TSC over kvmclock=
 for
+        * sched_clock and drop kvmclock's rating so that TSC is chosen as =
the
+        * clocksource.
         */
-       if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-           boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-           !check_tsc_unstable()) {
+       if (tsc_properties & TSC_RELIABLE)
                kvm_clock.rating =3D 299;
-               tsc_properties =3D TSC_FREQ_KNOWN_AND_RELIABLE;
-       } else {
+       else
                kvm_sched_clock_init(stable);
-       }
=20
        tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
                                          tsc_properties);
