Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB54DB56E
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059420; cv=none; b=DTB55pUGao97KN5DsiFCbGlA3g20MxFR2xpaNdiuIzDYuXWHlDP6RpzFz3e7XHg7E4ZoVxnX+lPwMo6sl4ZU7nNvRv1aZI0CppFRwBr8+/30QQmK2sfYbwkmO3MEXDOxi38GYnFNDCUCj81F/cESF/FwWLQwKYmMzdzvoBrHQ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059420; c=relaxed/simple;
	bh=pvk61KgZsdgezrqmuUH0lmIu4eH6UZ//mUcKEN2ubd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p9aIeviY5PCCYafwZW3jzrarkkPS7BeAwH/ySA1NJCamlfY9Rxn3qe7FEU966JAiJj1uoIJ/ry1Z/PzR7GLG8YYY3b7Oc7Zjw+RJ7sBEEQ78Ie+8KskSBBPc1aI6spwkVtt72Qt2l2uXmklpF4gMYqODN8TjB2h4XVL8dk3WRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D+zv8w0j; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D+zv8w0j"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so4024498a12.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059418; x=1786664218; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heSuqSIgeH92pLRWbhNi7GYX8HqrNShkMIs22IEn4aI=;
        b=D+zv8w0jSBmHDEAH5whK4BANgkR6muW4FNz70bNpZtWOzZ9ntZMZEgHSJq6EvPSyBG
         i63N5OSPIEDVcicjJ/JkoLI1QMDTwOftJsNRvMSYqjVmWAkPjK6VTmNdhG+98jWjZuqK
         yelxeswauFGripmsQkxxAQ9SyqGA7BgsQWKRBvNUAusgLbYvU2BqcAtyHRzAqYcR1An0
         eIcuuiBFalKIqm+Q41KaDJ+M8WHj5ZlaecHC2H8Vr/527tiHVaVNeYFD5fj/cq4k0304
         EinIrzwRmcqLtHk8yLUr9SfeqKs27T0STXuF0Svyje8Vg04GQ8pbx0cyc17onoI7aVlJ
         jVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059418; x=1786664218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heSuqSIgeH92pLRWbhNi7GYX8HqrNShkMIs22IEn4aI=;
        b=iV0bEGvneChJFv2ii+c7MvZNRFKCG5A5v1zgFYCvFRb97tCsBnFouavrRt5vpLfd57
         jBtcDrxLIeaFK+pJlIS4K1RC26s7ah1G6dsKt+x6H3H7gAd7fGNtBiFzY98jD8ryY4wt
         mzZYrrui2ZNO1ow/GVFqKG5ZVAJ5HIBYWQQmRBc5OR2L0tDyqFwsBcqQFNcNHEVoahQO
         iYF+Z/Tosmk2uwFMtOgueBYX4ucC52ndoQ4JM8Z9MNGNwHTrU9JwaoaELl5rqPICq7bO
         UpepkeNMGrW763RFTusZ1++WsZtBc4Du2vXY4LqgU43ePVrcWiiD6RUYg+byi9ed3/Ul
         CiUA==
X-Forwarded-Encrypted: i=1; AHgh+RppLGUnQkkvmg13kI1xL07sbbx56sFIYlYJC8WSPeRQeNt9nHnz7q9PTLhQXvF25H+lGVqQuRkmHw1f@lists.linux.dev
X-Gm-Message-State: AOJu0YzRG1IHuf308CL3m3NmKkCzoTQz+2c1tip00iZXuEoi3GuOpxz6
	Enz+WlmOPfM7XRcgDjZmdYOdbw/g9XkCG09xSRDNGUqjHta0wuHXMQUvqW4sYOuYRhXRgdTZZYO
	AzIx05Q==
X-Received: from pgmc19.prod.google.com ([2002:a63:1c53:0:b0:c98:2639:852e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7344:b0:3bf:6acf:2940
 with SMTP id adf61e73a8af0-3cb85df0a1bmr20575846637.11.1786059417589; Thu, 06
 Aug 2026 16:36:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:44 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-28-seanjc@google.com>
Subject: [PATCH v6 27/51] clocksource: hyper-v: Don't save/restore TSC offset
 when using HV sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Now that Hyper-V overrides the sched_clock save/restore hooks if and only
sched_clock itself is set to the Hyper-V reference counter, drop the
invocation of the "old" save/restore callbacks.  When the registration of
the PV sched_clock was done separately from overriding the save/restore
hooks, it was possible for Hyper-V to clobber the TSC save/restore
callbacks without actually switching to the Hyper-V refcounter.

Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
revert to using TSC for sched_clock, and so there is no need to invoke the
TSC save/restore hooks (and if there was, it belongs in common PV code).

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index daa8cbfe61ee..220668207d19 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -544,9 +544,6 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 #include <asm/timer.h>
 
 static u64 hv_ref_counter_at_suspend;
-static void (*old_save_sched_clock_state)(void);
-static void (*old_restore_sched_clock_state)(void);
-
 /*
  * Hyper-V clock counter resets during hibernation. Save and restore clock
  * offset during suspend/resume, while also considering the time passed
@@ -556,8 +553,6 @@ static void (*old_restore_sched_clock_state)(void);
  */
 static void hv_save_sched_clock_state(void)
 {
-	old_save_sched_clock_state();
-
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
@@ -570,8 +565,6 @@ static void hv_restore_sched_clock_state(void)
 	 *                - reference counter (time) now.
 	 */
 	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
-
-	old_restore_sched_clock_state();
 }
 
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
@@ -579,10 +572,7 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	/* We're on x86/x64 *and* using PV ops */
 	paravirt_set_sched_clock(sched_clock);
 
-	old_save_sched_clock_state = x86_platform.save_sched_clock_state;
 	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-
-	old_restore_sched_clock_state = x86_platform.restore_sched_clock_state;
 	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
-- 
2.55.0.679.g6767b8d81c-goog

