Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C04AC28C
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059442; cv=none; b=ZjbM71jlU8zNzfkK0496RazVdeKf8PVp1zDT6dCn4BrErt1TAQEgmxQqiWLywqgqB0woPM7dWGV/8vcPdxUjdkdv/kDO47pML1MZOZtR4YA8eplu15B13BNoLq/gPFu1UN3Q1mh8wbsk/r3yKX1dharZQ+xQ+kKg5e+AB9apciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059442; c=relaxed/simple;
	bh=dgm+zs36iagZrNsiEaG5tDm77qWr4GhnmJ9+Xj3CxnQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gLWnLfV5o2o4WpDyLm+tzMdvwmpoj/A2R109uSdiWkhmnMk3wbu9S7DCDS1S4V8G9uQhfy0kCVgUuxwDm5WoDIE7igJUKCdXLlWsVQwc6QZz7dhm7Byi0UWYNPBOg8GoN8dF1dz5s8kzgSyugdFXtbhRdpHxCdkvFpcd1Gsgbq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Drkv/N8G; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Drkv/N8G"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb733fc5024so3799607a12.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059439; x=1786664239; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wCYK2twR3W1N/eNELl9D0JNBeD1Zbsv+o0OdDwvKek=;
        b=Drkv/N8GwGPGRF5N5DfFKq2hTC2Gfen+0+scs3+Rm14iqgLD91Rxp3yeWkaau9VNpn
         OW2tJjqyWZ+T5w6M3zU7QDOiad6y1+NMvUiE9m7ymnB3mIlCzfTs6ksLq0lGkpLVFggK
         53F82ch9wrY0ctNwEyXhBz3nkU2oZIVzWzUakEaSlRR/W719QZHpSOpHvLEmI11NxXqr
         jAqfFF7ZRXyeK+j3AoWJ9tqGZMD9QGyUKGFTwqohJFQmc83D6TH8h2AvxDXRh/cmKkcD
         aF1sfbct43+10hVABpWiJ3KbeqWjaIDwpJ5QzFeoe5HO+Vxu1/cR5vHtZHOEnZhgNS1q
         VYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059439; x=1786664239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wCYK2twR3W1N/eNELl9D0JNBeD1Zbsv+o0OdDwvKek=;
        b=Pc0Sgrf/JQSirBWjXV1FqK0GaSL7+z677nxYpyLSNz5eo/UeBKA8mtCCNkc/dR+qHb
         vv5IHaxYrwREZfG1D4IZal9A8QNLHJl0bA0dw3+NW5lt5otp3W2Om1+6nE5Ocs0v+coz
         xTY+NY3GHZ1GzKvlDeZzKqxO61hg7TY3loskcawjFFGL2su4EsNXDupyMl/qMaWrXlgt
         8O0Wt2CQgImz2OCFZ9sdMPkUklyTSqI06JgYJbWZP3xuPTzuSghllwoXRUh98MWlWLPY
         RnZMkjSgZdp1rQ6RPCVZ2Y0UDosXt+AcTb9e1bMr+p2wt8Y1rDrwWsUlVJzPeBUHztyf
         3uFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGww45nH1t0VVCWXoQqEyyniZ6DATL/Yi8WBer1B+PX9G5ak9b5f+2Q6YdA/F++A7pYgi3npliCej6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3lBdufEiLxWqEF6/+uO/AWtEXz1N23c7wzqOwth380v1mSvTR
	Bnvpq75lKlJ5nIXD+hVDRT5rS6Qb+MudXM0FoftYKfbvsvuvyMCqgELQyLJZw591la6BzFq+yLn
	6cUfECw==
X-Received: from pfn34.prod.google.com ([2002:a05:6a00:a222:b0:84a:31b0:7544])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d4b:b0:84e:89a:b8f7
 with SMTP id d2e1a72fcca58-84f2dff69eemr17547973b3a.11.1786059438943; Thu, 06
 Aug 2026 16:37:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:01 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-45-seanjc@google.com>
Subject: [PATCH v6 44/51] x86/kvmclock: WARN if wall clock is read while
 kvmclock is suspended
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

WARN if kvmclock is still suspended when its wallclock is read, i.e. when
the kernel reads its persistent clock.  The wallclock subtly depends on
the BSP's kvmclock being enabled, and returns garbage if kvmclock is
disabled.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 41aff709b90a..2cc3dd2ba355 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -53,6 +53,8 @@ static struct pvclock_vsyscall_time_info *hvclock_mem;
 DEFINE_PER_CPU(struct pvclock_vsyscall_time_info *, hv_clock_per_cpu);
 EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
 
+static bool kvmclock_suspended;
+
 /*
  * The wallclock is the time of day when we booted. Since then, some time may
  * have elapsed since the hypervisor wrote the data. So we try to account for
@@ -60,6 +62,7 @@ EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
  */
 static void kvm_get_wallclock(struct timespec64 *now)
 {
+	WARN_ON_ONCE(kvmclock_suspended);
 	wrmsrq(msr_kvm_wall_clock, slow_virt_to_phys(&wall_clock));
 	preempt_disable();
 	pvclock_read_wallclock(&wall_clock, this_cpu_pvti(), now);
@@ -140,6 +143,7 @@ static void kvm_save_sched_clock_state(void)
 	 * to the old address prior to reconfiguring kvmclock would clobber
 	 * random memory.
 	 */
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
@@ -152,16 +156,19 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, sched_clock resume");
 }
 
 static void kvmclock_suspend(struct clocksource *cs)
 {
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
 static void kvmclock_resume(struct clocksource *cs)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, clocksource resume");
 }
 
-- 
2.55.0.679.g6767b8d81c-goog

