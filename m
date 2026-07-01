Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44464DA520
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934364; cv=none; b=CMNtq9H7Tlj6r+dPnysgsDhbQPU+LmRZydA43Zq+BxaPlNtxnbtOE6JQ6tevLgFwP/YswKq1nevhWW3CEb7EsVTaWjKR/CIin4ZWokKQzQBgRPKdXMJOkuAvUIwnz6nGDkYGf6mJF4YEgPFkxBnhfnNAhCAyBSR0VoirAOtsJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934364; c=relaxed/simple;
	bh=vQr5rqbnVfhj/Q8IIvrfTuhOuv1ctDO8Y9v3PaUviPM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YyRHqZIJTxzwqx3QaniALhVVbnzVJhLB14+gVS67melL/jqz6C29N+how+ZUv3lh5cuhtqDuybk/C1oCXS7UdJsGpOFc3Qrdt771WGJgS0/J16BmTB7QPkFNIuSAoQNcxhoKJf9+/pj1CB+xiZFk1np2pqemxNZShJHe2ZUfvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKxHFVLv; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKxHFVLv"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so1071958b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934361; x=1783539161; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ReYT3wow7KWZM4WGFuJpCOGL6Ebh0IHq2felz3Yetls=;
        b=tKxHFVLvBAf/isu9l9+69hoZOUG7TkQ2bmVj/l+RvpHmp6ve2Hcj9cJo+yBqswrvx3
         dc93LYDHeZyu/gRq2XYgZrUpIV0U7n6/gsdtHR7ogeJBmani0AQJX42okSXFiRZZeqdO
         2DIL+yoXQdyg8bQHFZMxaCjvCp7kkyifzttnLCzSVe1eZ2xGHlJQOCDCYfWkDHcbG44N
         HPKA90wwR+HJLn1IqM572TfFbdkubK02Fu97XZ7mu/Lkz7lFRtaYo4Y5+ziro+P+8xf5
         uFum+KtwUE/t5neXPUDVp1Mw5z4uNQ5KU+8pMfK1putyvZ4/fE1oKhjkE2CnmqloYJoj
         wqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934361; x=1783539161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReYT3wow7KWZM4WGFuJpCOGL6Ebh0IHq2felz3Yetls=;
        b=GAKVnUWi1oS2Ll7DJjZiQ5URA4eKwxgxPt6d4vrVLJDB4Pn4aSCLXnT4zl1g9uxLn9
         tEvQMo+A6cGdpihIOagQFYlUeXnt7fTLyeRXK2DgOwpUnwLw2YURTXgcmPvA/913omne
         W+vl6XEFVfuc3Ay+vFKB+x23NzK0RFy8Sy8sGDHr3CX+BpQzBJizkSX52RNMjmJZtPxZ
         PDMITxvXR+Y+3d5gRoLlB0qmoxLQl51BfH/IyYELIXJOpd1kOmdiLa7myLmMm/pq+8Fv
         ARsca8Zu0VWv74EA09C47cJsaTwOQm4ybzbrxFRA9vS5iEMEczfWjrmecE9FA8GG6Lge
         DXtw==
X-Forwarded-Encrypted: i=1; AFNElJ/EeIyI/UIxWZHiFW42GJNVhbQQnNGLN7AdJUBDljjKfEWsrKcLcqSemh0Lw0d6bh0qa33BncXfI9yJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyH/B7ExpKPF2LBqqJlJdvsu6KXzPKK9G7Z9oaWzzmzQvrNRTwt
	s0bKMTgKvLb/z8rveqdTt3MxdnJxtDAR1uTyJf2mqUz1wxT77qzyBupSk5cKED6OYwZ4RLRkqmW
	zUm1Xlg==
X-Received: from pfwy27.prod.google.com ([2002:a05:6a00:1c9b:b0:842:8af7:db0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a6:b0:845:ccf1:49b6
 with SMTP id d2e1a72fcca58-847c51b72d4mr2049167b3a.45.1782934360386; Wed, 01
 Jul 2026 12:32:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:33 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-13-seanjc@google.com>
Subject: [PATCH v5 12/51] x86/acrn: Register TSC/CPU frequency callbacks iff
 frequency is actually in CPUID
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

Register ACRN's TSC/CPU frequency overrides if and only if the exact TSC
frequency is actually provided in CPUID.  This will allow marking the TSC
as reliable as appropriate, and avoids relying on the caller to handle
"failure".

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index ad8f2da8003b..dc71a6fdd461 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -19,6 +19,8 @@
 #include <asm/idtentry.h>
 #include <asm/irq_regs.h>
 
+static unsigned int acrn_tsc_khz_cpuid __initdata;
+
 static u32 __init acrn_detect(void)
 {
 	return acrn_cpuid_base();
@@ -26,13 +28,19 @@ static u32 __init acrn_detect(void)
 
 static unsigned int __init acrn_get_tsc_khz(void)
 {
-	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
+	return acrn_tsc_khz_cpuid;
 }
 
 static void __init acrn_init_platform(void)
 {
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
+
+	acrn_tsc_khz_cpuid = cpuid_eax(ACRN_CPUID_TIMING_INFO);
+	if (acrn_tsc_khz_cpuid) {
+		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
+		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
+	}
 }
 
 static bool acrn_x2apic_available(void)
@@ -80,6 +88,4 @@ const __initconst struct hypervisor_x86 x86_hyper_acrn = {
 	.type			= X86_HYPER_ACRN,
 	.init.init_platform     = acrn_init_platform,
 	.init.x2apic_available  = acrn_x2apic_available,
-	.init.get_tsc_khz	= acrn_get_tsc_khz,
-	.init.get_cpu_khz	= acrn_get_tsc_khz,
 };
-- 
2.55.0.rc0.799.gd6f94ed593-goog

