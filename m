Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAAE4A57F9
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059421; cv=none; b=aDLkN5+ViV4q8GYMZt+GQcIsIFQDXwuMVsoz6px4F3JlfqYsC4IIsXRCZZUtRY3eNXE5cFTHCjBpitZkaY+xPwTS9SSPbPelMcW2ostDi1QukVIvfVKvxcVO1jHjlNRz+NOkQ5Frf7vJJctkHZKsNF7IRmabv0AlysoHPlVp9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059421; c=relaxed/simple;
	bh=ZukvIBi+c+C/EBZ813NQs+KodZX1Q5CgQXvRxFbx3mY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sRnIsVNvvf1cCTHE1I5Mzfr0ylH/hz/tzkwBPO+c2hnLfmUKTBTqWNNRe12fZFJkFqNIy9xj6HTq+7wcgaFS/RvM7zMu17h1D6a9hMZWONepONBn+KUJweOylEcip9JEeXuMqkcXc23o/ZmmmWDpbQI9jL6uWxU9wkIQ2z4wejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L18d94Iz; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L18d94Iz"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2958504a12.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059419; x=1786664219; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IDybt2K9QzXIIF0RtAPpPcNbJv3nyQQRnp+0cGRBepM=;
        b=L18d94IzdiBK+WyV/T2FNY3m56hesBXEF+5MwrKgQsigoBxPZX0YANB12W4cD7wrTn
         TA9SjfQhcc8/JoS4mzVsB/W8g1dWjpRhUDGpV6CWcbw9M+Mh1J7t8gZwcoOA68BiDENH
         /6WpxB67HZlWOMjdGqEimQFD9pOzni3Wym9p+jEGRgH70xn7sCK06zsrcQOhe/mzM7VM
         ooLtaU8FPWF4neqKYycS5GfuALFyAqtoAiOt7lk4k+0QSqBvrvYVC0Mv0fYmdkiy+xjF
         5HJSJIontgmb9uJRwVUXphTkQ5dVTsj7kL7Znd5pJ54d3dscFC7ShuxGROnKoWAdgnUu
         K7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059419; x=1786664219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDybt2K9QzXIIF0RtAPpPcNbJv3nyQQRnp+0cGRBepM=;
        b=OEJVAzJ40nCnnN9zsEiX1xr4imVSBAFjuZmMJxTFDfbZavJ5b0pLtFnwCluN/nJlgi
         UwhQ0GOuoA3jwKwhmTcuBlSK51AXyFpg17pP1UOeG6a6XZdQPHqiyKnsWPNYfwBhB8Ni
         LzTTnkvUMmcjck8bk0lml1fY8yxLixDKULgM01/VsK+XQD41r9uIvGZgVs9CJwiPrZco
         8Pu7p3wYlrU31SUohBgmVJJOljqOJHUrtALxEwSdDLa1VbGeNBbSigSHxmm+J1EBYkTp
         LVueUSfricf372qsn4IRSTdpBAyoMNAhXBq9LpdQlh+XVM/6JZEr/2YlB+LEPvgPU0Ge
         0YtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEeDsXeyMMS3IU8dZue5dB3xI5z2ujp483sLhUubX6bXz1yc+nKhZAZmmTT5vva969FsqvAUQeXT69@lists.linux.dev
X-Gm-Message-State: AOJu0Yxok59qkJNd1S7+Gi4YeyZSQfdDcIkr8yEB6z3lwA4Xg2o/CCvu
	lMme4soz82gNQX0DOdCuejLAS7/CQPLks8DFd3WIL1GZ75T/kOvnigV8aSLu7nP1B+5UHbNRfCD
	HAnwBZw==
X-Received: from pgbcp2.prod.google.com ([2002:a05:6a02:4002:b0:c8b:fa4f:f001])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4314:b0:3c3:89ce:b5bc
 with SMTP id adf61e73a8af0-3cb85e28fd0mr22042606637.15.1786059418706; Thu, 06
 Aug 2026 16:36:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:45 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-29-seanjc@google.com>
Subject: [PATCH v6 28/51] x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
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

Gate kvmclock's secondary CPU code on CONFIG_SMP, not CONFIG_X86_LOCAL_APIC.
Originally, kvmclock piggybacked PV APIC ops to setup secondary CPUs.
When that wart was fixed by commit df156f90a0f9 ("x86: Introduce
x86_cpuinit.early_percpu_clock_init hook"), the dependency on a local APIC
got carried forward unnecessarily.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 2e7ab54cb9dc..b0c871ba8232 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -208,7 +208,7 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
 	kvm_register_clock("secondary cpu clock");
@@ -348,7 +348,7 @@ void __init kvmclock_init(bool prefer_tsc)
 		x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-- 
2.55.0.679.g6767b8d81c-goog

