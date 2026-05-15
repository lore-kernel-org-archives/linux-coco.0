Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CAE40C7A0
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872866; cv=none; b=FW5/eigdripi4j54o1M87Jr2QPchL4fmaThbLfIMJCbH94n7dxiXofsn3FEf39o+dBenn4EZm+eRwYaS6uHRNyPju6ZZAQjF40dS4a6JD8An7Kgi68s9Nm8Ox7kjT/JhtCBTC5RAx2qqnfriyQxalmWwEXRjjR8yqNqSMvXKGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872866; c=relaxed/simple;
	bh=njyJbcCwcXeXO9YjbcQGwk3m3d5+4iPknlalgaFw/CU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LJmqfGu1i5110SD8Fvs0FVGJNblFxtitXwgVJNoWyejFl9Rtj55yoiV6JbNZ5pA73h0bHiUA7FV+vjrz3FEmPWNRZAL2oUw1v11uCM3d8TMsuFFvZlExkUSNa5wWM1JKqdw9V9VsnIWnLhw8UeHbqXgREXVFtu8a3hSAZGQkwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AEC3WCL1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AEC3WCL1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so93830a91.0
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872864; x=1779477664; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5QvrpVnh0KMuRz6LXU92QW6Er6134KolvOCNQ9nQk3A=;
        b=AEC3WCL1qdJ1MccWE70WBSEkFqwje5KnoyV9PesCAPYLq/wm2jVzOqNQeA999GtAOR
         zwNT2H51dGRQCUQzCXsuBQn9PflMDEUga+BS0YksSyvSaVL2XCEIap27P0+6Rrj3mm6L
         dEaFT8cVC9S8AMLIH9U1oywWErs8hpVWk6Wd+y7HYY3pHOTpGP7X6yFBfOKbc+jwh/yD
         i+qrRk+l8F2POl3Tm2ki04++s8mVs1RFrbif3hbE6yNQPvyL+n/Y2ncMgPqIoWF6cgDv
         PGEqbhosoRJ7sgZSyp1kWp1WfydioTeaypxtK7Ig9fXygjL2WdKk5NXJjaQqKDfvltC5
         wyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872864; x=1779477664;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QvrpVnh0KMuRz6LXU92QW6Er6134KolvOCNQ9nQk3A=;
        b=mRVgOD+9EZ98H24QAIOPglT8sr5QblODCIOlGcZOJxXxHDa/6cEUSGleN7NmNon645
         yzahzJyRO54Ev+B+0I305S4+Rp3xjXW+ELJxV6DncGnYVuer0IQ2bmZD4fA9b1kwkjWc
         FL/nxHpWgZFTGV2vS9b9gMUg+MP4JVb/wNP0D4He6JWDL/Nv4am4LGILSvHoNwbupjLK
         HSRU1Ujf9FRZmdgmCCCXb/GLYr80VJKwCZvEL+ymHqyLQLaIP2uNuKHaNRMX6n+ieJOq
         FaiSluw+UixvxtYBWVFjaa+DAcIrTM3AAwAkZ7JLK4EfAGADKw6ase/wSGuXoSHpFNlO
         J5NQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yHv4GaLW5T5El07ndlnKr//PsGAalzjP+xEaa/Do4JFi/UDtXHFaIuSdm0oaH1F/MgGCZYqke50Gr@lists.linux.dev
X-Gm-Message-State: AOJu0YwYXUUOGu6Kg5ZYsJnV8OAv86JGLuSQ55v+rmyKbkxcCNwGtD4x
	x/ZII1az2owg/KpvJ1eKb8QDeD2oPqsStEJW06ucIJ273QQXbbsw7weWd8g50pAg9WWMdSpui1V
	alYCVhg==
X-Received: from plbl12.prod.google.com ([2002:a17:902:eb0c:b0:2b0:aef9:a5a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d84:b0:368:433:b697
 with SMTP id 98e67ed59e1d1-36951ca51ecmr5533993a91.19.1778872863652; Fri, 15
 May 2026 12:21:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:27 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-27-seanjc@google.com>
Subject: [PATCH v3 26/41] x86/kvmclock: WARN if wall clock is read while
 kvmclock is suspended
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

WARN if kvmclock is still suspended when its wallclock is read, i.e. when
the kernel reads its persistent clock.  The wallclock subtly depends on
the BSP's kvmclock being enabled, and returns garbage if kvmclock is
disabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 655037949446..e7250d21c672 100644
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
@@ -119,6 +122,7 @@ static void kvm_save_sched_clock_state(void)
 	 * to the old address prior to reconfiguring kvmclock would clobber
 	 * random memory.
 	 */
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
@@ -131,16 +135,19 @@ static void kvm_setup_secondary_clock(void)
 
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
2.54.0.563.g4f69b47b94-goog

