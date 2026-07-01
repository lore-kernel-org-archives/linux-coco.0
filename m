Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C166420E67
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934388; cv=none; b=JAQgExj0/dRS91UKIcizUrS2blYYDe+uyORftVfxc5VuWAl5nP5T1M3E0/+oW6fVVBJJmwMwX15RM+94pkn6r2NJSkuSagfl4seMDCh5Tobl5Nu5kW0JgJZpAgmyECwcJ/3/2/RAn+03QBT/XGLqufsPIYf8XJRvmL8JGOdG7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934388; c=relaxed/simple;
	bh=7YsySPptQ6kA1DOmr538pF/lRTH1eLru41S1skeiyMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NaqTZydsPuNRdQc24KMwq8tAjzqPU6WCbtPFPxkIH8oREpCnhCUi2gxhz8IW1lRz1+6a0y02GmGAVFjPtVqdps4QttBWggQKCZfi2h+dLA+CFhFWxZMuKr/0i0fYbe1ODt5HnQsgwoUE8Vuj00hknNXTlQYWQR6bW5J9BXiD5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n7sX/vWK; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n7sX/vWK"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c82843005eso13158185ad.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934386; x=1783539186; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E6ig/L0f6Bi8iYQ5fSK4jpuHUho56x4PQqpcZJJeUg4=;
        b=n7sX/vWKW+juyO3au2dAJ2PQm/7ThW21mpiPnauxX9QS/bCebymUzi9joZKSPqoF2c
         FSV/RKtuNZtGFFB9GUP0YDdBwQFoaV4/+d1Owu8pbu6CkVACd9Ptb+eLA/56xf0jvR3K
         L1sircOQE//FjvR3AHtpX8V/9/oD1qu0JEJcW+RbfPwT9a61OE/pzIXxGHVmNhSfSh9X
         wBwjxR51SuiZSso4CkBHCToVldk1eE49uM6QkQKz7odl8VlmJCoCpV6CksxyF6AFBSn7
         Y5Ln7RCjBrdXRQdd2ZacykzRTH3W0gDmCTZoa+bEOV7Immr8bwM8+IpETdD0vyJFHUve
         qSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934386; x=1783539186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6ig/L0f6Bi8iYQ5fSK4jpuHUho56x4PQqpcZJJeUg4=;
        b=EdGrPUypWbVt/32eG9JC0tg5YFMnc+oc79wDTNOSbfzoFalI7IBxsrY7lcuKuX3/Fb
         1I9EZF+fs3wTDpzM3fDtfx+DQTstGxOJY5AoHuFLJiLXUVxVvLYZNNDrUglLXnlOb4I3
         HI9QrXd2MsC2CXF+aojkUt12VknwMs73TRxDbh+kRJKwna8+keSPyKwIEOavDD0U5BwZ
         90ARXp3aV4NpqZUboWGXWrt1B3nRj8J0rc52DWvBIysMpF2CJiycb8f/si1iVjeWt/g+
         UWDYkz7u8vSp3WfiCOxHv07MhLn70Y43UNPhgHdzPLgsYLLRMpmsq6OFraCVhZDrCais
         JxaA==
X-Forwarded-Encrypted: i=1; AHgh+RpUk68uIVSi0QwoAzqbPW7/vtVBiIotXMNf+iNoS2kT2Bwb4f7K2ugxxLA/INk2BiPjJD7UYDCXdb6V@lists.linux.dev
X-Gm-Message-State: AOJu0YwyrTzX4+NCY27nx79VBMnWRVC+7bDVk4MuvzbhxaQ8Qzm7WIEN
	A8n91O9Ac62jBWzMqdTRqBjK7jkqCIjlxovskRNcmdLqsSYv9jmmNoRwA/6R/HdEui0A58f0SO9
	aG62z5g==
X-Received: from plbmt13.prod.google.com ([2002:a17:903:b0d:b0:2c6:b7bd:4804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1acb:b0:2c9:c54a:7915
 with SMTP id d9443c01a7336-2ca91140306mr23508775ad.14.1782934385462; Wed, 01
 Jul 2026 12:33:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:52 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-32-seanjc@google.com>
Subject: [PATCH v5 31/51] x86/paravirt: Move handling of unstable PV clocks
 into paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c   | 5 +----
 arch/x86/kernel/tsc.c        | 5 ++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index c71b466d6ace..fe41d40a9ae6 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,7 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 #endif
 
 /*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index a3ec298d56d7..4bc0495f1f9e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -115,10 +114,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 375b0279df66..a762cb5cec0f 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,11 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 #else
-- 
2.55.0.rc0.799.gd6f94ed593-goog

