Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FB4ACCE3
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059444; cv=none; b=Kbocewt4krGRoNld7IYKc6ge9MjAHVVOMQv2cD30vX5GvgZ+nH0SCI3x/LHFV3P19D5ZZU6zisL0m+7R2Q7otIv8fq+J/AOLdK+je9xBO3EAdZvif0QFMRaZDReyj+UocOr15khbxQioSS2d9l+dVjK8Zp7GnzXD5S4wkQm6AF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059444; c=relaxed/simple;
	bh=wE5Lnirgd+SKewLj9G18nlZgvflnuTi/pbn67D/XsGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UP/XbZPlF0quemnkBHShb6Di2s9m8izRUVJCow5p9R9xAd2rhJIkIKGC4BIZCEUjNymuOgn6/C2wrO5B3V3PouRChudUTX4tvASzSw444RRxxg1xV/4uMdJIhz3IT4vcLhOwD4Dfz/4rgONp5HvV6BCV4gRaSFipz8grmKl90/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQE/WZiw; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQE/WZiw"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so3501844a91.0
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059441; x=1786664241; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+in/CASVMXdQrSwySi/14FWqsmLN6M2d30MjdmJLYfo=;
        b=sQE/WZiwRuUdR6DJ8fT9tnoEEsUsYu6LSy9g/7Kw7x5Ll0LsJMDvFkszCVxzhQpRBw
         RwcdNbzcJCT3b3e3OkrHH1ujosdaG3hVCZWuPeiVaBMkAl8rJxHmTI2ozjGFyhh0G1NH
         0jGeEMnK+dESk3+LlodSApnL22dyQz6pKXy7uyOqpM8kAr6zG2VY8IfgvKaNqqevGQ52
         HIuNCY4e0osSOJiNIJrmHtcZN9edV4Xc86yoGeaQu9ySMbAkJ1HI58gXqdFWDq+YqgaW
         xckI+05I2+YQFqHDav7NdUh7U5oxYVBhRlengs64kFypsUwMivOiaxRXDqA8WLW87c7S
         C3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059441; x=1786664241;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+in/CASVMXdQrSwySi/14FWqsmLN6M2d30MjdmJLYfo=;
        b=pM0B6dkmm+giwzrPkE77eFg8AoGxHon3cib5gJAs/RSX6V/B3g/Nn/7+3iiGQGAmaL
         a5rzxfHWf/tMi9/1nwTnD2ggM1rkWHtmXJ2QIKckuZsMZI0fu2l4hS9F89Olt0kjNjaa
         L0Cg07CL+XXV5EhYAto4YgpYpz75vEDi100zozqaqLBnzKo2U2jbM1xNRrhGHGOkNE2N
         TR/ro1B2i8Y7H/Fw19vJZ/OD0SOIykk/obt515xyUMdAc9g7+QcSYrN+YCHIgtM5149T
         XOwH4cTiy40hu3RtrxETFwiydYR9IjIBmKqbzBoDEQb3WgPTSPZSpy/1vuOiVcSpdJQp
         vnAg==
X-Forwarded-Encrypted: i=1; AHgh+Roi8+IIUT5dL/PBF0/UEnhfJdHyl/Yzy2XCKGV4qD9VOUUJW2pRM+HzNeNNVFRUZNHuXP6ky1wXUCfi@lists.linux.dev
X-Gm-Message-State: AOJu0YwtqnKRD3vF/uVlkq8TKYhutslGiEC91wuB9YpLD/7iqfAncDQf
	Ojr39iAKk3HiYt0+MdMQao7LM6kKtZv7+oAV3PHfhh1r+ELYMYZIoFTSX7LflhTMvprGrcjxRlo
	ebTgd/Q==
X-Received: from pgii4.prod.google.com ([2002:a63:2204:0:b0:c8d:62a8:ee35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7a9c:b0:3bf:983d:e9b4
 with SMTP id adf61e73a8af0-3cb8603af0dmr21846910637.33.1786059441366; Thu, 06
 Aug 2026 16:37:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:03 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-47-seanjc@google.com>
Subject: [PATCH v6 46/51] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
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

Add a return code to __paravirt_set_sched_clock() so that the kernel can
reject attempts to use a PV sched_clock without breaking the caller.  E.g.
when running as a CoCo VM with a secure TSC, using a PV clock is generally
undesirable.

Note, kvmclock is the only PV clock that does anything "extra" beyond
simply registering itself as sched_clock, i.e. is the only caller that
needs to check the new return value.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 +++---
 arch/x86/kernel/kvmclock.c   | 9 ++++++---
 arch/x86/kernel/tsc.c        | 5 +++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index 96ae7feac47c..ca5c95d48c03 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,14 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void));
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 2cc3dd2ba355..22e8855fcd4d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -332,10 +332,13 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 static __init void kvm_sched_clock_init(bool stable)
 {
+	/* Ensure the offset is configured before making kvmclock visible! */
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
+
+	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				       kvm_save_sched_clock_state,
+				       kvm_restore_sched_clock_state))
+		return;
 
 	/*
 	 * The BSP's clock is managed via dedicated sched_clock save/restore
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 363145c83919..fcf331ffd874 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void))
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
@@ -289,6 +289,7 @@ void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+	return 0;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-- 
2.55.0.679.g6767b8d81c-goog

