Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B13D6CC2
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872886; cv=none; b=eFMn2qG0/N1Cx+LEUB56DFQsJKIuPGJXjdgBjuYw2HuvWjoM0B1tjHVzCwZGPSwMfEqt1/EULFFl7Bz07T6VVudglE5XJJXDnGosXu5ltyiQmnWgKShTBvXxvdIM1pe33zNjj18SVIn4b+qC1lUnBOEJk2q6UtT9ot6jtj1nFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872886; c=relaxed/simple;
	bh=iobt3mMcxUgFyEoOEmLnGtiXka6utk5+xSHE3bisqLw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RoiYNu60oYy99y+N+W9b2KIjw6IOL1hpVHM4uN4et4q4Aiwf/ZHC0fGTcPE1Kcq2iC1Iph92Bm2ZYwBRKvF0SYU2uqT8GAS2UnPoSxhzKwFLhNju3q31zbvPIMH+oglZbRnw1CseIdYFpQlbNNiRQQteybbEAlA9yOpOtttgpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jqXGO/rL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jqXGO/rL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so296409b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872882; x=1779477682; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ9Kqslov6eJXg3tHpdlTt5rxLZvQw1ej96frcIls5c=;
        b=jqXGO/rLEXAelv6C/IHxsZd1pefbHIXfpqQ15RDg2/nAy82ftzO9MfZ06noHZK35YU
         /GSbTesEjwllOwxHRqaeJYJUG07nMS1OJQdbVqatZUxo36jAIECgRYKi2e0L/Ai965r1
         z35/7D8KlIBh+j9gUzBp93sdD2RMBzImzNxirPgHqG4qjShjI+GhQc4lM4vMFk+CYG52
         1DUpApV5Lom3nNgON2gwsmRB4+Sv+TzXkywY49KsKAsAFzTFw56P/FPt/teiisdkmbUC
         YS2kNHLP64A+ftNku2k5DlhoqCDotHfM5RfrEWcmuHPTJjij6sI0ulzecGC8Dqp/sbIE
         NAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872882; x=1779477682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ9Kqslov6eJXg3tHpdlTt5rxLZvQw1ej96frcIls5c=;
        b=cSMXzlQv6wcuhNjxMhVfNNDAlqlANXObhggv9uWJSUry07zRfvQp6YTs/y+CYLqllu
         ArXy+v7akJltYawuOuwDEXvun6FSCYMViaOhOMnHvfJDWdCCC2Q0com2pgBB2iiMG0mP
         niqaAMTFcPEGhqHHfQgcGCUqvvCm5sixg5iLE+hS25EDvzxqOngZOwNpgjRES06zbAK3
         NKXC+vAjExdDLUScRc0fwZ8lmBQCnIgJ0lRDmMvUT6V1kZFovjYnvg/FSQ3Ab0OKW/Xg
         FLkY7AJSUZhtky/tKgrd66pA/ikBhJKl2A3SiDu3+aCrSm7G6/RZo2U1IFcZEfmtkJU6
         fwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G2W33wMtrsBLaTudASfCkejZrhTWK5YqsF+vZqQ2LCuYg1lhmA4p4ibR0XlE6FwNxbNe1Sa6ldEYL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8bdPBPuCna96+ES//Icgvx6KzXr7kcbGSldBjYXt4dIbSUfFO
	nrvYj9jLRNYe6aO2cZ0p64RCkLP9a3zBOOtAN1dKQ6ca1uUBCIe1vMUSo/DObIX0UQsIfKqGEHJ
	0PZaj5Q==
X-Received: from pfmm20.prod.google.com ([2002:a05:6a00:2494:b0:835:43a4:4aaa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d19:b0:82f:a89e:e16f
 with SMTP id d2e1a72fcca58-83f33b2f58fmr5940174b3a.14.1778872881979; Fri, 15
 May 2026 12:21:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:40 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-40-seanjc@google.com>
Subject: [PATCH v3 39/41] x86/paravirt: Move using_native_sched_clock() stub
 into timer.h
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Now that timer.h ended up with CONFIG_PARAVIRT #ifdeffery anyways, move the
PARAVIRT=n using_native_sched_clock() stub into timer.h as a "free"
optimization.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 5 +++--
 arch/x86/kernel/tsc.c        | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ab1271bd9c3b..d8cb9c84f2c7 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -11,9 +11,9 @@ extern void recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-extern bool using_native_sched_clock(void);
-
 #ifdef CONFIG_PARAVIRT
+extern bool using_native_sched_clock(void);
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void),
 				      void (*start_secondary));
@@ -27,6 +27,7 @@ static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 void paravirt_sched_clock_start_secondary(void);
 #else
 static inline void paravirt_sched_clock_start_secondary(void) { }
+static inline bool using_native_sched_clock(void) { return true; }
 #endif
 
 /*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index f78e86494dec..1b569954ae5e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -316,8 +316,6 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-
-bool using_native_sched_clock(void) { return true; }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.54.0.563.g4f69b47b94-goog

