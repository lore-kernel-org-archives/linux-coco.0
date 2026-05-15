Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6983E2776
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872854; cv=none; b=jnSfPz9ve60KjOLmsoyJkypZdQi2EtkbTaaKTfgls6rwj5LHlyClrOGXvnep6flIFo2URINmLY3TCl9+D6xhHYoK6PcXRFmVGhjeDrRh25uNCRUgc1rBlQBxDJe93rMxYwD2fL3pxgFkwjjpLbI2idjNT4Q2DcBCGH1mRLNxd3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872854; c=relaxed/simple;
	bh=MgerBvYEE19VEGmb0jwZ6MxNxLG6DRj12L8dn18zHeg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l9uWvKCkaxVRKVZuS2VakFP+3szL2bgPfPOruF+y5MhpsqRz/9bWSOHPv7mPFwhZMAC+dsuYbyDmbOptwJFlETphw27s0bHyVTJn+hQYcent5IGWcunV1lUHKPjH+lqrFtyWrh3SDIWBStUuVZaVTTeladToqcyb2xZg+vHOHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MqsAnxT0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MqsAnxT0"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-83565161a6eso37166b3a.1
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872852; x=1779477652; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pABxqq/LCN+Mp4/TOmuyDPyBXfPq+tAOVmlCcYLwmko=;
        b=MqsAnxT0v74LviCbgAqLWPefbYlMT561AD85cfJEBH8RUVXXJvlmf+vQcpgdQQaost
         SoMJWw/H8PJtrKIgDMmcZRg29gl92bsVpE7wamSR6W/skK3IeIdq/ikIn2tZaYGhOTMI
         IF3Zy3M3+arXVcv/mPHk7XUvFlOFKBQ5IvmFCPwDqE8iPz/oImFiKiUOvrh4hnK35/vV
         uLEZHJQE0GHsTEVpFWzGgLl5hX52iIqlu5XqCwAsOJQV955TyHs5SErHmg8TF3DFI615
         kgqRX+ejXydAJM5msbjOnTPOHpPDvdelsraQ/qBx1+lyE0yFwRNvjqGlj3uoNULK4LLR
         GgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872852; x=1779477652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pABxqq/LCN+Mp4/TOmuyDPyBXfPq+tAOVmlCcYLwmko=;
        b=ehnEV1la9D/EJxoY71bVD1z9JaakFNbz2qi+A9V/ASWp0QewNfChks39FzmbjUMizc
         g2XqCYGlG6+PeqzDOPN8ZJkQFZ5RkwX5z+GaInh9gdzlu0zOMkNGqZ+AkoSiFOIcgsx0
         J3ITKkizcicThsdcVf/+1x/89+im1P3fQBrzLUCJsqU2RkllHcwYY26LIHi104R5ZtxZ
         Gzy643zmFwbrQa2kWyPJt8GD7/pXrpNjt0JyVg+UBZuLN6e3KEiFd6tLt3hTWF76cdPn
         b+jsaGGapUMI+TF/Ap0qlAJWrTUdAIXA+NaLYCJWe8lSQm4Qzz+Ma3XnT9tWM1wmzGsm
         kvPg==
X-Forwarded-Encrypted: i=1; AFNElJ/SjibLMZ6Qd9TNeWjiqKnpAF5f+oSxGIUAGHorGpHsWLKKMu2+igkpD4DwaCuw6PSGs/UOvvgHf20z@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6ppic/HFEPP/oMnSDRCdVUCQTdA2umZRgCpjfXxgXY6+NJNzx
	JoMlce7CA93ll8JdWPn8ake9hn/JclggkD0QPyWNj2T6c3gKneNcEU5YBKTl2HaHIodW/Tl3t4e
	b7Sf02A==
X-Received: from pfblj16.prod.google.com ([2002:a05:6a00:71d0:b0:83f:22c:66ee])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:801b:b0:835:51fd:b7e9
 with SMTP id d2e1a72fcca58-83f18e75ed2mr8194934b3a.20.1778872851317; Fri, 15
 May 2026 12:20:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:20 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-20-seanjc@google.com>
Subject: [PATCH v3 19/41] x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
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

Move kvm_sched_clock_init() "down" so that it can reference the global
kvm_clock structure without needing a forward declaration.

Opportunistically mark the helper as "__init" instead of "inline" to make
its usage more obvious; modern compilers don't need a hint to inline a
single-use function, and an extra CALL+RET pair during boot is a complete
non-issue.  And, if the compiler ignores the hint and does NOT inline the
function, the resulting code may not get discarded after boot due lack of
an __init annotation.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 962b6fcb5c60..8df6adcd6cd8 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -134,20 +134,6 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-static inline void kvm_sched_clock_init(bool stable)
-{
-	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
-
-	pr_info("kvm-clock: using sched offset of %llu cycles",
-		kvm_sched_clock_offset);
-
-	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
-		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
-}
-
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 {
 	/*
@@ -304,6 +290,20 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
+static __init void kvm_sched_clock_init(bool stable)
+{
+	kvm_sched_clock_offset = kvm_clock_read();
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state,
+				   kvm_restore_sched_clock_state);
+
+	pr_info("kvm-clock: using sched offset of %llu cycles",
+		kvm_sched_clock_offset);
+
+	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
+		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
+}
+
 void __init kvmclock_init(void)
 {
 	u8 flags;
-- 
2.54.0.563.g4f69b47b94-goog

