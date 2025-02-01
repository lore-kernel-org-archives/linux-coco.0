Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E351C5D4D
	for <linux-coco@lists.linux.dev>; Sat,  1 Feb 2025 02:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376277; cv=none; b=bajU4HfjZFrPvEy7H+oRuRo8m9YOPDipS0nVxm05l18rFYqq/buH2cCFtZoEFhO+seK8hBE9NTwPk6yDu+aEt0XiHnxugdfLZVUU/SFoZuzsdfYpWm0wLzm4QWEo9mtmL2sRa8BwUovrMvA1aH9kqKjYpUBy1vf8AT943zGERt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376277; c=relaxed/simple;
	bh=p/Vg9iE4sgVLr3/9VKFQQjtH8mkL0jM6rjwkOfa6jHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QTwU3nly7PZA2UxNr7P/hZpfLGyuIg1/pxDhIOCSjA4I0lbOcs0ANAxQMO31wB+wHqz4wdeSCVSNV+svvAUi4cXL+4Dh9VBYJlIIO7JRDktlDqPw74ysAYilOI82dNholGnS0t4PfDpnf9wa1UbK3TNmooOpWCKvv7wOvYLBcvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HywHpyXF; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HywHpyXF"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so7097196a91.3
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376275; x=1738981075; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SJJEXGT/CGEg26HmUNCtCBi/lOkkZBhLk4mR9XODbn0=;
        b=HywHpyXFkEnvGJJJMTMvubljCVh9iAHJtMjMGuSfmXUrmWdZyhGxHB2BHpLXaxjjHp
         xS+6uc6JyP2aR+jKXQeUOYGd//dYJg5FQ/vc/iev77bsdUilMykaUo78VmJgdUigEoR2
         Isu/z7VTQmddolw1KjnKCI2r4kncZas1o6u5uOLP0IIqx/vWPBe4fEk5zIoTTCuGNod2
         ws9m1S5JmktpXwFFX8GV7r8UT+Eng0Sjh9ZvmDVIm3e4WlpKc0E8i347katgA3QsTa04
         9MeCtduJJ9bzU7/T7Gkm+IXaaCrRagVZo3tY1H9Hbkd4wmcRN92Up7OdA1ZOW0H6Reri
         k91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376275; x=1738981075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJJEXGT/CGEg26HmUNCtCBi/lOkkZBhLk4mR9XODbn0=;
        b=SkpMLOJqmvbKl9gLtXbE2JQZT1/92exx64733AEF6cQnCeAJZ5WNmb/+shYNwAMJLA
         sLlqdstEsPaRqnC0uyGWDgEm5mpAgp33ACDPXgSpg4m4HMHJ7dqVBGxYp1+xLJMThFen
         274a8o2EIjdDhNk3P0asjl2QCr/93QwRno+nhmPjvkD3KFwka/HSpP8CztAk3kbS2GDk
         Z9tRUyrW27DQZVt14ZVnMAKUa5b+YR5Ae9ZndkTk8C8qPZZckFAsWbg5HvSvHrteVfu3
         DY7qTtybslJggtoUxSm0xogaKvmyrrNjXVLq9AEzSBdvck4rA+raUl0tpAEAfjaPNZa0
         4a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSmwKTPtSAm/dE0Se4OphsSy0bPM0zcOgXVkoP4KUv69n+QoeHYhPYQ848PIGU8lR0eE5MMgv2RnsT@lists.linux.dev
X-Gm-Message-State: AOJu0YxnhcNXrET3qBvymV0ZldtKL016BSYK2hnb/wiDbiE/DssoSbN9
	y0velbu6jbdzZlam2pLunANSBcEqyrCrlwWEshr1u/21rCac8rCn7bx2RjLcwbpFaW7/7aUk+kP
	14w==
X-Google-Smtp-Source: AGHT+IGR6HwuD9w+8Kze6jNqduo1hcKEvlqzGV2yi3bR0PK9E6ixYJtwZg6BVPpJ2g9E6rQRruKKBVyC7NI=
X-Received: from pjtu8.prod.google.com ([2002:a17:90a:c888:b0:2f7:f660:cfe7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2702:b0:2f4:4003:f3d4
 with SMTP id 98e67ed59e1d1-2f83ac83632mr19746549a91.30.1738376275470; Fri, 31
 Jan 2025 18:17:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:18 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-17-seanjc@google.com>
Subject: [PATCH 16/16] x86/kvmclock: Use TSC for sched_clock if it's constant
 and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
nonstop, and not marked unstable via command line.  I.e. use the same
criteria as tweaking the clocksource rating so that TSC is preferred over
kvmclock.  Per the below comment from native_sched_clock(), sched_clock
is more tolerant of slop than clocksource; using TSC for clocksource but
not sched_clock makes little to no sense, especially now that KVM CoCo
guests with a trusted TSC use TSC, not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for nearly two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 9d05d070fe25..fb8cd8313d18 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -344,23 +344,23 @@ void __init kvmclock_init(void)
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If the TSC counts at a constant frequency across P/T states, counts
+	 * in deep C-states, and the TSC hasn't been marked unstable, prefer
+	 * the TSC over kvmclock for sched_clock and drop kvmclock's rating so
+	 * that TSC is chosen as the clocksource.  Note, the TSC unstable check
+	 * exists purely to honor the TSC being marked unstable via command
+	 * line, any runtime detection of an unstable will happen after this.
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
 	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
 		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	} else {
+		flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
+		kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 	}
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
-
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
@@ -369,6 +369,11 @@ void __init kvmclock_init(void)
 #ifdef CONFIG_X86_LOCAL_APIC
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
+	/*
+	 * Save/restore "sched" clock state even if kvmclock isn't being used
+	 * for sched_clock, as kvmclock is still used for wallclock and relies
+	 * on these hooks to re-enable kvmclock after suspend+resume.
+	 */
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
 	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
-- 
2.48.1.362.g079036d154-goog

