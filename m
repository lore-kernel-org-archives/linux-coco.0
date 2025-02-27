Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A55239595
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622803; cv=none; b=XC/vUu60nOBNyu7d7poFXFyxjZp0KRzn/J4bhtjEvZqtGK85g21vpNXH5UsssBXoMhBfoJtxLy2GFVAs6yAdBY5HLwQpUMf+jbBBq/CtL3Dahl7heB0th+pJL2mseMq3sBgydVaCcfMnC0BVk6PFHgsuZ03Kll0DhR9VZS3kJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622803; c=relaxed/simple;
	bh=QPB0hO3DgGDIpWXharYozGSl0kpmrn7uptJliWGGUbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q4AJTMHB1K5oZJMIxLV36+jpUFoYBeY0i3S62layMWWv73RW3rk1otJj4uajFdtNc2xSQ2jo4j1syEO2C0pouK2CvxZCE3E0vkPjV0YC8V4cM6IxGWQXNfcuJ7Q+qskrupzC+EvvRj2q4TdvuQXO7KVX5iDwdQyDffffxALIDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2m0AEe6z; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2m0AEe6z"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fe9527c041so1101365a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622800; x=1741227600; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SUWURP6DS00BmWQuQkka/ewYMygd0uN/XlEQWE3xarE=;
        b=2m0AEe6zxgK+mnzCrVdQcg/fr/dhi2PgmUn0j5kXARWHWwVPRldaDzBA3/LX9hE3G1
         ci+Nvp3ERXHm1d0eZI/lPMsXIyuOMyOBUbC8bQ5EN0tyhm3PxjaqHPFvpv4doEADLw1+
         mSgfvTMv2mPQpiyPQOtIOUI/fYERKIzKSaR0zw5BEr1SMZyQMme8ZI6mtckp5/vw9nkn
         Yl1nZv9HaYl+WOuT8ECUzR5eCrIZ3juKy8Z4e1xUFizvGmC29u+A4HbiNxhv6LQOZGtQ
         p48YpjOYNHh51y4V2ta9QWhNUE6ImLzZjz0u3lPp521cVh2hI0e81SBjBSjA4wSwhlqb
         MkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622800; x=1741227600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUWURP6DS00BmWQuQkka/ewYMygd0uN/XlEQWE3xarE=;
        b=e9tJAbbdccJVka8mwnAjtvJc1exaXSIX+EcgK/XYsqtZBqhmP8+UVpyQnLYx3L+p+h
         Rskay06X6ZLKQUWWqt/AoLTVuVv6V+B7ApxPsJgGefRKhY28D0gmx2bXfHcLTa+bsajU
         ZsXOvxNnvmh+IKfgtKKajrgpLittOVrFPi6YFiahbrWUcjhesTZlPqz0NmZ/Fy5jSBpM
         FkmTWP6uaqry0oAr2pAc3Wig7X3mIhjsVeUcBwBlbEL/a49t74WmpY2Twj+MtWkWfuy6
         /nXpYYpko57GFJ8EwHj9RmTYIUA+IA/GHjro5/clDnJxCEzHpUehkEq+zVHziR6hETQe
         LfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3+ZFbDJnjYZyLvAzbg0bzjIdSIsEvAsR4bAUuLbjyMvXBRKvEWF+xN2FuBxOtC5K7ukN3hI2Bmwo0@lists.linux.dev
X-Gm-Message-State: AOJu0YxDIlsjr9Pcy3wHxioGf/CGkT3e5pVM0ozzYl3FB3/KqhfO/F01
	ofAf3uWmhS2cti1jHdtuKstWWDxLNrSYLjFyERliJ9HJv/3cfDc5PJXcXikD/0oXhtpIu93W+sU
	n7w==
X-Google-Smtp-Source: AGHT+IEaJegSwuz7gp17gUBIq0YV/a5p90hmpWu2RxMMtE/LMlRmTHKg61dycPOdBb/l8JsfSEdKtOPrkAY=
X-Received: from pjboh8.prod.google.com ([2002:a17:90b:3a48:b0:2fc:2b96:2d4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fcf:b0:2f8:34df:5652
 with SMTP id 98e67ed59e1d1-2fce78beb41mr33366155a91.21.1740622800327; Wed, 26
 Feb 2025 18:20:00 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:49 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-34-seanjc@google.com>
Subject: [PATCH v2 33/38] x86/kvmclock: Mark TSC as reliable when it's
 constant and nonstop
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Mark the TSC as reliable if the hypervisor (KVM) has enumerated the TSC
as constant and nonstop, and the admin hasn't explicitly marked the TSC
as unstable.  Like most (all?) virtualization setups, any secondary
clocksource that's used as a watchdog is guaranteed to be less reliable
than a constant, nonstop TSC, as all clocksources the kernel uses as a
watchdog are all but guaranteed to be emulated when running as a KVM
guest.  I.e. any observed discrepancies between the TSC and watchdog will
be due to jitter in the watchdog.

This is especially true for KVM, as the watchdog clocksource is usually
emulated in host userspace, i.e. reading the clock incurs a roundtrip
cost of thousands of cycles.

Marking the TSC reliable addresses a flaw where the TSC will occasionally
be marked unstable if the host is under moderate/heavy load.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index ce676e735ced..b924b19e8f0f 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -362,6 +362,7 @@ static void __init kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(void)
 {
+	enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
 	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
@@ -400,18 +401,6 @@ void __init kvmclock_init(void)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
-
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
-					  TSC_FREQUENCY_KNOWN);
-
-	x86_platform.get_wallclock = kvm_get_wallclock;
-	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_SMP
-	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
-#endif
-	kvm_get_preset_lpj();
-
 	/*
 	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
 	 * with P/T states and does not stop in deep C-states.
@@ -422,8 +411,22 @@ void __init kvmclock_init(void)
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
+	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
+		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	}
+
+	kvm_sched_clock_init(stable);
+
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+					  tsc_properties);
+
+	x86_platform.get_wallclock = kvm_get_wallclock;
+	x86_platform.set_wallclock = kvm_set_wallclock;
+#ifdef CONFIG_SMP
+	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
+#endif
+	kvm_get_preset_lpj();
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.48.1.711.g2feabab25a-goog

