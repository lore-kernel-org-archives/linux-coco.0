Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F53E075D
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872848; cv=none; b=DESWPRGJ8nVhj/HISXGltmB6/wtgSQ/1eLXLMflnbMjjWpvqsHzCfiEtsIM9sUS+CLtl74m2QtPWoiUZ6GzFmW7taoYyCZf9/zMUDnLduicBH/suVmldE0qJkknXSo44S83/MkqUakkZYjNDO5RYAKMNXvSLeeAty8nweNSzyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872848; c=relaxed/simple;
	bh=fjnHwbCJPRX9oMswM0r3TipsrON28nk7QcNfnWcx/yE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q+yiyaSJJdGGxVClmSIdUbgxvHiJTUknbRR9QpU4Vn7qe/dH2BF9g7Cr9nzA5ge1nCfhz0M21rOSz3TKvz1jGD95FcO5NPTvV9um+GgRwZrWvbvXhVv/QA3obb/Gyyj9dbU9j7RBj7oaH59ANjLW+jAaTmNjU67yjC0IXhcwxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vDFZXh9h; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vDFZXh9h"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82c935e048so773809a12.0
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872846; x=1779477646; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=My3crpwV3+2u8Tw2CWdR3qBXb15QrHmR5xjox9czyEU=;
        b=vDFZXh9hWEL8LjofNEN17OQGOgoMFK7F78ynGyJQv2XoCRa5zKK8kkYqwzNI5VwbW3
         6566eMA/118E+Wb4WxKLBTBZbMvcHsb1P5VTvltEeu1rpFjJ8NTP0ONShM12Hn4eWJpQ
         ebBcZiL7kY7RKIvvL+McNFbiaSn9iIVyveIcv8nN++2u0R086Lh1RpoDZPISLm7EIvnv
         g6kqHY/QohaVih+PK/Gdpd7M30ZXVzorv7jLQw5wxUxEDQw6h3UFALqg+Yrip7QgcB0o
         Hs9UDrwiQgwhJTiUmnolCPp1NObnr9oAH1ligqsQxstxMqLYV/I6fsLF5KA3oYF1FdVX
         1m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872846; x=1779477646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My3crpwV3+2u8Tw2CWdR3qBXb15QrHmR5xjox9czyEU=;
        b=X8N3R22nXeAajg96xRcBOzStwEkW+DddazRKlaxOFkmKdK0RujEbdyMAoKhCBwLwKl
         fu7BJ48GjcGiY95R7N23MLXDo90rxzyK90U0xBShihsCMGswOld5WhWRIDI4BeFtXeJv
         uwhNNwUMpdteCLrnGy0OrXfv2Hpq3ySXaUNPLpngl4rZJ2EKCoV7V5jiMKrwj0Fehtf7
         pjnNAlucpPhy63ZNAiXIUaO37qJn3lVmOxdIGwCAeEgu4VEZ4vBATLfLlomyAX9l+jdE
         dmwKLCWdtmWhBfwO2Orq5m8c+IynMaEVW9auPchFsehYBShDtekpCgp1M7QLwZXoRp8c
         7ndw==
X-Forwarded-Encrypted: i=1; AFNElJ9ClZkr09ojtkhbGD+QHf0HUe+fuzZ5xei4WYJAmSO1FNLxtHxNLSIZd8dquHgT22GveBw7mjFc8crf@lists.linux.dev
X-Gm-Message-State: AOJu0YxdIlhqeBuHY0Iz04Fu+GgsmKh5Rq4ukLowU+4kwqXmwxKkqPPK
	izjpIFpwI9augmAhg8O4aQYaKjzUs0MRpkhYmQ+BNJQQhg8BWJgxA79lEvtLYQgZ3up7/QnrgAu
	LPRlaow==
X-Received: from pgc15.prod.google.com ([2002:a05:6a02:2f8f:b0:c74:497:507e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5488:b0:368:7398:df8a
 with SMTP id 98e67ed59e1d1-369233192aamr8411686a91.4.1778872845655; Fri, 15
 May 2026 12:20:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:15 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-15-seanjc@google.com>
Subject: [PATCH v3 14/41] x86/kvmclock: Move sched_clock save/restore helpers
 up in kvmclock.c
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

Move kvmclock's sched_clock save/restore helper "up" so that they can
(eventually) be referenced by kvm_sched_clock_init().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 108 ++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 1cbdb48e5503..800c3d65f0af 100644
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
@@ -91,6 +110,30 @@ static noinstr u64 kvm_sched_clock_read(void)
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
@@ -103,6 +146,17 @@ static inline void kvm_sched_clock_init(bool stable)
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
@@ -162,60 +216,6 @@ static struct clocksource kvm_clock = {
 	.enable	= kvm_cs_enable,
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
2.54.0.563.g4f69b47b94-goog

