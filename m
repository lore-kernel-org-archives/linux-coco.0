Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA384F7985
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059441; cv=none; b=DZaoQkKdSCvNlLrsxnb4gruWTuAaY9/664LuPWz7/b2JxoOOM1jCEtqz5tNVk00LFKUkEsk7AMKUw2y1Jejyhzph166eV4zWB+XIMDjGCXrbQS00GkYAaXntWUKBntJuLs2izBM4g5NZd9xYxolzuxCLoASQ9Ead4wAF1V/hvNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059441; c=relaxed/simple;
	bh=K/EtG7hsgatUBHi5bWDjfRauVW7X2RN7VoYeeZHucVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qQBmB7A4ZoDV4lIE/0iOMS+x9aPyxwoXj2znWK7215QJOLM+9ZWUKHBJ87Uem0svnJe1a+/6XTBUDCeBMhjMA/n+GqjRcgIQx8hA62AAxsxLUI6USPd+EFVTL9qUPBE4e0l9nD2ZJVe6kL144lL7vF3x+Y6v/o96z5K33/RycVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iuhPTXp1; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iuhPTXp1"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so50913845ad.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059438; x=1786664238; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LM+bFo6oZyT6hMjeOJv5/5C5Sfvue9FfV0H+MNWzQd0=;
        b=iuhPTXp11FH8bhgCygErWvVegkGc1DyqqOgMdguS+aEKQV+bKTJZw/+3iknrPsgMn8
         RMs2cRFmBJCJcncLdovKCQZV1E0tZX69YXpaaYmu2+mCgTQriKnUcQACxXFc1C7DEbHv
         SnvVL/y+Fh3BsiEZm+aosIcRI3q1gSUBAOTnHOmCM36qXxCSbYCx8X1bnMA01JdqjBbD
         Sp8SrUBvgtnqeZniKh2N9UzGMDHJGxJ2FCShgRun/eItYBg/NmcIFzjOHVSflCIfAqsf
         CSKIHGNQT4FAlHbyezXG1e7PwGZsGjHWNye+wT3BlM46fomflqbVjInfb8TK2AnzJHU7
         x3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059438; x=1786664238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LM+bFo6oZyT6hMjeOJv5/5C5Sfvue9FfV0H+MNWzQd0=;
        b=jdK3w/ZN57Ics4UfTW1DkVRmbm2JigIO1fTBH3PY+yXyszZvdVhyD8/LcTRyB5z9Kg
         +EtQxy4iWxwKsq6HIqYrXljbGt2OaPMdUeZehql/xRlL6USXSWJ1+BZZmgWM0Pg2KWpI
         zZsqA9oKpPRQiRLPQN0Nau2VFaa50CLjSjOm+HDqzgx+01lOzPqUIquclTwO/GhozpS7
         b+FeG2oVWAuP8D2qStkpclfRuVObHoyw+9vth8lcaBwO1qWTvreq4Z53RyVPqKhfg8/I
         tCyQ8ZbhIGiiIQ/w3HaE/FfrSnNswSlKG4YKFa2M2eItwVa6rpNWx8lpcHRChsx1xGvr
         bBBg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf/ojgjRc3OrLSVii2vFOEL0Rx/O5ubel2+bbbIgvbqrI/9QYWv6V+nzcmTgqfGmuNPMI9uX83fRLb@lists.linux.dev
X-Gm-Message-State: AOJu0YyavhYwWx6yETMGzaWIFmFWNywokEGu+jEGHoTeiuSjSAEZjiba
	82p+VTWVmII64+jSU05ryVhWqVmVRa2u503leB3H9T+ftaz4wju/CpJTyWWwsh5Gz9n3rRGyrP2
	cn8Gq0A==
X-Received: from pjuf1.prod.google.com ([2002:a17:90a:ce01:b0:38e:aa86:7cac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5447:b0:380:83fc:4315
 with SMTP id 98e67ed59e1d1-3903c66b3bfmr20385633a91.21.1786059437671; Thu, 06
 Aug 2026 16:37:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:00 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-44-seanjc@google.com>
Subject: [PATCH v6 43/51] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 61d4d943fe74..41aff709b90a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -152,7 +152,17 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
-	kvm_register_clock("primary cpu clock, resume");
+	kvm_register_clock("primary cpu, sched_clock resume");
+}
+
+static void kvmclock_suspend(struct clocksource *cs)
+{
+	kvmclock_disable();
+}
+
+static void kvmclock_resume(struct clocksource *cs)
+{
+	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
@@ -223,6 +233,8 @@ static struct clocksource kvm_clock = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.id		= CSID_X86_KVM_CLK,
 	.enable		= kvm_cs_enable,
+	.suspend	= kvmclock_suspend,
+	.resume		= kvmclock_resume,
 };
 
 static void __init kvmclock_init_mem(void)
@@ -318,6 +330,15 @@ static __init void kvm_sched_clock_init(bool stable)
 				   kvm_save_sched_clock_state,
 				   kvm_restore_sched_clock_state);
 
+	/*
+	 * The BSP's clock is managed via dedicated sched_clock save/restore
+	 * hooks when kvmclock is used as sched_clock, as sched_clock needs to
+	 * be kept alive until the very end of suspend entry, and restored as
+	 * quickly as possible after resume.
+	 */
+	kvm_clock.suspend = NULL;
+	kvm_clock.resume = NULL;
+
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
 
-- 
2.55.0.679.g6767b8d81c-goog

