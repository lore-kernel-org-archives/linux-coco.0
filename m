Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5D4A8C9D
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059430; cv=none; b=BvMXXm26gXovEVnAuWZcSXyngMRN/Bm+XnuJLXynmP8WXeSI6Aj+mvYFLXmLlASJhbIkLDD7PGPg48V6+irIPeNucy3msRPD13YM+knIJPdgF30oHXDjFjhmF9TKfDmbJyCltS9dtmS395c3sBQb3Cg+3A7FCofe+pyJ7GfiKDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059430; c=relaxed/simple;
	bh=sbzLks0rCz/Y4FC4JU4m7+dMymRO89Rs74fjqXQ5fdM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m/HTKssyZAZwbjFSnrExOi6apFLbJwpK4NTJip3uNRNnNhrV1CD0b81YGqqdpPKoZoTaqdHQgS457yH/Z7lwMIogK53UaKvnp5a0G8zCvfhLPhZacJpWksJWnsnbNnO2uCJ8pMahYEjju/W+TbAuK3Rnq9eCFhjz6trvXV3mB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OZTMtvb9; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OZTMtvb9"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso4527405a91.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059428; x=1786664228; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQ8musMrPFB3W7GZXrEzufcFO/9G0XUPjz13+bRyF/M=;
        b=OZTMtvb9Amnluk+YAniV4gROWh2g07dD5BZioi8CRFJC7KeD/XqvnObIGhZDpywJjS
         R6pU1FVwihAytqpLlXvhdHIy8Y10gZSgxR2UdNIVsmCSVfivt9MwPUen5GZH4v0PzuCH
         imJF8VgqbhkLmsnA3F/LNgmsz6UsePbQmabJHVW7ty+e5SX9zMEMWB2Wih+dDQzrBAk4
         e0G5Vt3s4Esk2pU2G2JJqskmmhYpbQJqyH6Swl5l4HLCBan1jTFOsVTCkpKG0/UDr5XG
         FaxVeXDv6tfBp5pD9HA+GnvHIrlWlIAOr6j6OQBVDa174SXgpuAyQ0iJx95pntlMyVDG
         Kjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059428; x=1786664228;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQ8musMrPFB3W7GZXrEzufcFO/9G0XUPjz13+bRyF/M=;
        b=ebGxbw9TDcyaGX3cKP4ExJSIr1juRg1szYtR/q2c5XCWKD4z3Z+YjbpoOx8QviYd5o
         OmcKcMG7DbEbmQlLh4CjMGDGNYOnZhuZUA8ZeMDl8PIGK05CKD29eqGJBxuS7b1byRe6
         4IQC3UGgrcV47zdSSMl8OIIpJucM3FbCYfZYgU2QWq/VX5bu3DVvVzjwrUUTfESLF7Ry
         3I/4WxHqGJ8qlJs1cjCkmGWTQmG4ymqLeqVV4xkA15SYwoPqaYALr3cmzWU8vkkWxEIw
         evYl7CZa5O+QASi8J41uwCc6z2farjLqYX/QMp+fsLKDl1zL3xYlcPWe2Fv7zMEBRGZB
         LnDw==
X-Forwarded-Encrypted: i=1; AHgh+RqOABgVNqMiWquasmKzgZYpolKePSgVRLFPzKHc/6tYA/TGr0mZLE5+6xxJVMIIdWxbTeUpBnVIv8Jj@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc4LekLVeWH2xVYT08McJGYT1pOndnd4baN227mOjo5u5T06jB
	s+2x1p/yqFAYEDaFXZ6ZnoR1chYEeG/GgJxtmH143c1ab+kYWDdN9TKvYsfgBTJ2hDd+YKt4lEd
	CktwliQ==
X-Received: from pjpq20.prod.google.com ([2002:a17:90a:a014:b0:38e:befb:90c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264b:b0:38a:c3f:3b87
 with SMTP id 98e67ed59e1d1-3903c58a6femr19988163a91.12.1786059428057; Thu, 06
 Aug 2026 16:37:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:52 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-36-seanjc@google.com>
Subject: [PATCH v6 35/51] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 964f3d6c2c71..60fcc3020792 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -947,9 +947,17 @@ EXPORT_SYMBOL_FOR_MODULES(recalibrate_cpu_khz, "p4-clockmod,powernow-k7");
 
 static unsigned long long cyc2ns_suspend;
 
+static __always_inline bool tsc_is_save_restore_needed(void)
+{
+	if (WARN_ON_ONCE(!using_native_sched_clock()))
+		return false;
+
+	return static_branch_likely(&__use_tsc) || sched_clock_stable();
+}
+
 void tsc_save_sched_clock_state(void)
 {
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	cyc2ns_suspend = sched_clock();
@@ -969,7 +977,7 @@ void tsc_restore_sched_clock_state(void)
 	unsigned long flags;
 	int cpu;
 
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	local_irq_save(flags);
-- 
2.55.0.679.g6767b8d81c-goog

