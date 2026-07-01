Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A57841C8C7
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934389; cv=none; b=bw4l8LWrXVamWhHdVoXu1M+QOnh+FPkpoawtxjZrFmlzI1bjhC5z43chqxic67MJD7tt1AhQQ7y1Y89buiHRcrRB/j0q35uRoSTp8t/xzumb4KRKsdjgdnZ0s8KgfViuj+uIgZThyMac0CjanUs6muzp3QrrJB8mCgSKiTO1eKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934389; c=relaxed/simple;
	bh=5/4rpGq8pP4WFlnF7BCVmKa3cW2DZdTgtPTfQ+oV+pg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oW/WiXRYpggysmXu52FhblR2/91Glvj2wk1DK4GjtZaZny3nYBsOJxYGJEKztoG7FZ8gDR6SJkMCgpCyH7InNbtUtQTejS5FG+t4RHngoFb93936y3Oy86I01kB9sef0QfZOWk5NtL2R8osg3n/NwllYUJL6wtxv3A0/gnXLv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFD4BjFR; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFD4BjFR"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-380a0925d7bso1015419a91.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934387; x=1783539187; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=p58sqQbLovUVGNo0nSS6BNMoKcJfer5lPY7RvPBWYyU=;
        b=RFD4BjFR1lP2caTtkMeqaluh6N61RaYUMkWIY0Z9/32xCjYtj7JOpeVcfhi72iucDF
         VWy5vfJVgUHBuG7S/eDZpwCpeyzMPk1yf3Zc3gGCV48+dxFt6hGXZnUCufVAPx18BkYj
         t+X+E5POFfOFPrlvjAfQOfNAxNABRxwEr46PcWMmHwcHv+uD3Iyl96dawH54+PcsdYwp
         isezxbS+mlg7heVvJtn3WJjsjTQJPx6sgh+9RlDsNd5BCPdaRxikeggdG1x2yH160S9p
         wRCrf4clXEiqBSDbc4o27hLu6YO/XSt9NUbCDtSUm4lSMypxQn1m0FxUN4brPDEbvEkA
         x/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934387; x=1783539187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p58sqQbLovUVGNo0nSS6BNMoKcJfer5lPY7RvPBWYyU=;
        b=ojc9iajj+YkwYav3zTHhlyMqEATf+Eax8iQYks9x1aBjCphh35HZkJ2Wbk1ey0M7WP
         z92rIgTQ14He0Hen6xfWqEmpKuIhc/f1sjTv0EEi2rsRXdO6Z4XrkAWRafbQAMQaSikU
         8hTecbmQjv6rMe5Pcg8wpcJ0rOsjOUp6EPrt1k7nTg2XG8MjPyrmrX98b+i3TGC7Jwt+
         vM7uGPYSRs8qAp8sOy8BytWPtUoefLuBZg01pVKgpoaSDZfEFCNIqhr7E3CYQTht4kxG
         vOrlIK1OdMfa/F0xBodtgrznbqomHttUX2iWj96GaDKBestrao/bkoEx5drZfPQXFugq
         4FDA==
X-Forwarded-Encrypted: i=1; AHgh+RrAsvKKAjKPMc3+a2JBpH3w6Hnn23wg0xXAXFCz/Sj3OtYbcRAfXYOXOZuC0PsLLAV3L9cVQ/8UzCBs@lists.linux.dev
X-Gm-Message-State: AOJu0YysB5UL1R7Us5+tUR7++rSyib0KylX1GJfcoSZGJSYpTIeW3lKH
	B+ZWLOZ9pM4M/c+ERyr2MngMGlm2fNOO5XVw2N5LHRuPEz8DqCsoDjF+xEg50vbdX3p/dvE4Wfb
	YuJ7UlQ==
X-Received: from pjbco22.prod.google.com ([2002:a17:90a:fe96:b0:36b:7f07:6fcd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5823:b0:366:3517:1aa2
 with SMTP id 98e67ed59e1d1-380a9e519bdmr3237404a91.0.1782934386500; Wed, 01
 Jul 2026 12:33:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:53 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-33-seanjc@google.com>
Subject: [PATCH v5 32/51] x86/kvmclock: Move sched_clock save/restore helpers
 up in kvmclock.c
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

Move kvmclock's sched_clock save/restore helper "up" so that they can
(eventually) be referenced by kvm_sched_clock_init().

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 108 ++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 4bc0495f1f9e..07e875738c39 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -71,6 +71,25 @@ static int kvm_set_wallclock(const struct timespec64 *now)
 	return -ENODEV;
 }
 
+static void kvm_register_clock(char *txt)
+{
+	struct pvclock_vsyscall_time_info *src = this_cpu_hvclock();
+	u64 pa;
+
+	if (!src)
+		return;
+
+	pa = slow_virt_to_phys(&src->pvti) | 0x01ULL;
+	wrmsrq(msr_kvm_system_time, pa);
+	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
+}
+
+static void kvmclock_disable(void)
+{
+	if (msr_kvm_system_time)
+		native_write_msr(msr_kvm_system_time, 0);
+}
+
 static u64 kvm_clock_read(void)
 {
 	u64 ret;
@@ -112,6 +131,30 @@ static noinstr u64 kvm_sched_clock_read(void)
 	return pvclock_clocksource_read_nowd(this_cpu_pvti()) - kvm_sched_clock_offset;
 }
 
+static void kvm_save_sched_clock_state(void)
+{
+	/*
+	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
+	 * If the system is hibernating, then kvmclock will likely reside at a
+	 * different physical address when the system awakens, and host writes
+	 * to the old address prior to reconfiguring kvmclock would clobber
+	 * random memory.
+	 */
+	kvmclock_disable();
+}
+
+#ifdef CONFIG_SMP
+static void kvm_setup_secondary_clock(void)
+{
+	kvm_register_clock("secondary cpu clock");
+}
+#endif
+
+static void kvm_restore_sched_clock_state(void)
+{
+	kvm_register_clock("primary cpu clock, resume");
+}
+
 static inline void kvm_sched_clock_init(bool stable)
 {
 	kvm_sched_clock_offset = kvm_clock_read();
@@ -124,6 +167,17 @@ static inline void kvm_sched_clock_init(bool stable)
 		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
 }
 
+void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
+{
+	/*
+	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
+	 * being used for sched_clock, then it needs to be kept alive until the
+	 * last minute, and restored as quickly as possible after resume.
+	 */
+	if (action != KVM_GUEST_BSP_SUSPEND)
+		kvmclock_disable();
+}
+
 /*
  * If we don't do that, there is the possibility that the guest
  * will calibrate under heavy load - thus, getting a lower lpj -
@@ -183,60 +237,6 @@ static struct clocksource kvm_clock = {
 	.enable		= kvm_cs_enable,
 };
 
-static void kvm_register_clock(char *txt)
-{
-	struct pvclock_vsyscall_time_info *src = this_cpu_hvclock();
-	u64 pa;
-
-	if (!src)
-		return;
-
-	pa = slow_virt_to_phys(&src->pvti) | 0x01ULL;
-	wrmsrq(msr_kvm_system_time, pa);
-	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
-}
-
-static void kvmclock_disable(void)
-{
-	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0);
-}
-
-static void kvm_save_sched_clock_state(void)
-{
-	/*
-	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
-	 * If the system is hibernating, then kvmclock will likely reside at a
-	 * different physical address when the system awakens, and host writes
-	 * to the old address prior to reconfiguring kvmclock would clobber
-	 * random memory.
-	 */
-	kvmclock_disable();
-}
-
-static void kvm_restore_sched_clock_state(void)
-{
-	kvm_register_clock("primary cpu clock, resume");
-}
-
-void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
-{
-	/*
-	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
-	 * being used for sched_clock, then it needs to be kept alive until the
-	 * last minute, and restored as quickly as possible after resume.
-	 */
-	if (action != KVM_GUEST_BSP_SUSPEND)
-		kvmclock_disable();
-}
-
-#ifdef CONFIG_SMP
-static void kvm_setup_secondary_clock(void)
-{
-	kvm_register_clock("secondary cpu clock");
-}
-#endif
-
 static void __init kvmclock_init_mem(void)
 {
 	unsigned long ncpus;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

